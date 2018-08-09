From: alankao@andestech.com (Alan Kao)
Date: Thu, 9 Aug 2018 15:33:00 +0800
Subject: [PATCH v5 5/5] Auto-detect whether a FPU exists
In-Reply-To: <20180809070258.GA11082@infradead.org>
References: <1533796003-680-1-git-send-email-alankao@andestech.com>
 <1533796003-680-6-git-send-email-alankao@andestech.com>
 <20180809063124.GA26062@infradead.org>
 <20180809064336.GA18746@andestech.com>
 <20180809070258.GA11082@infradead.org>
Message-ID: <20180809073300.GB18746@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 12:02:58AM -0700, Christoph Hellwig wrote:
> On Thu, Aug 09, 2018 at 02:43:36PM +0800, Alan Kao wrote:
> > It does look a little bit weird.  Should I send a v6 for this?
> 
> Yes, please resend the series or just this patch.
> 
> I think the hswap.h definition should go away and we should just
> keep the switch_to.h one, even if that means including the header
> in another C file.
> 

It turns out that only cpufeature.c and switch_to.h are affected
by hwcap.h.  As switch_to.h already had extern has_fpu declaration,
the one in hwcap.h is redundant and can be removed safely.

I will resend just this patch, and mark it as v6.
