Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C79C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D2261449
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 09:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D2261449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mIiBCgFl2g1shncyjhY26dGe1Bi/etLjPZED6vhwf3s=; b=eHvPrfU+WhLCAschU3FrxBsPi
	8nOOa3DiqjJTHDAQRPVpui6GMIlFOplCqzXMz2Y+/VJmV4tTuANrz7V4HmvufMwNTVsA1FE+89DxH
	s7ri8hYUbCW266C/yHddMgemdPdQ2Rn/BBi07BduJUWwWMpB1Q4peKA/B/dYAepvDeKmPHVsTTLhj
	/BFsNyGsD0JRwOKtC8GY3qvPnpYhoQgi++vqBJt9U0yLfDk+5j8eSxg0sH37Xb724+lIQ+37UN40S
	fjY/Jn8zLCkqMEm2LLOzF644qwTxd5UFFIVVc3qdjolXiJ8GN9bdbAHysUpZQIUy/UiKr/e3Hipbz
	OjDZutmGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2bI-005PLV-4X; Thu, 29 Apr 2021 09:04:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2bE-005PKu-Qa
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 09:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JhU1X3vzNY9wzqlownyXgot5D1Z6xMdc1aK+MIYwVRU=; b=BZXDC00irzc+gYmPwnpO+SHv2R
 UiFuf9UtQCLA23rLcezaYSzC86ipJXcqk+IyUyM8QcenF+bSxRWWJTIAqBbXyuJoFWeQ3yxeRoRBM
 PBvPxpDDy15MJEwoqEqsJg9wijTuEJTyGgC9INe2M07pd4qmHHho4Sr7Y/+hdDVnZqXUZHGM63qUH
 2NcGkdiQmJUAq8+9mHxXddcfb3gCP/aNX54rEj1XuDVr9jX3Dz0RvimrYcz4teRVnu03Uuv4KaJRQ
 ZFKnf1FdWH3drF8Pk+7itKhfitS+s38WNSZ9rEYQ9vIDzt9+o2naXAuRk/Yhz19zX+rSJRSu5EDjI
 RcRLdB9A==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2bC-000Vdf-9S
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 09:04:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n84so8183392wma.0
 for <linux-riscv@lists.infradead.org>; Thu, 29 Apr 2021 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhU1X3vzNY9wzqlownyXgot5D1Z6xMdc1aK+MIYwVRU=;
 b=t/IbhjoE8jmfMZ9QBRuEgF4tv6CnbIFCLQAno93ZIaMtu5yv3p3e3DT29e5uJ4ziA7
 N+AFskSWzdmW9bPZYeBZXw7Q9jZuU2t+/l+tuwVNC6igNHRFYgz2IW0Diaotbj5TzwsD
 sLvhjVAAAU0gsE1qCZDkQnAJMsQRX6bgfouJZQutiHPYTzWUwU11KFfUzqaAEkUxPonm
 hVgVlYeSCu6BM3G9000OFKy/4zTlUrFRM7L6kkfTxUkExY8YzN/7ugaRmhppDePFGB8g
 SSKSZRHa8bFvL+E8Eh6bDfr0KPQvcOs8WxWltxBcjdHGFR5pFfqg2oTjT9CpdEwa6u33
 zSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhU1X3vzNY9wzqlownyXgot5D1Z6xMdc1aK+MIYwVRU=;
 b=AaBIzaiLR/mW5bNKmzyNBD3u8dSEnPUn+vSLoiSrOq62leOmvMhk4KgoViHe+t997x
 vcCPKIHlsSZitJuLh/hzrmQOkkbc7lKPDY23eY+Mgw3p1pIjlMyH7/eEiWPxz2CegaR9
 ftczz8XWSk/JsVSCTbKbo4mzyYtRgNmp7QSCRjh/gmrtcf/+6EL4Ysa1+p/GQjQcSrUC
 JwAU+n3Nj8STEeaDBND+/oBYN5PnWzM3T1X39nv7ypACGQhtiJUP9NouA+uSb8sYALQA
 n8oBylMFT1Z4XCaVb9Os4rjjqi5bsSm45U8llv1RyhPv87T43s06RRPRKg19W/XtJGxz
 CMVQ==
X-Gm-Message-State: AOAM530IwdYDNxC6UxbbP7mSHjAGO/s8ce5kVQZJVugyqFeo38u0bjto
 llcHZU2zpelbzhTug7fIIO+n1ZccD7ziSmzZKTE21w==
X-Google-Smtp-Source: ABdhPJzkClW+CZRM7U3328nJPfxASbz419Mgf0KujwF2sTQwvB0Bo179KhVMxhhdAv31iWSBSVxYp7xOyAOc9tfk4JY=
X-Received: by 2002:a7b:c348:: with SMTP id l8mr9414474wmj.152.1619687079775; 
 Thu, 29 Apr 2021 02:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210429084541.28083-1-alex@ghiti.fr>
In-Reply-To: <20210429084541.28083-1-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Apr 2021 14:34:28 +0530
Message-ID: <CAAhSdy0Wxjop+X2AUp8azDS9JdD21pmdapUjH0vU9rNBu7Evjg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_020442_396857_EAE97562 
X-CRM114-Status: GOOD (  20.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 2:15 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not possible when
> the kernel is executed from the flash in XIP mode, and as the SIFIVE
> errata must be fixed somehow, disallow to build a XIP kernel that
> supports SIFIVE socs.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig.erratas | 2 +-
>  arch/riscv/Kconfig.socs    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index d5d03ae8d685..9537dbd67357 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>
>  config RISCV_ERRATA_ALTERNATIVE
>         bool "RISC-V alternative scheme"
> -       default y
> +       default y if !XIP_KERNEL
>         help
>           This Kconfig allows the kernel to automatically patch the
>           errata required by the execution platform at run time. The
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 00c2b205654c..9cb38bc9d7cd 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -9,6 +9,7 @@ config SOC_MICROCHIP_POLARFIRE
>
>  config SOC_SIFIVE
>         bool "SiFive SoCs"
> +       depends on !XIP_KERNEL

Does this mean that now all SOCs will have to explicitly say
"depends on !XIP_KERNEL"

How about adding "depends on !XIP_KERNEL" for RISCV_ERRATA_ALTERNATIVE ?

Regards,
Anup

>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select CLK_SIFIVE
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
