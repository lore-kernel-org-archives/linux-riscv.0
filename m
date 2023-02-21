Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E8FC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFIh4BLnSNdZaWE/jKOfgmohlEl7H6dVUV/URyS6L94=; b=gyRBqd67032u7/
	FI+eeS6i5W+bL2FMt2drYzSrm3zL4NyL+ELTRpJKfGH0twnv7U7PK4N7/EVBFFY5lixNbiwqfi0F/
	yPPfepEG05e2XBj1iB5u8Rl/EQeaaZ0pKfU8z9TL0dY9kW1rzrYqDpS7PDYIZ3Btc+V9IhenQET/H
	x6NQ1MI32U0SEAOnsPatcLZ1a4qXSn0dshP9i5ug01wD/KC+frS5081wSVwyWv4ML5I9OKLr7+Gb5
	yi618t7Qm06U5i01os7q65y9lNm4h4id99gGVkHNH0Oa+Hhh12oWOt1kxtqc78BonFGAa+Yoto8py
	36PW8TjMrrlg+OsswwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqV-009dNQ-L8; Tue, 21 Feb 2023 20:02:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYqU-009dMQ-AI
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=34NFoNBQKweqYqqRRhyhG2y14f8qhVJaos3C6Zb1qCA=; b=Pl9clcDCivNu6j4TFsWaBHpKtt
	P7WH91B+1nZigX/NeVI9TdLrzHIYJn2SnV4G9VJMi4s6xnjDy5se3uiajbNs989vN5kL8/1AqFDMJ
	Ww4gTAy9kBWr+9R+nI4NNg9ye8b4osdxE4xkTGjI3Tn14hpcAo2++9fWs8EUJ7zR6Qi6/Hb1KGOvT
	2TnXD8dSNXb04MrMYCjoOjpyj/qu92dzINe5rSpinvSTR+8ObJaFOiGqiMunZIFDtWJRjCkBUeEya
	lEs+5phDxUhsifCVzgafrbCQvZoGNcDFcivMFtoguW0/hFcDS2Z8V+vGx4kr7SwLAaO4DcyBczf3G
	kYfYf5aQ==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY12-00CGUG-2T
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:31 +0000
Received: by mail-ed1-x536.google.com with SMTP id da10so22604808edb.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34NFoNBQKweqYqqRRhyhG2y14f8qhVJaos3C6Zb1qCA=;
        b=NyDRWGQLHDM4WE1MYSCVp6YW+mR5oILACbgX2cpEbZ+C1DA4Z8a4rlbPwZC2sOFHwf
         cvtP4Kpv/sZisnUc7GoEl3D7AYs9j/bPLf7FoggpE5+IaNqHPNbdm/EF9OyKjWd9pxE2
         maV7OKvNYzIJ59NRQ8+JHyuK2aCSn6MEytvF8cC2+Uta/54D4d1eKP1iOHsN3KLPE/ya
         jjjuouOa5gFoXNYvY+OfVjdmbCvAl0y86fEmEF2f3KSS66UsrVKNGzXOAr3YECL+G8yK
         l05TJwz4xo3MExkf17ynt3J7nCTQQfP/E2yDzqhZc4+RO7GrIgT12sedGQazDqKkgBte
         Z2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34NFoNBQKweqYqqRRhyhG2y14f8qhVJaos3C6Zb1qCA=;
        b=aSoybLdT1FjG0rnnG63x494Euz1OOxaAFvCBmJnx80EoC1DXDR/C5B4cVYtbK+ok84
         yKAUtHFAIuYCuVgrB7iUInHF0cQ99Pz+vjd3h/OJeqDVyIg4ISB2EFa/BTztCOHkIde2
         +XDEtWK9VFoWuF4YQWEzQuJYQt8WSx9b5zSh/QpsRi9ThVpCHA1hWw1Tzq7Cj7UWGBpg
         b5wBfHZJviAvGo/Zofu/1sH4pZ4zr3+t++C233aBABN3FMWE1KypEAA73Tjaj2qqtvEc
         4+Q7gn1BL9LXHSitWdwIOXbOVeqna2nYqn5ctxFYKVoZxzDYL7tqX4zGeKxrhDmxUtX4
         Hoig==
X-Gm-Message-State: AO0yUKVbgni5CBSEv/xmIeQlmaxi1mU1s+qoO+frYkr11Ag/d/0K0idh
	BxVukYEzF0qJSxY2tXkixJ7zbLllKDsvjIww
X-Google-Smtp-Source: AK7set+rFsFWbTWMLIdMY+Q2/Z4HCUYcZHJSaxWuUbHlYQ1cFc34yRDDdrx0axW4+oXkdSAylmamTQ==
X-Received: by 2002:aa7:d705:0:b0:4ac:89b:b605 with SMTP id t5-20020aa7d705000000b004ac089bb605mr7342612edq.22.1677006565381;
        Tue, 21 Feb 2023 11:09:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i25-20020a508719000000b004acb42134c4sm2040769edb.70.2023.02.21.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>
Subject: [PATCH v5 5/8] riscv: cpufeatures: Put the upper 16 bits of patch ID to work
Date: Tue, 21 Feb 2023 20:09:13 +0100
Message-Id: <20230221190916.572454-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190929_084386_1E34A695 
X-CRM114-Status: GOOD (  18.45  )
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
---
 arch/riscv/include/asm/alternative.h |  3 +++
 arch/riscv/kernel/cpufeature.c       | 37 +++++++++++++++++++++++++---
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 8f39d4e8598d..f2cb543b0bd2 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -17,6 +17,9 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
+#define PATCH_ID_CPUFEATURE_ID(p)		((u16)((u32)(p) & 0xffff))
+#define PATCH_ID_CPUFEATURE_VALUE(p)		((u16)(((u32)(p) >> 16) & 0xffff))
+
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6102b6bb5db3..0594989ead63 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -273,12 +273,35 @@ void __init riscv_fill_hwcap(void)
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
@@ -286,13 +309,19 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
