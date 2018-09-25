From: zongbox@gmail.com (Zong Li)
Date: Tue, 25 Sep 2018 10:33:52 +0800
Subject: [PATCH 1/5] RISC-V: Build tishift only on 64-bit
In-Reply-To: <20180921065806.GA8401@infradead.org>
References: <cover.1537260207.git.zongbox@gmail.com>
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1537260207.git.zongbox@gmail.com>
 <20180921065806.GA8401@infradead.org>
Message-ID: <CA+ZOyaj2Ed3GCK0icaRNcttM7set=V1ffravCZefwmykD8=eMg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Christoph Hellwig <hch@infradead.org> ? 2018?9?21? ?? ??2:58???
>
> On Tue, Sep 18, 2018 at 05:19:13PM +0800, Zong Li wrote:
> > Only RV64 supports 128 integer size.
> >
> > Signed-off-by: Zong Li <zong@andestech.com>
>
> This looks fine.  Just curious, what do we even need 128-bit integers
> for on riscv64?  Did you see any issues if you drop it entirely?

You can refer to this issue, but I didn't try it.
https://github.com/riscv/riscv-linux/issues/136
