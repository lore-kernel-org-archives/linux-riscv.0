Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323BEC54FB3
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E336lkeLuxLdqBlNVKUmlqkRU2UBo3ExGA4o+HW/PjI=; b=rdXL95dMdHoGjF
	lt4rYC9Qw55jNi+u0HLJ7DkU6Gmi5pP02YqCWXqvKySmoRzyq/8j8ExlPVY4zkpZU2SMMfLyzXblM
	r4nGFaOOTyQ/E2KgxYNSfW6I4R3cwYSNfSNZ5XS/A4w5aBd1Fmn1TXkCigVXJt9X8Kk0vmWuB3Vx9
	SUgQfXweVbLv3FVj6CXOPoccfBv6Waft6OnlSOg+HEIVeDVXJ8SnTcC4a2aPdrO2I9NeCE56hY/n8
	3s9jG2bKFMTBf1UFvycpk+69Y3zpd6F6y0uxD5q3lzBTlv4OY266TxViRkhAPqBM742Uhj/Tk7n60
	pgXJxK4SckNUYG3LTIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM2y-000000037T9-2Owk;
	Fri, 23 May 2025 06:38:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL0Y-0000000303d-0ZFS
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AVtPpZsBp35I8j/rfgdnO1rM6soG7ylyhyg8tDYaRNI=; b=Do8qgUC9ADiT2eKfrfsw5/LdBJ
	RXCbFQa0Mdf4Nj9mfU8vxNBa/X9XyLhFnDHQ628yy94ydbwFkPQlk/WJwhtTNXwRkGrY2DvL+2Vii
	mLQFnGV6u3ivH1iqfWtTL6RI2kMRy93bwAAnQEWTro8j1E6u1vFoULXUr/FH1zOp4z/OE2GH/NNoB
	EkYtsyDg5GwRfjJQXCR+5LYNP4Cqd1w3sMjsxEH8zIjmOuD0tSuEws9OwuVAWffoaWq1KwKZOFznw
	enIWLOsSe64fjnp/p8QdNmqPqomcrlw3mzoNgaFXQ2WBklYUiKj2kZYgQBMff8FQT+zG1XhN4L3UL
	dKEfQ9lQ==;
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL0V-000000018eE-105x
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:31:49 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f2b04a6169so97954676d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978303; x=1748583103; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVtPpZsBp35I8j/rfgdnO1rM6soG7ylyhyg8tDYaRNI=;
        b=uvRXHw9P7u/RzrJptiKb/BGdwDkKxdzA4e0VoSwfafs6poHK/qAOvcuHfj6r4yqUCH
         N2T8TmS+OLKYzB2A8G3HbZEVpqM8H1kSrzLCZ0E+yYXHTgQwlAOeLDGSFHexJaA6wAZq
         Ql3pq/bn9iGRJP40AMPqow/ZOSmc1+dLP8QMN920m/wPZ+VbslfLLzZsnbUD9W6P+G/N
         FvkpJ2SHwweBSGsfuUkyzHr7+j7lORkWme4FoDmf1b0m56HZJtXeGaKghlbvWCLqNe0/
         m2YoOSielBYPa4YzJhV8p2wnXc+8qHaUyXg2DNoqKHal4bGrO1zGFIJQzDVfb3d80F3u
         w5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978303; x=1748583103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVtPpZsBp35I8j/rfgdnO1rM6soG7ylyhyg8tDYaRNI=;
        b=f/ZOAqyjLnVF3jlj0jxrjao/L3imoab/Z9XNDPyBAAuJ1h/eEzQ+hvVu2Ol53dMqDY
         uCzGVXxzeacJFzU+kNvN38Nex3BU0YumuEYKjdxyvNuGs2ScwDVZTw3Kca1UynZDPaLR
         g45tLx+j7g+e4XISwSPxJkAuJ8uvxRdWKuVU7QN/EBiDRZhAhWezLKMqdf9VbBsjN7n1
         5e7C63JRg2+mYAXTG5vNnjZOyXKKA3ok3EHWwuToaUtBA/0W61mghZLH+1/1wEQIhazR
         H0zaMak8c44qDcnaQVsLJKM9fNvaSiz4ZDkELw4oKfWpKmWpxGshCAl+nj+OxUja3DW4
         IchQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbv7Pd8PmdVivD9RGa22JB4p4rNk9ACyAXGDqXgiLKocb1n9VFnYVzXkjFa19UwDRLAMpxDQK4SYNBpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyfT+te4vcawkcGVziv9Dvvoe3rn96PX6b56UL8HwuAOlZZjs5
	M39PCSryZPeGFgjUR9wddhX8gOT9f/Dnr1zpQcjmCWTqjAdJCenTeUXMSK7Te9ZwjL8SAqpepkK
	LmcaL
X-Gm-Gg: ASbGncucWKS4w2aZrqQ4g6hl/lazMVnyd0IBLX+9kXF53cNnosdX+GXNMDMqaImSvrl
	NRZK5oz5exMuqAGu2RNPUS29BmtOGTEm2R2W6N8RhtxSKukVmfJ6ZUQbUWlKnNjYH50gfjIP7mw
	h6C0IW2in87WasyE3Te9IkHjsIPvuINewr+9m9FjLkHfJKFWJUVCuRA9IHljQTPfF/Bil8z1g1s
	8UEhkOtPuiLBGFTIN9rLYSu9on1JrMpVw5OJ73N73HN5rQUI4QIEd205bx7UJeqxukp0samPZNT
	8wo98uWRx9fE1Y8Qor1miICUTup1u2gxXIJ3FtQPfd8FMTZKTdS6nXVX51dJSQ==
X-Google-Smtp-Source: AGHT+IEOypWX7//ssi7qQS+ETO0BE4EsruaAicARkVS4DbSv+zTLhLCMHnWnehtuCzliSTnEuuY9vw==
X-Received: by 2002:a05:6a00:4091:b0:736:5664:53f3 with SMTP id d2e1a72fcca58-742acd522edmr31996458b3a.15.1747978292784;
        Thu, 22 May 2025 22:31:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:31:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:09 -0700
Subject: [PATCH v16 06/27] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-6-64f61a35eee7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250523_063147_490037_657C5934 
X-CRM114-Status: GOOD (  20.64  )
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

`arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
This is to make sure that any existing apps using PROT_WRITE still work.

Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
encodings for shadow stack. Above changes ensure that existing apps
continue to work because underneath kernel will be picking
`protection_map[VM_WRITE|VM_READ]` PTE encodings.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 25 +++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..392c9c2d2e78
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <uapi/asm/mman.h>
+
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+						   unsigned long pkey __always_unused)
+{
+	unsigned long ret = 0;
+
+	/*
+	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
+	 * Only VM_WRITE means shadow stack.
+	 */
+	if (prot & PROT_WRITE)
+		ret = (VM_READ | VM_WRITE);
+	return ret;
+}
+
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 428e48e5f57d..dba257cc4e2d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -182,6 +182,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
 #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
 					 _PAGE_EXEC | _PAGE_WRITE)
+#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
 
 #define PAGE_COPY		PAGE_READ
 #define PAGE_COPY_EXEC		PAGE_READ_EXEC
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index d77afe05578f..43a448bf254b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -7,6 +7,7 @@
 
 #include <linux/syscalls.h>
 #include <asm/cacheflush.h>
+#include <asm-generic/mman-common.h>
 
 static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 			   unsigned long prot, unsigned long flags,
@@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
+	/*
+	 * If PROT_WRITE is specified then extend that to PROT_READ
+	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
+	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
+	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
+	 */
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		prot |= PROT_READ;
+
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ab475ec6ca42..78b27164bf83 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -375,7 +375,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
