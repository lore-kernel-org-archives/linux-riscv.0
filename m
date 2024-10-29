Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30809D7494E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ZT1Y/2zRxHIh+pdfIXioNcYdrf9yZjo0M9nVVNyN0M=; b=iaT16kvUhcJQL0
	U3cYAhv0NWGh+TkYQcWlPJuIIAuWt5p9vb8wTsTAxwk1BLH7leXLGwx7p/UN1nFtiK22A0PUnnyCM
	gCHW6171WxC9v20ItZcEqBm3p6uru2hWHMVhN7ELo1q250rs4RZ8lHUBd/mBZDQihJmNemMQV2hzw
	3OzPoDck5DEmAAidT24sJXKHoOIWPsEQWjgTWhvD3lQSt+mwzzpEFkwhASrH9+MTgSZ8A9nsWD15X
	Y/O/JSuvU595LJXuK5CUrvtIBGtSElT2y2Z2S6GsIUxSyUnwa2DHEm4UpjK5hgJNz1sbYYVP60836
	G6SpxRBhTxfM30JY//aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vui-0000000GEr3-0ZiG;
	Tue, 29 Oct 2024 23:46:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtx-0000000GECc-3xUt
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=c0B+zv7jbCWDse6UooVJF1UXIWGMB9DKJ0N/6xrNRow=; b=Gk4V+Ge4sdY2bAx2kXQndMtMm0
	XaQC2zOfFPGBDhxLqoDj3IBm7FSeFjZOPUPnoN9LktzQe+kcgein1/4beSk/XaNTYnM3ZciBMoO7Z
	qBwLHXwt68Za7aV+HAUPs+AcNB7FKhNSlB7Pmkg/F6Cx/l5zYE+hBZTEsM79XMek12hKyMFwad1dZ
	flxKrnd2XyrxQbowyYd7ZRrVyCHjRPZhnT8P5rXHZs6lA6x/fpLmwv+j5NJdgAax2yXuCNaAFPqK1
	1NO34kOJlFka8nk74idoylok5Skn7guyD+ceZApRaMHagedV7awCEWT2yXIfDDDn/1QX0M4KHG+uP
	gNpPCegQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtR-0000000A1GD-3eNm
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-72041ff06a0so4003020b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245490; x=1730850290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0B+zv7jbCWDse6UooVJF1UXIWGMB9DKJ0N/6xrNRow=;
        b=fd/crBMmLLrZ3zTsjtuLW3fszXWcT32oMToVHvMXZUirtynjiSB0ip5EeVzww8EhF3
         bXToVKI+0gf9gEuWU9m7dmUWgeP+fpfwL7wa9ZWL2HqpjVgYjGCooBRAxt4cBVcUaAxY
         /nARgZXGQ3Q42gjSA5WAC0beCzcnTiDmGQW815huo1FkHhb1QESmU8fYwvCfJ9QmlHMq
         kqoBuX8xd+9pJU21GvR5qoc77WBxkMzMbYbvlCwUk+Nd4xBf4ZPKpiDs+0CxckA0+XIN
         fkLn4NYl7TDldpVxn3GYSEm+0STWZok6a1HzhaiK/CLk/oPpYGd6NjhR7Dcm+pFow14m
         2Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245490; x=1730850290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0B+zv7jbCWDse6UooVJF1UXIWGMB9DKJ0N/6xrNRow=;
        b=FlXnqXLa0RoJdQnJi7ZRcootNkew9Q2oPcfVF3msKcYQ8gytfzI6BYB5hah8QGZTmC
         6pNuugXKFwHb6QTePCNqC6yGouRnXTqQx/v/c6ItpJrHaa6rbjCFfl9ux3CpnvIIO8ja
         FGBHCJ5B0QLutTjDCjH0k92NWVqOY2Xa0nONApETky4O3PuklRgPSyMbJk4UJV4i7JIH
         ns7DIrVHT8SGmUrqtvslcPKwfSLMEYDrgiUd0uqaucy8KcePN4viIHlz//PG775LV8SO
         6CAN+mMjUZIcjNQGArKbtPJgBINbsg770nFp8V+8zPpJVrJbd4nJZw8vWOVjFxjYyLkS
         JeFg==
X-Forwarded-Encrypted: i=1; AJvYcCUQTAiiBPOfTm00mcKwdz31OSZls2IpQlfXeoQtRnDChQs8fCkzyYRd1B2rCfJYXql/OzLsjx18UHkVmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR5b9gxt9t3i3vrrPasjaPUJpaWInB2so+L36pDPcgK2J6Yw+y
	LaSE8LQNx9Kt86RVv4fWrR69QMfSIF7feHIhfA7Ykw3Hek0Zz7jJdWf70g3zR7o=
X-Google-Smtp-Source: AGHT+IHBXcg721hFEfeXndFELLRbZaKej/qAWRXm0LpVc3pKofZsRnhCap8fGfOK1cqNWExKjLYj9A==
X-Received: by 2002:a05:6a00:3d4d:b0:71e:a3:935b with SMTP id d2e1a72fcca58-7206306ebbfmr19631100b3a.25.1730245489674;
        Tue, 29 Oct 2024 16:44:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:13 -0700
Subject: [PATCH v7 13/32] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-13-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_234510_468917_C09BA5EB 
X-CRM114-Status: GOOD (  15.44  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
