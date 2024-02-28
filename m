Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2501C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCwYivWGjeeAQYz1RNhMnOLma76TFHMNnVdCMoDf1CM=; b=yVjp+CNXqSjkBG
	ZtT3QJM1CK6whtsH87J3HL2wxiTFssjl/ILUoHaVQA01fsDkBp9ERCO0WeOzvGPHzS9+H0OEW+WD1
	OT1GY7x41TE1i5eabugAZEL+FS3hJbi9r/1omwaut/v/tbl9dwiPq7YzBk2KLgVamOBxZ07INKzO9
	VgmdzYA+pHfwahgtnGwe2FjTsoqCC9xvNzK6+IYKJcNDvi739asd8hM4HCKjFIe6KNhgHGlsH5qL/
	5512AhfRoQDMUtEbr9KZTKdjNnCxa6Swn41usA05p0hq1UxMnjiagGUGM6HHdo5tFPEODWURQxaNH
	yWZCUoVhm1X2QWpDcWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrP-00000008EK1-4BMH;
	Wed, 28 Feb 2024 06:56:12 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrL-00000008EIP-23aa
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 06:56:08 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ddf26eba3cso4004045a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709103364; x=1709708164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nifjTiVnKPzVz5Xx9U5qG6fvYEiI7lPtCucGoxbvIpQ=;
        b=JqkFZwTQ5Fyjur/4+a1mu2EFbXhCqAi4j0xRaConeSCdKuj40EIOaq2e1K/xedK8of
         ougfYxTlhPnPDza6Ow6n3TQuGTXIQfBgQKCMEFUlVhp9u6sBzRwOyr02gPoa6FOQI4Em
         A1dsC4/qlR5lZjKFz9Z4lDpOl6H0VQN3fhd/MHfQzXRnaLn6l6rcUN4HqAemC3exhDHJ
         2aIPUkpM6HB22nm4e1uWTEKJ4SfxHQFo4tVaQavqz0xb1hwVBW3TrPcgoJACmwWG7nHe
         bE8hpwQBcBmiC1C2PKM19GYE1jdvZlMaGr+37qP+8py8yfBSBlyQyAlEefFEWuq8j7Et
         2ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709103364; x=1709708164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nifjTiVnKPzVz5Xx9U5qG6fvYEiI7lPtCucGoxbvIpQ=;
        b=SJxTmkxKvkFIEJt4MQPBvHezU5MrGdxqx0NNMX57BZ3h95bvXZ+SQGOWTBoaQc5NcS
         tVLiinR2O1wGB0g882UyO4HbVgGTSWSVSSo97ttcowl4c4WN7Tz32taQwklQtiVJW4U4
         8VFgbvubRifDfCJdH9cetDQV7wXeNWNCv51SVJdfT4HVI8lJK8YfQ0eLyG3iswA3PBuV
         PQ3+ogf/FcmoEvIeyRwhzzjmO1viYOPQ/xCvbWkibpvrWCpayGwOpxCTy9QEqJCckhD+
         S/0/phr2K8YVStWwQAhZ774x8sLqtcQjYkGsumti3ltFkNOVP5FkBgO7drVA2laXmfUz
         kcew==
X-Forwarded-Encrypted: i=1; AJvYcCWcPA2xsOV8QQbB7r9Wkfw9mM7JtafYsASUaCcln70WfEiDtKG5irL0W2fyC2ygoHtDizOVRGR80QoKvmLFV/rI018sXUAQfnrrQfdlNOy9
X-Gm-Message-State: AOJu0YwXV1PP/2NahlKu13fgIkNbObEAYoEk7+qfbHSV/7VgMknFTWLK
	8ClIHB4wsJmeepXhtDkoV1IT3WokrM2Ozr5rml+Aw0Ag78BAeTCN/WkQsN6m6/k=
X-Google-Smtp-Source: AGHT+IH4U8aBkFA2SKkKEolatXoRyjbjHcx5laQ73wGPgxVUxDCeFNHOySd/fRV8xKBko/SIfS+RIA==
X-Received: by 2002:a05:6870:e2d3:b0:21f:aa70:4c2b with SMTP id w19-20020a056870e2d300b0021faa704c2bmr13648589oad.12.1709103364136;
        Tue, 27 Feb 2024 22:56:04 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006e5590729aasm1010112pff.89.2024.02.27.22.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:56:03 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v4 2/3] riscv: Add a custom ISA extension for the [ms]envcfg CSR
Date: Tue, 27 Feb 2024 22:55:34 -0800
Message-ID: <20240228065559.3434837-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240228065559.3434837-1-samuel.holland@sifive.com>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_225607_550162_6ED1C419 
X-CRM114-Status: GOOD (  18.31  )
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

The [ms]envcfg CSR was added in version 1.12 of the RISC-V privileged
ISA (aka S[ms]1p12). However, bits in this CSR are defined by several
other extensions which may be implemented separately from any particular
version of the privileged ISA (for example, some unrelated errata may
prevent an implementation from claiming conformance with Ss1p12). As a
result, Linux cannot simply use the privileged ISA version to determine
if the CSR is present. It must also check if any of these other
extensions are implemented. It also cannot probe the existence of the
CSR at runtime, because Linux does not require Sstrict, so (in the
absence of additional information) it cannot know if a CSR at that
address is [ms]envcfg or part of some non-conforming vendor extension.

Since there are several standard extensions that imply the existence of
the [ms]envcfg CSR, it becomes unwieldy to check for all of them
wherever the CSR is accessed. Instead, define a custom Xlinuxenvcfg ISA
extension bit that is implied by the other extensions and denotes that
the CSR exists as defined in the privileged ISA, containing at least one
of the fields common between menvcfg and senvcfg.

This extension does not need to be parsed from the devicetree or ISA
string because it can only be implemented as a subset of some other
standard extension.

Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/riscv/include/asm/hwcap.h |  2 ++
 arch/riscv/kernel/cpufeature.c | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..1f2d2599c655 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,8 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 
+#define RISCV_ISA_EXT_XLINUXENVCFG	127
+
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c5b13f7dd482..dacffef68ce2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -201,6 +201,16 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+/*
+ * While the [ms]envcfg CSRs were not defined until version 1.12 of the RISC-V
+ * privileged ISA, the existence of the CSRs is implied by any extension which
+ * specifies [ms]envcfg bit(s). Hence, we define a custom ISA extension for the
+ * existence of the CSR, and treat it as a subset of those other extensions.
+ */
+static const unsigned int riscv_xlinuxenvcfg_exts[] = {
+	RISCV_ISA_EXT_XLINUXENVCFG
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -250,8 +260,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
 	__RISCV_ISA_EXT_DATA(v, RISCV_ISA_EXT_v),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
+	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
