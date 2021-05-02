Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955B9C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 14:06:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D14613C6
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 14:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D14613C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nLzxm8TaFTG1ykEJlxxlIP48A1NZ9l/PJwW3SophYEw=; b=bIqv/8qSyVmCKtFZ9Qx6gKMn5
	nEcYkdcxxB5yi0aUfd3BY0YuA7XWrAsDFf3oTt184IeAJfsBbSsgvGYymlXboMP2Yz4zgWCAlnMiD
	Ehy1Iu+xTZlk/4jlTP1y53rcIW/Fa3+ICPjRcZ7H3ABeT35YXG32C9DcPkH0AuzYrDVOpdc30KYNM
	zL7pIKdhDujiKBt2lpfIaIWGJ0WVLuTQ5GGt6OyABhu/qg1zn2I38246vYu3DbgYVyF6RiahaXaYA
	NOCq24tRtwlcQphk0Vh7gFJVuAA4PoQPJ9w3yi/SoR5YBbSA+dP2Wqbh7oaQ6jeaHLpy5Reu5AZK0
	h8w7g5ilg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldCjK-00Bt7V-Ky; Sun, 02 May 2021 14:05:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCij-00Bswp-ET
 for linux-riscv@desiato.infradead.org; Sun, 02 May 2021 14:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GRXSP0g9Zaoyw+r1NcsNmqcb0c50DX+UbnLqRUJJUR4=; b=IYLHNRSFzgRIFbCezRGWgG8Ehv
 gQP7E4TiSFDvq2LW0Wqlgo6W8HxmwHK4/ypCjanHtlRskRJhC8PhzpYINTTfGsEwePkedKOb8VyTf
 UOQ6xXzQOUarAHEmFJ4OjiFMoxNHGe9bdLF6AxMis5qo/ut+ivhXXngxXUh6+PZLM6Gg9RYFM44R4
 OAauPJiUfr4rU75kvFld2O0AS9eRKoxayk8ucqlZ+H+/Lgxoyo0IZ/cFRKSvI9qiW9hnQLX0m2eZ3
 6R4dKLIwG1/c+2q3j/v8nqzsadAoHsjxg3oTqx0pXtGeX0gkynro+LHt7fudYkDodZzwCzsSW4F4i
 lKEENKiw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCig-002YTP-HN
 for linux-riscv@lists.infradead.org; Sun, 02 May 2021 14:05:16 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BCFFF1C0003;
 Sun,  2 May 2021 14:05:05 +0000 (UTC)
Subject: Re: [PATCH v2] riscv: Only extend kernel reservation if mapped
 read-only
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <02e05df076da23fc0f52c944bbf0a5cb99e95bd6.1619708542.git.geert+renesas@glider.be>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <b346f33d-a5aa-85c5-327d-626e03f2f5de@ghiti.fr>
Date: Sun, 2 May 2021 10:05:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <02e05df076da23fc0f52c944bbf0a5cb99e95bd6.1619708542.git.geert+renesas@glider.be>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_070514_733046_14F829BC 
X-CRM114-Status: GOOD (  26.89  )
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

Le 4/29/21 =E0 11:05 AM, Geert Uytterhoeven a =E9crit=A0:
> When the kernel mapping was moved outside of the linear mapping, the
> kernel memory reservation was increased, to take into account mapping
> granularity.  However, this is done unconditionally, regardless of
> whether the kernel memory is mapped read-only or not.
> =

> If this extension is not needed, up to 2 MiB may be lost, which has a
> big impact on e.g. Canaan K210 (64-bit nommu) platforms with only 8 MiB
> of RAM.
> =

> Reclaim the lost memory by only extending the reserved region when
> needed, i.e. depending on a simplified version of the conditional logic
> around the call to protect_kernel_linear_mapping_text_rodata().
> =

> Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear ma=
pping")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Simplify the conditional, as STRICT_KERNEL_RWX depends on
>      MMU && !XIP_KERNEL.
> =

> Only tested on K210 (SiPeed MAIX BiT):
> =

>      -Memory: 5852K/8192K available (1344K kernel code, 147K rwdata, 272K=
 rodata, 106K init, 72K bss, 2340K reserved, 0K cma-reserved)
>      +Memory: 5948K/8192K available (1344K kernel code, 147K rwdata, 272K=
 rodata, 106K init, 72K bss, 2244K reserved, 0K cma-reserved)
> =

> Yes, I was lucky, as only 96 KiB was lost ;-)
> ---
>   arch/riscv/mm/init.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 788eb222deacf994..3ebc0f5d2b73b42b 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -136,11 +136,16 @@ void __init setup_bootmem(void)
>   =

>   	/*
>   	 * Reserve from the start of the kernel to the end of the kernel
> -	 * and make sure we align the reservation on PMD_SIZE since we will
> +	 */
> +#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> +	/*
> +	 * Make sure we align the reservation on PMD_SIZE since we will
>   	 * map the kernel in the linear mapping as read-only: we do not want
>   	 * any allocation to happen between _end and the next pmd aligned page.
>   	 */
> -	memblock_reserve(vmlinux_start, (vmlinux_end - vmlinux_start + PMD_SIZE=
 - 1) & PMD_MASK);
> +	vmlinux_end =3D (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
> +#endif
> +	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>   =

>   	/*
>   	 * memblock allocator is not aware of the fact that last 4K bytes of
> =


I tested this on the following configs:

- rv32_defconfig (build and valid on qemu)
- defconfig (with and without CONFIG_STRICT_KERNEL_RWX) (build and valid =

on qemu)
- xip kernel (build and valid on qemu)
- nommu_k210_defconfig (build only)

so you can add:

Tested-by: Alexandre Ghiti <alex@ghiti.fr>

Thank you again for that,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
