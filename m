Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B173DD3ABF6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HS6V+3Na3VbbT3bhzEGM66T/4kfcJhVdm3nI/tQ7ts=; b=neR13uDr/QdfsI
	hu17kbEiK5SAsmPPNY36EOZv40h4g6n0W+ruVyE7/Hjer+E6m15obfIWYwoOLpm5G37sWui7kFE0D
	VTbRmm4nUpePTOYe3hEEsu/rKGSnU1wg/t1JUHe0/yHBmbqdYeXdMZd7ABNs02m3O4DaE8/Up9Z4H
	9JPKVGWjvety1/ixs7eIMcJL9K1z3L18Iqx9HxU9YJprqBSfbZiyzYZxkurRMNqSUSxFsU3SaLJXX
	dUW8XrfEcRM+0Q0GnIJWOG5h4xRtAi7MX5IT69CsY58YZbZns79bOdu5afhzVZCb0VM5Ud9w9HELT
	xPbjba6taJu+JbDAvtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbbv-00000001Ix5-1pbf;
	Mon, 11 Nov 2024 21:06:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQU-00000001FuO-2QAH
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so3928043a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358461; x=1731963261; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=Qk23W1xK1yzGq7PfTk5eJwb9YgmwykwTPi8FTtddFqCN58Ytak7ZYsl00WsaSc6xW0
         CUhsHbjampEwTCp5aOtIFHFrLitGumP1tj2AJrPNKKSdGjX6xTtp0yleMDkPGDhBo4hv
         8UupJ0r6lkD7C31pd3hAxISH9UZd6/ICHTRWOu3V9uZZaHiO18ls0ID0e9ErIA7DubNH
         fC9WKAL6+kH6CIRhznmt3ABvffDfFkl9tyxik9Ys0jTdR49SP1WL9ORMlAYaaiJ8MYja
         S0gpumwJcs92hywx+rxXyd5F27Ou8CEOovbvvKy7v0w0h4b02zgeyi+wC/1VKX40Wkm9
         arOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358461; x=1731963261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMPZIqdzSjfHq7xJb4YaIgEu2GPeUmiCYK4jkAGMc38=;
        b=YarHNMcA6/bH7yjPN7Y2uG4z9rNc/vzvuq+VjspeuDV67Ao1QImzI4KMvL/hp1HfQp
         aCUu7hb8gQRLtkIbegeQiyUqa1h7pBf/EC5EYDMNXOEsX6PA+AA3BHjl5SWj8wd9WkNv
         oK6PBcejUk3AYVDN92cDtE02mcDzRr8Wr2gq92zlJg4XpH/NIYI9SBzXUVNamLEt1DJs
         jbXEdqzLrfV5gCetzor37G7DZdmkq8oYmjUYTAn/CB3JYHP6yMYV+JOsHIFa56LRJkrR
         4sSR9sE0zVI2cm4NbNt7mbf7KAFasojtlkBXQFVV15DbC1JYGo6vWJWP559JWGhsC9WT
         A5sg==
X-Forwarded-Encrypted: i=1; AJvYcCWBcWCFVIS7z0GzK4sgxjDEffPd15gdl9aN7dFtIsSknhfSq4fLIEA5KXNMEZ8i/r9Okd7sc8jc15bQsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyezs2PMds7aEALysuLstubr4zxs7tfLGmLer1oLuJGUO/dpnOh
	FtQxuiPT7kyhRcOpXr+R9RKcZQ+NBSp7ORl7G8XDLzMwaZfAvnKsJMZ09fOuHFY=
X-Google-Smtp-Source: AGHT+IGRLWN5kqeXRNQn8yzpCXFOSvMQOUs+A8CKa7xWJ/vZOijjwVJZJo9LQV0BVahQpTbnhrdFqQ==
X-Received: by 2002:a17:90b:2b50:b0:2e2:de27:db08 with SMTP id 98e67ed59e1d1-2e9b1770bffmr17545652a91.23.1731358461465;
        Mon, 11 Nov 2024 12:54:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:21 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:55 -0800
Subject: [PATCH v8 10/29] riscv mmu: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-10-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241111_125422_735398_88A65705 
X-CRM114-Status: GOOD (  15.17  )
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
