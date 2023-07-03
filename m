Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E191C001DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd8w49JadeEVECiqjkDODTA+47xgQNZOL5eMnkAU8cE=; b=iDOv2S1YEZhJPE
	0OywSte5+p/XaHfhgjBnh99/0mVrB5TwlFnwvKUjjtzLhAuv293NAAPl4VCUZtU8Y6HaVL2uZ8Kb6
	IMVIfr9xNLX+Q44rYTMOI99BaNSa/wShsXWGbLjTXsdJ99pzFVdLzt5/vYXDSdQg/wTauioOczaD9
	v5CRgO9tV6Gkq45oe9QgP4uEz3ZGwOSIz5VVmcKDo7pT8e+qsIjdmDJXE8eAaiOqL44Z6A+aPrKg6
	/tZE5m1ZGQBzflcpjubOsV+/LroS60XS2kMEvAzlUA8vN/7E75NYHuPfWsQxhtHUJptLqL+Evc5+o
	zD46ylBjGe7fSeISz3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGnv-00AEHW-2h;
	Mon, 03 Jul 2023 10:29:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGns-00AECN-2t
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380148; x=1719916148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6BMEapaupYPDog3H9hxGadJjmqF1edoTeSi+tHSHbZc=;
  b=UeMhok613/QddLY3kDM+FDoaKgMUjCoFuA8i9R0Z+wDS3Ex8dwyW4J1O
   SCQ12IYOv/MtIZldfVNlS2+iun4+PzQ57+VfNIZ1MURRbDHMWSuTIVLrE
   Sxyz1WBNmMaLjQ7W7fSLp/cVUrdmMoYCvcVKhS6e6BBQ/zJDDbdf1T27w
   FZqoIj3PeBAj+LlQJ5YxrHbKtFMOnCHbQ/2aDCp6YfzlLayp9yvoL07zq
   OLePz7rnWocsgnRYdrtlJ0zjbTOjDWr99dlJTNLq5MNh5GTwJzPjAGxhq
   ya2GQ9bVNBgCOp3sQskmeFKUCZaBr+R9UFglagxmTZNFbWqNmF7oFPxSn
   g==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="233446716"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:29:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:29:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 02/11] RISC-V: don't parse dt/acpi isa string to get rv32/rv64
Date: Mon, 3 Jul 2023 11:27:54 +0100
Message-ID: <20230703-foothill-enforced-86baba776d5e@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zLq9ckWPh/r7wLqw5B/OBIb2sy1H21ZwhSODFcUjaIw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq06pvu56bqRuRLTfObcijKOvPZFpV/EfEtve0w6lMDi OaO+o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNhZmJkuLFw17LJ55q22814/XL94/ 870uferp5eaXds8q62I81cvhMZGbYuYtz94YTlg/zKZxU61ky3knp+lXw5dOv9ojuNm7ccWMsOAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032908_938873_AF0D3AA8 
X-CRM114-Status: GOOD (  15.31  )
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
Changes in v3:
- Fix tabbing of print_mmu()

Changes in v2:
- Delete the whole else & pull print_mmu() above it, since that's common
  code now
---
 arch/riscv/kernel/cpu.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3af2d214ce21..f808b67f5a27 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -257,13 +257,16 @@ static void print_isa_ext(struct seq_file *f)
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
@@ -320,27 +323,21 @@ static int c_show(struct seq_file *m, void *v)
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
 	struct device_node *node;
-	const char *compat, *isa;
+	const char *compat;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
+	print_isa(m);
+	print_mmu(m);
 
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
