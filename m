Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115F4D2A523
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GblsGuxR+dj4PQktRHHS3Fhgk493xBztTQujWe2+Gdw=; b=gEg1Fx2PwwlFxR
	YzYhSjmg0FM8Qs0Ce6ZwadXXKM4aAkWNbQAFgh2qMw8OmYFGJ0xy91nCk3VH/8jMXviJJ6JuReuj6
	/rkNO6wHPEAO+eWHmASPCBXQIinwSWhjJLcO7QeNmTPjdEIXKRjJ29a6i5sczQdDRLINK7PgznMpm
	RhB0xAiGUOlnYzvNDQBUoAB+OarHUP1hAmQ8OrqDia1pLPsyy2iQy7FtS62DhNSg9qdyteydn8rqY
	gXP8hFgYWLLv/pfxk8hKk8LW1zHGiXmaVrY67IBVCIEa7X5ELFMggekfxGWa9H2J782kvNTASQWO+
	Vudxk6V61/oKUFBS/nRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYg-00000008YBb-1stG;
	Thu, 04 Dec 2025 20:04:10 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYd-00000008Y9M-31zy
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso1157211a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878647; x=1765483447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=eZSJ2nGlZb8bX5kFahr7HqhADLr6EtDd5ETgtstHyGjb1MnhFvIYcTTOjEPh71mSvW
         VnzaEN8UjuGvChqW1/qInWoFOcZTo+kppPdmF6wljckWYrWGWkuUQpV6L5NhX8A43Ife
         3kGqpVNPJEpJu1CSIhQLjeXp0TPmFHL8IEae4vtMnxKaQTWBQcwrUtnNZoks5Rtz3Dr1
         Bd0MRYOr0AcrK57xIatdRk0u4SwqNGoys9yRqq2/YU2g6JQBZFtw7ognnZG62paaEbbR
         xFA9OXFiIHtQ3sfue21YYgcFme/gjYXnRsSwLMW7OMTJanOJIt+gPkVqUNzAdQuF/gqx
         UGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878647; x=1765483447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=DFcrc6ErKL79Muv98yfbZu/Rp0HIzmi4caYQjLFIjh2PKVNPPfXDIN7+4g2BeqNVi0
         ONMInGCBDgBSY+anRLgchE61ZKEu9SiEtqDTa4LfzRxAfR5IvNqO9/QbUooxU8ImtEBP
         yxGwsYyJViYMRGKXXbeIn3XOhVneEZcJ07bcjLnSX4GAf3ZAwcbV7x78Ao5FrH4Z8V9G
         q3wUHltoOGGMjgEPanQ7kFjodgLKPWq2yCeJBTFz+T57yZNT10iyxVzi0zKVU+y1BkkO
         oJjcj8k40GaZur+R2Mwqwwd0hHc8tT36Cv7P6kNif8MgAF6oBklFOho8ro3YvFAKSJLy
         sysQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/CATjzPH0HS7XWSQ1zZ2GBEQhBTFNyNc/wp1EH4VIK7Q3YOlsAo7TKZ3PfQM8GrDOHhdOuQc3/QpabQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2sycgEKRANhm2SdrJA45suckNcuA6bEnhUUiqII7+kAvx42//
	6t2w/+wyRXddvY1pt7IbhVUcKo851lcYWemIh7UNeGs9tn7mqwkETXxGkYHlLfmB1Q4=
X-Gm-Gg: ASbGncs24Vyy/gz13XNoY1OFP4tnuPHCJzPECyea8WyfHiRIDfF4dXOVZfemfSJAtCL
	HjXZgwlBSJMDQptsLdv7y3Dwjwqk8+4yiwPKB0CpqkAkbiRTfD+vGkFMl/INiEBbxyCD9Oimwds
	zzhzen1r7idTAoidaM59qiEH3wZQVyamBGblbcBSu7+bpaYEU/JNYW5EmZpUuVwlfpPV4LYsLgS
	XYXIRKa29k2+ArNge4IYOVo33xfo7SPrVEhauT9dgnq/8yFPz901Txrgxrm4tbYcBtOymmoMW1F
	0fFqMLBzt2TLPiEszpLVvzo8PMAudJexMPJOy3ChtL3QrAEvjNfo3H+N6oDbU4Ld+HLIt+EymtS
	M25DgC6Gq+XYTArjAXHdVmInG7fiSlWhZr7AkImdnqNFZ+AzcUxphtxnGfDJMrKeM4MaFcFvPK4
	noWIkltRdTBjS9oi23KH6Z
X-Google-Smtp-Source: AGHT+IFWuqKYnQSvLkeJOo70BOomylUNzBut9o8ts33EDbsDYkfEsTuZ3Pa7zWK5UOQJ525hf7WoDw==
X-Received: by 2002:a05:7301:4283:b0:2a4:3594:d54a with SMTP id 5a478bee46e88-2ab92e3a972mr4143173eec.23.1764878646675;
        Thu, 04 Dec 2025 12:04:06 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:06 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:53 -0800
Subject: [PATCH v24 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-4-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=2422;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=n7bR1NnVFI/AqRJ5DRrpGqIuuKL5t/EAGbECncFah4k=;
 b=4TAIrpmfuAfPnl8tn/VIyCTK2V1JPV1OlmYCd1ZA/LG2RWhQpYMma8sPJT70bjwwoSMUdt5tn
 ECJHYi4ghjZBSfdrpryBl6eil4hs/VFJwegf9Jsy36h+Tc2IQMN9sui
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120407_776012_075F4698 
X-CRM114-Status: GOOD (  10.36  )
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
