Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C2BC02196
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqRZ4wBEWVT1nosKJndSQ3S2KQmy/MHGsbij1m9f03k=; b=f6Ti8BR35pucJ4
	KX/yq5Q6JNgTFjzVKC/L65VAF+vP7uZBHjLN1g9Tu74emYWyZidRxA8sTwe5/rvCQ+gSyvvX7Q4T9
	pCwfrBOdVjXjigyooSaegNZM/Pej/zinBd4nsOu81MUShObNG2U6lZ8TWUwi59FhM/7+P1rFwPpt7
	Z1LGOvOo+awVCnJWhVbP3L8ZljrnMiqEsqhN38+ayLw3xRIcglp5Uht+0wlDHpz+/CvgA7NL2UwzO
	UlrbFB4Wt0MeyA+6B5rPkeGq+4YieUtfv2ULJki+gU2zTKjwgMmk5jBuUJnlxK+51eeKD0doT9TPE
	TWwFynpejKGP+mqbVAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7n-000000021qB-3rr8;
	Wed, 05 Feb 2025 01:22:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7m-000000021nl-2e9m
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hK7DlmuIRYzIsuvvXHgsbKnv3WN7JKJpEt1D7vAnJaQ=; b=nzH53Krz9wfohNR5XEpgU6zgsV
	jT8GvDu05dolmHZ7qaXpGJkZvODu06jiKwfV+rPzWRcsx8D2na+rwQlVJU9+p/UciacRq61yfdd5w
	g2ncM/1+aloW4VBDcVLEi1Zf/NZu8UJADmgBAJpRp4DRYjzHkrWXAE8oRZPPeRnaRym+2yUt6sM2a
	DFGdfu+c0FTT2L6hO7GM4M6c+Scqw1y8DXLYLeGTLSxSagUu3XOwDr0KOCCHqmC7WvDcNwozu8quT
	t9WWHpkHm8PNiALsAWu96+ql8lyhEU+XLN2eOETPjEhz6LImXjPewnTBx0Bob/BKItmYB1dydOfN+
	g3wqB8Fg==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7S-0000000GTrQ-3Ufn
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f44353649aso8334357a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718533; x=1739323333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hK7DlmuIRYzIsuvvXHgsbKnv3WN7JKJpEt1D7vAnJaQ=;
        b=fmI333xqQAh/Vq9Ugn24vii9HKbjoSAZcu/7oxhVj2DSZJBvYsDdUYYB5M6GjuugK0
         ZQA+7Y4pAYtEjlAopgOaawZZHGiVAC0PRCoR2ICWxL2060NsBliikVHdBjL3dt9GkzIY
         B/S+DMaSpfPXU7n8ouAzT44SDlooGdfDX/cxuXRc7YlKEhtVbApWZH8zuwLV3GEcCTsP
         n1f1n2QBJRqwzgNqTuCIQG2+MZfZhpo9cC28WIKOjmueixY4IV+Ckh2HlEe2rJXroKD+
         CPYtlm9vujgoVFUTqEyVCSL5b+Nfel7tollTxfHVVV3G0PHpNRNxy3EBPvTU0LHsdNJJ
         rcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718533; x=1739323333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hK7DlmuIRYzIsuvvXHgsbKnv3WN7JKJpEt1D7vAnJaQ=;
        b=kXC9eg7PRpPsSxc1YIVU62OeYU7CeeBbcs6/J02IAu2CyUgz8cKY8LXnjXimBEeOom
         cs+p4RQa1Iz4I1mHej891CuEiLxEiXYXQ3fx3Dq894f5swP15fxpwKC/9PFzqWZJDOel
         9HJtS/K5WMVAUA4aK8tF07DmY0JtqpeLRIyifzxuC+ItPELCuxZYvUJmUXujxkOdOR5/
         EvV+AtpRsyMFFR4wAM7Lzf5HLQfwv+2C+uFsBJ51cempNb/gOro3N7f0p2vREQUN05dt
         OcLBZH40FX2EpqkWTLpmETvEKF+AdRE0iOnO8Rm4TA4jFLjbvOknVz9lS4EkUxdjs9Q7
         SwqA==
X-Forwarded-Encrypted: i=1; AJvYcCVuHf9bJSVV1SieF1RisJ72V1XghyQ1wluwlYIp/mMSM1cUrMq8ro4CjDs/P0TRba0WB8UVA4zq7JouAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzATmXjWB4VydAyXIyr7HvFzBoO5fjILB1scZOTyeRUBPud3f0
	69JdguKOyrze+3/R84T6ZHuAVJ8KpCgwzIn+gOsgFjNtDKQ7/5/xm7r3Fb7EddPU+P9K+gVZbIm
	K
X-Gm-Gg: ASbGnctROOnP1y4NNk6cPfsvD5YUKsyfPxr8DhlPpZveuT2KT9n5gB/cXTaS0ee+FIc
	SB4FK1ttvQlPNjCqlCErNTQhu1zOdf32lVdak+WOR3kLmT/sRx23XyUnM7U36oM/RvJXjzMhS9I
	oJiLMAYLn712uQijBMm7NIwrQyXnprUF2xKanWMElQtvA/cdxQfdCyEgDymB9M0AXZ4nWeTQWb1
	CnHchajCsnPhn9tGcoJvsRjmdA9tjTWW3o4O8qR2CaCQj41GkUg6aOweTp9273ksyU/6CpcgzjA
	AgM4gOi0CifejZYgM+1LeyNlxw==
X-Google-Smtp-Source: AGHT+IHSDstT0FGTL1rKn5OYVTictI2F7hNGUqzMma/U3VqWcjoJawW9HqWn0ZJ0B/nhVBR5FKHupQ==
X-Received: by 2002:a05:6a00:1d88:b0:72f:d7ce:4ff8 with SMTP id d2e1a72fcca58-7303520d315mr1572427b3a.22.1738718533123;
        Tue, 04 Feb 2025 17:22:13 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:12 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:57 -0800
Subject: [PATCH v9 10/26] riscv/mm: Implement map_shadow_stack() syscall
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-10-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250205_012236_649002_38001E81 
X-CRM114-Status: GOOD (  23.96  )
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

As discussed extensively in the changelog for the addition of this
syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
existing mmap() and madvise() syscalls do not map entirely well onto the
security requirements for shadow stack memory since they lead to windows
where memory is allocated but not yet protected or stacks which are not
properly and safely initialised. Instead a new syscall map_shadow_stack()
has been defined which allocates and initialises a shadow stack page.

This patch implements this syscall for riscv. riscv doesn't require token
to be setup by kernel because user mode can do that by itself. However to
provide compatibility and portability with other architectues, user mode
can specify token set flag.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/Makefile  |   1 +
 arch/riscv/kernel/usercfi.c | 144 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 8d186bfced45..3a861d320654 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
 
 obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..24022809a7b5
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+
+#include <linux/sched.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/uaccess.h>
+#include <linux/sizes.h>
+#include <linux/user.h>
+#include <linux/syscalls.h>
+#include <linux/prctl.h>
+#include <asm/csr.h>
+#include <asm/usercfi.h>
+
+#define SHSTK_ENTRY_SIZE sizeof(void *)
+
+/*
+ * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
+ * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
+ * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
+ * stack.
+ */
+static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
+{
+	/*
+	 * Never expect -1 on shadow stack. Expect return addresses and zero
+	 */
+	unsigned long swap = -1;
+
+	__enable_user_access();
+	asm goto(
+		".option push\n"
+		".option arch, +zicfiss\n"
+		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
+		_ASM_EXTABLE(1b, %l[fault])
+		RISCV_ACQUIRE_BARRIER
+		".option pop\n"
+		: [swap] "=r" (swap), [addr] "+A" (*addr)
+		: [val] "r" (val)
+		: "memory"
+		: fault
+		);
+	__disable_user_access();
+	return swap;
+fault:
+	__disable_user_access();
+	return -1;
+}
+
+/*
+ * Create a restore token on the shadow stack.  A token is always XLEN wide
+ * and aligned to XLEN.
+ */
+static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
+{
+	unsigned long addr;
+
+	/* Token must be aligned */
+	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
+		return -EINVAL;
+
+	/* On RISC-V we're constructing token to be function of address itself */
+	addr = ssp - SHSTK_ENTRY_SIZE;
+
+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
+		return -EFAULT;
+
+	if (token_addr)
+		*token_addr = addr;
+
+	return 0;
+}
+
+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
+					   unsigned long token_offset, bool set_tok)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long populate, tok_loc = 0;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	addr = do_mmap(NULL, addr, size, PROT_READ, flags,
+		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
+	mmap_write_unlock(mm);
+
+	if (!set_tok || IS_ERR_VALUE(addr))
+		goto out;
+
+	if (create_rstor_token(addr + token_offset, &tok_loc)) {
+		vm_munmap(addr, size);
+		return -EINVAL;
+	}
+
+	addr = tok_loc;
+
+out:
+	return addr;
+}
+
+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
+{
+	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
+	unsigned long aligned_size = 0;
+
+	if (!cpu_supports_shadow_stack())
+		return -EOPNOTSUPP;
+
+	/* Anything other than set token should result in invalid param */
+	if (flags & ~SHADOW_STACK_SET_TOKEN)
+		return -EINVAL;
+
+	/*
+	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
+	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
+	 * itself. This provides static property on register programming and writes to CSR can't
+	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
+	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
+	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
+	 * to allocation. Although in order to provide portablity with other architecture (because
+	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
+	 * flag in flags and if provided in flags, setup a token at the base.
+	 */
+
+	/* If there isn't space for a token */
+	if (set_tok && size < SHSTK_ENTRY_SIZE)
+		return -ENOSPC;
+
+	if (addr && (addr & (PAGE_SIZE - 1)))
+		return -EINVAL;
+
+	aligned_size = PAGE_ALIGN(size);
+	if (aligned_size < size)
+		return -EOVERFLOW;
+
+	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
