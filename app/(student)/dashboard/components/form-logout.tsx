"use client"

import { LogoutAction } from '@/app/(auth)/login/lib/action'
import { ActionResult } from '@/app/types'
import { Button } from '@/components/ui/button'
import { DropdownMenuItem } from '@/components/ui/dropdown-menu'
import { IconLogout } from '@tabler/icons-react'
import React, { useActionState } from 'react'

const initialState: ActionResult = {
    error: '',
}

export default function FormLogout() {
    const [state, formAction, pending] = useActionState(LogoutAction, initialState);
  return (
    <DropdownMenuItem>
        <form action={formAction}>
        <Button variant={'link'} className="w-full justify-start paddnull">
        <IconLogout />
        Log out
        </Button>
        </form>
    </DropdownMenuItem>
  )
}
