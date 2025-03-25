Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81196C3600C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JI3FDl87wxKDp+wyxqV02Zyky86MRA00ffhXeioHZPA=; b=Qd1w9jPQXyABYO
	Kowxv60DJAl/b6JOBN59ORR1YtIO9OBOV9HaRk2GJDTJL7PPxx3Fn87/nDG6DtBbKmicto1FV8YJ+
	keRRSxOhRmbXzp1tooqyfjOZlO8iDfgch3tKGeJK+QKm+h89MDbWxiK6q78V4rZrt0znDoyh1wgs5
	iPbsJm6LOyBVVlJD3XY1WAE8YpZ6VSXad7s9IypdYpGgzHU09tySIg6tajt+bLBOUHvJRb2FPScFA
	5NWq5tft+VHfFpG1UgRkJj90zt6xqFQtPwopXuLi5myjYj2kXUZp/6Uu1zr4RT2W8prGKpbr3ugfh
	/nhetg9+SCHRWVsV2t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7X4-00000006XnA-3Uf0;
	Tue, 25 Mar 2025 16:53:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Uf-00000006EN0-49El
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 14:43:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227b828de00so46445945ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742913781; x=1743518581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bljuQ7L2ZXdxWuOFhGPKf4EDYNcT12ia204eGvgijaA=;
        b=kOeRd0vVrtNSj1hruMIPZSv1WrkOvjrrI/0gBF/op7t8juk53z122KVnzqleH6Vtz3
         +9aOE6RTpbzQAL306UXMkgecylT97gGIEH3i3z7VwEaCG7473kNqpwd8WFutV8XZfLtA
         Z59ld/1fGp5qPQ68J3V2t9gr95SYtqH/qw0hl0B1yz+Oe2vtKRMY8yM/rXYRPwnXcce3
         1rB9KzIo8EEsHj56wpdxr7ajHRnYg1g/z//ML8THX4/ZpTJMInFz4blpz9fY7z9JgVq6
         XWufaa4WD0zlFW8swub/OFXNLH9Jt1OD7ZIzPnHs4K6QShYD+gi6WnQhoGzUZB9gzcP4
         WV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913781; x=1743518581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bljuQ7L2ZXdxWuOFhGPKf4EDYNcT12ia204eGvgijaA=;
        b=j1MjXcT1dHTq3MHJ+2BkcZgUWMJHyySKvMymIP74bL/Kqnkse5wEn/tfgv763LkGiB
         yA4FPYk69xlTpMFS1PY5IYkhOXyx4DUbHuK+n1vbzN8AMXvm+Trj1ZxNoZwycdvOTDsS
         yZry1TDvQR5HsJyYgMunHkaltQFpDPFD62PRKbfr0+fnaRyFT8adcr3mfYL41wVL/qns
         c+802+CK+nxNdTYnmq1JfZI9VkhDHc+dVmQJtGslff53IVSCVIe7W3XOhxxOPoNlDC/4
         JReTAQZN+iI2HXwYCtT78DnXLHoiBoyqx16tufTgodXk7CWu489BsRGSS7Dq7Qqwd8OY
         jERw==
X-Forwarded-Encrypted: i=1; AJvYcCXSwabLL5TzO2lmsGkGzSv9d/VgvXylHMvLXeWx+pV072qMU8vSPowgQDbxz7XSlvcdiuuDbnvTMj43VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKp3j/GNxqziT+yM2D49pM6/N1a4efAikzDcgcyN+KGRtRz22T
	bQimIN2QzfZLtpQaHayu7Udjvj3a8Bq+Ps8KTo+RfXcurQMuI8I0v92rlUL33J4=
X-Gm-Gg: ASbGncsAgGQY6X4juak5ntViXSAsZbLXg8DcPqYDvG8AxsMSWdWuLnaXeOIYzz02ezZ
	7Jp4e4mqWynGjrmzAjpT/faxOvBXwKbMp9s3bJGU/X4F1Ep5ytNmTdiQi1H0/fPcau3WFe0djaQ
	aEHJ3+kye3WGNUr7VrEEdKVYcr8sNQJdh3/lks5EvDe+XDn/d1NuFirgAvrJN+sj+EaH8WLB7WH
	LrPEzn9soEb2bzLPXH83HVAoR2u8wmwkSHdRIwW/toEI8AoJ0p/+ZrTQuzmymycQUWxC1nLUQvi
	AGghMP5xtm9UtqpDZfg6cDofnZSWVRNnTXs7o/7jVqtib9Zx9jjz0jx/fZMTqoTJCPrWHQjz0q+
	BBOxbrpME1/S4RVOUdWpb7g5B1lUo2rHB/3VQzw==
X-Google-Smtp-Source: AGHT+IHfViq5we3BRjn4gQvEwpQaIGaX5+RcC5JvR41oDoMV13Q99xQsSECoVp76jMvqJK4oIhXprQ==
X-Received: by 2002:a17:902:d484:b0:223:3ef1:a30a with SMTP id d9443c01a7336-22780e239e1mr244870085ad.45.1742913780671;
        Tue, 25 Mar 2025 07:43:00 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f39656sm90623745ad.5.2025.03.25.07.42.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Mar 2025 07:43:00 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	alex@ghiti.fr
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] iommu: riscv: Split 8-byte accesses on 32 bit I/O bus platform
Date: Tue, 25 Mar 2025 22:42:52 +0800
Message-Id: <20250325144252.27403-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_074306_307323_5267F6E4 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Introduce a new configuration CONFIG_RISCV_IOMMU_32BIT to enable
splitting 8-byte access into 4-byte transactions for hardware platform
whose I/O bus limits access to 4-byte transfers.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/Kconfig |  9 +++++++++
 drivers/iommu/riscv/iommu.h | 28 +++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index c071816f59a6..b7c9ea22d969 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -18,3 +18,12 @@ config RISCV_IOMMU_PCI
 	def_bool y if RISCV_IOMMU && PCI_MSI
 	help
 	  Support for the PCIe implementation of RISC-V IOMMU architecture.
+
+config RISCV_IOMMU_32BIT
+	bool "Support 4-Byte Accesses on RISC-V IOMMU Registers"
+	depends on RISCV_IOMMU
+	default n
+	help
+	  Support hardware platform whose I/O bus limits access to 4-byte
+	  transfers. When enabled, all accesses to IOMMU registers will be
+	  split into 4-byte accesses.
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..0e3552a8142d 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,6 +14,10 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#ifdef CONFIG_RISCV_IOMMU_32BIT
+#include <linux/io-64-nonatomic-hi-lo.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#endif
 
 #include "iommu-bits.h"
 
@@ -69,21 +73,35 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
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
+#ifndef CONFIG_RISCV_IOMMU_32BIT
+#define riscv_iommu_readq(iommu, addr) \
+	readq_relaxed((iommu)->reg + (addr))
+
 #define riscv_iommu_writeq(iommu, addr, val) \
 	writeq_relaxed((val), (iommu)->reg + (addr))
 
 #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
 	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
 			   delay_us, timeout_us)
+#else /* CONFIG_RISCV_IOMMU_32BIT */
+#define riscv_iommu_readq(iommu, addr) \
+	hi_lo_readq_relaxed((iommu)->reg + (addr))
 
-#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
-	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
+#define riscv_iommu_writeq(iommu, addr, val) \
+	((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
+	 lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
+	 hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
+
+#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
+	readx_poll_timeout(hi_lo_readq_relaxed, (iommu)->reg + (addr), val, cond, \
 			   delay_us, timeout_us)
+#endif /* CONFIG_RISCV_IOMMU_32BIT */
 
 #endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
