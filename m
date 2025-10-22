Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C02DCCD1BF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBvFNzqZI8BZtXpYTR5IwLtx1hWiuZ5OIJUr+mjHZww=; b=ekVt/4i44dBdrQ
	33X06thbUva5WZNWP5DqwKya1Mocv4C8oFWdYR3jC8/XD/d7s+lW2hXov0dq9SbSKYXnI0TAmQzKu
	zLABGfJzdA2/bxbTO/j2PROoc279XscJuM2NcuI1n3RIP+PAFgp9G3OPZST8k5MhiXUsll1Z1DKWm
	AcD4LtNhHQSXfWEFelS42tbaoRrZYi1m3W8xWHaJszyfPogjqjr3uKTi9GLLoIeSJ5iVjeCbp3jyW
	2CsmCAWVlAyI8wzZlFcIY9N39pgusTC6wPWFVHBCvYiDsoJqDpe+LljenX82rErm0J7vjUhGQznHY
	KuLW5UEK+qvz7ttXrbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiH7-00000004YFh-3a2C;
	Wed, 22 Oct 2025 23:29:49 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiH4-00000004YCc-3Yxx
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:29:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7a226a0798cso150530b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175786; x=1761780586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=Mk1qWuyLSvLyIL5KpYBUXFW/2liuKjModl3Jm0AB5P2eTWd+Hjf30FuaQsJ1pRbWgb
         a77HQokwl4Ng2wZnbfZ+KxkKHI8Vezy3HAvJN4KYzxj1h2oUpn60JDPw2m51bFBXwozW
         wcFW4d3sDXyFqWj8johaFpED+n45akaKhjZYA9rA5o2l7akVy3o4YUWrj7Sw+p2y//5t
         UDVtBW0bMyEq5wP+R2Pb3YRFiYU3o8THMJpaIpaRfrVEouzG/oFOuGjMXme6hBnsTFIm
         aWRLq4b3dUt/yy6fsXd6weBu6eNgL5os25TDunAUM2zRVcln9r6qee+N7hzKclVv7Szi
         cZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175786; x=1761780586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=N9ZKr1easqDnLRPtytURe2JW4batAU3aVeioSXp9JtcgeTdfzIMRYdJkc6N3swLVv2
         JDj6hZWCgmyMK4GDCTmEsPJNeR7OS+68dPsMumSz+0A2FCcmcYKKKxaMfIcxYaU0bE4x
         qYGVDN/z3grElhBluMjt15fqGxet7bYKhaaMCKWd8RlFYOcWQohUsx6yZmyptwuunEog
         K4Xekm8YzYe3QGTN+HqQEvVHAoLJiAKychjCV4B3H0h1LVqiyK4/cOguS/cyL5TYILjt
         QhmXKwdvKafeEkgtyLmReXpT3ztc6JEauRwCg/zPXMUCynStkPMlF20IGHT+YM1Z/o7l
         z7AA==
X-Forwarded-Encrypted: i=1; AJvYcCVxw/Mx/gN9wPwtTsc7c3gAX2lilw0u/G2xSldZrflryo0h+1kIhyuTV0b4AxnrFKy1yj3nz8UGVBmoiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaCN+t45hbBpu8Kob8Wmv5eba2FVBZ9v+k+9k+6aMQZxlbXbkU
	WVpE+OoMSfRy2k6Omsg0UcnDuRI6SRJSq2CUnAi2Md8C3xPkndBZEDtBAGLwavG5Alk=
X-Gm-Gg: ASbGncuzx+49y6EBCFnIsret8SetrGlN3DgnqqG/bjVOliO3rnd25UVgdK1bY8PSfR1
	xZ7NeRWpkPv05n0GsRecBTz7NE9UfnPYu2dBPlBn5tlUZuxNZb/Z9TJ7XMcZ99PHF1Lw3+BOMB1
	gz3Viw6/hRNf9MWfe/wwYgzHXgy8Hr93fqk0iFiax7CoaPbvq32nqwRHNPS13v2xnHmGxFsnCzn
	Nhw3315VM/c2/8pVVNr2VhUC46aQFwEYId6ZHL1ivi64+X5DQJYuOJvdOna6Ve3mIbOc190UBb1
	vxkySjwb6KkSelvwV6F+wVjQGOXH62VvYynE0RP/rLGuBCfx3n2A5Je7oDu0N5nf6qtWOMV5gpD
	xYuiD29KnQZB52lXs2cYgLxZkZKv8ya6zk9ow2GfTb4pJ+b1FltjZJVYWJvD672ZHulRRQ/ePvK
	sqIp3/a7zBiw==
X-Google-Smtp-Source: AGHT+IGpg9In2jt8/9pAPq15ryiECZkAZCWmg0292eiGIgEJkxmDrXUmRgAvAg3+aUxc5xibypmpsQ==
X-Received: by 2002:a05:6a00:3e24:b0:7a2:6e61:c2ad with SMTP id d2e1a72fcca58-7a26e61c595mr2577650b3a.19.1761175785988;
        Wed, 22 Oct 2025 16:29:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:30 -0700
Subject: [PATCH v22 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-4-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251022_162946_911664_0FAA5737 
X-CRM114-Status: GOOD (  10.59  )
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
index 4a37a98398ad..78f573ab4c53 100644
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
