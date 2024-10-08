Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B7ECF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HS6V+3Na3VbbT3bhzEGM66T/4kfcJhVdm3nI/tQ7ts=; b=Ca/VogBFj2iR+r
	A86x9uvC8YY9XSWpSy45RxsVafI9xgxC0UWjZERCWHdcOvwUmFmD5Rw1nCwM6To5M0EmE17NPEYJx
	Z0ljz0BxD9nA/XxyxzyHQQyWJ9Y+1YAP9o5d7AjotlFNiLatsuRxqme9c0z61yrnG2NXQVVcXMRX0
	Jb7UQVxEb/AawVr4uPrm81KaIuTvYhLPFaJkjalvKkh2akqkhhUmPnr4s5+TT/brmlgeWHwO3f46m
	54hWpz/2aXw2HWL7sNwGvOxXCX+To/9wDboPfOmEgQd37p1bcMOBUK0Dbj3tb0exr/qAnmNAzKizt
	dLGM7Ri5AizW49tDTGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqv-00000007J0V-1b51;
	Tue, 08 Oct 2024 22:38:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqk-00000007IpM-23BZ
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=; b=AbFzNC1dQxBoAIsgt/ymZkS3fT
	WDSjAS0Ial3kSCO1l/ArAP0Z+AVfKJn929+9zGJ1iPCVktQkX8YnAVIkh2+kHdNFID3jS9QKi11v/
	WqXzoAcp7cUW6AzIJM/aLvzrR11IQXlBRKBWOmZuXpSAQKzxKKKM+UkcDv4cqvQUmZYz+bo5BQlOn
	9Cm7p8NDNR6ZTmAlo6Sf5qbu2Jhiijo5uFQkKhq1awvhiton5qE4xKnMOBy/sHtCsH9/QDGLIOW18
	Ejj4h+6n+b3CtaPGAYbYe0mt7A/NHsJbQQmenaypOm8sXSvYZqSMvHaOumekeAa5SP7ud5WwROHdj
	p418pLEQ==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqe-00000004hVZ-0evV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:36 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea07610762so1959690a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427107; x=1729031907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=PqFfjIpCidmZ6M4HMgTNrooVn+sSk/qlJ2MjGvRFulx3hDYfwqZ0f5u4BuFukbBDZF
         6LtYIxDHYbiBh47clC+brHFFrF081Mup/k04VZdJnCwwnOKYsN2711xhK6TxgQEm2J/o
         EWxYeDzBkJc/CeHcz5cE70+IBmOkS1dsvCrNPbxfP/XNVg/d5x6nozWNjZk2+BFDPjnh
         qjnp/gqVXuInfruAC46If/gL23OzQUQhLj5CUnemAK4rY3EGnlfF1CYKSk1vgmjgKyAF
         j7pjnctz/Uo7PI7IUCJ9SlbXXCYTm1QHMitHacWyYzSK1VWe8dGse6lievNTezPpBCOp
         4CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427107; x=1729031907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=fwNUv9gns30OfPg3ce1drBwrbxiQJsAGAmPIdFb+slj6AO397yxghxgv21QluGPqDN
         THidOp+aU/GXzLnWfgzZZ8BnTRwUr/uQcS/ZhSQxKFas4GegAQA4mRf2jJrR38Y+1sz6
         bLiyEtc/Q4sTZwLTLnt07YzSaEgxu7pAHETLx/evE3bdGmxf001Zw84iLF8lhz0Bg1jx
         37/MnYZ88vDoTWZbu5vDj1TZpWXm6iwiDvl0QEc0uCCt78+L4kG6yAK9xCUtQY9yJEFr
         Wgotu+Q7ltsU/sjQaf3ugp5umdYb460evsaTMjGdI0GPZ2zdfxhy+5QHO/EzJBj9S1sR
         YQkw==
X-Forwarded-Encrypted: i=1; AJvYcCVSKqW5GV3zcIYMRLW3ZtPKtYPObscONfN7xfo7PBMPfvGJC2iXo5ZAtTfhIBxDIVDfX8i09M7LpChKCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2I6wS1MlKpKzZMQETPxaJ47YlAtoVSQuCHgt2eX7QVPV7V3KT
	hsRrVVXyfgyH1EWrRNssJEuJOS3f5wugj0dVwZ+7sUADQHxBW/fsYpjRxz9K5E8=
X-Google-Smtp-Source: AGHT+IHWWiD7Qfl6QcTOp/Fh8ZvI7bj5RBVwxNM0ruqC/BqZklsNYndBJ5uZwxRV/4BsJaJcvUdg6w==
X-Received: by 2002:a05:6a21:3983:b0:1cf:23cb:b927 with SMTP id adf61e73a8af0-1d8a3c5656dmr945264637.34.1728427106662;
        Tue, 08 Oct 2024 15:38:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:26 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:56 -0700
Subject: [PATCH v6 14/33] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-14-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_233832_419590_3221EF28 
X-CRM114-Status: GOOD (  15.54  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7963ab11d924..fdab7d74437d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -411,7 +411,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -612,7 +612,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
