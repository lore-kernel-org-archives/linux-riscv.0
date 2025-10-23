Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F1BCCF9E4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2t6C7VNlo5ix4NVjwhbD0QdAJ3ZZnZIAbuaNG6EvS0=; b=RrYjyi6bOjcC+K
	sG9XLFV/F5eb5Q7uPlDoE5gdXWkdnjT5tYYhdiRIPF9XwQnUJ2io/SDWHgUXvU3N9nxtMJdgtQH7B
	xE70U/COtQeciHgSTJROT9btt77+xldNeJC7z/Sj5CoaRV+aAwUo7HJ/oyfK7SdCzp61iV1sP7tz3
	BvD10oNPeuPb3P7M0B3rtTJiGAmoVKPVZfp1rkwyt8KngdkijuJwChefUiCqeLzTo1aEf3BosDTSS
	2cUqtS8PU+7+KF6MCrHoWutDDerzPcLKmVXwqdCYgdaoIvACQmOoO6Sc8JKg4scQPKZi+GpJhBY69
	jpCDwVh3FOUAh1IHWUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKM-00000006N6z-0uIS;
	Thu, 23 Oct 2025 13:26:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvKI-00000006N1t-0dIw
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:26:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27ee41e074dso8079895ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225957; x=1761830757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=GWY7wOJkNeemOVOfn/LAhBzw5OW9lOKIZapngSbS9yZn8s+KpIeB5nBsQuX7Lpx8GJ
         gGB7ckLqZBN9qPEm7XklmaFNjVJVrcoZJ7WQGlUi7wkfC1AkWcAR3tf1gJpNQxAitQJi
         zzqFmDehN5sijzaDiIEczK2CfEif+FoIJXhqKHhahc0UY4GXrDYGrkSSj6Sj4acXBfLG
         wuYGhSlfcQiy9y0vUSDqBNurxHkf75LaFWcfasIncKGBguthkFewE758ROY0DiLhn9Dn
         C93oHvxtNNdWP1xAl5JZYFhGuw+URs6Z8skCmZNEd9MvU1nvhBeldK/K4Cx9+1cb9Bii
         8M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225957; x=1761830757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=rKHp5ckCLU+5wtwDiwpxSQU61YsKWwOJ7gOgi2mz2ttNR6hn+UWQTEplL+XxywK5kV
         Z67gW71J+0zcWb1xgYwp51Q0IP+mUhy0PvT1yzYLqXOn5eWVeyjH8w3E5DZk1h/b0PJW
         69oUsK2Ff3erCGNTXcH9tmqmnEuNUU7aOQqkbDzmseSoQ3bA5YinWW/Y85uI3zTwDCmi
         XnYQr1WYSXfaZ6RFcJo8UUQaiwtMvL6AwqzI5DqZgDSQRLXKW93Yiy5D33YPFhU6AFdv
         yZpdrjzB/MD/neOdH6fSlJXOYsFRjnEGJ343OYx1UC3NlHLubGTzq5WwtKObStNqg7ps
         iI4w==
X-Forwarded-Encrypted: i=1; AJvYcCUnA1PaLYKJ6gIsUkp7kSVBvPoPiUGfqFh+PdidnSzlTkaYngCqrmFYa4M7kdINrr66SxeGsEbPw553Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjAF9ws4yzaDFWa0p2MCkFQiswo8WFfJ3rIRMOpeMqh+esqQbD
	mF8c4Rke5DWEeSleAHRZutV0uy3wUku4uqbLMhqe1IAvoGnOOHB+O8YqeESRaMVjRwo=
X-Gm-Gg: ASbGncud8eMXny4FoYNZ7XaJZkDiyTkhrTxpAUZarG8pCFGrYjUuLDx7AVDX8uliheF
	YuBBG0ZlYsyhx+DotzSX58XEkv6nOLSUo0c+Zb/kX8G5wP94Nh86YWf7Z35w1rZ13h4u57YSHnQ
	HevhrgFh5D6vcdTAXKr3VQQAt+Pf3WIDYqltS+BfHZ8fjYT6NI7uQWUNxHYgLSkJoqioCvuvqt/
	ORpzGbMRe8r5Je/B4zXPuiQNshQxlGgPwTpVMIe6+z6EHHb/Gx7tQ+D6AecS848bVuf5tv8sKoQ
	afUk6lqijqfiuIqn6806jVNUEqDwqd+7WS0rsbZqvKapQj+6ZlQx7R6o52+vStnq2uBjFsJZiQa
	r+kdF4up+xTH61U0BNel3jzdqst+1yRhehzpnTLRHBZUHS0Z0QvRQD9VR0ewhc1cK7I/lca/8Im
	rErX/QhHhHmQ==
X-Google-Smtp-Source: AGHT+IHQNsgbR9ZhvUDO+8XIqhhB5S0bPoonwHjZoVYPjQlap3Ktgwx5TRlqv2xhIowva8Uttq5czA==
X-Received: by 2002:a17:903:22c1:b0:278:704:d6d0 with SMTP id d9443c01a7336-290c9cb2666mr309074665ad.19.1761225957249;
        Thu, 23 Oct 2025 06:25:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:38 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-9-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_062558_198439_CB0E6970 
X-CRM114-Status: GOOD (  14.93  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
