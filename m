Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D554C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/30xtvEtWleEcywfDtjoYMC8ZJEwDdxnhTzPkualH4=; b=UiYLSa6c6mDoDv
	RPUw+48Qcp5SoRNRA3vk86AEzEToMHwe6qrLE8zhu19QS3eA54pgxVUR2ftHmIXXHQQdwYhTwR0cV
	OzqZMG9X2Q/SSVJr8mPKxTnVAxX7htL0X+svqi4qo0YxlrXi6iB63uXGa57FEp+dRjJkb7FRAbcnR
	6Fa0Jmf2V+APbIgOlsxBhZeO/FIuTaVfTC8YKgxxDI9H0pjNo3nvTkDBlJJ+rGh/DgqPNKO6G1A4P
	WCljenQ1YuQoVLWOO4Cil5LkCSsrTv7qqYROekX05lhZKm76EtfwIAEjber5R97olIR5vjxLhTv/4
	5MvowfRwpRhJCl6CHc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ33-009fhk-NV; Tue, 21 Feb 2023 20:15:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY0x-009UpQ-OI
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id h14so6311826plf.10
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PlwZzP1OOkIe8VY/GWOoEev+10r3VEkS4WO6Gk8l2k=;
        b=QQBnZajvWt8L0J2op7Y8kbVD/inXT8jI1jPRtrAaF1l32CC/UmkDKZntxGEkxJT9A6
         RXUSdeohaBNYxrUQ0keb/sWyK7iBM1289G/b7aRD5jchfFz3o4/HGm4ySSqAa1DsvEwY
         IFoMRUFDU+aQ1bFAs+wWir3DnVgSR8eE5W6ixGdGxdQr+vORYiuR7OBS1iAFoNih8X56
         tYuBPx3j25tO75A0wH5LzIduopQFOwGLI4EMG+UU7vXPk6D9HoyAqtEgibBGTc90hnLk
         7IpYLiiJAU3s9OgqZJQa1VBtSf8nmzaZIld31oJqqb3L3Ph5b6DDIH+rsXj4ab3Uks2r
         0hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PlwZzP1OOkIe8VY/GWOoEev+10r3VEkS4WO6Gk8l2k=;
        b=a/siBjK3XW3uySBvAnkcmuYVBphD5VsLggcSKVAUOv+NikUOV45G/qzKAvYQWhUIPD
         wcKwEDzQyD6Xm5kg+t/dgvPYfjfahsTSXBNmkuriciZpSiQWcoBfSXbWwkxO9U6NL5NO
         07MNgD5IlkSw/qw6bc22ke4S1PXCol4GSXdMKWx6MkrPAzcdXJCnOtSahL4qSB6oRGeU
         rMw1lVVpMsYzAb8aESbV1eY+Tl/c4lCcGdFLCNk0RDaXidvVQ8KviPtQKnJ6H5L4sG9y
         tq+Ml0lPCXxn1am3MvY/yuiYAN6Nyheve9Ym5GvvCQGBxSlPGK1lzDm2gkc0T1pEyHfu
         FNXA==
X-Gm-Message-State: AO0yUKWSxjh2PwOJcqbaHdoP9je7+H0R8l/ZKWBk5IVmGbgBkNw22sWM
	4Ygzf56uoH889KLEk2VLYI0tQA==
X-Google-Smtp-Source: AK7set9Q85lvtHtrFPYHZWf/kOfD/8K3nKYkOZE+80ANPB1/PRLs2yUzrjgynto2OVVHbsuyXfrBAg==
X-Received: by 2002:a17:902:e886:b0:199:15bb:8316 with SMTP id w6-20020a170902e88600b0019915bb8316mr8643038plg.68.1677006561719;
        Tue, 21 Feb 2023 11:09:21 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:21 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 1/7] RISC-V: Move struct riscv_cpuinfo to new header
Date: Tue, 21 Feb 2023 11:08:52 -0800
Message-Id: <20230221190858.3159617-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110923_794987_D44E7307 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, heiko@sntech.de, Atish Patra <atishp@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In preparation for tracking and exposing microarchitectural details to
userspace (like whether or not unaligned accesses are fast), move the
riscv_cpuinfo struct out to its own new cpufeatures.h header. It will
need to be used by more than just cpu.c.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes in v3:
 - Updated copyright date in cpufeature.h
 - Fixed typo in cpufeature.h comment (Conor)

Changes in v2:
 - Factored the move of struct riscv_cpuinfo to its own header

 arch/riscv/include/asm/cpufeature.h | 21 +++++++++++++++++++++
 arch/riscv/kernel/cpu.c             |  8 ++------
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature.h

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 000000000000..66ebaae449c8
--- /dev/null
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2022-2023 Rivos, Inc
+ */
+
+#ifndef _ASM_CPUFEATURE_H
+#define _ASM_CPUFEATURE_H
+
+/*
+ * These are probed via a device_initcall(), via either the SBI or directly
+ * from the corresponding CSRs.
+ */
+struct riscv_cpuinfo {
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
+};
+
+DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+
+#endif
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..684e5419d37d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/seq_file.h>
 #include <linux/of.h>
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
@@ -70,12 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
-struct riscv_cpuinfo {
-	unsigned long mvendorid;
-	unsigned long marchid;
-	unsigned long mimpid;
-};
-static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
+DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
