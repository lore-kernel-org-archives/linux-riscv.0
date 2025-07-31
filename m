Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C348C88CB9
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWLreeLT+/hGt4Ek1pGXlBT1NQk/yYMSx1BMD9tE0BQ=; b=spE76a3R9Sg27Y
	Ei08f+RGxrdy152tk9iFodDs3JraLuwdaPgmg5Bi7/Md4CAvNAFdJc4Vqt/ayTZ+fv70TVb7QY3FA
	C1XfyIcWngOT0agO8T6/X9b6+nTxThVYUcVimMbDY1me9EI6ZfHiGZgEOsDJ4/XrY0yOqXD9KDPJm
	nCQ9ODyJkxgioJwY0q2HOUedZjOysXgRWJwB6hdQ6cyVVL4N74S+Dv1C5hOLfbleQzVr4UXh7cVbR
	RhdTjc4BMbo/SchoozLCoSG6lyDE0pWC3X16WVUrPht5NHP/ZJVW7sGbhZvSJxyiJqkoQfvL5BJX4
	ndlMvTC7N1d57hPd61xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZl-00000004bwu-1PiP;
	Thu, 31 Jul 2025 23:20:41 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYs-00000004bHf-209i
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b34a8f69862so212227a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003986; x=1754608786; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcQNf+l7CrEDLiT/8fKsbXFpHxmlSwLjUqKyq0Di2lQ=;
        b=jWdZVmy56ns9c5odp0clJB6cEmd9pzVUL2vBd9c1U5jnGNGOJawAA2dkMT7g/hK9gu
         +2keCoTUM7UVTkkuEDAaGlLFe+xU7nVgRkn2bGJAOwKP3ojZvPXP16gME0bFzP0kmi4L
         tWKfy5kdEjuG019fNmljIRzojYvTY6138sFvGapbj9+YaMieeFYt0ngIfMqm74r6otIn
         +urpyuFMurnBjZCbkJAT3PPdeN87XnKmVxUJtRa7q6BwaHihImf6R65bD3tHmailbvL1
         RH8QES2C/BYLXy/Sayr/mteAKcc1sJgZNZB6DdyqL0TokAeZtXeW3+PwULY7IiLaridt
         oz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003986; x=1754608786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcQNf+l7CrEDLiT/8fKsbXFpHxmlSwLjUqKyq0Di2lQ=;
        b=ZagjD6af1UgIQj711RTLz/NCKWZnuLIe9KnEx/thCCwtJvZWHHmxCJ/giCbH41zYXf
         nAoWXuOUNqShjyx0gFtC4CqVoKdFfn4fYpvRTTpDgZOSBTpwZpPBbXktAj/mzTauI1RA
         /+52VXKzom7TbSMK1V4vGTXNekV+5YeG9uHsk+W3vt/tR2jIR8h77ysJxMvGWjNHiAoS
         tTHNsNvo6G3gsA9MS5EeyGaz4PJu18Ry10mkrVLJr0MrtiNiYv9DMSqxo+Kk1/BffE1w
         Ij5paIYFsGUOgE6AgO5iilTJ3GLj5VfhWcOJBf6QnKnp6FW6URw+rasMEIkKuuQ2DYwf
         qd6g==
X-Forwarded-Encrypted: i=1; AJvYcCVOxgXZGfJyGmuK+r/1V3ZP04Z0gdN8arlMyGAfKUGDWrPU1o2BHcV/zLbXXU2g5IQZx7aiISWMppnCdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTk0P+bFRQ16BPkW/TpPJFSNRmUfrjs4UQObd3nTQLLEZwgcrF
	X+mbg8nP2XlgL01JeegEdxkoCKA4KWctuadp23Ozz5BdJHK0EUgeUH++fFBHwFDiHYs=
X-Gm-Gg: ASbGncs3aNEOps/P7Y8Jg8kLF6tfc39Bnyk64KXNY10KxRSP1L/LHYtYZLALEaqVT3+
	Ugp7L+3s3idOo6ly1yE6gK/fZ4h3AiyVi/Clg4JKCCOhjSLdCB7hHtNDo6kWxpmPc9Z9mN9UBJS
	WsQWuzPTE2qg3IcP7Z1kuMKmLl0iNjNcjfknAOp4GNG/QhKgD3lWFSYahW+Togc/pO5/GDfIpHA
	6UXbx2PIAUaIph7jFRKkS16s++KaGdCkpZv3ms7wWHFcMsNVgb6k2FWQut3ZLAq6Y9ar2rdYqEy
	3CJp1vzhcCU+zr0jtRAXHgJB3XqEk8XjjSusB7c9rUhr/b9MSPGeHoeVntneQSky0VJxnx3ueSv
	Z5xINDChsKrGKagQ/9YEflm2zhpMx2A4r
X-Google-Smtp-Source: AGHT+IG8ZrpcBM3q8FKgO6zVDJahKZxTWTdKtWExGJVc83acMzp6RQIhGZEeMfzbTsLImUCGugdoLw==
X-Received: by 2002:a17:902:d547:b0:234:8e78:ce8a with SMTP id d9443c01a7336-24096bfd5e2mr130518645ad.48.1754003985662;
        Thu, 31 Jul 2025 16:19:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:19 -0700
Subject: [PATCH v19 09/27] riscv/mm: write protect and shadow stack
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-9-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_161946_525151_CB7AB9FE 
X-CRM114-Status: GOOD (  15.50  )
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
