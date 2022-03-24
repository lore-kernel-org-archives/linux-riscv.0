Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10905C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 00:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDRt0GvDyWRst0k7OMhrZIiNbd3N2/mGGf+UXFioPsI=; b=UZ/e8cC6CYG+bc
	t/yDRWh2371nLfNRh9+UFi3LMqligMV+bLNSRz/Jbh6dYFQwyL3gV0I1HD/k+bk9zy7cEf7rk+z+h
	SaXUM3uD+ATWCPvmir5jwt5Z9rAvvFzhpodQHPf2zHRA+cUt8ZzipdH3r9bqqqQxjgufiAOB2JKK8
	5rkA8X+kxgU2xUj3UzYFhyXlOpPAgrNqlFce5+l8HbpaZhVsmR68biVsSk8dWxTwKiEnmPXxJTTAb
	hmbhX5oJW3iixszPOs7ekAZ9R0mTarfFhcVWlX664bS5Tzj6ci3n4PV1V7ptc5bxCUeWzfnqdBz9W
	HCMQcaEJd6DZU0EeV6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXB15-00F9hc-FV; Thu, 24 Mar 2022 00:07:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXB0s-00F9b3-EW
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 00:07:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nXB0n-00055s-5z; Thu, 24 Mar 2022 01:07:33 +0100
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
Subject: [PATCH v8 04/14] riscv: implement module alternatives
Date: Thu, 24 Mar 2022 01:07:00 +0100
Message-Id: <20220324000710.575331-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
References: <20220324000710.575331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_170738_653516_E1D4D64C 
X-CRM114-Status: GOOD (  18.65  )
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

This allows alternatives to also be applied when loading modules
and follows the implementation of other architectures (e.g. arm64).

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/sifive/errata.c    |  7 ++++---
 arch/riscv/include/asm/alternative.h |  3 ++-
 arch/riscv/kernel/alternative.c      | 18 +++++++++++++----
 arch/riscv/kernel/module.c           | 29 ++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 4fe03ac41fd7..42457efcaaa3 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/string.h>
 #include <linux/bug.h>
 #include <asm/patch.h>
@@ -54,7 +55,7 @@ static struct errata_info_t errata_list[ERRATA_SIFIVE_NUMBER] = {
 	},
 };
 
-static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
+static u32 __init_or_module sifive_errata_probe(unsigned long archid, unsigned long impid)
 {
 	int idx;
 	u32 cpu_req_errata = 0;
@@ -66,7 +67,7 @@ static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
 	return cpu_req_errata;
 }
 
-static void __init warn_miss_errata(u32 miss_errata)
+static void __init_or_module warn_miss_errata(u32 miss_errata)
 {
 	int i;
 
@@ -79,7 +80,7 @@ static void __init warn_miss_errata(u32 miss_errata)
 	pr_warn("----------------------------------------------------------------\n");
 }
 
-void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+void __init_or_module sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				     unsigned long archid, unsigned long impid,
 				     unsigned int stage)
 {
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 811bdd8027db..f0657b1b3174 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -18,8 +18,10 @@
 #include <asm/hwcap.h>
 
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
+#define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 
 void __init apply_boot_alternatives(void);
+void apply_module_alternatives(void *start, size_t length);
 
 struct alt_entry {
 	void *old_ptr;		 /* address of original instruciton or data  */
@@ -37,6 +39,5 @@ struct errata_checkfunc_id {
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
-
 #endif
 #endif
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 02db62f55bac..223770b3945c 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/cpu.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
@@ -23,7 +24,7 @@ static struct cpu_manufacturer_info_t {
 
 static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned long archid, unsigned long impid,
-				 unsigned int stage) __initdata;
+				 unsigned int stage) __initdata_or_module;
 
 static inline void __init riscv_fill_cpu_mfr_info(void)
 {
@@ -58,9 +59,9 @@ static void __init init_alternative(void)
  * a feature detect on the boot CPU). No need to worry about other CPUs
  * here.
  */
-static void __init _apply_alternatives(struct alt_entry *begin,
-				       struct alt_entry *end,
-				       unsigned int stage)
+static void __init_or_module _apply_alternatives(struct alt_entry *begin,
+						 struct alt_entry *end,
+						 unsigned int stage)
 {
 	if (!vendor_patch_func)
 		return;
@@ -81,3 +82,12 @@ void __init apply_boot_alternatives(void)
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
 }
+
+#ifdef CONFIG_MODULES
+void apply_module_alternatives(void *start, size_t length)
+{
+	_apply_alternatives((struct alt_entry *)start,
+			    (struct alt_entry *)(start + length),
+			    RISCV_ALTERNATIVES_MODULE);
+}
+#endif
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 4a48287513c3..823b7ad47c9a 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -11,6 +11,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
+#include <asm/alternative.h>
 #include <asm/sections.h>
 
 /*
@@ -427,3 +428,31 @@ void *module_alloc(unsigned long size)
 				    __builtin_return_address(0));
 }
 #endif
+
+static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
+				    const Elf_Shdr *sechdrs,
+				    const char *name)
+{
+	const Elf_Shdr *s, *se;
+	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
+		if (strcmp(name, secstrs + s->sh_name) == 0)
+			return s;
+	}
+
+	return NULL;
+}
+
+int module_finalize(const Elf_Ehdr *hdr,
+		    const Elf_Shdr *sechdrs,
+		    struct module *me)
+{
+	const Elf_Shdr *s;
+
+	s = find_section(hdr, sechdrs, ".alternative");
+	if (s)
+		apply_module_alternatives((void *)s->sh_addr, s->sh_size);
+
+	return 0;
+}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
