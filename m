Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F8BC48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B552610EA
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 22:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B552610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LsiQPVu5Ndlghw1qbwkP11VFO8Gc88s4jVNI9ipG8k=; b=IoRcY33nudh/Ph+V9kuyl9qbme
	lM8MeZ88HrloRJZtdIsZXxIlhGQfp3uMOzOxlL4vIuizruqARcLOvHvreGPgPO4AGn4tYkYNefDjT
	sfh2UhbvWD5eu6knTQD/qZqFZ8Xp3p+K8aO+9CJxGNJNhS+OHDLBatP/Qd+nURMSiZVdpp1l2plNW
	PR1+djoNCSaTGNttsjBeN55gYGMB3hC1SmUK3ZJeduNHlM38Ubd7otd/Tb7IdCgB3W4wQ9VA947fb
	kUfseCKW2bT0KK4kMdifNg+8uDda1PMlfWA4LtctceeZ1TGjGufSuoeCrag60Mk9KYc7FSKAUSHzp
	IYgEX66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltH7g-003OQQ-ED; Tue, 15 Jun 2021 22:01:28 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltECm-002GQB-Ms
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:54:34 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6C97B100006;
 Tue, 15 Jun 2021 18:54:21 +0000 (UTC)
Subject: Re: [PATCH] riscv: Ensure BPF_JIT_REGION_START aligned with PMD size
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
References: <20210330022144.150edc6e@xhacker>
 <20210330022521.2a904a8c@xhacker> <87o8ccqypw.fsf@igel.home>
 <20210612002334.6af72545@xhacker> <87bl8cqrpv.fsf@igel.home>
 <20210614010546.7a0d5584@xhacker> <87im2hsfvm.fsf@igel.home>
 <20210615004928.2d27d2ac@xhacker>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <ab536c78-ba1c-c65c-325a-8f9fba6e9d46@ghiti.fr>
Date: Tue, 15 Jun 2021 20:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615004928.2d27d2ac@xhacker>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_115433_079128_E10B423C 
X-CRM114-Status: GOOD (  23.70  )
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

Hi Jisheng,

Le 14/06/2021 =E0 18:49, Jisheng Zhang a =E9crit=A0:
> From: Jisheng Zhang <jszhang@kernel.org>
> =

> Andreas reported commit fc8504765ec5 ("riscv: bpf: Avoid breaking W^X")
> breaks booting with one kind of config file, I reproduced a kernel panic
> with the config:
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

Good catch, we make sure no physical allocation happens between _end and =

the next PMD aligned address, but I missed this one.

> =

> To fix the issue, we need to ensure the BPF JIT region is PMD size
> aligned. This patch acchieve this goal by restoring the BPF JIT region
> to original position, I.E the 128MB before kernel .text section.

But I disagree with your solution: I made sure modules and BPF programs =

get their own virtual regions to avoid worst case scenario where one =

could allocate all the space and leave nothing to the other (we are =

limited to +- 2GB offset). Why don't just align BPF_JIT_REGION_START to =

the next PMD aligned address?

Again, good catch, thanks,

Alex

> =

> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/pgtable.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> =

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
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
