Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA3AC83F1D
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Nokl56LfbWkq+LRYW41EZ4L2weajQI5H3fyf/pD9G8=; b=K3Wdlg3mUHV0jH
	8rVhl8o7zmZcC8OKVi9Aqgwrj+rdp2mfBPn2pT9+RJGNxaklyI191ehXue0FF3/ErjFM7DsK7HUoT
	Jhm53y3oZQV7sRs1w0nxrgxwJlpQbuZiGWRUvxGOI8Ts/USyIkKoTdAI5Tjt2jAAm7GMcRr/hb+0p
	P6ZukQulVMR1OcstlAUQFqybvn6RTUX6ZLdMzMPL88t2qrPrDWqm5DjqmH2+JcoMSqTrKkRBtlaRu
	UgP3KmUA2KGAEmiJ+bpPXErPiIRYPp6ZdQoWuYM3BzKopyvzdPCdOYRjftqQK7b4W+P1y3A4iEqmL
	vwvHt6/GJr3SkrxmCkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaz1O-00000000LDS-1Hcy;
	Sun, 13 Jul 2025 15:53:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaz1M-00000000LCr-0Kpl
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 15:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED892A4FE8E;
	Sun, 13 Jul 2025 15:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123D0C4CEF8;
	Sun, 13 Jul 2025 15:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752422022;
	bh=Cqc5//1m2maOwm2HqoVNQT8UubcKcYojQ6LRXW5C2TI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PsaBkIjQX1uFTFpJYFGZRixiM3tZmDdbQfTKFjZmIM9VHFqsH5BK4oPlBlCwRqyzX
	 6dARtro6O+SqxdJc7+9plVD2xztnB0AkXF1vB/PjDnPEsAILqfRhsqLjapj86AHnuy
	 hrH4HndSrptzCbWz3MYt9LH/ibB5Zj1Xr2/MfTCDcHOFjOsSBlA+rNTCL1aPy6Knkc
	 Y0rPiwojcA6Kd5CkPSolQe0NWs+8/s7UWUYvitMiijVeZDgtXU8A+IrtzhujUJ+8Em
	 hssztG/cAp5axo6983MpuIqKYDNw2ZyDNryzXXllyxszzY2Lmjb/QN6Ev5jBArXebX
	 VA8fWQj6EKlJg==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com,
	paul.walmsley@sifive.com,
	bjorn@rivosinc.com,
	eobras@redhat.com,
	corbet@lwn.net,
	peterlin@andestech.com,
	rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] riscv: Move vendor errata definitions to new header
Date: Sun, 13 Jul 2025 11:53:20 -0400
Message-Id: <20250713155321.2064856-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250713155321.2064856-1-guoren@kernel.org>
References: <20250713155321.2064856-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_085344_185145_3BFAAB93 
X-CRM114-Status: GOOD (  10.22  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Move vendor errata definitions into errata_list_vendors.h.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/errata_list.h         | 19 +---------------
 arch/riscv/include/asm/errata_list_vendors.h | 24 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/include/asm/errata_list_vendors.h

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 6e426ed7919a..18c9f7ee9b7c 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -10,24 +10,7 @@
 #include <asm/insn-def.h>
 #include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
-
-#ifdef CONFIG_ERRATA_ANDES
-#define ERRATA_ANDES_NO_IOCP 0
-#define ERRATA_ANDES_NUMBER 1
-#endif
-
-#ifdef CONFIG_ERRATA_SIFIVE
-#define	ERRATA_SIFIVE_CIP_453 0
-#define	ERRATA_SIFIVE_CIP_1200 1
-#define	ERRATA_SIFIVE_NUMBER 2
-#endif
-
-#ifdef CONFIG_ERRATA_THEAD
-#define	ERRATA_THEAD_MAE 0
-#define	ERRATA_THEAD_PMU 1
-#define	ERRATA_THEAD_GHOSTWRITE 2
-#define	ERRATA_THEAD_NUMBER 3
-#endif
+#include <asm/errata_list_vendors.h>
 
 #ifdef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
new file mode 100644
index 000000000000..a37d1558f39f
--- /dev/null
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_ERRATA_LIST_VENDORS_H
+#define ASM_ERRATA_LIST_VENDORS_H
+
+#ifdef CONFIG_ERRATA_ANDES
+#define ERRATA_ANDES_NO_IOCP 0
+#define ERRATA_ANDES_NUMBER 1
+#endif
+
+#ifdef CONFIG_ERRATA_SIFIVE
+#define	ERRATA_SIFIVE_CIP_453 0
+#define	ERRATA_SIFIVE_CIP_1200 1
+#define	ERRATA_SIFIVE_NUMBER 2
+#endif
+
+#ifdef CONFIG_ERRATA_THEAD
+#define	ERRATA_THEAD_MAE 0
+#define	ERRATA_THEAD_PMU 1
+#define	ERRATA_THEAD_GHOSTWRITE 2
+#define	ERRATA_THEAD_NUMBER 3
+#endif
+
+#endif
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
