Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6FFCEACF0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HS6V+3Na3VbbT3bhzEGM66T/4kfcJhVdm3nI/tQ7ts=; b=FrrMNQrqHz6KCo
	C7zFGrqpAQfS3p482/M7cwuAwWeEHI4/39KS6BOeMCcHlMMs20RwohfRhrxw+RFMHpRiLhHecDJI2
	OsSE1RFt6VlI2OPf4QJAabtygoUpXGc6trWLVeA7dFE2fjfLSME6La8tShGQJosKtgDryaMtTJfNd
	WL4C0QlkLdcA7KpPmM2wZPj4LFeK4A/5akBwTvPx4qRjfRd70zZQFPzXkUH+6MaY7+E3gl2BMpqu0
	qGatpXhIUIeQsTl49a2dttwSPR2Y4Fpq4W86Sk+KhEcldgOFNmO1pPqs2jGVpNutKYYq+WrxiHt5Y
	EcymL7Kkwxqcl82wgxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgik-00000003fAC-05BG;
	Tue, 01 Oct 2024 17:31:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPX-00000003RBO-15Ss
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:40 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so4884035a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798858; x=1728403658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=SLkY4kwjt58/IZFa5ac1FAQH1BYG2RUnceNPc0yGwX3gGXCBXlHPabGiRbm0ADXxiO
         a5YngYbqGWbDMrCIGxhtnI8WyAPgjWUZdSmNw8EWI/hGtqF/7NJcVrLaHkQKUvqZEzK/
         jE3VUQ4x9hinTf4L2S28U6b3wjhMDguWaohuS2P1Nq+izIZ+75xdQVbASsp8k84xMqgv
         GWwrOIL+LZX/sbRzJ0pwoCiJGsYPbeTP8899jzClvH005j0fOMSuAfEV1JraoTCJut+O
         VVE3mLXE2z0V7w0cUePiAGIwlNXmnHA9+lV/8NRZJfbCqAAHSRAaLk9IY8HJEEEJ1B4K
         zHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798858; x=1728403658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=eI4k24drrZLHB4kkSvQ3jkAexvF/tg8M6FkueH9u8fPjN7zRDhlA2trknwCjD4zgUG
         ltw5JtVgm/RxvTh17e1ImxwkxsP97PdC0RM13hoxJeDXxYgQ64c9/j5+JiVAimtIVxK4
         Yp3TZPchrbhQCwijoyindjfcoTLvJDdWUF4GT+ovsGWd6c/3MXFkxzMQRaKp7KIfT0Rc
         Rn2OhfoRjmwg48Hb/e1R5s2GHBOlNon1EjGmx/lRTPRl9UCDmX2O1iBrBzuG60DgJ6R6
         3k7gTcrQX5AD2uAfxIOt8UI40GDgNJSnnlj2bzgLshqahTm8GqcwEwGBrEoAaLqCQcLS
         a54g==
X-Forwarded-Encrypted: i=1; AJvYcCWGt2/JnimydaCP3LN/4JYL1GVbCwoFbWrRnyZba7XYI6Ox5S3RUDpgBJ9srW/gt28UK25+vEXvFDHfAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHOsSqsNkWm90Vs0LVtsubM5qArVkcFZyITmy3RVdQ+AJBOcXY
	qxsxO2JNfekJMlygzXGs6u0mPEOq6UMDQSxl7gQ9Y8EkbUztDWprrqQVz3g63Ys=
X-Google-Smtp-Source: AGHT+IFru0DhFvQoGs6LhOQ3kHAjWn92S78/sQgjmR4BKwvX6aS8UH3SB8TB1kja/SuVDdI6S6eWBw==
X-Received: by 2002:a17:90a:a886:b0:2e0:adbd:78ec with SMTP id 98e67ed59e1d1-2e1849d9954mr193359a91.39.1727798857996;
        Tue, 01 Oct 2024 09:07:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:19 -0700
Subject: [PATCH 14/33] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-14-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090739_383005_5F9D0D7C 
X-CRM114-Status: GOOD (  15.66  )
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
