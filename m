Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D8C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKiX+NuYsQOJovLzq+RJ3wAAJnu0x6ZP1qM+DeZPVYg=; b=ByNTkeMc2+UKXU
	QLWH/k9KIY8Pa54ZNLeDATzvMWFM9+uGcxH2ECEt2ObfLhI9rZFz+ejOdfZKr8Fng0hwOG4aEXH0V
	hbWplWJVVjOIhVunu0HPen691pWw72xDLk8q1R1C6LDwjMqYtInxuygRFZU9coi/KaHbtQhwnBm5Z
	alIs5bXSWG+ojU4jxrng+x+6R3IqYFpYYkXf90SP6jugPyq/V1w9+aylfem81TIGvNeUOFX2fgz8H
	aiulAkCl+49xVnrR3xG/br5grN6AiPFXcQ3fOcYhHao3Rdb7EIicQSffX0CnSRV5gfWl13yp85QmE
	ngjwCWp/l6abY0niLTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cf-000000022dQ-1hve;
	Thu, 09 May 2024 16:27:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56ca-000000022W7-1RvA
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e651a9f3ffso6458505ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272068; x=1715876868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QNNwCwa8ku9/k6tpLOmcrT1B9BtNzaXfpTEHBEwtaA=;
        b=Mar0He4aWEJ3KQdzqsUx4E7+FlwHlHIP3IyXzCN/IUQDSuG+aqDWoxS1f9ZeQLFSTR
         WPT6Hud96qjyEu/XizIwNN90llz/yJo13H8R4ticenHhju7IZyX/FoFIxEKJR6fWOLKp
         6B8HB4Qm/1tNJfG2QR21yXMGf6+I7OZ1o4bbExaKgUkav8Kal4xLlsq3oxjEnhuREQaK
         dVpS6Bk7mFGv3rQi5Lt9ErL4yy4AqeHESho5s6eRNNP7iV+5gdeiEVcbJdcbuZbdZe2d
         KxhbsGenE6ni9v9m1JNL0VyO3i4du4/WzozsULkl/57HayJNrioB8pW4Vz31uTC2W+vu
         mMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272068; x=1715876868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QNNwCwa8ku9/k6tpLOmcrT1B9BtNzaXfpTEHBEwtaA=;
        b=YXzevu4JC97NOMHqQvVNxUFgZpQH1v6ielj0LeqAUWE1msscjlAxOD4zCI5QYkeKPe
         WwmLXgeFPBc3B0C0NpSGZPJfmGQqbXAWS3Nq56NgoiXL0v9/8+RNMhkscBfsAGKh6TLj
         xm2LlGxhPqs/e967X38W4y2KBO1dXDkgzOb8Rj0UGLhbZngZIKKR2JLt7cPYBG+eNg5a
         CnfT9j3KvADJwwpR6NEdh5EQEEv01PZYDlC9NXzCCOviqhHBERKpdosWrFKtpd9sn6ix
         AE70k8518xKXHoicMhCXBMOh62Frf+lignIUp2+MiquwAdsFijy6EzCUL1EQI/c0dlse
         2FmQ==
X-Gm-Message-State: AOJu0Yy3iHxjjLL7tIGcoafG7/1NdF5BZDwkVsZjwSc9bkFr5kwAT8qx
	PCaftaMXgC0FIPTpGhH7O+EW/JGUt99ox+f+923Pm76CwlQBk+cRNdoPHgBFyPc=
X-Google-Smtp-Source: AGHT+IF9YLscVKA/v48suhgFjgLq2LEgwRZmAvKPOqejEXCSJdkMF5M4ISIIbOi/4lCzoWr9myCmQQ==
X-Received: by 2002:a17:903:228f:b0:1ed:36dc:a570 with SMTP id d9443c01a7336-1ef44050742mr1707285ad.49.1715272068499;
        Thu, 09 May 2024 09:27:48 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:48 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:57 +0800
Subject: [PATCH v5 7/8] riscv: vector: adjust minimum Vector requirement to
 ZVE32X
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-7-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092752_617195_22E89AFC 
X-CRM114-Status: GOOD (  21.25  )
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

Make has_vector() to check for ZVE32X. Every in-kernel usage of V that
requires a more complicate version of V must then call out explicitly.

Also, change riscv_v_first_use_handler(), and boot code that calls
riscv_v_setup_vsize() to accept ZVE32X.

Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
compiled and run with ZVE32X should be supported by the kernel on most
aspects. This includes context-switch, signal, ptrace, prctl, and
hwprobe.

One exception is that ELF_HWCAP returns 'V' only if full V is supported
on the platform. This means that the system without a full V must not
rely on ELF_HWCAP to tell whether it is allowable to execute Vector
without first invoking a prctl() check.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Joel Granados <j.granados@samsung.com>
---
Changelog v5:
 - Remove the paramerter from has_vector()'s prototype. Instead, make it
   check for ZVE32X only. Everything else should make additional
   alternative checks. (Conor)
Changelog v4:
 - check static_assert for !CONFIG_RISCV_ISA_V case in has_vector.
Changelog v2:
 - update the comment in hwprobe.
---
 arch/riscv/include/asm/vector.h | 10 +++++-----
 arch/riscv/kernel/cpufeature.c  |  5 ++++-
 arch/riscv/kernel/sys_hwprobe.c |  6 +++++-
 arch/riscv/kernel/vector.c      |  5 ++++-
 arch/riscv/lib/uaccess.S        |  2 +-
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 731dcd0ed4de..be7d309cca8a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -37,7 +37,7 @@ static inline u32 riscv_v_flags(void)
 
 static __always_inline bool has_vector(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
+	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
 }
 
 static inline void __riscv_v_vstate_clean(struct pt_regs *regs)
@@ -91,7 +91,7 @@ static __always_inline void __vstate_csr_restore(struct __riscv_v_ext_state *src
 {
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvl	 x0, %2, %1\n\t"
 		".option pop\n\t"
 		"csrw	" __stringify(CSR_VSTART) ", %0\n\t"
@@ -109,7 +109,7 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 	__vstate_csr_save(save_to);
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vse8.v		v0, (%1)\n\t"
 		"add		%1, %1, %0\n\t"
@@ -131,7 +131,7 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vle8.v		v0, (%1)\n\t"
 		"add		%1, %1, %0\n\t"
@@ -153,7 +153,7 @@ static inline void __riscv_v_vstate_discard(void)
 	riscv_v_enable();
 	asm volatile (
 		".option push\n\t"
-		".option arch, +v\n\t"
+		".option arch, +zve32x\n\t"
 		"vsetvli	%0, x0, e8, m8, ta, ma\n\t"
 		"vmv.v.i	v0, -1\n\t"
 		"vmv.v.i	v8, -1\n\t"
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ad3e613ee30f..53be3365e302 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -720,11 +720,14 @@ void __init riscv_fill_hwcap(void)
 		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
 	}
 
-	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X)) {
 		/*
 		 * This cannot fail when called on the boot hart
 		 */
 		riscv_v_setup_vsize();
+	}
+
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
 		/*
 		 * ISA string in device tree might have 'v' flag, but
 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 35390b4a5a17..83fcc939df67 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector())
+	if (has_vector() && riscv_isa_extension_available(NULL, v))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -113,6 +113,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTPAUSE);
 
+		/*
+		 * All the following extensions must depend on the kernel
+		 * support of V.
+		 */
 		if (has_vector()) {
 			EXT_KEY(ZVE32X);
 			EXT_KEY(ZVE32F);
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..682b3feee451 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -173,8 +173,11 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	u32 __user *epc = (u32 __user *)regs->epc;
 	u32 insn = (u32)regs->badaddr;
 
+	if (!has_vector())
+		return false;
+
 	/* Do not handle if V is not supported, or disabled */
-	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
+	if (!riscv_v_vstate_ctrl_user_allowed())
 		return false;
 
 	/* If V has been enabled then it is not the first-use trap */
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..bbe143bb32a0 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -14,7 +14,7 @@
 
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
-	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
