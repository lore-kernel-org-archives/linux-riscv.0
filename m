From: schwab@suse.de (Andreas Schwab)
Date: Tue, 26 Jun 2018 14:49:49 +0200
Subject: ERROR: "swiotlb_dma_ops" [...] undefined!
Message-ID: <mvmzhzhg1aq.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

swiotlb_dma_ops is not an exported symbol, thus any module using
functions from dma-mapping.h will get an undefined reference to it.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
