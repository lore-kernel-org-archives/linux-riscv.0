Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9831CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4MYhzMyi9234xWuFyECE972OMC/NL8bVUgkg7jxf/M=; b=U8mQxf8WzMN8uF
	aeMT2Cznk3xbyRyeF4wZpTFRHmrhJgXvudHvuSUWLu3ofuPskHkyuQWYlPoDT8euXADAIme94hUSU
	KRfmdwIuoqPMVhiqfXw0FPsV7UEYTyhR0hd4ls3PwHM2/YworNofFuzD7/F7oYvkA5JQHk+9NYNcc
	u8KfRx1vHl5sH12wTony3Nq8zXrdLcM2JeJdjAAl02vMW4l3Ptc9NheH4KgD7PFSx6g+AukoVLmBk
	MfB1OKIwdNy9SsfI+z9LNpZHZvRWdoD0pq/1HrB5FYjD1UoyxBl51myjV9rOa8NT+VAC0FqIwF+LD
	3mfMdIbZoGKcrHFfNHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961Y-00000002YOk-34X9;
	Wed, 15 Oct 2025 18:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961X-00000002YKb-1AjZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=; b=F/RNXHpP7Y/YSVqFD8I1Ccqt/B
	GzBbzWkzNmgs0Xi3/jMmzUjgFxA0eAoc0bPKeTL8kzkkEXe5sQJPG4V77yexGXq9Sso5zbX9orRYE
	C2r81Oate+MjEOmJJygPTD0wjbAS53o93qRwrOlZiizTFWlSfBiSHVr99vPMdioV1UIrZmeXTjtH7
	7QQNzX/soUj/bq5HAfDuVQjhy4mtDqQWR1LJDxEmU2EfEN5tlpHxSxfW2g9LXLmjmTWx45bs0BjvU
	cbNZ9K6wtXm6/xRPqUXQV9yxU4X3ntzJaAAK88hDpX67kRZh1PvtNaNMzfjiQlGywEURmy+rGPgqb
	SC43rg3Q==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v961D-000000066NV-3DVm
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-269639879c3so66006605ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552074; x=1761156874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=CSCtiNHkugz2gF1nBIyEqwPxMnBJD21FgAPbZpjq5pYmWW/Xx1JhqN/oy07IcDwM0Y
         CkbX+HgrQ4f4/11JOGX6Kz9o1Q8/gGX8LoA1wD6HZs5JldXBaEUnWpb9q/MueocYMH28
         I63VxQp0RQdfTbMOKUBmu5wzvJcCr+TVME9Rk7xkeEEGjhZuAYvEMUhVorq834jV037I
         pCpADm+Oi7oRxUIHxToXGFsvKm/hdVE4SFxwIjmR44Qx10UgEpLG2gPR01unuVwGbKYt
         6w0nxyw3eEvx4zA/BAxhAqGFFj2/5U5Cp3zzG2AMQnzppaCPY1mfEos62r+7kLsQjgPP
         nhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552074; x=1761156874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=R00JMrRjA7W077BonL06c/aT13lj8ou1kXidZ89VNKSOwqWQsmCo7zPB3HN35rzVyT
         /89Wf6JyR6QJ69FdfNFEeWCmG4kmbGmlDqyrVrxCemPqAoZPUh29LC/inm/PJhUjQ/rZ
         uGb1c8yduKKUwm+jdQu5h2HEIzTkFJP8y84WRym4HWHuBupMPvtjUhVSbmE7PdYVj8H+
         ek4nftAl+d72KUrg7sP9r5kx9F1U7CeYEuv3Vu6DJfUqqyy6ggN9wLm4bZmWSmwYXkUq
         WuhYtQyv9bdsxa27yNr9OuBC4mjC6LortvAkVtqUbF1jb3oVHZwttn7fLMj9Mdz1Xeub
         eJqA==
X-Forwarded-Encrypted: i=1; AJvYcCXhMlwfKiCMWW0hmTyvbg5EIX2NQkNR/avcapW2KyQvAAvW1eJThonjPwd8J+HVcw+IDPIxrZE6u17dZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTTlrL9bo89e/+POlV5w/jURH9phXVcgFRmA1i5MOS//D6RruE
	GV5n0+Qt0IKefQ/l6cPpSvMZ9oRPv/LQsP2C+dZCnZyjx064LbCctJ2Y+1Y7tYd7DSU=
X-Gm-Gg: ASbGncsZedxxJGa/WXIzmXJMj7go2vC8hj64O7uzZ2qTjdttwRM2RnqCrzHxrnb2lIC
	+cxzBJ+9YwLabDeW91PrQJLNTHosbcePKlzNuZlixXERJjRpM6DDfLzLOC7HRJZUeJB/i20fT5+
	d5VbxC84SUgdGX6IzjLPrsjd/T32aL9OgYli7pF4vwPnwZVVYk9OOREGkReBpEQ5sSmWv+hv5AY
	dpOoUHvugxjosvBWHh/25SICOZxJH+5PjruQeVTNbYl+2a28gy2Whfq+cRr/GHVSBhXa7crSBA+
	cHMakMCTEBJWDY0pzzUTI5QWbUhKfjAYdI5jCB0hGji5a2UjMbNz1f4s+ux8cpNFoxvwVYNA0kg
	HwDuIYcxV0wOTcjMPHmUes2GDl1DFl9dQFFJyQ+2rjJF2/XFKnBxfQb7pTPKR9bNU0Ae6u1qx
X-Google-Smtp-Source: AGHT+IFCUl9nXn6/g4/QRMrFFJf2GC+QgAYmJMvxx+BmD+RDmRwOcXPgXjT+VcwPuM2j+ySbUUEM8A==
X-Received: by 2002:a17:903:1b0b:b0:269:91b2:e9d6 with SMTP id d9443c01a7336-29027402c3cmr409235785ad.46.1760552073655;
        Wed, 15 Oct 2025 11:14:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:33 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:54 -0700
Subject: [PATCH v21 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-22-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_191437_319950_166B899A 
X-CRM114-Status: GOOD (  11.15  )
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
