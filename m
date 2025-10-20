Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31782CCD1AD
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muk+D6JapPMJQHwRgxzLt9h3D9kkqp6MoRRRIbUdbJQ=; b=LsuIH72s7FeMNJ
	DOIDVfAy5e0eZ12410GRZNlBUVAMHjEKh9RGro2UxoFqrpSQCexpO/CvY95td4iBrSsw40cz+KDlk
	7bQsfFbVgvBLn6CmtmKju3B1t1BCyKpb+jx08iHBcJTe1lIEHJnTVt5pr9EYbhOU8lynMDzhkQMNm
	c9kCLCBa4vBeuwS1mscyEFMEWaWduiiwZBEiOaBEMLrP0coIP/gGEVSBJHYUpM107C47lVqzsYJea
	JfODz1bzJmVnQWGvyzJGs5BTSaAv3S3v8sZKS/i0bbD3vSOdT6zVK4GX6EOKTUmDYO0rY+m4H9gG8
	VR0zJ8Fx1FvzE/eDTMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwP3-0000000Esjd-37u3;
	Mon, 20 Oct 2025 20:22:49 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwP1-0000000EshT-0hev
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:22:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33ba5fc3359so4831866a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991766; x=1761596566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNLdHsHLApoBXgPow7nD4EiYKLadWrqIeWAFyfWBQTM=;
        b=aUMJTIfOIZO2HCaVh0ScK9FUbP3ZZ9NwO2/B1zlMTNnXVHRwj6ufPgGzWlI9SrHJaz
         L/DbxrZYdqyVcnX37c+dpKrjkRBBqa4DzVZPQkhZqkCH5AJHitkJMtJQPlOOOjaes1j3
         aBZEFLTf159DTmEzJ08fSxrMeKuM6PEXR29lCMDOb8leJgvjT7E26GVZFbgtF8IvE+ks
         e77UctqHaygav2hOHls4PtuHt3HejE3fJ+AU7cSwu/JMTl0fD7WJA45ambekLDcHKxnP
         ZcxyLRAwKrxl8Dq8RQFVbFjjMTC0hPG5KuXs26P2dUUt1AryWx+LAz7kbXk4P4Smz21h
         9EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991766; x=1761596566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNLdHsHLApoBXgPow7nD4EiYKLadWrqIeWAFyfWBQTM=;
        b=TTbuGdS+dPvnfE8pVet01R4tmpCTb4jzxlYO8Ei0fegfUYB6lb7nx5eoRSDYXdJEW8
         tluOOBIptCRDKX33ILSrC5VcfcyFe9s/cLrY58+zD/eA6OMR0kt08yhrKHyxLHhqocKg
         xDIxrm/Awud5MPAEkpfPF9Ut6GAyyIHDCjurOiPSx/dHVeYdEuOokhFq6erE8b+/xAsu
         /TSulcyS4bLv9KWXRrD78AgBy1BIakqQnaL1VV615rex1+yhVlFOAuxG2ghDI/7+nMF0
         c+Sm8K1oTImUWImVHUSHK6NHABr67UyFUY3fZ+Rg1gbINdocvAyhIeTTcmYtXj/ZH5Bz
         9UgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5kU8rTAbQBrTn73GsbrQDsW9xYmHpfuFsYBMSWLiXXJyu90B3aO7p4zqi1jxVMH/k5GccTp3qGxRn1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsZ2bkJHSfCmhf+4URujm1F3o655HW7RlyN3uma25bgT9Lzrz4
	HXZjmqJtFyAfbDtnQZw/8iZ7kB7YpK53NlWuugy7QcsT57PYiNxQFAYjLOSOBoPhbKg=
X-Gm-Gg: ASbGnct2n0xVWUyiOs3vzfR9f0tl63xLfT4xG4HCPTH2kG4BgdHTpslen7yCwIi4q5/
	M4L5tcMP0ifYXd6cC4uUUUrUC1dyM1bKplmd4DDvkqsaheVyOUR5igUJh5whwuFHR6h0B3Jtlid
	xs/TkrY3lZkde1wYlM7E5KY5/bkO/+YyBY3yMWbMD9tC3VcSAxy9bQ+q/R0NXZ4cv6QnlkTNLJ2
	bxA4mww52QMFeC6DNJzXAkBbsCnFL3T2QXC95EE0qMphJhXUg3HPCFyxBprC4kottOcd+m95eV2
	tOx1yqass1uJXai6nsvNXIPt/R72wQnvqIIOKqrSG4oZsT9hFhpva/nJ1XbgxFMIrCMIXBZBivL
	WjA5OHw4TP8wCCoDKRXUlc47sY48E8idSTT1rDXaaC0bUEx1TgHqlh0enoNQYDzh+rZqIwRqYyt
	QSwvtMD72n9Xm+BY9PgPJd
X-Google-Smtp-Source: AGHT+IGEGkQ/GC8t0NOwkUogPjF7cO1kT60SXt/VRwKMgl2Ot2MJzGp+Dj2kvvgz4fiB3gPv8XWB0A==
X-Received: by 2002:a17:90b:2781:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-33bcf8f9844mr16500269a91.27.1760991766307;
        Mon, 20 Oct 2025 13:22:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:33 -0700
Subject: [PATCH v22 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-4-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_132247_239911_EBE50074 
X-CRM114-Status: GOOD (  10.38  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
