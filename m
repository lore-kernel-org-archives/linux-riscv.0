Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA9C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61e3DKb+3ZsW9OlNwlKQ+ef56OAjWQ1e0aZYXPFPDC8=; b=0zJ7J64+KvUvOY
	dzFN0NdhStL9hTwov3Emhzu4deVAgk4TVKhnjdgkEoKhiJ/jXFgnqfzMkRBJ9T5OQHJTd2na6VvqX
	YwjorSBTIqK1jRxTngH076diybQ6xXTgXEdw181FRBPE1P0xHRX0+4mKEPzGQanl8vPXl/kd355+o
	gKw0dpaCgH+BJzcxDXk5LlyQOynEGGsDGCoBqkVXnuRGPLCFAXpNwLGIi2peeWw7UoRa2Gyx+HxPC
	QG6uZ2lqNwiePdBcTYFpFTas4+Zxc72bn9fsqRakMzw1WaLlj912IVw7+KkFi7bS/HYhyBqeWBZJq
	egJq4L2LrbG+QMBhRtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGC-006ecJ-0G;
	Wed, 19 Apr 2023 23:30:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8e-006TXl-2E
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-24736790966so213025a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942736; x=1684534736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpkP1wnIrltbLZeAb/TZzxnsq9NvqWT39c9WofSyiOk=;
        b=Nzsbq++D21vwA8dGs2TEhUmfLPFSaig0puRkykWSASC64dxd/vGkpSKeFxQXOJxyon
         5Ou4PoViyNfDX1Gfoq/jlBl1G1RhaiR4JLXaKzD7kt+niF6AKE+yOb7DVxkMfV9AiHsx
         mTPuZ/MAZl6BEVu8xpX5HBzOXWWYp6VQYr3Mp0sTKgkIRgLhxoSPyTdHc4vxQBKRTjC6
         nzaETrxZRtdvV7d/S3g19DaIk1Y5S0BgV4Ei7fF0jUB1ujpfDWT04dllTpouA2v7Akvc
         l3myGSmdOxw+gPB2lOjj2aqYoHDlOR0Rr4q6kW0PPflSvA1d+iZ7docwAXBz+likDSY4
         tCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942736; x=1684534736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpkP1wnIrltbLZeAb/TZzxnsq9NvqWT39c9WofSyiOk=;
        b=RfVBc1WUuUNOcgwdT00uMr8L/SiopP7wnODqQh447mx7DqaVRLsdRc3DseiCrLbVUY
         tojjP6y7EcQ0j5Ip2/1+aVVP0Dd5WyeQ2XuKUXUyfW8GSrr5/FA4xFnQ+5/vrphyLaJ9
         orjS5ciIx9XHmKOGaYy2rC+SkRkUMF6T13smPQZna5aEVFPhJ6KqyTSn4A5+34P4Fr5X
         emNUKIeOhcNfNeni2i+q4m89IR28hALP7vacZyr4qOD6DGz+KJishGs4LDGgbIj1rJWo
         JpQMP/9AoBa+MrMNUacxkiHLQLXu72X0tqukiDL1y4OWP808G2TKnYOBUrdEdmeYWBow
         3b/w==
X-Gm-Message-State: AAQBX9c5+bwiOVxFzxo6I3XptSbVdLukId7HR7kxw+/9b9pKGnZP671i
	yuyDmEgFBQks0F5p7PclK1Iyhg==
X-Google-Smtp-Source: AKy350bCoBKIrFcroX21XtHTuZqvJehyqLN918v9CE2Osbf4jkMqvKMUa5z+Sio4RKf3jpe/KHP4Bg==
X-Received: by 2002:a17:90a:f415:b0:247:6be7:8cc0 with SMTP id ch21-20020a17090af41500b002476be78cc0mr3832862pjb.35.1681942736133;
        Wed, 19 Apr 2023 15:18:56 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:55 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 39/48] RISC-V: Implement COVG SBI extension
Date: Wed, 19 Apr 2023 15:17:07 -0700
Message-Id: <20230419221716.3603068-40-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151856_731413_0C8C36A5 
X-CRM114-Status: GOOD (  17.10  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

COVG extension defines the guest side interface for running a guest
in CoVE. These functions allow a CoVE guest to share/unshare memory, ask
host to trap and emulate MMIO regions and allow/deny
injection of interrupts from host.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/cove/Makefile          |   2 +-
 arch/riscv/cove/cove_guest_sbi.c  | 109 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/covg_sbi.h |  38 +++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/cove/cove_guest_sbi.c
 create mode 100644 arch/riscv/include/asm/covg_sbi.h

diff --git a/arch/riscv/cove/Makefile b/arch/riscv/cove/Makefile
index 03a0cac..a95043b 100644
--- a/arch/riscv/cove/Makefile
+++ b/arch/riscv/cove/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o
+obj-$(CONFIG_RISCV_COVE_GUEST)	+= core.o cove_guest_sbi.o
diff --git a/arch/riscv/cove/cove_guest_sbi.c b/arch/riscv/cove/cove_guest_sbi.c
new file mode 100644
index 0000000..af22d5e
--- /dev/null
+++ b/arch/riscv/cove/cove_guest_sbi.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * COVG SBI extensions related helper functions.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <asm/sbi.h>
+#include <asm/covg_sbi.h>
+
+int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ADD_MMIO_REGION, addr, len,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_REMOVE_MMIO_REGION, addr,
+			len, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_share_memory(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_SHARE_MEMORY, addr, len, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_unshare_memory(unsigned long addr, unsigned long len)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_UNSHARE_MEMORY, addr, len, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_allow_external_interrupt(unsigned long id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, id, 0,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_allow_all_external_interrupt(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_ALLOW_EXT_INTERRUPT, -1, 0,
+			0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_deny_external_interrupt(unsigned long id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_DENY_EXT_INTERRUPT, id, 0, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covg_deny_all_external_interrupt(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVG, SBI_EXT_COVG_DENY_EXT_INTERRUPT, -1, 0, 0,
+			0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
diff --git a/arch/riscv/include/asm/covg_sbi.h b/arch/riscv/include/asm/covg_sbi.h
new file mode 100644
index 0000000..31283de
--- /dev/null
+++ b/arch/riscv/include/asm/covg_sbi.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * COVG SBI extension related header file.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_COVG_SBI_H__
+#define __RISCV_COVG_SBI_H__
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+
+int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len);
+int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len);
+int sbi_covg_share_memory(unsigned long addr, unsigned long len);
+int sbi_covg_unshare_memory(unsigned long addr, unsigned long len);
+int sbi_covg_allow_external_interrupt(unsigned long id);
+int sbi_covg_allow_all_external_interrupt(void);
+int sbi_covg_deny_external_interrupt(unsigned long id);
+int sbi_covg_deny_all_external_interrupt(void);
+
+#else
+
+static inline int sbi_covg_add_mmio_region(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_remove_mmio_region(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_share_memory(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_unshare_memory(unsigned long addr, unsigned long len) { return 0; }
+static inline int sbi_covg_allow_external_interrupt(unsigned long id) { return 0; }
+static inline int sbi_covg_allow_all_external_interrupt(void) { return 0; }
+static inline int sbi_covg_deny_external_interrupt(unsigned long id) { return 0; }
+static inline int sbi_covg_deny_all_external_interrupt(void) { return 0; }
+
+#endif
+
+#endif /* __RISCV_COVG_SBI_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
