Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789BCCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDqGRjxt6Vt84lQEtraNrevfDMC0cM5wnMopc3ZGAKQ=; b=WDzdqGOER3C6Sc
	lFssw1LY1Y2uNnCwm9tVC2fKiKvstEBTrIXWsMNrqO3UCf2l6Ym1bVSR5aGP0+oIgnTZctjleFx9C
	lo+XOeMoVHwAEMQt+hFkuVNvT6JN9GyNjK4icbp8OMJkeGnWs87rucvE1kysR+1iFl5tKJm6lYduT
	zKesuIe2q7maBDK3yVi28AsDjy3h9HWOaEkq2yOCQ3ojjDavxeYRbnV5v2aonKLIVHBNOkxPOSx1u
	MY2sprHdpWO2sLVWHy7/pA5KCHhGF2mnNg76uK1Rn7II1/cj/dqYLEPInZAqsl4F7E/uc1KaCXj4e
	OLUB/LbKwSqZ8/l7vIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960v-00000002XJv-2IdV;
	Wed, 15 Oct 2025 18:14:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960s-00000002XES-1T75
	for linux-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2zbm+cvasSeWoh5NRRT51waj2rRu/qBUWCUacGfv0Qo=; b=JjO8b/+tzv44xeLFd7H8CnDFFx
	lcozVfWnMKRhW89LssnwVS7JzfUVkKLxL6EXxc/2TSBRRDOBm9p2H14qahZ7S+9PqeHDqyNQlTE+x
	md9W/HgcpWiov00hgfgP/OJR6gmjW7DEJJiTdqNUyhSd0Uz1lebLEKCGO9cOpgYjqzJaUv7hS/bx9
	jEDVWwhEaYBuXRumKmrnC/e7yjbVUj62wKS+yCH3JuHG6qJZ2lTBW15l1Q+9S5e7z+8JHB3gQJo9F
	YCCkXbSTFW/XXB5d7bEstAmxGipPCQhBQ1rLBf8+zqqRLTcugItA2kyxLEC/nWnFAGS1WU9mGW48g
	i2JNV+fw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v960m-0000000669O-3J3H
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:14:11 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so915158a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552046; x=1761156846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zbm+cvasSeWoh5NRRT51waj2rRu/qBUWCUacGfv0Qo=;
        b=eKBfHuTFdCeqf3OPuTc/uQw+jQ1Xu8tLiU7wavXTFPsefTj2aHZHovKqYCo8EO5rXW
         Fs87u8aqRzK0QUTsKYs6KzLCfao3dvmiKW9cDzKXUV+A9Seb0dfhNO/Z3xhp9akGz9WQ
         qlyFc/n5uoVQ4evoto4NecJfdFURzrZaJpIzhS6gWOL+BrBO1n3JA1yCNU3D9nzH7LiS
         hMt2Aion7pHgqG1+GdxzmjaR2cpDOUnkZN6plwHPcjxPWoVsGTLk9hgJS838u8Yv940E
         FSonJ5F18gDpI5MJEFtmbSKmHXFfv7DQO1thjtEbG/Qfph2arDCQZbIW6MRepNPVvssO
         e7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552046; x=1761156846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zbm+cvasSeWoh5NRRT51waj2rRu/qBUWCUacGfv0Qo=;
        b=aG+9+SrLYrMp67UawBQ0mJGcNTSxyLAvBqUGXmHYX/ugyo+tVuaOj8cPfJOGaowaG8
         PVjylZy3KJ7NnWmk4901DRAjSuXQ8kMhPRMoO3GXHBUsg4isyWy/+VIx03XYUp4UcqMS
         SYpx/5OcGfsvWQv/K+9c3y9JCW+RQt/KTE8p7zrAxF2C9REVUT1VrCioLuN7OpGZuMAd
         KZS4tFT3w15uCfkoX17aumCpHApl9G21cFeyo9XekTx7JngKlStJzOfM1DmAbs8GoWdQ
         0i6zgBKianiCSDohqVmK2XOz5NYuhlIfbocrOyB1G91+KN5DG33WwOO+b+/juz1uW9ZL
         LqzA==
X-Forwarded-Encrypted: i=1; AJvYcCXh86TxUt4e2ssxjKlZMrfciLeVBLAXcgEPv9NRpQ1FaydLBwYC05vjlAxiSzTpeycQNybbgRyiUtaogQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt1D/k7PQkR8tQ+FJtKcV8yuKau3Mb4KvZ0l6HR3v/FL2spwgO
	TaDkRsUAhA+dTVLihzi05EGgd8/6QosgOujRQlDkgtPoy3ip/1ziI5fcIXwn+2bfy8M=
X-Gm-Gg: ASbGncvaOg2hlajHpC8mkDH+SMIeCgRVIOW8Jcc1aA6N9RAH+b87GKEhIk3q6v0PbDK
	8g9O9R0aj81ZT5e3HPqbKTvD9Ss8zNXoSVT3+stAtCj2QXqb9p4Z7gJclJMOKP5s5+EohCzrNVM
	SMmeVj2LXtJ/glEALPld6XKlUQ5UMeaJabV5Z5S8ogNJee1XrfBJotVlKBlnic2zf9I6x/ZSIXU
	0Q7tg5/Gb8ul8dOghW3LL1l8D5QmDcVsVBskwL3jidwHJoJ5ks1x/VJ43uIt9kQmUu4sH4S0Ci0
	THQDqnHpqmQJ6Y3S7XxLa4e3qJcBXLrug25yF0PkMYiPkvlrDRPwsMXGp9VqNAckyHfI5mMoFD/
	GvpFZyI2AxNb1aC7rJLx2zk09WHSeoEtBT1dj7qMQDpKCxdQWml3zWMlb3PKhQQ==
X-Google-Smtp-Source: AGHT+IEY9h9wK3DDaRURINP8YgqxVTJvudYkku3VsRSOTPxZh7znOpPU29mon3p3gzH9BHe3/s0Q9g==
X-Received: by 2002:a17:902:f710:b0:271:9b0e:54ca with SMTP id d9443c01a7336-29091af4271mr12119605ad.13.1760552045917;
        Wed, 15 Oct 2025 11:14:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:14:05 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:42 -0700
Subject: [PATCH v21 10/28] riscv/mm: Implement map_shadow_stack() syscall
MIME-Version: 1.0
Message-Id: <20251015-v5_user_cfi_series-v21-10-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251015_191409_357102_B589262B 
X-CRM114-Status: GOOD (  23.88  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/Makefile  |   1 +
 arch/riscv/kernel/usercfi.c | 143 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..2d0e0dcedbd3 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
 
 obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..0b3bbb41490a
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,143 @@
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
