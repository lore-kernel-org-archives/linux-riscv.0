Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A087EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRhCZZ1ZdiNOLvoTMHYL2l0UfutWOy/u6l8aTIfVZ6E=; b=yFm4Ff65KOhffn
	0fnKkJM2Duyi/d4nlUi8lmdMddjsC2jwkwlgc4OdMrw0hF0J1QxN374eM/ju5yWDNWK/s1MZUXN+t
	6yn9WdVp3pqGp3drTWNWGScIX5l8Z4E4oD39HWAYEVDHuRsIVmGN/Vv5zm06rjG8wVIQqIp9leVJB
	lewCKVL6c67EbWxp2idZukBHUFAtV50yLHPQcuCfv1BwZfylzv4C39dqne/Xpe3UJGoPhCNap24Vc
	2iybQFkv61ThJIrkX+rYLIbqwImNDp514mY3iG3nepa9HZ9OwDrwZS8ucIIH6KWr5HkUWY0KM/T+K
	j9WY71FilblC/2VC4udQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKG-00B35A-1d;
	Mon, 10 Jul 2023 09:37:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInKB-00B30B-0H
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981816; x=1720517816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GCIGwsCwU5RS5bMsoRtWcou0pn3VgTFaZMXbVrYz4DA=;
  b=q0jcoOeyljy16l8wFv6mV5n6OBSRPRgQsCsYkML9msZAAEQyQSh6C9wb
   yH7cGWrWGEWNqy5l8N+TxsNT46Kw9E+TM5JXY8I6p+yZCincmwr3KPTmx
   2gLzQX0c7bXh07Knwu2puQVpSKM6jrYEI/ibux3BfoUZ2UJbEm04EZbdM
   MsNyxwsmr3eAVIE/R9LGxYIvfT4MqZo/a7siD7V6FiCikeWYcGpCHIFBP
   WqHfdKkR635ochBRbvBTGGPRP9OPk1UgbOIJfgtw20YWmCTdEI9IPlJ0O
   75D8dPzqsNq1+20SzpZMx0lMGCX/EcugPooRzR48zXPjZ0XCZ7a4GTsMI
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="222870090"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:51 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 09/11] RISC-V: enable extension detection from new properties
Date: Mon, 10 Jul 2023 10:35:44 +0100
Message-ID: <20230710-five-unwieldy-aba2d53a6480@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4499; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GCIGwsCwU5RS5bMsoRtWcou0pn3VgTFaZMXbVrYz4DA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL9z4JnFjhoJ6/LLTJyw/zPK5eva5jfETTaUCw2PRgdvi CkJudZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi0wMYGbammOba/33U+GvlotCDm9 8WmN/tcj0cwp46xakiIsDOvpXhn9I7Y3HL9I2VrW0Wiy0/rMyp2bt14uxnLhcamplPCE5jZAYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023655_183528_0C5EF887 
X-CRM114-Status: GOOD (  20.90  )
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
