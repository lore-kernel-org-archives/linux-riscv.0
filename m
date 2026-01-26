Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BEED19519
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWdeL/5ZExcgie50Q8ggRVAhBFcDZkX02BIkdr66rkw=; b=hZ4n1CbJTqGqbwvYaDFj7v345I
	xIX0QuHhIIlfPMCJikGZiv58QEYLq6PXfqO1M97Vjz8tGzbvjPJ1CL8MzP3uB/Ix7WhNGCzKEg5kG
	y2z1LHkvTrvUzNOdqRa7yrqG7ECUeo8D4BGbPy1WytTNVOn1KdYYnC84akMV1t7NZZEA+aYuKx7YM
	qJ5UeS2V5dXKtzQNbe0N/ypKGYoH9tTftRdB0eGXdGT2f6atgWHHcxMDqsKbi+W+6hi0d44E7BY+s
	E2nFle4dWIvgtmugnTAFTLs2ZFqfzEIFAI8/mb6VGmoNZKC0Xn341obBaIJAhhVIvVz8bIlk+Y/Mr
	UIg+p/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTNz-0000000DDUp-3zRO;
	Mon, 26 Jan 2026 20:40:35 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTNw-0000000DDUR-3uxK
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 20:40:34 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2b74f839bdfso1544695eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 12:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1769460031; x=1770064831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EUBpOm0QvKE2389W2MiwDwXvLMg/CnIs37/EZYwRaJU=;
        b=edToNoo4VekHXslvtvewKB9SXys/c4OaQG1oEz2FUyOhxNcwe/vfMAKzFN/33az7WF
         wwDC6P+MIFVGzioMriXt1vSOqxbqoKfgEv+EYkZVM89z8BJ7NRLhBE2IkXC0kVNvvyOS
         Xdfae/GVwDfnItbiydz/g7ml+11XfV3DDUuY8Yc2Vzri9Nrm5cEoYXbVkRpnlL2AoZkU
         I4XMTkBpJkjRKLTReaXUcKadHXQl1rfagmoE270gHEuPBIASz2cEqAsmlhvJ/Hk3E/Bz
         +/AiBPQ1FJdSB/LXQrvZ1O5Lsiqe6U2zF3eS/QKBtcE4dQqGJ3OhfKcRQqjFHJAZaqmU
         i+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460031; x=1770064831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EUBpOm0QvKE2389W2MiwDwXvLMg/CnIs37/EZYwRaJU=;
        b=YUxJJA4Bv8BuywCuteks3DAzctWGIfFoT6XLMVJ12EY2+X4cVwsTmDbi0Jlfnr/0V8
         LqQzYxbKm1Rg1Pntg5cgcuAEt79+xPND+bv0gX/oXCGTBuX53Cl7rVzBjzwFfwSZNxzR
         DcSgwS0ALrec0qEEwGf9hvYmvO97bPLj3JH6Pp6iuya77MGG/Ng4eips5BFt2Hh3WePZ
         IGvLXoYJPdrMYT0dcrHWvRQWxG76sEV2mK9ApSKKrtfOb8HEeBCEDTmSpnxzso0yjtUS
         H1qsbhoCWp+NGVpaE/EqthITsnNo2fjzdDfqxUMg5ysKNsvAAjp99oM/G2Eiv+VgLtnJ
         8vMA==
X-Forwarded-Encrypted: i=1; AJvYcCWJBNkAmfGZKe2XBEBkPaPq9V8bCsBIsHl+Nww4N+UVQUHhEuFEPZK5BC0dfWpHEU8xC/Lw1LVnqMPimQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YztM3Y58SDmP7kNVXNpJXmpQw+SQu0hGtBgUVcjPRRHkxw2w0Lr
	l7Z0FBrU4axe7/SXflNnfyVWOUHsRSJhiRgTUKRFkYfTz4oxOirk+XnHO2qHMg1XKEo=
X-Gm-Gg: AZuq6aI2b5K3umpAEOdGvdFWWYsRsdu9OejMTQ7bm7QtXrfn/p8uz48wZorhh7wgqD8
	sP+g1RBgCc55eNcntcAq8TNCA3sIO0cCg30o6K/QdIFIs9VFBFyzEFv0BOrhcTnvOSHTXFcsA3w
	YYcwALDEHxAikSarnt+eYmR8UW26KhDyKFPlir9XvJeU5ZduFOCe3PwFg6SpRgpjMgs+QQcpPUg
	96GpTM9t20m1i+ANYrMIhH1WhmS8X95oNZdy0QoCeQ+B6Unpt/p+++LGorAQyMjvOH+BGYlPljF
	4ZcPz1nbrMv9Z5CiTWXdBQgg3iSTn+3VG810nyL30mkVoCfN+E0+o7rNb2HQH6fJZ7uED23gTLM
	R4rxSSx2tAKOEgVHOxasenEsHiA+nKc9f6ExqwE58n3SmGQQS5fnh3iSkd+fph2IOZvrg9XQmwE
	wtyoby+EE9Z+0SlyiUQxfF9ObRPQElKD0=
X-Received: by 2002:a05:693c:6218:b0:2ae:5a2e:de70 with SMTP id 5a478bee46e88-2b7638d6573mr2604064eec.8.1769460031398;
        Mon, 26 Jan 2026 12:40:31 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa03fd0sm15037214eec.23.2026.01.26.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 12:40:30 -0800 (PST)
Date: Mon, 26 Jan 2026 12:40:28 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v26 10/28] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <aXfRPJvoSsOW8AwM@debug.ba.rivosinc.com>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <20251211-v5_user_cfi_series-v26-10-f0f419e81ac0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251211-v5_user_cfi_series-v26-10-f0f419e81ac0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_124033_077353_48CB45DA 
X-CRM114-Status: GOOD (  25.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul/Zong,

Can you apply following diff on `allocate_shadow_stack` function in this patch.
This fixes the bug that I earlier mentioned. We shouldn't be returning location
to token and instead return base address of shadow stack. Userspace consumer
should be determining token location itself. This matches the ABI of other
arches. Sorry for being late on this.

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 27b36034ea85..a8530e6afb1e 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -232,7 +232,7 @@ static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long siz
  {
         int flags = MAP_ANONYMOUS | MAP_PRIVATE;
         struct mm_struct *mm = current->mm;
-       unsigned long populate, tok_loc = 0;
+       unsigned long populate;

         if (addr)
                 flags |= MAP_FIXED_NOREPLACE;
@@ -245,13 +245,11 @@ static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long siz
         if (!set_tok || IS_ERR_VALUE(addr))
                 goto out;

-       if (create_rstor_token(addr + token_offset, &tok_loc)) {
+       if (create_rstor_token(addr + token_offset, NULL)) {
                 vm_munmap(addr, size);
                 return -EINVAL;
         }

-       addr = tok_loc;
-
  out:
         return addr;
  }

On Thu, Dec 11, 2025 at 09:20:43AM -0800, Deepak Gupta via B4 Relay wrote:
>From: Deepak Gupta <debug@rivosinc.com>
>
>As discussed extensively in the changelog for the addition of this
>syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>existing mmap() and madvise() syscalls do not map entirely well onto the
>security requirements for shadow stack memory since they lead to windows
>where memory is allocated but not yet protected or stacks which are not
>properly and safely initialised. Instead a new syscall map_shadow_stack()
>has been defined which allocates and initialises a shadow stack page.
>
>This patch implements this syscall for riscv. riscv doesn't require token
>to be setup by kernel because user mode can do that by itself. However to
>provide compatibility and portability with other architectues, user mode
>can specify token set flag.
>
>Reviewed-by: Zong Li <zong.li@sifive.com>
>Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
>Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>---
> arch/riscv/kernel/Makefile  |   1 +
> arch/riscv/kernel/usercfi.c | 142 ++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 143 insertions(+)
>
>diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>index f60fce69b725..2d0e0dcedbd3 100644
>--- a/arch/riscv/kernel/Makefile
>+++ b/arch/riscv/kernel/Makefile
>@@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)		+= acpi.o
> obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
>
> obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
>+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
>diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>new file mode 100644
>index 000000000000..251c3faccbf8
>--- /dev/null
>+++ b/arch/riscv/kernel/usercfi.c
>@@ -0,0 +1,142 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (C) 2024 Rivos, Inc.
>+ * Deepak Gupta <debug@rivosinc.com>
>+ */
>+
>+#include <linux/sched.h>
>+#include <linux/bitops.h>
>+#include <linux/types.h>
>+#include <linux/mm.h>
>+#include <linux/mman.h>
>+#include <linux/uaccess.h>
>+#include <linux/sizes.h>
>+#include <linux/user.h>
>+#include <linux/syscalls.h>
>+#include <linux/prctl.h>
>+#include <asm/csr.h>
>+#include <asm/usercfi.h>
>+
>+#define SHSTK_ENTRY_SIZE sizeof(void *)
>+
>+/*
>+ * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
>+ * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
>+ * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
>+ * stack.
>+ */
>+static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
>+{
>+	/*
>+	 * Never expect -1 on shadow stack. Expect return addresses and zero
>+	 */
>+	unsigned long swap = -1;
>+
>+	__enable_user_access();
>+	asm goto(".option push\n"
>+		".option arch, +zicfiss\n"
>+		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
>+		_ASM_EXTABLE(1b, %l[fault])
>+		".option pop\n"
>+		: [swap] "=r" (swap), [addr] "+A" (*addr)
>+		: [val] "r" (val)
>+		: "memory"
>+		: fault
>+		);
>+	__disable_user_access();
>+	return swap;
>+fault:
>+	__disable_user_access();
>+	return -1;
>+}
>+
>+/*
>+ * Create a restore token on the shadow stack.  A token is always XLEN wide
>+ * and aligned to XLEN.
>+ */
>+static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
>+{
>+	unsigned long addr;
>+
>+	/* Token must be aligned */
>+	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
>+		return -EINVAL;
>+
>+	/* On RISC-V we're constructing token to be function of address itself */
>+	addr = ssp - SHSTK_ENTRY_SIZE;
>+
>+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
>+		return -EFAULT;
>+
>+	if (token_addr)
>+		*token_addr = addr;
>+
>+	return 0;
>+}
>+
>+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
>+					   unsigned long token_offset, bool set_tok)
>+{
>+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
>+	struct mm_struct *mm = current->mm;
>+	unsigned long populate, tok_loc = 0;
>+
>+	if (addr)
>+		flags |= MAP_FIXED_NOREPLACE;
>+
>+	mmap_write_lock(mm);
>+	addr = do_mmap(NULL, addr, size, PROT_READ, flags,
>+		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
>+	mmap_write_unlock(mm);
>+
>+	if (!set_tok || IS_ERR_VALUE(addr))
>+		goto out;
>+
>+	if (create_rstor_token(addr + token_offset, &tok_loc)) {
>+		vm_munmap(addr, size);
>+		return -EINVAL;
>+	}
>+
>+	addr = tok_loc;
>+
>+out:
>+	return addr;
>+}
>+
>+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
>+{
>+	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
>+	unsigned long aligned_size = 0;
>+
>+	if (!cpu_supports_shadow_stack())
>+		return -EOPNOTSUPP;
>+
>+	/* Anything other than set token should result in invalid param */
>+	if (flags & ~SHADOW_STACK_SET_TOKEN)
>+		return -EINVAL;
>+
>+	/*
>+	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
>+	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
>+	 * itself. This provides static property on register programming and writes to CSR can't
>+	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
>+	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
>+	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
>+	 * to allocation. Although in order to provide portablity with other architecture (because
>+	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
>+	 * flag in flags and if provided in flags, setup a token at the base.
>+	 */
>+
>+	/* If there isn't space for a token */
>+	if (set_tok && size < SHSTK_ENTRY_SIZE)
>+		return -ENOSPC;
>+
>+	if (addr && (addr & (PAGE_SIZE - 1)))
>+		return -EINVAL;
>+
>+	aligned_size = PAGE_ALIGN(size);
>+	if (aligned_size < size)
>+		return -EOVERFLOW;
>+
>+	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
>+}
>
>-- 
>2.43.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
