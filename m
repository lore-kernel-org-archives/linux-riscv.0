Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0CEC3ABAD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=Y74ZmqhdI/jGJR
	eX4LZV7maH72mExbizyK0gaUbRYp4nW27cG6L7YPGo/vURn068PmIVg1tov0kATwyHp1OgkC4f1GX
	YC7ju7RRuI4H5G+dgpJ7+lpGrHFNdY0PSacNhJX594JCWpQ4tw68scKQ2/EpDVfD1LFe/OoYsQ+96
	QTYQ3IMvjUAiQNmmQAIkNVrNGyLSbgmeFHudp+nzXFIm3fkA3QhpTrLnaOplqakJEhuo4imaH4sE4
	tHDB53QpSony2OQK/uR/Ik0fnrN6bfn8O9HtPAdh798mEMthL+nf6gXOseBbPBpoTak5DdfefB/ny
	NC1ocP9AtbPbFYWwEFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqO-00000003EMF-1yEP;
	Fri, 02 May 2025 23:31:00 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqH-00000003EFv-3qo1
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:30:59 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af52a624283so2423031a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228653; x=1746833453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=rABAhDMjIV3dUiH8ldcljoNYkqSSk+rz/n/dkP5lRhaM1/FlOqaA+U9S4zlnGF/iE8
         lUu31dNUHODapTgZ8ynL1IpctkA8+winpDsebXDiKgEB3zNC0gj/VK7SjrSWnq8kzXN+
         8oLWfCP5zes4qgg5pdFvfrt72N+kuVIg5yPOBbkqxADwdNNGGIbHpMJLyOJeEmH4FNre
         ss0yauR2ly0YbXbVjwpqlnCQu4nvUJQi/BugTeo4t0+Pxg+nv4tVUe/gu+2IBVxgjcBb
         7bfO7/VrKTnll167eYw1AAPPpQKPHW3GuFEhvAVxBWd9v8MbtM7rwB028qPyfycQ86Lb
         4cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228653; x=1746833453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=N4yF8C6WlDB9j4YqKVEWGnL1n+ygS913YBMMyr2mwWlY9Jnv/PjR2LehBA7803K1hG
         4oOpIpmKDPXY+tWCevGRe0WmwdO2TSVOROgpvn43V8aHM7SY15eJUT2QtWxCA2PwtNHj
         BpPirMgVU1VbQKjULr+0pHqIWcGLZ06ShG5ERc5Ivky7va4i2gpjBEnPUMPfF+fHrFvi
         3VYbzbuv0+6CZF3a93rp2vDccL/jQzNngOzxkNZQr5qmHAFP3Q/KB0EDRaJf7mSYbler
         6MCP4wmXPkdcZ3ZYq7MiQP0XYuh8eG5Gw4Yk2qQmCd0J8J/EmvtTD3KRIDN04o6mog94
         V2rw==
X-Forwarded-Encrypted: i=1; AJvYcCUC1keRcIr09Ad0VuymP8KvYSmB/JikapJqYqbVQnJPcvgvc+Va4xqehsHaMJQnhNUIG9y/EchcAtz01w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2adNsfKoe/NaS4oT7BZUEz3qqNLonwh7CgQbr400UtHXLQSp
	DghO9cIRfZBxkrKEuvOvyzW5ajS3W5+lzuI2FbNE/ctLWVc2gOw7++pPcfpmhIc=
X-Gm-Gg: ASbGncs6i7lsumnWMtgWaT0/RZ8EnkO6TTJQwELeJjap8Tc7eSaWN7dEvJ5BL/V0lBu
	o6s6i2p7X5KLHupJ7CQapTDb3UnTlldI0+3B/zrBTNAohdUH3PWooNj2lJVofBoHSJ4w7MR6R49
	GuOZJd2P9aSbi4z/41jvMjSzB/NdwkiKUqOH+3PTBXzKX7p3s67HkmC1hV7SR4EcioXGeI7qod7
	uBBFUMbBud3g7SwtDaUSmUDtmylrO3QUMhSD7CH8aS0jCwCQ5RxwIVz8956QDqmkjFS6W72Bpiy
	y+i7rujVeKWzu9mEjpEj9LYQ/AHu09RBD3r7xEpRKVWaMUlwR+c=
X-Google-Smtp-Source: AGHT+IGs0pVpUevLo2D3rqK2og/pTuqkSwWUPXTs5QiAGT/XEwvhGyWKmfpP4hXzuCuawzC/3i61QQ==
X-Received: by 2002:a17:90b:5242:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-30a42e73ab8mr12121491a91.8.1746228652914;
        Fri, 02 May 2025 16:30:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:30:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:35 -0700
Subject: [PATCH v15 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-4-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250502_163053_953501_AB2704BC 
X-CRM114-Status: GOOD (  10.57  )
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
