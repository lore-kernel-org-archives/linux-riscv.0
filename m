Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23713CCD18C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBvFNzqZI8BZtXpYTR5IwLtx1hWiuZ5OIJUr+mjHZww=; b=J7O/vyUMMIlNUK
	XCxAGG5jevH8XYoXCjjVchEUUaj+25vOSFuKccQ/T6I2PqeAiKI/kw07m2LXT6OpEgXIxKmqXOcKd
	99zgQ9PWTdn6FtICUtIqftnbnLesgg7K4zTzTYWNBPpOaw15AnLyjIvFTf6Fr5AJePRkkK05URBZd
	z1H0d3fKVBgLEjh0/b3uOJ2NiQ0Lu4fDRXteut3PepC8gDndHOMe9dP1/v3NzjPmcl66JllBW7Lk7
	xX6FgTniZpGtUOE65ABNaZNcvNEa6UQoeWE9VW9mgbIkVyqbkOmo6E13kdzyiAbYWHw1vNrHdtXYM
	0u19/302QJiaFG5Jvapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWX-0000000EaMT-1aFh;
	Mon, 13 Oct 2025 21:56:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWV-0000000EaKO-30mB
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-330631e534eso5041047a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392567; x=1760997367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=GwMFICr5BtSohnBQU0bLIVaJyXIx0LUXcmIGA3HV/1WuHZZ9fG/jSj2VKRtFG+yLjb
         ulN71rg42DdFBeSG9nNrqoL9A2CTxC0B71+11PpD9vZZujNgRyYs7ZaJtse3TqCtc0IY
         YULMhY+Bv13RDscmHjuwgGhVpteh3DWQXaqcbGFLau58ChkvXfVDpoBI+/VcRLxhT5dF
         O8RFz4J3vLkGoX9hc2mbg/9luXqi5tIYp9p/KZyyWcubkaKNSF+Rco702t42rthRu1M6
         KieBnUZ5JzN2xqokPoEZyEUoWyGDaXKg8vTcDhCXHae1njj/E07R4fN5hk+NPtBJJNLA
         pX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392567; x=1760997367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=Z8TgE356njkTFYkUmpit7vpPMOMOa7xLp/lASN0JgkMXZPFxOpSEa/HvxahYNqXiif
         JqSAttDSkG/Q0XyQIj818ueglnf/4xa9G41wIqM/QskEOIQgQyMra7XAy25fbG/fb7aG
         lfiekx0SjA6HdyWqU7VL//w+k9HZg9lC+9IfPa8X4kEkjc4MreGDwccfy2mz7BQ7uaFu
         Eq4CarhMCpxiU8/9dSWkFOyAODSegMGb8GfEnHjEKtPbUG8QeaNbmeJqXpnXXUt4sgQ6
         pi8qEnFaEvowCDp8wPnHVZxbHq6IgUl+6ZxeBazqTrH43BrxbIeq3qnT5C/StCsC64RD
         wCog==
X-Forwarded-Encrypted: i=1; AJvYcCV+RvEusEjPPOerLa//KN8EMMWaojg1evM16VLmuWw8VhlFlxnjvvPn95alS0YZFMTi8eWV0RiQrc4NmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDH0JDVFA7MWmFB4J/NPlN2ZM7LCnDXAYl4+/TRyq8Xz/4bgK
	ivOCrPpVTULwgg+da46T7vCu14t66+ZafL7YqdFnWQWP7KDhJKnF22qGbwwyBystAuw=
X-Gm-Gg: ASbGncvCXi04WBvH5MoFS223349LsOoOgl1FJrC4NPWlahQK4DJMVvj3KGofXWJWGIE
	RGSc2aUwkLqUij+H5nJ32zcmdWdv0TtE3NT2OAwWOVavpegjT79H+4z2IEyoU2UjNq+mdv0eghK
	HA9X9/n1lz4RIvRCrTmhUXhIsPproa3yrYXBKEG+YmzDmCpD3doIAjiqObLfkCdCK+Z1+mC+tzX
	vYsKSoERj4OZcatFbQJWn82l3RURuLoFxaSyPlKcV8DDqbNL4xBqGCPK+x9OKXVMMypNbu6356D
	cQo7zLDWEqKp+xDB9oo2PzH5KNgTdH+Z7yOAoFYqCUgc4CzklIm1RfF3mBkjecBKlIngW/z3vrd
	mGEvhThuATnT+OgzyJ3H5jjuyNE6Ztk/mUrlnnIUykBjDsWbEVLA=
X-Google-Smtp-Source: AGHT+IEk8C0wXtpiaSerIOmMVJ34V19j3qCgt/dP0k/QOvSZF8SGdHByWOIwcunMLrrPAiMMdWB6bA==
X-Received: by 2002:a17:90b:1d85:b0:32b:623d:ee91 with SMTP id 98e67ed59e1d1-33b5138623dmr30507133a91.27.1760392566692;
        Mon, 13 Oct 2025 14:56:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:55:56 -0700
Subject: [PATCH v20 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-4-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145607_775987_7E36AE18 
X-CRM114-Status: GOOD (  10.26  )
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
