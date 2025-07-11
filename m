Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531C5C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XtPQ7d2lLWExzRFHvSctIKIm9kc9499CxCiT7u0yCw=; b=c1dalJtVcUeDpv
	0tu/nswMzwfFiQ5X2LeBrK46Upuk3hnx4xX8lPRtIjQwqBBUsvcQpG6upX7nUMmv0SJ313jz5fvzP
	gcTSiulvfXJ6WUc5LHNxwLd+5PKINrPO5fFzUgLzM8Rf2tCriXZu/14gGFcwh1/ZQfWhHUV+/yuof
	Cgxpv7VWJNQAbiNu2n3xabl6YTpBaQs9U1UIS6si5/WJbiggABDRW/zks85OMS3gjD3x+h3E5Yld8
	YOSqstvCFLmJgaLpCr5mFHL6gRLmvC4d9llLcxGxVWCs8jYUyO4PkPgR2GpaLTdKVes58x4tnJ5ed
	hn1XVh8l0s+qkQqUJDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKed-0000000Fod8-4ApT;
	Fri, 11 Jul 2025 20:47:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJiL-0000000Fgkv-3uyt
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:47:23 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748e378ba4fso3071233b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263241; x=1752868041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCs/0Fatb6WpZ5Wu0/kqxIeaRjS6p6fggeAegEn66Xo=;
        b=bset58xu6AbEqp4ctoW1uWjcDDNwGvrvqzHLSilbBM1BWwK+Pt0Hf3z6ozacIQMEng
         f+48LtB4/JXY4KVQ8PsU+hWc+5z1f7c/hH3CtPUY+WqH5kCRvliUIpoB9NxPGxjnMnyC
         /x0MZP+03XW3ScEaU39sv0N7FaefzcjskfJ/OgLBe50RA1U+mygQabsw22LfHFVynhsS
         mfMufdJxazYy5tvZGDYaOCCUAJt9r2mEP+k087YrGVu6ZSxeUGqVHx91Gi6Cl9322Rm2
         RCWv9BQiEcGy/aL8fYJyYpAJ6lE01slr1WKeFMFGlDq05zFEUwuMf75Vn02EmVsvAgh5
         o1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263241; x=1752868041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCs/0Fatb6WpZ5Wu0/kqxIeaRjS6p6fggeAegEn66Xo=;
        b=DIdOeUWdxoj6mmLEjOcVISh2KHbAwVWPMzDvwddV5yGgxxWOGKTKyrXbgG/WbIzXci
         DJil5cwiAfHfVK0lG20aKBDnXnuFRz08J3zJKydbG7R6WQLtrhYP+PnKOhxESXPKu0wn
         yJWbiO7Yk8rF1hk3BvlRwQsUUX+Vwe6F760ID4bKezgHPHVrmVr0wYiI3Tu2fG0evK5V
         4bewoC+qhQpj1Jns+eFJfaWlNsyXPiRKBnALt+gooYQRJk37gbDB4Su68kTfBwTR4iKD
         KIIf2AU2eWxvH2MxGLeGtmNQjt/RPO1Q72NGeY0gMo3kwITS+JElYe5As0KrfSleSntg
         ff8g==
X-Forwarded-Encrypted: i=1; AJvYcCUYUhrBkV+Bbbv8Ghwi90US00G1TVA3iI82OAKiZZpc6Mp64tnfA9Y6KwamGIC6qJLcVtBYR7MRXcKt/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY+IA+cB2hxbHT4mYEcz21MRrALNmRMYBDfr78ZagqdhXfr5Sa
	D0DaxQAbBWHJzTBP6tJcmLTEdEk/eHnfuVPHRsZ85gv3GDODwGy3w6R4FhoBj2c4KIU=
X-Gm-Gg: ASbGncsaHiAfIrl/oBJNi3CexjO9MxSerCJciINehPr75FXrCNrTyCLuQb7KApJWNgU
	ElgiCgCXrjD/w6r8mGyXs2uR9zabHL1xmH/tQn5Stg9snc+mknw9tUahqKZ/mmrMMM9+Ije3jqi
	i+6rY9BguzDJgYwyRiQKNi81gdznVrmVDF1gWHH4HrKDfcJ160kQ1XzimS0TS8SXpagPuhBkSj9
	d8XU8PvtJl6mo6lHVoR3tYR5jMho4bVDHSX3ibz9+AWTnPX2u9+daBaNMBFKof3Orjo8F/Io/1i
	1pEzW0aaJdEZd6xN/P9JJCufP4iEA+vNHbtb+mLIFxIwLDJX18ZZgdkcmwqWEvMvPQFTlLYASnY
	f8QKWcEFKPFHCxpgHrwgOFWl/Izj6rMM+
X-Google-Smtp-Source: AGHT+IGhkr+L+Z2Hvq4lteh9Jf2JuKgeBADWdQZ0AUpu8DEa/Q3HrnyS47DesseaxuN81ku7cnK16g==
X-Received: by 2002:a05:6a00:1385:b0:746:227c:a808 with SMTP id d2e1a72fcca58-74ee3df47ffmr7178505b3a.24.1752263241317;
        Fri, 11 Jul 2025 12:47:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:47:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:27 -0700
Subject: [PATCH v18 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-22-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124721_964242_090B62E2 
X-CRM114-Status: GOOD (  11.38  )
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

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 9bd6c3e868c9..e4d55126dc3e 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -532,4 +532,10 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+#ifdef CONFIG_RISCV_SBI
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
+#endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..9c99c5ad6fe8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -170,6 +171,19 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -330,6 +344,19 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
