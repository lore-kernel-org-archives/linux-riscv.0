Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C7D339B7
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GblsGuxR+dj4PQktRHHS3Fhgk493xBztTQujWe2+Gdw=; b=hyhkX5szCSA7f+
	dDyftd5dobPMcuHHb8JUPo1LOTICCE11RP2xz1+k5tLmagZkPUUk2RtiG2YnYEMBBtU4+xXrP3F/8
	maW3l0OSTrukz298Wspencv2cQVN5eV3eQWYa1RVp6/018L5Omr38WoHsAcq0J1c7uFXoo9UOWy93
	iyhksQw4F678adqwM9cYWAXTdQuFMos6p7zO+P8A/+yrLgK5aK6MtACsLdCoge4n3+A24kK2ycQYK
	M3RjtWXOjarUQ7Qfpbw3FMxIPbAS2mDlq1BVCIFPdi6xJJpV994dToh7RLQMZFlTx1vkiRPlh2+UI
	vTT/IAeae2Vp64VpgGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaft-00000009p5x-1AcO;
	Fri, 05 Dec 2025 18:37:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRafr-00000009p4x-1mxm
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:37:00 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-bddba676613so1617621a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959819; x=1765564619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=E4Xyqn0sf5Xg80UnXTpbA1oQzyNhxOROhKDS4pn6gu/AXnpeQ4oPNJBniOpinoDoLU
         i017E6y6K6VO2ZLH5NeB6Ox7LTNsMrmE15p9O8IrGRDnbPcXHNeEsTJxp+YZKMtPZ5JX
         IqiGwJtuVLs6KwiAsNShMqvw7GPwi8TrvvPdRVhVHi/w7vgZg6m5BCamXMv4uF9KS9V+
         69tNusLeWR+LCqh/wsvkTIKIwY3rQlgK3oHtWsZWTfcu+IXm9YMNGQT7ldT6gRpfGsq+
         ng2BH0piJoojBYMQX3glTzMCFdi0Y8hVTbWJoba4NiYLw+ixPcEoAT6av0G7/q9jpEez
         FsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959819; x=1765564619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=jiuH2FXSPH52I4O1PpzG9nHMfVjayXfKyEVNxYhAVhl+lYqW5RNfpTV0hYtOMX2+d8
         pUxR1bx4eVhei61H6SdT9tFf8/mcTmiZIHCW0+L4XVzTbdgZFcNlMerFqw7j8Eh3Wn82
         DoNuAjlJ+8o+G0zCQ3P9B3lxyQhrZ4VMO8WkZBR/O7SkmQyYBJe+39Lnm5aMmmgyfuyC
         Uaf7oUs64ZpYi4dUz03nAuDUt8PbvkfhSlMmKSBGoUfLyf+AMhY7RHx5Os85NnrKcY7Q
         Kc0f6y5K6DS1kQFQrys8IK4zmZ6MuVxgVaZTH0Pc3EuXdwgjO4CXAZcsWaVAUefUdcCd
         1Bew==
X-Forwarded-Encrypted: i=1; AJvYcCXFRz+VIF4KuJPGMuOPRr4cgFAqWQSk5kFD+BVnBC919wX1WY30/WRsPv7fbnbdOL84UMtBBGLcjQjfdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YweI+s0CdlsXu4xqn8ORkvyqMFi2VMlN2nr3NXkD9rVT4F3ODqZ
	AG5mSRAQLwmjMmBgNzj9t0KOBT3n8IMF7ZTKMN3jbtDLSG92DjGkErxAlR61vZXv6TQ=
X-Gm-Gg: ASbGncu2IuHIFQ5eBNvUv1wHHWrxrVAXQ7r0Jupm7Pn4AxUd+TXjXjHx8f/9nL/UOd4
	9Joe372oYoJfbOndAtSIYv2XcJv2nDhQqv4B47MqTJhZpVgEj/On5zZkMIBtble2HN7RCpPfQRt
	nayZw1uTdDFLUfA4AC7/xfZwflOsWQ3VfQaBUQRG2x2jGnj6IajX787syu6jDTNgbHGNum5/yKr
	MwTbNHPQSEyxS9IQLhfV3l8TIK0OKpjV2tBZCCAj73F2vwHqZ0sM2f+eZ827fYKZ/Am+hj9dBIr
	3dFtzek/bLDkKzHPblU8+AMcZxX/7gT+HUId94DKDNemGKTbSiZI+9lKUEvQPH8BkGJIq6cxz00
	kANtmdszXj0mhWJmtPTj8gxxjD9x+6jiKh9BH21Hm2qhHhD6nIZCtXX/hplaydZRAYclvleDpEG
	tcxwSqvtgQANH51PFp+PVo
X-Google-Smtp-Source: AGHT+IEkzbnT/WgOlempvP3hpilfiz+Q71aHJSWUM26fnmV95b/U/OPvqEShn/bm1V+eS1bH7ZJBNQ==
X-Received: by 2002:a05:7301:7389:b0:2a4:6488:7a91 with SMTP id 5a478bee46e88-2abc721e3aemr63588eec.37.1764959818484;
        Fri, 05 Dec 2025 10:36:58 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:36:57 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:50 -0800
Subject: [PATCH v25 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251205-v5_user_cfi_series-v25-4-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=2422;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=n7bR1NnVFI/AqRJ5DRrpGqIuuKL5t/EAGbECncFah4k=;
 b=31A6j7PC6Y5du6FtyG1Tip5TQTReoqkkZmO7mrZz/KN+VapztQ/ClG5jXhF8oJEHAJfpgvSh7
 Wdgdq2HWZ/wBlxT7xVvM72WWT8CT9lmclkSWtwU4fMwFZ3NA1iNoLlQ
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103659_469319_DF38A690 
X-CRM114-Status: GOOD (  10.01  )
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

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
