Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jZuAM4KkVCVz9ekxMEGIu/VEf3WYbADDVvuxsBKkPI=; b=os4FYvYYc1bvoV
	M9f2c1f0uWzGCnTFknMweXMaQuV0mJBw+Y1fWh8m7AAMCjZUBj/ioXwOk7fusfnwWnjNVJoXBfRAs
	zIR1zWluMR0gUUzs5ckYa1TDynqKIQHpLw+ZIhVwvhyejBBh0Y4SQoBm6SUvUdfRTledKs1zN9fnW
	gK64bMXVMNj9Ih5mcaS/WRWzVE9kMOjgs/Fmoeip54v985jbp+a6U3Vk4ZSNf3cGMlRCMCpAyLdLY
	A7cDYvKB+JpT8TuPgZ0Yo9sO1UzQZ3HpNHfYPVaznmr419pbCLdVjDs9FlBavRuYCixbMQ+xFpAsA
	1y5U1rWIsrD/Xgt7IBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHZ-00A4Kh-1N;
	Mon, 26 Jun 2023 11:21:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHW-00A4FY-0N
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778477; x=1719314477;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ELcThGgPV8TgNeRjLRDN3LuYnlZfadeE3nwnvrWBouo=;
  b=pWV8+EfA6ZRf70FfvsWj6D5c4unVYsLGTq1QKJnATbxTG1B4kDocjc49
   A0cJSPm1dh2KhY9XMIeaV0Pos2pZM1IrNGgrg9I7ly2gesLgI40ZYF0y9
   IzmHz5bSyoMQxwGlW2a8is0zlyQg2NJoKfzH0MNrDZrjI+sY7afP1Qgf/
   zQmUH7jtypXHOtrk2Q/eFiATiQ6iWsAkOhnB1UKOQ3IMM5LvN7ZkQzWtZ
   27Byi6q2QPyEe0F0QjE8BCxnqKPk1qKGUk2BPBAy5dBdd85Sdxi2ZHt1Q
   W/BXGb3cBA7WrqLw3LhQehdlnFL3o6OJONY9ahRMAgiHYwERbVIGKqVK5
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="158621103"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:21:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:21:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:21:04 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 8/9] RISC-V: enable extension detection from new properties
Date: Mon, 26 Jun 2023 12:19:46 +0100
Message-ID: <20230626-unfasten-guidance-eac4d71d8876@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4380; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ELcThGgPV8TgNeRjLRDN3LuYnlZfadeE3nwnvrWBouo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS/x7Us3kvE7JNEeYzVmnHRjy4PLc9x9agm7YP+2f9eoD Q51cRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYy7QPD/1SvndnHp8x8cWg6C1PbiW Nfsy69/CFw3uOOMVNQ/3Pxoh+MDDPXWu7s1JL1fZnX6q348WPrpk3HSoyXpag9TQi1+Vv9lREA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042118_214191_1E9A6ABC 
X-CRM114-Status: GOOD (  19.64  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support for parsing the new riscv,isa-extensions property in
riscv_fill_hwcap(), by means of a new "property" member of the
riscv_isa_ext_data struct. For now, this shadows the name of the
extension, however this may not be the case for all extensions.
For the sake of backwards compatibility, fall back to the old scheme
if the new properties are not detected. For now, just inform, rather
than warn, when that happens.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Naming things is hard, didn't know what to call the new function...
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c | 80 ++++++++++++++++++++++++++++++----
 2 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6ad896dc4342..e7f235868aa2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -77,6 +77,7 @@ unsigned long riscv_get_elf_hwcap(void);
 struct riscv_isa_ext_data {
 	const unsigned int id;
 	const char *name;
+	const char *property;
 	const bool multi_letter;
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 366477ba1eea..72eb757ad871 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -101,6 +101,7 @@ static bool riscv_isa_extension_check(int id)
 
 #define __RISCV_ISA_EXT_DATA(_name, _id, _multi) {	\
 	.name = #_name,					\
+	.property = #_name,				\
 	.id = _id,					\
 	.multi_letter = _multi,				\
 }
@@ -416,16 +417,66 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		acpi_put_table((struct acpi_table_header *)rhct);
 }
 
+static int __init riscv_fill_hwcap_new(unsigned long *isa2hwcap)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		unsigned long this_hwcap = 0;
+		struct device_node *cpu_node;
+		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			continue;
+		}
+
+		if (!of_property_present(cpu_node, "riscv,isa-extensions"))
+			continue;
+
+		for (int i = 0; i < riscv_isa_ext_count; i++) {
+			if (of_property_match_string(cpu_node, "riscv,isa-extensions",
+						     riscv_isa_ext[i].name) < 0)
+				continue;
+
+			if (!riscv_isa_extension_check(riscv_isa_ext[i].id))
+				continue;
+
+			if (!riscv_isa_ext[i].multi_letter)
+				this_hwcap |= isa2hwcap[riscv_isa_ext[i].id];
+
+			set_bit(riscv_isa_ext[i].id, this_isa);
+		}
+
+		of_node_put(cpu_node);
+
+		/*
+		 * All "okay" harts should have same isa. Set HWCAP based on
+		 * common capabilities of every "okay" hart, in case they don't.
+		 */
+		if (elf_hwcap)
+			elf_hwcap &= this_hwcap;
+		else
+			elf_hwcap = this_hwcap;
+
+		if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
+			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+		else
+			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+	}
+
+	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
+		return -ENOENT;
+
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
-	struct device_node *node;
-	const char *isa;
 	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	struct acpi_table_header *rhct;
-	acpi_status status;
-	unsigned int cpu;
+	int i, j;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -435,10 +486,21 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
-	riscv_fill_hwcap_from_isa_string(isa2hwcap);
+	if (!acpi_disabled) {
+		riscv_fill_hwcap_from_isa_string(isa2hwcap);
+	} else {
+		int ret = riscv_fill_hwcap_new(isa2hwcap);
 
-	/* We don't support systems with F but without D, so mask those out
-	 * here. */
+		if (ret) {
+			pr_info("Falling back to deprecated \"riscv,isa\"\n");
+			riscv_fill_hwcap_from_isa_string(isa2hwcap);
+		}
+	}
+
+	/*
+	 * We don't support systems with F but without D, so mask those out
+	 * here.
+	 */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
 		pr_info("This kernel does not support systems with F but not D\n");
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
