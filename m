From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:24:31 -0700
Subject: [PATCH v3 03/12] RISC-V: Comment on the TLB flush in smp_callin()
In-Reply-To: <1536221135-182613-4-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-4-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112431.GC12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:26AM -0700, Atish Patra wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> This isn't readily apparent from reading the code.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Atish: code comment formatting update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
