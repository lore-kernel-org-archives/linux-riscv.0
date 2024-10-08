Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BD9CF042D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1a5CSkpq+jG4lqhhwj+9tGSoJ5yNOPjymSzqPGEchA=; b=mFXr/NTkMUi93B
	+U/d84ulNbenzOTVFxYD2GOK0FGtg0fDFbE7VnwO96vKi/ODv5D5WRDQZxOVBEsq+p+OMdPWMRQVt
	saICq21qlFCxQsZAPvYjiKZ2gUe9fqDWfZ7/L6CaeT7O0z1yHYbzP9PnAmKt05RQQqWDB8c717n1n
	NGiAEdeOG4Cvqjqtluj6kCEMgM4W9SdVqkS7dvGKZL51x3bcASpdMALWmm2m7HnPdTxseHJM5wLOs
	pM/mJD/TN+Iu3f25HFoJGNIgTLodi5jZXjbSmmREKm04ykR3rBTdk948oqVrOp0ES8N6eI5eUk5Qf
	5iu1p3HsW0/JkUY3CjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJto-00000007SKn-3wjG;
	Tue, 08 Oct 2024 23:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrc-00000007Jfn-1u3a
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=; b=ddU/yykepBaOh3upL4d/xTK/MR
	GVQxSkqY2eIq3S2tlzm0OaCcNNH8hQKBwHsjvlFWtNsnVOEmv7o9A0RJl09q3cYrF1BefnXLUQ/w2
	2PIOBTxpOCrjjZM2HCDaK5jY2ZPrGsT/ewVcGhywIT3roe+/a/TBknaC7qw4vf6i1l6qAlPtM+hqo
	xxia5uRGJoyBynbqUnOMSrSitCG50BaSzAdvye7AOWQwvmGd9JoN67l/1Md5A2DOI17GtTzDqDhXO
	PVK2U96m6tPEasM/pWNr1Dpf99CpNRyWPZkcACtX/+KIcPI7IJi1WJLnvajg3alGOkeO4/x3fGZDc
	oI519Q4g==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrG-00000004hkD-1HsU
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:21 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71def715ebdso3029526b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427146; x=1729031946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=K3CBb0Uf+vvlfIU3rA2yZhKJYZpMjhB/E0mP4NJ//VHiCptMc+9ZhgYYu7b9aDShQ5
         RCNCbOqbRJMLkX/Kh5g+H5hnnKrz3yOM74naQOMTmwAsLS7nrUY17kB8mGvtCeq0Ij9b
         uhaT+XbzjBBjFFMI89O+3t4sSWoNr1vhsEJar/Vv0ElLqaS5dQcxCA2vm8JcuTUqgqWD
         HvVxq2+4iAX61qm/OZRbbLrDzBErbp9v09TOl21BfR3e4bvBfRXD93SKBixB6zlBawc/
         oI+S3hxEIXtxv4VQTBBkmpAZHhe8dT/9TFWseK8b1NQdhQ5EWm+nqPIQoCbVxDhnWqcH
         AgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427146; x=1729031946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=iAkhxwDQZqq1HoY4taW5Mtyw59wFMlez+IWQtO0vJRWBxSC5bkqs3Bzm8i3KfqNh7G
         yeYxlnBX9JhtUm2W1zcJfOguvluVFZglEy58iFQeDHOnMbLGiUHB5SECPIZEZ+R58uc8
         IZ1wy6JjAE3hkxKzHsH6T2wSvVyv46iY/nO0V30vw2jMq6ZTsp3RJqBCGpypua+hBcxm
         xk24ukA+vR8CLncQunI4aDaZL1vf8BD9p1/HoCYzVHjoxh1aVMVgR7HXa8sYl9AtDEkP
         7BEc1lees5yXuYHwrnKBG7A6KqPKsF+bcLiD8lBF/qSnB7jZyEktWTzx77M8Xkn/HPVQ
         9+gw==
X-Forwarded-Encrypted: i=1; AJvYcCXvw6k7Fk79rZ0yExhfboq4pA1AAOSChOcWPf1Q6eY0reBSs7efEaXq86Ea6Em+YntlW7HMnLRG7cSqAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2xUXqIItLQ5g+xaTogM0esctt2K816AC5c5MSc8GNPZ7V9CgJ
	rP29nazldyfHghDXVL4SLH43zlO3NfyjKUH7oIcgLtF+XsBE88A2lcEJI0yjAt0=
X-Google-Smtp-Source: AGHT+IG6yIXYzR9JD2NjDYdt+nbX1nqBZC/ZCSHomZxkbURMdjlHvJ/tAFXpjz5XbsMyqRUISAOAUw==
X-Received: by 2002:a05:6a00:1487:b0:71e:49b:59c9 with SMTP id d2e1a72fcca58-71e1dbc7550mr621721b3a.24.1728427145912;
        Tue, 08 Oct 2024 15:39:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:39:05 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:10 -0700
Subject: [PATCH v6 28/33] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-28-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233910_725044_1D7AE418 
X-CRM114-Status: GOOD (  10.79  )
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
