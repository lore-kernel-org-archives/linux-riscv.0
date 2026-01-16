Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B02D4A5E4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N74OVycZQ9PzfFPQhK2bX4ClxCiPeZMHHrW6bDdVsxo=; b=1ynOgMM5b0SQy3
	q4qOjVak6UxEsqk4x2cEyqcWK4nHtLJcn+ymbrOflEVF35aMgTzA4uPxO9ciHlZtyM1z7zOEfP6QJ
	kt+FcGUoP+srSBa3GW6p3WATiSyESWATPBjZu8Sq2Jo28Nja75jiTEtyJAx9IAH3ApOgRQtCvEp6o
	vGtGkWnd39KpCfpw/ZfF1k8ZXl1ACdy3DjdgFHQEgJEX2bhgDTVHFdsFpsIKTWAiAXv/GgRL9vB9Q
	TAUYgk8x4EYB8CzDFnrjiN1dsk/h27dXxeU3FgFI8wqb1ymzRN/Ztb+GNxzKeyO8pm4rP8uLAn25U
	82Cn4ieAi/dUae/h+hfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIq-0000000DRuj-2gHX;
	Fri, 16 Jan 2026 02:11:08 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIl-0000000DRtI-3LMA
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:11:05 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso804587a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 18:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768529463; x=1769134263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXny++fuaUYh/9d0tAiw1EejR1b07lFNBxlkkPwo9D4=;
        b=dTvDE/3+qMOWjP3jqKgrHov9xJBlfJIV7VFoI8wfCs5i6ibIQeazj79sqGEgsHxoZu
         6UfgnG6IaMm5DPv8Vidb0jk/n8uqXL8X5tymtPsmWCMOB9UKkcdNS+k3l1ICkdBbBlow
         +S5HBV30RUeGZK9q78EhylgewIIamQDl4EjzHEKsq6v4a29WaPOkKdgfV4VZmkg0hOA3
         +HThleLoTNv+9nhcsIbRRsQN8GW62Sg+V4WQL44FnHxfidyn90E0QBB/SLTyq1C50aKq
         AQ0SskVz6UHItCyLiLMVI+Bjwz9hgLgLoZPwFO/V0R74ubu/bebb24mQccWgForXKzmy
         mB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529463; x=1769134263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXny++fuaUYh/9d0tAiw1EejR1b07lFNBxlkkPwo9D4=;
        b=sL2xbz4xEOKvq9cqd9r3CdKfMLyBzczuQljx+MsTqgt5yoWtmG1n2lSTy7cobklwmj
         bWThSPpE3BOehbHJjiEJe4A52PBTZ+csWVuNpAv6FWZqZEIb/5sdX1JuUP4uDFNvFkdE
         2m4gVSO/zlPAdscJaE/5IOKsQFeoG/utA+EsuAusQKiPCFJx8z5omfcgk84d75x3VPjl
         7SI83t6FN8VkqcfpFu3Q2XBfsZ17OYrnIarM28a6VJ3UVmJLf/1RfZEkPFU0EBliFNWJ
         JyDLqlyyHKHeDS0j9F+WfKH1P3q9aNp1mMR9bBOoxTyrF6epnAFLuH1vQYHUMPXK6S4/
         QdRw==
X-Forwarded-Encrypted: i=1; AJvYcCXS1kZEagqZfRJ3bvAMYFKu20hWTyJgIG554ruPo+hoMiaY3MTBSQCqYZ0Y48qV6yp4Lk2GW4uhDq38/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXlRPR7oLt/1LppciqX3fJgU5WYx/9MfRcBtsKVD772HrZER9y
	s1KtFHURL+6s/fbwXVeBGgBy0ilGq8MKmp6fRqCW7SqkRQ0FpvTajRO0rmTo86TrAyPHQEhmvnq
	xlo5v5m/9IA==
X-Gm-Gg: AY/fxX64mUjAZPiVhdlqtdQowT0LzapV6ybnyEeLWzRmHGYbzhsu1fkeMsqv5Jjd+cI
	uT6Y/eoyQM9LiyI+k2OvHP1OohCmPA0b7gmOL+bf/41NtsbkChLWK8pOF+7GJI7rpxKXR3MROsK
	D90136KixdQO34C6kA7NR41gDdCBSsfSCnw4rLjQVFE5WJASF1JHTP6Agm9bCBjIzF+W1/mpwoJ
	Z3AcfqHPLuqObE0usVBBGTNkjuLw/0r6zHuGPyPzjg6lrydXy1L94A91PGdbEGXdveRLuCOlcKb
	S6ix2fC8dB9WN2uxkmaU9wRxmFWwdTIZtycZjqjP+m470Y1mQOQFXCZOIqHBUa+LuyuTs4QWdwr
	pKPD0oDZ4RIat2oQE3nJM66NVyZq+GfpgryMUDsU5l8OAPpMeOXOCxKDtDs9zdyquSlhPe2gHsy
	dfMjWu0Vxkx/XgczcFs1EFfBb5zzxIxvmgIJjGDgmTRJf/z0rpChV3pQ==
X-Received: by 2002:a17:90b:1e0b:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-35272f028a0mr1410360a91.12.1768529462750;
        Thu, 15 Jan 2026 18:11:02 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273298968sm364317a91.0.2026.01.15.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:11:02 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 16 Jan 2026 10:10:32 +0800
Subject: [PATCH 2/3] riscv: cpufeature: Add ISA extension parsing for Supm
MIME-Version: 1.0
Message-Id: <20260116-supm-ext-id-v1-2-5fcf778ba4a6@riscstar.com>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
In-Reply-To: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181104_203012_2012572D 
X-CRM114-Status: GOOD (  15.33  )
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

Supm has been ratified in the RISC-V Pointer Masking specification
(Version 1.0, 10/2024) and is mandated in RVA23 Profiles (Version 1.0,
2024-10-17) for RVA23U64. Supm indicates userspace pointer masking
support.

Remove the previous macro aliasing of Supm to Ssnpm/Smnpm in hwcap.h,
treating Supm as a distinct RISC-V ISA extension ID.

Add ISA parsing logic for Supm, and implement a validator to ensure
that Supm is only reported as available if Kconfig allows it and the
underlying Ssnpm (for supervisor mode) or Smnpm (for machine mode)
extension is present. Supm relies on Ssnpm or Smnpm to provide the
underlying hardware implementation.

With this change, "supm" will be reported (when available) in
/proc/cpuinfo as part of the "isa" and "hart isa" string.

Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/#r [1]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/#r [2]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  3 +--
 arch/riscv/kernel/cpufeature.c | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4369a2338541..7653e5cff9ae 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -110,6 +110,7 @@
 #define RISCV_ISA_EXT_ZALASR		101
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
+#define RISCV_ISA_EXT_SUPM		104
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -118,10 +119,8 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
-#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
-#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fa591aff9d33..39680280f858 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -296,6 +296,27 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_supm_validate(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
+		return -EINVAL;
+
+	/*
+	 * Supm requires Ssnpm for S-mode or Smnpm for M-mode to provide
+	 * pointer masking for the U-mode execution environment.
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
+		if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SMNPM))
+			return 0;
+	} else {
+		if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSNPM))
+			return 0;
+	}
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -429,6 +450,15 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+/*
+ * Smnpm and Ssnpm provide pointer masking for the next lower privilege mode
+ * (U-mode), thus enabling Supm. Both extensions imply the same subset.
+ */
+static const unsigned int riscv_supm_exts[] = {
+	RISCV_ISA_EXT_XLINUXENVCFG,
+	RISCV_ISA_EXT_SUPM
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -552,12 +582,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
-	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
-	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA_VALIDATE(supm, RISCV_ISA_EXT_SUPM, riscv_ext_supm_validate),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
 	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
