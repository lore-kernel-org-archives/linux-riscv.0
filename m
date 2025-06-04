Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86264C5B555
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GOolGR/rJ/OxqfIAj1xSiWBEegfjctY5rz7A+0C76w=; b=CQwCuh883unc33
	6aWdf6HGZROEpFlLchD66KVV+ArliAI75AjpzBjq5HLr/652yVcOgJVxBRxM52SDDdzxPW8XdRhS+
	YAUFieyw+i6KTQE+DJ9gwOa00sfbwXzVbCjDgyBEX2g2n2VtlSPyDr5sE2xRxjPhdM/6yKgUwqxMj
	B9GavCl0r7+D98TmAU3K9cxent0J49Df/fuX6QpOkHEt4VVOJC7hJzREAWjC11LgoaaX3C+S8zz6C
	Etsqv2FaCSoylZNOGt6rGgyOJ3wyiQj2PblXdsctPITHwGTfINldxgkclDK01t5HPwL3nmUQHH90w
	heDG0d47KFMnEqYsC0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjF-0000000DsUo-0Y9T;
	Wed, 04 Jun 2025 17:16:41 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrjD-0000000DsRu-0Mxm
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 17:16:40 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b2d46760950so30257a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057398; x=1749662198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWhABZTC7HgMOVZUdFo2P0cmdg9cGlaFRd3WQ+8L7gE=;
        b=0gbT0NueiFIu1LgTjdy+2BQNd1XCKAOkIym04eobkzzRDCPHYZjVsgo/drvm7oEU6K
         XzlKdTwZ4dlHdpWMUNLAk3xX57OorH3hdHjIGIBBN0TEgi+bIKVHC3uvw4zV9kn/+abr
         LnF9PFk9TUoRVUcyuvfQHzY4Z04wmvjj/BINKpxyemRAgkAowcacj2OrjvJ94PH2gU2y
         J8biy2pAR4tbC2CJwl5LohEsM8TZEg2McfNNu2Js5Nl66AfmFQ9Snp1OsqSWSTp8W8VZ
         tcVZZeh9RvISoQeJjP8YJA9OX2RkV/q6dti55msEBeNmfrjNjjZxq/7/1OcjmXu2A2i1
         JNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057398; x=1749662198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWhABZTC7HgMOVZUdFo2P0cmdg9cGlaFRd3WQ+8L7gE=;
        b=u4IC+qWR0vjHCLOmKAbKV9ldDwryabQfIm5AvtF0jSPDCXJY1KPHnYQ8Ad2MGxvuV0
         ya0liLOS2mgtwuxJX8hT1NAulSzhNptf46ZODhzDYLoJ1Up6joR+78YNSTKt/G/gMPT0
         LlqJqvsnKI/NWAJFEOsa6nhdgvotBM80Vu3/9GMEPpdDvZ9fr0rG/fRl7cGPemRFtRBF
         PykjTe06Eauef14pf+y7ikf+OZvqHuGKjhTykQV5zv1nWXnfv4K0wh0obq8eYlJecj3F
         /MPF/5p45buJKWzRQzl3TUwsdDdao6SYEnKP9TMSrzEDRdlRBfX/Lutkygpsx31ZQG9X
         DKIg==
X-Forwarded-Encrypted: i=1; AJvYcCUOecOIpftQviP1sL3GWZ+Qe7hl6OHog4Eu87BoZwIQ9f9f+AuRPkuKbuKOldKSOffNev+rz1Hu+8Yz/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp3CoN4WQObMerVDz5QBbBO7nZ3i/YFbEQBmu5iWFpRceDnsNK
	V+3QcTkHPDf614CNNoD7UbsyUsoh6Rxgvv1eYgUgpArOCrTsVFHL8RB+Xyfs1h1T6c0=
X-Gm-Gg: ASbGnctCeMMYQc53vqZoZQK39kbtN+GOMpKvDXengfBe/q7r7uY2ce0xdS69SO3jV02
	HkXlrSWuICa/BgUWS+hFa3HFqxrPIcq3YlkCRHHdmfrqtD6DEsRZ9Du8Nff8gBFmzBRfIezJPrR
	Dx3eGu7zGDHK4HHp9X1dnGWC2MmNmj0kkmFEdyyKq5BmVcicz0icTNscXGtHYRj1fLW7RB3kgbT
	bhgzdaMGXqJe152GimH20DqGjPa3beTsL8aLD0BRFRYf2GE+xbPR1DO+BS4cGvJQfzSzpYePSj5
	2viQq9a5LomSW2t4SSoptpj4JW1DLPi2rF6VNN9237E8erlFK+6Std8LRaQ59Q==
X-Google-Smtp-Source: AGHT+IESzgVoI6jsn8EBaGsznchFbfhdmr9dOihFSf5lgEfKGzXoOOTnsQHJIuLLab2X/wZNB3LJLg==
X-Received: by 2002:a17:903:3d0b:b0:234:a033:b6f6 with SMTP id d9443c01a7336-235e11cb901mr49065825ad.31.1749057398132;
        Wed, 04 Jun 2025 10:16:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:32 -0700
Subject: [PATCH v17 08/27] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250604-v5_user_cfi_series-v17-8-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250604_101639_171022_BD1E729E 
X-CRM114-Status: GOOD (  11.22  )
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
index 4ae67324f992..0bedf6523108 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,19 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
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

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
