Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A352BEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SBBJAHN9SnmNaUUX0M2twMkjjxFuhmvznIS3lEmz98=; b=xPws/EM3RrXJGQ
	jv1svSnYfCWJ4zmrHLPlu2ZQPzvQQrOS2y3V5Q798hy/gVzt0tdofVDdXbTL7rfEbpDHdrBAJGDP5
	UkgImkSUqK0xTGNeuqnF8bX17QXGA5omVI49FVAYxTm9IcsFZHhf/02U9gRYtFru9o94jX4pREf65
	XHpIVV3pZQSF/3ChuMg+VpSkc6PgCdQDu8OT4up6iSGBzr5BHMuZCIRdCbedGthMvRpIjyJe5xYdQ
	F5MgyEokfRaleGz1jBjwRWsrHRoltr5Stu7Gnz5cKlIUcZOEyxMK4wYqd743jImn6akDVlfXlaxEl
	nnE5cMxDLXBOTnMxummw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2c-000O0b-03;
	Thu, 29 Jun 2023 08:30:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2Y-000NxK-3D
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027411; x=1719563411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/3KO+Sn7iAB26kNDVGJP0twzMITJyOfWkzd9A2nZjo=;
  b=qrpv357JqN3x1rULkeG8SvgYaKKt8SKUXjWhSYSQMe/YE0Y/6kend+BG
   0EbITtXFlDVlxUDznWBNH3gSmX9ptVG9joF5aKFAh8sh6zWxNvLZCzX2j
   sXo1tS7oE0geaJx6yp1SSf1bCAau1urzIO1Da9IKQAn8Kp+1XAcJvKfMZ
   XY3Xmlg3ZwWUyl3O6bG7dBjWL04nw5u9DgZasihJOpPRddFNUUF04NOL+
   wXlIMfZDGhnjKZJM3XisPvUxD6TNYlU4v3vSdu9NBjFNKHpbehaJfDC5l
   74CfoCtJKJYhfz9DFs2S6ikXhxxPWxhimVJ+fZFyrhI+Tu3MTcbnoCjgC
   g==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="218155930"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:29:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:29:50 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:29:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 01/10] RISC-V: don't parse dt/acpi isa string to get rv32/rv64
Date: Thu, 29 Jun 2023 09:28:47 +0100
Message-ID: <20230629-fruit-syndrome-74e32af9c8ad@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UJAC/sZOfHsqO8ubaZdFS5UN7qeloghiBAOtP5WmH0o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ6un8fYz/RnncHnE2n3TnRc3rF78ubp2sESpiVe/10u l4YGdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BeAiGxj+aX2XvMTf3Ln2caF4mP0cA5 n9uWomvG2yhUv6nyxb3cWay8iw/Gbwad/JV+tO+l85I/4g9WjVnH81ZwIkm1aLrFsw+XssAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013011_172595_82D1FD13 
X-CRM114-Status: GOOD (  15.66  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

When filling hwcap the kernel already expects the isa string to start with
rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.

So when recreating the runtime isa-string we can also just go the other way
to get the correct starting point for it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Delete the whole else & pull print_mmu() above it, since that's common
  code now
---
 arch/riscv/kernel/cpu.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..2fb5e8e1df52 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -253,13 +253,16 @@ static void print_isa_ext(struct seq_file *f)
  */
 static const char base_riscv_exts[13] = "imafdqcbkjpvh";
 
-static void print_isa(struct seq_file *f, const char *isa)
+static void print_isa(struct seq_file *f)
 {
 	int i;
 
 	seq_puts(f, "isa\t\t: ");
-	/* Print the rv[64/32] part */
-	seq_write(f, isa, 4);
+	if (IS_ENABLED(CONFIG_32BIT))
+		seq_write(f, "rv32", 4);
+	else
+		seq_write(f, "rv64", 4);
+
 	for (i = 0; i < sizeof(base_riscv_exts); i++) {
 		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
 			/* Print only enabled the base ISA extensions */
@@ -316,27 +319,21 @@ static int c_show(struct seq_file *m, void *v)
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
 	struct device_node *node;
-	const char *compat, *isa;
+	const char *compat;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
+	print_isa(m);
+		print_mmu(m);
 
 	if (acpi_disabled) {
 		node = of_get_cpu_node(cpu_id, NULL);
-		if (!of_property_read_string(node, "riscv,isa", &isa))
-			print_isa(m, isa);
 
-		print_mmu(m);
 		if (!of_property_read_string(node, "compatible", &compat) &&
 		    strcmp(compat, "riscv"))
 			seq_printf(m, "uarch\t\t: %s\n", compat);
 
 		of_node_put(node);
-	} else {
-		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
-			print_isa(m, isa);
-
-		print_mmu(m);
 	}
 
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
