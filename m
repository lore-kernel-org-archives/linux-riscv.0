Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71741CCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QvtxightdoH4nlDF8ffGe5AWAG2kfD0XCcF2iJcA6Q=; b=TGC9er0setnD1C
	c+lTc0++SvV9nZQQstm5MXhidJ/fbcHDcFxT9O2Zzh91iPZWlpvUGjBBDPX4EMQl8qdtEZeGm++mG
	N+HJZkG93Gpe5jleu2paukMhPANFbL6QBggS6eKBtQdEP+B3dQPcIC7FVzkaLUNi/DwhAEVKsns+x
	/ktbisuDsNqwIFqTY4ezNhndxWfmNMfmMPTksMlM8bu7yESY1Wbv5SnQpoRXmyNJA5mpgdNDn23oa
	YZJ00sWpZ09aGd1BTMAf8pNwEX/SqD8RjyHEQ94+Jh5hBMPTuO4U+zCag84Ce8Y+BrhF5/s/R0YZQ
	kqYjLT8nt79Xnrh4seFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWh-0000000EabH-3C70;
	Mon, 13 Oct 2025 21:56:19 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWf-0000000EaVz-1Fjg
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so4134324a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392577; x=1760997377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=H2zD3gqoyAnNfF7akG3zVSeOaa06RwVgx6QhoqUoBxGEaDE8tG5FD6n7d8hXJWgGN0
         agPwcRuhMj5EOfFFFFDH1KxFdkwzoBKe+5jvxG8NjFCVh16x0FufaGm4ei3NfkQKmNrB
         tT6TZnj/fAf+43DVERbU0s9kvHIQcMUROjw2t6KItsDNKQqHSxVt88cXmu/R+KwxSFER
         2dl/koex4I4CjgcOk0DBtSqVot8bHcrw+XiuDf1w3u7wu/7zP3z0yX69BJECkc4kAVks
         wjAOku5BW94vvuEI0/G6aFrmuksXyMdRpqDux95wwEEYkuA8Wt0rIMXjOoofui8SPY4F
         d4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392577; x=1760997377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=Yz0NReyI3W+nQxlxCIDqfNsO13y56l1AaL2Q7/pyXmAk1akHEut+hCo9WvoG+zOy+a
         S6pXQ/4X4z0Mwu+gKuJd3wpFdMR6YBQNFNNMINRJtmBoGHr/rkMHap9buody+KdXYP4B
         QSfFarSZeYIAVN4ggYSlpD+9iJ9hLSU7S48mNbflnJ78jnKINx2glrYuZTGVCf2QXLgk
         VwX/WgjWlz6Gls7Q9UJ5QYLL/VP/I+7zxVEx5ANOAJtNzfulkPyZBbLIusqhDVo7iSpX
         9GPERqrssEDJJJp/KKoBuG7c+G7aqNRdDiTs6ov7ZfiCqEn5oNPn1TLNEZ0CLt+NjqxC
         s+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX7zFbZs8DsoJgFlmowwAxyFW1kBs2ZByt7VhjeqQbvpGhc4E+oiLE0eshKk9x8cncj72ycrI473nuRpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXmNyMxhp/XJ3Y4qFtH4SJTI3jGaJWjN3HMgnpHM4/hThtxvUY
	6Kt1sC8LuUJv9CokC+nF8/jdBnt91Fzkez/f4xh2A1bs9a2c9Q1vFRBl9vr2DEIAi4A=
X-Gm-Gg: ASbGnct2q8PCTrozQpYpS+7LnmrYVc4IKDF8rJ/J7rXLKhiiTc6lsP5l8swzREgJ4uG
	ER/Qnbj/58BIu0C0sS1Mmjyv7DZUG3Q0uQ8LgGOZCoZU+OmfsWRqF6bR3IFHAgqoyS9Ywzdmrdt
	EoKF2vWoiiX2pVqWxxQl7zsL0bUc42i4SuqvyCIfAxCWcUNwkI+5n5zl+OTaAbsblzYj2XeW5/o
	eOrLBnLduR61FRCt693fooEckyXpE2pxMzMzWkiVMYlml6EUbVraJtrOr2otiB84xT/paU6ja2y
	aXLspkuC5G+uvVgVkwLb4Wea+ZzT/zLaw8Ef8rqev1zTPL6pA+sb3zwQ1UAdOXyQ6Yc3YH8UQZB
	m1ytNrS4wMHASUrvyBg+RwKILaaT/nAc/FXAPgITEVIkB5XxMUmI=
X-Google-Smtp-Source: AGHT+IG0kvBEZL2UesWt3Zf4jl6C+rIEnaQvMgWf27eK5kYtzg5PKWU/1867wQV0n3ggQ6xsWgb06w==
X-Received: by 2002:a17:90b:3512:b0:32e:345c:54fe with SMTP id 98e67ed59e1d1-33b5127ac29mr31362526a91.20.1760392576576;
        Mon, 13 Oct 2025 14:56:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:00 -0700
Subject: [PATCH v20 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-8-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145617_363139_D6022FD6 
X-CRM114-Status: GOOD (  10.97  )
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e4eb4657e1b6..b03e8f85221f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,6 +420,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -765,6 +769,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8d..17a4bd05a02f 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -165,3 +165,19 @@ pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return old;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
