Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2DC369D1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V57WOzY0nyi8HOZO70PK/OuSI+SvX7MoAbbl+WcR1kM=; b=x35nZJ3M7P9yD8
	DQkO9JR6XQQn29jnP5njihDDDXMrdko2xujISjQXXGYUfuR7fdOwVqPwxmgdpBt+h5dfbGhQ8NETf
	bI7/rZw1NOwEfwrlOsVp2K2X11QiTOwxs7iCJ91nyOtYFaqokZJ04C4P8Tezk+bjsEF76DazdOl9I
	1h5gAbAcwGwni/pvYgWCoQyqc1dvdvsbjiQrdyhZFmcNEy5D3ohtCP57HSaL//pA3kMJc0sPRETbj
	LlneHadke6r9fO3HAHJ/FhmfuDS21fhRTRWzwmzH7INuWXNfVV20GNIAorbwglYmIYSW/HyA9FIU/
	JPMXk9H3qUdUG2+CthaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qvE-0000000D93e-12OR;
	Thu, 24 Apr 2025 07:23:00 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qt6-0000000D7oS-1uIi
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:20:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224341bbc1dso7698165ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479248; x=1746084048; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ylYFmVRjBQGzrdqcn0JjhMraiDjYmLqBMrzaQkDTLs=;
        b=sR8j3t8KYgPOSFNiR+MqIhRGA+irOtZS+bVNDnKkx5iG3NATxbevU4LVJUfmvZGo7y
         QI+UrcNZgKdN06nJj1IArOo93C8nOAKlyAKagfI4pFvw3ECKoQL5ODWuCD44AUeS3AhB
         FpnSNQQaovk+n0MSDk3W+o2l2hYvoODFvYthD37jQQAeqgESTtIqnJmLYMAcmB6cz1lx
         8Z2Er6L3+KDTHRF2dVUG1VUwa1LU6fhHxJ1MwIh/MiWpqTZL+Ekm0vetls1nlvPyGxno
         l/K9XH23idZmtcSmGwFhdBg7dGlA6+g85qxuT5rGuJ+OwvT/3DB38OPbNB5siRQ6TZxl
         DjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479248; x=1746084048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ylYFmVRjBQGzrdqcn0JjhMraiDjYmLqBMrzaQkDTLs=;
        b=VH6NCtlXAbMgSCawc+3cgirNC3FDAJHUtODAqIiBd5AfV/Z5h2OqOhLGQh1Vn3FPrm
         4Dy8hUxqvjV511Afuhs7+AlSqx6Mgkfwwav6N7zoVp1+hclVK5P5O9IYxpYg0sJ43DJ2
         X6Nlqb6XTa3yeuGKnxw6oWBrnhRd29ln2Sn8KNL1pQva0a5LAMDuHzNWHl6C5yg+91y4
         Vl7NHM6ikXDcV72U8on4QgQ26hTCjwAbO9YvfwW/DL2Y9dCs5rT7gAgiuvP9h65alhcr
         AGFoyMwsI8B2kk6uVwXuPt4Y6p3eTjrshhkfnEl/cm06hSv/RIF9ajO4sZsb2yGiq5sI
         t3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIehNMwMpV451bPzarFnMOCKCEhzqxCagl4AHa2RpJYwntnOIq0Oa9FHT7w3HCV/2t6qY41HxnnfAdrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyacckxKdf61iKzI7JDL6QjCvLi4GKG7tb/+Othk4uD9YdqQI/J
	2iovqppjU6MPSrl5QDPoq6nHL1xX4h2IJZYcvHcDcl8RCLEkAA7a3b7DsyYMVcQ=
X-Gm-Gg: ASbGncuWBzo8DcSolZ9B9ugjfU3Zn0ggpeTdGlj36rgoGlenG7qzWZe9I/r39vj1gU6
	SIZu7dc/2aF2OLY80dbrVsY34of4/3uww6rc4T80gkR0kbN7GgTrBTfCXMik0QShxEq7bIMza7B
	Ux4i1YjMEjn6PlUkgCEMoY0Pa/nRimMLMuihqmL8EEtbS0vvKS4Nv2UiZvpuNtphL9Ww4z8o1YG
	cRV967ZscMUtClTVqNwVG99H2NfHK1d+5aXJy4hC6YZUvhgIvzwySFsCXTUh2DqllEXEmzYroGx
	ITtD8Jsd6W/3SMHr/HT5knjZj5iklT3KumoL9pkPZ6libCo6IYqKzwZgA1fKvw==
X-Google-Smtp-Source: AGHT+IGjkr4vqGGtTUfWepy4/KRfgzZh10ROLBoP0JZSEZsJlQI5sONvd9/5VHsjRNPTvbU04z+xfg==
X-Received: by 2002:a17:902:f608:b0:223:3396:15e8 with SMTP id d9443c01a7336-22db3c0ec76mr25062265ad.22.1745479247872;
        Thu, 24 Apr 2025 00:20:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:23 -0700
Subject: [PATCH v13 08/28] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-8-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250424_002048_503192_89391E09 
X-CRM114-Status: GOOD (  10.80  )
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
index ede43185ffdf..ccd2fa34afb8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -416,6 +416,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -749,6 +753,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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
