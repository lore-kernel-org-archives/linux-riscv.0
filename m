Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DECCC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubKW5W94Nl2tjWaNPfSZ+qoUL/Lg7NC+yUWwLVFRV3g=; b=La+mY1wp9nlv0P
	1ymX5fQD0CPynZOXvnDvF8JQOPt4uc0Uyx1OHhEaHtO/t+9d1+D9IdCdQ6DecV12bAXVUBzI7Wikh
	6QOypU4R89hkBB4WweTuFSQJDTuDkLcswZg1lZU5MA5MRBr5bGAgYPStYuPlIlrJWT5HAdK9y3yux
	KcckAwCF3pIoCqVbcRRPbu6pkItPYXPRajuVFRYLzrlRLsUqJZSU7jJaHZG5D9iRcmYn9/XZlAH4K
	P68R71IHHiC77Gc4RIA7ihmTdTAEY2yyUsIgys2snRckqz0GEdDTeS9F3922M5Kr6SUG3p5/pO/f1
	YfucDWR+oBMTgQqB3V9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M96-00000002v2x-04Xo;
	Wed, 15 May 2024 21:26:44 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M8x-00000002ux1-0Yyy
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:26:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f457853950so5500105b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715808393; x=1716413193; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDtIgLWGCijnY5frMModlDzzsx4r72xgdzFlwdF2fSc=;
        b=Ur896AJ6coDg5Y+Wyxnf9n22vJTw6ngeq3RJ8mXpa0PIbNjTUQpPH1hA92Q2NMqq80
         c40YTAC7hSnv+qN6VDLpFG+asrylJ80OKQ6PZxDD67k7vcuDCmZjZT2QcnLWuH3ki+6X
         RRrkyWRySi7F8fj44cVdXYuTLtHO0EEPNjd3wDveX3gRJPT4PIb4TOfQsxd8knCZFCN1
         uADdUBOfP2S78TSAyEJijzBytmoib1iRRwtahwKfG7x05wuPbqi8CoJg0vgmiyUsrNRl
         lNUxV9Ih+FWMSdWuZueFLIX9+zEU1LiMa/dwGs3LMbuhN+QuuNPcb6POW9GVXpLfQy37
         4Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715808393; x=1716413193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDtIgLWGCijnY5frMModlDzzsx4r72xgdzFlwdF2fSc=;
        b=YDaze2HAuay8KwqaxtznwpArirPxtNNf2KKb4CJT4XGxNo/ohCZejM2Snicyt3+/8+
         hCRpzXodddM59q+GabWmWu1iDlnt19YNS6Kqf2K2hIpjDsJWdKQywPCachvJ0nscQNeF
         C6hcH1nQ+SIyxeVyB0VNJb8EL7vee7K456BFsLUp/bVFX3bBdvBkuArx3iUyd+ajVpNN
         XwMVhegqmJZTjTk0zSyuPxDwwhqoLw7yy5N1NUNh2Tg3Lul3H7hFB+KQDWpZZX1rCzbq
         p1z3U01CCxfqfxe6nChfp3TjCvlDnwyY/+WpG2C1Dzfoz1KgqokItarsG42LHExBBPHu
         l+kw==
X-Gm-Message-State: AOJu0YzjueMKZxATDA3rVRRFWlDuKAjtkYyBI4wz5WKQtEcmHQFb0zQX
	GgYSKUUAnZkO/N6DBL/yAJg/U1FgBkJ+TDEsMEs9AAXCii4Pvdoy+Gr+LGGDSkU=
X-Google-Smtp-Source: AGHT+IEQ0cRrnKhxXtXXOUeS2dwj2KmFrvDhjaiKlSSegYxOQceqkmUq44b1FyjmSjDSyX7wZk/AdQ==
X-Received: by 2002:a05:6a20:914f:b0:1a8:2cd1:e493 with SMTP id adf61e73a8af0-1afde1c576amr25685367637.29.1715808392929;
        Wed, 15 May 2024 14:26:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2b30sm11970243b3a.146.2024.05.15.14.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:26:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 15 May 2024 14:26:15 -0700
Subject: [PATCH 3/4] riscv: Introduce vendor variants of extension helpers
MIME-Version: 1.0
Message-Id: <20240515-support_vendor_extensions-v1-3-b05dd5ea7d8d@rivosinc.com>
References: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
In-Reply-To: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715808387; l=4493;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=y0IR/Pz2QI3qpm178zym3SvfojJCPcK8YuTJj6uOgT4=;
 b=vKx5bPU55zbslweXIsFZqrbVFdAu+OBTPNcIb6wrQD7wYHe6AuPWLrKFZuT2gZ9AwLNwe3+Gh
 lh/gKnjT/FpDj+ZZuCjWsH0yqH1wVLfN6eUJonuy3kN6zegtORWpeJM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_142635_355821_7CC60DB6 
X-CRM114-Status: GOOD (  11.37  )
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

Vendor extensions are maintained in per-vendor structs (separate from
standard extensions which live in riscv_isa). Create vendor variants for
the existing extension helpers to interface with the riscv_isa_vendor
bitmaps.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions.h | 83 ++++++++++++++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c               |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 5842dacc05cd..a6959836f895 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -41,8 +41,91 @@ extern const size_t riscv_isa_vendor_ext_list_size;
 #define VENDOR_EXT_ALL_CPUS			-1
 
 bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit);
+#define riscv_cpu_isa_vendor_extension_available(cpu, vendor, ext)	\
+	__riscv_isa_vendor_extension_available(cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext)
 #define riscv_isa_vendor_extension_available(vendor, ext)	\
 	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
 					       RISCV_ISA_VENDOR_EXT_##ext)
 
+static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
+							 const unsigned long ext)
+{
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
+
+	return true;
+l_no:
+	return false;
+}
+
+static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
+							   const unsigned long ext)
+{
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
+							      const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely(vendor,
+						    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
+	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
+}
+
+static __always_inline bool riscv_has_vendor_extension_unlikely(const unsigned long vendor,
+								const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely(vendor,
+						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
+	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
+								  int cpu, const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+
+	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
+								    int cpu,
+								    const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+
+	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
 #endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6a5364910cb7..7866276db213 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -841,7 +841,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (riscv_isa_vendor_extension_available(ANDES_VENDOR_ID, XANDESPMU) &&
+	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
+						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
 		riscv_pmu_use_irq = true;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
