Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A9C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mazFDbgaXsS0IbVzMcLLtugjePCvUfUoJr/xdBcJUOA=; b=rVCY65ID/mjBBj
	cL1TxQLPE2HTyyeMouc+duezjQ6XTdEGkinGE6ouRidYLAxqLpE4javvY+igVDhV/mat8gU6Mfk4z
	xL84uzIZ+gzm2z+AoucmTATQDi5Kx8bBps2QTOayPrEIkelmboXoVGuU/EOIoDRkHhZ8BozsxO7XK
	QnGFMBBzazoXgpBpiFZklwEuYhWTIxdqaaP4O5xbTHd3KKGiYyxo4MveFnCea+OIWdctfIgpsY2qe
	VoCLN4Yl6Qpgqq+FhSeuJvWtusWpjX94YOFehgLFxkMOmK+cF2/RaaxG5YSNV+VK+gZOyLn6rAbv0
	n1k72tJtk6DLr/37kc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgple-00BiRB-2O;
	Mon, 27 Mar 2023 16:32:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgplc-00BiOD-1S
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:32:21 +0000
Received: by mail-pj1-x1032.google.com with SMTP id x15so8183972pjk.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679934737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgq06+KbGbQ52Tcr41GFnnU7gGDLnmn/MKHrb/zsB6A=;
        b=7a1xdjg6ZAk+TLmtQSrhgtjf5MOB7t+IqWSR1MW5vYia586Lu2WUi3+hDs42tX1zSy
         aV4zbtXgvUz5zCcpwWfjK+aDGiXT3gVYSU0D37f8UpQEpWf+81ciqsoXo3/DPrqNAGbC
         LA0JP+W0vYgRYL8CEZk9G9gHZ/NIQpQtcCzOMwH9sjH/Y++9f7r60rcCU2kb2+AJ2OML
         +HQXIHf0GXXv6yZ3G02ay9mPUxSCdOSPbU4SJsg5k+9LepfiErsYr3xmTOe0zG8vQqrl
         guzf+TVZqD3qzoRcYVruOYI4QDfF1wn0weG5T/RioFAY6WAImCgLdqpqgOk7h4X2W7tl
         MckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679934737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bgq06+KbGbQ52Tcr41GFnnU7gGDLnmn/MKHrb/zsB6A=;
        b=emOoX5EImisP94Zk/OjbAXXgmccgu7OLcNOyJHgg/ejm3llof0W4NVgFFQKQO3ZBBt
         e2RkryZdbSEWFbEpmjM3s8XKU1e7UTUjl0s8Fc/9CQpzp5IB/J1rS607Zqem/wJRCUSd
         umng7yJqQZmWu1CpAW2ydP7rXugYmMTW6uo1FPevxL4c3PKQ3V7Da2Y4V9TJrosTjVuu
         WgqzPE0wWCwrAXNRTpvHd998yzyNgkOI+T1gazL1lPXZYP6VYYCmgOfqe5fKRj/oR56j
         ocQU7QdgrEKGXfg/3pX/NHlQx6jN6jYXVHIEg6tq5w1pyU0nSAI9+J/KuyuweI6H3qHB
         AFTA==
X-Gm-Message-State: AAQBX9d/23O961qV1fN+VP6Ssov+tBOW4Rt6vHnMAMnGhG5CjWfpCHmK
	aviZEbpxVkTStKe6qCgFugwRew==
X-Google-Smtp-Source: AKy350Zudio1TyvHfzzITc+dUT3hT43EMyUo1f9sOd/vqofLTXeYeRHZcTD/12bHLw0Z1AYzTYfTrg==
X-Received: by 2002:a17:903:746:b0:1a0:44e7:59dc with SMTP id kl6-20020a170903074600b001a044e759dcmr11310228plb.40.1679934737000;
        Mon, 27 Mar 2023 09:32:17 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b001a1faeac240sm8963524plb.186.2023.03.27.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:32:16 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 1/6] RISC-V: Move struct riscv_cpuinfo to new header
Date: Mon, 27 Mar 2023 09:31:58 -0700
Message-Id: <20230327163203.2918455-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327163203.2918455-1-evan@rivosinc.com>
References: <20230327163203.2918455-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_093220_496790_F79B433B 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, heiko@sntech.de, Atish Patra <atishp@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, vineetg@rivosinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, slewis@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---

Changes in v5:
 - Added tags

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
index 8400f0cc9704..dafd0caa4f1d 100644
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
