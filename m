Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A7AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5uo+Pzy64o/q5uEpDBvwnNM0om3lIxFXtekKM4+LyA=; b=hNHZfJ/NYU1oNM
	oCjX8MkdoShQHIP34Wm+Pd702cn8PI6NNt56xOwBj9N4E6fqjziBtla6LbE0ow3p/X+SlmP7I+D99
	Pay6mMxxc+ayAA8U9loUTs4UCVo7rQ5N/utcbfIJ4BDyhc3WqFRMO+aE7U0yu9dSoFbvr7prNk2J2
	vbu3NCQtxuxRTLFwr4CMaM+XlgbuZYpZ4Tag1/LeAIzVI4I5zkRt0iQiSvzW5cLmnvUFc2nRwmsYI
	nTKPGM3GPN1xE66ocnBBx8ofWSQHHehfn+/V1H8gV/aAw1VTeYFcSkm58vrhc3YBIUBPnJwrytMRJ
	3BsGNMj/16jwh4QJsISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xVN-0000000HXMv-06Cr;
	Fri, 03 May 2024 18:19:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUf-0000000HWrk-2vRT
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so19817b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760328; x=1715365128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UELmH9bdU4ZSPQgKMmBgWTS7NE5GHKJ3ouLiPma73xo=;
        b=xxyuOdR2fZXilqA+hwJdlQ5lHoyA+O7VY8RnHqYhAJWIINIHY5imy5e8EIOamCDR/a
         vsZ86KXtFxpjaIFAD6hTMzJorLq1ZRIBDcN4xdMi/i2uW6sUL5t8Q0/N+CrmJnQ4GuBY
         957gBcmXpnJwqMfRokQVXC68OS7APwlYDUMLLpKifu6M9YmG6Qrx/xBAjDhxvci+b6Yz
         hpNPEtAYqW+LJn/VWjmqUxkMq9IMacrGHVi8jkYRejl4byInKynDStPh4sWyLK0Gw6qw
         oKD6cmmVFn27jpgyQBK8ifWLeUTM5RXbCevOmxXS6VtMlXaPRAB+LsnjbVeaexa7EDpS
         jU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760328; x=1715365128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UELmH9bdU4ZSPQgKMmBgWTS7NE5GHKJ3ouLiPma73xo=;
        b=H3U5yt7xKOsAk6EiMatmHBoH45sLr5L2Z2ScyBpLU+NpuZOkCmEDHVg78gipndFjJ8
         YoIIYxjNDLSo6Bi2HBcb2vS5TInnALKYjpjO0iKVVW/vDsDGBgtkdE/UmBkT7dNohYb6
         nrFvbplvS4Uz96Yv8n9drSk4be80ePr/dCC4tnRUD/84NMbEolt8i7mrk2fS8a6hSIEw
         Wlh0A1/QCBnbu6YRLPkIzceWNYqEN0gSYRbbz3X/fQFdE40Qp4L6zLIWZeIAkc7igZt/
         Fkh9Nl38U4XEa/RxNqcEYZ+cOpfCX4GZ8oUVPVMKB2P7ImaaH34Vo/ynORDHsEoUYPpO
         eDNA==
X-Gm-Message-State: AOJu0Yx70maOTs6AyZ+dVZHy62M+q6yiiR7uzRuPHwphtcNKJRPpgOvn
	UqON0RG2jP7hZpeF99Wm1bcogGeP8RIicWQc1KgUji/tuOgQz/9Zc2nS6VZv4F8=
X-Google-Smtp-Source: AGHT+IHSeSxim8Qie379bt05mqGRZw+x+rJOj0l9EjBmEgtLA/oB2Gus8wU0QZSnJSgImr9jdtGkdQ==
X-Received: by 2002:a05:6a00:1897:b0:6ec:fdcc:40b9 with SMTP id x23-20020a056a00189700b006ecfdcc40b9mr3795178pfh.9.1714760327698;
        Fri, 03 May 2024 11:18:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:46 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:18 -0700
Subject: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=3440;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oKiZfXeAlbmWslfugUa98N+u2COwHbBKOONuYtbD/2E=;
 b=gfKoxKMSSQz8r6+tcijyhi+4U18/WrrOFL15fJ+mhnQVhKqAancI568aLKq2Is+Du4UAyl3x/
 yVwCsTQhI99DwYhAkoplUp4CczCsAQa6F+e+H8A5ovtuIOa4g2ecIyY
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111849_921098_37ACED9B 
X-CRM114-Status: GOOD (  17.81  )
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

If vlenb is provided in the device tree, prefer that over reading the
vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 47 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..0c4f08577015 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 riscv_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..6c143ea9592b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 riscv_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -648,6 +650,46 @@ static int __init riscv_isa_fallback_setup(char *__unused)
 early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 #endif
 
+static int has_riscv_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
+
+	/* Ignore vlenb if vector is not enabled in the kernel */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			return -ENOENT;
+		}
+
+		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
+			of_node_put(cpu_node);
+
+			if (prev_vlenb)
+				return -ENOENT;
+			continue;
+		}
+
+		if (prev_vlenb && vlenb != prev_vlenb) {
+			of_node_put(cpu_node);
+			return -ENOENT;
+		}
+
+		prev_vlenb = vlenb;
+		of_node_put(cpu_node);
+	}
+
+	riscv_vlenb_of = vlenb;
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -671,6 +713,11 @@ void __init riscv_fill_hwcap(void)
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
+
+		if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogeneous_vlenb() < 0) {
+			pr_warn("Unsupported heterogeneous vlen detected, vector extension disabled.\n");
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+		}
 	}
 
 	/*
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..e04586cdb7f0 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the riscv,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (riscv_vlenb_of) {
+		this_vsize = riscv_vlenb_of * 32;
+		return 0;
+	}
+
 	riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
 	riscv_v_disable();

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
