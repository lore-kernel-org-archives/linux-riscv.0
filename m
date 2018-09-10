From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:25:05 -0700
Subject: [PATCH v3 05/12] RISC-V: Provide a cleaner raw_smp_processor_id()
In-Reply-To: <1536221135-182613-6-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-6-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112505.GE12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:28AM -0700, Atish Patra wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> I'm not sure how I managed to miss this the first time, but this is much
> better.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Atish: code comment formatting and other fixes]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
