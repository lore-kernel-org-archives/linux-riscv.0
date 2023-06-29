Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33963EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQK/dHALSw+2BgBel6p+tnt5MPxpiN9rI0OZU5lR/WQ=; b=OWjw4ekNQk/FYj
	G4exZol53JTztQxDOoL1H5LoUWCy/T/+R33GQ4Q6J6OgRudKp+XS3NayzqwlTIjvl7ksaR5eGQHEq
	lw+BcZNrDV75gMjjXAemWR5abl0WQU3+bRLBi3zKIRSCpOQ8ih3iYwkCtvDQol6AfA7WfvIEOSk58
	bslhpbtj1pbNEuqf2TVfSKNEShspCZRLTBs0jl9JDFurVDdIBiGQ0tcAx3nv36WYtJJZoklFQMJbM
	FVRqD+73zPhJYjV9ux1KtCDPm0a2eHXrIJL9vEoe2r+HGgYQgkE3XedBdzZx6Wxp5fQL6vKtZJare
	ObWgvW1tv0Gi3e30mC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2j-000O5L-07;
	Thu, 29 Jun 2023 08:30:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2d-000Nzn-1G
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027415; x=1719563415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r0ERhmqbd2oRPwjcE5btDtDW/JjDE/JzZQK8UiDqJyo=;
  b=c4m9x3sgVhrCbkjdNqJHfbH/3dGYKYT/ULlFXtcN1M7j3NdPpRPNuO82
   5I9F0/04u4LVe4EkSuh7Oyjl6b0ACx7ij9T8rTVf39N5mixQO3ktmu41J
   p2qs5en2raPgqI4X+o13e7fDA6T8j38Z+rB3tPIF5hJhSvxIoVfUPrDu+
   SLyTNjh8xzG81Ak0GYd1x46h23LwgqM2Cqi+zA95IBQ6EIow22N2N4tfj
   /nS4Y4XSKbqs/AXw7nWZWcQCHkVlGBMw8TDzqUEDQgqG5colpSnfUFihd
   JN8fKdW0SOSr57lLwZJAAsxaMm/9OvqaaZMObDZMP4BQ9sVWtLmxpE9Aq
   w==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="159104698"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:30:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:30:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:30:01 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 06/10] RISC-V: add single letter extensions to riscv_isa_ext
Date: Thu, 29 Jun 2023 09:28:52 +0100
Message-ID: <20230629-uprising-harbor-439b85492132@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3714; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=r0ERhmqbd2oRPwjcE5btDtDW/JjDE/JzZQK8UiDqJyo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ7xqHjnlcbxGS1mNHGsavkiMGXzdyGv342hJZpPbLwO +TZ2lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCJH/jP8j799dseFzfKbHPo4S24uXy Q71XbZyxy/xGq7rQ8rD/6f/5zhv0fF1gXfb5bt7bQIi3fIeDDnwq+AZx2WM/nr1yyMerk5iRkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013015_516413_359534F5 
X-CRM114-Status: GOOD (  16.12  )
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

So that riscv_fill_hwcap() can use riscv_isa_ext to probe for single
letter extensions, add them to it.
As a result, what gets spat out in /proc/cpuinfo will become borked, as
single letter extensions will be printed as part of the base extensions
and while printing from riscv_isa_arr. Take the opportunity to unify the
printing of the isa string, using the new member of riscv_isa_ext_data
in the process.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Drop the multi_letter member, in exchange for calling strnlen() in two
  places.
---
 arch/riscv/kernel/cpu.c        | 37 ++++++++++------------------------
 arch/riscv/kernel/cpufeature.c | 13 ++++++++++++
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c89abf8ef6de..d0dfd88221df 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -160,41 +160,26 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa_ext(struct seq_file *f)
-{
-	for (int i = 0; i < riscv_isa_ext_count; i++) {
-		const struct riscv_isa_ext_data *edata = &riscv_isa_ext[i];
-		if (!__riscv_isa_extension_available(NULL, edata->id))
-			continue;
-
-		seq_printf(f, "_%s", edata->name);
-	}
-}
-
-/*
- * These are the only valid base (single letter) ISA extensions as per the spec.
- * It also specifies the canonical order in which it appears in the spec.
- * Some of the extension may just be a place holder for now (B, K, P, J).
- * This should be updated once corresponding extensions are ratified.
- */
-static const char base_riscv_exts[13] = "imafdqcbkjpvh";
-
 static void print_isa(struct seq_file *f)
 {
-	int i;
-
 	seq_puts(f, "isa\t\t: ");
+
 	if (IS_ENABLED(CONFIG_32BIT))
 		seq_write(f, "rv32", 4);
 	else
 		seq_write(f, "rv64", 4);
 
-	for (i = 0; i < sizeof(base_riscv_exts); i++) {
-		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
-			/* Print only enabled the base ISA extensions */
-			seq_write(f, &base_riscv_exts[i], 1);
+	for (int i = 0; i < riscv_isa_ext_count; i++) {
+		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
+			continue;
+
+		/* Only multi-letter extensions are split by underscores */
+		if (strnlen(riscv_isa_ext[i].name, 2) != 1)
+			seq_puts(f, "_");
+
+		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
-	print_isa_ext(f);
+
 	seq_puts(f, "\n");
 }
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6d8cd45af723..bf7e8e8852f0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -144,6 +144,19 @@ static bool riscv_isa_extension_check(int id)
  * New entries to this struct should follow the ordering rules described above.
  */
 const struct riscv_isa_ext_data riscv_isa_ext[] = {
+	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+	__RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
+	__RISCV_ISA_EXT_DATA(b, RISCV_ISA_EXT_b),
+	__RISCV_ISA_EXT_DATA(k, RISCV_ISA_EXT_k),
+	__RISCV_ISA_EXT_DATA(j, RISCV_ISA_EXT_j),
+	__RISCV_ISA_EXT_DATA(p, RISCV_ISA_EXT_p),
+	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
+	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
