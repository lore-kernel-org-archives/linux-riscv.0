Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A80C3DA7E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4cEmqrV8zr1npckyGcYghPPLBxQymmnNAM0lhEAi7w=; b=JemeSp08CN+qRU
	kPWlAJ/fT7shpVf4uIToJaDbljAfuOo0LPcx9XB/eRZMPc4jOhaGxLrYQorp8/N+S0gqAs1yhSLkW
	II3JPiGDUiBrlKafNX0zrF619Hil2UW4apKSgyzOItkERy8Tb8sbhxQfaQNzQJ4St6LIgBxxKaT6+
	aIzyY/1cYAsyqD865Qqw82BkvBzK0UfZck3U6qh9s6vDajgwhHpN952VuFD1mLql//KuZEGLankb+
	qgJMrIQVv8pUpZBmwZLOlWdjiuNzW7MdWA6Pg2WUplZzaYaO9Rinx7NcVc3xJaNfyO01u33+/N85z
	kuyCf+ATq27W+RiWq4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGp-00000003Dgu-02Qj;
	Fri, 19 Jul 2024 16:15:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGl-00000003Dek-0FC9
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:15:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so773082b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405741; x=1722010541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKptBNPUToJCgJikTFA3RkO8ZdeJBbCKOsPDQYUnrcw=;
        b=tJfOEO54ywDQP79vq4Lptvw+0Bgv5fmN9jpDrJoz4DzqxM1/GrFUIo6TEcV4J0AdnU
         FSLUupI/wWpVDQFl26UnNYhJkscrEcKCsYoqQY9QtwT+i/ERNX8RfgM7is1xTSRux4Zr
         YTwI5V6xkD0f7lBaH/mKBZoWAbNMMF4zQN4v1A2jXBZuF1/jXgFwIlM4xy4B+MlFwv/l
         NECi6e0HR69cEPPTkyHDSWq8GugankhKZI7bTjhOlC/97zETehWwPCoCSpP/X6MvaEN5
         Yt/RUjpmrjy0RFl0JOxlSvMFcNVoSDTG1XzPrycDWEn+yyYqDtJA8b2xzaz7yOFLibdv
         Wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405741; x=1722010541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKptBNPUToJCgJikTFA3RkO8ZdeJBbCKOsPDQYUnrcw=;
        b=pbOcYFbFZHkeIbH3ihGR5JC9gUkPuVhyIcCE7ypUNIuZAA7z+SnhwHqqytdqWIBMiW
         KBiYiFbN510LjJjdi/m2wDBd801WkohSOf/z+d8xjkP1LpGhBxz5bkIOOWbMvn+v8Erl
         fJK2jTtEsbORv8ZM7RZmQEzLdzcGTKsWtAAhepJyIedi2f6oiAjo1nX2cwT3lG3I6pvo
         1hpe9uKyFQ58sqhU8C2IPPK97eslQZtYs+ytP8Ie6USTuLJr6OeINuo2WQeQQBuo3FI8
         /Tf6N9Rhvtoe0QxUt8wXTuvcUtr7f3o3+NpMKZ3HoRXVSrV95ALS1lB57HpAygaJ0yzI
         5c0A==
X-Gm-Message-State: AOJu0YzLti8bIIo8OmphVoG7anyndx9mOjq+ohwVwAXpbzmUtV8rLEwF
	vUhPOvzV3gW+LvOib7Q+01JuzzHunq/3nJZNtxedQeprowN9hl2JYSqsA45yta/WRhPk2o3/0Hl
	0
X-Google-Smtp-Source: AGHT+IH9oa/gapf6wRvG/n/RRpbOMnqPHYf2oA2uQ+xPbg563um1usCzVEilrCT21+k7uaAfWBoRSw==
X-Received: by 2002:a05:6a00:4f88:b0:706:6867:7a63 with SMTP id d2e1a72fcca58-70d094d2a71mr182048b3a.6.1721405741298;
        Fri, 19 Jul 2024 09:15:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0ad73cc4sm579589a12.29.2024.07.19.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:15:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:15:20 -0700
Subject: [PATCH v3 3/4] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240719-support_vendor_extensions-v3-3-0af7587bbec0@rivosinc.com>
References: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
In-Reply-To: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405735; l=4598;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=CjE8/rzubqx5R8Iz4IqjgB80B9gjcI9d7XpRrk2z8Qs=;
 b=cgJc9U8CKeGbQmMhF8nkxrxoy872cNjd9xtHNOdycdagYpu0adcmK3V/345qAoSy1eexq5Mbd
 EKmq84TacEsAj+nLjgQyW06Q3rDCun28yf2myFXx3Rta5jBdj3j6Hqo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091543_141544_45C3423C 
X-CRM114-Status: GOOD (  11.70  )
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
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
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
index 16daebd0af1e..36d128ff166f 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1099,7 +1099,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
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
