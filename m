From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 20 Sep 2018 23:58:06 -0700
Subject: [PATCH 1/5] RISC-V: Build tishift only on 64-bit
In-Reply-To: <40c77db9ee2d23479ff90f2658539d29d7a30896.1537260207.git.zongbox@gmail.com>
References: <cover.1537260207.git.zongbox@gmail.com>
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1537260207.git.zongbox@gmail.com>
Message-ID: <20180921065806.GA8401@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 18, 2018 at 05:19:13PM +0800, Zong Li wrote:
> Only RV64 supports 128 integer size.
> 
> Signed-off-by: Zong Li <zong@andestech.com>

This looks fine.  Just curious, what do we even need 128-bit integers
for on riscv64?  Did you see any issues if you drop it entirely?
