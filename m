Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F6E63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 05:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z30B05nnMJAE02G4m0UPo//Kim4E2c2kgR6YXlbdo90=; b=RHS1KhYDhdFOyB
	H/jM24yYgjzWRfePT77IZeOprIHBf8a6p9O813fLL5QXAnGGS4DelHYtltrO8tWDno57x0w88/46I
	uEQjhiEZxO1ubCLiiwq+U50Nx3fiLxxSde3mctrQYCZhLRf7dt/QihXRBFsvcm5KlZHXDDNr63jIZ
	TjIpp9jkC7BtErqHNhyyY60tV0rYmut626Gr1r6He7md++wPOP8ruxlb6g+BCdueSfpuamC/LOshT
	faLgAtSfkSf1zdZhDf6SHuu245RomO1H4bp3FKr6crz5pyqxQ0bGjIMlqUHSTglXGxITNXxLzj9Nx
	H4BRSi9T5MOX0AfLoR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjszB-0000000Asrh-3bgO;
	Sun, 25 Jan 2026 05:48:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjszA-0000000AsrA-1AXU
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 05:48:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1798661b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 21:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769320111; x=1769924911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQeXE83sx7gap+YTDZDQSdBwe9aoYbsG4akyTawLjBk=;
        b=dVyNCIUEPvflH+smp3uBADwQ7HJkG8avidYFpWU+ZG9INQ6bcYpQpbjeQgZHvmkOad
         /fRALAzjLEE/IvF24qXDKhE6/h6qtNLIjnRJWyED7w3AaRLgDWKpByLznyx1reZnl0bL
         R/LUrZiPBskZ6xzlLSvEDmeCU2jpBPHK5KWpH1gOXSWHBI2Jmh+tz85Pg51vM+R1cw4u
         ksMcf4hblSAzwWkYYvWKbtKtAEbdOQAqnOlVyriiQwVcgAKO0vP3QGQVxGsHzyV7xPIn
         zIJl3X6Z3laKxm9omDGx63eIMzlMoGPzpfGJD70u2wi6rzj8n4IMP62LHQuiPZbguy+R
         e0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769320111; x=1769924911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQeXE83sx7gap+YTDZDQSdBwe9aoYbsG4akyTawLjBk=;
        b=SAHPsqRWTNIqHDnAWpCfANJzhtiaLJ6FOOmjZYUJjkOdtW89AEDZvtYk1aQsghAPvp
         e6pK0xFXjoxqopg1Yg5xALcYog3siPYq18P3drG8RtLEwYi/+cht+XWUW1w5NsITDWYl
         uAdBzoZgSsTpASRaP2cRqaRvmdku4I4C9XYTABKmY/nRYwDImdpdUAQYcZ9XZJhNTF3A
         37713w6s9Ed9wFTqLO/GyM3BU45u4rSETRbZIYL6uMo3Jv0QsZZ29dzWSdbVyIzlvTRb
         cmabl82zT6S+MGYkJGEfyIosWaTfhaB7r3ByayqyLwjXHIiX0gX9z1DUWTLb97OTn9i/
         vHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/nNOpDZluCfo3xIYppqMrmrrJAi9S5G0VV2dXOXsqBitmbLLuc4RhA3mchWVOHF1S4FLn39YjPcc7UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YymX/RWg7mS4hVa7+dlvSafjf5wJhHRnEVJ8Z8Cp47ABjC7fFe1
	x7dqfztKosF2PF0gHEAoB6nA5TghtPt1Jb0dP6nlskhcZ8j4XANRbDdVLu8C6rtaqso=
X-Gm-Gg: AZuq6aJCrqEd9KtfFILlwNujAuEozjXT47A2hWm34TXQHRFikGnUba1Ku/ulqYdn+sU
	zcdQ8c+mSaPuce2Rd32JP2lHPVbV50OPBjUvI0RU21X+590+2jOi7+N4mPfel/zpmVrUCWDP8Y2
	Mta3r8NncmOo8z8JxfGxZ1P+gD4IdC0DbdrpUZWLxTA3hDxfhCPUCYO+n+dUATBWxosoV0GDjmc
	jXLXCJefmKDonxRmaWl4QFHrurq/Kyy+KygG21O7wbXrR9CcUnVeZ2m/8Z5AyeBz5TrwHqUT7Mh
	JGtYU55y4Lg8covqc/gMVGrda9LSq9MzrC68MfeCjrws8zBeEPlSa+lXwiXY1BCK10omO+cZf+W
	QSyAuC18Lrm79XeBxS8qvM9fnMuE7o1Qp7axkCSqg0M7bfd2AgBHg6iUtRdli+f4hInvapA9p5R
	D79jHGJdTxC6s4+TOOUcfASAifgU+eSH+l/+pLNaqX/A==
X-Received: by 2002:a05:6a00:9511:b0:823:135e:7336 with SMTP id d2e1a72fcca58-823412a3382mr712548b3a.53.1769320111277;
        Sat, 24 Jan 2026 21:48:31 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f1ebesm5680016a12.19.2026.01.24.21.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 21:48:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 25 Jan 2026 09:36:07 +0800
Subject: [PATCH v2 2/3] riscv: cpufeature: Add ISA extension parsing for
 Supm
MIME-Version: 1.0
Message-Id: <20260125-supm-ext-id-v2-2-1e3b9714c860@riscstar.com>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
In-Reply-To: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_214832_329101_A14131C2 
X-CRM114-Status: GOOD (  15.83  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/#r [1]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/#r [2]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Reviewed-by from Conor.
    Update RISCV_ISA_EXT_SUPM id to solve rebase conflict.
---
 arch/riscv/include/asm/hwcap.h |  3 +--
 arch/riscv/kernel/cpufeature.c | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7ef8e5f55c8d..aa2af21f3bd3 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_SUPM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -120,10 +121,8 @@
 
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
-#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
-#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1734f9a4c2fd..e1f7ad882289 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -317,6 +317,27 @@ static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
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
@@ -450,6 +471,15 @@ static const unsigned int riscv_c_exts[] = {
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
@@ -577,12 +607,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
