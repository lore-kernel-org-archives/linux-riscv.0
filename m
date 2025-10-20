Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14605CCD1A5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwkQf+9Lf7bzVoYlLZXp3uKqsQ6nFzZIskdCbi7EyKg=; b=nCmm8zSBDEE4Oj
	fGNk+qZ0YEklwzLO4u/oVW0K9YDaJnyR1hFtcZ71lFQlhnoj1VHel6tUuzPS+s4YRl1cW1OGEmlc8
	LHbywOP0rdIXVbAHGkz99xaiaGO8P5GTQOKXdfqJlqpPnw/yEYoHTaw6kr1gQmCwEdi4ckzk8Kvic
	J0J67TRjceGaEui2AB/8COdk+vNfaIywm75aFRBLe/glHpuc/66D5uw3eMWO4tZWRxwmEvw0dLNyB
	I6BLwiyRcExYg3Pd9bV3rG9Y8QCpQP6f5+bBpnOLXHSru9p+xHRhVpO2jrfJJ0W59i0t7CQGRsbgN
	L5rTbRjB1r2M2QteX72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPu-0000000Etao-3V7w;
	Mon, 20 Oct 2025 20:23:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPt-0000000EtYk-0Hhi
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 20:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pyem79rLJLXQpzWR0JwioWbcU+J8r0OLXTuCA/SaFvw=; b=RnLuHt7I1oB9vOUBZUVhU4FVs1
	KjRzs8vMaUqOcjPTEoAJ/sMpocFxWPK4SJBbfQ2kusRjJwublxYHRGhWu6U6hL/bSez0Bom10K/1H
	pLIP7oofQK5OQcoutxpcnrLt6+Ohn6Uo5H43sReKlJ0CD1HponB4ohi4IkdC3w1MnZ8kdXJ5QODlS
	KtDknT60mKMap3/SVkdJ4w33zdEUiB6zcCpSe1UfSjzaS5NzNWi3HybySnbUeKehT7wbwsz7Hl2Fh
	6KjPK4MqSyk+1Am+3U0byYjFH6Zx/KC9d+LuI38I/NJcUASs3Gc0M18JabECj2/amTdMp+dB1gDPL
	kefiwf1Q==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwPo-00000000z3g-1zZx
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 20:23:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7930132f59aso6431900b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991771; x=1761596571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyem79rLJLXQpzWR0JwioWbcU+J8r0OLXTuCA/SaFvw=;
        b=RcA/pZ7+HFCiBPtNtyYjVPeMZ6+yvb4LxSlsMPXH0HyKpWOOkJ471etIaFSXKeCS0K
         UT6IFUlOnO7XiqtJ8eYQF7zKMI4kjMQ28CDlEOZXSntLhN7vIBRVP5FWPvnOGaLoa+qa
         G/LIu868EO+upws/ecF3e75Axx2/w3Z2qPRX5yEfWCrMBm5TLd0uXkdqzoK4vnln+aZT
         yucmTkWCjr2+iFg2yv7/3OwI/oW1a2m3hFRdFfWfLdHFcwvX1/4hGu9hAiCDP8953UMr
         tloeRfEq+uN9yYvQ2uD7Q3SUNqkrFoTWxQH8SNqkbSdla+RFoqyc/SIn/bgLNuYe4vZA
         cIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991771; x=1761596571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyem79rLJLXQpzWR0JwioWbcU+J8r0OLXTuCA/SaFvw=;
        b=TY4ZrZXnGBWsgui2am7tNMTkF7CxG/aDKKgbzn6UD0cSnBowvD/WeJfYt5cyPHp0m2
         hlSK17EGitTr0ZhoZ0bF3pxdzGd7k+y7rJY4zngneTfFqYoNiz6fz16YKtfcKqrUGMMf
         MADIez10lHu091IfcB+Fq0fQ7W0Os4qeFtdgBGW+VfqYG2PGKchYOroOgjP/cVfehiiC
         NaJl5I7dqZqRB17ntx1ERG4/QyryfW0eqfI6IqHTTSf17KILZa8yWyXOfHYFTnThebAl
         M1iV4Wh8xg1c2luFmYrt8n5Gxv/JtlYEBxsY1OmK+hdz+H3n8yCfJpFoeudjqkT2i9Ig
         v+uA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NHSzTvQwZFgxtluWBl2MVqkkdbZUqDsPo6kPiQXB516L4H3e7r4PHxrxUV1I+0YC7IR6u/lumdXoOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykkKjETjCL02swm1S8KZW+FIZp3qXHrVzkJuESATBtXR2GNetp
	YmlFMNr89AWO+PYFkehnMtxS3J31RmkAQo0wdXrCGuikjG30bImgEHhnmsKvgMZRmrY=
X-Gm-Gg: ASbGncty1en8qlSE8G/tDoky9jFuSk7lCyuJYiLhjWOry6h3Nkcb7dSQKH8N8MEE7J7
	UypV+G+PzpwzweAjGxXgGxfJ2r29i2FFU7Vqj6aJyN5+FijHCH/g60fS5SPHrxEvMnEbWbmHdjO
	mSxysueDYO5y5cZ7jIL4CiJVu0V+HuSHEeEnTZl1w89qVI+yLSw2wncggbtKAAAtxEKJCIveMdK
	TTJ0efZvF/9Zz+WMuwCgkV8zMt+6CO73XYBGMe0vk2BE3vdYQXMpiU7L3NEr648lhBV42P+p1od
	CkjvAIl4QjaimgyMHPTk46B9h7Py5wQx9z5qwL1JfyisNA1kesQeIb8VDxJjQsKU1HzNQ/cPFaX
	+AAQ0DPVIeeDUf8BFNdEPSP8150j+pBd+EpJ9zrjpSPAaCp7rtqfIQQfYIXvK21UGU9nzxWnvnw
	soTWh+sEN5Hg==
X-Google-Smtp-Source: AGHT+IHCUggIPMFs3p3YqDKdkPO2jCwhmhi/bL773/KhCAQLWB8ulShW9Lr2mVwOqzrGgVQh6gVvsg==
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr17749764637.22.1760991770903;
        Mon, 20 Oct 2025 13:22:50 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:35 -0700
Subject: [PATCH v22 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
MIME-Version: 1.0
Message-Id: <20251020-v5_user_cfi_series-v22-6-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251020_212337_770507_126FBFB1 
X-CRM114-Status: GOOD (  20.60  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
