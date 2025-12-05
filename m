Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4121D339AE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbMyC2a5KjckNaC3eMf2AAeLRx5owNl0fRF+3Q6FGN4=; b=WvxwlS1YJfRV5D
	yKKgwtpv67Gs2BSm+RmlbBDGieKA1odqZQlS72qL1WiAtXaM6H/xzPieRGgHZndygYObXU2G+h8Wt
	ypmYhbLCp0i86v9PLQe1OANHkkiqfF3NpnwajCOh5S/vrtR1djNJfw+YMGzTSjxyFU+uHti9vtNma
	fWJnw5KcvvHXCaBvLfamZglt86H8rZImGI9sBHGVwK6pPvBQBxc67PAJKjv1XKD3RUnnrujuEreWa
	tod1vMlieHemTx3zQemfDFT4r8n5TbmRhe7smTgxWopb8TFvHy0wYAx+h2pLK4dW9d79sWMfMzsDo
	a2bf6XNzlU8E21LRiJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagW-00000009ptc-01rv;
	Fri, 05 Dec 2025 18:37:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRagP-00000009pjl-1Gs1
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-bdcae553883so2012395a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959852; x=1765564652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=V3GM0CVUYfc25U6LJc3K6J+XDP7AmJw/hQNqK8wCDZKEVV0PxuxMXV/zIfKLA9U7Kg
         mFnURY4FBOEhyR2CPG+uXnR4QlnBjXk+/cFy6M33B6KIWDTPcFpS8DJIY65WzqRC3Gyp
         ok8OrJfINY6RjoiyUjFSMszMRMUjEj5FxP8FaWhIJd44rrDGguwu9YDRId75hk7PeZP4
         tqOm+RvMceH7fiZVNyXfkh9V0dEMjSQrA9s+khVWlmqLxA1nzQg9/7MTDb7O8yw0hvo2
         QfPEC15PGjyyCJVfDWJac2CSOO9I/pG21s7XBzVSXFJMg5fJVUDyPETYPoQHzrJP4+0h
         yGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959852; x=1765564652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=t+wCv7Eyr6+9jcdrWrdz2fd05lDXA4j7Dg/zOZ3vmQFLVcedJ2S6lnSlLTbyGoqcLP
         LlIzjPjbzW356EIz4kGxk4219+TOOhaYf4VU2Ef4gB2HBzu4oUtO5IMALGopylnJImZi
         Tzz1T3GYpOTJLpn4nGLNbM1ckuA/ieKBFtd+3Ll6bnIk6PmqnJHhILzYNX0TI/SkIdSO
         RZ+siZSoruHvrTDPM2Pf98e41Q/8r8QyEylcsymAQnQ+JUeYGseigC0On3cS7kjUrHku
         FNXkdMOWd05PsdUaORNWTzXEscIiRJqRsFeEsXgYqcGQv5VhQ8xNBI+fPfZZqj9UUn1y
         bU4A==
X-Forwarded-Encrypted: i=1; AJvYcCUSHornFzuH08zE/2R2XiPlEfJ3Yo4T0vC9f6fO+sFS/GDhJfCLOWGsCwDDehCm2OZdAxuhJAQboedG6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3zZycSu9O5Jgz7Sl/AzFtbD2Vo57w37INtY/QfBqTq017rGLa
	I08q4G9+uOw4DmeLHvSY85pJeTTNWDSNKQ1zfmITejsYqoKV58nF5CB0er0EmLYYnh0=
X-Gm-Gg: ASbGncsu2Kzb8Vv54EWzNrPN1PaHMef1aMQLcTdaB8RslAEZyCMRhPGXRG5ZOgrlp9f
	RDEXNlXuV0/3arX23gzJvpMvRTRrfD92K6q+qEsoLYZ9dnLZwV6DMA22fbYO0ju4GXtwtLhOwFo
	V6ZY55XtUG3wOWKKcxzaqx1gDdTRKUB8svNRlP4535j40s+wvOppm60tuscPWaLvpFC/Ff1gpa2
	L0ippMtYGyS51RXxE1bOiLSX+pVhREWk0R93EODGcpyR664OIRz2y341jvYMKyAD2h5XTuKmL4R
	yO8nHc3kuj/2WZANrL0v4Gw0aBxBalaVGEfnJMqU9tPBIP2KaJAeIZTK+AXIQAFe+nqfsOHDJFh
	0tv7P3ccROUDtGN+nu4iGyc/AkGwV8fuo4uAaxuCrOCSHtzVsT1ENJemuNJBkFE/6ULZ+9TcVHS
	gZ4UNV9sJF9NbPSnhhEQw0
X-Google-Smtp-Source: AGHT+IFwWQQuMqwR1+ed74jDMY/CSXapqooDG8iNUOlxCqzdKYEOKwnXkGf4vaTbspDREQ1pfREY3Q==
X-Received: by 2002:a05:7300:ce8d:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2abc6f4d29dmr119392eec.0.1764959852461;
        Fri, 05 Dec 2025 10:37:32 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:31 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:08 -0800
Subject: [PATCH v25 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-22-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=2983;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=UW9zPS2E4TbdsfJtyu+1aU02XU1fbJS+cjnllb5pNMY=;
 b=f2KU+fCOkVj7mMjxZQYYSKXqi4DC7zhXlZZWWremH2iJ9TKnGVTmf9UQKwNWQYisAJhI9NDY8
 wDPYzH1n8XfDJHQBz0URPXJgVJBe8mEcqmkwauMK0YTBxPK3RkLVc7B
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103733_477742_D870393F 
X-CRM114-Status: GOOD (  10.67  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 8a2b2656cb2f..af827448a609 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -533,4 +533,10 @@ void asm_offsets(void)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
