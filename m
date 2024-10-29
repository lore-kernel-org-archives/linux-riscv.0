Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E19D7494D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZemSdf1cDnpTwrHFbWai7l82v//7ck9BYDYb52dHco=; b=sTSsGPEN8gzNni
	+BriSj+o1F4sQqqs4Ec5cCxRqLGrsbUzy4Agjq3ZpKj8S+/QlsN8GMi+Zz2S1mzbDbKQSw7E0PQIq
	n1jc9GIeOG+m0BCJG12h9qlkoNm6Wlg0bC0ewrlrxcMYtXPnSWP82IqgBxFMLt3BnIQ3l1VIuTdh5
	Q4i08vrpLNvqW9KxyhAud/MFzR82zpTzSotd3dghpFbT8eQfxHifc2NDRBdBeZCQ9+YKwSOn5agIT
	Bca5/pUW9rIjXgOhg1nGwuM1h0Rx15lt1fUStqKKBIrPlq66oAyPGp1trp71X7Cox8MM2l95N8pOr
	wXpcBVakTWAVv0OHmKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vuk-0000000GEtQ-2reG;
	Tue, 29 Oct 2024 23:46:18 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtw-0000000GEAk-3Dmh
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:34 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-72070d341e5so2665781b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245527; x=1730850327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xlMf/FGu+cOf/Hv7qUX6Wk1q9xFnQqCr1v5Bv8qZmQ=;
        b=vcbPBGTa0htvVFZ5rQfLeNfNZumVuyVimhRrIG++HylCHRGmZjOCYB7P8R3rRP4kpt
         EL4bqzBjIKwGxy2nY5ONFXDD1Md/8rdiKCKRl1wf6Gvgrg6rMuYg7FU5RHeY3e6m7M20
         +ei9kUU5p+a10lAJ5bpg1Y1F7T+Cjoa9NgnE2lPBLrhWoOKwSNoW64z+yZmJk5/SGy8n
         X8nkPv13fLUbRQZf+shvdBnrfQIdM8gHB5RmXhk6Qwu203yVloJliC8Xr13dU5Wdu3p/
         PImWjr2Z/+pIPl9riVcC450QofLjeGMx9jyCekzTNu7Ea/is/tiuB1el2k5ZVjFVHP5w
         ARKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245527; x=1730850327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xlMf/FGu+cOf/Hv7qUX6Wk1q9xFnQqCr1v5Bv8qZmQ=;
        b=qA0jvf76zqnYq5TJmCuML3mGFkmaB10bbLRDkLljcZDvdfnAZ4CuDIjkeJcDjKp7HN
         bKcF3Qg2IvXa5RQpi+GgMCzdx4dltH84rnSHAiz2mm4QM68Xdm+56NH+szvitA/CKZuo
         FTsSJqoKMABNnXoiv0eS5PeSju73cdEdk7gAHKf+HKTrhu/9e2K2lWP/AsHaHpCTnndI
         cu+qKiutgUc+g9xS4Gn1IrxUNBBOTU53zN41Tb9fUNwK8QL5t74UX44bmF/S0KDwSJ/N
         7AF/WBaBTdDRDvbuENZ1BXgUq4ZDOhT6jAhLbz6fqg0rSFxXBcS6c6aexH+PaRM8l9GD
         6gkw==
X-Forwarded-Encrypted: i=1; AJvYcCVCP1IR1ovOc2kBYVVjo3YxYz/cOPhJeVByAidzDSdwcyz8AkCvi9irJbxLw2aF92Uzc58o+fU+9lca9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwY6UxRJwbmLoZ9QaSITHHxnzRY4KJZ94CcESU5JFzgCL2yEz
	Xq2yfzPcm6N2JGiZG6JtfST2Np6aX481/luaMBZS8n6x2Jwxxx156WWhYOn4M0U=
X-Google-Smtp-Source: AGHT+IELr6IagcEBTdUxKgRdLblmitKpEm/GHFYUpbKbGEH4mdOch+QEksQsRpJQnLoaEfYjLi/gYQ==
X-Received: by 2002:a05:6a00:2d17:b0:71e:5fa1:d3e4 with SMTP id d2e1a72fcca58-72062f86747mr18633884b3a.2.1730245527282;
        Tue, 29 Oct 2024 16:45:27 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:26 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:27 -0700
Subject: [PATCH v7 27/32] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-27-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_164529_012836_461D63DD 
X-CRM114-Status: GOOD (  10.84  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
