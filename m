Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E71CF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRj5ictcy+4srEv7Q6+KVYfipBlUHWvHatJUxike5x4=; b=LjprCrquIf3cQn
	owaK+g9aPe+MBCFIZpEvksJkN7OmYtWs7Gld4E7G5sX5NHvWcmm0Bf6xJmGjdSO5j/3styR++yUHX
	STRTuFvp2HF5WvMCcN6MS9FtnkF7Z3ECne16d0cE2is5D1iRBQY1ylOFelYeHz9EV8F4O4KzRnOxH
	fD/HDgRMmccHdgx4jLc3OC5OL/jqBrA6RnW6CMYz3S92IcPRlCj0ofTrr1tNesURpbBCakB/FN+GP
	8fsFBB5WSlOYLxzbeQLM/Fwk0Jww0Rir7Lu/Er1qD2P9lGa8ZhoxWK6amZqoP2FQLiD7gtEyHgF36
	M8nn4+1/00pr/gzB7MUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqx-00000007J28-1rSt;
	Tue, 08 Oct 2024 22:38:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqm-00000007Irb-3foB
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dAoDcoPzZ5rcQ2NjFDcOAOgedZarol+OJwK/f74o/Zc=; b=lmCmvDY9Att7Gdq0oVicqOObO9
	LtJvaPwkQdfwtHHdcoWaOyqgmtxuTqxpVMb/uu7TQpoFzhMtz01mQU9ydvk29A7G3wQnwfF3ifnjT
	vfrwqkAR/jSu/ePuL8EicC4t07aiQLjmEj0WWTOpUzq8FS9jvKFAvMZU4uexH98LgYnzimS2cPo0y
	b3goxVcQGrQK3Vr8EWTaoXYcwZmbp5g/YdusP8nxLfJszmY+rbE476sAV+V9KS7H/5IzcNbUWmQD/
	q5r9Pe8Ut+O6Cd7Kv7B+kbDtO2QtsHvBlvbth9a15yO6NqBa7adI4f0csDhSMjuIeEN5aAoxLabaW
	zdFyh8fw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqg-00000003Net-2v7J
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e050190ddso1945732b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427109; x=1729031909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAoDcoPzZ5rcQ2NjFDcOAOgedZarol+OJwK/f74o/Zc=;
        b=VwMfigC+o+NfhbgsTB+IHzstCd3pZ0kTb8prgzAyHFn3Ne7qg2K551ZqgMnuAToQtm
         gNtUdeFJ+6l/xlBqNYPGpblKbu3VQOYdR5cGfnUqKVcVv5NWSdgZU6I9zQGzimWtsoCr
         w4S+ati+u6VnG3cEdNphcAMS5IxSvrc2MXWe13lU0oNPJ0faHc34vWew2+srn9J7v+YY
         /+/tqnTo7C6vqPEe4mI5/N7LrENM9wPkksO+frMkXo6IQcpaXN0ALQ+XTzu1Fnj/ystH
         tVp2iK5xyWpqSOEohIOiArARo89tN1HkJr/91CnTJIHBU7BtKu703Yd+uCMSuK/YuSnC
         lSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427109; x=1729031909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAoDcoPzZ5rcQ2NjFDcOAOgedZarol+OJwK/f74o/Zc=;
        b=Z7lyuAGjDeJO1moGiXDp7QPuRinyi2IuBnCufL1M9kthtFor4Z1e/PYV+jiQVzAPyi
         aaB24Z7MCmeq95SNqpgr1Fk5tBI4nfX20tHubGhSIVnHqrJu3kM6bSyT+xMwKBVR3SBo
         vq+3I/1jXS6Zr2s1Mn9qsB5swuFg40A18xbAhYMPGE6ykqYHUW26awImqu4oRVoD/f2K
         kh205g4M6OLvt5qFDsVy8pgaq9SIu7iRIW95haMB/Z1A0T3s/0NA9C9coWLvNzZpcV+G
         xV9CVDw/thUaE2NeDiQ3C9Q24bF+naXsFyQJBsAzqB8wMRMQi6eszKReWHJ8gi3h+yqI
         w8fA==
X-Forwarded-Encrypted: i=1; AJvYcCV3axrd04y1pqat460sZGoMYEAxMJS2v0I71B/5QsNG5xBV85FUzrx3aY6uVeltxMj6WJZlJVNwIQ6FTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFAQmpC7TanoKDzKMKK1+/MFr8ymZLArVpHJ9WDgD3zDTeB40J
	wUkWgz+VVa6k4rthXTW/hPBkDneU3neXsDDGu46Hp5cSb1OjPgJUXLqVQLA86Ys=
X-Google-Smtp-Source: AGHT+IHxf+f6wcxCIHEfxEyDGg+gobzmOwypcXcxAkWl4oxuTMRGEzHBbNlZ3Xhs/sYeCJgcbfyheQ==
X-Received: by 2002:a05:6a00:928a:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-71e1dbb7c5cmr701400b3a.21.1728427109458;
        Tue, 08 Oct 2024 15:38:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:57 -0700
Subject: [PATCH v6 15/33] riscv/mm: Implement map_shadow_stack() syscall
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-15-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233835_424055_6A668789 
X-CRM114-Status: GOOD (  24.69  )
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
 arch/riscv/kernel/Makefile      |   2 +
 arch/riscv/kernel/usercfi.c     | 145 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/asm-generic/mman.h |   4 ++
 3 files changed, 151 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5..eb2c94dd0a9d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -117,3 +117,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
+
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..96bb324abafb
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,145 @@
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
+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long) ssp) == -1)
+		return -EFAULT;
+
+	if (token_addr)
+		*token_addr = addr;
+
+	return 0;
+}
+
+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
+				unsigned long token_offset,
+				bool set_tok)
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
+				VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
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
diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
index 57e8195d0b53..9cfb3c1e337d 100644
--- a/include/uapi/asm-generic/mman.h
+++ b/include/uapi/asm-generic/mman.h
@@ -19,4 +19,8 @@
 #define MCL_FUTURE	2		/* lock all future mappings */
 #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
 
+/* Set up a restore token in the shadow stack */
+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)
+/* Set up a top of stack marker in the shadow stack */
+#define SHADOW_STACK_SET_MARKER (1ULL << 1)
 #endif /* __ASM_GENERIC_MMAN_H */

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
