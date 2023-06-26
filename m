Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB8EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuzWZGrrp9VXStnEbbXCxgdkOY2AmtNTwLAyBQFvHtc=; b=oYvXAb8RBXHckJ
	VOfHDLa+PM/QhhPYHUi51Nla1krUDRJQc0+fBJXxX+6sqYKIObJqRPL43RS/RjCsvmmmgTTXt/Huj
	OoNIqZDn3nIgjUSim6tlepFYO0kOCxLLzioKybO5YFbM7Lfe5pPiomOeTimCgbo7XZOii6TEqTtsp
	DqMjNvMdcawYSegFfhqe9DMFoZsAc1z15/tlsMVz940+N8dCDoQdd/INuenF2vv1cr9LNdszM87Uw
	zQinxsTGMMufEcg1z2NcN5opWxzfRwhcmhVW3IMrE3/mtt0LeqIcvCVq1axJJ7oXHyoLb9VVboFXn
	mZ9/ZMhdE7sT2DN8DRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkH7-00A41G-0F;
	Mon, 26 Jun 2023 11:20:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkH4-00A409-0R
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778450; x=1719314450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mu+g58nhjsHPstxLBmB5/V/xzpUyBi/njYK6W3OCzlM=;
  b=RS3M/voFSpsuqh5KRfsnkmkUUqO2jVFsyRiaiqS+H10NhSyZ0VoJ/SbO
   JmiRZfbeHHQCIBTdxrUD1wup+OwUgjBIE67E0DxBDRKXaV23rwoO2eMpK
   t8lVlSRxFI3JFZPPwRyqGOXfGINfX9zOAeRUPr+zSTXum+xiCPOg7YPho
   ZiplFxYY9Zh5n2y8yK+vGu8H221tWPm+mahA3/1cffPO9dh1hGLWvXE17
   qM5R6xGitLn4tcNH+gYc+bPfGJUmsG96zZDdmTluR0bseB/PHmqyj+PiH
   EcMKbSzIGboO23+zP+V0YEKr/sheeSRgZncpsp1/VGyY5dxtftPolPDZn
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="232170762"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:20:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:20:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get rv32/rv64
Date: Mon, 26 Jun 2023 12:19:39 +0100
Message-ID: <20230626-silk-colonize-824390303994@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2178; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Zp2OijcNG2QSKXKrNz/jnk7bkS3lWHsdOCwgyctpfpk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS3yV91hPUsrLUjn8U36bqs73+S/0OJyXVuhk5uSevTAp eKNbRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZy1pmRYWb8nHMvymR93EJYDRm2Ky 8q7dW8JPXC2lDym4nJi9//hRl+Mm7JDLa73Xc+8GGy2YJd9ywm9AssWMA/9ckcw1P5qrv1WAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042050_175730_9920D48D 
X-CRM114-Status: GOOD (  15.25  )
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
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..742bb42e7e86 100644
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
@@ -316,15 +319,14 @@ static int c_show(struct seq_file *m, void *v)
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
 	struct device_node *node;
-	const char *compat, *isa;
+	const char *compat;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
+	print_isa(m);
 
 	if (acpi_disabled) {
 		node = of_get_cpu_node(cpu_id, NULL);
-		if (!of_property_read_string(node, "riscv,isa", &isa))
-			print_isa(m, isa);
 
 		print_mmu(m);
 		if (!of_property_read_string(node, "compatible", &compat) &&
@@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
 
 		of_node_put(node);
 	} else {
-		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
-			print_isa(m, isa);
 
 		print_mmu(m);
 	}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
