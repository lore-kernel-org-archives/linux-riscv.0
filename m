Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A2BEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRhCZZ1ZdiNOLvoTMHYL2l0UfutWOy/u6l8aTIfVZ6E=; b=okmRfftHL1hmWT
	Vkv/Mzg8T4Rh9sGSTjYpn7hL/57je3+6mXZnUUDBQyTSiRUAUpGXWpaQf9ViQqP47jjbLq/TuQpap
	4GHSICVYMi71DDJvwhaUEj/Tc/BpE0KxaSpi20yIyqg1OcXHwLhN2mQA5bEm4qeQKSd+M70HCWvUb
	KTWlrDLyYTgQFTS84krmN3yCBCDse3DPhfi0fYkndR3ZX98bN9lxA/ci8YVDjH060H3xGniWud8EV
	to6B2NrvxZMY5DOA2Vh5ajEg1v/sZXkG+tgh9U5qJ2cC8++1OIrDyCirz13h6zmmg+Cyam4CqWPqp
	R/esyCbjrvtiVUUWtbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2s-000OBf-34;
	Thu, 29 Jun 2023 08:30:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2d-000O10-1c
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027415; x=1719563415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GCIGwsCwU5RS5bMsoRtWcou0pn3VgTFaZMXbVrYz4DA=;
  b=jCdGqSC2zgxCXRmL6DP3L15MIXU0Bd0mZJLahHZVKxZZqYLvukt9vAwd
   J7f4wUhkbsXVsRVhkboP8EC2FHoiwAbD4MfVgMYJQql1btVUU5T65q+OC
   8bcbd4swta/2hA0Al6a7UVdEp+r36/CbrtH8AyzZL2LlpSF1YAI4mU0t+
   sWrnecYBJSPKXCM5mWIT9VNaApePcTYpWMTCAKHB3rY3eP8QD45nIwVGo
   uGlr+aMWKCLotC2c5bUJyR4zcFR7R2U31/SLEh6i5fUD+bVQ1GR676QiE
   S+DYR/YllVZuEG9FfA0/NeeHagLuhO4N9okOhRl7+C+0LLoEcPrzJajvD
   A==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="159104711"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:30:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:30:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:30:06 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 08/10] RISC-V: enable extension detection from new properties
Date: Thu, 29 Jun 2023 09:28:54 +0100
Message-ID: <20230629-defiling-salary-a51c0d89d31c@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4499; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GCIGwsCwU5RS5bMsoRtWcou0pn3VgTFaZMXbVrYz4DA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ67sVyPKlafLH/ipn3L2WtuubbyvM48Grl7RYzCd2Wc s03sKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESOBDAydM15+H/L1GPSk82kpmZ56K y7+eTxzZvhe9rmMS6QZZya7crIsNNM4OAdoz3rAxPnSezj3yj92CPXNo9vzt6YedPmPpwuyg8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013015_680943_46D4FA4A 
X-CRM114-Status: GOOD (  21.14  )
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
extension for all users, however this may not be the case for all
extensions, based on how the dt-binding is written.
For the sake of backwards compatibility, fall back to the old scheme
if the new properties are not detected. For now, just inform, rather
than warn, when that happens.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Pick a more suitable function name than fill_hwcap_new()
- Actually use the property member to read from the DT
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpufeature.c | 76 ++++++++++++++++++++++++++++++++--
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index a20e4ade1b53..e3cda14a486b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -76,6 +76,7 @@ unsigned long riscv_get_elf_hwcap(void);
 struct riscv_isa_ext_data {
 	const unsigned int id;
 	const char *name;
+	const char *property;
 };
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 41aedeaecb61..2c4503fa984f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -101,6 +101,7 @@ static bool riscv_isa_extension_check(int id)
 
 #define __RISCV_ISA_EXT_DATA(_name, _id) {	\
 	.name = #_name,				\
+	.property = #_name,			\
 	.id = _id,				\
 }
 
@@ -414,11 +415,67 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		acpi_put_table((struct acpi_table_header *)rhct);
 }
 
+static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
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
+						     riscv_isa_ext[i].property) < 0)
+				continue;
+
+			if (!riscv_isa_extension_check(riscv_isa_ext[i].id))
+				continue;
+
+			/* Only single letter extensions get set in hwcap */
+			if (strnlen(riscv_isa_ext[i].name, 2) == 1)
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
 	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j;
 	unsigned long isa2hwcap[26] = {0};
+	int i, j;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -428,10 +485,21 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
-	riscv_fill_hwcap_from_isa_string(isa2hwcap);
+	if (!acpi_disabled) {
+		riscv_fill_hwcap_from_isa_string(isa2hwcap);
+	} else {
+		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
 
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
