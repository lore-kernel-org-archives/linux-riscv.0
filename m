Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84760C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyKdW/ZXsRTBe1RQ4y0DAX/QqCOyoDEFe+L02jBTanY=; b=Y5vnRLrfN5EWGp
	dwLk/eSNYqrGiMJrkW+2s1HpS44MdI6ypUK8Z58QVyvDiT/HYd4XBccNMepsa8fbqm1QAi9OP7yMi
	br3KXaFmhsazJRQJENKIGgwWcHPgpitQzqEIDlUJQNfgNglT9jk/UDZHX8hJHxeY3IWt6soCZbdYK
	o25g9rUS5l8MNAEgFV0JIe8I26OmAPRcMRbwkXKnH71H/mKwBD9Fm8L0LWTzym6TvvBklyBJW8zQj
	u+Y+BthyHLwH1iRdxjbGYnq9VgppOFT2No0Ou4CWbIwU4ZDO6qBHqRU2HO82cSrt/gWURaMOdlDLp
	Kr7lJcJTdnoPgmHLOXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC2-000000028Xy-195s;
	Wed, 05 Feb 2025 02:31:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7f-000000021g5-1Qfd
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21c2f1b610dso147820175ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718554; x=1739323354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=k1wcS0D7rGvq5pOQsKRhr0bA1cWGUApku2cvOhEPG60JdTfr0EtSGfAzZ4HZZQGVrE
         RFiBXMHhQMVWxtdW/Q8lWDUJq9sAFDCt1cgel+iHofevFuP+q46INHPZy08xUSV+OuIG
         cXz7HFDCbXoEjymqRo0LQQ1Ko5cv0+wZ7JFMjWRtwynEuqDuq7FzwitmfcUqyDAlsKg3
         y5aYRPMn2mGL4Qmd2LJjWl4jtxlMerSOgrtV+BPdwIWJ+Ksnxg1lo3Y2Xq386c90peFA
         41Jibs0AxMn9pP3hPkSzAmpnZzHZJho8hp+uAMWdSoMDP5yFm9JsXJI3RQe8eWZjbzRM
         z/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718554; x=1739323354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=wdfuoqhGInqWi03atPe1SD1qyAyXWxjAxuhBvMP6Mea9dil/ffnZbGnC0CAXM9N7eJ
         k2HthG+odYkQPtk4Vov/uEDBeGH8rcdyJSNV30QOBvmx5ZnbGkmwc5wnmrNvmt0AgjMm
         WHda6CuhqwWJq+EpxZ369cE6SJXNH2FrJy3aEtYq2wkVuR+xOXX2oKtT9L2MtpEzejGK
         dlLX+RQk5v647DJkSXMPMzlRvlfIVqHMUcJjQgJaV6ai7DRUCTCx4VdbQezeXl8c488d
         XPNHFV1mEWOyZFna1YoUL7fqTL6pmndxeeHEaAR+EuOnd2pO+0TW1Bya/87JqK9TcaMY
         92VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPYszq4rvo5DLI3dtK2cHG5lUuyYrfWlxZuD8q5s0kbh70dyl8V9OcndCSJi5iFD6JUhHSvDzRT7ZfMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjG/W/2pklWJPWmCc5wirXJ84k1Libi56scjAyZhQBBQx2OQKO
	nxrQnKZT9rT9gTzB3MKlvyYbqLM5ag2YOJkFUweYYO594qQA5DZGbWzZoZKQilIh7917ya+v8n9
	S
X-Gm-Gg: ASbGncuAy22OmkWVPm/9qX8/BP4py9PkcMhOh9RBE4T74RGoHI8wz8Gc5xwyYeE65Nn
	eNN/3OG5AS/4D2Wj1qpBXFWBmSwIk6r4WA3M5RucqQdMiI1JwT5Z+1cOeO654JwrP+oDBw4Cy3a
	x1c1KswiIqqRTObT9Y6PX0HLGJHWuT39v0Rt452bDrcThneWTfucQSRx0bpZa/DPaMrynEEr5Iq
	2IheRziCVZsUP3AzeN8a8mtiBD4WuMQAChGnJDR4d5FYiXfpm10BJTAwWLA6oP2xyZ4CEvlGryL
	6C5NerxzfADm5mlA+KSxG/c4KQ==
X-Google-Smtp-Source: AGHT+IH0iBI7GsrizybTxNC+zOavZ1B/y8eyRteK7EdWTKItBlHpIizmBx4MRSyGuMGAUg4TIAF8EA==
X-Received: by 2002:a05:6a00:2e14:b0:725:ffe:4dae with SMTP id d2e1a72fcca58-73035122ac9mr1196692b3a.10.1738718554007;
        Tue, 04 Feb 2025 17:22:34 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:33 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:08 -0800
Subject: [PATCH v9 21/26] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-21-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250204_172235_393647_FF9C17E4 
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
