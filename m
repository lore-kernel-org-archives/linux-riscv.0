Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6023EF4613D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X0bhgX+XmyxLl08haHGzVKuiuKeWQPd7LUUDhTwHrsw=; b=dPOJexoN4WJhmM
	AqSurxSH2nMXQpGsp1RiMMUZ7LkJxy/AV8m+GHLDBT5PSY+pH1XtP936o4fHzuuGJFTB08R6Zi7uD
	LYMFy8C6f165j0QnuysM39ISH6iJ6ZfcrUPiOTd3qafVy2ZDvWI98hlWKapsxHbCqMb9ucvzAYgxX
	0uynkWwr3D2O4DR/orguiBCpwKk7D9JY59xsDIQH80kSl2xF8iwnMmdZ+3LHF7UCIRZgvU958N+uc
	ZUdXCOuZPEn9IH0wi+dtgLQGOeloDpwtlL68jFmBoOhI6f6MMETguz8lALiDNK/zvV1mvNEsu3ddB
	sv2Us/5TRV4S5MD9LppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hfd-0000000H4uM-0eJ6;
	Mon, 23 Mar 2026 15:58:25 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hfa-0000000H4u0-1gQ5
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 15:58:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c736261ee8dso112249a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281501; x=1774886301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SyPHQzyI0AHwqMlFoboSet59W59Lm/9+xwH2RUG0miE=;
        b=GbZZT6SX4OZRLI1A+JpaInLdbjDnZ8/Ces/7hfTvgqrEP8X3HB56s+HcL3vkRueFgn
         7xtqx9IhHxMphunFawPU0tcXk1qeNXYlBBe9+gjaflcNNSMdFRjkcct94qBi9FQ9NQdh
         j79/NhHVTo7s++wd4ZcapUBCKZCJInv2LF+Uh8JIzEtSFv0Zeau0X8s6/BH6rMGs35b6
         ksiLJALo2VHHUb2cPiCFhqqdw21Nj3/o8146UurnI2nixWE+E+F5NdCSewrd04ne5jQB
         /BKyGPPe2q/QZEQAojTwEfYtNaci9R62BNPds/n2ZBoKUhLvH3PVDk61U4VF58v8E9ts
         +ukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281501; x=1774886301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyPHQzyI0AHwqMlFoboSet59W59Lm/9+xwH2RUG0miE=;
        b=BjXXJKL8d+SMgkF07mXLTRvz2KRMviqaXNbUPk27Vymr3C5Z+neMSHMyzm9LenTYH4
         n+ZhLzr1ccnac2i9h8juEEwDcUIE+Vadf+ZiZltUtukEYn98ZZ+ZzjxHu0/lEe03x3TB
         LVgUgP/6XQ0aApOTDHXR6vzHoKpgDQF2ZYrZHuUTiRFF9JD6iWMwNnz+NmwqwivGxFP3
         S6BPJQuw0er9FiFydsO0vQdFI/spudfVAOu+sJAQlTMAu8N4P46lL/bckSOoqDPRuXFH
         MDUYUUKwpF3LcFJNRdk3VnRqaYNCyoTNu7mtGDhy41zL1HRs5VWY0FxAPnAMctp8qpmb
         cyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWllyjh5nIk6Rwft8o6+pb+zdLQ09vVgYe2KBbWcNiPj67fQ39nc2FjO8cj68PyzU8L8V0H5OkL5IlUug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvnhCh5yphOwovBg+mCZqjEcGg20zI2k7p8aFK43dnDlRphX7
	YjgYy5NfpJClRHgxnxmChvfWlaw85SyhirN5c9qHF9O9KBxsL2IqmpoD
X-Gm-Gg: ATEYQzySGLym5yhdNO2fIGt4VETQYQYm7PIU0CCsHkljgqktyR2UJaEcSEtaHQ2buYL
	8JdvAbg3e44MuC3Uc84VrzNLU0nZBzE6pUwO3eH+3hBrPUpoUKjHtVvY6+YARgrcOw+ItCj0Hul
	v84SF427WrTZhPPJIT5C82BWiMIETE26SPQ7ZcYUcKgj0ATY6lxHtPY8qiPTn3r3eIHd/coqonW
	4pDSR9yzUrkrcPNevOWQ58FGPO/JtO5eunx3bA2m+Z6NvGQhUI9SctyLXJO55tvqsdfjpcu3L/t
	6BdKQvNJ5WOqjy5W5WVDAGe6WT8lzP51pyo/Za047+KwaZd8FmYVy6lDhAZ6xqtvVpqm7zDaErO
	rT0kYeJEJcG+ObkwIQ5iyKBw3JDg7COzLhGRUtY3GHEyFoXd5wlxsPJWmqauXJmCZ6EvlVOZ6Np
	o9gGxuIQCxqXgHD9ptSSmpkxMAxZqtRVEb/TEZT6H00yM0r1VZegdU/zjVACDVgIIRJhDEBIUAO
	Sm0o3hNCA==
X-Received: by 2002:a05:6a20:a10c:b0:39b:9644:6ea4 with SMTP id adf61e73a8af0-39bce9f0e99mr11959607637.16.1774281500957;
        Mon, 23 Mar 2026 08:58:20 -0700 (PDT)
Received: from sean-All-Series.. (1-160-195-162.dynamic-ip.hinet.net. [1.160.195.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a801701sm8487398a12.4.2026.03.23.08.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:58:20 -0700 (PDT)
From: Sean Chang <seanwascoding@gmail.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org
Cc: will@kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Chang <seanwascoding@gmail.com>
Subject: [PATCH] iommu/riscv: Add DebugFS support for register dump
Date: Mon, 23 Mar 2026 23:58:06 +0800
Message-Id: <20260323155806.97130-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_085822_450198_C18F9446 
X-CRM114-Status: GOOD (  18.45  )
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

Add a DebugFS interface to allow users to dump the internal state of
the RISC-V IOMMU hardware. This is essential for diagnosing hardware
initialization issues and debugging driver-hardware communication
such as Command or Fault queue stalls.

The implementation exposes a "registers" file under the device's
debugfs directory. It uses the standard debugfs_regset32 structure
to dump core registers:

* Global configuration: capabilities, fctl, ddtp
* Command Queue: cqb, cqh, cqt, cqcsr
* Fault Queue: fqb, fqh, fqt, fqcsr
* Interrupts: ipsr, icvec

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
 drivers/iommu/riscv/Kconfig   | 11 ++++++++
 drivers/iommu/riscv/Makefile  |  1 +
 drivers/iommu/riscv/debugfs.c | 53 +++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c   |  3 ++
 drivers/iommu/riscv/iommu.h   | 12 ++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 drivers/iommu/riscv/debugfs.c

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..c2ba12d97e98 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -22,3 +22,14 @@ config RISCV_IOMMU_PCI
 	def_bool y if RISCV_IOMMU && PCI_MSI
 	help
 	  Support for the PCIe implementation of RISC-V IOMMU architecture.
+
+config RISCV_IOMMU_DEBUGFS
+    bool "RISC-V IOMMU Debugfs Support"
+    depends on RISCV_IOMMU
+    depends on IOMMU_DEBUGFS
+    help
+      Expose RISC-V IOMMU internals via debugfs. This includes
+      register dumps, queue status, and other hardware-specific
+      information useful for debugging.
+
+      If unsure, say N.
diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index b5929f9f23e6..9658a10d8b24 100644
--- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += iommu.o iommu-platform.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
+obj-$(CONFIG_RISCV_IOMMU_DEBUGFS) += debugfs.o
diff --git a/drivers/iommu/riscv/debugfs.c b/drivers/iommu/riscv/debugfs.c
new file mode 100644
index 000000000000..52dc50a7fa20
--- /dev/null
+++ b/drivers/iommu/riscv/debugfs.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+
+#include "iommu.h"
+
+static const struct debugfs_reg32 riscv_iommu_regs[] = {
+	/* --- Global Configuration --- */
+	{ .name = "capabilities",       .offset = RISCV_IOMMU_REG_CAPABILITIES  },
+	{ .name = "fctl",               .offset = RISCV_IOMMU_REG_FCTL          },
+	{ .name = "ddtp",               .offset = RISCV_IOMMU_REG_DDTP          },
+	/* --- Command Queue --- */
+	{ .name = "cqb",                .offset = RISCV_IOMMU_REG_CQB           },
+	{ .name = "cqh",                .offset = RISCV_IOMMU_REG_CQH           },
+	{ .name = "cqt",                .offset = RISCV_IOMMU_REG_CQT           },
+	{ .name = "cqcsr",              .offset = RISCV_IOMMU_REG_CQCSR         },
+	/* --- Fault Queue --- */
+	{ .name = "fqb",                .offset = RISCV_IOMMU_REG_FQB           },
+	{ .name = "fqh",                .offset = RISCV_IOMMU_REG_FQH           },
+	{ .name = "fqt",                .offset = RISCV_IOMMU_REG_FQT           },
+	{ .name = "fqcsr",              .offset = RISCV_IOMMU_REG_FQCSR         },
+	/* --- Interrupts --- */
+	{ .name = "ipsr",               .offset = RISCV_IOMMU_REG_IPSR          },
+	{ .name = "icvec",              .offset = RISCV_IOMMU_REG_ICVEC         },
+};
+
+void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu)
+{
+	struct debugfs_regset32 *regset;
+
+	if (!iommu_debugfs_dir)
+		return;
+
+	iommu->debugfs_dir = debugfs_create_dir(dev_name(iommu->dev), iommu_debugfs_dir);
+	if (IS_ERR_OR_NULL(iommu->debugfs_dir))
+		return;
+
+	regset = devm_kzalloc(iommu->dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->regs = riscv_iommu_regs;
+	regset->nregs = ARRAY_SIZE(riscv_iommu_regs);
+	regset->base = iommu->reg;
+
+	debugfs_create_regset32("registers", 0444, iommu->debugfs_dir, regset);
+}
+
+void riscv_iommu_debugfs_remove(struct riscv_iommu_device *iommu)
+{
+	debugfs_remove_recursive(iommu->debugfs_dir);
+}
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 368f3cbd2d0a..a4fa0307b32a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1466,6 +1466,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+	riscv_iommu_debugfs_remove(iommu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1526,6 +1527,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	riscv_iommu_debugfs_init(iommu);
+
 	return 0;
 
 err_remove_sysfs:
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..1084e4e77455 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -60,6 +60,10 @@ struct riscv_iommu_device {
 	unsigned int ddt_mode;
 	dma_addr_t ddt_phys;
 	u64 *ddt_root;
+
+#ifdef CONFIG_RISCV_IOMMU_DEBUGFS
+	struct dentry *debugfs_dir;
+#endif
 };
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
@@ -86,4 +90,12 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
 			   delay_us, timeout_us)
 
+#ifdef CONFIG_RISCV_IOMMU_DEBUGFS
+void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu);
+void riscv_iommu_debugfs_remove(struct riscv_iommu_device *iommu);
+#else
+static inline void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu) { }
+static inline void riscv_iommu_debugfs_remove(struct riscv_iommu_device *iommu) { }
+#endif
+
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
