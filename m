Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4746CC021A2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jp1YU5ZYy2X/dbd2FG6aBkHj99RVQsLlPXppCsfvVF8=; b=Y+WbfUR46O7lnP
	1tLoAgYH2UNKeTP/UmFLs60nD6wmIwr8hGJaifTg5rcHFOnfPfAjD7oeh6s+V91BCu73TCyQXpKQM
	ghMK3FORONasKulwxCHCglC2Q7HoFUu31O/Q1vcD1i28tgoLZMv4FAqPK9xN/q/dicsQalSiza9Kv
	d6Ml7bb4XosJH5JYbFxqoKelGqYBD4CelMtV91nxU9TWQ80AckCeaQ5zduUolb81Cz+oI+KRVEFbc
	yIAYSnxlDYld7ClVhGIGQd06l9o8g60JHtUzqH16qktqorYZnjKN8Rsfo0dxA+g8u3pCx6AlWvCFx
	fyc9vTmP3O4TXqaJ+AyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaN3-00000001K1e-0HCq;
	Mon, 10 Feb 2025 20:27:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMy-00000001Juy-3xXz
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f92258aa6so39399015ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219224; x=1739824024; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=Bb8Gi0mUbdXRV82/EKNO9/g1VQHi2IckH8n7u54lzOqiNGgv2b+pFsx31KMvhz1BvX
         r/sZMckV4ytg18w1rroV3oAIwFM7kr2uth992Qjlxe4a3a5csWqlAkjj1yYVXXQ2y1GD
         jOoQKQd59uItcxgdU2wvt5LRlCc4wMshWGFOUuc+4Xxyfqfs7QoY7PWEfINCordNozw1
         aqgsRd8BOWM5zf6NB/UX98/DsspA+r/lshOBT7RNLWU5cItLIM6Ohg4KEGIMxJzjMZ4r
         9SjDYpwAgWTzIxY+353XtizbupxnZhT7CuKd3q5U2HS8vVZwG83tWlguV25SScgH778N
         ToLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219224; x=1739824024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=HXhXDiUqZM6HtPWltwVbZrQ4Uf/+QCzMJ+Ow0azaQJOz0Xh+A32PXznial0j2JLBHc
         ZLMhvK4m7PATv6wD4N2hz1h1dXJQzd15vb2JeItQSdyfueYdrsXKeNaU1/Qf3p9iyWQX
         QIeyV/fPthZNq5BqRkzirrhzl3jwYFS7B1AHy/m85BqAvYfLImLQH7tG9fp1xTMc5xIE
         ggxl2ltjTOwVHznyFznUZoFYaCzehLtm9lP+fEWYNoKmqmLRUeVby4rAUV6OyWa7MT5v
         hf7+grSsTv5AqaDGkknK7iFP1oaEHoEhiaUMWI0eg7q9S5WA1tmfU57cUKL6k343DJ92
         xBIg==
X-Forwarded-Encrypted: i=1; AJvYcCXV0/q4uRGC0AODLe1PASizASFi4DllWVtDm+E28kKExgXVE2QnHWbq+Fhv+s1qN77D32UeeOGLjeJ8CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxebZq0DKHODyn4knqbWDUG5dgZYwX3rz79JtmzpdyhPNenuRci
	xO0ZYQM8+Q4bIULabqAmhT7mrQ5RpLJFvwaON1EDh2sw0G2QGu0T8R4xEyIjAO4=
X-Gm-Gg: ASbGncvlmiZNQcMSul5sAwk9ACVUw01cbbm5cUtw9PrrqKqI/JztQgzo+W5LHkQGQ/w
	BwSXX4B7y53Cxx1EoaUeukbRi8xoz6mPlGLCS7BseTb0MP/gTWG40nt9qno/T0rht3YfQNBbZY/
	m5KlUrkcdCCf2YQyLsHRqK4r3PP3QOzXspU8S42UOIzGmRcJAZ/34Oi5rbE+UH+Ass/51/ZYup9
	lVnfsVpobeZbs6W/Sq7PVzYzl6RyZ5rXQebLKjNFAxU+TUoxWJWA7urz9oVCmMD/b0UXwdMG4YP
	nHsmO+2Mm4zmDdlstLUBpoCQsg==
X-Google-Smtp-Source: AGHT+IH51GCkumMcFJPAZ0u0Kjg1gihjqDbfZuYLpqygtJdnaOIjAF7ExdTAshwwxxeYa5aWxibyKg==
X-Received: by 2002:a17:903:2282:b0:216:48f4:4f20 with SMTP id d9443c01a7336-21f4e6bf3e8mr230190345ad.16.1739219224426;
        Mon, 10 Feb 2025 12:27:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:04 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:42 -0800
Subject: [PATCH v10 09/27] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-9-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250210_122704_995551_32683874 
X-CRM114-Status: GOOD (  15.07  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ccd2fa34afb8..54707686f042 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
