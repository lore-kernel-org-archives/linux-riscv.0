Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00AAD7494E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty+k4Zpz5HDV7pCJVUcIRU0PIwro8XA2EqLz4Sx3oNs=; b=i9WkmFMHWTdxS5
	8ytsfWEWy/IgPv6Q2AKFp/YF4J2KeeX+8tBYQZ+s0bSEvUPcXEw7LwVuexMtYIiORkOqqiT7QZTKt
	t+R9+kU1LhnigbZeOdHIDi/JeeHIHGF9/8ZHAI6vEj7MVIxAeKMdRfiY05jw8I5AGIxjZ5HkgTzKU
	YX7x5c5NmGZaq899Oome6nmSOBnfj0YTGO7mfNkNtiHzOVThUWqVL5uxye2+BQ+d1hWAnN2URpPNF
	J/FAqB9mdf4w3YE+53cg67oBUDNdBNdZTMZsLjMmFa0c00iNc9p+6nrd4Ir7tc3yfRzqvd7su3zz0
	P4Jz6WECEgpOtZ2fSJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vsy-0000000GDI8-0Ery;
	Tue, 29 Oct 2024 23:44:28 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vsr-0000000GDCq-3sbN
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so4029974a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245461; x=1730850261; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+Jub7HVMuRDhaa+pd538ONaRqIx67oBmBuHa5UsgJY=;
        b=ty1EHp6DGx625pvtlwKNmwN8MgrXzAgYQ9MwZiJGH5TQBdO4viVFO2KaVPpQvWnhw/
         Nty1rz+oNKCHbggHyH6TGsdLLcxGsulZD5q2osVMo863N4N5YsG8iquPnvMQxTdp6zDQ
         gAUhNpLi8N9U259lzFT6EH6QsLw4ziUSNNFyy8IclLqQc1Fzc8dmxVdEmiFc/Qmn8XIo
         ewhPjscWjdxaEvvcn/iEgRHSvGpBpn9+WAD4klAUPYBX25yKDYDMQBeWgbQgEevja2XN
         GZDXwLiCkGUW9OrIr3mPObKluViqmPJmWZzN4Subt0L574AMLLd1NujA00BhTUNzra3h
         gZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245461; x=1730850261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+Jub7HVMuRDhaa+pd538ONaRqIx67oBmBuHa5UsgJY=;
        b=G5Dl2cMjApe8g/e2QQTK58HK24dCLFie1LcOprrLKmmVNWzDe+mF5xJYTFVOx4j93t
         T5eV0W09FNGbTsS/omUT5haqzTX/Ef/5wAk6ViZQLiyTAYlpw9b/5BXCZhX/Xh8MNCbv
         i9FkSSFM1tm10DI1yq2H/hp4ujyVl3zLtOQM2F51mOH4u3JBBVM3LbafwTyVp3NuTjFF
         8LzGsxD3YA7ZrHKkeIeIulwQalruxFHWMhY9Nfb0eWGwMtwyKLJtfhdyNe3mL+r9g0p/
         MA3cBFqmJjA+zfhkj/GFwrvCeztT6gEBl82LgZCAKsLeZAScAsD/8V0Un3ZyhYYN7LeD
         nmbA==
X-Forwarded-Encrypted: i=1; AJvYcCWc8/G9X9DPj/ypQK8b6ELS4Zm+N8V4cL5dENU+uztaOdHtnw5MujPaX2jLKEr1wVhOcZPHRrRkkxr/Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwebtUrPQQ7uUT3cWlVuUpHzSLO1q3EfohUnuqgOGLj0zIEbqCg
	N7lhGpKtTEyKM7ocYD8Lffq9mOGajFHLYmk/Xvk8OZ1XxCgfrT9A9fnp5heCCZ4=
X-Google-Smtp-Source: AGHT+IHoPlZyTKRFIXDxqY1vxKZ9N2lRuciBVtR3dVasMoQZpZgRn99fcKxS5v1VlmJJEo1cy5cChA==
X-Received: by 2002:a05:6a20:2d0a:b0:1d8:ac0b:2f63 with SMTP id adf61e73a8af0-1d9a853aa7amr16243300637.47.1730245460885;
        Tue, 29 Oct 2024 16:44:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:02 -0700
Subject: [PATCH v7 02/32] mm: helper `is_shadow_stack_vma` to check shadow
 stack vma
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-2-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_164422_060276_76D6530D 
X-CRM114-Status: GOOD (  14.50  )
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

VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
stack). In case architecture doesn't implement shadow stack, it's VM_NONE
Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
or not.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 mm/gup.c  |  2 +-
 mm/mmap.c |  2 +-
 mm/vma.h  | 10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a82890b46a36..8e6e14179f6c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1282,7 +1282,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/* hugetlb does not support FOLL_FORCE|FOLL_WRITE. */
diff --git a/mm/mmap.c b/mm/mmap.c
index dd4b35a25aeb..0853e6784069 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -708,7 +708,7 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
  */
 static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 {
-	if (vm_flags & VM_SHADOW_STACK)
+	if (is_shadow_stack_vma(vm_flags))
 		return PAGE_SIZE;
 
 	return 0;
diff --git a/mm/vma.h b/mm/vma.h
index 819f994cf727..0f238dc37231 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -357,7 +357,7 @@ static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
 }
 
 /*
- * These three helpers classifies VMAs for virtual memory accounting.
+ * These four helpers classifies VMAs for virtual memory accounting.
  */
 
 /*
@@ -368,6 +368,11 @@ static inline bool is_exec_mapping(vm_flags_t flags)
 	return (flags & (VM_EXEC | VM_WRITE | VM_STACK)) == VM_EXEC;
 }
 
+static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
+{
+	return !!(vm_flags & VM_SHADOW_STACK);
+}
+
 /*
  * Stack area (including shadow stacks)
  *
@@ -376,7 +381,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
 }
 
 /*
@@ -387,7 +392,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
 	return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) == VM_WRITE;
 }
 
-
 static inline void vma_iter_config(struct vma_iterator *vmi,
 		unsigned long index, unsigned long last)
 {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
