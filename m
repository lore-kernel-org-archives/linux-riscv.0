Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18465CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWVUVijwB3cIRoJqiin56zDTFnjugYDVzqQCLFapEdM=; b=iC8hhWgSEZOhlL
	pq8whknxO+xu8gteXpkbGHqStCMHofHCbH7Gk4RkvPKf3pTly+M4prik5k991fh2sFFoe3yOJS7Yk
	X+r49CxQurU6k5/0BXDYrKHzmdabCezVZ2G7WHB2W/YiGjB2ItgJAyVdcZJqhkC8SgxUC2J0Q+uu/
	2AdrB6hE1rAooGZ3dzajgIE8m4+jxbnvD7qfjNSJ3t6hjsikJra1BUsi8J57J8jHQuA9e06xEAjjZ
	Q2Tt3ZOxpEKl0ftc7xJW+CS8VGTMhWCycoVEm9eRDoB5UdIE+c2kUgTck0N4JYGoRLBUwbxVZFkWB
	ZMT94XvRswQ4Wwiem5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt8-0000000Exfv-1UNw;
	Mon, 20 Oct 2025 20:53:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt7-0000000Exe9-1jFw
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7ZlhaeGyn05OIbis6SfSAIFcz6IbZPi7uJh5910jbDw=; b=qWzFyXXpudYjaTL8mVEWOKUb7I
	JNVTczoBYNvnJgOHBaft3lvhBp2uXVelDSkvQit4d3gUpWxozgHhBlq42oMb7ZnLklOKg3eH5Rlut
	rioGy9bAnRYa+hYzTP2Er88jHSC9eRnBrPQTy2BFo8AbPyJ1aY8HmS8CYwWSz/BVA0K0XlUcXjMo0
	8F3vt7cHsSc5uxM16f8P58+044Y4ofO123Hk+XpqgQC+KO71c2BCC9xyNdruPVV6vXxAB+1xz+XNj
	lV/MqkRvTkpi4wv+2CcCosCVXgs7+J50RvsUdqkNULascq5BW1XebXUpqOYjuN0NyVC1rj2E1qEFA
	c6zdUGFg==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwt3-00000001eQY-0WtE
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:53:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-782023ca359so4704630b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993628; x=1761598428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZlhaeGyn05OIbis6SfSAIFcz6IbZPi7uJh5910jbDw=;
        b=Qi6mS/4a77Fw7BZUq/lD4GLqNHDKOH1QBPCQxVTgt1CCw0Jq4uJs5gHNu9TKwt3tcq
         CC5JgRaLHuNrVYu1gZQtGknf4nZH3Fu8z7MGfrspySiNyOiZv+2rHUCkBAgsW7exDiXm
         LbX80211/SnxAJlQcn7cceq2FOHY3FjB/iveVtKQv0nSuRPh+ejs+ZanTtRggInI2qfS
         Gr8dXI5EPX2KhMZhOvULhAR3Ot3UU2//WoA513nkItHwwGrEFJ4nKtl0kPP48g+hEMMQ
         GB7o8kKXodDHB5aQWZHTlV6XDJiwSZI9fh96XM1SS8jfwn1YsBIwUPUA/+1LqKaENMjU
         uqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993628; x=1761598428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZlhaeGyn05OIbis6SfSAIFcz6IbZPi7uJh5910jbDw=;
        b=N0puZdxLw+dqX3KHsB/X+m2jPoFFMl8RNiY+OtH8RbMPLP1Dr5BOGm/USV4W7WZcgZ
         5BhBQEeVD5ao0+gVMpWTZ2Z6BWjGL4pYcP2tR0BO3m7OuzzMbxznhiAdgJ1OjNKppVI3
         2FRz0vQy62um9F+z3k4nV3O6Rlf+Lq5eCBtKFXGS+KSEK3tjUKRMz9a6sXrecsRx/oak
         cq1VjoVzNo4a75vnUnqgC6MDcQBHMvquGR8m/FQwXQ1mGjgx7fxDHqAtOyG/9P8VYgwv
         CZax9CRbbfDJZ/bypWU6brPMKjPpChn3YF51xsTb2CEYtTuUqMmTXVnwEWNN4ZFVRmTI
         kTtg==
X-Forwarded-Encrypted: i=1; AJvYcCVQvp3OTLxqQPsXVVnDIMM/Nv+tjtn1JgPgbnAnvmeO8muEPnCanQ6vSubbJKAB5byHseY/E6iKmLooig==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr/ufm/2Vh8tGbggSxYJE0qcUq05NpslxtF//ArmufjLyAGR9S
	KEvgN0wNVdf6/WKp9FLhTQBDrLc/TrEc4UKM3eAsUmu5/fheY2vWfq167H0bBa/Z5J8=
X-Gm-Gg: ASbGncvfdCw1vM8ZQWm/8jx7puEDiFIgRhk43zbAG0GUhfMDB03BFFwMw9G6FG8S1Nu
	L0GhyZAiFbFonFFtg+J8TL3x41xHe5KPhSJ7tS1ryygPBE9oHuy59OFj5vfxAvqxquL4+Djo1Hh
	OZq9nUDo1EdNATSNnOQQ3XDcqOaowWYzq8Cl1MnaaKzcMx+zlXiYuFUFU3/NhcuIDm0s9hsMkI8
	N0dnK8Fxw0KToLcJM7v/KtQ9gJdYmeaKCjUURVrJdkV2aOLK3Qy5j2CRsqC4jHBc7IJiwEcC4on
	d67AZOjsODi57gaiHNMUA1apJq1TXtCPa8KGQzjxqCZIrzxlUxpEG30lPebG2T5grTencIAgNhU
	BUniR7/i+Tg3AMKxgkgV5TpZKnTmH2nPXMSElmZ2KO+BFQ5C7iaz1axUakCwULUvKkOhjSL0nTS
	iwBtG+MEozStqNWrQbD8CE
X-Google-Smtp-Source: AGHT+IGTp0VoCzsM1qFbHekfxUQHxO5BZ1MzKl9AFrs6sYaWWmjz/mibQPZYBjqUQQvx/C2ezR82vQ==
X-Received: by 2002:a05:6a00:21c5:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7a220d232a7mr20518849b3a.15.1760993627632;
        Mon, 20 Oct 2025 13:53:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:35 -0700
Subject: [PATCH v22 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-6-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_215350_473817_5A195CD5 
X-CRM114-Status: GOOD (  20.51  )
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
 arch/riscv/include/asm/mman.h    | 26 ++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/sys_riscv.c    | 10 ++++++++++
 arch/riscv/mm/init.c             |  2 +-
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
new file mode 100644
index 000000000000..0ad1d19832eb
--- /dev/null
+++ b/arch/riscv/include/asm/mman.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/mm.h>
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
index 29e994a9afb6..4c4057a2550e 100644
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
index 795b2e815ac9..22fc9b3268be 100644
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
index d85efe74a4b6..62ab2c7de7c8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -376,7 +376,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
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
