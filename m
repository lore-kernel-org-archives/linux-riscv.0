Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865ACCD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 06:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ouPKUORhJRzjfLGaKM+DohtdNlsrssqMxW0AC6T9kic=; b=zmS8dkT5fG/bKs
	Ufe/8lbLS+Eu+GGA6zK47+uewiu41t6mRgRV//sugxQCztP8X/BLpmVFKCVeQRaw6I3LBdFf00dTX
	a9R/TBF9JV+mpbhw3zsgVF5hb60hqFC5yxRc04BOT6FITVH8ENejPvr8mvhdhP+X3KqmFVl3YON/m
	KzxxoaBQuJj8VGobGAPSeGxbvHvSOUR0x/J9AbHTvwHBbhOcxzqC8C2aoxkAGjSCsPFK8MH4n7A1K
	YhPftTHvgE8GGbpsFNVKi9yeUTx0R6sJAQyf9Q9iBiWJ8oFyNXwa/c7De4oYIq2Wt1e4SKUNHmxKd
	4rUI6jov7gvlTU9wuehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1AJ-0000000DibT-3dI9;
	Mon, 15 Jun 2026 06:51:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1AG-0000000Dhub-43AH
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 06:51:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf2247e38eso27776425ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781506157; x=1782110957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ybbv2WqemsTEWAq7K1IRQ6zQPJi/ktdHluf0py4HuKA=;
        b=EteQanaxttkbkiqFhGLRv//z0lG8RL3vq9GczOTnMCkA7j+Fr+Ga4DVkb5rNzZY1PK
         GlCCkRmi0XXXfpP9qUVt5KBhHTKP0WDBY6fLH/3bTOPk2BjD3tjr3Qs/K3GKwH32aqVQ
         MngC+ZtLhKNOymv/tPY4aEvMtQscAeiiHKP3xLjHuyowefrYMvyd4+vEDYAViR776j1b
         vF+Ws+QR26HOqE14fhRX7hgQNhVzvfHimf3aAek/ONLubgPM11LUc+Hk6gfpwr24Tjzp
         eUt0Fzvo6byXdl6E2TdOqySRIQ5VWl3oLHkr/IEprzLgbaBYxtTql0J6vGBN28RNlNff
         kubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506157; x=1782110957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybbv2WqemsTEWAq7K1IRQ6zQPJi/ktdHluf0py4HuKA=;
        b=j7MkVDKebieXGOf6V7IZyvtxDYMmKEiR1sZ5n989XHon3racHyhGE9CG0aDEBtOYxj
         7+eUAz8NuJU051MxTTXPw8GL3iTjTdOozPnjNXU+MGqjaNrCn0HtsGIsXU1KFw6wmZ35
         +3dyR9Kv0q/zcGqETFodgRcLnUtBQ7nLOVTEApC7eAMK3MvzV0gS6+GYKCJXdFwULwIj
         69YN0pvRIPwQtt8TLYwLZbNeDeFcUhraVjZRMNIEts61XPfUstbQKBqFLeVvrOd+O9fP
         kV9QJHqbt/ZVuuxsOO9HXrt0oSPm9C3wrFYbnyhOPdJcC/TB3lXp5Xz3eSUA8Uo58/5g
         WSpA==
X-Forwarded-Encrypted: i=1; AFNElJ9L8LUGqGBUduoi2w2D+fQd+f72lkc96E+pZYS3llcmInKDxGkjqhWvKmW8gW5QaLJiLnB5qxzBZ0l/sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp9q1cPDxy2CAxpAZKTZSErIX4/63nUIyBlNXlFkVUYdG+uya7
	CwH3AmbXUCEQmhJV8ThtcBs2szjPscbzlUwZB/YGTZ5Eb0bggZn5+SSQ44SrNrIs4SA=
X-Gm-Gg: Acq92OETVJBuY+P+b85ylIAA1nX+60HkSFDIhasaKIu8d6C2zJ4U4zP+Q8N2GEP0kBv
	mV0H4p0ja0NY08Iq48UGSO/LlPHqQYn4joaa/tYQDXMBDclKPeByVcAGewnWd2qQUGub0QOCp2N
	4YHW7sb0m838MKtfNBiZAtADwJlJOLpCQkbJtj8zwtYitDiRL1cVah1YvwkcyMz4KCFYBtMhv5G
	/0rRbecd2RJwfwkV1eLHtDo0sWSRjLazJu9TwK/5aTgn6FUdwWQm/0H7Wgzax7Uq50/ZKEgC+OC
	XXR/Qai5DuMOxrL0HkjpPo1d+QXvtWO8g65qDTiKScEsi4n/linaOMVEibucVADpDC6Qh0FwGJn
	cri8mroGhHnTTkU4I8DJsdP/1IzSgcWs/0m4uZVjb2jjs9LpNj6+RgXCqWAv8w0z4JBuOPfExcL
	XAdjbELhE9cv22FH9DMc+U72Kl6nu5H/F+9J0jzOXO62o/aPTT4KjHDFNsHmaiO17uFLCLvqitp
	ar6z70EudrMqno=
X-Received: by 2002:a17:902:d4cd:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c410fbb052mr150983355ad.14.1781506156572;
        Sun, 14 Jun 2026 23:49:16 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6511sm83532935ad.24.2026.06.14.23.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 23:49:16 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v1] iommu/riscv: Support 32-bit register accesses
Date: Mon, 15 Jun 2026 14:48:55 +0800
Message-ID: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235121_004999_D5CE718F 
X-CRM114-Status: GOOD (  14.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some RISC-V IOMMU implementations cannot perform 64-bit MMIO accesses
to the IOMMU register file. The RISC-V IOMMU architecture allows 64-bit
registers to be accessed using 32-bit accesses, provided the accesses are
properly aligned and do not span multiple registers.

Add a config option for such implementations and access 64-bit IOMMU
registers as paired 32-bit MMIO operations when it is enabled. Serialize
the paired accesses so the high and low halves cannot interleave with
another CPU. Full 64-bit register programming writes the high half before
the low half.

This option describes the register access width. It is not an RV32 kernel
mode and does not describe a 32-bit IOMMU architecture.

Co-developed-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
This is needed for platforms whose RISC-V IOMMU register window does not
support naturally aligned 64-bit MMIO accesses.

 drivers/iommu/riscv/Kconfig | 11 ++++++++
 drivers/iommu/riscv/iommu.c |  4 +++
 drivers/iommu/riscv/iommu.h | 55 +++++++++++++++++++++++++++++++++----
 3 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..54d624b9b2ef 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -22,3 +22,14 @@ config RISCV_IOMMU_PCI
 	def_bool y if RISCV_IOMMU && PCI_MSI
 	help
 	  Support for the PCIe implementation of RISC-V IOMMU architecture.
+
+config RISCV_IOMMU_32BIT_ACCESS
+	bool "Use 32-bit accesses for RISC-V IOMMU registers"
+	depends on RISCV_IOMMU
+	help
+	  Say Y when the RISC-V IOMMU MMIO window cannot be accessed
+	  using naturally aligned 64-bit loads and stores.
+
+	  When enabled, 64-bit IOMMU registers are accessed as paired
+	  32-bit MMIO operations. This option does not describe an RV32
+	  kernel or a 32-bit IOMMU architecture.
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index a31f50bbad35..7fa1721b5728 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -53,6 +53,10 @@ struct riscv_iommu_devres {
 	void *addr;
 };
 
+#ifdef CONFIG_RISCV_IOMMU_32BIT_ACCESS
+DEFINE_RAW_SPINLOCK(riscv_iommu_32bit_access_lock);
+#endif
+
 static void riscv_iommu_devres_pages_release(struct device *dev, void *res)
 {
 	struct riscv_iommu_devres *devres = res;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..ba78ef1858c5 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,6 +14,9 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#ifdef CONFIG_RISCV_IOMMU_32BIT_ACCESS
+#include <linux/spinlock.h>
+#endif
 
 #include "iommu-bits.h"
 
@@ -69,21 +72,61 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-#define riscv_iommu_readq(iommu, addr) \
-	readq_relaxed((iommu)->reg + (addr))
-
 #define riscv_iommu_writel(iommu, addr, val) \
 	writel_relaxed((val), (iommu)->reg + (addr))
 
+#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
+	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
+			   delay_us, timeout_us)
+
+#ifndef CONFIG_RISCV_IOMMU_32BIT_ACCESS
+#define riscv_iommu_readq(iommu, addr) \
+	readq_relaxed((iommu)->reg + (addr))
+
 #define riscv_iommu_writeq(iommu, addr, val) \
 	writeq_relaxed((val), (iommu)->reg + (addr))
 
 #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
 	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
 			   delay_us, timeout_us)
+#else /* CONFIG_RISCV_IOMMU_32BIT_ACCESS */
 
-#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
-	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
-			   delay_us, timeout_us)
+extern raw_spinlock_t riscv_iommu_32bit_access_lock;
+
+static inline u64 __riscv_iommu_readq_relaxed(void __iomem *addr)
+{
+	u32 lo, hi;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&riscv_iommu_32bit_access_lock, flags);
+	do {
+		hi = readl_relaxed(addr + sizeof(u32));
+		lo = readl_relaxed(addr);
+	} while (hi != readl_relaxed(addr + sizeof(u32)));
+	raw_spin_unlock_irqrestore(&riscv_iommu_32bit_access_lock, flags);
+
+	return ((u64)hi << 32) | (u64)lo;
+}
+
+static inline void __riscv_iommu_writeq_relaxed(u64 value, void __iomem *addr)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&riscv_iommu_32bit_access_lock, flags);
+	writel_relaxed((u32)(value >> 32), addr + sizeof(u32));
+	writel_relaxed((u32)value, addr);
+	raw_spin_unlock_irqrestore(&riscv_iommu_32bit_access_lock, flags);
+}
+
+#define riscv_iommu_readq(iommu, addr) \
+	__riscv_iommu_readq_relaxed((iommu)->reg + (addr))
+
+#define riscv_iommu_writeq(iommu, addr, val) \
+	__riscv_iommu_writeq_relaxed((val), (iommu)->reg + (addr))
+
+#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
+	readx_poll_timeout(__riscv_iommu_readq_relaxed, (iommu)->reg + (addr), \
+			   val, cond, delay_us, timeout_us)
+#endif /* CONFIG_RISCV_IOMMU_32BIT_ACCESS */
 
 #endif
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
