From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 25 Sep 2018 09:26:51 -0700 (PDT)
Subject: [GIT PULL] A Single RISC-V Update for 4.19-rc6
In-Reply-To: <20180925161538.GA5328@infradead.org>
Message-ID: <mhng-3ad7c756-ed90-4cfd-b178-cd09e021a758@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 25 Sep 2018 09:15:38 PDT (-0700), Christoph Hellwig wrote:
> I think this fix isn't quite right actually - we don't need asm-generic
> asm-prototypes.h, as said in the review of this patch.
>
> Also on it's own it isn't going to help with doing a modversions enabled
> build, as the return_to_handler export needs to be dropped.

Ah, sorry -- my understanding was that while this wasn't the cleanest fix, it 
would at least enable the Debian people to work around their issue.  If that's 
not the case then I'll just drop this PR, but I'd really like to enable the 
Debian people to ship kernel images and that's a big step.

Did I misunderstand what's going on here?  I tried to build it according to the 
patch's instructions and don't remember seeing the warnings, but I might just 
be wrong here...

> Last but not least I'm not sure who is going pull this if you only
> send it to linux-riscv :)

My flow is to tag PRs on Monday and then send them to linux-riscv for review.  
If there are no issues then I send them to Linus on Wednesday morning.  The 
flow is designed to catch issues like this, but I think it's the first time we 
found something concrete.
