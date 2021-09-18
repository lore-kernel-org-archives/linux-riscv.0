Return-Path: <SRS0=8Mga=OI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B728C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 16:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D8A260EFF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 16:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D8A260EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA84h1gzd+cyQXlwAv0VSzk2PsUeHZfqNnalp2+3fmc=; b=eKV4cr5Y3Lz32gLWm4gZzmwZD2
	A8KvB8B4hRvxQNN9rHSwPoCeqw01lJ0VGOelYBpO6wXjr+r+ci81sE/wQwCAAVrTOTi/VQBTXnj9k
	bJO4WagHEXblKQ3bGW8PzvgZmwqbjM6tiuzrWq+QW5+ge0fpafMqUgFB2bojmP876jZNKtd2GBbD+
	cuhte0+EcCJkvbaTCjJabaz65sShls+NPln5z38zPpHEv4shF6zfqYRtK+VA4C8jwBG2XgAL3ykI+
	puSubEgxI/1qe7QpWyFjnrRm7recP1Vm9qIi3ST79WwymfkNiwSox0QNz0OMWrtBwPPh/nfmD6bck
	LLslF0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRcqA-00G4Vt-8P; Sat, 18 Sep 2021 16:05:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRcq6-00G4Ut-JR
 for linux-riscv@lists.infradead.org; Sat, 18 Sep 2021 16:05:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3CA9160002;
 Sat, 18 Sep 2021 16:05:12 +0000 (UTC)
Subject: Re: [PATCH] riscv: Flush current cpu icache before other cpus
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210918160221.111902-1-alex@ghiti.fr>
Cc: stable@vger.kernel.org
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <66013f6b-e3d0-2fbf-c02b-93899c2b4696@ghiti.fr>
Date: Sat, 18 Sep 2021 18:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210918160221.111902-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_090518_960792_D4DCFCBF 
X-CRM114-Status: GOOD (  20.78  )
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

(+cc stable)

Le 18/09/2021 =E0 18:02, Alexandre Ghiti a =E9crit=A0:
> On SiFive Unmatched, I recently fell onto the following BUG when booting:
> =

> [    0.000000] ftrace: allocating 36610 entries in 144 pages
> [    0.000000] Oops - illegal instruction [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.1+ #5
> [    0.000000] Hardware name: SiFive HiFive Unmatched A00 (DT)
> [    0.000000] epc : riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000]  ra : __sbi_rfence_v02+0xc8/0x10a
> [    0.000000] epc : ffffffff80007240 ra : ffffffff80009964 sp : ffffffff=
81803e10
> [    0.000000]  gp : ffffffff81a1ea70 tp : ffffffff8180f500 t0 : ffffffe0=
7fe30000
> [    0.000000]  t1 : 0000000000000004 t2 : 0000000000000000 s0 : ffffffff=
81803e60
> [    0.000000]  s1 : 0000000000000000 a0 : ffffffff81a22238 a1 : ffffffff=
81803e10
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 00000000=
00000000
> [    0.000000]  a5 : 0000000000000000 a6 : ffffffff8000989c a7 : 00000000=
52464e43
> [    0.000000]  s2 : ffffffff81a220c8 s3 : 0000000000000000 s4 : 00000000=
00000000
> [    0.000000]  s5 : 0000000000000000 s6 : 0000000200000100 s7 : 00000000=
00000001
> [    0.000000]  s8 : ffffffe07fe04040 s9 : ffffffff81a22c80 s10: 00000000=
00001000
> [    0.000000]  s11: 0000000000000004 t3 : 0000000000000001 t4 : 00000000=
00000008
> [    0.000000]  t5 : ffffffcf04000808 t6 : ffffffe3ffddf188
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: =
0000000000000002
> [    0.000000] [<ffffffff80007240>] riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000] [<ffffffff80009474>] sbi_remote_fence_i+0x1e/0x26
> [    0.000000] [<ffffffff8000b8f4>] flush_icache_all+0x12/0x1a
> [    0.000000] [<ffffffff8000666c>] patch_text_nosync+0x26/0x32
> [    0.000000] [<ffffffff8000884e>] ftrace_init_nop+0x52/0x8c
> [    0.000000] [<ffffffff800f051e>] ftrace_process_locs.isra.0+0x29c/0x360
> [    0.000000] [<ffffffff80a0e3c6>] ftrace_init+0x80/0x130
> [    0.000000] [<ffffffff80a00f8c>] start_kernel+0x5c4/0x8f6
> [    0.000000] ---[ end trace f67eb9af4d8d492b ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle tas=
k!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the=
 idle task! ]---
> =

> While ftrace is looping over a list of addresses to patch, it always fail=
ed
> when patching the same function: riscv_cpuid_to_hartid_mask. Looking at t=
he
> backtrace, the illegal instruction is encountered in this same function.
> However, patch_text_nosync, after patching the instructions, calls
> flush_icache_range. But looking at what happens in this function:
> =

> flush_icache_range -> flush_icache_all
>                     -> sbi_remote_fence_i
>                     -> __sbi_rfence_v02
>                     -> riscv_cpuid_to_hartid_mask
> =

> The icache and dcache of the current cpu are never synchronized between t=
he
> patching of riscv_cpuid_to_hartid_mask and calling this same function.
> =

> So fix this by flushing the current cpu's icache before asking for the ot=
her
> cpus to do the same.
> =

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>   arch/riscv/mm/cacheflush.c | 2 ++
>   1 file changed, 2 insertions(+)
> =

> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 094118663285..89f81067e09e 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -16,6 +16,8 @@ static void ipi_remote_fence_i(void *info)
>   =

>   void flush_icache_all(void)
>   {
> +	local_flush_icache_all();
> +
>   	if (IS_ENABLED(CONFIG_RISCV_SBI))
>   		sbi_remote_fence_i(NULL);
>   	else
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
