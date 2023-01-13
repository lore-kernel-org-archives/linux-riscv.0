Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF644C3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kVUKIdCgGUHo3iDEcCQW6Ym60YvS2bqoWcmPHxJFPD8=; b=caK6Pnf7aTTfxf
	bE5lPOw9e8dW9CEiWrgqmFxz9+y750wRyPROb6hdzmI+3pNfC1wc3EKgzqZNqFVviaMM0xaonwgFU
	bKdRJyx3yie6hinozTAWWjId4OqEYZ3dQUx7XOS71Y4uWwxPViiiIe6tJx9XO9LYt9ImkpI63QptR
	Z6jbHB3K+N9I6FooPLDIwSPN8X2wd6VR1CmSASP+BXmMm0l1jYLwqVlEFrgWuZQJmyAB7TSoMoryz
	0YMv9aHAtD8aohJNyL/L0BWYSVPsEqop5RVWzftT2djy3OEmznv2L0YcieZ6FdPRMVaTmdoc2KCUf
	Pko+1v0xc5+DDdJHN9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRXD-004bAl-MA; Fri, 13 Jan 2023 21:24:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWm-004axd-N8
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:24:02 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRWl-0003WV-2N; Fri, 13 Jan 2023 22:23:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 3/4] RISC-V: add cpufeature probing for fast-unaligned access
Date: Fri, 13 Jan 2023 22:23:50 +0100
Message-Id: <20230113212351.3534769-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113212351.3534769-1-heiko@sntech.de>
References: <20230113212351.3534769-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132356_813413_2ACCF95A 
X-CRM114-Status: GOOD (  12.28  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Use the recently added misaligned access descriptor and derive a cpufeature
id from it so that it can be used in alternative patches.

We assume slow unaligned access if any cpu-core does not support fast
access.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/errata_list.h |  9 +++++----
 arch/riscv/kernel/cpufeature.c       | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 043b79c79824..6ce0c22ae994 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -22,10 +22,11 @@
 #define	ERRATA_THEAD_NUMBER 3
 #endif
 
-#define	CPUFEATURE_SVPBMT 	(1 << 0)
-#define	CPUFEATURE_ZICBOM	(1 << 1)
-#define	CPUFEATURE_ZBB		(1 << 2)
-#define	CPUFEATURE_NUMBER 3
+#define	CPUFEATURE_SVPBMT 		(1 << 0)
+#define	CPUFEATURE_ZICBOM		(1 << 1)
+#define	CPUFEATURE_ZBB			(1 << 2)
+#define	CPUFEATURE_FAST_UNALIGNED	(1 << 3)
+#define	CPUFEATURE_NUMBER		4
 
 #ifdef __ASSEMBLY__
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a65bebdadb68..640b78f6aaa9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -337,6 +337,23 @@ static bool __init_or_module cpufeature_probe_zbb(unsigned int stage)
 	return true;
 }
 
+static bool __init_or_module cpufeature_probe_fast_unaligned(unsigned int stage)
+{
+	int cpu;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	for_each_possible_cpu(cpu) {
+		long perf = per_cpu(misaligned_access_speed, cpu);
+
+		if (perf != RISCV_HWPROBE_MISALIGNED_FAST)
+			return false;
+	}
+
+	return true;
+}
+
 /*
  * Probe presence of individual extensions.
  *
@@ -358,6 +375,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	if (cpufeature_probe_zbb(stage))
 		cpu_req_feature |= CPUFEATURE_ZBB;
 
+	if (cpufeature_probe_fast_unaligned(stage))
+		cpu_req_feature |= CPUFEATURE_FAST_UNALIGNED;
+
 	return cpu_req_feature;
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
