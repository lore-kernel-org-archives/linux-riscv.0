Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C99CCF9E2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYfhBxPpzfryCw5+qNhC9PZEQGs80Nx0mdRBdofQvNY=; b=eTLyQG60bxizhU
	y25QyJeyX7Bj9jaUB7XVvXiGArmu3/Lxs2u6++h2D71/IB0p8r1QEMA9mG6d1ts37sVXD3UkEI/Vt
	M71XXRNErED8Bsc+zBFGsChaure7joQvHhAQPvJX4pTg1q2PxoSFdxiN0hZmnSlceJb2rq4UreIX6
	bYDWZ8Z3O1rAGzJRkrZCzsTy/aEDvKMWWNC4Y535I5bgr5n84pL0Gd5QdzKj7yrHvoOIjPRjXaz9j
	kgyKMUJN96k1vKYU8AWwKF35M+q7XmhtJVhlsU1wFuRMFUpaGSGEdewgjZq3KJ/IzTpc/oiIZZ6hK
	ntxRIZgIKbUhs0/y69oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHE-00000004YKV-0cSN;
	Wed, 22 Oct 2025 23:29:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiHB-00000004YHa-2ANP
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 23:29:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-782e93932ffso174617b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175793; x=1761780593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=fU1C9HsfeGG22RhC6eI0SPuLpvQeMn9j5ZHwquFBRblh/MmqElO9tOjxIBmFHdqzqI
         gkVMCCa/qazi0bTrHryMvGQEYDES191VKTAjLTRdJKcobdW20SuW3rKSXjZf0g2tqCm0
         xD/ZDDl+W2gI10+K7wjqnmgD5nbCQWSYfNoXbCQioxhU4xs+vQMZuzcAmBm4VdNaWSe2
         wCUu/ZpuRZeoP2mQlHu3miHnYoHSBUZIJItNRwi2a4JoUFw1FuknMfIigRzIx7pHoIii
         WLtPXtiq/BMBMF3SIl2KfR2FE8TLfs8cvGP05RA7LXhjasoDiSWgvQO89YO44D59byjJ
         GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175793; x=1761780593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=wnVi9DxftzgQrZrdPt2w9v9/5ocqvkMvRKfxqcphiWxjvE2P4Z/eyYt4evH3qJjwgQ
         Ti4OI7biKwFIMdKhB8hFEYHRuglV0u/WCmsmoowJdua/LsVV1p8yIEDOGkfWQ7o/g9kE
         hEzw/qJCB15DBtFnXiomUNBDgxikVQbF0LmUC6EmFM/ZHuz6v0v9tzFK3HRjTbpqQZJb
         VLkbBQ4TI+cuMLevK6rjpyJJLIBS7EHBqSNIr14Fu8QU9j7cEY3+7Jg2cBJ02uB3kYkS
         AFnNNLa8cvaMd5uUp8zZUcSYVNT9bqVmBUczZ7BxiGd1zf8AYNCAKed9jTvXg+9YkLOg
         tiIg==
X-Forwarded-Encrypted: i=1; AJvYcCV6sP0lru9VKkvfAUNNVITKHz5OfBmdtir+Q6qIFGGt9URaWADjW+TlMD6V53sjEoCqKNC5lsUCONn4OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxQva8KAkMdyLBDTSNWEacXyHE1HpG5PJfslU/slcdAtwADjlm
	F2qN5x+wN9vagx7RSaSoqi3JN3cgBIBXhG8PQdo8Rjo6Z5u8jbnUyTtvzBY5zRAl1Hc=
X-Gm-Gg: ASbGncsOd05nYeOqZn/q2unmY/GAoUlhPOUJMlrsLtQTDoV1gZIc4P6T7cOcR9HKgVG
	L9XOe2Vi132TwrNrPgumMZeQraaPtxAbkzR8sMtm5F9xe4a8JhrgCQX0U75o8rR632LyANRJ+n2
	MDUJ0Pw1UTQuooKo90LMAcL0xBplXJBTk0qebmA+EheQo2vCBvClLA+FGcoEdhkT2J9TSTlh3do
	RwoexkPKnU2xlOZxCoAmyEc9xWHXeLFx0YruT4DIm7IOWDOCJsrYfMdBHP0RhJR6eScw2nnNdSq
	b4LXa7zwfRlgORmGesXKLmO1TDM1YcmTvKmqe2eFMoDUeqk45t5jS5sGGXVTl3Hu3UCIouB+LeM
	JcVt8M5cyNQAopy19efqWp8X0ZPWGsAlKyKdzskarPJmQbuEbH3P5euIR/ZAT1dQ2Zf/FWH8J3V
	dVvkT4DicQ5g==
X-Google-Smtp-Source: AGHT+IEyYaBVYRUloskvUCZ/yxzw7bPY2t7mEI/bU4QrTEjElNpmobT/VekcDiyMNALIqBN5WCBgDg==
X-Received: by 2002:a05:6a00:2e1b:b0:7a2:7157:6d95 with SMTP id d2e1a72fcca58-7a2715777f0mr2234795b3a.14.1761175792856;
        Wed, 22 Oct 2025 16:29:52 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:33 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251022-v5_user_cfi_series-v22-7-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251022_162953_623941_905A739D 
X-CRM114-Status: GOOD (  10.40  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
