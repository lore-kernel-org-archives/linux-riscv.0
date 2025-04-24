Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260F1C369D8
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2pO34OHV6A9BNYRHtXud/bjYz96v9SrqQ/nheVmZ+g=; b=k5Mndttwhdr+qm
	r7JUO1ioX1ROcDw/5FMCTAHXE9YPIPOhr9mMqYyENEu0mNHFnDO9xpUi7MZUym53uvRc5NTUxpFnK
	wJtXNFMHVsgXm2Gc9ChBVd8ca1R+WMh8snE+s6iyLTmbj7rdo+F6Y8Ibp93+sfohQIWn0MQWpBQGd
	x5M9yP8gXiDa8IsMB2lN82XxJP4LoIgVfe4cx9MjwCqWPC91yuCfjxDbkSa41Hbd/XiWQCZ8V6QuC
	rVJHozDchZOuOjzKwlubIkOQ2JqaByt4ZQ0+6VokQ3wzaDsSKup8W9n9Vw8F/6V/NbcCHa25Od1UV
	3opdyJMa5S+jpQiog6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qvB-0000000D8zx-08Q3;
	Thu, 24 Apr 2025 07:22:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qst-0000000D7eZ-0JHc
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2295d78b45cso10159555ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479234; x=1746084034; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=tk2KGMVJXS/OLEcNsUmDvgdydfxH6YmwqCKF+MfjlMQCZbXsezn5rPgDAop3/RbF7N
         EHyKrB16dLL+h/bFTGuA/KAAr7PDQB0wC+l8gm/MLPRxjzvbiYdRsZbzIsqgf3O3h8MU
         M2XWR7mHePYyurnKk9fT08wPzfMfkdZfL7omU/PuxY27umzksPAkf/46O33UJ955llM4
         XWmhj8seYSyLCXVgdLRwkxEjedTp5WH2HVnj6aTvRLO7SNHPPQEr3uV6takmhOQPalov
         nkkv+G+5r+x5p6LXH0TPLtchIgXuLJU5GVfwOcjNahPN9f4q+sWr6YWf+ygEtbJZrPks
         k81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479234; x=1746084034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=Hk/zu8WZQkniimJt3Fji547jxuGBMrqqR6JkwePX/okid7uzmU+sM5v3oUTbNgWVRh
         AS1ZP2pqFvmMVFU+6DR4yPRjClvjCFWZdcg4f53VK40h+DwHf7C6upJOIba14fA5wLA0
         dkMSj4tyUQo3NZY4dLvDS1EjwHN4EXqu4cSWHgKY1iVURM0JXBXmCHFi9jA4w5IPsw4n
         NNc9wUZ8pidfYtjRtTVMVeDmdo0h3sU54+w5Y4YVGZpDgc11Gk3A9zHgCRefhlqaKerG
         DUEn1mOusYpQJsuizIrzxEpBsU6zcgS3uh+sEzdS1uXIdle+Bp2zABypQHuX1MmFQqcO
         ol+A==
X-Forwarded-Encrypted: i=1; AJvYcCWysbo7dS1yMJtAwzDfry31FyZd1XqjHjeWQ4u80o3OXwSm5kVUpCsYl79kaAvqot7hhgLF5ABZyuCGFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBoB2OIl+s4f0cUtAp9+OrHlG/phCdy6m93SdXr+RyqhHxly6
	oMJX6G/hDNxwZApdU7TvPIDHSkU/gjbGPhNaRsxRglRB2Xf1zSeGSendgfq47wo=
X-Gm-Gg: ASbGncueK0Q9A1gvU6x8D3QeIl0VXgNWFbCtdkJEODHu7n96U6OFWMSmZZr3Eg3mVtP
	W6OtCoaQur2XvLWXLi6PbamSwZQt5fj01TKzDx/1130DBDRMhkyqrLCeI06SC8awzht8n436S4o
	UDU7V5D+kQyjWs8IKjVdZNQt+jOZ+iJ25cjEVAvM2Q91FZL2Maey9TzZzO1B1/2GG0nehdKxhrL
	Yw6AQzDfVSZ4NrPoNJ+MZUlzEgBaXhI5qIEJyISWb3KZ8lWtXoUos4ixJPYm4W6ar44Mvu6fHI0
	ftk5rtwJgcrAbnXWsnXI9wuzQORE9G/VF6aJR8LbYHYTDY59YuA=
X-Google-Smtp-Source: AGHT+IG7mvKQVsAWhJ67siR5HyXzPu+FGKMk0BZF9KiTPtDYxOR22o33eCLSKG+9Sr0e0wwJKYQf8g==
X-Received: by 2002:a17:903:2d0:b0:224:283f:a9ef with SMTP id d9443c01a7336-22db3ba02e2mr22559525ad.6.1745479234501;
        Thu, 24 Apr 2025 00:20:34 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:19 -0700
Subject: [PATCH v13 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-4-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002035_221367_534475DA 
X-CRM114-Status: GOOD (  10.13  )
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
