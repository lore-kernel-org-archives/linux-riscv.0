Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D622D3C928
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM4v9AmLMX+0zIAmvmfpxFgSBdNeNHp6B2bYXS0GJKg=; b=GJq4CsFzZq1GSc
	PB0m9ISMvrmUIL0TfOOp6VuVnH8aKGrViB1Ndh15g6zrHhGJ+heQUNUGK0Yh5NuvYIyei9KsXdvUx
	/gw6GvEVtSBON8dwvdPXYIChfJ0ECQIDM7eWZEB4wAocC37BhOrHeW+IoBq3mYXcOpucrTPU5QSWi
	nrTRZhiEP+t2T1YxBJMF2iW9vmA7Xyh1p/wsPX9HbjfBqtW8WMqbS9gM4Z7218KY42ZrY5CTq48T4
	wzpcBbZM6y0Q+sWJw+9iq8njVNc7toqXmJuf08e6D4ldPjFTIwluDXCL1S96IN8gKylCM6/6Sotjk
	xm3tZIQUFNbf2DfDeFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMp9-0000000Fbyi-1hHp;
	Wed, 10 Dec 2025 16:13:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMp6-0000000Fby3-1Xsm
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:13:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-297dc3e299bso333125ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383231; x=1765988031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jLulzX4o5kcNcg2mLO36Qd+pkSMVEEcKu8eC9Bg0ok=;
        b=fUXNIHstbjjWc5LMSklqRxAu/2QEsdi/9ehPQT5WcIZnhytJuLwp3VFngP1jQCkap2
         M03OYssh07GoB0MhChY10Wq16SjiF7JVB1ycH8Ti5LIUCumrqPtMcIvr66UXInEveW5B
         RAQKuvnX5+/pXx30kHBch5sr799Z6rFoMJmMmaedKhp8t+zl5xqaBqYTaahTsbRrhwhX
         9QUGBMy34OD25ZcBr952MDxot4l+Zi0Qw1ZPq0AiZiLq81DJRAHmvhV0H5PhZ0BUrN/T
         0xKYIQG5G32Nszlicwbwy79205G2fOZniyMLeqfiORSwPRCDbrwNihZ4+ku2Fo94UGt5
         uXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383231; x=1765988031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jLulzX4o5kcNcg2mLO36Qd+pkSMVEEcKu8eC9Bg0ok=;
        b=I6HrvMgHe4bNIz1FZfHzB4+hze3shk1Z2H5g3xWHMUHEYDFChM+J0kN3FAcUJ7+lYK
         Gg53lGPOI/RTH4iqXogXYgEs0CQO1InxbwUjh9uaG4lMGSDr+TnTX9J/XFUn0tyVFisY
         DWUE84Xv+ICX/tRRvxz/NZwiaF+vElEuY4GRXn17h1XsC2/x0D5wzfmQfzycGusn7FFn
         swL2vi7ksyCDP53MFhGYs4FZOgBjt89bJNVQr/FM4Tt+ifmGOwQAGycZpuf1X3KVxKH6
         FRh/bXztXspu2eB5YZz/4Ot7QrC9U6k8IOMlgEtGfSkMysBgHdr++aStsuwFqG49az4w
         OoQA==
X-Gm-Message-State: AOJu0YxDX9E3E/VoFZo86KwR7skV1DllXlV/lolDOT1B6pdnR5hrh5Yw
	0YWJexYNOGiCiIXxdGOvdgAv8L4G3nBX+f4OWkqoz7jqrDEz04k1zLfPAFoX3Nvjqls=
X-Gm-Gg: ASbGncsbIL5ocJKJ6lFsFxOE2+xql7Sa1+XpVPgmcmXDdSt/5Kjkfl7d1GAku/Fz7GX
	//DODgBSE4Yu5CFtrzaPahAr+GcVlLKKWnc1ToPOgV1zDuuaqmmix6zJ0kYltIue2TtlUlQolzz
	hbPnd0Mzj19obBzEVFtjdma34MMPfvxcZqQ345/p+n4ve0eIA816exS5dqmeHl6Br/WmuzLVLhz
	LLer2qxDHqkqQcArzh4pdJWpg30yPnB4Ssp8EJu2U6U3YAVxBQjqJTc3TFV9gPJBjF93ggGK8bf
	Xm1KlrxGCnXPkG0DezWV6MCVLMUu8l3H+ABo2/JiDxA2KneHrfgh5iKekyRh6xpP5UyVaXLBBKO
	ZBFkSZa+YEAc5e+VLcUtwD5Fd/gvayYxOe/rODJcnM5QVHEMbi97jT7nX1q3xy6xZ9ZTMmKdCar
	QFhyKyCgt4rESsv3Ejde5Xk/QbPrXKbTeHAOd6BkZkOXI8LRER6daJk7GkTB3yWcCfoaJe2beSa
	RD5tBuTq6Gc5wehsv7LEUQ=
X-Google-Smtp-Source: AGHT+IEAU8N24B/EPazQdWfx88SpemeMEdotLMFEDrpnkvXnhOIR9ppA3qXMWgb1dBRFgm4ZO8RBZg==
X-Received: by 2002:a05:7022:239a:b0:11d:f037:891c with SMTP id a92af1059eb24-11f296ecaeamr1587756c88.44.1765383231291;
        Wed, 10 Dec 2025 08:13:51 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:13:51 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:38 -0800
Subject: [PATCH RFC 01/10] riscv: Standardize extension capitilization
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-1-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=8486;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=1WKxEfgWpJW5Y/4vJJvMgYWzEgjhCSLzMxJDGx9+sF4=;
 b=GyXzSZm2+GBG8FIkFmBsJDnn2dvMLsepCSRBCLpA05cARsuwW8jyX3svDK36JOrPN1+NQZvfu
 E8oxZBULm4CB48hfqcbnOyBY5CLyOYlmkbwKllrcKeNjJjyDfygDZve
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081352_424548_D86D1C05 
X-CRM114-Status: GOOD (  15.37  )
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

The base extensions are often lowercase and were written as lowercase in
hwcap, but other references to these extensions in the kernel are
uppercase. Standardize the case to make it easier to handle macro
expansion.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/hwcap.h     | 18 +++++++++---------
 arch/riscv/include/asm/switch_to.h |  4 ++--
 arch/riscv/kernel/cpufeature.c     | 32 ++++++++++++++++----------------
 arch/riscv/kernel/sys_hwprobe.c    |  4 ++--
 arch/riscv/kvm/vcpu_onereg.c       | 16 ++++++++--------
 5 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..1ed73effc700 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -10,15 +10,15 @@
 
 #include <uapi/asm/hwcap.h>
 
-#define RISCV_ISA_EXT_a		('a' - 'a')
-#define RISCV_ISA_EXT_c		('c' - 'a')
-#define RISCV_ISA_EXT_d		('d' - 'a')
-#define RISCV_ISA_EXT_f		('f' - 'a')
-#define RISCV_ISA_EXT_h		('h' - 'a')
-#define RISCV_ISA_EXT_i		('i' - 'a')
-#define RISCV_ISA_EXT_m		('m' - 'a')
-#define RISCV_ISA_EXT_q		('q' - 'a')
-#define RISCV_ISA_EXT_v		('v' - 'a')
+#define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_C		('c' - 'a')
+#define RISCV_ISA_EXT_D		('d' - 'a')
+#define RISCV_ISA_EXT_F		('f' - 'a')
+#define RISCV_ISA_EXT_H		('h' - 'a')
+#define RISCV_ISA_EXT_I		('i' - 'a')
+#define RISCV_ISA_EXT_M		('m' - 'a')
+#define RISCV_ISA_EXT_Q		('q' - 'a')
+#define RISCV_ISA_EXT_V		('v' - 'a')
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..ff35a4d04f85 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_F) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_D);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72ca768f4e91..47612e9ca1c6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,7 +83,7 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -145,7 +145,7 @@ static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 	 * Due to extension ordering, d is checked before f, so no deferral
 	 * is required.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D)) {
 		pr_warn_once("This kernel does not support systems with F but not D\n");
 		return -EINVAL;
 	}
@@ -188,7 +188,7 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
 	 * Since this function validates vector only, and v/Zve* are probed
 	 * after f/d, there's no need for a deferral here.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return -EINVAL;
 
 	return 0;
@@ -223,7 +223,7 @@ static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
 				  const unsigned long *isa_bitmap)
 {
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -236,7 +236,7 @@ static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
 		return -EINVAL;
 
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -448,15 +448,15 @@ static const unsigned int riscv_c_exts[] = {
  * New entries to this struct should follow the ordering rules described above.
  */
 const struct riscv_isa_ext_data riscv_isa_ext[] = {
-	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
-	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
-	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
-	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
-	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
-	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
-	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
-	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_I),
+	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_M),
+	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_A, riscv_a_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_F, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
+	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
+	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
@@ -847,8 +847,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * marchid.
 		 */
 		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
-			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
-			clear_bit(RISCV_ISA_EXT_v, source_isa);
+			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_V];
+			clear_bit(RISCV_ISA_EXT_V, source_isa);
 		}
 
 		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 199d13f86f31..c9eb28f6ba93 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -80,10 +80,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (has_fpu())
 		pair->value |= RISCV_HWPROBE_IMA_FD;
 
-	if (riscv_isa_extension_available(NULL, c))
+	if (riscv_isa_extension_available(NULL, C))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && riscv_isa_extension_available(NULL, v))
+	if (has_vector() && riscv_isa_extension_available(NULL, V))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 865dae903aa0..b6f5d1a74aec 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -26,14 +26,14 @@
 /* Mapping between KVM ISA Extension ID & guest ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
 	/* Single letter extensions (alphabetically sorted) */
-	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
-	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
-	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
-	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
-	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
-	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
-	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
-	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
+	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_A,
+	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_C,
+	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_D,
+	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_F,
+	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_H,
+	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_I,
+	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_M,
+	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_V,
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SMNPM),
 	KVM_ISA_EXT_ARR(SMSTATEEN),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
