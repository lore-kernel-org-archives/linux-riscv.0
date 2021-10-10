Return-Path: <SRS0=WJg2=O6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E951C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 15:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F114760F3A
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 15:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F114760F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQmg2cZPvpQ/AEXTUhCih9FbN/42uTnNn9AA7E0VEiw=; b=hBc4ojD7BZmshYETmLy9sQ6ihT
	qrGUCir0tyQHZZTxYwzJxysJSxW5RuZ9D9de1TzA9fV4WYWOIUj8N1xq4Z1SRMjQh3mH3qIVO2WCY
	+NQvw1FAtO/c+VhqI+n8Qoik/6Wy3dgmTc6dK3dynfuvE50y0fk9Jk/oyzd28pusW58flqFJTH3DC
	1u1XvpMwmJewMmORJMUa68LclysKWJXmsxdn6Daxm3maw0DGPFH2YHLr0BsM5bxhz6H6kw6VDHDDQ
	3y9Zz5Z6dJoYT79yf7zHiTgOj/Bk8aXSGmMLvcH3Y2w8ET7KZxDF2Cq55g8SPceyYkAc1MzMq10y/
	KjEJEX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZapT-0076O8-E0; Sun, 10 Oct 2021 15:33:35 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZapO-0076Nk-Su
 for linux-riscv@lists.infradead.org; Sun, 10 Oct 2021 15:33:33 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D8E82200005;
 Sun, 10 Oct 2021 15:33:22 +0000 (UTC)
Subject: Re: [PATCH v1 1/1] Add support for mm->mmap_legacy_base in legacy
 layout
To: Jinli Zheng <zhengdbu@gmail.com>, paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, anup.patel@wdc.com,
 sunnanyong@huawei.com, jszhang@kernel.org, penberg@kernel.org,
 guoren@linux.alibaba.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210927111150.3518-1-zhengdbu@gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <ca177872-8ce8-0cb7-4dbf-2debcb1ce76f@ghiti.fr>
Date: Sun, 10 Oct 2021 17:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210927111150.3518-1-zhengdbu@gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_083331_239040_0C215938 
X-CRM114-Status: GOOD (  27.54  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jinli,

Le 27/09/2021 =E0 13:11, Jinli Zheng a =E9crit=A0:
> Add support for mm->mmap_legacy_base in the legacy layout
> of the process memory space for the riscv architecture
>

Can you elaborate a bit more? What value does it bring? I remember I had =

spent some time to factorize this code with arm64 to offer =

ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT config and I had another patchset =

to get rid of mmap_legacy_base entirely at =

https://lkml.org/lkml/2019/6/19/18 (which never got merged though).

Thanks,

Alex

> Signed-off-by: Jinli Zheng <zhengdbu@gmail.com>
> ---
>   arch/riscv/Kconfig                 |   2 +-
>   arch/riscv/include/asm/pgtable.h   |   3 +
>   arch/riscv/include/asm/processor.h |   1 +
>   arch/riscv/mm/Makefile             |   2 +-
>   arch/riscv/mm/mmap.c               | 165 +++++++++++++++++++++++++++++
>   5 files changed, 171 insertions(+), 2 deletions(-)
>   create mode 100644 arch/riscv/mm/mmap.c
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 301a54233c7e..e64231592227 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -37,7 +37,7 @@ config RISCV
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>   	select ARCH_SUPPORTS_HUGETLBFS if MMU
>   	select ARCH_USE_MEMTEST
> -	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> +	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_WANT_FRAME_POINTERS
>   	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>   	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 39b550310ec6..107d61371272 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -700,6 +700,9 @@ void misc_mem_init(void);
>   extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>   #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
>   =

> +#define HAVE_ARCH_UNMAPPED_AREA
> +#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
> +
>   #endif /* !__ASSEMBLY__ */
>   =

>   #endif /* _ASM_RISCV_PGTABLE_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 46b492c78cbb..e7dc7c1f820a 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -56,6 +56,7 @@ static inline void arch_thread_struct_whitelist(unsigne=
d long *offset,
>   #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
>   #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
>   =

> +#define HAVE_ARCH_PICK_MMAP_LAYOUT	1
>   =

>   /* Do necessary setup to start up a newly executed thread. */
>   extern void start_thread(struct pt_regs *regs,
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 7ebaef10ea1b..123c67a2c24a 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -10,7 +10,7 @@ KCOV_INSTRUMENT_init.o :=3D n
>   =

>   obj-y +=3D init.o
>   obj-y +=3D extable.o
> -obj-$(CONFIG_MMU) +=3D fault.o pageattr.o
> +obj-$(CONFIG_MMU) +=3D fault.o pageattr.o mmap.o
>   obj-y +=3D cacheflush.o
>   obj-y +=3D context.o
>   =

> diff --git a/arch/riscv/mm/mmap.c b/arch/riscv/mm/mmap.c
> new file mode 100644
> index 000000000000..6c5818db5a65
> --- /dev/null
> +++ b/arch/riscv/mm/mmap.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Legacy and flexible mmap layout support
> + *
> + * Copyright (C) 2021 Jinli Zheng <zhengdbu@gmail.com>
> + */
> +
> +#include <linux/personality.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/random.h>
> +#include <linux/limits.h>
> +#include <linux/security.h>
> +#include <linux/compat.h>
> +#include <linux/sched/mm.h>
> +#include <linux/sched.h>
> +#include <linux/elf-randomize.h>
> +#include <asm/pgtable.h>
> +#include <asm/processor.h>
> +
> +#define SIZE_128M	(128*1024*1024UL)
> +
> +/*gap between MMAP and STACK*/
> +#define GAP_MIN		SIZE_128M
> +#define GAP_MAX		(((TASK_SIZE)/6)*5)
> +
> +static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_st=
ack)
> +{
> +	unsigned long gap =3D rlim_stack->rlim_cur;
> +
> +	if (gap < GAP_MIN)
> +		gap =3D GAP_MIN;
> +	else if (gap > GAP_MAX)
> +		gap =3D GAP_MAX;
> +
> +	return PAGE_ALIGN(TASK_SIZE - gap - rnd);
> +}
> +
> +unsigned long arch_get_unmapped_area(struct file *filp, unsigned long ad=
dr,
> +		unsigned long len, unsigned long pgoff, unsigned long flags)
> +{
> +	struct mm_struct *mm =3D current->mm;
> +	struct vm_area_struct *vma, *prev;
> +	struct vm_unmapped_area_info info;
> +
> +	if (len > TASK_SIZE)
> +		return -ENOMEM;
> +
> +	if (flags & MAP_FIXED)
> +		return addr;
> +
> +	if (addr) {
> +		addr =3D PAGE_ALIGN(addr);
> +		vma =3D find_vma_prev(mm, addr, &prev);
> +		if (TASK_SIZE - len >=3D addr && addr >=3D mmap_min_addr &&
> +		     (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +		     (!prev || addr >=3D vm_end_gap(prev)))
> +			return addr;
> +	}
> +
> +	info.flags =3D 0;
> +	info.length =3D len;
> +	info.low_limit =3D mm->mmap_legacy_base;
> +	info.high_limit =3D TASK_SIZE;
> +	info.align_mask =3D 0;
> +	info.align_offset =3D 0;
> +	return vm_unmapped_area(&info);
> +}
> +
> +unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned=
 long addr,
> +		unsigned long len, unsigned long pgoff, unsigned long flags)
> +{
> +	struct mm_struct *mm =3D current->mm;
> +	struct vm_area_struct *vma, *prev;
> +	struct vm_unmapped_area_info info;
> +
> +	if (len > TASK_SIZE)
> +		return -ENOMEM;
> +
> +	if (flags & MAP_FIXED)
> +		return addr;
> +
> +	if (addr) {
> +		addr =3D PAGE_ALIGN(addr);
> +		vma =3D find_vma_prev(mm, addr, &prev);
> +		if (TASK_SIZE - len >=3D addr && addr >=3D mmap_min_addr &&
> +		     (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +		     (!prev || addr >=3D vm_end_gap(prev)))
> +			return addr;
> +	}
> +
> +	info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
> +	info.length =3D len;
> +	info.low_limit =3D max(PAGE_SIZE, mmap_min_addr);
> +	info.high_limit =3D mm->mmap_base;
> +	info.align_mask =3D 0;
> +	info.align_offset =3D 0;
> +	addr =3D vm_unmapped_area(&info);
> +
> +	if (offset_in_page(addr)) {
> +		VM_BUG_ON(addr !=3D -ENOMEM);
> +		info.flags =3D 0;
> +		info.low_limit =3D TASK_UNMAPPED_BASE;
> +		info.high_limit =3D TASK_SIZE;
> +		addr =3D vm_unmapped_area(&info);
> +	}
> +
> +	return addr;
> +}
> +
> +unsigned long arch_mmap_rnd(void)
> +{
> +	unsigned long rnd;
> +
> +#ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
> +	if (is_compat_task())
> +		rnd =3D get_random_int() & ((1UL << mmap_rnd_compat_bits) - 1);
> +	else
> +#endif /*CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS*/
> +		rnd =3D get_random_int() & ((1UL << mmap_rnd_bits) - 1);
> +
> +	return rnd << PAGE_SHIFT;
> +}
> +
> +static int mmap_is_legacy(struct rlimit *rlim_stack)
> +{
> +	if (current->personality & ADDR_COMPAT_LAYOUT)
> +		return 1;
> +
> +	if (rlim_stack->rlim_cur =3D=3D RLIM_INFINITY)
> +		return 1;
> +
> +	return sysctl_legacy_va_layout;
> +}
> +
> +static void arch_pick_mmap_base(struct mm_struct *mm, struct rlimit *rli=
m_stack)
> +{
> +	unsigned long random;
> +
> +	random =3D (current->flags & PF_RANDOMIZE) ?
> +		arch_mmap_rnd() : 0UL;
> +
> +	if (mmap_is_legacy(rlim_stack))
> +		mm->mmap_legacy_base =3D TASK_UNMAPPED_BASE + random;
> +	else
> +		mm->mmap_base =3D mmap_base(random, rlim_stack);
> +}
> +
> +void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_sta=
ck)
> +{
> +	if (mmap_is_legacy(rlim_stack))
> +		mm->get_unmapped_area =3D arch_get_unmapped_area;
> +	else
> +		mm->get_unmapped_area =3D arch_get_unmapped_area_topdown;
> +
> +	arch_pick_mmap_base(mm, rlim_stack);
> +}
> +
> +unsigned long arch_randomize_brk(struct mm_struct *mm)
> +{
> +	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
> +		return randomize_page(mm->brk, SZ_32M);
> +
> +	return randomize_page(mm->brk, SZ_1G);
> +}
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
