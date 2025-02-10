Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE55C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyKdW/ZXsRTBe1RQ4y0DAX/QqCOyoDEFe+L02jBTanY=; b=vMS3uvSqGfhdON
	goKMMo21T8KgNdgVmRwY978IjnbFDeTCJn2sBMlVVvo+0LdapU3fMZd54+0Jy4QARnXp3j1xoZ6+B
	Zf+xg4t3loKe8ZABsa6qRtqKWP6hd9/45fr8RHZnsmXPk38h7q0Vu9mkMN/BDFJzyE8XWkgqoFn0N
	XPLP6X6W/FSFbuQ16TUowIZPvRHKO78PVNdp2F+glEeidt5UWN5w/AETRlbONkaFm1+88FB4tMMaG
	pG+GH8XTqYQGSCk8KeuSV3jVb9/E6qk0+V1gOefaMqYJeJR9nIBFoghDJ8DsHmc42nDhq/h8r/r8s
	5Xp/XD7COFH4VpF2n9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWM-00000001Wll-2A5u;
	Mon, 10 Feb 2025 21:40:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNT-00000001KZF-067S
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f49837d36so53937275ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219254; x=1739824054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=z2+LwrXuP9C4znd3GaA+RqiaU1LNnMFJ9BmbdoA9UW4Ay7neawKnRadV2Q3IwQqHEf
         NGGHnU7umUBHZhUOVbjkRVKsU86CGRB6QOPFZHoaFWTOA195+dGeBg5eEKQCdChyDMUW
         /kEwgOhzy6fHDzL70eRtgRma7J5UnIbZnjqF1S+SJf3Rvo5N5pdsTzTc7oywFNTxEqio
         1sfmQItWDvTYh4Ua0EZqjwpp+Vq0TwM7vFjVjMSyFl5WlxgOR61LPPDMQh8044oHIyBG
         VqoyzQoB0mwTbZTWxXHC2o+hFc5w1ce+P7p0xSeyAbxaqcvuwPTtcTKeT31MYODFR78d
         JPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219254; x=1739824054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=xDAJhcsA1Scl/l9XbeXE71en/RJj51bDfqQX8NygGBoOgkv2EZo4NfR8H306JRXf9f
         Ya4sVaOmeQzP6/7vhG9l2jck7+TnFXlV3SVr6BhQeps0l744DJNAQ8v6mGRvPgPXlSi3
         sz45quPIfsoWRIUPlxcXDdAqxdULd6iXvXwyy9EyEQNGMwUcRaEmm+23RqsPBw/rHhqq
         2ScwvPjJeXNc6Pqf+YgmJqcswv04mdj8PyIYo2B5y4CY6YiRPRSdKoeos8TRVGOrSSzp
         yQ7aZj5zhfCvk5PWW6AH1KKbsvc/xAMbNSWywpPcKOrLD5Ay5U5EXnQjtLc09OJmGCqm
         Vlqg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Bz3QNNqBQeWhRHRnIliPQ44wo+Iv5YT0F4stQ6/Oe+UdaOWPC1+vQyJnD++4Q4rIHcqwXTa9IGTIUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFqpvHrvyGe9LTx2i5r8MWzIk/195Lp3VMqtUtKj//QRMYFOTj
	jgE4e3D9xjyl8+rr95x1zZUz97Chbyic64mvQqZrZu+F7yobpK8h9i3HEvtwgvk=
X-Gm-Gg: ASbGncv0eSMhwm/AtY7cT2J2zt8Bj1gtsMc2ykEI0RZ0e2l8pkHrZasLAXqm8rbwzN/
	mfv2f4OtTccN9j7FOEBUM5cKDTr7C2s4S0ZlbidQhvJsNvIVxOmUqTMvXrHE/kSYGgl5230FcD2
	mbfflOOykY3KmN7UPcVqbRdbhfLe35Q5giC0Lo8p7lYMNHRbKowzPS1eKEgrCIN914KLr3TwGbr
	NgSaOXaFBB8ICk1qotcSa8ViIT5QnipEr2VXlo1zto5Dd8r4OaMnFy4Xio+D8BxAHVVMfyHtLek
	6+5QlapYsyt++jzB8L6TK65XRw==
X-Google-Smtp-Source: AGHT+IFdaxFBkgdagf7y3zqU2s2u/Xx2zJIy3i8Z2j6IzHAvWKa52jNah2tWLGP7hmgNkKb4ANZukA==
X-Received: by 2002:a17:903:230e:b0:21f:7671:a45f with SMTP id d9443c01a7336-21f7671a6c6mr168719375ad.28.1739219254463;
        Mon, 10 Feb 2025 12:27:34 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:34 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:54 -0800
Subject: [PATCH v10 21/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-21-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250210_122735_070597_720B16D3 
X-CRM114-Status: GOOD (  10.63  )
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
index 0c188aaf3925..21f99d5757b6 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -515,4 +515,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
