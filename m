Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZIldBkobZbqDBM3zuHBJQfFtSvj3IQHC0dp0XRfrp8=; b=N4VMKLqVgTFhPh
	DG1wniSVCDTKk9jPaLoftjZODSwPMbYtTvENsuleyXiOVTNZhQN6XzvWiVB527urDmA9XZl+78pMR
	fSdN9ye3EYCjkZSeSyzN8sndEd1fZ4TwpcqiQ4EAecqakg2INzYdgWKtC896mG2IxdgPvT153Lc9a
	LgxBY5q8Os/EOQtyPDon1ocOgWPzhpIjbXR3WLldYmlkM91so57kfOS2ikrU0rz/Le1JE89tJp+Ok
	Ej9jaQT4tHMlj7O8w6ha0u1vjhnCWmPZdS0nmWTmZ7A/vLaSxzjFofOzT5lgTX2RzMu10suDsofyN
	8w48REHGhhAZDHqB0tMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHL-00A49L-0D;
	Mon, 26 Jun 2023 11:21:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHG-00A41i-0g
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778462; x=1719314462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yZJX1ZKwzL2BmVRGCEvc/ExPgwhg69uUVieSVE8JLtg=;
  b=BVLMMBRXxkhpUdBLjjAjZAyIuyLj2YUUrL/eseznkqaxx8fHdG+EgU9s
   aNIXP1M9JMdHou+v52/bdBhybHA80vlAqW3Kuzkk3CZPu+JU6p3cnrnTY
   4lmXDfb7paF/bPUYEFUMvyj/S7mxqv8oFzS03AVMRgu5Nf6zPCpSDuMKd
   e/Q+zI+7mZHdEzwP1vXv9FA9rPIZHC5slZ4yuiCjF+9pOU8rxUpJuf7e7
   m5tUUjMFGnxF735s+PqRQyKS+CiupoW6zTjjnELYKVtfT4VYvMzALUGRy
   yXP7yV2vy9Fdlba0+PSNsgNqhwHclikeP0ZEzpIvI09Qfddqyn6AayQOJ
   w==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="232170788"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:21:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:21:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 6/9] RISC-V: add single letter extensions to riscv_isa_ext
Date: Mon, 26 Jun 2023 12:19:44 +0100
Message-ID: <20230626-sensuous-clothing-124f7ae0aedf@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626-provable-angrily-81760e8c3cc6@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6462; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yZJX1ZKwzL2BmVRGCEvc/ExPgwhg69uUVieSVE8JLtg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS/yW8r6JkLbgmygTkrXKqNBg4cZLb/YzO3w5yMRg/Igz qeRrRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbisIzhf3Je0+MTcaUqHzNu5zhlSZ jVzc5cXBrNW1+9mIGpcmrKL4b/MdIxC7xD/zF31W88aXNGui49Rneh2w0Bhg8ZNhZ/i/6yAAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042102_254324_C9D9006F 
X-CRM114-Status: GOOD (  16.14  )
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
letter extensions, add them to it. riscv_isa_ext_data grows a new
member, signifying whether an extension is multi-letter & thus requiring
special handling.
As a result, what gets spat out in /proc/cpuinfo will become borked, as
single letter extensions will be printed as part of the base extensions
and while printing from riscv_isa_arr. Take the opportunity to unify the
printing of the isa string, using the new member of riscv_isa_ext_data
in the process.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpu.c        | 36 ++++++----------------
 arch/riscv/kernel/cpufeature.c | 56 +++++++++++++++++++++-------------
 3 files changed, 46 insertions(+), 47 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index a35bee219dd7..6ad896dc4342 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -77,6 +77,7 @@ unsigned long riscv_get_elf_hwcap(void);
 struct riscv_isa_ext_data {
 	const unsigned int id;
 	const char *name;
+	const bool multi_letter;
 };
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index beb8b16bbf87..046d9d3dac16 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -160,41 +160,25 @@ arch_initcall(riscv_cpuinfo_init);
 
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
+		if (riscv_isa_ext[i].multi_letter)
+			seq_puts(f, "_");
+
+		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
-	print_isa_ext(f);
+
 	seq_puts(f, "\n");
 }
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b5e23506c4f0..5405d8a58537 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -99,9 +99,10 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-#define __RISCV_ISA_EXT_DATA(_name, _id) {	\
-	.name = #_name,				\
-	.id = _id,				\
+#define __RISCV_ISA_EXT_DATA(_name, _id, _multi) {	\
+	.name = #_name,					\
+	.id = _id,					\
+	.multi_letter = _multi,				\
 }
 
 /*
@@ -144,24 +145,37 @@ static bool riscv_isa_extension_check(int id)
  * New entries to this struct should follow the ordering rules described above.
  */
 const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
+	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i, false),
+	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m, false),
+	__RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a, false),
+	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f, false),
+	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d, false),
+	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q, false),
+	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c, false),
+	__RISCV_ISA_EXT_DATA(b, RISCV_ISA_EXT_b, false),
+	__RISCV_ISA_EXT_DATA(k, RISCV_ISA_EXT_k, false),
+	__RISCV_ISA_EXT_DATA(j, RISCV_ISA_EXT_j, false),
+	__RISCV_ISA_EXT_DATA(p, RISCV_ISA_EXT_p, false),
+	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v, false),
+	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h, false),
+	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM, true),
+	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ, true),
+	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR, true),
+	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR, true),
+	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI, true),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE, true),
+	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM, true),
+	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA, true),
+	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB, true),
+	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS, true),
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA, true),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA, true),
+	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF, true),
+	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC, true),
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL, true),
+	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT, true),
+	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT, true),
+	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX, true),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
