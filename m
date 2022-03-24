Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72939C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 00:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39NSpaNlWIcPGB4rfbpBheVperc1FRfRqx9tdep7FPI=; b=eMFpmmPKjPTR3Q
	JcyWGJeDY1ap9+oly/RzV2Kh2zBcLr5H52/ZRhEZjW1+oGV1yD5PcmfCNKNnUTrSMn1NhE2S1mG1K
	Z6HMO4bQQVIlNRapaSLFe38e7nydV91lNwPGOGXfTniuYOtvmxgXy6+PQP1MUDcgsBLiJhg43+C6R
	3WzzUpWr2/jTuUbBhZp+NlGqUk7N6cMrUsFbs5kwDSocM5it1cI/P5RuMbbhxVzsNca2IOikw3BhO
	XO/HIWjCzUIw2nealSgv+g3wsgky02vogfit07j4qtp/Kw32lxbc2HJ0H5K9CeL+5wd84IYnF0TCq
	TMf512E+97DtAm/TAukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXB3o-00FB7x-D5; Thu, 24 Mar 2022 00:10:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXB3l-00FB6t-NI
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 00:10:39 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nXB0u-00055s-8y; Thu, 24 Mar 2022 01:07:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v8 13/14] riscv: don't use global static vars to store
 alternative data
Date: Thu, 24 Mar 2022 01:07:09 +0100
Message-Id: <20220324000710.575331-14-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
References: <20220324000710.575331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_171037_783858_58139A7A 
X-CRM114-Status: GOOD (  14.96  )
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

Right now the code uses a global struct to store vendor-ids
and another global variable to store the vendor-patch-function.

There exist specific cases where we'll need to patch the kernel
at an even earlier stage, where trying to write to a static
variable might actually result in hangs.

Also collecting the vendor-information consists of 3 sbi-ecalls
(or csr-reads) which is pretty negligible in the context of
booting a kernel.

So rework the code to not rely on static variables and instead
collect the vendor-information when a round of alternatives is
to be applied.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/alternative.c | 51 ++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index e6c9de9f9ba6..27f722ae452b 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -16,41 +16,35 @@
 #include <asm/sbi.h>
 #include <asm/csr.h>
 
-static struct cpu_manufacturer_info_t {
+struct cpu_manufacturer_info_t {
 	unsigned long vendor_id;
 	unsigned long arch_id;
 	unsigned long imp_id;
-} cpu_mfr_info;
+	void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
+				  unsigned long archid, unsigned long impid,
+				  unsigned int stage);
+};
 
-static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
-				 unsigned long archid, unsigned long impid,
-				 unsigned int stage) __initdata_or_module;
-
-static inline void __init riscv_fill_cpu_mfr_info(void)
+static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info)
 {
 #ifdef CONFIG_RISCV_M_MODE
-	cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
-	cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
-	cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
+	cpu_mfr_info->vendor_id = csr_read(CSR_MVENDORID);
+	cpu_mfr_info->arch_id = csr_read(CSR_MARCHID);
+	cpu_mfr_info->imp_id = csr_read(CSR_MIMPID);
 #else
-	cpu_mfr_info.vendor_id = sbi_get_mvendorid();
-	cpu_mfr_info.arch_id = sbi_get_marchid();
-	cpu_mfr_info.imp_id = sbi_get_mimpid();
+	cpu_mfr_info->vendor_id = sbi_get_mvendorid();
+	cpu_mfr_info->arch_id = sbi_get_marchid();
+	cpu_mfr_info->imp_id = sbi_get_mimpid();
 #endif
-}
-
-static void __init init_alternative(void)
-{
-	riscv_fill_cpu_mfr_info();
 
-	switch (cpu_mfr_info.vendor_id) {
+	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_SIFIVE
 	case SIFIVE_VENDOR_ID:
-		vendor_patch_func = sifive_errata_patch_func;
+		cpu_mfr_info->vendor_patch_func = sifive_errata_patch_func;
 		break;
 #endif
 	default:
-		vendor_patch_func = NULL;
+		cpu_mfr_info->vendor_patch_func = NULL;
 	}
 }
 
@@ -63,14 +57,19 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 						 struct alt_entry *end,
 						 unsigned int stage)
 {
+	struct cpu_manufacturer_info_t cpu_mfr_info;
+
+	riscv_fill_cpu_mfr_info(&cpu_mfr_info);
+
 	riscv_cpufeature_patch_func(begin, end, stage);
 
-	if (!vendor_patch_func)
+	if (!cpu_mfr_info.vendor_patch_func)
 		return;
 
-	vendor_patch_func(begin, end,
-			  cpu_mfr_info.arch_id, cpu_mfr_info.imp_id,
-			  stage);
+	cpu_mfr_info.vendor_patch_func(begin, end,
+				   cpu_mfr_info.arch_id,
+				   cpu_mfr_info.imp_id,
+				   stage);
 }
 
 void __init apply_boot_alternatives(void)
@@ -78,8 +77,6 @@ void __init apply_boot_alternatives(void)
 	/* If called on non-boot cpu things could go wrong */
 	WARN_ON(smp_processor_id() != 0);
 
-	init_alternative();
-
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
