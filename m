Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14C1D2A520
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 20:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwOhokeXYxgprO77adnCUKHwDl/Y+AfTQA75XzlXdfc=; b=WuCBKPPnZp8Izs
	onCBGC1dwEqMnbqOLxSkvq8cdy95ewPztCDL90RfeL0QrfUcCcDwhIHVtFLzcWsnr32luNLHHBAS2
	5fn3o/sG05chdGVWMToDKGLxS6B9Q5xnd0jj05KXPfQp+smOQByMcwfKmPRMR1N1pJKTS4Q1ZhUC+
	jB5KCasL4O2/LomIuYencVp+EIN9v4UhWENTDuPKcRcpDo5SgydFXPrshTk7OcNUzbDPTUxJ5amNu
	/06SnZx2R5JBz/jBbrj0OS1zWBZxrw6Eeh72Ty42FgF0gCokSlT/KJRxqj5jBviA7cNifr9fCbpTz
	a3GIaOAdDh8AXoeaGqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYp-00000008YNz-3jVH;
	Thu, 04 Dec 2025 20:04:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRFYn-00000008YKk-2Y9K
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 20:04:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2108122b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878657; x=1765483457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhzOXQIeKPGphLxrrOEUt0Oa58R/DXqd+aRrNPmfj+E=;
        b=GSFAOI1hBHenSesMayUa/6DyxuvaWj8sajGfYu0/pMAxDk+TKBbSF37allesF+WX8G
         n1rmSYGFDZpR5cQ1e+bkSceCiDomui+Jwzvr7aan3zwefZ6s7mzX82639YR4vfMdCyan
         Ni7lD912vk7xMEDil+V+KTlZtoH1ZDzGhcYKnaWMd8i+DWi5x0xX1TP8s4FOxQNIYeyD
         OoP1xsXxrwL+vGyQhU+7aaUTmtLv1zAThnRYznKsd+AdENIkOiEmFLcsWPFrYhKIqcpr
         Wvnxw2XqSIRrMgrxiw6S4VQcayKk5L3Z0cOGc5REq1NneEb70PyBTS4fDflZVD2LBsL1
         xyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878657; x=1765483457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhzOXQIeKPGphLxrrOEUt0Oa58R/DXqd+aRrNPmfj+E=;
        b=R3y7+Rc9l65dup+PrnCB9CN9rRhCEr3NE/TujptCT3JRs/vH2piSFeA8obVmmifAms
         pp9EjTtZSNtGUVrx2ZDBs1iRQhOR/0UznaC8J87Xs29ugcsub4a3PDyWZEUWxFUy7g6y
         5Dx+fkGKS/ch0v0x7Xc6i0oqu5W72ogEpatjRetzdTPdG/lqUKr92W2n519qajWRSJmr
         IF1NoPIavhBwz8F3AFGAxv34JRqgi3ef+wz2qD4GymLaf0H7L/Ck2Aj6lHB79IF9bBYA
         AERgGOtChxxlRKtVUYLlLN/rdUsNdOYEANtFBCHgmxIMJwUj2bYbltmq07a3LGsmGiof
         uKDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZD/9ehCk4dm52LU99jp1vTEruGuhB3SgOts6UjTKvQZGdBy1EQDS2hBA4vgt04d7DBNryycntKF8pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfAOlbixd+MpdNzEUJu44C4f4ocvf6o+/cTZTfvIzVIi6r6RmD
	Snhzmje5PHJzoZPr/O5DVEWqX/zkExqM0K5tqZM0xa0DqAQlvCurGhX4M05/UaEp0qk=
X-Gm-Gg: ASbGnctkXjPL92jPldx15hpMwi4BsrQV6LIFvMcV8v7M6/CGk6xl+/l9PBTRJjHfiYh
	K/JOVAqymyy5wwDuvM5Zv1wqe/5/YGDEvxNuWcytC7Q4QU+QoEOEoG7oACx9GyxUgB73EPkMMLu
	cz9gKuMVYkxurVqHHfCrxjPIsoFq78uujIl8XurSqxlTHV/zkX10eZ/V/aMjXGDGKwPzCpSI3RF
	TixzcDXKsWVUQmN3M8VwxQeF5GKzRcyif4VK3bU5PpbMW9y38EE4AK7mfKTUxeUu/nMiKz9750M
	d91AiCwsV0DeFMGg+J3MPpsg6v2hh8VqfUMcBkx01QH4j4W4agMj+1FqqFQK024nAsoT1L4Si9C
	D+pUn3kc22dmS4I4Z3ckBgnB4WDbLX58Q6bfweGlO1wx7EmhHL9pZKDiToZDDgWw/LwfaWuCS3B
	sb1MFzPe3jEB3Y/oZU7BKb
X-Google-Smtp-Source: AGHT+IGFh0sV8K3YM30SGR/TeRRCbuWQKSsLII8uaKG0pjWDWdO9phApXXsMABddoI0pDrEfs2joRg==
X-Received: by 2002:a05:7022:608e:b0:11b:c1ab:bdd4 with SMTP id a92af1059eb24-11df64af432mr3149166c88.38.1764878656793;
        Thu, 04 Dec 2025 12:04:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:16 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:58 -0800
Subject: [PATCH v24 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251204-v5_user_cfi_series-v24-9-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=2600;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=DJZ2aJIoeyTvFOiDWAJGj4EuG7hZunP7odYpwBb+3MA=;
 b=V44PsHIMigORyGMx65St1otJQpXcs/c8txcdP6sR8t3hFePxiBSJJTUudJDieXaQDuwFWIgx0
 Fsn4n/4NJ/rDp/0y8KXbf/bVJBdFeXiZH1dd2WqsJ6zjcjREaYj7YBZ
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_120417_667357_5B6C1FCB 
X-CRM114-Status: GOOD (  15.08  )
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
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
