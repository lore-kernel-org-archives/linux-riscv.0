From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:27:09 -0700
Subject: [PATCH v3 09/12] RISC-V: User WRITE_ONCE instead of direct access
In-Reply-To: <1536221135-182613-10-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-10-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112709.GH12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:32AM -0700, Atish Patra wrote:
> The secondary harts spin on couple of per cpu variables until both of
> these are non-zero so it's not necessary to have any ordering here.
> However, WRITE_ONCE should be used to avoid tearing.

We normally pair WRITE_ONCE with READ_ONCE.  But it seems like the
reader side is in assembly code, so this should be ok:

Reviewed-by: Christoph Hellwig <hch@lst.de>
