Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE1C5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJEQ1rzeh6H3HknUa/I9dZVVovyAzVOB/Mv9gstyxvc=; b=J/cTi8Y43qu6D2
	W7KBWi7y6K3rFBf45ECr0ri786k8k+mW2CP+3RYJHCevvUiw7QYS82EBr8iXwvzm6dKr+/T1Y1bWK
	6GlAHLZukQklidYCrLLy3zJzLPaquUF1RXigFf+m4fJoU2O15OpJv4UwExnx/z+K2CwPiUiQiDN+e
	WCoo+MLm1DMZ5rshO8KnfsmjAyekQ+hceTsUX7OY4z+moT9ySiiFcYLkJVKFeT9FAYnREFtN81Kij
	B4m8UKh1ec5WmY+Td23hRDi8HW3aGbslxxRAYW2naPBuV57ckL+4fJPrSTNOL9tvTkxwAN5luKAPT
	5Hch++hu9NtCQvcfmlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjI-0000000Dsa7-3XAO;
	Wed, 04 Jun 2025 17:16:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjG-0000000DsVT-0w1h
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-312116d75a6so70579a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057401; x=1749662201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=kSWY5ZVsIp1BJx7HsLe28BwnXTuigNM4rK5zzwzSVfXLwu7lgeWwuZ3HK79X2mZ1s8
         8CHlRCD6zC1zMOSHVcxV7GAYM8six4iG5drwUXCotCVB8d8XfeLmhy2auFitrUXUgU3x
         z3xccBdL5ON0LpXILfiThdB9gTT0uQFI3x1p4xv/KorhHy0V9j9bjwn7sFbodvZ2YX+L
         E9V9mJOaIX0mSfu/XUdRof7S5x/tCboBCNGpUqTKxrR8C9tGL521M32LEn5HG1+EEtCp
         +uglPQznXtyuk9SYmwMN3pe7lZ0hOvLMsrwiLY+eGmmR0jHvluNzdV/BJdSD+Up9wJLn
         nkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057401; x=1749662201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=lemwu+zUO1JQdnH6rKoB1EIp6O80L4qizMfNavihgFmT7Ed7ny7aHOILx2tJetZODN
         pgRKgQ6LhQFAR0Eo6hSm1ETLjkQNbdjGrnsidO9rS85l419t02btnROp+cGa0O3vgvOQ
         bWYNdCVnH1M+d85NE5U5RMTU7788tE8OcLfzYaV1sTT6FsRJFQTyaSz1QEKo16Wzzljv
         +ZT/hp3Ds+ipMeeMqKx/EIO++fwTOjmF/c+yawIWCUeSOjwz1/svBToVb4FoSqr+zZWF
         hW0DGJO1VXjrwONkfjOTPyIgsYsvP0hEcdCsBWWPEU+ZRuD/wQetQoj5o8QzC52YaQk/
         YXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoaN8NtHwksZuRcHS1T0xP9V7UPvi/fBFZBvajawNaW/YYD8SRYOP1ySPcB08+ToMdqbfS5ruqRq6I/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0YI0eUGNMaIbJXx8VQ/EK6e1hO8HoazBjA0Ct2g+Di+bYwU5I
	rgYgN22TSNxe/hLXfb8vng9cyEC4Y7lKMowxNTrskORynp88W4GWKTTiYsPEuThJ0i0=
X-Gm-Gg: ASbGncuMrgHScO1WmPt5BUH2gLw02FtwG8FD46c1FBt86I1Zfuc/VI84eUE+0Vn85Mc
	OvyxSTDAFyuIjmufpHg6QPOpMS1j+9Tt7cT/78tmbec9c7cAHZg1CmHNF5xu1M5RW4pDCssebrT
	RSui+e6LtElGQ8JWOSfS7uQwA7skcqJF7mWWKE5zDQlFj3K3eg7xM7TqXBIIlsCNgLv5VccfzAE
	jBFAvXlBltI15FYv7Mt0Z3XmEVKlkVrvrg34XWvxgKeJ+/g+mQB5vq0vp4wjZSnVKotd2MrgmJ6
	RAH8TpkpiU887AZRaJEFqZzSvAq4fjASxpcwLcww0cJ2iSFkYgzy5bqzg4eQU+rNiwYeuDFB
X-Google-Smtp-Source: AGHT+IF6+7HWMrKywJhrl4jitMY9SAQNbrLC1TZh5PiZA/JMuNouzuXYRzL70WULkmw+C8CMgKh2Qg==
X-Received: by 2002:a17:90b:4a04:b0:312:f263:954a with SMTP id 98e67ed59e1d1-31310fc5071mr4462982a91.5.1749057401215;
        Wed, 04 Jun 2025 10:16:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:33 -0700
Subject: [PATCH v17 09/27] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-9-4565c2cf869f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_101642_272053_854E6171 
X-CRM114-Status: GOOD (  15.43  )
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 60d4821627d2..4e3431ccf634 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -423,7 +423,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -624,7 +624,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
