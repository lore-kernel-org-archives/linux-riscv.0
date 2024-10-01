Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FBCEACE8
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i79LJ27Uea0KZKe/Ib2zx/+RwY4Hy0Pun1gNhk0ZTrI=; b=WyQv3fVhBh2asQ
	O1A0OQLB7QBebanvQ6js7KiuLc906uggmIXL2DKwY2FvjoPG/171k6oNuvFKnJ5jMqYMyclkiU5Ub
	e7DQd8Hvxj6ZankIvy1KbBAxnWidYDSvq3riOwNClM3uijbk+PHB+Io8SdAFSUxPE3jvT1WXeUc+t
	BzULEBgZT+42f7T+PHtW666HYrauHFxbpplq2tFsV8r0sDAY+vp3EOD5bWK7X9pUvCNcQn3x7cV0g
	f2kIZNNvBI2343DrVFzW7e+VglCyMw0oE5ONq/7va4glmp6F0tHPedpNzc/uT3WW+EU60cav39jBP
	3d4xl4gEVu8LX6sVDlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbh-00000003VU4-2sg0;
	Tue, 01 Oct 2024 16:20:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPQ-00000003R6C-0ehe
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:33 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so3149032a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798850; x=1728403650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf2x3pfGFzhqVTB4n6XHdAtkUN+75WMOXWy8ywZVarA=;
        b=Iey8Qiye9y/QePGtB5ybGbKb83WZY4LsUUXuhMiLWY6BcHfgkv70UbrAAujn8QiiE7
         EGpdylEno8GVT4VuwSwHkLRFs2Xzus5UoHBr73G5oONKjKm7F8VAmJax392Xl8qMfYyX
         1W9EcvMdZVwPkAIXxYl2k84ruonhzxNllRj4CWM8MOKnPbOn+d4BcJ27ZZ1wokHLZ0Fq
         7xNsVEzSoQXxH5O0hf8Nop2nmFjQIbiverfmRnYxvjTrCkrWyMzVao6L9aDWcvBASlZ7
         1epmPQhn8iUr0cF/ApZu/j8xAKje7G5VsBPkiC3xxZCUq7csgZYdlQEbHT3wh6xaoNHL
         etQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798850; x=1728403650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf2x3pfGFzhqVTB4n6XHdAtkUN+75WMOXWy8ywZVarA=;
        b=d+3hMUV6zvMdCprBvmgHFU3/2yJRqQJEabjH0v6EqPirMv5vCYVZEM6sK6USRiehXq
         QQ3Mb9AXzu/XnQ7jSwlibhbWPe+5q8sr0pZky7/GT5G2w41nHoo5HvKhnEv+CqFBE7i0
         UYi79YZJPg3dcoz0ow63fNit31NFkbp+Zbf9xzmueCar0aDU8C746LkvxIwkry0e4Z0c
         T6mtHsNBrXDrnscLeoTlpCOvcyP4sLolYXhTe6T4F9vaBt9YR1BXJSRLeufiOq/egVNs
         GwRYkx4uMy6HHOWDigT4OklnJrclZhj3Mq27p2Xc6Qg5fAW0BiuU4MYUcwmLXftRk/Qu
         5DsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlQd6/8azJJxkPVYWoT4I2XIrC+v66oMloPLwfI0kXetzfFkjRwVD8yPefUwSn5VuvNAB3ASnvmKk7zg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6qdz8CaNkzp0ceUrxVpka39g9iuanuNSvAACybVt/IlpoIE0
	xTWC+EoUoRI85/1zSB9+ID/NOsgWwERJJz24Xm/NS5EtVkI1/oH1HdbAkM0fV8A=
X-Google-Smtp-Source: AGHT+IGob07HibDqMTkhNXqspOJCbfYZqD3T/Q2DpzNezAZ4leoJ5tWyryGCIql/xTbKFf++6QnddA==
X-Received: by 2002:a17:90b:11cf:b0:2da:88b3:cff8 with SMTP id 98e67ed59e1d1-2e1851c6ec4mr154101a91.6.1727798850248;
        Tue, 01 Oct 2024 09:07:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:16 -0700
Subject: [PATCH 11/33] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-11-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090732_279879_7D40D466 
X-CRM114-Status: GOOD (  21.57  )
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
 arch/riscv/mm/init.c             |  2 +-
 mm/mmap.c                        |  1 +
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..ef9fedf32546
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <uapi/asm/mman.h>
+
+static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
+	unsigned long pkey __always_unused)
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
+#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
+
+#endif /* ! __ASM_MMAN_H__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e79f15293492..4948a1f18ae8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -177,6 +177,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
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
index 0e8c20adcd98..964810aeb405 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -326,7 +326,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= PAGE_NONE,
 	[VM_READ]					= PAGE_READ,
-	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE]					= PAGE_SHADOWSTACK,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
 	[VM_EXEC]					= PAGE_EXEC,
 	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
diff --git a/mm/mmap.c b/mm/mmap.c
index dd4b35a25aeb..b56f1e8cbfc6 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -47,6 +47,7 @@
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
 #include <linux/ksm.h>
+#include <linux/processor.h>
 
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
