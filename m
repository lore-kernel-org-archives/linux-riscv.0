Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97208D3ABF6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlOBgFO3z95wp06uqq+w8ppduw8GBV7ga9R5XDG8Js0=; b=zxQlOMPjMbAyG+
	WN94QOI/InkrGynW8HVGXiTkCvaGO8MSdpeh8UOqG1CvHk8a1LTkwoxP7QYReuaXBwUygQz598hKZ
	OGvmUXaG9EYp1B/+Mia+i6uVuHJc/yDX+2PhgdFuO4h7s8nLzjtN9yaA/EstffRZGXEQliwaiXb1g
	lKRu/uAFp+umes2BzLYv63MXN+cYr83E8rBd/hLKLXGaSngRfVTdeSBBJtDZq+ckarNWdaknUoUdl
	nRjdYcMascb4WzADVv/eB7bpA7MTY8uI7J7RAUHVoCyhD6pkIF8hEEHedNBXaZAI1LQIrFz8zKHBu
	OyQYD0X9rUjjTIfVBpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbbn-00000001Irq-2H5O;
	Mon, 11 Nov 2024 21:06:03 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQ8-00000001Fej-2HNR
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:02 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ee4c57b037so3562748a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358439; x=1731963239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/atH3Dmc2hDWuHIRnNBwkfWUhbP1w3P23HyX8egA5iY=;
        b=EISWNFnrUbLKbXWypsFuE3kxSkuuZb5DoH11SzYsKmBka/vW35MOHFnDgTtXhVYu0z
         t7woPaJjx+I0xU5S07fMP/QYC9ds7nVe++TEO5cuTsMRJRuVdC+kSGu3//KDwAjqH6J3
         Ttb2A5Hv7gogd89pcmA/I6kd/fxaAoFb5787v8NdmiVk5b1izqeiGIixeOyZEvvK53Oz
         Cwmnz+e3y9uoOgWVS+P4SMvpDlcGgCUAjbh+leeXGdJ9+ccLQPUfBKcuvF/RPNiZy6mu
         SUyvlFUVLnIHo+izDy0HSiWNeHkqPbYqMkoG30WoNx7fcrCxkoup8iSM75QZd4/AK/dE
         VaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358439; x=1731963239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/atH3Dmc2hDWuHIRnNBwkfWUhbP1w3P23HyX8egA5iY=;
        b=LKUeJzrVOgNHVXX7yNa8RqjdlXba0VbPCzDcHsYQ/cUCxbvdzGOHL52ylJkrEILXRW
         3L+lKXi7aCDFrbJKg9wZM462qc6GOMpxvpmstnz7yGr5RGYtMvAxyK9T63wTszL4pjig
         goEmpKI3keTDlG86mDCxAiyK0g34hF2CXHk5Xk0EpMuOJb2DlRwndITGglgrWKtGnxp1
         dZKMtGCSkEGQotSQmKvTdogOdpImzALsDtJ1uel+sNZPTrgv9Xsw40y72vh9JPd6SI6i
         zMc/JlRDinoofISU6NbiBXEpQlE8m3GrwecCOzVM5vFv905TUGSBal5wWbf8Ev37Mh2i
         FJjw==
X-Forwarded-Encrypted: i=1; AJvYcCWWhDjMhlh9+mFgElOHo1qecw3JFRPESnGCz5D+LWI4zAWqdTtEC0GZeP/R/cZVnE01MyGUU6ujAAjpVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFBPHDEWQgF3wMLigoL0jPtclE96yC9eWUjsO/oez8A1Cb5+6s
	XvQ++5cZ5gLkaQ04pSUOf4tmZ4A1ZnxjTkTLDjYuoY/zGlLKOKR0HC1iVpLrC9Q=
X-Google-Smtp-Source: AGHT+IEvbaDX9G6RBqut4iScbl/I53KZSOyAqnYCopkb1nPpVHZJcEx6PnWjjFsFphBR/XrDfiSPvQ==
X-Received: by 2002:a17:90b:2e07:b0:2e2:bd32:f60 with SMTP id 98e67ed59e1d1-2e9b1780a4bmr18569491a91.32.1731358439483;
        Mon, 11 Nov 2024 12:53:59 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:53:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:47 -0800
Subject: [PATCH v8 02/29] mm: helper `is_shadow_stack_vma` to check shadow
 stack vma
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-2-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241111_125400_605593_054A2C57 
X-CRM114-Status: GOOD (  14.08  )
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
index 9c0fb43064b5..f17573469c42 100644
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
