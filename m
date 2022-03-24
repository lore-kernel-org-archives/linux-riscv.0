Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F92EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5pFla3gQnSUSrYFPewgDQ6VyNM4yXJAHgeSpgCAXbU=; b=oZy26rCTWPYJ2y
	aBIQkgvjDu1eTnYCTAtPJt6BZ8oRYHx7kY76ROURhIFynB00TJmG3j6kgpSPeY1rH098RGYJdUuHz
	GzV7xrFZ/r/8qP1iF3yjM9IgMxsctOvbcS+l+Mi8pj07/2voZfRruVHFTQUU/HE35lOFv3X3sNrF5
	A0WRKm+YNTHXNJHGhxaCBANARzdOqwJuCoYLwn1LtCDv2EJumnmIxLV1DT1smcLoyjSTpwzfmVG7t
	5SWInlOowEh0YykC+m2oYLZzkALn8m3ZCYVPI9jgz612agp5LMGNWFEEvGyPrJolJPzEyjOZ1cUJX
	S+K+Z4sgnZh5FXMsfdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXB11-00F9ft-6z; Thu, 24 Mar 2022 00:07:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXB0s-00F9b7-ER
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 00:07:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nXB0m-00055s-Dr; Thu, 24 Mar 2022 01:07:32 +0100
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
Subject: [PATCH v8 03/14] riscv: allow different stages with alternatives
Date: Thu, 24 Mar 2022 01:06:59 +0100
Message-Id: <20220324000710.575331-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
References: <20220324000710.575331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_170738_549152_4D1B948A 
X-CRM114-Status: GOOD (  15.93  )
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

Future features may need to be applied at a different
time during boot, so allow defining stages for alternatives
and handling them differently depending on the stage.

Also make the alternatives-location more flexible so that
future stages may provide their own location.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/sifive/errata.c    |  3 ++-
 arch/riscv/include/asm/alternative.h |  5 ++++-
 arch/riscv/kernel/alternative.c      | 26 +++++++++++++++++---------
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index f5e5ae70e829..4fe03ac41fd7 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -80,7 +80,8 @@ static void __init warn_miss_errata(u32 miss_errata)
 }
 
 void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
-				     unsigned long archid, unsigned long impid)
+				     unsigned long archid, unsigned long impid,
+				     unsigned int stage)
 {
 	struct alt_entry *alt;
 	u32 cpu_req_errata = sifive_errata_probe(archid, impid);
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index e625d3cafbed..811bdd8027db 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -17,6 +17,8 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
+#define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
+
 void __init apply_boot_alternatives(void);
 
 struct alt_entry {
@@ -33,7 +35,8 @@ struct errata_checkfunc_id {
 };
 
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
-			      unsigned long archid, unsigned long impid);
+			      unsigned long archid, unsigned long impid,
+			      unsigned int stage);
 
 #endif
 #endif
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index e8b4a0fe488c..02db62f55bac 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -22,8 +22,8 @@ static struct cpu_manufacturer_info_t {
 } cpu_mfr_info;
 
 static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
-				 unsigned long archid,
-				 unsigned long impid) __initdata;
+				 unsigned long archid, unsigned long impid,
+				 unsigned int stage) __initdata;
 
 static inline void __init riscv_fill_cpu_mfr_info(void)
 {
@@ -58,6 +58,18 @@ static void __init init_alternative(void)
  * a feature detect on the boot CPU). No need to worry about other CPUs
  * here.
  */
+static void __init _apply_alternatives(struct alt_entry *begin,
+				       struct alt_entry *end,
+				       unsigned int stage)
+{
+	if (!vendor_patch_func)
+		return;
+
+	vendor_patch_func(begin, end,
+			  cpu_mfr_info.arch_id, cpu_mfr_info.imp_id,
+			  stage);
+}
+
 void __init apply_boot_alternatives(void)
 {
 	/* If called on non-boot cpu things could go wrong */
@@ -65,11 +77,7 @@ void __init apply_boot_alternatives(void)
 
 	init_alternative();
 
-	if (!vendor_patch_func)
-		return;
-
-	vendor_patch_func((struct alt_entry *)__alt_start,
-			  (struct alt_entry *)__alt_end,
-			  cpu_mfr_info.arch_id, cpu_mfr_info.imp_id);
+	_apply_alternatives((struct alt_entry *)__alt_start,
+			    (struct alt_entry *)__alt_end,
+			    RISCV_ALTERNATIVES_BOOT);
 }
-
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
