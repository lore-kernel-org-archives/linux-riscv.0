From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 12 Jun 2018 23:32:17 -0700
Subject: On Supporting no-FPU machines
In-Reply-To: <20180613062653.GA14518@andestech.com>
References: <20180613062653.GA14518@andestech.com>
Message-ID: <20180613063217.GA12182@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 13, 2018 at 02:26:53PM +0800, Alan Kao wrote:
> A quick work-around is something like this:

I think we need to detect this at run time, to support a single
kernel image on systems with or without FPU.

> in fstate_restore will never be taken.  
> Actually, we don't even need those floating-point routines for no-FPU boards.  
> We would need a larger patch to make those FP code inside some __riscv_flen
> pre-processor sections.

A separate CONFIG_FPU to not build the FPU code sounds fine to me
as long as it defaults to on.
