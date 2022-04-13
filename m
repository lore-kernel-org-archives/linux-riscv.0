Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233D2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8BTsAHStdQsUqLIbdsR3FsBhTpZEn7nB0j2kLR8c0k=; b=tgitrzu/QMLDDD
	ze5l0AehYxJnuCkjO3J0dBDyz5amBpG9Kyazk1LkHJJy/06KPl5dLWumQFuK4JcKiAUKlD+NdOCnp
	xsGa7EBaUWbPKHojHqN6FGFBKHIR0Aqrj1/fus7AQcNuuF/VwIuKZ0OaqVB8JMqr7hXwMWHidWnJr
	qXUfJGN9CYe063p3mjNKJtX4KMvQyaEsS1NULUPXxERC2IQClEp+1wSWfckJjhbD3XYKIAmo9ZY3B
	GKo+L4In4V14BHsjGqeMsGGUt7c3VoD29eDWLaHRJ0ZJs7VsRBQLY+CIjIe9tW2TiAI73QsLkoR7W
	Cdo2YK1f9eBmMd0SaXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neTIG-00GTxu-4G; Wed, 13 Apr 2022 03:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTI3-00GTpQ-Oo
 for linux-riscv@bombadil.infradead.org; Wed, 13 Apr 2022 03:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=P2X/38vuOtj42k17r2FDnrsKyH1Vg+hIBc2+ifQG6mc=; b=Lg1czBaRlWu1TWvJHdEva2wGp4
 THfTXMU7ozxA80lRx7ZQk/7aPxv3+2Q+yII7aUttruKKChDZFS0qGibHt33qI8MVLRtunTDVFYCuH
 LKBKlJEt09krjYq2p5Qu+UMXerPTsoKaAfDNzISdgOp04BnnpmkrKbltai3qXW0inPmVHPNwddqCj
 G/JyRc0MrXTWsYzlz1F6SWyrATzXKKbG+zxyPF7EvJjqKDGue+sdBzSZvjJ+6KpAg9hswMUjtak9G
 j//MSvYl4Xcrc+W8Yn//zXQLNWzVSC1bdRW/4Q7Wm7dUVB1p2GPZ3FJ1Rkl04ZN/DaHaBYXJ3FGmu
 BIa8uDJg==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTHz-004WXd-Io
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 03:03:29 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1neTHn-0006sN-K1; Wed, 13 Apr 2022 05:03:15 +0200
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
Subject: [PATCH v9 02/12] riscv: allow different stages with alternatives
Date: Wed, 13 Apr 2022 05:02:57 +0200
Message-Id: <20220413030307.133807-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413030307.133807-1-heiko@sntech.de>
References: <20220413030307.133807-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_040327_868198_726E8485 
X-CRM114-Status: GOOD (  15.75  )
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
index 7b42bcef0ecf..0ff550667e94 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -19,6 +19,8 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
+#define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
+
 void __init apply_boot_alternatives(void);
 
 struct alt_entry {
@@ -35,7 +37,8 @@ struct errata_checkfunc_id {
 };
 
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
-			      unsigned long archid, unsigned long impid);
+			      unsigned long archid, unsigned long impid,
+			      unsigned int stage);
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
 
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
