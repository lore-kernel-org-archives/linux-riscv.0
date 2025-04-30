Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D74C3ABAD
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqIyiVts3sZm69jImqjL8O+x3of4xrO1NyhSD343JSs=; b=DGUO/asDyVgqBZ
	WEPe6b7+jnFzf/bIs9oAJDafnJ8YbkJmGgMTSvXDhntOQr++V4cLLDiAYb9ZTP9zXxcV0lVFO02Ps
	sIPhsqTOk0RmC+Sw6lF0RJ9TPYDqd5W6KldluDkO41KIe7i6vjONwUZew9KvAO3NfZxhKAtHyvnxR
	7f7B+IVXLFwXiSj1Q/aSltdZC3zGcSITFi2o6/HMoZLNo36mxEN5n/oGzd0q9hYExxgl8/JvNt4+C
	eKqcov1+buQrkP/BdFxYUiZ4pb2AnfZCaYs2NFICCRggPCZUv5wDYiitv6+g2Vlxlyiez7e4uv6uG
	13CFKLyEUqtN+hD1/eiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xSo-0000000BXay-0NaM;
	Wed, 30 Apr 2025 02:46:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8v-0000000BH9E-0FUS
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3X/LDbKk/o1pYr+8FDgOywQj6F1nn1j7yhy5R3Qqub8=; b=n82mtwKuW0gyilG5rOg+VGhHUB
	9Hz4OEfeBn+b3opQz6/JLOE39L1Sur6Z2rQ6+6EfxCUw1AbQpPvzzCPhkvqZo5wgCRLT+GRV8uVHk
	FNt6bYpMEziu22jRLxKGzvuR353rjV8Z0yEvjoq3NooSsgfgxf3oe9rdnhPM2wzHeO+EIQa5poRT6
	eKHNTcx4eFDv+fURTeu0qEUeiI5pzdN0+3aCZDym9ExNWL2OVe6gI18pKpYgUE3xir9KhfNtHChGO
	Zm1RKt640L+qNWocdKZqWP4lA5NW72Hj8wpb5pwbNCq0XvEFTI86KMMgI20R3CPiRpWIDFQbgR19+
	sVWtzUuQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8s-000000085T8-14nj
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:40 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-227a8cdd241so91220565ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972256; x=1746577056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X/LDbKk/o1pYr+8FDgOywQj6F1nn1j7yhy5R3Qqub8=;
        b=2YU9g3Ieinhs3Id7vOMdT5rjpXJMArdaVypK3m7pbAwPl+1IHE2Ewrd+zdejri5RG5
         qJOr9EKP/1MFzJjRcm3+N9SDGNh7Xvsjd9rm7Y+xUlfKKqnsH0iPt962YwiGmmCSf2XW
         wwZQTymWSA6C5nX/iMUthcYpWYb48FmOcr1hU4ETkK5+hdOzAl6V1fqa1IIr6jvltEsJ
         6+bUg4yOUnGKbGrB+QfLHxqlgc6ruvC8tKNcyzgtxLVeY0IWOAdnpt2s5lSWaIO1KK9w
         T/zMpVsoYe/Xji6qvnl3TFSGIlmYYdfUuQK6VxEnQmv7Tq2neDruJ3hE3u1lvuT+waQ9
         TRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972256; x=1746577056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X/LDbKk/o1pYr+8FDgOywQj6F1nn1j7yhy5R3Qqub8=;
        b=mbGoXYBE+rxAQTYZhssLIHH3vDr2UqjZWfGCmqarWjc9WZrq6L//p/jv2Ni7rTc2pR
         8HLV1MT+VP2YODu3+tpnZ4SY+8eBE17a0O/xL5FNtlgvUEV71a1Qd4b65dWsS8P/a697
         WvrZTYX5632kU5DGloYjTMjsEIqY5fa5y2xc5+ktVqkI/yT+Ue+6RPa2tmCZXSuAgzj0
         noRILPI3a7AALlvC0+QF+LFg4RLybsyMNqJtOJVA+jM45DXDHyu+e9sZ5DcmPi4gcJp2
         fjYKfSMj/u5VS1OxUIklYWuMvQbmaPRrhE0ZACewJJ176Z3s+0UN7kTHzWLZBw8zHo41
         zRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcH450FYGJZc+FQSfu87L2/5kNILU11pn/BHirYZGj3pXrS3aPC4kZxqauMjGlfBZlW9hTT1V2gsTf3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyESbIjBx5CnzcYRZ4ID68rE4hZmL5YHCBagKWnIq8DXR5j5PNI
	cNYvm/RWCWeTzASumFqMfP5p1607qD7kEesIDIZQ81zmfol52V9ajdqWiYJF+yw=
X-Gm-Gg: ASbGncsvSpIlZ93w4cmD7SWkzCN+RB6Mje3ag3g6dwfRS5PnNzjqCURaa7VYWdGsTXk
	WZuN3RSVMDHdvDqsVA9+Xe36LTcpcwCpjfN+ijzDUtb/nGny2mD+6xwNX+X5svW+XX1ys8kx8Q4
	Y/7fw0HS9f05wi5Agdyi2ed72W02zH/CAWT5qo2gb1b4D6tsnsHQU/ENBjnOZhbJ5QMuP8AXgll
	T7ucQCSpfmEvUyj7ApyUAph9LSswEpr2GesFInyuNh0cD3k7CwUz6CSjiHFhBjPRhgaJaB9/b8B
	CJ+wYQ276r0dyAyitNdh0EGwxQRMdG2s2T3pTuHngvhSIC2AoAw=
X-Google-Smtp-Source: AGHT+IHHiQ90NWkmdJz7M9swMrFnKHR4s4NkPbBiQVDZe2SW7TM+doWonipVtWWfmLVLaK7GwA0N+Q==
X-Received: by 2002:a17:902:d488:b0:22d:e695:6e09 with SMTP id d9443c01a7336-22df359c71fmr19979435ad.34.1745972256086;
        Tue, 29 Apr 2025 17:17:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:39 -0700
Subject: [PATCH v14 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250430_011738_360840_42994CFE 
X-CRM114-Status: GOOD (  12.11  )
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
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index f33945432f8f..7ab41f01aa17 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -514,4 +514,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..d47876eca637 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,17 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
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
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +332,17 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
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
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
