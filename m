Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D97C83F1D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhdgbYPy537LNvKbDBUEjG+6e3NQdPGlYtJDY0Gwo0I=; b=PzdZSmEvvge797
	dP7fHee16Gpke3vZZ+1Et7ad0pSnWtMrhN5F28aJ/dNUIiCo+901CDXil7gs0y4UbQvc4tQBW3Eha
	Tpv8oMUfHe4zgSGEi64QiGE/DjQg5oJJEarlAGPM6IGNTgqN+e/UCkmCjU8exwV59HA5O5/JSLBuN
	3FlcBr7DS+gjQoueBHP1dR6QPTPLTgUpUerj597+Gffy7lvc6f37CVyDWWhR5oOa13IsJP0gbmVe3
	vBbKdAOlnrtE5HRq36TRL63m3yisrZrhUGjVch/pGCjsz4kNxwH8lOX6uuta2DjaUrIKh79qPfpXP
	GNMvtkyZZjfOMyqHETLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeQ-0000000FoRv-2Nbg;
	Fri, 11 Jul 2025 20:47:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhf-0000000FgFZ-1Keg
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-749068b9b63so1766356b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263198; x=1752867998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6HnUvt7E9ZR93PM/Gyja5rS+Mx2C6I8XGI70UUGCh4=;
        b=2GQBnw6LILTjwK3QR/ckjx/SZhrKX7cM5UiQdR8LvAAcDOzPZnp74wqIGnxqyEPrKq
         lxKvhuGNpHlVX8CFKkeHXGsYjr5G8uMD5cdORK2LUcDKM1VkeEl3h79MYHX0h/ZP5S62
         qDueD1qKvt1CfgYCIbtQEavLmRDVDQe3iVrY7/ZB/Eg2szZpz8+qmaPUbDlUvIQnw5I+
         +PrYL7PoQXD3/aib4aQk1bz08KZj0Bo8qsIt/me9fxitkvjEr3rgWqZCMVwHkv9F0JN3
         7aaGn4o2IYlCwXyRoDJ1FHNVPN9I83ZPbGKrvofrUOHqt/aacGrnNGDkA2c2n+QrvkTD
         DUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263198; x=1752867998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6HnUvt7E9ZR93PM/Gyja5rS+Mx2C6I8XGI70UUGCh4=;
        b=uH9svOLoN0jIYTPbKcB/TP6zsnR2NxP9mAzwv1M6dY/3tWT0VIzikcn35sJzU+FiLw
         NuSPzLc/sQToivR9MyD6k5gGw0LnaC53PVFzmpxVRu9q8uQhh3T+rJsV/TesyzhPnBgV
         seuJQcZAyOKMLevZmEfv/bsezKZaRdBdd8nqjLyNIelzJOms1fqWlJZuBiOCFgPTCKEG
         BnnZxNsTDBLCoRuZZLzIIOjsJReXOvaR5wTHwqDI0971kTSCmdfMH4xySFu+5PKQ1N2t
         jdNUzUUYNQLiy0yfyD0bZFrmsqOuKPahBSLYYrH2D23oAWWPwYowd//6YPYzMnZg+BG9
         48ug==
X-Forwarded-Encrypted: i=1; AJvYcCVs0/XXIP1ApbBriRXb6wF54OnguosMjDVnRr7FuV06vQlc9ohbEkwrdwrYfOnI8ncX8g3glKJ0r4+LdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6Ljdb2s9Du9y4jHlHAPkfcQkVGviIQkCrqokLDUWXz6zKoRV8
	wvQQkemFAFLXwT1mJVBB6pGD8asf7G4c4K9/bq7xRDQ24BEalkiI4OljjFt4/rD9caA=
X-Gm-Gg: ASbGncud7ShXBK7EHVspJSgHWAUe+m1cGPBxALpu5vhQN0FuO8vBzU2a3e/VpDZkBcf
	ZBA0GrKVn08fPqkbv/BLZLyEMATfaS8U0XUQ/rEEwV5N4jz1CkftlJRj1RX9VEosghF63RfX9/i
	+1wEVsb/ElZDRQdzxDALvYvsLDWsJ8lfd6ng9FbrFFV6Tl0VCyL7YTevHkldMHKhbfT5jYOSkd4
	/B2fF9Lji7OXZZJ4F3WHFy84WcAVMzKfnnEJM49iky2O3/USOtveHcZ5iPWfu84ZeG0R9vP5vFK
	zXQqkKIArR0n6GM+5EsYcIZoAQMUYuzmT39M72gQff099TbILSC6RSwXqUpByPMLcP367OX8KiZ
	ViHNsXBeCuC4FtxnJg+2e1ldIVg8Q536PdXUEQ3TzQpQ=
X-Google-Smtp-Source: AGHT+IFCYrgPLco3146TCBfu1GMFnSe8pSiKa0xlExj1KDE2ikj6cdqma/unhsqS+GITijQv6W3rWg==
X-Received: by 2002:a05:6a00:189b:b0:74d:247f:faf1 with SMTP id d2e1a72fcca58-74f1c4e1d3cmr4335399b3a.6.1752263198496;
        Fri, 11 Jul 2025 12:46:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:38 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:13 -0700
Subject: [PATCH v18 08/27] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-8-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124639_363919_74ABCE5A 
X-CRM114-Status: GOOD (  11.12  )
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
index 792cb9792e8f..2b14c4c08607 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -426,6 +426,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -776,6 +780,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
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
