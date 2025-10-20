Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E0DCCD1B0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBvFNzqZI8BZtXpYTR5IwLtx1hWiuZ5OIJUr+mjHZww=; b=Pn38fxE4uE0h6p
	5nsF+1Qb8cy+60Xym8cQbQpEsZvam/6dSjZmjPPO1l975NKWl+DRlWnAXhpWC9+o4+ptINht1mpq2
	ps6MZIOEPNL6e0fydOzfW6tJhAo1vFAg2cTUqMp3LW2If719w4YinLC5mhKtkaxsr/6Z7XiNzSbQ5
	4kVDxSMMonlwIZvv55K3amQLey8m/qwU16aZlMiQ9fK/pFYZMX08XLdFHUfBWMjseFJXE2onS76V4
	kgQH9240rEf5bdf7u2ubqHTBge9+bWVqP57ItdJ7keO3vNrFRxHkjm7VQD5+mSSfRL7VpGziNWVyo
	31+4xjNrn1s/zfDzbzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt5-0000000ExdV-35R7;
	Mon, 20 Oct 2025 20:53:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt3-0000000Exbt-2O4u
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=; b=FCwnmicFRgDzJIbO+rHFOCJPtW
	yZTChS6QrrVppXB79HTGPperyWv+7wl3NyltWhpTCSDeT+nlOEgdEC3jz7WJtw6EWYtXKVIG8DlLs
	xLSlH+i+T033Hjy7ay/YkF/MggCOi+9Ao93jBv+Yw+955DsJVvDIOqqVViZWGE67z6ATDZtECSZqz
	hNnLc/Lxi/e6NR0VXsbHUvhL4l76vJdbys/XtEX/WUi8M0HKQzHYGdFzxSEoQz6BwJbQVF7si4dPx
	J2wjzL+m8v6JqXU7JIvxBGCBMdD0mzUCSPjgAOx0SG+g8Wfh95v0RHA49ZrHzwtKdgGqlgM/eLpis
	QvxcWfpg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwsx-00000001eFr-42qi
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77f67ba775aso6266533b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993623; x=1761598423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=TPpg2pSZIcBzj8TBvg/qvt1QUn5LsK2ldO7qULsqqIDP+HEokNLKgoIISi3G3HTt+A
         diqYbffZoPZKtQkff9jCyJ8wegy6IXw0ufPhhnnkkussh6AxN5xnYxsszFBHqmz6LGlz
         Xb9ppwfTf65cLqZHe6o3tNLy7hYogKgNkPBc7IFcztTDGCTgkKxPTvJpgGuvJsplUd7X
         QlouZY9mxIwE+i99FtuV+9XRkgrVrYdxua0lgIDGwm9FJZ2UnAREMwq/bHVGIEklez1F
         QX6GNbUCS7XC6gjqddD5SsSG8smlX4tHNUiRH7OK6HpEYM3AAGq2/+U8SRXVm8k7Yw8l
         nH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993623; x=1761598423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=OZiiL2CP8r0KMAZJvCFYqK5iYivZJnFAGTPHJlLvM76wFS/BycA6dWAMf1UZ7UgO4i
         H3Bqxdp3gyTKFCrzgl9RJz225RvjFkC7iojn6tDsYLMV4ifqzbEmSyGpUr8/nZfDZ2dE
         hEZz235tmNz0MFxpUYBn2eUZRFUoSPRlK3+BqiYrM8H7S3E0isievygSfcCkR42E9hl1
         KZrF60OzvUqnInQSxvImxukORQRkiJtIH0KNHxWG5bmZMFd/DB9P+4fYYilmrXDKDE36
         eQP3JB7fbly1wXLDMXwjmh/sztlAyimY/jn37vDWGr9Vap2TAMQXa3rjT2wTBg3InYcF
         /v1A==
X-Forwarded-Encrypted: i=1; AJvYcCX+LXbblbDaQHasoi44Pr1wA7FKzmdr4Z9MvN/cnRi74aNHZxxORwUXTMN1kWx/jfTJMM8tx1HhXvC4bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxhQ4i1y3YNmb3zGMbbLbzqaDVPnvqy5DqfzcoQtdXN4QVsBo6
	jN74sZ8Tq8B9WLXNLvKHrkevy1esh9q0y7KRvMBkqR7H9DurJAwGkjtldbZKDOgVpZI=
X-Gm-Gg: ASbGncv0UNOfo6fEBV7bxbWivWe0EEO4xqnDRJU2/fluDwE9Byb6Wdu75Vk4cu3D+9b
	6CmcdPeoMLdbhYX7HPebRhiFINiZTpPPxtmdECjz2uKYfcLq4r9t4fHqbfOsyFdHuQv/eKuHaxN
	twa6xK7zPG8SC0juZfe1LjL8jDkzqKXMvS9PGr+exmimCvC+BPQdSzPA/Pi2FCjekqi9YEc+9DK
	6l7T5HP1+Vs1xWSzRoc9FirGNSWvKRUQFwc54bf759ruXOJKkqy/nOIDiwv8OL7E9LKY09h0VV4
	f8DMkqxul4iMdn/LbSIBMALnJWYExX0/+ZUU43+72Q/40oZs/SLql8y4rAqrflDmB3DQ5ZzEo4X
	0SOCXevTxMAz5aEsSQFbN9rKHJvKdHLCRNvOscxNBx9TeXtbXy5XxTJQGo5DlqtCzkL1FkAm+DY
	sAwG0L1b24MfiETm6iwmQ2
X-Google-Smtp-Source: AGHT+IH9TW913zfh4PW7FMgstLMuYEwVEH5t9QrKLz79ZwULZBMVRXbb7o1uPrVG0bYl8xQxOppecw==
X-Received: by 2002:a05:6a00:99a:b0:783:6042:114a with SMTP id d2e1a72fcca58-7a220b289bamr16527524b3a.25.1760993622997;
        Mon, 20 Oct 2025 13:53:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:33 -0700
Subject: [PATCH v22 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-4-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_215345_273469_B291D3FA 
X-CRM114-Status: GOOD (  10.07  )
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
