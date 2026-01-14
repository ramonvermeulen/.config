#!/usr/bin/env zsh

export NOTE_VAULT="${HOME}/second-brain"
export NOTE_DAILIES="${NOTE_VAULT}/06-dailies"
export NOTE_INBOX="${NOTE_VAULT}/01-inbox"
export NOTE_EDITOR="${EDITOR:-vim}"

d() {
    local monday
    if [[ $(date +%u) -eq 1 ]]; then
        monday=$(date -I)
    else
        monday=$(date -v -mon +%Y-%m-%d)
    fi
    
    local year_week="$(date +%Y-W%W)"
    local file="${NOTE_DAILIES}/${year_week}.md"
    
    mkdir -p "${NOTE_DAILIES}"
    
    if [[ ! -f "${file}" ]]; then
        local last_file=$(ls "${NOTE_DAILIES}"/*.md 2>/dev/null | tail -1)
        
        if [[ -f "${last_file}" ]]; then
            grep -v '\[x\]' "${last_file}" | sed "s/\[ \]/\[ \]/g" > "${file}"
            sed -i "1s/.*/# Week ${year_week} (${monday})/" "${file}"
        else
            cat > "${file}" << EOF
# ${monday} - Week (${year_week})

## TODOs

### Work

[ ]

### Personal

[ ]

## Additional Notes
EOF
        fi
    fi
    
    nvim -c "lua require('snacks.zen').zen()" "${file}"
}

# ------------------------------------------------------------
# nn - New note in inbox (super simple)
# ------------------------------------------------------------
nn() {
    mkdir -p "${NOTE_INBOX}"
    
    local name
    if [[ $# -gt 0 ]]; then
        name="${1// /-}"
    else
        name="note-$(date +%Y%m%d-%H%M)"
    fi
    
    local file="${NOTE_INBOX}/${name}.md"
    
    touch "${file}"
    echo "# ${name}" > "${file}"
    
    nvim -c "lua require('snacks.zen').zen()" "${file}"
} 
