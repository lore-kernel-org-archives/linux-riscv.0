From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 5 Jul 2018 08:44:17 -0700
Subject: [PATCH] RISC-V: Use KBUILD_CFLAGS instead of KCFLAGS when
 building the vDSO
In-Reply-To: <20180704211056.1885-1-palmer@sifive.com>
References: <20180704211056.1885-1-palmer@sifive.com>
Message-ID: <20180705154417.GB31766@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jul 04, 2018 at 02:10:56PM -0700, Palmer Dabbelt wrote:
> If you use a 64-bit compiler to build a 32-bit kernel then you'll get an
> error when building the vDSO due to a library mismatch.  The happens
> because the relevant "-march" argument isn't supplied to the GCC run
> that generates one of the vDSO intermediate files.
> 
> I'm not actually sure what the right thing to do here is as I'm not
> particularly familiar with the kernel build system.  I poked the
> documentation and it appears that KCFLAGS is the correct thing to do
> (it's suggested that should be used when building modules), but we set
> KBUILD_CFLAGS in arch/riscv/Makefile.
> 
> This does at least fix the build error.

Looks good to me for now.  In the future we might want to use different
ABIs in the kernel and in userspace, at which point we'd need yet
another cflags variable.

Reviewed-by: Christoph Hellwig <hch@lst.de>
