Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEECCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4MYhzMyi9234xWuFyECE972OMC/NL8bVUgkg7jxf/M=; b=rkPj3IZKWBzULy
	KiLAm6ys1O8UOH4tUmPp7GTbO9fRlmKLTBKD9CNnIGOG59enZdGv+NsqoMR/vlXTS/uhNzR90NhgC
	RbarExSnUvkQcZcxZn3udG800lhelkPRSRAc3cdg9GgadncwcB90OobuVJy9YYUr6uNJ8ZutyEosR
	3bmBpvpyWIea7eBVWQsK4pA1AgCI8drAgsSRxrAeb6+jidUZIZ7+PC/k8aCR4N7Zvc75yY1EPMoKZ
	qE7sFCq00tlE0WFMpu0qrgOQ5G2xAMIi2svEIS1IK/9KAedxmuOjZ94exp+A4Ipe1bLzZMs+Jief7
	4F8+5MjGyem1iNcY5ArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QXT-0000000EcA3-1HI8;
	Mon, 13 Oct 2025 21:57:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QXR-0000000Ec68-3afy
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Oct 2025 21:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=; b=jvEovT0xJB0TPM9zmeTRbxK4+O
	2+s6TvAPMUnv/1sJF7vctCv8Z4JSZej5/4UK0QaZQmBtx4deasM9BXqz06x46KycOLBRtyc8xX4FO
	1cUbW5occafVzfqMDGQP+LAqgBSQn6h/2SodioQA/8ZsH96+f3RMS7ZlZ01ps1q/3Wfi4zD4XocuR
	U5ubHTgreTbf9UJvlrbqFGjazvWUdFevdydY72WALDmmE/bBIrjalzNaSK7SAq5wfe42USLBEMkM7
	oxN5NuUddJsXYCy+nRLE6/XKuIwVDgey4DwVT6AZhlmO7egaEQMyIYzdyccRjDQUwBBh62RSE+nGw
	gPhFTtng==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QXB-00000004f4Z-2HpK
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:57:03 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33274fcf5c1so4959024a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392608; x=1760997408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=GodJbBvhc6ylmh+VFOEqb9ourMwf1qqKUazcs1P6o151gaF1Syfd68IBVJ+Ty++Llv
         sLAVA1ztglYIw0P7jV7rzDPvBff8S6/e7s7kQbjf/u1sDb9qkKya1p+cR5P6gOLrMpKZ
         PtplxUHzqNA/lRB53QK/4jIGgP9FhPoOzHlpwezbWtKsAO+PDhdgcefC+0oXQRO1WOsv
         uUieQ7T1Bfr3GQ0Ar+9OTD4hd6lp8hJRhEFZ8SNCdG+sA4KfSRFeg/HZLUkIj3PUlsB2
         suz6y9pcf37WGAOaBkantu3tGC3pgSFmJIPaxYFln69SaChA73boMZ6yDCVjI260bf+3
         F/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392608; x=1760997408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=HI6ZiY2V7vkmsO67cZsxk7M3Wda3B81DfEZUS6/C0PUNZNAV4JGrlnKSwrZe9vgfNB
         /svN6Lps6wA2S1zgeTMzHpSnsn6MO/1FThHgB7pSu6gl0OdCnp2DK1r/fexjBmz+PRc1
         1C1xRa5s/fiSkcGhTSh4It63qDBLaKcMwz+4KpdMS4nCNYdYMBjepKiVKdKUeR/bEgNc
         +xyiY6hk+UKFi3B8z2y8n9SJWJ+nL32dZiNGkz0li+Bm1KOJDgKMCjJIoYqwjuJtsjwL
         xBkQTbqELuF6Bxtk2Vse/H8Myepi8mbpvtDBTn5wKOBJlrG36Y4oP+TNEMFzK2qp0hzF
         1ywA==
X-Forwarded-Encrypted: i=1; AJvYcCXNwTxtwIrEl/8UJKdrthaRtIAy7yinkPWvF0EMolo2CJxzyaSvExyQSRLbtnWrPoHVsn5p1s1sQdHY5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOq1IbtvmAQsZmKEOxdW3+sCYBdpcHAK0wcAy6EHnWvZymXzz
	gP3L7rKqEV6EtqX3D43jQUeXsjjN9EN53FBEqZJKSshBqcJr87N8iX4Lx24ndRYjpEc=
X-Gm-Gg: ASbGncuWNlqdTfqeyMcI1FUI3RA9tOTN/G4YDovGE583Qc196PQAU6UOCBGrd/oI/7Z
	xqcmQ+52Zd8RDeyaRc7ykc4nIYPdU3hbjcfAkBvtxU2mLXJ+kJEWvQfTBjbfbmRNbXvqcRtxwb8
	t45iu0sZKJd+uf36pHJ6iXWXjrCikK7fELztroYAFRLnObffFG9OGGGwtBJd7Cly48HyvDCRP+e
	SNM82dMPSBS/CG/NvPFMgVJVu70zYQVbJDUzzvx/EaUYyCdHL9nGfOdo6iEo4Ld6U4vn4BRQktH
	CAhPCVApFg3J2rfz1eg2Wucc0LquvAIxLCE0mpKs30tPRoAzO3lyLW9+xH49u6CgXH7AVelSs6d
	Nb0cAfc5PVTNqS2SPfeUnKvhao5mqrI+472SABLIVYMaTqGLktRYaa5iQhfS82w==
X-Google-Smtp-Source: AGHT+IEpDqoontntF3sIrR5a3fhwgo8215k0m01p1A4l+Szf/Qfs7CCjIFRuTV7hnhhmb/2mstaCGw==
X-Received: by 2002:a17:90b:4d06:b0:32c:2cd:4d67 with SMTP id 98e67ed59e1d1-33b511188dcmr28426761a91.13.1760392607917;
        Mon, 13 Oct 2025 14:56:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:14 -0700
Subject: [PATCH v20 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-22-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_225659_822957_F021809B 
X-CRM114-Status: GOOD (  11.07  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
