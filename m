From: alankao@andestech.com (Alan Kao)
Date: Thu, 9 Aug 2018 14:43:36 +0800
Subject: [PATCH v5 5/5] Auto-detect whether a FPU exists
In-Reply-To: <20180809063124.GA26062@infradead.org>
References: <1533796003-680-1-git-send-email-alankao@andestech.com>
 <1533796003-680-6-git-send-email-alankao@andestech.com>
 <20180809063124.GA26062@infradead.org>
Message-ID: <20180809064336.GA18746@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 08, 2018 at 11:31:24PM -0700, Christoph Hellwig wrote:
> >  extern unsigned long elf_hwcap;
> > +extern bool has_fpu;
> >  #endif
> 
> Doesn't this conflict with the !CONFIG_CPU stub in switch_to.h?

switch_to.h did include asm/hwcap.h, but the !CONFIG_FPU stub

+#define has_fpu false

always shows later than

+extern bool has fpu

so actually no warning during compilation.
> 
> It seems like we should only have this definition in one place to start
> with.

It does look a little bit weird.  Should I send a v6 for this?
> 
> Otherwise this looks fine to me:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Thanks for all the feedback.

Alan
