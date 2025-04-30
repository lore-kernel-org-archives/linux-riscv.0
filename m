Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A023DC3ABA9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=yhyzX34vkJlegg
	JTJ7Ks6/mi5jteK/1X0JllZbIwHQMgw7S4f36/zXo4EYkfpnKdeFXFYKlp+3zJ/H0rSEOvx7Eu0Xc
	uzN0GdKKdWJF0Mw+ncTt57YU9NOHZcH3FnsFfr5xVXAZpOf2OUdERWjjJmWtAipcTDI5FP38Avu5h
	Hy+CzpqDSjw8/6gq1geWnD60QVXY+1mZiSqNVB7aMTIYq3fCfFtQrnBch+ExcUUU6zl9pTOwFI3LU
	7TtMJU+P6ViMfGZQGxNE5+ymKy8T55o0Dl4FIngXvuxtHw14mn9b1OAdhTR4GIzrTLF3ie4p7idkz
	lkfiBX+/9O5fb4eukOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7x-0000000BG2T-0V4f;
	Wed, 30 Apr 2025 00:16:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7v-0000000BG12-122r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224191d92e4so72618775ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972198; x=1746576998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=upDHSPm+Gy4eoF9NwSAlMhLPVSufnh1RAaRLtiQ2jJA8wVfHbbFFgafnvB31n0p0Uw
         LtV9nEOMCA7CsSOOy4Ygoz1MnqG+KN1EfiK3LXcLI6ciV6FPDJdu8yZakfJBbnNW9dve
         tEDlmWemJNOzdDPIybUSJ4jFuAETd9Dhv2Dk6C0HNf4R/hyadwFOn7HquAuVb4MYuPW4
         nVxCaB4mn3lsuZKvojnFXNRKuHsu6E5Po7JOpueF83asvgzUJOrnec6cwfH39S67wngW
         91jAiuZSPizZEYoIEvhIPPISbr/IBj5PW6gPkbdMyjAf35bwIb2H6A64KDZ9WjhPuIeH
         Qmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972198; x=1746576998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=kWBc6VLH3Q043iuN2pP2rr07hGSDX99YugQVINgjgqz4uqu4rB+XLMAMsQ3hKeEu5E
         O8D94OnpE97v2D99xboTt4qQ5haX6Jv9Jl8ns+YCZuRi2i05fC3029RdG58kT7uzRQd4
         ao/3lWXbLPDadn/viTPcU03Ym9D26MfsS0vrMtZiBjnroM3o2c8miCvNyO7tKANjzhoZ
         5HhLk3b1FIROwTLAYClgw9l7hKW3RMQEBGuPD5nJ8dnqq/GU8lU2j4Smn5zKi8gOgk1N
         4NhOQJSua8flR5gcbFwix/YEB2h6tSHkg7en8ryvS8vwy5VVyhdFR3Dnq5RlCiZ9UEy9
         pm0w==
X-Forwarded-Encrypted: i=1; AJvYcCUQuPRGD5O1VshsBuHDdodTLa+5e03gvt0E5MavbQBbiWXa+sFGSWf2eF2JyHfFf6T72UlzjOciZc7WgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCfci6JL9H27Yme6qXuURkB+/zb3fBKuosSpI/UsZ0OHpsUwgZ
	6LrH1pIqEBL1aGyYuFzI8FqHF5RBc0SZcJ+lhgQZqJzgDPmT9txcj4HnDn/xxzM=
X-Gm-Gg: ASbGncvVLlocfU2zW8cPJS0+PF7Dww3CldhmRNPDAs/tGVyaRy7XknUDkFr7Zn+9pHl
	xxL99O6xus9VYvbZ77z7RUzBwaqs2BPtMAPxF2DXCruGiiIaX0XQwk+YxwLxy5HJeInVB6rR6DZ
	HjsVLo0p9023UZXPdw8RgNk0HIZsYeiMTyZb2J5ApTif4zeA3tS1bT396JUHnuZd1fI08Y5KazT
	j2rgR4mXtDf2lCB9YxhQWx5V8OXKNpwdP9wWOrC+w6d1SwI3HdCCnsVdfHpYXEE4enzNEPZFoaU
	HCtfPXcDrdWQQ4J+htT8CXx5RLkrDJfJ1yVLShKx/b+rJWntYhc=
X-Google-Smtp-Source: AGHT+IGgUZYU3gBslaD7DYbu9352xzjmmUNsFUbJHh9p4RhBMds1qn9WRtirqdbQ2JrH79nyYx15LA==
X-Received: by 2002:a17:903:1c4:b0:225:ac99:ae0d with SMTP id d9443c01a7336-22df576355emr7856465ad.10.1745972198489;
        Tue, 29 Apr 2025 17:16:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:21 -0700
Subject: [PATCH v14 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-4-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171639_294446_AA9D0E13 
X-CRM114-Status: GOOD (  10.80  )
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
