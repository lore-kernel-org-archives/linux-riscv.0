Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77223C83F28
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWLreeLT+/hGt4Ek1pGXlBT1NQk/yYMSx1BMD9tE0BQ=; b=kWq5bPerwDXses
	rvZTXze27TOMLJqytBnct9rdFK50ozcUm1ekVAfMBZ8IO7z34Rvtp3kX3PH674t4bIHPU/X74Cvlq
	FbT0e1IvXADrPXYndBNLLUesHgt5oqFWV9iHOl1GS/8Tg4pHf0BJDPOh+5bXGraqUkrXKpc5RLO1X
	q76PphG+K0q2jgv2pHCjV5kSmqj8JMEfxzohJSM4SNLvFVivPUQooPvhwlYVCmP4irAW32RxqTU9Z
	XuN0cKGcmplKskfaLcglMxBy089XafbRff7adqsRZbi8rFqQXhFC5/NhiW9KT/QIMlLBXJF2IMhu/
	/P3s/NTmEIyF1xm9Vbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeR-0000000FoSN-0pqE;
	Fri, 11 Jul 2025 20:47:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhi-0000000FgIC-1DZn
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:44 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2409534b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263202; x=1752868002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcQNf+l7CrEDLiT/8fKsbXFpHxmlSwLjUqKyq0Di2lQ=;
        b=oFUmV79r2KzD0x7EovGMYrQWcWGk1nW1ALIS0jFC0O4/Lw+HPURgrD9qYtwdAzhGfZ
         rmU84XlpCrNkm6VEVUFJBlSppdpKu1q9CJzPxIneFE9YGb1mUzYvlUVZ9KrL9aPjiZhM
         2Z5zSREPu/JOkAv0SYMkXkm7HaBUGuYOaGdGlmg5slDTYUw3Rbq0+H+1p0tVLMurg26+
         rnoOVBFBBdFgYNrTAG3++5u5NpPEQqJXsg7VcF/DVNGlTJH/JcLAo4waacujcrjHxgAs
         og5eh3dhlN2Abr55WT08Lyy5NXMTCyqB6sYGJRC1OuvaGlhKMxKNCDV/Bq5N2IFQ9GLO
         bwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263202; x=1752868002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcQNf+l7CrEDLiT/8fKsbXFpHxmlSwLjUqKyq0Di2lQ=;
        b=UnsQaEiR4CvsIKtQ02imvKlCrwsPpXNxSOb1F+9jLUXUq9zdB1JLHRnsgYRac1YZig
         H9tGG4YCvnIX6wLvD7zhg79O1dHsp86L1t9Jfqrdj/DRkMyd44e26Qmtru+6SUxCMuzf
         YOPHJrxye2Ak+AuoTIojvlxUCzIYjF76i0WaMYOBKyDkFWvDueXrBbXX+6leefoWyTbY
         qV0tmfZ06tsqEGIqOzjNSHqac5GQonS3waChoFyr+qaApFC32+lMJVDSTMNPhHzUuJ0U
         DqHL5jUOp7fphgWDEiWUvaVduKF5qjSkDoY6T25qGgsvOky0R8qyoKAQqLzhSIDlw4JM
         gr9A==
X-Forwarded-Encrypted: i=1; AJvYcCXi4fMSVtOMc8c5h8jpqo+mPx8ltE0I/3pxPvPU1tdSDX1+19GeITBuWUVJ3h8gdQZ5bVa/14KkPVU/Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd7qZRM8o4wUwwVv3p1tlAXrdsXfXQswOCsngfDUW4655U52+l
	CwQp0oMku9wByE9jknyBKda12mbOo9fDWt5sRjaW0E+q+zjLnu3Tfv/bURfazl3ikcs=
X-Gm-Gg: ASbGncuHoF0xkl6i9n8w25Et8MjeYfVER1ElxjBaNNAGV4uByBdbNO1LKRVgRNlXl6T
	n++ilm2DQevWX7uy1Zgfrw3Zhu8O98qzHEeIgSgIwGW57jpyyMkSd/Bf0rxqSKLsxE0XZCBns/J
	z77P4iGPjcescVdqyxRt4BavepZcu2t8pJL1pNAifYzcx6QYkZshO6S8vnfrY1NwTc3RFsRrd7T
	gSAQIa3BiBjDPL+GoO910czYODEeeAtu8mroSFzdNp6Q4GVf9hrxxbhdK7H03DYIsSlAVGufJLt
	cgdivfN1h3bYJ4vwjdmIyTI8XQmRRAfS9G8jdoPSRaxAGc2SGHydYT1rnzAJbIDxZmQP7LuqOeE
	HYU7NWEM+jGITMkc4CW6N3pCLvgGBHLVXix1GAymBHlU=
X-Google-Smtp-Source: AGHT+IHmAcSPrxefr82+UMf9/ikIX93mr+C5rgW4YF0B8S3scOQC4UOExmIhVVKYEXcNj15bTCN85Q==
X-Received: by 2002:a05:6a20:244a:b0:224:654a:4461 with SMTP id adf61e73a8af0-23120f1563fmr7370528637.41.1752263201611;
        Fri, 11 Jul 2025 12:46:41 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:41 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:14 -0700
Subject: [PATCH v18 09/27] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-9-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124642_326026_DF796467 
X-CRM114-Status: GOOD (  15.34  )
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
index 2b14c4c08607..f04f3da881c9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,7 +421,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -622,7 +622,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
