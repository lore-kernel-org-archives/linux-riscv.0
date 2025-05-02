Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F55C3ABAC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTiHj5Rm1PBAL/K914vakcEhwDsAz3qszWqu+oc6xXc=; b=13lsPOZzS417Cm
	dOhtrYGuSmDcdAH/YnLQ8z2a/VczRmZj9LcBL+0kQykHBKf3gDshEOPeuJO0XiPrkfMHAwDe/fd14
	7d0zSarkpGGf9yqjkkDnzd1H545QcSCq8sjmTkybk9lVD833d8/v86P5pcr3JyXBnpR2GQRxcKNgs
	UISMAAkFIynFzUhh+iOoO98DNZuCR6mGI4l8lWHCWdiRExcOKioKmH9F1sSRGuHVvqL+l8h+yDSAb
	/CkFOii/3PpgysakNEPopM7c+NNMVG09VIV6yjOkHcVjgmHKvy9uftZsuOAMXMqPhrCpEd1DvvX+H
	Au61CbM9vD921b5VFrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB11j-00000003LEl-2YM9;
	Sat, 03 May 2025 00:46:47 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzxc-00000003HPQ-11jz
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:38:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47686580529so31260761cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746229107; x=1746833907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBvEpeAE/7wGyExLODAiLDg6krF79sL+1H1FZhekT8M=;
        b=bncAIrxQvipRPQMuqbKnAkppFCmfa3EzozLXsM7F3wqt0MlikTpTct4IObM9C77c1Z
         JRPrG9iey5fNigXU0kSXdWsAofP6Qjnm/h1Fo3+V6YRPh2kqEiF+xVjqAaYnHrIu8TRi
         fzKEnucrAYg6nFv9u3PSFe44VsZAVXDR3vndtOtpfVPCTBKMR6xp4zlmyBA1zlvr7fPd
         clCUXPai5Ik3TChu9qPO9tQWv85HZLeUppJnkAEgsxChNB19kJ+YUB2hq5sPAxL64wGO
         j+OfRcOOJzEId6RZTagD25CK/C2BBprYMyGIcuH6Yooba6z8zIEc0MK5kiF2PbcLuYAW
         HulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746229107; x=1746833907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBvEpeAE/7wGyExLODAiLDg6krF79sL+1H1FZhekT8M=;
        b=Nm16Ydt145QXIKlH1/OldyrtUS2XsehmbnilriXJ2ldB5zpgY9jpn6aTixfieAItW4
         ICkdBvPx7L2wes8Yo8bYWqgpqUF6VTILziLrnzHSy2Gh+3tAy4SZraptDeXPMs6NNWql
         KnVyic+fQ4Ga/o9WGatdR8VkOXslB0unpwa4byzZJTa5XcyTONQKH+q0a8Vm1704mKIT
         6cANjeBLpg36PDParwHkC6H5M/5EJyLEycIe9g2aJ53JI1GtAPYackTYO7sFkgkPiNqT
         zgUvLch+0fGyMpS6IPyWPVl2qOBkNtF8iMP/KPc5TdWtAeMUhm/Sg7iKXPejdLEEedBC
         vZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz5h8Gbvkqav+Kuz8HMIG/zFzLJEWcVwOTe5osvVHbziy83ne0U3fSb/k43KfSNmqH5hoNWP2ZhdbVPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX0JEt8iMrBuK9pSTIJxeMsjaozZzDHPxmb0R6Qm+kdHqrfHVS
	iiH333Erti+DQ/yrMkBFvIiuNhWh4bwWLOLN0fzzOvM6Ah0mspLB35VKv2QSI58Sz5ThCZidm/Z
	Y
X-Gm-Gg: ASbGncuY7YbFXPl1/nPdy7zBswM/yKlDaE1nekkwm14r8PyUWyIT9ixSEW6DBRfnwKq
	CLf4yzKoTErRS5zzkP31Af85AtLGtCsXTVe2Q7VhOoOGLZ6rlVx2jXIhHux6RhfjzaLy1fnAvFe
	UujnMr7gPQONco3zClo73WmzI1ZfMHgT+rcRPmxy0/UgrFb6R57nYoKTd19xVefO5lyUek13u3t
	flDcdWA8Kz7iatyC2dmipVRDDrxDEoTq6sq0t6H1ROvMzizP/O7h9Eoc9ykuQYzlOJqx8nuGjpk
	mzUtTppGlRr0NWDHxk6fgL9WywWVHFu0lQt76dl8azni8SyVZZg=
X-Google-Smtp-Source: AGHT+IF65UbwtR43GArG69lb3A8mSpF2tYUKJ/IXOS3rV9/TBWmbC/mO0B88SVzG1mjx0nqZklftGQ==
X-Received: by 2002:a17:902:cf01:b0:211:e812:3948 with SMTP id d9443c01a7336-22e1023416cmr78113425ad.0.1746228706918;
        Fri, 02 May 2025 16:31:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:46 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:53 -0700
Subject: [PATCH v15 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-22-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250502_163828_278697_92A874E0 
X-CRM114-Status: GOOD (  11.52  )
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
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

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
