Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6DC41513
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sX1qOv/OPr3MxUFAB8dXIE9nlOdCN03V3ln6nvBA5P8=; b=kcsW9+K6dmOvz+
	v8596KUpLRnxUCzR0nww7CaDjhVDOREFXQMUpTa4KyBlplcjXICnbX9RMWsVJL3323LMqQ0ApTa5T
	DmdrrZOhE4PWpI/zD5qrZ87kk13LUjqDTiWCGN12PaeSOds/hBLNN3KdEfbYaE++WEWiJHAUwI89J
	zUDwFzgywqg6TxR90faaf7YBKp6mJBWPSXr2tSK1ZocHjWO5i3dd0NxXkFlUlsb35IG3bTGI9BDyU
	0wnmCgbc0zukI8tYFzEhPEqElb6Au62HrtHP6autYAlYj36/kA7uuZxIhjeZ/JxUIWzjJ6FAGEJvT
	4XpVJee8QIEpfSS4s5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWk0-00000003lEb-2T8Z;
	Mon, 10 Jun 2024 04:34:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWjh-00000003l9B-14wQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:34:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2c315b569c8so82826a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994064; x=1718598864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFh+Yaq4sHDrY//jnAxoeEQik5WMbNjKxo7yD1r3rGk=;
        b=ElO6G9RgwgkdkJVRuni2JFDYCEOQlPGIpJEnHWXUAdv0eTeeZAplVfzhj7vGkRytx4
         QU9X5wA6SZLByum/7wzTYmBclebYJow23LfxOTSw1VSsGbs5Qluk0GT8rDDY+JrbJNVy
         JGBou478T6ex/lWUTKA9L/AiPs8tsW81KrkHKTFkOFcKtmil4C3muSbFDvQRr0GGjYuG
         l98kDHJfIBrknL/HC0wMSxc4K6tq7zhVOrz3Qg/DMIZSZ6ILzJ9mB7R07K/O28VY+LY0
         paqFgz8RIGuG/c9fhwmmPsLhaCTyovA7h5Lb/dMfoZ+5U2qz0LKUiyvcKByOaPWIdWsg
         FdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994064; x=1718598864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFh+Yaq4sHDrY//jnAxoeEQik5WMbNjKxo7yD1r3rGk=;
        b=sbUgex1QLbY8K8A/WiEH8ybJq3wkb4Jtd4RDkX/0RaXr6M8SkLtUdNOx1QAUEIj6Rd
         ruf58tyEb66Qcv26ODJId98qmP+hFXebvqHp2K8slxlCKGa7PtOXGeIaf8tnV8GNFPN7
         Ox4Gq3eplHjhM9Oy12vk5qMOlMp8QIrtpvvkGdo16ssmEPnwylhPJW6/t/hSMfGLqFxy
         rw2H0vqJWaIyLE1rFhjlLixTvhVz30ySuMSaLrFr0V9PU/+8mfZz07u2fSTR1aWVjcFs
         vE/S+3YCS9HQ50BjA6cJFcCs/m/EIri8D+/pzHx+HfaYPAV0uRd8akgRCmqd6hUDXafU
         pjGQ==
X-Gm-Message-State: AOJu0YygcDUqv29QdvTCtfDvkEBbNVptr9ZPhlW2ILryN9iM78Cg2+8y
	dUnXQdMNU53+DXjNF5jp5Xc+S039JdKAhCyCytHyh7u7okRQyxnY+dm8gmu7abs=
X-Google-Smtp-Source: AGHT+IFEO8lawIZO34Zob1QtkyF5RXdf+JbO2dsILLISXWlFzRWMVMWmcWePF8SxOHkYAPm4Y6ss0w==
X-Received: by 2002:a17:90a:c253:b0:2c2:fbe1:1dc7 with SMTP id 98e67ed59e1d1-2c2fbe12004mr1984069a91.40.1717994064135;
        Sun, 09 Jun 2024 21:34:24 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2fe295cf5sm1894756a91.47.2024.06.09.21.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:34:23 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:34:16 -0700
Subject: [PATCH v2 3/4] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240609-support_vendor_extensions-v2-3-9a43f1fdcbb9@rivosinc.com>
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
In-Reply-To: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994057; l=4551;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BRKn/iNBwWd/Co3CsGmqCL5DUn6Jw8PNvX4AjuCz5D4=;
 b=4yccy4PXfKJAdvU7bYolQc5ufEEMW2Kgu5KVvNWSEXFq/FRywTFoLddxAai/8NN5jS+h+5FlJ
 T0l43mSaG99AGgriIaHNd1j1G3qENU6OAe/iyGl8qI7SukgrDgfLmT6
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_213426_038523_087B660C 
X-CRM114-Status: GOOD (  11.45  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vendor_extensions.h | 83 ++++++++++++++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c               |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 5fca550fc1f6..04d72b02ae6b 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -42,8 +42,91 @@ extern const size_t riscv_isa_vendor_ext_list_size;
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
index 02719e0c6368..e1f0edfb7dcc 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1064,7 +1064,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
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
