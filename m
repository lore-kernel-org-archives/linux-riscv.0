Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A048C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38T+D+nKb4ZKz/4QR4EtJj6SbvJQ0AubjpJFu6H2eW8=; b=pvdhbSSiK6ka4N
	8jnzxdSPzvPR/ZC81t2qiduVWaMGfSLTY0lrExWCh4dPMVnjWeH95Hyb10J7D7WLZmg03HPvrGgWl
	0Jvu5KVW2vYVnU7/RujMI8ZS6YWMzjtczQ3sP0vTg9tX4HkbRJMsMmhIZq+dxiXsnbO1QcN0y5LBF
	yKzoLve/UCwf/aU4GrH6Gf7sHhbCVCyaUkEOkEHq5CS9XIW1sEz3aOkEdk/bSJGyfyock6Ku4Hl7Y
	PzRrfsrvzsl5je6bhqGoSQ0qOtvyFuzmJOIunXveHREQJk5If2fO7Bzo646vDCIHlmgIcmIkJ5H34
	XSKI9ekmQ1pSjimcUsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY2-000000003ct-10E7;
	Thu, 29 Aug 2024 01:02:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTXy-000000003bM-11N3
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:01:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so110156b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893317; x=1725498117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG+HhHQwJZyYDPSqWXytdNleBw1x1orMvGaUGC5rVdM=;
        b=YfYm5nxD8lK4e6LurA9bI8iQP0ZCoEO2SuEtmIpAb4fPZ+kLzpwyxjg55K62cAOKbN
         sz2dQjppesCLcPb4TdJa2z7dzzR2ljpP+3DBJ6JL/GyfcdK/JfXoqvtPrq3tRVafk1P/
         6WJc5gdlV3yEmGSH48yxro9iQ9HrDKNP0cA3jdxwe0q0G6QmRQaf9VltnJlUXik+Eggk
         sF6tkbmtsuCEb0DVjAFJobubzFLQt5a+aSJ0jk85voum70Qgf/VOhEdFPwTvRp4qrAJ1
         RsIfWN3pBOsxVsz3SJOdgclt9thbT60AhZUFbhUYrYeBdckwigDsJSsRIQwc7xuvBXif
         eDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893317; x=1725498117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG+HhHQwJZyYDPSqWXytdNleBw1x1orMvGaUGC5rVdM=;
        b=CtOgQ9NOlVqhlQ0W0nkU3MAq6/V0xeQkP7pynY5j+hp6819Aj0C1tQy9eXJDj0434k
         X+eoKPuo+vMKeFYFpPCmr6UFPrGIqiuGnrTBPts7Qcrmums5NbIU4AM8EDrFBp8QYuxp
         CqGx7wkvkLxr980ycbNDc282/jsNRhR/CqXmhapCrN9mrk3jZ6+8vP422ZBAUK/fnl2z
         i2EGfp+g2nnJdtt7I3z2QQ/SvjbRsLIhE4VdfMle2Nf3SlKRM7I2fGc3DJTdSk9b8xJ2
         +PpjQI1iLt3kgyaXSGUY4H2n9vONngXEQlbiLX4RpQ68z2cZbYA4va60Exuj3rlyybf+
         2Skw==
X-Forwarded-Encrypted: i=1; AJvYcCV6wwRR+lzA4ZjeNQFHf/AcROkrzYOFMILAOjRC8sUddzS5+JkYREVYtHwOkCrbciyedi0uzmc0IptNtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyL793oruxOaaBbOCAL+wcPqtXVLUesWJdjlcwe/M3AFhIdXI7
	utlW1FJ6sLQtWBKJrJLth4Ig6jn8buhCiv7HU2XjT+m6Jf6HOJUcfo17xht0/E0=
X-Google-Smtp-Source: AGHT+IHXB3sOFlz5wc2v/ZX1VlSZzqk3ek5ZPHncWXvfSK2QDoK6tsVnueohSEGQZAci3rskyhyBIw==
X-Received: by 2002:a05:6a21:460c:b0:1c4:d05c:a967 with SMTP id adf61e73a8af0-1cce10fdc89mr1209674637.51.1724893317164;
        Wed, 28 Aug 2024 18:01:57 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:01:56 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 02/10] riscv: Add ISA extension parsing for pointer masking
Date: Wed, 28 Aug 2024 18:01:24 -0700
Message-ID: <20240829010151.2813377-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180158_306962_A5E79AB7 
X-CRM114-Status: GOOD (  12.30  )
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

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them. The
specific extension which provides pointer masking support to userspace
(Supm) depends on the kernel's privilege mode, so provide a macro to
abstract this selection.

Smmpm implies the existence of the mseccfg CSR. As it is the only user
of this CSR so far, there is no need for an Xlinuxmseccfg extension.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Rebase on riscv/for-next (ISA extension list conflicts)
 - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere

Changes in v2:
 - Provide macros for the extension affecting the kernel and userspace

 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5a0bd27fd11a..aff21c6fc9b6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -92,6 +92,9 @@
 #define RISCV_ISA_EXT_ZCF		83
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
+#define RISCV_ISA_EXT_SMMPM		86
+#define RISCV_ISA_EXT_SMNPM		87
+#define RISCV_ISA_EXT_SSNPM		88
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -100,8 +103,10 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3b9735cb19a..ba3dc16e14dc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -377,9 +377,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
+	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
