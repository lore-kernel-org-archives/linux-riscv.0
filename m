From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 14 Aug 2018 06:35:36 -0700
Subject: [PATCH v3 1/2] RISC-V: Define sys_riscv_flush_icache when SMP=n
In-Reply-To: <mhng-341b5b76-2cd6-41e3-859a-6b1d926ba770@palmer-si-x1c4>
References: <20180810083804.GA20415@infradead.org>
 <mhng-341b5b76-2cd6-41e3-859a-6b1d926ba770@palmer-si-x1c4>
Message-ID: <20180814133536.GB28080@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Aug 10, 2018 at 11:27:37AM -0700, Palmer Dabbelt wrote:
> I'm not sure.  We can implement the syscall fine in !SMP, it's just that the
> vDSO is expected to always eat these calls because in non-SMP mode you can
> do a global fence.i by just doing a local fence.i (there's only one hart).
> 
> The original rationale behind not having the syscall in non-SMP mode was to
> limit the user ABI, but on looking again that seems like it's just a bit of
> extra complexity that doesn't help anything.  It's already been demonstrated
> that nothing is checking the error because it's been silently slipping past
> userspace for six months, so the extra complexity seems like it'll just
> cause someone else to have to chase the bug in the future.
> 
> But I'm really OK either way.  Is there a precedent for what to do here?

I don't know of any.
