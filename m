From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 20 Sep 2018 23:44:10 -0700
Subject: [PATCH] RISC-V: include linux/ftrace.h in asm-prototypes.h
In-Reply-To: <20180910112306.GA12979@infradead.org>
References: <20180906215756.28414-1-jcowgill@debian.org>
 <20180910112306.GA12979@infradead.org>
Message-ID: <20180921064410.GA26810@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Sep 10, 2018 at 04:23:06AM -0700, Christoph Hellwig wrote:
> On Thu, Sep 06, 2018 at 10:57:56PM +0100, James Cowgill wrote:
> > When exporting symbols from an assembly file, the MODVERSIONS code
> > requires their prototypes to be defined in asm-prototypes.h (see
> > scripts/Makefile.build). Since both of these symbols have prototypes
> > defined in linux/ftrace.h, include this header from RISC-V's
> > asm-prototypes.h.
> > 
> > Reported-by: Karsten Merker <merker@debian.org>
> > Signed-off-by: James Cowgill <jcowgill@debian.org>
> 
> I think this needs at very least a good comment, including for which
> symbols you are doing this.
> 
> Also I'm curious if it might be worth just handling this in the
> asm-generic version, as those symbols should be assembly exports
> in most architectures.

Ok, looks like we don't really need the asm-generic asm-prototypes.h
to start with as far as I can tell.  So I think you can resubmit it
with just the ftrace.h include and a comment.
