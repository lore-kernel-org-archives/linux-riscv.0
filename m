Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624D3C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyKdW/ZXsRTBe1RQ4y0DAX/QqCOyoDEFe+L02jBTanY=; b=ZbfL3VogSfa6Cg
	ZF4I5rYUOxTnC51/PPYos3tztvK+/BUbjik1kp9agVhEpDRe19ojk9KaqnDdSk6rRGpk/bZezLnC3
	vZ6oNlcCBJ1ORIa4AfxbgjoNfqLElyJMNJFiOl8wJim69slo76Ke2d2Gbc8/iuigfDEae1M167OcZ
	v++z03RIucHD3WxvpMfMBZ+VN++ZOPACt0cSbqedKd4r0X4GxAV8ceKvUsT38+xu/TNJhxctPuLX2
	c2+/oz8T/Jztyu2SkSSAy6bl7U+1EmVxQNPV4d+ppRtqO/4lxvznlGjEW6lpfkLeJa9RN2flQIt2Y
	C7w5pzC1j9UPZQuaTFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGq-00000003Wty-1lT0;
	Mon, 10 Mar 2025 17:50:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVV-000000031xf-2DQD
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Mar 2025 14:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=; b=eLhqxQb4nYHq5KJewr+1yzInNY
	+2UbHNwZfQlwVX9bMytff7aNaoLViLMq6HiWbPOiF1eGRGYCdlpbkYV3D3uvQrPkd/ZYlnVeCPOth
	A9AYwfhVgz/R6jWCD7vKxZfTsM8cr5Pv4y3XzX7TYef4u35VGcjrbM9weP/G/Jxza5W2pCzvHwN82
	qvC+vM/S8hF2YpKxXqW7V5svV7TYWf7pF+2S/m8RyMlyLzgx/VyuU3WA9pXKsab4wUeoBIzAapq6T
	jhK8bjkp/HvqkCK+6EXymUOw8vu+vtajhbJm562iZPUxLf25kyqScwtIcvuZh0932+BzpyvYGvPLY
	f7e80Wbg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVS-00000001sSd-2GHZ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-224171d6826so63930365ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618404; x=1742223204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=cmOC11iBjWuP4YZmtTOy5w0EEgXi90P1XKvTcM4Bf32vr6DP33fxh/YkY0306Rdgg9
         WDxg2I6GlFFAFSZNW26pSrb10rJMJXD8oJGp0QzAC/mzGoEipgyqrZske2BK+Q2mnn79
         38S6oyYoevO5ONck6i9DgW7xN7HmL0enyNpgOs17OCgDUe7siDeT3ju3pANFRs5rgNRg
         2XJsA5E2gDU+q7ptF/rXggy6aiJXmj6QlEsC1qoXfj6Ky4LNbY9yn5TGna16wPa/Ju01
         l59bZO9LzR45nUThRRdde8AqRqvqgunm1nN/XcOXEfTMrtEh3kiH5AN5f/HpwEmjIcgo
         Xxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618404; x=1742223204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHkNmM6XuphgUqeYDdwRc1f9MaOV9mSfy6OUDBv2dEo=;
        b=Gs3TO8efpJqB/2xcVus4hgRF7mnm0mlMzfeO5CQ4VvBcaVRSxjzIorQn5/wZSIFf46
         IXhPj4TvZmCcelsejiH5FzVNCUC1VImxOuCCMCBamPLqury5VseqAf64PmLSyYCLHykd
         AgbAig5TieZoJ0m3AccybsQwJw9u+0Si+1n9YpSzX7Jiej3L4zcH1ESwCV/RKTXMFnG9
         dASly77+SezKE0aeFTF8ybljM+Z+02RZ4RE3Plnw2DJRYWsQu0o5UH4ejvuTKA530pEn
         kvLdv3C4GBI1bArm3zNWxXNioDEl4p5ivuL0NImiPsK9wS1wsTscO17ytn5iFvk+fcjI
         e0bw==
X-Forwarded-Encrypted: i=1; AJvYcCX1I8JzSqQYUMV3QTLbmOA9I+Nh9f/CiCU5vK7hHboDKxhJYb7yYDvLMc9roJ2TwAyBWGnIt+Um0f4nCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyibKTjwH9nCNDnSnHhOuxU8DMgt4gkyFKYzafRIfs9qOk2qHZY
	SX2gLeyP899w8SRPeM+ZsUg4AtKkgrnLvj3s9LMkIoczadRvJpYQHlUhhJWksl4=
X-Gm-Gg: ASbGncvMfrtiTL5oB0V3rO/gZpbELVBdcrm0Si3sNWvOcoF9cApOh4cEHdX0VDpIeB/
	WxL97nZkdGhlNouI9cNGEkS5lQ9qlizOv8a069LZubprYPP0LX4o76Ft7x6IbgRl905y585G4OV
	AjK8BdLtOQOVBBikvoLq36Qzk3IfDK0jMRr9P0l9dgz4bvDVnJqDuY99qswr/QklZSRqveYzVIZ
	irI4aU/mMsBJd8XMRfQv7ssAH2bB+Yp0s9+vp844VsXizXxrP5aGETfe2xieKUdmT84dEHY4E6V
	MBMPKSMLY8t/hW52e6tWPeuNilvMD+R309mN+ZjoS4LQRcf++7Ka/3w=
X-Google-Smtp-Source: AGHT+IEufhMFpKiNcPYaN1q7fnoyb0yGUoGedR4PcX/LQ5rFfhM8NE7LJbQGAfjZIn8NhFa9HTR7qA==
X-Received: by 2002:a05:6a21:b92:b0:1f3:3f0b:8abe with SMTP id adf61e73a8af0-1f544acd261mr21823779637.9.1741618404090;
        Mon, 10 Mar 2025 07:53:24 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:43 -0700
Subject: [PATCH v11 21/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-21-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_145326_914206_A7DAD6FF 
X-CRM114-Status: GOOD (  10.69  )
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
