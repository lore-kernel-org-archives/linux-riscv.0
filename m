Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6713EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jUW/8xZf+KMsfS0aHkPn0jgUvA3CInHybOfmlITZzk=; b=FpWsNxmO8cr7N+
	FWOOBjwKQIe+NkeW9YiMms7IZQ986u+yz3Z6bEMkHG0cD93Xv+4l2sdF3EihjR12gQt9oX7TVReTc
	zMGTfaD8vQqG1yXv209jv0kNktfnFDca+pKREldbQkLtL4cKTrGI0mMQaJBBHEm7KvzUAagw7mKD/
	CB4co1hgie5/sOkb1hPfZST9LKWBoEwjQXL4qtXDf+YI0O7MTylnXTyXol6qUnB3DuyoczcCkdkAc
	W7rJxfWDZioPHIgtnLEaZMNKQH7LCcE1O/1qG8WNIALVPGygpTqvyH6M4g9sQcJ+0cK8zJiVILRoH
	uF4S7NMusF0PrKsuJMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKN-00B3BV-0a;
	Mon, 10 Jul 2023 09:37:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKK-00B38N-1o
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981824; x=1720517824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bOnzuYCARzPhwIulmb5IXa1ikc7VrTQNP62An2jC5Lg=;
  b=RfRBARDf65v+kqFMXETNmlL5RVd4imb+U8BVuhVgw0RlfDR9IWv+mkhE
   266tf7YwwfCw/D+qqXH+jYR8mL4JHVfTdw7/AwdOPGPO993H+ASCnW8LH
   6TJ3co7KMmKX3xBFI2vSwiI/KPgA89I5+52wBmRs8NgweaiqFqozQ/Zlg
   GCK8CXq2fPTts4FeNgGuYkYs+MTo2c8A9TgcPY64PSlklZjoltSqpYTjd
   p1Vg9whNhHGWDS2hPjcHbmQpIVJWAWcIbgNxqjYAtom2j9aSQJZgRAeN6
   nxXdl2JMMGoQPRAtxTVFgj/RypUBEs/dNquxFKM3nfCSL+Rgkep7ksPc6
   g==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="223902860"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:37:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:39 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:36 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 04/11] RISC-V: shunt isa_ext_arr to cpufeature.c
Date: Mon, 10 Jul 2023 10:35:39 +0100
Message-ID: <20230710-maternity-duct-f93b20b52db3@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8778; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bOnzuYCARzPhwIulmb5IXa1ikc7VrTQNP62An2jC5Lg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1xr2y5/uferppedvs++gF08epO85c9aifFoLtgws0Lg u0hARykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYSUMzwm33nrx1TFiTEJXDYCpv/WN yY037+1g5v4+gMH7XSfRyXVBkZLpYcaC9NF7zeKm+mtEfA5N4dl89LJx17Gnzg6AP2DY/fMgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023704_660672_4B0D0DA3 
X-CRM114-Status: GOOD (  21.29  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

To facilitate using one struct to define extensions, rather than having
several, shunt isa_ext_arr to cpufeature.c, where it will be used for
probing extension presence also.
As that scope of the array as widened, prefix it with riscv & drop the
type from the variable name.

Since the new array is const, print_isa() needs a wee bit of cleanup to
avoid complaints about losing the const qualifier.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Drop the empty element from the end of the array, it was adding a bug
  anyway as I was not decrementing the result of ARRAY_SIZE() by one.
  Likely I meant to drop it originally and forgot, as dropping the
  decrement was intentional.
---
 arch/riscv/include/asm/hwcap.h |  3 ++
 arch/riscv/kernel/cpu.c        | 75 +---------------------------------
 arch/riscv/kernel/cpufeature.c | 67 ++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+), 73 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..7a57e6109aef 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -76,6 +76,9 @@ struct riscv_isa_ext_data {
 	unsigned int isa_ext_id;
 };
 
+extern const struct riscv_isa_ext_data riscv_isa_ext[];
+extern const size_t riscv_isa_ext_count;
+
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
 #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index e721f15fdf17..bf93293d51f3 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -164,81 +164,10 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
-	{							\
-		.uprop = #UPROP,				\
-		.isa_ext_id = EXTID,				\
-	}
-
-/*
- * The canonical order of ISA extension names in the ISA string is defined in
- * chapter 27 of the unprivileged specification.
- *
- * Ordinarily, for in-kernel data structures, this order is unimportant but
- * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
- *
- * The specification uses vague wording, such as should, when it comes to
- * ordering, so for our purposes the following rules apply:
- *
- * 1. All multi-letter extensions must be separated from other extensions by an
- *    underscore.
- *
- * 2. Additional standard extensions (starting with 'Z') must be sorted after
- *    single-letter extensions and before any higher-privileged extensions.
-
- * 3. The first letter following the 'Z' conventionally indicates the most
- *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
- *    If multiple 'Z' extensions are named, they must be ordered first by
- *    category, then alphabetically within a category.
- *
- * 3. Standard supervisor-level extensions (starting with 'S') must be listed
- *    after standard unprivileged extensions.  If multiple supervisor-level
- *    extensions are listed, they must be ordered alphabetically.
- *
- * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
- *    after any lower-privileged, standard extensions.  If multiple
- *    machine-level extensions are listed, they must be ordered
- *    alphabetically.
- *
- * 5. Non-standard extensions (starting with 'X') must be listed after all
- *    standard extensions. If multiple non-standard extensions are listed, they
- *    must be ordered alphabetically.
- *
- * An example string following the order is:
- *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
- *
- * New entries to this struct should follow the ordering rules described above.
- */
-static struct riscv_isa_ext_data isa_ext_arr[] = {
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
-	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
-	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
-	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
-	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
-	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
-	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
-	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
-	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
-	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
-	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
-	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
-	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
-	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
-};
-
 static void print_isa_ext(struct seq_file *f)
 {
-	struct riscv_isa_ext_data *edata;
-	int i = 0, arr_sz;
-
-	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
-
-	for (i = 0; i <= arr_sz; i++) {
-		edata = &isa_ext_arr[i];
+	for (int i = 0; i < riscv_isa_ext_count; i++) {
+		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
 			continue;
 		seq_printf(f, "_%s", edata->uprop);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..fb476153fffc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,6 +99,73 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
+#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
+	{							\
+		.uprop = #UPROP,				\
+		.isa_ext_id = EXTID,				\
+	}
+
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * Ordinarily, for in-kernel data structures, this order is unimportant but
+ * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+ *
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 3. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 5. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ */
+const struct riscv_isa_ext_data riscv_isa_ext[] = {
+	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
+	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
+	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+};
+
+const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
+
 void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
