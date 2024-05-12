Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFEC25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 May 2024 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B270CI2qxAmSR3tOp1qr2Fh12/y+Q0EwZuxJOgvfE4=; b=ZWjt+XQUqup1tj
	kLcCfCl9eKunxnwOh9IHgb8F5m5va0wXibQ5bC43J4jfxEY7PTDTES/DkDKqN44qsw8uHNX9+noHU
	9viGm2YFNffK8V0Ydjb66F2EmCruhiymvr7aLdEoulspTvhx32fChOTu+EqX5wGk0gaoIthNBMNsK
	lwUu3EI6lPbeuxxPfYK8QESllHqQ7/CRUV8RLm292Js28hM7ZzIrqP7yoX9c1rvrV3UMAXcdwzqUw
	NzxNr0SVtpTWfn0lzRCF1YhhCij2Iat6u7MVMB8+9u0uK3BTL8zVYuloxKWqufPh9pl6Wy2V7W7Pj
	Qxq1oGYBwVaqrXTjmKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C1b-0000000AJGT-3hGN;
	Sun, 12 May 2024 16:26:11 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C1X-0000000AJEd-32Xc
	for linux-riscv@lists.infradead.org;
	Sun, 12 May 2024 16:26:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C222060002;
	Sun, 12 May 2024 16:24:50 +0000 (UTC)
Message-ID: <c759444d-fe84-4a61-8448-80fb692c7904@ghiti.fr>
Date: Sun, 12 May 2024 18:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/29] riscv/mm : ensure PROT_WRITE leads to VM_READ |
 VM_WRITE
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
 rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
 kito.cheng@sifive.com, keescook@chromium.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, alexghiti@rivosinc.com, samuel.holland@sifive.com,
 conor@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
 shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
 jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com,
 evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com,
 willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org,
 samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org,
 heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com,
 cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-11-debug@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240403234054.2020347-11-debug@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_092608_093592_5C998F43 
X-CRM114-Status: GOOD (  23.12  )
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

Hi Deepak,

On 04/04/2024 01:34, Deepak Gupta wrote:
> `arch_calc_vm_prot_bits` is implemented on risc-v to return VM_READ |
> VM_WRITE if PROT_WRITE is specified. Similarly `riscv_sys_mmap` is
> updated to convert all incoming PROT_WRITE to (PROT_WRITE | PROT_READ).
> This is to make sure that any existing apps using PROT_WRITE still work.
>
> Earlier `protection_map[VM_WRITE]` used to pick read-write PTE encodings.
> Now `protection_map[VM_WRITE]` will always pick PAGE_SHADOWSTACK PTE
> encodings for shadow stack. Above changes ensure that existing apps
> continue to work because underneath kernel will be picking
> `protection_map[VM_WRITE|VM_READ]` PTE encodings.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/mman.h    | 24 ++++++++++++++++++++++++
>   arch/riscv/include/asm/pgtable.h |  1 +
>   arch/riscv/kernel/sys_riscv.c    | 11 +++++++++++
>   arch/riscv/mm/init.c             |  2 +-
>   mm/mmap.c                        |  1 +
>   5 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/include/asm/mman.h
>
> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
> new file mode 100644
> index 000000000000..ef9fedf32546
> --- /dev/null
> +++ b/arch/riscv/include/asm/mman.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MMAN_H__
> +#define __ASM_MMAN_H__
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +#include <uapi/asm/mman.h>
> +
> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +	unsigned long pkey __always_unused)
> +{
> +	unsigned long ret = 0;
> +
> +	/*
> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> +	 * Only VM_WRITE means shadow stack.
> +	 */
> +	if (prot & PROT_WRITE)
> +		ret = (VM_READ | VM_WRITE);
> +	return ret;
> +}
> +#define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
> +
> +#endif /* ! __ASM_MMAN_H__ */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 6066822e7396..4d5983bc6766 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -184,6 +184,7 @@ extern struct pt_alloc_ops pt_ops __initdata;
>   #define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>   #define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
>   					 _PAGE_EXEC | _PAGE_WRITE)
> +#define PAGE_SHADOWSTACK       __pgprot(_PAGE_BASE | _PAGE_WRITE)
>   
>   #define PAGE_COPY		PAGE_READ
>   #define PAGE_COPY_EXEC		PAGE_READ_EXEC
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index f1c1416a9f1e..846c36b1b3d5 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -8,6 +8,8 @@
>   #include <linux/syscalls.h>
>   #include <asm/cacheflush.h>
>   #include <asm-generic/mman-common.h>
> +#include <vdso/vsyscall.h>
> +#include <asm/mman.h>
>   
>   static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>   			   unsigned long prot, unsigned long flags,
> @@ -17,6 +19,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>   	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>   		return -EINVAL;
>   
> +	/*
> +	 * If only PROT_WRITE is specified then extend that to PROT_READ
> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
> +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
> +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
> +	 */
> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +		prot |= PROT_READ;
> +
>   	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>   			       offset >> (PAGE_SHIFT - page_shift_offset));
>   }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..98e5ece4052a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -299,7 +299,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>   static const pgprot_t protection_map[16] = {
>   	[VM_NONE]					= PAGE_NONE,
>   	[VM_READ]					= PAGE_READ,
> -	[VM_WRITE]					= PAGE_COPY,
> +	[VM_WRITE]					= PAGE_SHADOWSTACK,
>   	[VM_WRITE | VM_READ]				= PAGE_COPY,
>   	[VM_EXEC]					= PAGE_EXEC,
>   	[VM_EXEC | VM_READ]				= PAGE_READ_EXEC,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d89770eaab6b..57a974f49b00 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -47,6 +47,7 @@
>   #include <linux/oom.h>
>   #include <linux/sched/mm.h>
>   #include <linux/ksm.h>
> +#include <linux/processor.h>
>   
>   #include <linux/uaccess.h>
>   #include <asm/cacheflush.h>


What happens if someone restricts the permission to PROT_WRITE using 
mprotect()? I would say this is an issue since it would turn the pages 
into shadow stack pages.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
