import React from 'react'
import { DataTable } from './components/data-table'
import { columns } from './components/columns'

export default function BlokPage() {
  return (
    <div>
      <DataTable columns={columns} data={[]} />
    </div>
  )
}
