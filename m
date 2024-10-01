Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D57BCEACFA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/2OWOTmMMxumpM+SiyMosT08VugchrIYPwWQ0h1fPo=; b=pNEuPmT2RCzzNv
	Xr+o1b9kvZnaTaKK99/aoX66eUuxIbFFDOzxzB8Vl40pWoSgpQGRU1L32LcJgIihh5I9ADHV+nyJ3
	nlE8+nVFLYdA7Gq67Mh1kc9W/j/3/AQXTQ8ybnce4xTmEbLQh0IDY0ObgLINXAFfmRW7+hR/mGxRX
	lHaJsq2KwYooCwAWHuEHaYvr39j9qHsIN8qbG/2i3qVE9tofTTtWy3tmudrP+c73Ylzad47/9EbH1
	yM1YwHrVjg5DLuPm7wlIOJMlQPiwlqC5sme3I+9+4RmefDgzbL8aqOypCSkD5BO+FbDFxOKkgOxVq
	qgGTY/GCBG0/ABRU/Qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgij-00000003f9x-17Ud;
	Tue, 01 Oct 2024 17:31:33 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPV-00000003R9M-0HSK
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:39 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e09f67bc39so4696206a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798855; x=1728403655; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6L9CXOfGC8FGkDgNo32YOnEr2hJuvgG2CDkhLFheFM=;
        b=Iffk+H2vNfOW4vVS22K04B5XpQhPLe3q3ItJcTPiMqTqEcOgJYpxpbnn3zpyUsuAdl
         WpDCs90cnJzLjg2dz6/1NWu00CCuh/1LSMv79uVsTApdrneCumGRvurO3JDoC77FRIdA
         9R+ipvQxZtxXI8vFoXNCPQ0r4ACcQlm/Znt1ga8JfV959R3EcoblBiJ88mUjoBEcGSYv
         TcKFUxqTsH56QXNgm/cs87rxPNaprFE3vrK/DAdARcUlaY0gZfUx/+syHZCa1jlNwQpg
         6hNncwYKExTI9Re17Rmp9JCL0ilVRKVjWmr/CIye3E85qYdhV5SbH6kZXg16ijErByAU
         eocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798855; x=1728403655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6L9CXOfGC8FGkDgNo32YOnEr2hJuvgG2CDkhLFheFM=;
        b=Pz2MPniFO311c2/bfgXtwZmCrTCFhEPbGSd4yUFvMT3rL5vuUbb6xmYasRbAUro+uJ
         laPwPNpqecZy6xBTVBhFE557dsF2cJ8mNarUYGg79D0hWhqNlH0pWNlfuKDLvhw8QzQq
         CNCUzkKagS8bImW20kMLvtTN5UONP1T+/aOAolj7wr/bXS8SUF8o9KVQlyrbcyF3DcDE
         VjDG8v6HoRhS09NkpOE/G746gjMy4D/en5x1tn/MqWNMre97aUH9vV/Cg3IZR3ObajUW
         x6IUlHAUxmD/G3GPh1aP/4JnJUo399C22xcp1CtSS+NAKC7J0j4Crj4oA2Dvtr1gi0nZ
         Zjmw==
X-Forwarded-Encrypted: i=1; AJvYcCWk20wW1RXCUG7a7dCG4OkiZExV0W5KHCFHPYKBiL/u+Qa6Rj02XE9VX4iOfcLfTTLXCBMtBfSy0AH5UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmJnBDqgiPf5RipCYadshnF4/Trg/S4ig3konvmoi0baz5OhzA
	VQql2Ouqm8WDpjGQhxFGsCT75ssky4U5ccSDw/EZpQzUXgNB7bZZLKSw1GBgBJo=
X-Google-Smtp-Source: AGHT+IF8xhnYD/pqfXYfj6NnlMKMMkkR64MiBO6DNyNWgrVcZh53ylTJhkG5X1f7jZZJUwYOw4ZShQ==
X-Received: by 2002:a17:90a:77c4:b0:2e0:74c9:ecea with SMTP id 98e67ed59e1d1-2e184681664mr241500a91.10.1727798855416;
        Tue, 01 Oct 2024 09:07:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:18 -0700
Subject: [PATCH 13/33] riscv mmu: teach pte_mkwrite to manufacture shadow
 stack PTEs
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-13-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090737_169197_19018368 
X-CRM114-Status: GOOD (  11.61  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2c6edc8d04a3..7963ab11d924 100644
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
@@ -738,6 +742,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
