Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F7C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxjmRgP7jsMoIGLMKCmVft29zJgqPl5zTc6/idZZtJE=; b=2UEA2rSculTgDz
	5LEDPAiH9BcO6Lze9434jXshj1fMxjFliC7VShIQqX8A1G2eg7LhB+5yjtqsYw//tSnQ+YaAC7+ZE
	OeZYbGhHL9coGORZ2rTJKUiOvf9uvGKb8yIJ+XgedCZt1J8W5M0PSKn9jFM3OUve8WrZMeccwFAvJ
	7+2A+RTOgCx4KFw2jvL99hrdEYIAp3JHPBQyA26olbBmqKsmuvCo2i42x5UXRq3Fjf6mkszumC8Qq
	pTZtKAr3oPtMEKN9ma9Q3Tge6DHtKcyD9BblEu6c4fsjttg9B4S+5sverDjoGMPI5gI9CeQ5tObLY
	cSLMmPJDpN2VLtptfsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRX2-004b5p-Se; Fri, 13 Jan 2023 21:24:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWl-004axP-QO
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:24:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRWk-0003WV-Ci; Fri, 13 Jan 2023 22:23:54 +0100
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
Subject: [PATCH 1/4] RISC-V: use bit-values instead of numbers to identify patched cpu-features
Date: Fri, 13 Jan 2023 22:23:48 +0100
Message-Id: <20230113212351.3534769-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230113212351.3534769-1-heiko@sntech.de>
References: <20230113212351.3534769-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132355_904221_BB216F17 
X-CRM114-Status: GOOD (  13.36  )
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

RISC-V cpufeatures are often based on available extensions and maybe even
some combination of them. Using a bitfield for the errata-id gives us a
simple way to also require a combination of extensions for a specific
alternative patch.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/errata_list.h |  6 +++---
 arch/riscv/kernel/cpufeature.c       | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 95e626b7281e..40c9e9c3295b 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -22,9 +22,9 @@
 #define	ERRATA_THEAD_NUMBER 3
 #endif
 
-#define	CPUFEATURE_SVPBMT 0
-#define	CPUFEATURE_ZICBOM 1
-#define	CPUFEATURE_ZBB 2
+#define	CPUFEATURE_SVPBMT 	(1 << 0)
+#define	CPUFEATURE_ZICBOM	(1 << 1)
+#define	CPUFEATURE_ZBB		(1 << 2)
 #define	CPUFEATURE_NUMBER 3
 
 #ifdef __ASSEMBLY__
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7bfc6eb9a5cf..8c83bd9d0e22 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -350,13 +350,13 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
 	u32 cpu_req_feature = 0;
 
 	if (cpufeature_probe_svpbmt(stage))
-		cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
+		cpu_req_feature |= CPUFEATURE_SVPBMT;
 
 	if (cpufeature_probe_zicbom(stage))
-		cpu_req_feature |= BIT(CPUFEATURE_ZICBOM);
+		cpu_req_feature |= CPUFEATURE_ZICBOM;
 
 	if (cpufeature_probe_zbb(stage))
-		cpu_req_feature |= BIT(CPUFEATURE_ZBB);
+		cpu_req_feature |= CPUFEATURE_ZBB;
 
 	return cpu_req_feature;
 }
@@ -367,19 +367,17 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 {
 	u32 cpu_req_feature = cpufeature_probe(stage);
 	struct alt_entry *alt;
-	u32 tmp;
 
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->errata_id >= CPUFEATURE_NUMBER) {
+		if (alt->errata_id & GENMASK(31, CPUFEATURE_NUMBER)) {
 			WARN(1, "This feature id:%d is not in kernel cpufeature list",
 				alt->errata_id);
 			continue;
 		}
 
-		tmp = (1U << alt->errata_id);
-		if (cpu_req_feature & tmp) {
+		if ((cpu_req_feature & alt->errata_id) == alt->errata_id) {
 			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
 			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
 						      alt->old_ptr - alt->alt_ptr);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
