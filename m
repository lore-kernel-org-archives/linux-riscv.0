Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7974C531DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fy9OdlpsNbSsgBkVN9d0UT9qRvMskxT7FtQXKIB8Qvw=; b=3Vi2XWup1re+s+
	uxyVY0eWxZh4bgxFg1IRVGuzddsiYk2FXTPV8ghBRsuAPNaCYciPHjot9KeN+A8ti0HG82O7JvY6n
	Ug+FKPmJxZhOZNmwkS+uGoCl50rtgs6A2cA5b570khYYPSurDXrQuYgNgFEdIwKS7KMOCLfdOJEpI
	4+61dULGZh0UC0Nm0GCGmfsy13YdPJgIXMPVS8EiCD+QZM90mZvUJxFgsYBu0W8C0dI93GQ3yq6mP
	z6PYvZkjx+7qzKlCrtMPKLFDZbyfyfd8+NB2nSSsMqitW2IdyPOX9FTN0miZ629a+BWmg3vpVBrw4
	astrwB77QZEsGWhAEC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99d-00000006Cbz-0fXG;
	Wed, 14 Aug 2024 08:14:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99Z-00000006Ca3-0Qm5
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fc65329979so58091645ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623284; x=1724228084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSgZOujLUXDH9o1etb/5haehfTStX4t+faWX1F0nYt8=;
        b=do+XJKs+CbPThZ+80YtrXGGCcBPyQ4fChY/P1ROoWz6sR/9DAHwjSby4NSiJh/xozN
         8a15JPb10mDIt9Pr549rlIZ8k0EK4iC2n8yrYP89HzDXV/7PblqhRHnOhXChpu+6h0ZJ
         YKvgv9oIh7EZfaY1N9O2TT4U5epY51L0OQUFZwGacdR0de0+s+CRqEfDqPqnViqc8Vr3
         wki7fsGPVrlteoZrHNHPcziZ7qtc4iEPvnBozr/FFX3ui5R70CqNwikEGaI9dG6X2FGu
         I9p5/Y4fwm7VfaDVNWDlPB0oeTBrQekcZcPs6msac+c+dadaMSQmC+OOkoMDWSB8KTyz
         5e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623284; x=1724228084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSgZOujLUXDH9o1etb/5haehfTStX4t+faWX1F0nYt8=;
        b=alf68yBZ7pPcnYYTk8nY7CNWcUeRb7d8H6fg5Ff0D7VaYrMkHz49s8K3+Cy6lodQfw
         5qMGTlzK1jC9jIt0RZsPNn5Yl2QaeK6H+EoUZjcpi2FlohPTZrcIOONY0FpBhD1bFcR/
         0wz32MjSI6DJXeJBy3aH2bQmmje6ZY6EUsuWvm8KrdDaf7mJPRc21pCaMyXb+/OKR6yG
         T+G6Iloh20GgXChpdfU2DEdyou7rptmaY/VOLIwfyTh6RfD2XUy0nYvtAwjyrf1AlI+S
         8xyYUDR1cjIJh7cIulOi9s1nh+8h5bfNcEsjb3v8/aiQFg7skMO9LFV6LR5SBojiZ3cX
         mAnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+lhMmEPSSsGCbOGD5FbV0MfN63rHQp7QuKu9SzMAfaoxUJxkD3JsYcztHoBP7aV5myawtGH5u7KbsXNqPpOZGmPcxp9K3v1M27Mc37T4j
X-Gm-Message-State: AOJu0YyGUp3ZWqiG5gqDW9SJQgpq8uBjtTw8JOy1fH9KsciEbr9Cv6Pj
	dTDnycsSPIlM3CfZuIgyEwzNgjsN4H3iZSPJEk4RtLHN6hTV3s++JcAJXtsfsNY=
X-Google-Smtp-Source: AGHT+IG+a2m+/9sMeNFVsmOPDs6cpFe3Chf10rX/9ctWB1qlB00BUSlmUsaT4HBT1vf9N63Oh33I5A==
X-Received: by 2002:a17:902:ecd1:b0:201:de37:349d with SMTP id d9443c01a7336-201de373639mr4868195ad.54.1723623284293;
        Wed, 14 Aug 2024 01:14:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:43 -0700 (PDT)
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
Subject: [PATCH v3 03/10] riscv: Add CSR definitions for pointer masking
Date: Wed, 14 Aug 2024 01:13:30 -0700
Message-ID: <20240814081437.956855-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011445_166081_8B702D13 
X-CRM114-Status: GOOD (  10.07  )
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

Pointer masking is controlled via a two-bit PMM field, which appears in
various CSRs depending on which extensions are implemented. Smmpm adds
the field to mseccfg; Smnpm adds the field to menvcfg; Ssnpm adds the
field to senvcfg. If the H extension is implemented, Ssnpm also defines
henvcfg.PMM and hstatus.HUPMM.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Use shifts instead of large numbers in ENVCFG_PMM* macro definitions

Changes in v2:
 - Use the correct name for the hstatus.HUPMM field

 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..fe5d4eb9adea 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -119,6 +119,10 @@
 
 /* HSTATUS flags */
 #ifdef CONFIG_64BIT
+#define HSTATUS_HUPMM		_AC(0x3000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_0	_AC(0x0000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_7	_AC(0x2000000000000, UL)
+#define HSTATUS_HUPMM_PMLEN_16	_AC(0x3000000000000, UL)
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
@@ -195,6 +199,10 @@
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
+#define ENVCFG_PMM			(_AC(0x3, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
+#define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
@@ -216,6 +224,12 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* mseccfg bits */
+#define MSECCFG_PMM			ENVCFG_PMM
+#define MSECCFG_PMM_PMLEN_0		ENVCFG_PMM_PMLEN_0
+#define MSECCFG_PMM_PMLEN_7		ENVCFG_PMM_PMLEN_7
+#define MSECCFG_PMM_PMLEN_16		ENVCFG_PMM_PMLEN_16
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
@@ -382,6 +396,8 @@
 #define CSR_MIP			0x344
 #define CSR_PMPCFG0		0x3a0
 #define CSR_PMPADDR0		0x3b0
+#define CSR_MSECCFG		0x747
+#define CSR_MSECCFGH		0x757
 #define CSR_MVENDORID		0xf11
 #define CSR_MARCHID		0xf12
 #define CSR_MIMPID		0xf13
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
