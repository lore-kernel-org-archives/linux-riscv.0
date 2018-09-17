From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:23:08 -0700
Subject: [RFC 2/3] RISC-V:Support per-hart timebase-frequency
In-Reply-To: <1536962096-233842-3-git-send-email-atish.patra@wdc.com>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-3-git-send-email-atish.patra@wdc.com>
Message-ID: <20180917142308.GB15588@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Sep 14, 2018 at 02:54:55PM -0700, Atish Patra wrote:
> Follow the updated DT specs and read the timebase-frequency
> from the boot cpu. Keep the old DT reading as well for backward
> compatibility. This patch is rework of old patch from Palmer.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

This setup looks a bit odd because it keeps blindly overwriting
riscv_timebase for every cpu found.  Shouldn't we at least check that
they all match for now as the rest of the port assumes that?
