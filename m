Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65360C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 20:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at2b/8dCsoMXH80oad+W8P2OAbPCCb4Jryudms884TY=; b=A1F+525ohwdj+B
	ty2e9OHUngeP5LRjdK/RKR+tDooIB9rVnWRT3fIJTf3mPoKcGrRZ4s12FZa6Z1TEPa+sTieeRrh3s
	WCAmBTs6eL1b1hZQu38XhmRNfxqFtFcwqu20iAjuHOoJsvD6eM8Ccx+fYUBxeoE/UsI6unATAcC7A
	A5HLDmSZs1boORxBAuDXWwsNfktDuphPGtTRItHlA3xb0Uf2a2TQL2n4ODPuo9cet+VUeMgmmps/s
	qMAz3sNm8FNuDpKCMkuOANAYZNT1wS/0yV747G+GlXzDann6maXsAa555cHRDE5UcTTSer3Ms3Zqa
	s35J8ok3Ye1pxF+VvIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRKPP-001ZXd-Gv; Mon, 07 Mar 2022 20:56:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRKPM-001ZVl-E1
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 20:56:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nRKM6-0002DJ-9K; Mon, 07 Mar 2022 21:53:22 +0100
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
Subject: [PATCH v7 10/13] riscv: add cpufeature handling via alternatives
Date: Mon,  7 Mar 2022 21:53:07 +0100
Message-Id: <20220307205310.1905628-11-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307205310.1905628-1-heiko@sntech.de>
References: <20220307205310.1905628-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_125644_513244_F1A16007 
X-CRM114-Status: GOOD (  18.15  )
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

Some cpufeatures should be handled via the alternatives mechanism
to not incur penalties on unsupporting variants.

So add a mechanism to handle these similar to cpu erratas.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/alternative.h |  3 ++
 arch/riscv/include/asm/errata_list.h |  2 +
 arch/riscv/kernel/alternative.c      |  2 +
 arch/riscv/kernel/cpufeature.c       | 57 +++++++++++++++++++++++++++-
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index f0657b1b3174..cf3b22173834 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -39,5 +39,8 @@ struct errata_checkfunc_id {
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
+
+void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				 unsigned int stage);
 #endif
 #endif
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 5f1046e82d9f..6b95bd9aee82 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -14,6 +14,8 @@
 #define	ERRATA_SIFIVE_NUMBER 2
 #endif
 
+#define	CPUFEATURE_NUMBER 0
+
 #ifdef __ASSEMBLY__
 
 #define ALT_INSN_FAULT(x)						\
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 223770b3945c..e6c9de9f9ba6 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -63,6 +63,8 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 						 struct alt_entry *end,
 						 unsigned int stage)
 {
+	riscv_cpufeature_patch_func(begin, end, stage);
+
 	if (!vendor_patch_func)
 		return;
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f3a4b0619aa0..92d4b4c25d47 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -8,9 +8,14 @@
 
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
+#include <linux/module.h>
 #include <linux/of.h>
-#include <asm/processor.h>
+#include <asm/alternative.h>
+#include <asm/errata_list.h>
 #include <asm/hwcap.h>
+#include <asm/patch.h>
+#include <asm/pgtable.h>
+#include <asm/processor.h>
 #include <asm/smp.h>
 #include <asm/switch_to.h>
 
@@ -237,3 +242,53 @@ void __init riscv_fill_hwcap(void)
 		static_branch_enable(&cpu_hwcap_fpu);
 #endif
 }
+
+struct cpufeature_info {
+	char name[ERRATA_STRING_LENGTH_MAX];
+	bool (*check_func)(unsigned int stage);
+};
+
+static const struct cpufeature_info __initdata_or_module cpufeature_list[CPUFEATURE_NUMBER] = {
+};
+
+static u32 __init_or_module cpufeature_probe(unsigned int stage)
+{
+	const struct cpufeature_info *info;
+	u32 cpu_req_feature = 0;
+	int idx;
+
+	for (idx = 0; idx < CPUFEATURE_NUMBER; idx++) {
+		info = &cpufeature_list[idx];
+
+		if (info->check_func(stage))
+			cpu_req_feature |= (1U << idx);
+	}
+
+	return cpu_req_feature;
+}
+
+void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
+						  struct alt_entry *end,
+						  unsigned int stage)
+{
+	u32 cpu_req_feature = cpufeature_probe(stage);
+	u32 cpu_apply_feature = 0;
+	struct alt_entry *alt;
+	u32 tmp;
+
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != 0)
+			continue;
+		if (alt->errata_id >= CPUFEATURE_NUMBER) {
+			WARN(1, "This feature id:%d is not in kernel cpufeature list",
+				alt->errata_id);
+			continue;
+		}
+
+		tmp = (1U << alt->errata_id);
+		if (cpu_req_feature & tmp) {
+			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			cpu_apply_feature |= tmp;
+		}
+	}
+}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
