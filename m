Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF89E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG+Ec7u2Himl2ugC1KvwZkWkskWhLZzRwa8yGtb5uc8=; b=ks3CGBR+hwp1Lj
	csUxwJ5M4q9HQAYheHRYUXVjWi3E98X+5M98uq8nXj6pLkKOxEgvchv6fcAcZfVdsCbeNCW4qFsYA
	oWnN1IZlS5xfdEhnBVcFsm8s9wKgNUbpTUg+l/wggAGOiSBnQZAlVWbLllRiH/29WP1QYC0BSQT4J
	z8FROiebheYKs1DbW4nApjJeCTLCzYV/tPaLOKQZDpYmEI7kacwYyDroIr5JEoqi8Nrt72k4mqYO6
	sZluthELyl9j7KrRBQU2n2F8jKBnnBzFl4IH9opymup0Ho97CdK7jjoaxL4snLYOGNp6KIlqC5g25
	oHMWTSXy7pWo4Q/u8bWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAl-00000006TaG-1Sku;
	Sat, 14 Dec 2024 14:31:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTAj-00000006TZf-1QvZ
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 14:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8806BA40484;
	Sat, 14 Dec 2024 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB33DC4CED1;
	Sat, 14 Dec 2024 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734186668;
	bh=ot1bZWRhxXQjgYisV+ilgyR2+rvp4CLLEjM5WVVXLK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHahqYS2Oeqr+QjAlTYuerJqvalUkbbATf9gwvX5b7/YF+7pBA7Ipgfrfq9ekDM7Y
	 fxs9siyprKtBnQUuM2ZFKTcG5mv6ovcFZvcnaARFlER4gnhfNhiPdUPz6jr0RRdzQq
	 ILWRxi/k8t+oNiJ5amk1Ge+Rgn+RxOek7xzOviyGTunPpBbl7/vdSECjK2/t4yKTEi
	 ChFVklDmVN/+atosTjTQSiV2HhdR8wx5YK1qdsFy/DfgLLQ9vqMVTnG5jHSZLVydlz
	 7Ao7ECMiyoFjel5liIv18Qb0OxiFMla1+ep9sYnWF/1/uSp2QoMrp+3xwXFFKsIjIU
	 3DkspyI3IhbTQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	conor@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	bjorn@rivosinc.com,
	leobras@redhat.com,
	corbet@lwn.net,
	peterlin@andestech.com,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/2] riscv: Move vendor errata definitions into vendorid_list.h
Date: Sat, 14 Dec 2024 09:30:38 -0500
Message-Id: <20241214143039.4139398-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241214143039.4139398-1-guoren@kernel.org>
References: <20241214143039.4139398-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_063109_449821_ED96522D 
X-CRM114-Status: UNSURE (   6.98  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Move vendor errata definitions into vendorid_list and make it re-useable
for other header files.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/errata_list.h   | 17 -----------------
 arch/riscv/include/asm/vendorid_list.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 7c8a71a526a3..589a3ebe2ae2 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -11,23 +11,6 @@
 #include <asm/hwcap.h>
 #include <asm/vendorid_list.h>
 
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
-#define	ERRATA_THEAD_NUMBER 2
-#endif
-
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..7a387368633a 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,4 +9,21 @@
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
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
+#define	ERRATA_THEAD_NUMBER 2
+#endif
+
 #endif
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
