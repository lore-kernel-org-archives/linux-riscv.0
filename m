Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DFBC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3UdTXaTzBD4MfxJI5janWOYBwZInRCMS1XboR6RMNM=; b=A86LfOaYokIubkZEKu5MXUjqr/
	RtjIzHFK/BpiD21DHwgbfXyodYzCe5eyOh2s19jSR3bIW01hIYCDYlY+6DjlJH/FbbxF7Q1Ym1loE
	YzTHMKuhMkjH8sk5dIqd4IYgRWIZ4uhNc/me1x9EuB0HUJYlGb8b2ngQoqGnrEzgHH1SqHo3yzQBs
	EXLsdUiDfeyJ/7rL+0ZZkc/0Ghmlj6isHQ7sOypAi5M1Nvz/ZqOOXnKdigAwX1LHnFlOaCUZtZr5r
	d1yFG4vqUCpsIKZGxm9SE7UKrCJwoPTb9yP5H+afpRmQ5ekufZsczZ/wtTslsQREMNMXftM09rBPp
	SO5tDEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZRI-0000000DiOz-1jOu;
	Mon, 13 May 2024 17:26:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ZRE-0000000DiLt-3PgK
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 17:26:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f490b5c23bso3892517b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715621164; x=1716225964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CphAxnYmU7rHUQNVs8T3cwnTqgP0hWjWzVy/6SXnII=;
        b=riFnPm4E6tWN/3y54L8jMv47ns2NMZm60MJh6yLKqYEzTRNansI8Zjz3YBO6QJriGA
         DnnGGrpsj0Bp9D4wdnLlYaLi4/k7au74FKS9qIAHJacQFmc6WcIe34hMUQBD70p41W8a
         kcdY9coZbkCoAiRnkOc/hk/sowGGxaLovnlYAhdw0zz+qZhWfU71w2+tadXylzq1h/Nn
         YUTLNcedkqdtd5FBf06Ceg08jDzn4cv8rGA1JrXymdGBUANOcG+QM25SLBX5nvbk968Y
         nSiW53Fdg6MhUpCJusllV7Ecmj6b7RoePghSTxAA+nyBxH5gNHNH6bj22cUldlpAphPa
         Ujfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715621164; x=1716225964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CphAxnYmU7rHUQNVs8T3cwnTqgP0hWjWzVy/6SXnII=;
        b=HYDkTf3rQH1hqqiTnggOh+vRdIO51eju3AdqkTyLWnkL7/6WK8IdbxzSEykyG4Cdcu
         Pv83UX60MvPemjSNuJ2yC2ZZ+M2K9gDK+MMlA9Xv15oyg1TnZ/cDM31qewh8sSUEOaOR
         a8et+2kZOua43eEbPq9Raw3QvgrMPmCRAo4FIqUo+B4yg1T+9CYeH1zLxTva3NVZyz1K
         kMrneKWCZEa7AZ8ggWp82FS0rPeE1gXc6/2u7X2V70xw88wMAdieUBiox2K0jZIXJ15m
         mTNJ30r+uDF4APKSkfU3IpKTLEVv7mJ2YcebxvMgTz38IDpnRlRASQHCtDQCQ6OmAeVg
         AzAg==
X-Forwarded-Encrypted: i=1; AJvYcCWiIpGvi7/QAqxgnXZEy6dkcb03G2YsxSXlcyl2f9GIhK9sdi56XfhzXZsuVNWEVfhTZY5Dhr9Yu/ZXkLkRX9+PtdMrJ1D9IUc5/nLQjlQv
X-Gm-Message-State: AOJu0YwfIefWR0AyHYjcoWXsUcHATnKNg1bcDkiaxLCDjVV7hBRTuzAW
	whzNLm5nodit5kgx15J+IUfJRZN4JEvTemPjm+389ty5vueqwGJJtftXynPdBT0=
X-Google-Smtp-Source: AGHT+IHWYfZIMujic/Efx734TOOxaipvPsENyzxTx20y3wHlQ1JvIbN+S3KCHp0gNXx2ROBa3RZW9g==
X-Received: by 2002:a05:6a20:7343:b0:1af:dbe7:c976 with SMTP id adf61e73a8af0-1afde115bc1mr11659334637.36.1715621163769;
        Mon, 13 May 2024 10:26:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63411530b0esm8050191a12.88.2024.05.13.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 10:26:03 -0700 (PDT)
Date: Mon, 13 May 2024 10:25:59 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 14/29] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <ZkJNJwEjoeHK6GDY@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-15-debug@rivosinc.com>
 <d0e2d1a5-110a-40be-8662-7c78afe22446@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0e2d1a5-110a-40be-8662-7c78afe22446@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_102612_891072_921933AC 
X-CRM114-Status: GOOD (  24.24  )
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

On Sun, May 12, 2024 at 06:50:18PM +0200, Alexandre Ghiti wrote:
>
>On 04/04/2024 01:35, Deepak Gupta wrote:
>>As discussed extensively in the changelog for the addition of this
>>syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>>existing mmap() and madvise() syscalls do not map entirely well onto the
>>security requirements for shadow stack memory since they lead to windows
>>where memory is allocated but not yet protected or stacks which are not
>>properly and safely initialised. Instead a new syscall map_shadow_stack()
>>has been defined which allocates and initialises a shadow stack page.
>>
>>This patch implements this syscall for riscv. riscv doesn't require token
>>to be setup by kernel because user mode can do that by itself. However to
>>provide compatibility and portability with other architectues, user mode
>>can specify token set flag.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/Makefile      |   2 +
>>  arch/riscv/kernel/usercfi.c     | 149 ++++++++++++++++++++++++++++++++
>>  include/uapi/asm-generic/mman.h |   1 +
>>  3 files changed, 152 insertions(+)
>>  create mode 100644 arch/riscv/kernel/usercfi.c
>>
>>diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>index 604d6bf7e476..3bec82f4e94c 100644
>>--- a/arch/riscv/kernel/Makefile
>>+++ b/arch/riscv/kernel/Makefile
>>@@ -107,3 +107,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>>  obj-$(CONFIG_64BIT)		+= pi/
>>  obj-$(CONFIG_ACPI)		+= acpi.o
>>+
>>+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
>>diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>>new file mode 100644
>>index 000000000000..c4ed0d4e33d6
>>--- /dev/null
>>+++ b/arch/riscv/kernel/usercfi.c
>>@@ -0,0 +1,149 @@
>>+// SPDX-License-Identifier: GPL-2.0
>>+/*
>>+ * Copyright (C) 2024 Rivos, Inc.
>>+ * Deepak Gupta <debug@rivosinc.com>
>>+ */
>>+
>>+#include <linux/sched.h>
>>+#include <linux/bitops.h>
>>+#include <linux/types.h>
>>+#include <linux/mm.h>
>>+#include <linux/mman.h>
>>+#include <linux/uaccess.h>
>>+#include <linux/sizes.h>
>>+#include <linux/user.h>
>>+#include <linux/syscalls.h>
>>+#include <linux/prctl.h>
>>+#include <asm/csr.h>
>>+#include <asm/usercfi.h>
>>+
>>+#define SHSTK_ENTRY_SIZE sizeof(void *)
>>+
>>+/*
>>+ * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
>>+ * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
>>+ * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
>>+ * stack.
>>+ */
>>+static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
>>+{
>>+	/*
>>+	 * Since shadow stack is supported only in 64bit configuration,
>>+	 * ssamoswap.d is used below.
>
>>*        * CONFIG_RISCV_USER_CFI is dependent
>>+	 * on 64BIT and compile of this file is dependent on CONFIG_RISCV_USER_CFI
>>+	 * In case ssamoswap faults, return -1.
>
>
>To me, this part of the comment is not needed.

Ok, will remove it.

>
>
>>+	 * Never expect -1 on shadow stack. Expect return addresses and zero
>
>
>In that case, should we BUG() instead?

Caller (create_rstor_token) of `amo_user_shstk` is returning -EFAULT. It'll translate to 
signal (SIGSEGV) delivery to user app or terminate.

>
>
>>+	 */
>>+	unsigned long swap = -1;
>>+
>>+	__enable_user_access();
>>+	asm goto(
>>+				".option push\n"
>>+				".option arch, +zicfiss\n"
>>+				"1: ssamoswap.d %[swap], %[val], %[addr]\n"
>>+				_ASM_EXTABLE(1b, %l[fault])
>>+				RISCV_ACQUIRE_BARRIER
>>+				".option pop\n"
>>+				: [swap] "=r" (swap), [addr] "+A" (*addr)
>>+				: [val] "r" (val)
>>+				: "memory"
>>+				: fault
>>+			);
>>+	__disable_user_access();
>>+	return swap;
>>+fault:
>>+	__disable_user_access();
>>+	return -1;
>>+}
>>+
>>+/*
>>+ * Create a restore token on the shadow stack.  A token is always XLEN wide
>>+ * and aligned to XLEN.
>>+ */
>>+static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
>>+{
>>+	unsigned long addr;
>>+
>>+	/* Token must be aligned */
>>+	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
>>+		return -EINVAL;
>>+
>>+	/* On RISC-V we're constructing token to be function of address itself */
>>+	addr = ssp - SHSTK_ENTRY_SIZE;
>>+
>>+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long) ssp) == -1)
>>+		return -EFAULT;
>>+
>>+	if (token_addr)
>>+		*token_addr = addr;
>>+
>>+	return 0;
>>+}
>>+
>>+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
>>+				unsigned long token_offset,
>>+				bool set_tok)
>>+{
>>+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
>>+	struct mm_struct *mm = current->mm;
>>+	unsigned long populate, tok_loc = 0;
>>+
>>+	if (addr)
>>+		flags |= MAP_FIXED_NOREPLACE;
>>+
>>+	mmap_write_lock(mm);
>>+	addr = do_mmap(NULL, addr, size, PROT_READ, flags,
>
>
>Hmmm why do you map the shadow stack as PROT_READ here?

I believe its redundant here. I followed what x86 did for their shadow stack creation.
GCS (arm shadow stack) patches also do same thing. Collectively, we think at some time in
future many of these flows will become generic (arch agnostic).

>
>
>>+				VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
>>+	mmap_write_unlock(mm);
>>+
>>+	if (!set_tok || IS_ERR_VALUE(addr))
>>+		goto out;
>>+
>>+	if (create_rstor_token(addr + token_offset, &tok_loc)) {
>>+		vm_munmap(addr, size);
>>+		return -EINVAL;
>>+	}
>>+
>>+	addr = tok_loc;
>>+
>>+out:
>>+	return addr;
>>+}
>>+
>>+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
>>+{
>>+	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
>>+	unsigned long aligned_size = 0;
>>+
>>+	if (!cpu_supports_shadow_stack())
>>+		return -EOPNOTSUPP;
>>+
>>+	/* Anything other than set token should result in invalid param */
>>+	if (flags & ~SHADOW_STACK_SET_TOKEN)
>>+		return -EINVAL;
>>+
>>+	/*
>>+	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
>>+	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
>>+	 * itself. This provides static property on register programming and writes to CSR can't
>>+	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
>>+	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
>>+	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
>>+	 * to allocation. Although in order to provide portablity with other architecture (because
>>+	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
>>+	 * flag in flags and if provided in flags, setup a token at the base.
>>+	 */
>>+
>>+	/* If there isn't space for a token */
>>+	if (set_tok && size < SHSTK_ENTRY_SIZE)
>>+		return -ENOSPC;
>>+
>>+	if (addr && (addr % PAGE_SIZE))
>
>
>I would use:
>
>if (addr && (addr & (PAGE_SIZE - 1))

noted.

>
>
>>+		return -EINVAL;
>>+
>>+	aligned_size = PAGE_ALIGN(size);
>>+	if (aligned_size < size)
>>+		return -EOVERFLOW;
>>+
>>+	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
>>+}
>>diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
>>index 57e8195d0b53..0c0ac6214de6 100644
>>--- a/include/uapi/asm-generic/mman.h
>>+++ b/include/uapi/asm-generic/mman.h
>>@@ -19,4 +19,5 @@
>>  #define MCL_FUTURE	2		/* lock all future mappings */
>>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
>>+#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
>>  #endif /* __ASM_GENERIC_MMAN_H */
>
>
>Don't we need to advertise this new syscall to the man pages?

`map_shadow_stack` is already mainline as part of x86. I am assuming there is man page for this.
I'll check to be sure and confirm here.

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
