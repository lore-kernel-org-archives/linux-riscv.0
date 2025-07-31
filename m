Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8BBC87FD3
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=terFj+Xpam5xTh
	HetbI9vh2xJqaiGndk8mb8/6q1nxboQw2ONtwhgfwMx9SKg3otshbQ+4UykLv8v9Di3GtiTs1cRb0
	xcvVVof/i4pgrch9tCAtSBTEkjgPZwfJvYbKBQRe1B0Qn6i0xLRBAave+hhcVPQa2yiyIYIJ0kMaq
	2n2lwpPnQufG2gvdYiEtM7O9KISJsaAU3gVNOcMV4tE/Vnqh6eP4maZ4T7dOdinA4RJNx9mRXaPqT
	3w36qzgoYU33bKYaA0ck6MRpwVfjtuAigwW6fCizZMPQWOIyEywYC6JJfHvlnEik6REV+SGA2HpLh
	CbedCWaL6p5CSwgROEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZh-00000004bru-0cFJ;
	Thu, 31 Jul 2025 23:20:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYc-00000004b4G-42EG
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:32 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-31f3b54da19so1083811a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003970; x=1754608770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=QoGifAoY3SsrTbtf/ZAU+1fKW9oF1iJQNZJmXAlBfp308Q2iWJI6dv/DRy6Yob8BOT
         XykJYwulNMw7x7EATJ5dJPvITuhkPAXUE0TI46KdbnftcRQQHi9ODbV/N30tQWL7TZYG
         Ie8Sz77vcmvRfdmsUzNhiGYbJ8MICdLilPDrVjVoR2J+3QAFb6B/V8WkHPd2CwdFKDk7
         YZI86VWPcCTayOfuStrHmDS1mOtFlmC6MrE2A9pEOhf6jKOxPeKTK0OY9bcJVF+nTPEz
         Db07M+YgysYiC7PQLOzFXeagXQAUMWWC8yOuugd/sYCHkSMQqwDTTUVTyfqn7kQR/oKe
         vM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003970; x=1754608770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=txzBnpLQMt+61REfevbNjFr0alumsUvvzqfTUusMDr735LVettKccWcqCCn0EU9+Uc
         FtjeIzG4vEGqXSCsrLekXCKzQJZBtDc6gcpV+5pJAIp8KZ6a7Tahxdul1aDMK9H+jeZ6
         lYw0V4U2tkDHbYU+URmU0ooJjgF0mW5PNN2mWMml/EfdiVeokZ1JNswTvOeDwAaBOyKx
         2s/T/K7Mdx6sejBMm0IbI4tYdmwcp+rT3muAPO+OHeg6dcZMyseza0x4OqcB4W2+jVP2
         s51B0mxsI1V/E7eZzB/RjxI8EVEJhKlCJvOr8TA8v8UR21JL5PN1Hy2/7qFcPFcgoZrG
         /A0w==
X-Forwarded-Encrypted: i=1; AJvYcCVKaWPWHwEicjaHMIdWykn/B5LU5ZBjvJUc8WZqsuf77DOhAiG+V+vLPvQTPhoU0oPtCqE7gGkxLdn2BQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx64VhlWo4XN2lwOjNQvKXcsF0/Wqx0d0Ue/Sle80phVZgPDqza
	Wr1nPb036lJV71HYJj4wiCT/x82NjEdIv7KQgBd59keMUwdq7v8PIprHwuMdZeVJ1IY=
X-Gm-Gg: ASbGncuo7vD6iVenuggbjXMY+MmhqRyR3SV6bR05JULotKNtxhAaB5+XW9M0TLbeYmj
	M44l3y6dubqPSpwafyvjYfmtXxfinYddYDDiF0UNQhvUIRHPAPblyXKLOuc3vcNr+D0IXDFYGvI
	TJzZfeO2mA1RzBWiWuyiOOZX7QdUsWgUNHKb1rysVku3Num5ZCU2LeREnM8pAFMtDlYPRwYZt2R
	2nKXUj3anaNN/PFmVpqURKZowOBU08Y6iJdBXzv/iz1GGuspwguNEj4u3XOx6zwK+HLUuAmjMUu
	0PyrgUSxdPaz5FGUEiwJcdFJOJjGBhakr2RVyT/9BwBAjhQhrFaQjaoi9sajvKbGURQbAu+C+UY
	4MLr/kaW2IhERo32n43sjLK4mxeLi5b28
X-Google-Smtp-Source: AGHT+IEW/IYpi8/2d1JJvWg/cAIN1Y+XWLtRcPc5BAni0gcHSZT0OGnkDz3++3xD4dhcW2YSKWJWHA==
X-Received: by 2002:a17:90a:d607:b0:31c:c434:dec8 with SMTP id 98e67ed59e1d1-31f5de4b8eamr12568167a91.20.1754003970168;
        Thu, 31 Jul 2025 16:19:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:14 -0700
Subject: [PATCH v19 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-4-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_161931_026860_83F1F88E 
X-CRM114-Status: GOOD (  10.68  )
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
