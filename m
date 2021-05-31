Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC62C47082
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 15:18:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55035610A6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 15:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55035610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWyTk4Sywaq2LUcdLuqZmCLO6qZbYIoygNQW5HGOltI=; b=JpO8gSfuNsFw/uv+LuJPZCx67F
	uFbcX/84aL4yeCTR2c9g3JywoDzjqtm0DnonQimRFG0kUXAEHMzUrEiJ5X+dZdVnwKbPl1q8hgeJk
	IFay1ue+irGv1iQP4hSk08d3SO35/bjxVJfZIW1VKC3bGmCNPZRuBgq03CRtt3GSHeyvvcOnlScPL
	Rig8BWR5uMerqisgvY7KsSDWsOttCigEhyVXKopd0da1Gh+jw/BGn8GjO1T8pWOuxtSA1OImlB1EJ
	eX4D3kd8iibLpdW3C5JEAXOrC+Q2smIaj+7zm6XxJvj/QR3I5TiNCU4cTxeAwd4n8uVzWwznZRj6s
	ZDeJoGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnjfi-00CicM-AK; Mon, 31 May 2021 15:17:42 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnjfa-00Cibe-6U
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 15:17:35 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DED5240009;
 Mon, 31 May 2021 15:17:25 +0000 (UTC)
Subject: Re: [PATCH] riscv: xip: support runtime trap patching
To: Vitaly Wool <vitaly.wool@konsulko.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Nicolas Pitre <nico@fluxnic.net>
References: <20210531085342.17494-1-vitaly.wool@konsulko.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <62961217-1733-eaa3-b072-cbb252620c9a@ghiti.fr>
Date: Mon, 31 May 2021 17:17:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210531085342.17494-1-vitaly.wool@konsulko.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_081734_536210_AF5FF8B3 
X-CRM114-Status: GOOD (  22.83  )
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

Hi Vitaly,

Le 31/05/2021 =E0 10:53, Vitaly Wool a =E9crit=A0:
> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is currently
> not possible when the kernel is executed from the flash in XIP mode.
> Since runtime patching concerns only traps at the moment, let's just
> have all the traps reside in RAM anyway if RISCV_ERRATA_ALTERNATIVE
> is set. Thus, these functions will be patch-able even when the .text
> section is in flash.
> =


This sounds like a good fix for sifive platforms to work with XIP kernel =

in 5.13: did you test that it actually works on HW?

> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>   arch/riscv/kernel/traps.c           | 13 +++++++++----
>   arch/riscv/kernel/vmlinux-xip.lds.S | 15 ++++++++++++++-
>   2 files changed, 23 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0721b9798595..7bc88d8aab97 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -86,8 +86,13 @@ static void do_trap_error(struct pt_regs *regs, int si=
gno, int code,
>   	}
>   }
>   =

> +#if defined (CONFIG_XIP_KERNEL) && defined (CONFIG_RISCV_ERRATA_ALTERNAT=
IVE)
> +#define __trap_section		__section(".xip.traps")
> +#else
> +#define __trap_section
> +#endif

Maybe we could do something more generic. At the moment, only traps are =

subject to alternatives but that will likely expand: what about rather =

defining a section called __alternative_section?

>   #define DO_ERROR_INFO(name, signo, code, str)				\
> -asmlinkage __visible void name(struct pt_regs *regs)			\
> +asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
>   {									\
>   	do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
>   }
> @@ -111,7 +116,7 @@ DO_ERROR_INFO(do_trap_store_misaligned,
>   int handle_misaligned_load(struct pt_regs *regs);
>   int handle_misaligned_store(struct pt_regs *regs);
>   =

> -asmlinkage void do_trap_load_misaligned(struct pt_regs *regs)
> +asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *r=
egs)
>   {
>   	if (!handle_misaligned_load(regs))
>   		return;
> @@ -119,7 +124,7 @@ asmlinkage void do_trap_load_misaligned(struct pt_reg=
s *regs)
>   		      "Oops - load address misaligned");
>   }
>   =

> -asmlinkage void do_trap_store_misaligned(struct pt_regs *regs)
> +asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *=
regs)
>   {
>   	if (!handle_misaligned_store(regs))
>   		return;
> @@ -146,7 +151,7 @@ static inline unsigned long get_break_insn_length(uns=
igned long pc)
>   	return GET_INSN_LENGTH(insn);
>   }
>   =

> -asmlinkage __visible void do_trap_break(struct pt_regs *regs)
> +asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *r=
egs)
>   {
>   #ifdef CONFIG_KPROBES
>   	if (kprobe_single_step_handler(regs))
> diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmli=
nux-xip.lds.S
> index 4b29b9917f99..a3ff09c4c3f9 100644
> --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> @@ -99,9 +99,22 @@ SECTIONS
>   	}
>   	PERCPU_SECTION(L1_CACHE_BYTES)
>   =

> -	. =3D ALIGN(PAGE_SIZE);
> +	. =3D ALIGN(8);
> +	.alternative : {
> +		__alt_start =3D .;
> +		*(.alternative)
> +		__alt_end =3D .;
> +	}
>   	__init_end =3D .;
>   =

> +	. =3D ALIGN(16);

Why 16 here?

> +	.xip.traps : {
> +		__xip_traps_start =3D .;
> +		*(.xip.traps)
> +		__xip_traps_end =3D .;
> +	}
> +
> +	. =3D ALIGN(PAGE_SIZE);
>   	.sdata : {
>   		__global_pointer$ =3D . + 0x800;
>   		*(.sdata*)
> =


Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
