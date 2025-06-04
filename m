Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37087C61CE8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=xQ+uCGTNym6qOz
	GEjL3LCjZCMvepEq+1wNoZd6X1w9GfQnb1FfCVThAmL0IvMtJBYsDZZfyvvrqrz/6Vk20MVBpHbiA
	XXs7OBJDe958U6N+JA0HPpez1/s9d57q0tPqFD5lmv774XXRtflTTBPZoQ/8XzUlpZJQxipoA3ZNj
	GZeC2KXRrS0dqbXYAQaxxhDjqdQqAb4Msg0jo1QgAyx/lDYsDpmOYYw6MFOOyQRAK3GD+qGhLRtLa
	rMtBW+LTZvivuSQMg8XGi4jriHDaXA2i1vvNwXouSak38Rm6uFzq7yW3yTS/56bxc83Nw0F6CRYdb
	4scW0EqCSyrIiqrvoVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrj4-0000000DsHk-3y76;
	Wed, 04 Jun 2025 17:16:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrj0-0000000DsCm-0hNy
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-234f17910d8so661065ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057385; x=1749662185; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=bep4o61D1VsgSG/i0DyDSwo4z37DivWL7nuvFaCPHnrXmtpaEQrFjICvVBGpWLjzxS
         I6xBkfzcHLsWaqsMeITdxfv7dyYx99Ce14ZLihwq2s4CDnnTpVF2NnCy+YuUIwGGoD9N
         GgrMl+gyjhk9mkP8FO1cIzowIAn/UvFlFLgacOKFESjm4nvTeS77VDLGHYlem7e+YffS
         j4DG+eOxq473EGq7vzT9UM95YqtRSkDYHKAlyCMfdx5bpO3zFtn7LS2WDEA8GQrYp1ls
         6ZYRqE61j89pLHvJGn2p+hxbCOnS8KW4bslDnBxFb75707zB2KYzWTYKnltOFRdlrar6
         q2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057385; x=1749662185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=RfZjMyLDY+sODyKIapAcYJFqlzqpqYXps3yQqxggDfHKbdByoC+cwjGZ9nuHA44Ht+
         Na59H0Qczn/e95sfdQU2lJ+XlcOQDXfctfani+0d25HwBuP+zm8ghicNH3yMyNZR6tp4
         NmhuIe6OV6TZAGY+m9rt/Md61I2b9rL3ZVLDhSaDlKY61PcLf/TxCQ6EIihHUGE7XgXC
         qAgD3SmqYUgF8j9W+H2KcZmBZFlfw7CnGHCDhMXNmU9YZMwuZezCLcqVOuoXAOvZv/IC
         EEbqth2QfpebkGkVC1/a3ucHZQ2rfqCJhiTMWMqnr2MXCT+zZeav/MC8iAEOlwVgRXem
         IXZg==
X-Forwarded-Encrypted: i=1; AJvYcCXiFpPQCa4BfdPf4ESNKp3Gy0ds5zJnM42eAWmy+rfcNO/pqPUDdDYSI7Tsj8wTpNbKzmmUcpHMfv/Fzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Xwj2tdauP7vQEYlOR0YY05+PSeZSTWFcyuVYdlsSDgdxoimT
	h2+w8DZh6La5j4h4g1v7ZlePahU4b3jJezMtX6Pm9Q2A2K6Q67cz53YigezBEmTdB3E=
X-Gm-Gg: ASbGncvAfedc1gZ3pvF6mbmc0iaDN6sfi0ncH50Jo66Ermk/Y4dbe8CYO+VAMVjH4eu
	uIYeaIWtypK9a8CHDAr5lVgz155k/eUTt+zeDUIMdC4G2nc79ZkuOzDcZ+Z1Qov3zysScUYpw2H
	mZcyVurfSKpUrXDgulKm1qfT6b6fR0t+jZ4Lvy9WAf0b9roZGGOm2omicLNRrkyQZD4nXQlDdpc
	USqP5Z15c4iZTpoBA4XM+/5PUNfUbS0aJwXGqTLql4oEciSGgx4tF49VGTD18yNyqgCbe8MRwjo
	6/4izNFCeKguNvwKBzW5W9RLStO9y6mjpgb/49CPqaA6deZwAl2/PbgYUNxZNqTGukvtGIjt
X-Google-Smtp-Source: AGHT+IHOq7jdfe1QXesVQTTYh9pdMzuQq9fifPPejLKBYzrKsJ2+M42lgYFnihYLRnJ8kIRxucrJ3w==
X-Received: by 2002:a17:903:1b45:b0:234:d292:be84 with SMTP id d9443c01a7336-235e110dc8dmr60521145ad.10.1749057385225;
        Wed, 04 Jun 2025 10:16:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:28 -0700
Subject: [PATCH v17 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-4-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_101626_220974_57B8A042 
X-CRM114-Status: GOOD (  10.61  )
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
