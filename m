Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B72DC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tp8HQ1cO959L7YjZ9U0kZzdl0R7y1gYDf+zGSib/Dx8=; b=3GXbmVoF/ej+WO
	ixbrdIK8vUboL8wzFI0QGt9tLo+dMhzfOfacEfVkDvyrqMqplNHiN6kGAwUvkShduzk59YUr93zc5
	EBkuG+wpWQXKBtT9DVMILnK0iNlC203IX7ZMeKjktNBtijXyxQROP4qyzKFti+JDnRBT/UvF+KEhI
	YHt/HWhLc7utSuxdQTjeNUFIH8BEO48J5WusyL5tuBKtwaxpD7IX8mN992SFyO4Gz3nw5P/kSjBc2
	aDjg0aEye+h0O4e8nkqFoqJxPGUyetukvg701rS2Y6DU/xjam+4YAguUVepicOR/oLkObUx71cQTx
	ceQORFjGMvDR3iDjeHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbuN-003JHf-85; Fri, 24 Feb 2023 17:30:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVau8-00375D-54
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:26:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id 6so14096931wrb.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJYbQbc0fp/1TEeivoz5jqaz0elP91c/5Hx47qRP3S8=;
        b=T9k3WNwF4SgXouAMaIQEpElSSyQKpHZS9zR9oid7jReaBACXj9/6ILxMRNnYeQcnn5
         2QFIROiy7JTL2aYrE4N45Ta5CIxhL65TaFUNpIIvZiRHMMzov7LTDSgmDX7KrrCcZYsz
         MXGf85V3Aq9mQjKrtW28cBaqCIB5VMymx+R2CNx0NdMUjetJceDRqAaJWgqypeOpiTck
         z/FqID1Dxwdr45nbAfTob1b4XrQoarv5uoLlIYJmZXd+GRE0Hf/GmOuQJleh0NHWCeeq
         3FnJT8Vz90VBe4VrDN2xP7n/5opfhdA2meUQeZR4UCTEVG8ADdZOLvKrodzu3fd6txr8
         E58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJYbQbc0fp/1TEeivoz5jqaz0elP91c/5Hx47qRP3S8=;
        b=qLVX10MjOigytLGXvHkBE3YB7pPbglI7IlRKjimO5M1K0EbDcpzhdPbEcJzzgN8mlD
         mmhu24O/4Mq8mbzvbgn8uBi76nlq+FisKlX6QHUP253DScAwdaz0DCDczfxJCkMFVCXj
         jKRipQ3Ftnq5cC8UhFnJtcxSaGRI6G2le+sHb6yppRBmS29ZYqHz94nhIZl6iG1LMouA
         jBPZ494f82KIP6qtuq0Pd3/qD4+HZI01os8FgXBYdHexgd49Soc6HFu17f5a6GbGGem9
         xtM0SFT8ZJEN+CsHZcE/wTkbY/O+gX3sTrk4/dHQQsPnrytuFHohgHoeznRPz6YaOwoW
         HFVQ==
X-Gm-Message-State: AO0yUKUrNmnAPjO+fAoFK5gXF5IIU9a+b+axUumUUkVz57VOELfLjNwM
	sgFZlVOs0XDkJ9Cqt7zp8l5jE3iTKKR0E9pJ
X-Google-Smtp-Source: AK7set+OdB+nNMNrDkf8ZsIb/m/7AziP4DhVrARdnyFGkIMk9cLJYfRn1jdgP8eW7KMoa+q5qUmoLQ==
X-Received: by 2002:a5d:5683:0:b0:2c6:676c:4af with SMTP id f3-20020a5d5683000000b002c6676c04afmr12927717wrv.36.1677255998611;
        Fri, 24 Feb 2023 08:26:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b002be505ab59asm14229155wrn.97.2023.02.24.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:38 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>
Subject: [PATCH v6 5/8] RISC-V: cpufeatures: Put the upper 16 bits of patch ID to work
Date: Fri, 24 Feb 2023 17:26:28 +0100
Message-Id: <20230224162631.405473-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_082640_275847_F6789907 
X-CRM114-Status: GOOD (  17.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

cpufeature IDs are consecutive integers starting at 26, so a 32-bit
patch ID allows an aircraft carrier load of feature IDs. Repurposing
the upper 16 bits still leaves a boat load of feature IDs and gains
16 bits which may be used to control patching on a per patch-site
basis.

This will be initially used in Zicboz's application to clear_page(),
as Zicboz's block size must also be considered. In that case, the
upper 16-bit value's role will be to convey the maximum block size
which the Zicboz clear_page() implementation supports.

cpufeature patch sites which need to check for the existence or
absence of other cpufeatures may also be able to make use of this.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative.h |  4 +++
 arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index c8dea9e94310..58ccd2f8cab7 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -13,10 +13,14 @@
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
 #include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
+#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
+#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
+
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 538779d03311..d424cd76beb1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,12 +274,35 @@ void __init riscv_fill_hwcap(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
+/*
+ * Alternative patch sites consider 48 bits when determining when to patch
+ * the old instruction sequence with the new. These bits are broken into a
+ * 16-bit vendor ID and a 32-bit patch ID. A non-zero vendor ID means the
+ * patch site is for an erratum, identified by the 32-bit patch ID. When
+ * the vendor ID is zero, the patch site is for a cpufeature. cpufeatures
+ * further break down patch ID into two 16-bit numbers. The lower 16 bits
+ * are the cpufeature ID and the upper 16 bits are used for a value specific
+ * to the cpufeature and patch site. If the upper 16 bits are zero, then it
+ * implies no specific value is specified. cpufeatures that want to control
+ * patching on a per-site basis will provide non-zero values and implement
+ * checks here. The checks return true when patching should be done, and
+ * false otherwise.
+ */
+static bool riscv_cpufeature_patch_check(u16 id, u16 value)
+{
+	if (!value)
+		return true;
+
+	return false;
+}
+
 void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 						  struct alt_entry *end,
 						  unsigned int stage)
 {
 	struct alt_entry *alt;
 	void *oldptr, *altptr;
+	u16 id, value;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
@@ -287,13 +310,19 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-		if (alt->patch_id >= RISCV_ISA_EXT_MAX) {
-			WARN(1, "This extension id:%d is not in ISA extension list",
-				alt->patch_id);
+
+		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
+
+		if (id >= RISCV_ISA_EXT_MAX) {
+			WARN(1, "This extension id:%d is not in ISA extension list", id);
 			continue;
 		}
 
-		if (!__riscv_isa_extension_available(NULL, alt->patch_id))
+		if (!__riscv_isa_extension_available(NULL, id))
+			continue;
+
+		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
+		if (!riscv_cpufeature_patch_check(id, value))
 			continue;
 
 		oldptr = ALT_OLD_PTR(alt);
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
