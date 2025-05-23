Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67569C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 05:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=2KIWJNEYaKI/aj
	wWo3fo8JKm8p7Ogk6DBZq91DD53Ax0xRxeY8Pja3+PIIBxIHsxAJod+gf2bxyWVObkVcL+bUxORvq
	sMLj0qkwuDpkzfwNN7BsT2bCIPcsN+bXz1JSrl2By/vNkV/L9DgKdx7q/GUrBe4dlzvr7NwtNaUSM
	Y0Kyfej+SR39oeXw09ngZEaFaxlvc59W4/Jfo5M84ifXB2kchh5pvh929oW6VIkA8lcG9uvAxz+nU
	PgYpD1mNBuwS7EHJHGA9gyGwtjbLQ2qJJ1rBzfHlfsmSPUpFlCpV9pe1ZBWNpv+Fj4w2RfhFnc57D
	BwAQHsJzSLfNDu2Vc1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0G-00000002zwC-0MIa;
	Fri, 23 May 2025 05:31:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0E-00000002zvl-3Vbs
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=; b=k0pIdpDkk/zK3VtFkHBzjL/dhp
	u8Kiwkr0SvY7Z7+9ShYWR94bK1g1D9G90OXGL5VdYx1gTt8qW3V5w1J6jd/O6rZ18eE66xqgWhFNN
	KjoqYgA3pNb2RfJamA2L3RqcgeeKpARw0VYVb4u8PZp7YGgJBehNe1rgpPhjLo1KvXA6EapHHThAU
	1XShj8oBqqWYTp5YGz61Ic//m8jHoCTc1UiQbcvns82t5yxO7rZ/hyBVlRuiMxavTRSoUwvT0XZM2
	DYqdUY3EEyxM3SH8qOVfcO3qV9e5Iyl1mOTUqq9a26if/LdXkj0IAixBIwX8Vzz25rGvRM6+5sSuf
	cOyRgWBw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0B-000000018TW-3V8J
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso7410923b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978286; x=1748583086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=DQldULk8c++UqWZSHOXlmmvBK27qFbOki60bkOEjYEQX7eQG7zs0480ACJY97QwOiZ
         ZXxHaEX6GQjY7GX1pi9cw8dNjl67fp7OtmnK0It16jT4TibbJLadEJcU4KwibOm3HX6o
         NjbIDgcuQwAU0HCkTFLHj0CayPaLtkKPyjyIQJ1lED5ew3ue3CC3OQc49r3f6X+EaCPP
         I9AKbSrVQYY6Bj8tMloGySmdfsPoNWJvHn32ZFMr1wI3DCpsDQFQKDSRQR02dPb7Q0ZX
         UEcKNr1ObaKALAGDUn/RJzEQ4eT36iQdlnhFQMEVCJtyySWeOfvpOqgkru9EOigPeT6i
         eL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978286; x=1748583086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=ZUKD5HNGl1920yrUQg4NBbVNHi0ZXMvLUnAC87r+9NR5tFlCSx0v1WQ1d3Pnggs1mZ
         PUYdJ9WLR9vTeusNkReClHzhbLZO+EgleQAbmhEBq0k5aEForYa5KGYM6OiTPqquFm1c
         1Fm8MRmNhi7y/9Knlv/AeqANC3hRGHWdaUAjwT3QY+4pjJ/1KXCB/ZnufUUN7yiyp0ht
         g1puLrjIZzNA/AN0CZSjium4DOo5J+KDTyLovFMimNvFlwpeWX5d3BcUWHBGv3rB225K
         zNaRuSzrGPM3wCb609nKPnmOamW27IF6uQMd74SDRSW2Zxxcs6oMXrgEjjWMc/XdJonX
         VPhA==
X-Forwarded-Encrypted: i=1; AJvYcCXsuwin9X9PkKf7dikYydBU244GOkZV+deSUfWoavpPrYXB0Dn8ZNf/myjX3e3GFvZXwmst3ysAGNi7UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM9Fybb+4d9FQvl3uWNprDBKDOtLW8Od3QiAaSCZUwzFuexb/j
	yoaKRUrvyGJh133Lm8IaU18snGCJu0iA71aE6NJveoMzLYaoH15QbkPJ8LVw21UgEMs=
X-Gm-Gg: ASbGncsFZia4vDGGqoxbR6uxMrD2GrwFtGnV4Vcr9UxpbZTK7LW7Q1+VBQrtJO/vU+K
	6f3YsJeqkCnLAbGKVCJzfd12UauCqqDlZMCSCMFBANW6Gs9eilXGn24g2EL3E2J1qtgdZvf4ANg
	1TjYC/eRZ24K/uq4AeL0IU/XwAKHU1TAC3a+FrAusGU0NghFVHad8gA6KkbCDIP+JkbC2JQh0J4
	n0tgGrBQIaIjZAmMNUpyjofG8vqCf4i662wdiu+92pFJrzCRwXCBuw14dzU3G+9LJBJ+yI2G499
	ujhM/lmE3eFsRSjy7DnVvY056ds7ZH+iI2j5OHV1O723IEJxRcWV+BviIiIbhF8Yeu0RLvQs
X-Google-Smtp-Source: AGHT+IFy9mwtZnQ/WjFKBdOPikCoEGl4650GUvlOy8QUpra7GcIJlslhC25l2UA+JFmADy0WTQ9Ftw==
X-Received: by 2002:a05:6a00:6f57:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-742a98abbecmr38574133b3a.18.1747978286017;
        Thu, 22 May 2025 22:31:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:07 -0700
Subject: [PATCH v16 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-4-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063128_027266_A44FB37E 
X-CRM114-Status: GOOD (  10.39  )
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..2f49b9663640 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
