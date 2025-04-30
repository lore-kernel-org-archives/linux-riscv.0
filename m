Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F9BC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJEQ1rzeh6H3HknUa/I9dZVVovyAzVOB/Mv9gstyxvc=; b=Dhib+SrjOJSyxv
	YauPvyRJzwxtUvcq9/c9ditgiN28I3mEO5OF3nP0CcNn7JtoyHm4Ugn5Gr8LbLfW3JAxGuyP0yX7r
	SEjbUHdvMsoq9Kdsc68chcvINOK4Rh60rRrnUej4Lislj2GdighOGHKKR/jWG8dGaCU8xwpFNMv8y
	B4rZt9PMvYp2G5HUdNAGhwwkB4tDQX4TprJ0xhbR2WJRJp2OHV9x37zPV9ZsgZjCdO0TYKitTuEQx
	qTAH4nJw6Jy+QedUD3bDJ1sNF9GrlrBRGIshcDbJ8SSiIDrPp3Ob6TR2Y7SOZWdUXj5IiX/nhabDu
	5x1r56XcQdhN033eO3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8D-0000000BGHm-2wix;
	Wed, 30 Apr 2025 00:16:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8B-0000000BGEc-0GYp
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227a8cdd241so91215565ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972214; x=1746577014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=0gXN4Y+/4/k7SB/NdDSsc5HYT5Wix0fPKhOUwkI5PcmoAA8poRCo8f9CY5b7CW806K
         0JljzIagLQ5FGnz29ZDZc/4lQZoFjP+xjo+Tc4jE/4J3M2nSoVFhtIEMymwKygbCGEV5
         HuAuf2LhyTALXmzaK6UXqU6LhFMwtybcGohTCjShrJh9qNA3VVU23VlGNGuNaDYNyNMW
         QLIQZsyAXbIhvR41bwXGkdHuUz5znt9vOz2BbZYyqhxqkBucRA0rj0o4WjdjDSZ7Hcun
         irYHrHWyPVfkOJvxtTOm2vyn02TayNffujzK/6SWTzSnw2IdPGWEJZjBm8BVSiDrY5o2
         JN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972214; x=1746577014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=RWekyrAoQ4NCNwcSUpz7G4SeLA3ZUvdhx20DLG+FNNhFp90OMtT/eSPWBkQkAeIa3e
         70OlIofc9b+rrVtBlGVqNjNKViqbVWz+2bey2VWSFxu3nWI6NCFMuhq/nprLFLrfGt9E
         SmQ1lvGwGjaAw1tTRomQhQJmrYI7a8gNoJwgW3RN/gQ9Su7wofV0llz5RG2311CIZR6V
         /cIB8SHIaxRDhnwrhNw+yeNpsRX2y8RaHHm030XMupK6mdhIecnUKVa2RJVVWycFjFGj
         0A/+efRQ6H0v1BdG/VqLC6fSn9WOkCDtM8YBYNc49hb7Smf+v0ZDH5F3fZjPkOStwYal
         gg8g==
X-Forwarded-Encrypted: i=1; AJvYcCWMQHPE/n+wHCxTqFW1j4dDkxdgIVQuJA/omL31GncwLvVyrh0s5U8h2998acmpK5Q1pcol5dRE2VxIvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YywFTYYKJXLGhLjJizssprQhwCO3p2QcLO47ufjrj3gyHXZVmXS
	sJyS3fPA9UmWNbLDPnnLrxjnE+yQnFyYOBXCyJmJZdD0b26pL/SKynKMIBz9wrc=
X-Gm-Gg: ASbGnct59M2N4eodTG1KpI9J7RqFOGrsdaTNMXcpOX42Tg3BbeRzvSk4QAzlwYIgVdO
	eXT4f1Ibr1FwRBngplD0Z8n0uCuE1geIjObXVYs79mnqp33e+1zgMOrP8Jxa5k+BgSNr8N6DBN6
	5hPykJibplP5z4MLaizrj2PlvqPKInnN46lTKGDRrlXlPD8n4ROfE/x3tifNJIdTQluBi3fErJy
	73ryA5zw+W2M4iCOta7+aYtdkgtuLJ4ZaRiFwGFobUx0MocKmCQYrCnCmi8lakXG/VCURPdDvpp
	7wQ7s/E4FGtTJWSMM5ICTEq+xWMf9qFWVg6ZwDJaVqjx2NrX3fw=
X-Google-Smtp-Source: AGHT+IFJTmgyX5+R2cHG56gTAhOoSWDR7FtiznejYy+qmKOCH5eDKH+EG+01nS/OcUb7Pgf8hhzsSQ==
X-Received: by 2002:a17:902:fc47:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-22df35a39b4mr20572645ad.33.1745972214477;
        Tue, 29 Apr 2025 17:16:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:26 -0700
Subject: [PATCH v14 09/27] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-9-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171655_118801_E5FF8F5D 
X-CRM114-Status: GOOD (  15.63  )
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
