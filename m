Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A18ECCD19A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V2t6C7VNlo5ix4NVjwhbD0QdAJ3ZZnZIAbuaNG6EvS0=; b=f9Ge1ct+cTxt2Z
	vTjWZDPQjUMm4ZiKZl8L7Bw55Sl+2uX5c7tEx0VZF9UmOXZgxlRxvcQZLw2Eh5h5iVe8VaHZidiYx
	owBx5ghXSzRL+xzFW5tQbDjwNndvyIVIO5Ti51595QuZq8b1Q8ZKE3K+8xpPBAmFPA+c3djUFrxSE
	0EmSgWZ0eAap8gOSRqMp3GI+LQdqDI5o3ig6dwX9BVy/1WFUYvBDHZuEeEBhgd4W/zhAfJo6n9f2w
	P6IrmopnRXu0a26bMX+U5rzv0cWRK4jTBPsYdyyWeWTJozRsfkz6plyKmRAm1cJwN06lCpNMOpWxj
	dmXs0RxuzKxlT5DtFk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960w-00000002XLC-0XJb;
	Wed, 15 Oct 2025 18:14:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960s-00000002XEV-1Ziu
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=; b=ULpzlBjst8vpRivSjiiELzlBVI
	JVp5EXpGhHL6ij2svGMyQJeWWYVjgjZEUrIP1N7Yc2oxfyNJLZelPHxOigaac1cN2sFxu8U9I2rWH
	o7iZEWt+O+pg3/yNwoXQ+d1jgOMNLydFom5Lw+4BIDW12D0ok0aA7hiUiIGKGC5750tqOQ1h+7urL
	FK7h2zXn5VolPp2eLqGrgyC/oIBWqaX7Cf8cAFGp8QlFoKIuanvjbBlV3fshsJpCdoH/cqhR0Hbot
	2SV12liIrGkN/qjUu5SFY/dd5QsrJaAMdRNt91azPKXSaHBOxD+6HrjVFnwLBTyn7+AkTxR+uKvyV
	6oFbzy1w==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960j-0000000668l-43fP
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-782e93932ffso6133174b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552044; x=1761156844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=Pk//dn0MJ543n4yD7CYJNER7BDWGH8RduyQsHWSSkwc6ZnnEU2R/A2+Q5D078PEQJq
         hNgBkDXZirgJO4+Cei2C2XWT0/LDPXcL3Aj6ArUvg6XgeuVf/9WfAU+L0x359Lw60MfN
         hEELjz1znGTUqN4HzpqW1tdO+pJWuHDFcwtnm6+DC+lFSKn2PmEJET/1LLVep4QPk+iW
         hW4/mdbKwZJdVzZBAMmGtZ9vw9mf0ea1sPYasxESTTyXSG9E/m1qb5hcKcNeMiyZ3Xuf
         DxY65mFsUCKMH4cgSNU5djQSEjdUalUdj9stIYJTt7/BZeocY1/KWiu4UAX3/Exv2AjK
         mCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552044; x=1761156844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=IB9cFo0zEkfkLtWog3TBkjsuX1pvHXso2vDjdmO1aVAJ/iQ1KL6NhsOc45IvsSbH2x
         M84q1pH3nQyrpvvKZMFI/80PW+TQ4pX55lrmqWMs1qWrWghiSzOrShDOPR0o9moo0JnR
         qTruN/0Pr27b9ofhyieo1cUjDY0lvLuXSkPbQkwOmEe+pCp5BToXpcg/2ZrD6qI//+I0
         G1MJw3ABh75LrNtOvtrTMCTnYH0x9WSrwieQeUFRhnmW8pK5rmF/CfHGZu2eEA9/KFAL
         eOcPCmNMELMjrtgTdUCAtWqbajQWLnH6HUKxCPirVJvAkCkYYBW8TAo2+zbCCe4CSIoh
         AUFg==
X-Forwarded-Encrypted: i=1; AJvYcCWVquQTUhACm5GI/SlVHHNu5NJuCBzsoLXRgosovJHgK7IAYBv23sWd47IaT/L+sZDbLkOzlJLNe3ROvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlhbgxGdqSmWZaDa9iPY/Ci1r7wj4HWExv84Wtracu6IDa3Zag
	ylyroSwkM27XsWjFNHwnlsog/okOjEYJadY9qQm6r6qS6CIBPRx5PcZ+hPJ0efp0lLc=
X-Gm-Gg: ASbGncvghTwdz1JIDSBeCvyy9QrENdhvG1PAi3vAbiPPBBedEuugO8H4tYw1c3segds
	3m7pgmq8G6V2788xWf9m+37IPSqF8Akb6Y19HB6sLOV50ZM7bBQOZyedHi+Iw4Sq94vYH3M3mEH
	q/69ZkPVkwSF52IoyjkQfgmzKSQQWgfuU1VaZJqNn/iqBtYBspwW97F3SYUUAwSDrAKdir+Yk9m
	LiviK5yiao8Ma0IBQjoXhfLa2+OkCa+3PCYFH8p8mwDOJzp/3bZr/4v91VZLCXStEORQj0/4EHe
	kRmTO6eUgg3X2C2shX1h7TuAYnlFaoZ65IkrMXjxkbfPvx8kbnV8jB1ySSZ6aF9rko6GoOi7aJk
	7LHLRvnP6Ei8uG3fJovm/DjJ7RYA1wGuwXRrOCSxAG32tPV9UvzEXbbRCAxhzTQ==
X-Google-Smtp-Source: AGHT+IHetZQQxpaUW6Ligrelt0t3SG9P3lR8csbC0fN5hsFXEFcboGQK7fC7f7E0BUqjK+kKMsFmwA==
X-Received: by 2002:a17:902:e806:b0:261:6d61:f28d with SMTP id d9443c01a7336-290273ffe94mr346464585ad.50.1760552043546;
        Wed, 15 Oct 2025 11:14:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:41 -0700
Subject: [PATCH v21 09/28] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-9-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_191408_809044_86F38BF8 
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
