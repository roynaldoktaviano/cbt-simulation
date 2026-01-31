import React from 'react'
import AdminPage from '../page'

import Link from "next/link"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"

import { columnsUjian } from './components/columns'
import { DataTableUjian } from '../component/data-table'

export default function AdminUjianPage() {
  return (
    <AdminPage>
      <div>
        <p className='mb-5'>Admin Ujian Page</p>
        <DataTableUjian columns={columnsUjian} data={[]} />
      </div>
    </AdminPage>
  )
}
