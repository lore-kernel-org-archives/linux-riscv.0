Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B50EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcAcQGaWtdVvWMgKEbFTu/bI2ze87CEFvcLtn/sd6U0=; b=oFrrup9pMm3hSI
	a16rFGAxjOaOvOctG4GOmASGR9HncYax6Za429ESuD5IetEDoPjCqamb52c+BMSB0qDJbMDJ4J8HX
	uLFVjYsR1d/StLffpBZ3Pz/I5Cx9xMwXW1JgPLOVKzojVlicEZr90UXtwVLHKkCM4YqnYnj4JxDHa
	lRSgmxHGQlfYBgloI4+DfU7RSOYztIccPSH0d8nQzS8Csz8smlnUC0VADymm+BMA4dZlQIppSF8G4
	Xb6w7TQWPGsxeUU2nV2WjgxsFJt9ZZTRIpsJAkDLZ7Bfo17fY2dnYLDjYsVQCosZ70eMAY6iHw+/w
	p+PQBnhgAsaZrTedYOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHG-00A46E-1V;
	Mon, 26 Jun 2023 11:21:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHB-00A414-10
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778458; x=1719314458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EVl3YYff+bNDCeEIAFYAaLo4NmZDjHChTG2zsWTb6SY=;
  b=NzPJj8J5Jw0LvTiEo8yuJmGwL7A1WtkSraZwFQUc4Mh48FZRz+DUPZJQ
   lfwQ0vyhZxa8vh0ON4D4MJ2lUf8+TqlPjQDvthsaFv2OMQBddxh1JTpMD
   0qcwMw+4zBaf7Tl1Vg7Ab4tAgiwVOtpCa3AO32e4YUgdlN/nBk07Uht0R
   ryubOlQgzfyHpPdPJUflaEZJdhl2zP/mbay86a020EsJQfNjeXq8qslEu
   7jPndsCAcALffzVItPzt7w77AHdEwNrzsG0KGtzMNM3FbGe3GGBygmC3v
   42cUnpbyB0PO7PFJe129JpXXdiAaFqtE5qkzjAw3wlGZN+iP+bxPI/5yV
   w==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="220501431"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:20:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:20:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:53 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 4/9] RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
Date: Mon, 26 Jun 2023 12:19:42 +0100
Message-ID: <20230626-thieving-jockstrap-d35d20b535c5@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EVl3YYff+bNDCeEIAFYAaLo4NmZDjHChTG2zsWTb6SY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS/xOHvARZg/f8YlLI9BKZOvsxbtEVnyNvPPa8OTs1nOC uU//dpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiS6UY/hlMYgidF17//8BOu2M95s kC8543Oka+Pn0wUDbz6aT4NW0M/xNFHrouDuHn6tGzLj2UOu9zZ+2k1IrISZGVqwv9bH5u5wAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042057_355628_A0B1C42C 
X-CRM114-Status: GOOD (  14.03  )
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

In riscv_fill_hwcap() riscv_isa_ext array can be looped over, rather
than duplicating the list of extensions with individual
SET_ISA_EXT_MAP() usage. While at it, drop the statement-of-the-obvious
comments from the struct, rename uprop to something more suitable for
its new use & constify the members.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h |  6 ++----
 arch/riscv/kernel/cpu.c        |  5 +++--
 arch/riscv/kernel/cpufeature.c | 26 +++++++-------------------
 3 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7a57e6109aef..36f46dfd2b87 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -70,10 +70,8 @@
 unsigned long riscv_get_elf_hwcap(void);
 
 struct riscv_isa_ext_data {
-	/* Name of the extension displayed to userspace via /proc/cpuinfo */
-	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
-	/* The logical ISA extension ID */
-	unsigned int isa_ext_id;
+	const unsigned int id;
+	const char *name;
 };
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 61fb92e7d524..beb8b16bbf87 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -164,9 +164,10 @@ static void print_isa_ext(struct seq_file *f)
 {
 	for (int i = 0; i < riscv_isa_ext_count; i++) {
 		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
-		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+		if (!__riscv_isa_extension_available(NULL, edata->id))
 			continue;
-		seq_printf(f, "_%s", edata->uprop);
+
+		seq_printf(f, "_%s", edata->name);
 	}
 }
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f0ae310006de..b5e23506c4f0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,11 +99,10 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
-	{							\
-		.uprop = #UPROP,				\
-		.isa_ext_id = EXTID,				\
-	}
+#define __RISCV_ISA_EXT_DATA(_name, _id) {	\
+	.name = #_name,				\
+	.id = _id,				\
+}
 
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
@@ -367,20 +366,9 @@ void __init riscv_fill_hwcap(void)
 					set_bit(nr, isainfo->isa);
 				}
 			} else {
-				/* sorted alphabetically */
-				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
-				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
-				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
-				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
-				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
-				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
-				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
-				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
-				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
-				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
-				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
-				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				for (int i = 0; i < riscv_isa_ext_count; i++)
+					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
+							riscv_isa_ext[i].id);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
