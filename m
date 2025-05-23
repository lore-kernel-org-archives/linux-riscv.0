Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885BBC54F47
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJEQ1rzeh6H3HknUa/I9dZVVovyAzVOB/Mv9gstyxvc=; b=vMeo7NhLL4fuyU
	Ky9S4lF37a6ofOAYf1+PeftukwaNMospvqDBPNWBGZJ0Fm9fJsPl4sH07ink+dZlR7ksYJGMXxI9R
	BrEGhr5mlVBhl5CCxCZ+52lyq9s8SvQKQexH17YCXeFl9mDz9tyurUQ2eLbFh02MM/NLtYi7pGtj0
	5eYjbwv4SQHHXJQqPnVJ+nYTSVroWgiZlQexigJPjj5A5zdaYwiQSPPsAqkPZB32vXb9M/5rFqqPy
	KT5Te9SKwOI63Tipij/1XHLQj37bKVQJ4yr1yXI6juEC6kcEnCwepjTF4zJFMfe8XqwJcYbiouLmN
	6W7OvBkWQKnjbG1MlmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2x-000000037Sl-421x;
	Fri, 23 May 2025 06:38:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0V-00000003029-1LU2
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=; b=LSJlwBVofHusRAlHmgLXbkw1kU
	r45WkqdkVNTtCDnVku0TMUtWeDFezOe6mSA2i/ysTccSMszMbX9sgLfaTPfIXuJNvmqh3p4cgUjNi
	f8yB/x4zJ+LtDS3A1GW3oWdC0b8DCuUJUnzBTfZaJixyzXHB4UItiHVWnvHjZFiX+te6EPFyvIMNV
	B5rM9jETB3k22GjebmMBp0+utf08Znbq0uHFcEPQD5l5J/GEhOnID4hPmpzaSdecimSclgjqIs7H1
	yNhkvgnACwJe4I4AWdPibJI4wK2mVP9xUOVmquYqWhIBAcS/HZcRWGDWfqfcsCVdGRfcA24HQO3+R
	LkLVLw9w==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0R-000000018cx-45Ia
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:45 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73712952e1cso7978294b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978302; x=1748583102; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=RVNAksnW6zn7PVaVAggEfeEU77IaJ4bX9wBeUe/2P02twfq8NA8Ax8VJhxDEhuFtbJ
         v3RlggJVNWIRRawxklBXMUIlJ9YB/VG8c8+FOiVWPfOFss5eBCp0B2wnT4/h+MziifbD
         Vb5TBNWsr+N14S+3bolV70eBqiVjCGvka/N8L1MVDqSKxknYFljZPwUVGmRr4mqOzDL6
         bPR2Sa7K09ZVCuj1piDvCVUwekz9BI6CrVDr4jzZLnYCf5DmtBLt3qauX4diy9F+q8s6
         Ca54Dk6uylaBelyzrXpZba7XSNyZA+uifV1O/HXDLnWm93Tas4GCAr07IIIrjWxQbwLc
         i75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978302; x=1748583102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsODLDfRcPuDSErfbs+tzfaJx/MFrIF5cCrvvQql1Yk=;
        b=kR18LMY6hkgigbERWxxFnSaVnYXsO5eTIcJpCo7BPuwQtmwp8OyX/on0Wjolq3vGbE
         sYESrubHPHTrKBmcyCPuREU+EWWZ7DRQQocjUaJshcgRbKy4LoLSCHSWSarCxlyvi71f
         yyWbGIg42WqfY+9hbgy6UEiXCAOay+O0XzxHac8a5hz/gFVPZdP7sCp3YX0iQmN5jO9x
         ImRk30q0D+x6NG9GfrSMRfrhPfWpiifIZKuVBrq15EJ1PolV0qsrBrAVfYbcf2C4/kp5
         8FyDpmYkVfIq/Kc7fWV07/P8zqoKq4ZDnDpFQTVaSU6OMJdmf9jXQ9OGycn+sK0elTqr
         Di5A==
X-Forwarded-Encrypted: i=1; AJvYcCXgXw+wjeqJ1njTMXtgEdPnesi4KT2pOiFVrFl47a14FL11i2carFmw95yHXfG5UaU5c/G7CleXnCJJ2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSFGTSmDkonhlOWHhNKwGa2VNd8DOJbDUnT/KJbruYarfFfpZL
	RSuO+FcRafXsyVgt/Koru85f/H4mOPvcixwMZrOZl178efiqc9PwMS+eMgw9v6+xWII=
X-Gm-Gg: ASbGncuP9DFWE/oSYcw28RA83Y5nwuZjVUPwDkQRu9XzBIOcPQ3ve7uPFh/gInTu1y4
	kqJyQ6wgjp7H+AF+csy/+kDbDZc/NiBycdPKoAlgk4qPCJTP2LIBwFly5BGrYSm+DKwW/K1wkzW
	QqgHFGhtzyCzow5WB+gs9o+B0Kl+24F5Cdr38Sl5QJ+BG93dAQMxRfYDnO+r7v0mgFZ7G35hVFm
	iStlUw2gbB6j5SBKt+Xi2Ku8oMtMTPfTwaqn3mkYenBpCXPrmoJ8vVnLUzwU2n7e3mKAxeSS/ED
	EZoUv9YAL6OfHR2w/KJF+SeeMvb7M4STVSu6MG5liTlQfeIUDwvUJNl5mwxhhw==
X-Google-Smtp-Source: AGHT+IGDLVr6ZJ9g2UKmuR3DGUz8wUaNVCkk9XGn0el3OWW6yYG/d5yInq98aQU+8QHvwqvNBOnbXw==
X-Received: by 2002:a05:6a00:399e:b0:736:50d1:fc84 with SMTP id d2e1a72fcca58-742acd726demr38701066b3a.21.1747978302507;
        Thu, 22 May 2025 22:31:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:12 -0700
Subject: [PATCH v16 09/27] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-9-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063144_206498_252BB308 
X-CRM114-Status: GOOD (  15.11  )
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
