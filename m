Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBFBC47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lYfL6L0hvjP3v/wmZBjWxv2gn9rsrNS6x1IQEz9zps=; b=K+kYb8mCk3dEsC
	y53Xsm12sMpON7FNi7EZSgjWheD3oQVnUVVbehcBNaDI5+Z5OQ1ygbn14uM6d+YpV2YYylv8qxiF7
	XY9OPxr53phF1vrVoVT1EkH4z9OcaWWiTq7Zce5INBGeoxIszP1yp+c9T5PdJfS2MAnoamYNr1HSR
	4sLJM4BIGbb8XIxZUJDnI2Ub9+k0viufU9gvm0wLBovGhhWY7Zd1jN6re3jhm/Fv93FPUnG7pLcYO
	/I1/A6wISII5ZyhJAA8LA8vTaqMAqYn+n/0BgCJG8ZFmfL/PnnUYCz7mIsXmmxBZsfv9X/SV2SmNO
	rsrBdQrK9NcJcM7wy8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQko-00000006nWQ-3qKQ;
	Thu, 01 Feb 2024 06:40:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQki-00000006nSG-3iyq
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 06:40:50 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3bda4bd14e2so467012b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 22:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706769647; x=1707374447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKa7kvpXjsFDP6A15VTktM7IVUcEVRchGZclVVqoNrQ=;
        b=rwHZAFH2Dn+y6Np+lDMhYcT0ZNqUVcg9fJYP6Hd0EcpMIRtQoa3DFJQFSpwEzy1Yty
         SZ9Wu8zjbdnyKiVi5dzBEdC9pBCZC943DpCquya5yXAIB3KyTtxzske5KKouuAEYzB7a
         xwqyKz9WabqX+TJz8Kb+YnVjp71TvYUHNN7bwjZGnlF4wk5k1bAa1zqPOKqz+E9NJEG7
         yuKVvWlXxNSI2bgQFvxbHqLXDndn+PJlo4KMAowdZEYtUSACSJwH7UPm9r21/WNk0776
         k+9kH6COa09WV7Ck208jLlmPNb04T/YR5dzytTCHG1CJSTUm+qZW8guIx5KXEiPRkV51
         tXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706769647; x=1707374447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKa7kvpXjsFDP6A15VTktM7IVUcEVRchGZclVVqoNrQ=;
        b=ThL4zaEezmcS9iWsF4ytHc0C8eGCyLCTwAXSnZAKpn+tr4Ok8STXk9XM6N4QSRKvt2
         x70zoeY4XiKhk2enzwCaMN11ogsUmSwWJPfKXU9+NzwPsWfoVCwL/B8xYEmADB4d/XLw
         6rxayUQmJQB0202csfFh68hoWzest5gyQIflAvzb/PtkhhnHIbHkBNlMIFYjF1J1rSny
         1PiHdvnY8GyCiUk5UILg6DRnXOPYmXU4bw+5qLhV52ShMPwFN/qvjHDjN39pwH88XNCN
         8lKLjSpsiW9azSAtJXULhyC5DniF6u6T4o0CYx+zJxABX4WXsvlIRd6NKWpnHCSmHopY
         fSIQ==
X-Gm-Message-State: AOJu0Yx7SSI44k7N33VwlQ7IOyQbVu7UD6+9FSbtgxmHRfWmPP6TyuaK
	Uo3deyuFVOAFXXTzhWqFIPW2NJ0UdFFspYOUossSRyzZSDQrlu69Ibgh1qwVDAw=
X-Google-Smtp-Source: AGHT+IF4PEyL+aACVF9FFYS7e1wHd0GV0cED13/y15ZUL2wuwBw24vqCvuBiM7X0g61MtzAFyKhtyA==
X-Received: by 2002:a05:6808:ec2:b0:3bd:db8e:b1d8 with SMTP id q2-20020a0568080ec200b003bddb8eb1d8mr4149440oiv.31.1706769646931;
        Wed, 31 Jan 2024 22:40:46 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm10925764pfq.9.2024.01.31.22.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 22:40:46 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 31 Jan 2024 22:40:23 -0800
Subject: [PATCH 2/2] riscv: Disable misaligned access probe when
 CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
MIME-Version: 1.0
Message-Id: <20240131-disable_misaligned_probe_config-v1-2-98d155e9cda8@rivosinc.com>
References: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
In-Reply-To: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706769643; l=3922;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=wzSLJadpkHjmp9X2BoqvKpkVX4rq2iE3DOomMnQVqdY=;
 b=DTn4IwM4ZIGuqtofPt6Obk2d6Ns8T0POg2dAYgBso9mTIalwSw7BMF2KHtVOxaqOzJGsrbvkF
 /jb1oVOA2joBeZ7x66cEr8DJ1S+QAdH1efsmP1wIb6hgiOKp5c/RKnH
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_224048_984399_883CF9CE 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

When CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is selected, the cpus can be
set to have fast misaligned access without needing to probe.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h  | 7 +++++++
 arch/riscv/kernel/cpufeature.c       | 4 ++++
 arch/riscv/kernel/sys_hwprobe.c      | 4 ++++
 arch/riscv/kernel/traps_misaligned.c | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dfdcca229174..7d8d64783e38 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -137,10 +137,17 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
 
 static __always_inline bool has_fast_misaligned_accesses(void)
 {
 	return static_branch_likely(&fast_misaligned_access_speed_key);
 }
+#else
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return true;
+}
+#endif
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..d787846c0b68 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -43,10 +43,12 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 /* Performance information */
 DEFINE_PER_CPU(long, misaligned_access_speed);
 
 static cpumask_t fast_misaligned_access;
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -706,6 +708,7 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 static int check_unaligned_access(void *param)
 {
 	int cpu = smp_processor_id();
@@ -946,6 +949,7 @@ static int check_unaligned_access_all_cpus(void)
 }
 
 arch_initcall(check_unaligned_access_all_cpus);
+#endif /* CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS */
 
 void riscv_user_isa_enable(void)
 {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..3f1a6edfdb08 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -149,6 +149,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
 
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	int cpu;
 	u64 perf = -1ULL;
 
@@ -168,6 +169,9 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
 	return perf;
+#else
+	return RISCV_HWPROBE_MISALIGNED_FAST;
+#endif
 }
 
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 8ded225e8c5b..c24f79d769f6 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -413,7 +413,9 @@ int handle_misaligned_load(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_EMULATED;
+#endif
 
 	if (!unaligned_enabled)
 		return -1;
@@ -596,6 +598,7 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
+#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 bool check_unaligned_access_emulated(int cpu)
 {
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -640,6 +643,7 @@ void unaligned_emulation_finish(void)
 	}
 	unaligned_ctl = true;
 }
+#endif
 
 bool unaligned_ctl_available(void)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
