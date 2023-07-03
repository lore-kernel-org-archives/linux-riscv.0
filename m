Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CEEC0015E
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2GTIeK79+pojksYrq8rUxRbiBhdglBNxVwcUo87fjo=; b=jh4ai1/8BjaHUz
	pvoFgJ5n1/yQ6eKq9kom5AXaNBZ0rH0nwdwds0GcDDCA69kJhkdP/5zqklWOVTCX4KYkCQMvMQOol
	ZEAv+DtT3bwMVUbS8xcwrtwv5qVhTY3MfUAFJloZOrxca7E58Qt35ut7+a3W5vOh5U9gwbB44VKWJ
	asZMphH8K956KmCdwpKoLZfeusNqBivAOrn4xwlRjnwiilpwfvEr/8GmQfYI16E47Xv2krh8d+AsA
	y+4wFKYJ2w2l7eqAQrsULWn3wbyGfIg3ZeSh/dn8+m8nNrVcg8pOIQiOUr50+0Xh1kxfbqKsY2TBL
	o0rMQi54faRNZaOBdHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoI-00AEgj-2F;
	Mon, 03 Jul 2023 10:29:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGoF-00AEbZ-0W
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380172; x=1719916172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lVE/oaRwv4TRJvHt5T3XNlCrqoPFy2NcS4RQfVsdXa0=;
  b=mRlar0XY85udZjezqLUHi6uRXzSy4OsnLwzgtCYIMCGs8zhYdcZQmmjn
   Bb2kB17+yejy8Fz625xUNiRvMms254pE8J+X5v4yE34lYbJ6JII3ehoi5
   ENd6iVN5jEwUq4UvPH3E2Nk6saI5nAZj3J9h8zlC14Q+tdKVPbAyzGtiK
   zgdzhofl6dFJFHHp4KdxBg0sH/z879WJ7OnzU4MyMlMDuRJPdl2+skE0c
   3lvyTOzqwZZPhgDLc/T3QNe4O8zl6L/b1ZxrwyeSaWzElP9NetkFb/4+3
   b3w9C30vd+r8a4MQ0v5Zcs443t+UK5BtqZzp3KrPDLPJFv0V5HP9qc3Gd
   A==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="221754681"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:29:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:29:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 11/11] RISC-V: provide Kconfig & commandline options to control parsing "riscv,isa"
Date: Mon, 3 Jul 2023 11:28:03 +0100
Message-ID: <20230703-greedy-dividable-251fa2b809ac@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5379; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=lVE/oaRwv4TRJvHt5T3XNlCrqoPFy2NcS4RQfVsdXa0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq19sfNDxd5ZKzstu/hT0m4Kftl+W1isKaJn3ZtbCb2n vmcc6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBELjxh+J+29GBw/LWTOcJy1iX7L4 c3auh51LVVfZ2c+Y2rpvanuzcjw7QL+//2qvt91j50foPN033+LatCw9ouTc0xSz9Ypn+ukQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032931_274625_F92F8BA3 
X-CRM114-Status: GOOD (  22.22  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As it says on the tin, provide Kconfig option to control parsing the
"riscv,isa" devicetree property. If either option is used, the kernel
will fall back to parsing "riscv,isa", where "riscv,isa-base" and
"riscv,isa-extensions" are not present.
The Kconfig options are set up so that the default kernel configuration
will enable the fallback path, without needing the commandline option.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
- Invert the Kconfig entry. It's now default y & not hidden by
  NONPORTABLE, but its entablement will now activate the fallback
- Add a commandline option to enable the fallback on kernels that do not
  enable it in Kconfig, as Drew suggested
- Default the global var to the Kconfig option & override it with the
  commandline one, rather than have checks for IS_ENABLED() and for the
  commandline option in riscv_fill_hwcap() &
  riscv_early_of_processor_hartid()
---
 .../admin-guide/kernel-parameters.txt          |  7 +++++++
 arch/riscv/Kconfig                             | 18 ++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                 |  1 +
 arch/riscv/kernel/cpu.c                        |  6 ++++++
 arch/riscv/kernel/cpufeature.c                 | 14 +++++++++++++-
 5 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d910fba25f2c..1bd435f60055 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5437,6 +5437,13 @@
 			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
 			CPUs.
 
+	riscv_isa_fallback [RISCV]
+			When CONFIG_RISCV_ISA_FALLBACK is not enabled, permit
+			falling back to detecting extension support by parsing
+			"riscv,isa" property on devicetree systems when the
+			replacement properties are not found. See the Kconfig
+			entry for RISCV_ISA_FALLBACK.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL]
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1d39efe2b940..a9a473b67182 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -841,6 +841,24 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
 
+config RISCV_ISA_FALLBACK
+	bool "Permit falling back to parsing riscv,isa for extension support by default"
+	default y
+	help
+	  Parsing the "riscv,isa" devicetree property has been deprecated and
+	  replaced by a list of explicitly defined strings. For compatibility
+	  with existing platforms, the kernel will fall back to parsing the
+	  "riscv,isa" property if the replacements are not found.
+
+	  Selecting N here will result in a kernel that does not use the
+	  fallback, unless the commandline "riscv_isa_fallback" parameter is
+	  present.
+
+	  Please see the dt-binding, located at
+	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
+	  on the replacement properties of "riscv,isa-base" and
+	  "riscv,isa-extensions".
+
 endmenu # "Boot options"
 
 config BUILTIN_DTB
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e3cda14a486b..b7b58258f6c7 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@ struct riscv_isa_ext_data {
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
+extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 28d5af21f544..1acf3679600d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -87,6 +87,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 	return 0;
 
 old_interface:
+	if (!riscv_isa_fallback) {
+		pr_warn("CPU with hartid=%lu is invalid: this kernel does not parse \"riscv,isa\"",
+			*hart);
+		return -ENODEV;
+	}
+
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
 			*hart);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2c4503fa984f..5945dfc5f806 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,18 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 	return 0;
 }
 
+#ifdef CONFIG_RISCV_ISA_FALLBACK
+bool __initdata riscv_isa_fallback = true;
+#else
+bool __initdata riscv_isa_fallback;
+static int __init riscv_isa_fallback_setup(char *__unused)
+{
+	riscv_isa_fallback = true;
+	return 1;
+}
+early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
+#endif
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -490,7 +502,7 @@ void __init riscv_fill_hwcap(void)
 	} else {
 		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
 
-		if (ret) {
+		if (ret && riscv_isa_fallback) {
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
