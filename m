Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B13C83F1D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=hb8WF+Bhz7kavh
	nMTDqXAZCua4T27WjXCKBx4kNfd87BFPLSmWR644Yegk8R8YQqpzr8x1xmOc2Z7/9giNRppXGuiiE
	2HjMOlrIsYmFeFO1gta95vyKWijHEvCn7+RkGulkCntv8kfIGniurugb5ILDibosdjLZb/6BlJuT2
	8926GqSfsvnh75FKW+Vi+MOOQvHHmSurexJyhKLsGryZODgAIhTgZ5txxfmTTw1qxYXg8fTTpMpEn
	PIlKjXCcaQ6RozwrgQQaJscxGw0k1ccW2bKJ3y4yWNpmx98ASFYoW83eXdOHb2N8TBnWAZJBLur/l
	EJQLIPt2yTj6hjDhuLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeO-0000000FoQ3-0Ors;
	Fri, 11 Jul 2025 20:47:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhT-0000000Fg7L-05CH
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-747fba9f962so2214663b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263186; x=1752867986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=3MZebJg2L/WAisJB3nchDAC1K/ht7Z+J7luaUh4VzYkU1pWC3uKFObROolarsD5ZkI
         8hbep+Suo/K7nksWM9HhqCPtkIKBAfCK5mkm97zUrgQqZJhShYDfV11M9IaCdcvsdkB2
         0HNz/clC4IDoGQInWkhxC6d6UNj0CotqTGtcKSZV7Y7mtyc+vQ9MMS/yuvU8n2Mc8s6h
         G2qfvxOD3eERzLCB9eAjfxv3qe8AHwj7Q+eIglML0N4II3UjH/1O/5p9c8sMWUwv9+1s
         vuIDrObksj4i9kSB0sOXmm+NQOhVld/lZ5KgmaCFcCD1tGBqWUlvsF+IjRZaORJ6NB/t
         0TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263186; x=1752867986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=SmJVJUrgpr5CgFgkPnPbZcolsOwPDyIKl6IUzS8IYdzcXZP2zGiCyPKTccCPrSQNVp
         mhVrIyhev7GPAItQ6+2qEjGE6bKlfNunORUIU6Mwzt4oinb0M0cJFglqgUPgqa5QPYP+
         LD1p+r7ZV0e4bOIGlR/GAUsVPNfVwq5Qm3aPn8WbYxdlmeVDCtcHtKsWvDOJg3CAcMnI
         DhZ7E0eOgRL4fhzqHAnXE86BXjKDc+XnSKXXFoIvGnh77HGD8pr7KWNPZIudTRGmwXd3
         8VY604LQ/usaRgVXt/+stdqh7OiafFOHJC4ou1t1b4g4uF1mn6nL+q9ID8JBOZXW5NU9
         TKJg==
X-Forwarded-Encrypted: i=1; AJvYcCWaLJauO0TmO78R7MpUuR3VP2KtZ4NI2pZOBs+qix+VH4ZUEE3MvG3Gaph4fv9jj0tUhDT5jAB6mOa+XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZk0L0IaA041r6UhacO1fkdtBYyLl5QypTmtCMlXmjw2TmGuTE
	hlUr6mSk9gqLDHCboAaByIATfg9aptWCUAISYMeKo3lzTVVIJ+yqifVcPLjhBo78eZk=
X-Gm-Gg: ASbGncslY9x5QFi3H0/sa+FkTYybiZqTnq2zCdh8uayTl6znWD8/zHnAkR9SuDYeacn
	orIzGzN1kHHS78yws10IwDeDFuBipiABFsahPkXPvcWj7F98sBa4p91+z3KWkz7uV4f2VI7zvAI
	njaUfS8Q++1dLNIUaBhVfxipVbQM2xEkLgr+xDsw8vYTbkac9BrsZgeo10Dn0mn+W5cg+hVVbio
	NdFC6QX5DQdzd7T4meUm7QDokWN6W6XS+Sh3p74ys7F/4C40f7UXF+wgw0n5nxhndKverGSebKM
	v7OBUnvLAgUgaxOwpc6vpVO/LBh/+LQ8tpBi28vbU9wXJWNnwbqHAkVE2bMbk0ES1jyKHT6mlCl
	SHnqWlpFvdb1G8OrVhiMdTKYmUQELK7ec
X-Google-Smtp-Source: AGHT+IHk1XiEj4FpMiqxFpyzNMz9rTOrxw62KxiT+gyE2Dr8zhJmShMtDIHUXM6FBcUeikzrj/OBJA==
X-Received: by 2002:a05:6a00:99d:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-74ecf7cae55mr6943507b3a.4.1752263186160;
        Fri, 11 Jul 2025 12:46:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:09 -0700
Subject: [PATCH v18 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-4-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124627_055916_A97083C8 
X-CRM114-Status: GOOD (  10.52  )
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
