Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7A0CCD199
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBvFNzqZI8BZtXpYTR5IwLtx1hWiuZ5OIJUr+mjHZww=; b=LEp29A+IIKK1DT
	gwJ0vhPe1IUx6s6JqxpDfbpuo/aFSw/4Idt3Xk9VPfVD0hvdxPuE1ukmQMGVK3ABwLOFQK8wBptRi
	uqEP4EPOwMUjKywc42YUaKHqxQtv+Xwz6b336nSNXvwJIC/YlGVQRdbR3IOY1fV8MszghDR2CAovh
	mdL/wAUC8jxP+3QZXdRHrDci3r627C99sXgcGX4Pmxeol8cudkc/wZWAJqoodSkU1hHN9XKPr4PS+
	qmsV7INWAVpU5vZVxugtwvxyHuDZ80cPyimGG402dhb/ujUU6Ocef6JCx05e9FhW62t6UvZls+zeV
	PUH5wxS1yCDz/HmXLXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960Z-00000002WrS-45Nb;
	Wed, 15 Oct 2025 18:13:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960W-00000002WmM-2FiL
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:13:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2909448641eso2517525ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552032; x=1761156832; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=SFE8rvzJhuwyxDVGC9fvqGHkm8NResforO7WSuAC9NOoe/cJU/RLtcSrmQUAJ2n5Y3
         oWMkgsKNHBHY01s1W8r6hmzib4cFfXC36zFrFX0ZqOw3yj8cTFPYzv5RTq0EECG1j/AB
         FQ8Iidf4yrdGI4P7TU87mTavFdygeErFG5HL58IH8mFYkhlWdwXeli5Ecj31AbFGorCR
         tbbGWnT6yXS5DwPmnD6b2CNXDa7ZX6eEUVumcUEk3R4DeF0DQjMMpboG5my5rwtsBWYV
         5q4ixcv4J64uU6y4ivUnOsJr32HpPXojaXV+u8M/kJgDJVGSaP5EnHr9yAuVgwssuadi
         YXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552032; x=1761156832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=X+rHMWECUt4eT0cvvLhAiyQQvlmLVYq9xzOXjEWv+qv8Gz6srel7J1C27ZhfScqztM
         pWMZ3t3mBN3MImBESEYRYtgMhe8W8AJP/OqsDEtbwr4DhUBh3ldyFPVT22t3QZa0ilBk
         YrPtQrNItSHBuHZ9rS3lwZjbhPAFnpNnPx3pUHWyn9XXZrNfRYiFYBpxRo/+IJvYoIC8
         hOhz+zH4NlS098Fjkgya81PR8f68FHKPit8GcCHhEThZ87PVYWxClhZ6MSWKQ+D1EaMp
         l0VUSDip9tUVyCFVXRCWIGvgXHs5nUKreeg5k3k5MUVJjgi2HW1NzYWQTb+HqTxenei0
         ofhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUduYNHw1xT32wNaGbTdYAWK07wQGcaPZjHDVfJGBb3kccd86OSJYBZyaCjDdeOoDAe9XUHOfVi4cPTbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZIYGeFXSqiJiMftqRHLB8EhbtC4Zq5xTO53UcJjRngt7duhp1
	Z321C+/uLVvLtAhvlObZjDh242YHXHXYWSjiL8rBMUKNrnZm0+QOcR3JUmxVeMB7eCg=
X-Gm-Gg: ASbGncvRKDt0XDjK4Utzm+d6Vebx4+mm3ADekutaq17S8k/JdAHxHz2GaF+mH06WtBh
	Z71FxPbdnCK4Zij2w1amYWh5gKBF/Ds/Wf+Kg1DNTe0TJnKrFoH8RsVOH8ADoQ2G0+lsemNJY1A
	OskTcCW/ypYWThKCrjvin+ehDgMSTORt96BgcpgVEOEPSm5lR3ccAvCvIi6dK66ge7fC0BdxoJm
	7pn3M9ZIn76Xr3mCrYyVb/XmsYzPAzN1/MhENdcEG+nLlsOufbr/THZbng0buqA5bEXUza1WF2o
	YPu8wXiC/k1FSNhpuSNErZ0ZyESHZiCpnovnXuqyys5ivUtwJw3Fi509ubJxQW3PaJ6n9CUGKja
	CvKGVF+dslfuTNHc65GsVPps/Q++/07JlSUZz/3DjTvjAttgU+/doX9Ikg0A8tg==
X-Google-Smtp-Source: AGHT+IHf9VCcJrzomY2w47NOGMiIFXsiRbHA2ENGQOPxL+quuCn9bNzo4PbiKvmN4fVVPNoVKadYVQ==
X-Received: by 2002:a17:902:ecc2:b0:281:fd60:807d with SMTP id d9443c01a7336-290919d5389mr11770165ad.2.1760552031474;
        Wed, 15 Oct 2025 11:13:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:51 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:36 -0700
Subject: [PATCH v21 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-4-6a07856e90e7@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_111352_592107_FB12A7DF 
X-CRM114-Status: GOOD (  10.33  )
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
