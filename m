Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FAFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBJpefPUh4n/ieI8Pg5r2yUcZnXzC1v88wys0d+c+Yo=; b=4fWhIxLct/ThBN
	hy1yLQ1qdn8VPDhONxKut0KlRIXcCbwixYaY3UPdonQH/ZHhLTb7UPJ88qJoAow1qJdsO1gHirF0q
	o8Udh+rNie27YfD5IZxLD/RqLJrRURQ1qPHmlRaobXwrETqeoTU8y5Wci8DP7PnKIYnBPGZl7kjL7
	fzKfZR6QXINKt75w+nz0ijU6KjJc3Se4ZxVQG+U8DXsnK83pgOaeAJ0zp8jAePgnPHqIgs5GsDZWp
	cB4mr6svo7sf8JuKZAixBXfrzV9W4Ax05eF+zvd6oWWI+BgfrBdMChb4o38eHCc5Os30fkg5dH1Aj
	74+mS9FRw8EGxm5tmqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmF1-0002Cj-EB; Wed, 09 Feb 2022 12:38:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmEt-00027x-AB
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:38:30 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEm-0001Mv-8u; Wed, 09 Feb 2022 13:38:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v6 04/14] riscv: implement module alternatives
Date: Wed,  9 Feb 2022 13:37:50 +0100
Message-Id: <20220209123800.269774-5-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_043827_413884_0F3AD2C3 
X-CRM114-Status: GOOD (  17.53  )
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
 arch/riscv/include/asm/alternative.h |  3 ++-
 arch/riscv/kernel/alternative.c      | 18 +++++++++++++----
 arch/riscv/kernel/module.c           | 29 ++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 5 deletions(-)

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
index 68a9e3d1fe16..a778abd5b8b9 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -11,6 +11,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sizes.h>
 #include <linux/pgtable.h>
+#include <asm/alternative.h>
 #include <asm/sections.h>
 
 static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
@@ -416,3 +417,31 @@ void *module_alloc(unsigned long size)
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
