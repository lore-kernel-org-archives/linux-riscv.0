Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC84CD1299
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhyHdh+toAj1yvX/zzlxsuGYfliPll2zRAjLMU7sMIQ=; b=XUqt9SVsPVSOTf
	UHvFVE8kQR4D6OE08MPHg2UQqea7JzqUAgNmbtP7hlBm1O05zWCTGbA5zz6O4I2vbR2EakwC6tN9Q
	WMa7Ef08Jdin2+f18AIaO9CtRU80fJ4LcY9Y5QKUFZH3rd/6WN0/kVmJhbXTjt+Lx8qymOqWAb0Pl
	oluHsH0XZeRXNakrugPZSwFvfqwBb1ktGEfR4CPMzx6mIlSRs0B0VfDdIIRM9xThS+O8mrVD+Krit
	/SywzKUSYedWGTUBolAfC7tip/FHhsfOcaNfB32k+CSEWDTfyJ+QsbDO2BiQUQE1BRifVCQYsvR77
	Z6iArRNTXnw2n/n8PzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEq-00000000ZWl-2ndK;
	Wed, 03 Apr 2024 23:41:52 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEi-00000000ZPA-1R1Y
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0d82d441bso3504765ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187703; x=1712792503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htkBMuDJ5iEzOh5mmiAVjKhgj30cv1A8JpdqcqJ1q2g=;
        b=URITMW59KNnZtfP8/t22boi+EZVLSAxUKh4s6x6bbfKuqhOfKerf+A3+T7crOtwq2z
         +pD1JKdO/Xz1BEmC8WUwLNb0XIWH+x8xrWd5e+gYZGxyE6Wq+sT/yAvf3yu2C+UGEoGF
         lJHlmkFrDBMiBk90cnrUXSqesH3I7zW5dxkZJ+oaKMaufBTPlQD/xcfx+qY9x1Mwqy9q
         HpJWnCCBnosH90KM3uYZjmUAMFiZNJ87fsvK2Z0qfhJn8ghoytIeR5exApcwF5s3v/oT
         n1dhOUucH/ZfVqv0/RL/6QrEyW64zb7mcsgRId4N2+xVs97CPHt/AXng9ZXrEeTiO7YE
         2ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187703; x=1712792503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htkBMuDJ5iEzOh5mmiAVjKhgj30cv1A8JpdqcqJ1q2g=;
        b=lWQIWt+ZIyLPcCrfxzLfAxvFYeSH9aEbicer7l4CnrqGDzkSG0x/9vWDYq9/UOcrkM
         OEI9KdQj2tZSdPK+5wr3Ixm0fzff61X8Dz4zS9gk7PVOCU0nZcFgKgdxjSzMHmShQiKn
         bIKXC9ERxcFexos/k6nnl9pNf99UyyJrgwsjYDp+XsFZVKVY16tUDR5MKMYxrSXgBSQ6
         ziWv1aFyeoMaAn8sjuHoXuk1DQGsFW7eDqirtSPOD6t7L3BJAyMj9FMrU06/1RTK/S6p
         QeMU7P460I8st2eNojuETuP15bQbzR+13Ro/TWFio63swZS5m06Upcj1w1dW1K3mFxrN
         Ypqw==
X-Forwarded-Encrypted: i=1; AJvYcCXc3uHgkRu5CeJ8aTjDcFscXEZiuXrzS/aYMF9uh33eGSfWTqWGISvCi0fBCQybOl2NrhDW5x+u5NLd3mgxXg9ohSu5WrGjQfPhVaNepsoW
X-Gm-Message-State: AOJu0Ywm3/QCs9z+yBAfqAXFFS4O8ke+3nmZZ2vEh6A+TEJEyFBiTvDu
	bWgcDMDkauPjp5rVRFpxgELmW/fEBWtJS2uFHXvc1ZCJcQbg30DRNp3Nt3AATXY=
X-Google-Smtp-Source: AGHT+IH7W+PqbZqQgLqe7/1okN5ltEP1rpCUpt8LdmXzCJjFoz54mr5WWDJ+p0nFbKNWmMer9ORIlw==
X-Received: by 2002:a17:902:e0d2:b0:1e0:c3b5:1c5 with SMTP id e18-20020a170902e0d200b001e0c3b501c5mr748168pla.24.1712187703505;
        Wed, 03 Apr 2024 16:41:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 05/29] riscv: zicfiss / zicfilp enumeration
Date: Wed,  3 Apr 2024 16:34:53 -0700
Message-ID: <20240403234054.2020347-6-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164144_544756_FF24F56C 
X-CRM114-Status: GOOD (  11.76  )
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

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 13 +++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/kernel/cpufeature.c      |  2 ++
 4 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 0bd11862b760..f0fb8d8ae273 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/smp.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -137,4 +138,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 
 DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		    riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		    riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 1f2d2599c655..74b6c727f545 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,8 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_ZICFILP	74
+#define RISCV_ISA_EXT_ZICFISS	75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a8509cc31ab2..6c5b3d928b12 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 79a5a35fab96..d052cad5b82f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -263,6 +263,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_SUPERSET(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
