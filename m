Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90CC54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTtinbinfkLc3QkbNd8y7FMetFInKUodODZNKxoa7jA=; b=A9r0s+8qo0Y/Py
	9Vo+elzqU8uo2QuuQ2Wip/3SBbm11JovtNM9ub0csesb0rSKD7rVNCrLTJBtBW0/xPUJ6QYaUSVjI
	VyUCpqRn7AWVFl0Lffn5/JZhzZa38GpSIC/s6Ot1pugUcHLQqrA8BASrKZAOBk+eWGnRcwr8xzc1A
	QudL/4ythdAD24Ijdr10nShJFrBC/H/SyipImVxU1mY0wnO0PbIq5bOz9iyhpUIlq4TQHG7b8YqaE
	woEie/V0m+e042MyIhYL3S2ikxYffYJ6vdpspJ43pt+bV0VudUV60A7/oW0NZ8JFcVKctfv9OjZKk
	1/bnxDQ6NQS7KlDTaU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2x-000000037SJ-1MlW;
	Fri, 23 May 2025 06:38:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0V-00000003024-0glj
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=; b=kxCf8aZa0oO5/h/ivzqPRmSm1h
	j4ZgB8ql80pHHg6PdkUBtnbmcel0DszvRPCn5+egIAhzvXAUezXKDWJevaSU7oRPdxOK6Q6vIMwsD
	64NrbmKx1mz6OsNWDiVfOsobeQI5SwHwcJNXJ7YxPJPj45qnKJpEtOn811sTce1NP8X72w87ScwSG
	bphlhXQzdsoRjlzlhLcJiAjNVZg+GGonwB8964CuClz3ttgxO7bqI/3CL9Z4CqZqDS22/Dbq/ZnNV
	hg6tDDwf0jbSS6KqLlpynvNpDIQhxvl2ijyWELUGFUBG4Bg5gMQ0lO0ox9xcL3doQeAzpUBkNrpBu
	tXUbmiEQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0O-000000018bk-2z08
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-73972a54919so8010859b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978299; x=1748583099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=DZVnCGPaKVSeRqF008EfghCMT3+j6F4707RbN165aDGnpXbfy/6xJbDIDp4vM8ISue
         ops15QoRajEItCR2m33MhlX63KaHLgttQYAfZdiZODTB0muruYGruArDT7xEQ6wxAADm
         nojXtVS29IqV0SohZSw3Vfut/lXUE6qXLJk4ShpmBLEAFuJfyLFv2AxQFwCMyYRa3VmU
         fIK/e4VqmozYTV4624Z1jz1fp4gk7fAeFHYdjZaAMGmDs9scuLtX9FjWnh0PH+/318di
         T33eqDgCZ4VSb+8M/KMK1OedP1DUK0jMoX60GCWGBfGVTtZCTj5lEiLYbuPgo7WNgzGH
         tZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978299; x=1748583099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=fSXVNorjA7sZPOHcHJoPuMBIkWLRh2ievVRT3Z91SlcNH+SgbNv6XP9qFVduJGg9DV
         Ejssazi4sXc14sQ6GLPyGj7vpumGrODB0ls8ihIlH9I9xNjwNh3lSXJOcuHPaGfBt6In
         SUAY1UahZBWQQ79931tu1sPgOKijrTozO7K40NDOBig7xteAXh/mGXwty+lOtQqM/B68
         9fRn/cH7+5jkyi8hJLtI/xfBIBSEjdu5O16C6SLsWkHPKmNSvrp6w5DA2D0lxhhZrb65
         C3Ba0UejyogzlPsYYx9OBVX7myofkCPBxqUvxXGLUbzYga2KIj76vok9zS99MbQpc0E4
         jpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBg4CVlRDyyiwUaKY69+ASXUefxgF/7HPwGp+WBhWw43pCCrmiVx7J8m2ZBSAWXnovMDZy4F+f39zgsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUJOpcmW5KMqZahGFYsxBUGm8mfHUbdjga8eaorACOxkF7DH9J
	qwntCdfT/SQVXrHNx9oHLdz6uZUyCH8QjqH4Uj/qkjFIiUUkDyq2dyCfB1TlY9DI9xk=
X-Gm-Gg: ASbGnctlOnSJ9+pyaeDlq5So6OxDCNGjoW4fuTWIAtQqwUbPcS/03seMnksbi7IxoDd
	jZjtq+H/fGpiaJGxvLAxUPC5L/o1k79A4Q9/xYatrZuvsd6sgk3Fb+awhHJ6k58u0aXvoeXHrA9
	0M9D7vq0whOH9MVd/3E6Tqt0m90QXhyLFA69APq751+ms9xueghvWhsmW+OkGwyXagUqOYuJcRI
	kcaDHuKS3V2x1xuZqW7x4h5v2+R+9gxTjKhYg8qTJcp5LCQDPW2ZIC2bHnkwGHM0TfGniGM9GpA
	DCF0RLbfBxYKG3pm6OPSajWsX0qH9xmnTmIulFf+xu6ZmuQlVDnsu4dmiM6RcA==
X-Google-Smtp-Source: AGHT+IEqqbbYW6BfuGslnbv1XZjKBqrXHXdbK528Ztzva0n5EWuU2uAXzUGqp84UVkK4Ta38abk2wQ==
X-Received: by 2002:aa7:8890:0:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-745ed90b72bmr2802658b3a.24.1747978299213;
        Thu, 22 May 2025 22:31:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:11 -0700
Subject: [PATCH v16 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-8-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250523_063141_802855_E9BFB104 
X-CRM114-Status: GOOD (  11.16  )
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
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f21c888f59eb..60d4821627d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -428,6 +428,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -778,6 +782,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..be5d38546bb3 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
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
+

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
