Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79838C5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oz9zwaE066QUrSKx70DCh3sc5XZ+T7Bw3l9Vgm3c2zo=; b=QrCUuyAff7B9jf
	b6CAD/LZTS9MBkbhtxys3uSzlkQXYy6Pw/Q8UW01Jpz4k/2Gfam3X2DazW6WNM/1o+LSjBYZ6xh/Q
	q6pViVnY2QHyAG+QycAuYklGwX+Ow2dPhEtlt20PfaK5pYEy823VHJaJ3thm5//WaWYolCrAzapKZ
	zjgHyawRxo0GaocgbaRkNNMdETSNcWfyThmDNaT46vKG+Ld6yco910TRJZYypFO99vLQsu5I3d59o
	AehD/nJBwa8F1rZ3UFDZ3uHb4osLcgQIRRma7kAVolUGdbpwlbGTb6l6uhLJz1cQajei7cPGbfqnI
	ptJG/KDRSWU5Ed9Izv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsqv-0000000E0zO-2TTI;
	Wed, 04 Jun 2025 18:28:41 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrju-0000000DtFV-1i6I
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:17:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3124f18c214so80361a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057442; x=1749662242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=HNo4EfI3yWSZvoh1j9UWZ2QnD+u7UgDeOS5CEZxFFRSnaHQzmV44c75TSNX3QWeVxu
         e/t10rKfXzSRweSzwfcWe3tHaBUml+K2u271oSDVNkQeGCLDhJSRJFjZ2XxRcKHvhS0i
         g51FANjLf8g1+aDWla1kgHvdNGYNne5xUBf63SqB3Kb2wo1PZsFF8qlTT5TlHDNBT4Cr
         Y5ifq8jF94IahwgRz1fFUDGUm4j/nORvJ6KoGZYfDtfNWYkEurpJwI73+dvEhqJEoksG
         o/1FRhzdD5NqffSdUe0R2wf/iIo/Lzp3pxtz3MabeCKqFittfAKmfM3bRm0YHYiaAiIt
         bnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057442; x=1749662242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=t5+2vSvOi24FNtx9ssr+XSTeiU4EJ0z0vQ9ZbDsOOOCfm91VxIwCblosrp7iOqW3Zb
         4pr/nmGdccNcM//B1kDa/sHS0PPpotmXuZkSofRjIsqE0C9nL/GB5TXaEf4rTuTeZ9Gt
         fsprrhiFfW0f3U4D1rD0fTEthMQGrXfu+kt8jYPwsOq+5Wf561jczLmrbaahLorW5gTe
         vN0laH2Ekt9DWbJoiIRyGamqReVCvxfmFkUoxLNJWTp0daCemBCsaUKIRFGrr69JIPR6
         OV6QlzIp4InI/u/Y/qx2Msu157ruElfQ8+jyZqbL5pOJwo33eM7lTqA7WQB8U/0FX0WM
         5ZEA==
X-Forwarded-Encrypted: i=1; AJvYcCV2dA4E+b2q5sHmSWAqLRoAAgxjTHl/qbpkAqwTs5/StMGDcmWNWgI6K9+DL/DrJoXe/5DZsUZmhF7u1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkcVadLRouWHYW7JNRVtF92IBbDvMi+fLMPAYi35f+ahiXrmjC
	FYzeM2HhVJ9iW2qMB8jQfAWQMQrVqblHV+wnffOlB8K6d3xrdD/L4se5Dbg+H+8NqEQ=
X-Gm-Gg: ASbGncvMAznlV/73ZyD03aoMLWVCrSVmGCMbp1x/+Q+zIHf+YyUxibyOktPvzdowWTi
	A4/p3PgIr8clXfKlCbmlid+Nk/x/Qb53q+kj01sv74nvmMw9dTLGHWN4RxbeC4Zho3XxyenQL+2
	fkeJAeFd+VOAds710fp0ws3HYqEWy3DzfISuS09GtCx0swNpeL9h4kvb1LfuubrC7YlyR+EJeoo
	1K/1KQ+zIQZ8qrBB/rCK6Gfoy39gE8rBp+jGQm+2lKaYI6cWp5dmNZiUdxWsi6sLuWs3DA2SzJn
	WvWmgxHfZ8rYWHU3zLHCMlSNA+Yo2xKmyugHlcgvUNIOuA5dugRBAELd6UC1rDh6Nhtm4pu6
X-Google-Smtp-Source: AGHT+IFgYucDp6wdab3oCQsMca+Xxo8mGVq4ki4MbG38XP6NlR55ZVWpB4I4rykVbZOBh8FR63avfw==
X-Received: by 2002:a17:90b:264c:b0:312:1d2d:18e1 with SMTP id 98e67ed59e1d1-3130cd97a86mr4309387a91.22.1749057441661;
        Wed, 04 Jun 2025 10:17:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:17:21 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:46 -0700
Subject: [PATCH v17 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-22-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250604_101722_469045_816DC868 
X-CRM114-Status: GOOD (  11.57  )
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
index f33945432f8f..91738394f834 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -514,4 +514,10 @@ void asm_offsets(void)
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
index 356d5397b2a2..7eae9a172351 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,19 @@ secondary_start_sbi:
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
@@ -320,6 +334,19 @@ SYM_CODE_START(_start_kernel)
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
