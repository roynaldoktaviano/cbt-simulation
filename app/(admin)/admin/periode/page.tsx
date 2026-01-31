import React from 'react'
import AdminPage from '../page'
import { DataTableUjian } from '../component/data-table'
import { columnsPeriode } from './components/columns'

export default function PeriodePage() {
  return (
    <AdminPage>
        <div>
            <p className='mb-5'>Periode</p>
            <DataTableUjian columns={columnsPeriode} data={[]} />
        </div>
    </AdminPage>
  )
}
