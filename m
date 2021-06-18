Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59428C48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 06:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221B861220
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 06:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221B861220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYvhgXeQdWu4N4A9juxKl5rNsjRNTHQz1UHiyQ7ufCI=; b=YRGCxM00U6IwoQL4CWFkesIQJr
	YLerZWfwNxSfJ5QW/ZjOcmmsuOx7aqrPuXSEXXqcHjRPyLVDiL5EQwfsHodceu5MIr7u+QjIhTo6k
	q/ZJUKWrQNRG5zF3MM33hSd/PI4wcUHXsiZeDlsg4VfVKZyngKwH8Al2fCFTSJl/g1pk6z96fRoWj
	5YFK4sfIoREDs3mmt8/Sk3uobcA3D6BS/guyMJ62LzOmpNsuS+/XfaiYCJ2p8+FrZriGU9BpEgI86
	rRPz4nw4lyJcNbZJS3pJjwM5hR4tM5hDc2vg3wop09MFqi4aiP/0P3UNbiDzkcugL1gN5eTeeBSAo
	4w1Se9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8Np-00CyKA-F2; Fri, 18 Jun 2021 06:53:41 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8Ix-00Cw47-8q
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 06:48:41 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8F2072000D;
 Fri, 18 Jun 2021 06:48:28 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Ensure BPF_JIT_REGION_START aligned with PMD
 size
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, schwab@linux-m68k.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, bjorn@kernel.org, ast@kernel.org, andrii@kernel.org,
 kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com
Cc: daniel@iogearbox.net, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org
References: <mhng-042979fe-75f0-4873-8afd-f8c07942f792@palmerdabbelt-glaptop>
 <ae256a5d-70ac-3a5f-ca55-5e4210a0624c@ghiti.fr>
 <50ebc99c-f0a2-b4ea-fc9b-cd93a8324697@ghiti.fr>
 <20210618012731.345657bf@xhacker> <20210618014648.1857a62a@xhacker>
 <20210618021038.52c2f558@xhacker> <20210618021535.29099c75@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <058cfd88-07f0-8079-51dc-928fe9ee4fdb@ghiti.fr>
Date: Fri, 18 Jun 2021 08:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618021535.29099c75@xhacker>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_234839_634476_E27B3CC0 
X-CRM114-Status: GOOD (  29.03  )
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

Le 17/06/2021 =E0 20:15, Jisheng Zhang a =E9crit=A0:
> Andreas reported commit fc8504765ec5 ("riscv: bpf: Avoid breaking W^X")
> breaks booting with one kind of defconfig, I reproduced a kernel panic
> with the defconfig:
> =

> [    0.138553] Unable to handle kernel paging request at virtual address =
ffffffff81201220
> [    0.139159] Oops [#1]
> [    0.139303] Modules linked in:
> [    0.139601] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5-defau=
lt+ #1
> [    0.139934] Hardware name: riscv-virtio,qemu (DT)
> [    0.140193] epc : __memset+0xc4/0xfc
> [    0.140416]  ra : skb_flow_dissector_init+0x1e/0x82
> [    0.140609] epc : ffffffff8029806c ra : ffffffff8033be78 sp : ffffffe0=
01647da0
> [    0.140878]  gp : ffffffff81134b08 tp : ffffffe001654380 t0 : ffffffff=
81201158
> [    0.141156]  t1 : 0000000000000002 t2 : 0000000000000154 s0 : ffffffe0=
01647dd0
> [    0.141424]  s1 : ffffffff80a43250 a0 : ffffffff81201220 a1 : 00000000=
00000000
> [    0.141654]  a2 : 000000000000003c a3 : ffffffff81201258 a4 : 00000000=
00000064
> [    0.141893]  a5 : ffffffff8029806c a6 : 0000000000000040 a7 : ffffffff=
ffffffff
> [    0.142126]  s2 : ffffffff81201220 s3 : 0000000000000009 s4 : ffffffff=
81135088
> [    0.142353]  s5 : ffffffff81135038 s6 : ffffffff8080ce80 s7 : ffffffff=
80800438
> [    0.142584]  s8 : ffffffff80bc6578 s9 : 0000000000000008 s10: ffffffff=
806000ac
> [    0.142810]  s11: 0000000000000000 t3 : fffffffffffffffc t4 : 00000000=
00000000
> [    0.143042]  t5 : 0000000000000155 t6 : 00000000000003ff
> [    0.143220] status: 0000000000000120 badaddr: ffffffff81201220 cause: =
000000000000000f
> [    0.143560] [<ffffffff8029806c>] __memset+0xc4/0xfc
> [    0.143859] [<ffffffff8061e984>] init_default_flow_dissectors+0x22/0x60
> [    0.144092] [<ffffffff800010fc>] do_one_initcall+0x3e/0x168
> [    0.144278] [<ffffffff80600df0>] kernel_init_freeable+0x1c8/0x224
> [    0.144479] [<ffffffff804868a8>] kernel_init+0x12/0x110
> [    0.144658] [<ffffffff800022de>] ret_from_exception+0x0/0xc
> [    0.145124] ---[ end trace f1e9643daa46d591 ]---
> =

> After some investigation, I think I found the root cause: commit
> 2bfc6cd81bd ("move kernel mapping outside of linear mapping") moves
> BPF JIT region after the kernel:
> =

> The &_end is unlikely aligned with PMD size, so the front bpf jit
> region sits with part of kernel .data section in one PMD size mapping.
> But kernel is mapped in PMD SIZE, when bpf_jit_binary_lock_ro() is
> called to make the first bpf jit prog ROX, we will make part of kernel
> .data section RO too, so when we write to, for example memset the
> .data section, MMU will trigger a store page fault.
> =

> To fix the issue, we need to ensure the BPF JIT region is PMD size
> aligned. This patch acchieve this goal by restoring the BPF JIT region
> to original position, I.E the 128MB before kernel .text section. The
> modification to kasan_init.c is inspired by Alexandre.
> =

> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> =

> Since v1:
>   - Fix early boot hang when kasan is enabled
>   - Update Documentation/riscv/vm-layout.rst
> =

>   Documentation/riscv/vm-layout.rst |  4 ++--
>   arch/riscv/include/asm/pgtable.h  |  5 ++---
>   arch/riscv/mm/kasan_init.c        | 10 +++++-----
>   3 files changed, 9 insertions(+), 10 deletions(-)
> =

> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-l=
ayout.rst
> index 329d32098af4..b7f98930d38d 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -58,6 +58,6 @@ RISC-V Linux Kernel SV39
>                                                                 |
>     ____________________________________________________________|________=
____________________________________________________
>                       |            |                  |         |
> -   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules
> -   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel, =
BPF
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules,=
 BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
>     __________________|____________|__________________|_________|________=
____________________________________________________
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 9469f464e71a..380cd3a7e548 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -30,9 +30,8 @@
>   =

>   #define BPF_JIT_REGION_SIZE	(SZ_128M)
>   #ifdef CONFIG_64BIT
> -/* KASLR should leave at least 128MB for BPF after the kernel */
> -#define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
> -#define BPF_JIT_REGION_END	(BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_START	(BPF_JIT_REGION_END - BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_END	(MODULES_END)
>   #else
>   #define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
>   #define BPF_JIT_REGION_END	(VMALLOC_END)
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 9daacae93e33..d7189c8714a9 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -169,7 +169,7 @@ static void __init kasan_shallow_populate(void *start=
, void *end)
>   =

>   void __init kasan_init(void)
>   {
> -	phys_addr_t _start, _end;
> +	phys_addr_t p_start, p_end;


IMHO this fix deserves its own patch, it is not related to the issue you =

describe in the changelog and has been around for some time.

That's too bad BPF people did not answer my question regarding BPF <-> =

modules calls: I'll ask the question directly in kasan-dev mailing list =

and add you in cc.


>   	u64 i;
>   =

>   	/*
> @@ -189,9 +189,9 @@ void __init kasan_init(void)
>   			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
>   =

>   	/* Populate the linear mapping */
> -	for_each_mem_range(i, &_start, &_end) {
> -		void *start =3D (void *)__va(_start);
> -		void *end =3D (void *)__va(_end);
> +	for_each_mem_range(i, &p_start, &p_end) {
> +		void *start =3D (void *)__va(p_start);
> +		void *end =3D (void *)__va(p_end);
>   =

>   		if (start >=3D end)
>   			break;
> @@ -201,7 +201,7 @@ void __init kasan_init(void)
>   =

>   	/* Populate kernel, BPF, modules mapping */
>   	kasan_populate(kasan_mem_to_shadow((const void *)MODULES_VADDR),
> -		       kasan_mem_to_shadow((const void *)BPF_JIT_REGION_END));
> +		       kasan_mem_to_shadow((const void *)MODULES_VADDR + SZ_2G));
>   =

>   	for (i =3D 0; i < PTRS_PER_PTE; i++)
>   		set_pte(&kasan_early_shadow_pte[i],
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
