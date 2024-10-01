Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76E5CEACF3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1a5CSkpq+jG4lqhhwj+9tGSoJ5yNOPjymSzqPGEchA=; b=Ce9TjxOIdut6rc
	/C0QeSnzsWeA7x1ajvlXi9xgIHhIZC7MDKdJXaGW0JZGBWVFbyCeFTtspVjDWWrlPbftKeu2rbnFe
	PsyMGhVCuPlggs9hkjl6mV5C0y0ChlmlDP+nlQpcOP0dgw6with3o08mWD9+81zFM7fa6lhrkiY9A
	jL7XKCR4LOhNLZipZ5Qfq/VXhaXbTUgJ6SMlOnHpn36V/NZil9jr2MzTzOcQqrqcrbTH5vBWfNrv5
	Y20IHyz+E+lwD0adPbbS8ubjYQx916a4zNCewQiD/YyFBSEuI2W+oNaSXq47eVPb1H0NnzrMBF+Tt
	vnTCqsbtLWcG4cxRItQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgin-00000003fCN-0l3G;
	Tue, 01 Oct 2024 17:31:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQ7-00000003RZk-2W4p
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20b7eb9e81eso26990565ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798895; x=1728403695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=S1e1Z7xljpqr8G+IDoOoCbkdEJ6D7d8mW3J1juN8l41UL+P+3+xzauUhtJ076Any1c
         YyLTwrzKktqZCYvElB6imSaXhg4tZUCoqUJMmQvAnXzeoB6kUCKiP7ncQIQNL8UJ1ta0
         kO6tbscguz9xF4iGxa/MpuLSLek8Pk/Z1S7rj8zeOaDF6c8ZLG10lZuDezdUKQWcz6FW
         jo+GwmUceDAHz2fytrFPS7ijDLByDSbYu2mP8tghm9XODJe9hIDJ5y1Q6Ly6IuNST8BA
         5zeFSGtv0+WD067GRWAkd6FkufQwnkmNkzYe33qMzh200RTjhpRaiGDvpwVps/NNJUPa
         yDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798895; x=1728403695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=OhY8Sfdg8TMbSVT7cQ2jHD1BLQsduPQt+OV9J4swmLfmFQHHwtyoTTNC0yr1Zj1Kml
         nTI75wVwDStyj3czk/Dj1bNkT8YhFKVm304VnbayuVPY49FqYSyqOGQYZ3AUuGwFXFBX
         i1zgzNte9Xa6EcwR9WCJSnWAQC+2KZWLXkcDCwE/FN7q8UXks6gIPv9OFN/EdaxBtIGA
         yJeq5xJbT0lj8r9tCtXx8WPuC1x/OzlaxOHJnjlRq2Huqo920x2PEKcZ0yMlLUCOsucj
         /NOAe/XENzlrtVq3/eiPMXXr5T4cdYLs1r8ZD8J4E1rzMEnsaVfdmCWUjjX9Ubii8Ukf
         3qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUElO7lrabBHsPwNvdFZfj9rYTr+bvIVwTo8Z5/wvqPhDST194ZhnR4S29gpX/8wZDqXLVJfZFAr5+Obg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPguJip13FPlRRmp4LzTSb09p3NUpWW0TUOeJ1DEd8cIUm347o
	NMX/Gdu9SGoQvUTg4qLkdEyyKCDUb8ouCj95VaGG/cj5v1hSWYGUv2+dfq5KGuw=
X-Google-Smtp-Source: AGHT+IHJ9Lg6QUp5AJMvLZl2TSQwbNKVqaUFdkYSpxGCN34z5YgLawRUhWByN+Lq6nFf2iRfOgfH3g==
X-Received: by 2002:a17:90b:2250:b0:2d8:7561:db71 with SMTP id 98e67ed59e1d1-2e1848f66edmr219547a91.25.1727798894659;
        Tue, 01 Oct 2024 09:08:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:14 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:33 -0700
Subject: [PATCH 28/33] riscv: enable kernel access to shadow stack memory
 via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-28-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090815_669677_5E569FCC 
X-CRM114-Status: GOOD (  11.01  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 766bd33f10cb..a22ab8a41672 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -517,4 +517,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..6244408ca917 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,12 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
