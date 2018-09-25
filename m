From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 25 Sep 2018 10:32:12 -0700
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
In-Reply-To: <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
References: <20180925161538.GA5328@infradead.org>
 <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
Message-ID: <20180925173212.GA21414@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 25, 2018 at 09:26:51AM -0700, Palmer Dabbelt wrote:
> On Tue, 25 Sep 2018 09:15:38 PDT (-0700), Christoph Hellwig wrote:
> > I think this fix isn't quite right actually - we don't need asm-generic
> > asm-prototypes.h, as said in the review of this patch.
> > 
> > Also on it's own it isn't going to help with doing a modversions enabled
> > build, as the return_to_handler export needs to be dropped.
> 
> Ah, sorry -- my understanding was that while this wasn't the cleanest fix,
> it would at least enable the Debian people to work around their issue.  If
> that's not the case then I'll just drop this PR, but I'd really like to
> enable the Debian people to ship kernel images and that's a big step.
> 
> Did I misunderstand what's going on here?  I tried to build it according to
> the patch's instructions and don't remember seeing the warnings, but I might
> just be wrong here...

You'll only see the warning when you actually install the modules
if I remember correctly.
