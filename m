Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E36EC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 14:10:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283516105A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 14:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283516105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q1UrT7r0BYTDuKb5KJxw9aB5XBFzpBpZTUtNcu3UR4c=; b=qLiOuxoIyhVHkMiW2AjhLwbYC
	pS6vl3MIknNIyI0LSZNLelXfQllU3wtLrp/J45jBe3FAmkNkzntl3TtdO6iQ8xDPOV09qzW0aFQ7M
	8xSQCpjWq7xS6CE8TlEs6PKbVIgpVyilxv62RTAWDF7JJ3/dpvldEHQmocumfsVi6ZgAwkEyITyYO
	kgZy21OV/9/ecTEcQrmjWAan4RGeVt19bwlUWMrTDwPJTiB7embbARQYqVgGWY7kapRjT1Ot7/ctq
	eM8GCLm3T6u6lmt43dlujKCROrN3YgboA2wEeQbmgepUDL7/tO/alcvrabcsMZjaVdPag5PlnGLqb
	tQqxONrMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc7Mn-005m6d-Or; Thu, 29 Apr 2021 14:10:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7Mi-005m5M-TS
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 14:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=OgFGXXSiEJ+QtTuD1AXEFx871ayTGwYCsReXPJqgq20=; b=UGlmwR8xaD9OLMsgGzvwXPXPNK
 n0HzMVm9yoq30w7fHSGnK048A2Sne4aT74h6zO+ZIKBP66rDft3hbKQXxO/3gVbNGxTbq/unn9fWk
 5A8tbdCMWEoJabVBseTQcfY0AcIF+9JD+mLQ1+Hc+uR0/SdYu1Nh9AbIEXa01Wqa3DWOcgT92PPB7
 V6bn9HTnPq6e+QwgC2kVyL63Nzf2yZTlcMWRH4SBok5K9TV7+BdQOEl0eH268PvzDwqwWgnOf6w4j
 QZGghNM0gSrBTf56/F7tjK9T6XP92MQFCAOX7MPEGX6EsLc7Z6g1+j6+vl/fEzolOmE77jHYkGNif
 MmOBhTvQ==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc7Mf-000gEe-Tb
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 14:10:03 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2EDBA2000A;
 Thu, 29 Apr 2021 14:09:53 +0000 (UTC)
Subject: Re: [PATCH] riscv: Only extend kernel reservation if mapped read-only
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1a7660125046b94db9c6a7d62aa0ce88c8cd2f1d.1619617340.git.geert+renesas@glider.be>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <605dc5e8-0a41-7458-6037-d6263b0ffd59@ghiti.fr>
Date: Thu, 29 Apr 2021 10:09:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1a7660125046b94db9c6a7d62aa0ce88c8cd2f1d.1619617340.git.geert+renesas@glider.be>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_071002_114329_795E1A9E 
X-CRM114-Status: GOOD (  25.89  )
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

Hi Geert,

Le 4/28/21 =E0 9:45 AM, Geert Uytterhoeven a =E9crit=A0:
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
> needed, i.e. matching the conditional logic around the call to
> protect_kernel_linear_mapping_text_rodata().
> =

> Fixes: 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of linear ma=
pping")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Only tested on K210 (SiPeed MAIX BiT):
> =

>      -Memory: 5852K/8192K available (1344K kernel code, 147K rwdata, 272K=
 rodata, 106K init, 72K bss, 2340K reserved, 0K cma-reserved)
>      +Memory: 5948K/8192K available (1344K kernel code, 147K rwdata, 272K=
 rodata, 106K init, 72K bss, 2244K reserved, 0K cma-reserved)
> =

> Yes, I was lucky, as only 96 KiB was lost ;-)
> ---
>   arch/riscv/mm/init.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 788eb222deacf994..3439783f26abc488 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -136,11 +136,17 @@ void __init setup_bootmem(void)
>   =

>   	/*
>   	 * Reserve from the start of the kernel to the end of the kernel
> -	 * and make sure we align the reservation on PMD_SIZE since we will
> +	 */
> +#if defined(CONFIG_STRICT_KERNEL_RWX) && defined(CONFIG_64BIT) && \
> +    defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)

ARCH_HAS_STRICT_KERNEL_RWX depends on MMU and !XIP_KERNEL so I think you =

can get rid of those checks.

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


Thanks for fixing this,

Alex




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
