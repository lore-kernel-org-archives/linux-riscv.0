Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC15C3ABAD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTtinbinfkLc3QkbNd8y7FMetFInKUodODZNKxoa7jA=; b=RwLhcPkq4cDP5w
	ysDN7sPBjMoIN6KZYe+ZLx1aeHfgj7Pshes2TaXjee+IC9CQ6jJyHew+t0zAo7RPiA6hjQMak640o
	bAPlUgNZqgn9sI3unnJLHjeCVfOBg2pW7ZS4Qa8ZZvDV6SMGcc42A6q0br0ooxUGhrFOg8SclpNMm
	1n4Of+CzIxalaI9WhnEiNC38nOGUQngdWTL2VXob/2gvLDF/LHF1swA157+f7FK/gcCMgvk1wlf4g
	gTroIZqK9GwJYpTW0mPfZmLDUDkXgaaspfnNBfltJ4u8Mohh1ButVqG1rnb+Tg2w4YyjnLgIOA/2p
	odsUbtBi/SvcG19Z2ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqY-00000003EXw-29yy;
	Fri, 02 May 2025 23:31:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzqT-00000003ERH-2e8A
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:31:10 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224019ad9edso41142465ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228665; x=1746833465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=uMeNwZEzUy01PT0huatqd7dj4eT6qQ8WEAi1hhUZRwMPbfrgn+1K/Rw3HzoC81weOr
         DKsD65Y8qx+9E3BfyHEoSxRQKBq5243xrN2UM/JO7PhYeB2HlzCElMi6dWP+1Jf/P8bw
         UK+Q4dcxv5yhQR5JnZHjJIgEMhdHt8E28UKJLzI8UZI+K6M+tURP1DrHx4PCa72Kk3zu
         hVWVHdh8V5sofawW5ZYTCW8ZrdPID6NewISh4Vd1swFNR+mpnNYQ9rq4bCsKmpxss+dr
         qZuGHdXAtnlQtt5sB6ApbpU+n3y5wR2TYd4HHA7IUPMsIdC32OPTMgeSpxm84sZufT1/
         2Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228665; x=1746833465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=uHKratOyAT6O+t/dMqFiI8x1slyEK/3XCECx26/5dA4ft2kUF85Bi2ftZLiVfDq1NV
         /+xGhidi0gOMwKi9K6salweakQNE1eKtSa0Pqw8j9lopH0EzZpFWO2pPBZqfeTqbe9Vk
         d112g3XgvB1hJVEVBXREUwf5wCyY1GcmDxq9bddWk555N6Xjqc3y2iaN5vYNh5rrGp4H
         bII9v2TiSDKHAshFlfpkayVAH3fn1Z8LTuy1vTx1wTE0pdzNAjj+GYQQxxX7Swi5Uqlg
         g3E0wuTzrOuMMDms4ngpQbq5oczeB+racFBXhVUZ8yOz69bJ710Mr5oVXP5/gomSwON5
         Ocsg==
X-Forwarded-Encrypted: i=1; AJvYcCXLf68sbCxTqEZIlH8ZgNJB1Tcq0eu0K+As1x/JXSzcabg1Eys6RnUTGARcwoNU2G3lHoE5H2uv78pbSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm32ehYshpSFsDS7YEZnikkxV+/lzJXoZ4uHPdtIyl4N7bdzrv
	QSB3LmAnoJxl8haALQhMO3uPZ0mE3UrVSCjYyXUXp1moQeMoIGQR/3bdFCCDuvE=
X-Gm-Gg: ASbGncu2yNkM3yn5vT4N3t1j224ZL5iMyGACd1JQ9/blhZQ+rhQOL1TZLJ5GLkmxymu
	ZR2hRO/32QmAOfscU1oG8JhVLju+usgfzpFIwcaq7Td7jZWjHIcL7dSRjXjd3tc2rQbj+ggmeVI
	tb5qADyhAsGpb1K4KUFJRpEB2Xjpj8RBJwuy6J5McQJrpqDzkN6/1PVHpTACk409c/iKMliXxcu
	jSdln/iZXDc3O6fjwKqQFIX1VBleiHDpyj1gQnlpsLpmg9dJVazDBIzjbNxXYNly8QFMQDpAKw3
	SnuLHlLHA9Gp9AL088kNfzUbK76QD6u586rQ1cfWh3VXLqQ+Kac=
X-Google-Smtp-Source: AGHT+IGp2tIgqPIeVL1fUnVRzrlkiAjbLccoy07WU8cAzc9KMNqyou0HJrBg+LEQJwmT2E1+TS4a5w==
X-Received: by 2002:a17:903:41cf:b0:223:501c:7581 with SMTP id d9443c01a7336-22e18b99d5fmr14703165ad.16.1746228664986;
        Fri, 02 May 2025 16:31:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:04 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:39 -0700
Subject: [PATCH v15 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-8-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250502_163105_682981_CD62BF02 
X-CRM114-Status: GOOD (  11.25  )
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
