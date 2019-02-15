Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81C5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B885222DC
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKtOxj6Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="r36eIZwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B885222DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swoioxGP2tKu76+wWPDkIOl/4s/L6pnPEI6vnxeidnA=; b=RKtOxj6Z6tEXae
	b/rg+M1Eh0F9QX7Gbf5m2tbOn7RGsIGrozwUDwZbZXZj5H1OLs7l0xKsCo4N40bzzD5nLVmr8gf03
	Uxe3X9e8UNKQjcUaTwGhIYpdRPv29mTzGgPZI8JZMSd+E5JzailOmbt1XZkRrzbpPrcuL853Ao0RL
	XOAC/r5SLckpsbvFL4MuvdN/iAHeiwAO8QqnKe9KSSzs1pB9qmB21MdVk7iI+cJlstw6ylbBeDTPm
	OztywFxNLos/iTUOa+G51PCgWe1b2gbuxeieekGPz16TfQ/xqr9mmgFQRnficHjoW6Lo7+S1pqeYD
	SeYMnIsBHXYtP6+FCMpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guYMn-0002pU-Po; Fri, 15 Feb 2019 07:57:01 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guYMk-0002pC-74
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 07:56:59 +0000
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x1F7uOG7009875
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 16:56:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x1F7uOG7009875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550217385;
 bh=+CMccOOQs2SIMZf8GEgGda1f8v4r4nxXcnL40kDZkWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r36eIZwVVVerHTYGeE8H+hEk+dhffubWfEDTlx9AG4RL30kTqsQTAzSh77Yzior4A
 rb6X+C8vBMNhI+YwVXTTjM9LnDfR3daR1tXWjaNmJyxsOuOMEwgjbx3rQc03c8GLxz
 yZZCqQIgSfqA8WYMLrpMBjDw4BX9lLoRV22TX4ikyjYGbQusLu59bvMGD5V59B/8Wo
 3uV/JlnVvKPwj25pwn015lWVfcZBo3cqXxUcljGmy7rPvZImAO+SSvn6svQVUDYcLq
 8E/lRD4NxqqWOXTgghHWu+Skw3KftagWt7hj8AEiV8rh1x0En6J0KRiWoXBxDfffXA
 cK/rnETWff5bw==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id y14so2041044vkd.1
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 23:56:24 -0800 (PST)
X-Gm-Message-State: AHQUAuag0g5X3Ag9JwH4kNHr3VoUu2RCUn8FPzn6c5roobk0Lq/numfo
 qf6XOVbtllYxb++pqEfj8I38vdNnWpzt9Ui75bY=
X-Google-Smtp-Source: AHgI3Ib2LcLTF5+1932eP4k/Ka4siIF35t+ho0EcrAqV+ljWi5cwUgFr5/PGJnMNXYpvgO5M7IKEjNDvTWma6+EqebI=
X-Received: by 2002:a1f:4406:: with SMTP id r6mr4284655vka.84.1550217383704;
 Thu, 14 Feb 2019 23:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-6-hch@lst.de>
In-Reply-To: <20190213174005.28785-6-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 16:55:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDdPabSOq6vHvxTPPWaMguJUEtok=dNrfnLEz=UtHO+w@mail.gmail.com>
Message-ID: <CAK7LNARDdPabSOq6vHvxTPPWaMguJUEtok=dNrfnLEz=UtHO+w@mail.gmail.com>
Subject: Re: [PATCH 05/11] tracing: consolidate the TRACE_IRQFLAGS_SUPPORT
 symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_235658_490380_B3192231 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Ley Foon Tan <lftan@altera.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

+CC: Ley Foon Tan <lftan@altera.com>
+CC: nios2-dev@lists.rocketboards.org


On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:

> diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
> index 715e6c09b4a5..3b50689007f5 100644
> --- a/arch/nios2/Kconfig
> +++ b/arch/nios2/Kconfig
> @@ -20,6 +20,7 @@ config NIOS2
>         select OF_EARLY_FLATTREE
>         select SOC_BUS
>         select SPARSE_IRQ
> +       select TRACE_IRQFLAGS_SUPPORT


This is a behavior change of nios2.

TRACE_IRQFLAGS_SUPPORT was previously 'n',
and this commit is changing it to 'y'.




Strangely, nios2 defines TRACE_IRQFLAGS_SUPPORT twice
with different default values.

In Kconfig, the first one becomes effective.

In this case, 'def_bool n' in arch/nios2/Kconfig is used.
'def_bool y' in arch/nios2/Kconfig.debug is dead code.


I think this select should be dropped
to keep the current behavior,
but I hope the NIOS2 maintainer will give us
some comments just in case.




>         select USB_ARCH_HAS_HCD if USB_SUPPORT
>         select CPU_NO_EFFICIENT_FFS
>         select ARCH_DISCARD_MEMBLOCK
> @@ -39,9 +40,6 @@ config NO_IOPORT_MAP
>  config FPU
>         def_bool n
>
> -config TRACE_IRQFLAGS_SUPPORT
> -       def_bool n
> -
>  menu "Kernel features"
>
>  source "kernel/Kconfig.hz"
> diff --git a/arch/nios2/Kconfig.debug b/arch/nios2/Kconfig.debug
> index f1da8a7b17ff..a8bc06e96ef5 100644
> --- a/arch/nios2/Kconfig.debug
> +++ b/arch/nios2/Kconfig.debug
> @@ -1,8 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -config TRACE_IRQFLAGS_SUPPORT
> -       def_bool y
> -
>  config EARLY_PRINTK
>         bool "Activate early kernel debugging"
>         default y

--
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
