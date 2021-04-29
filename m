Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABDC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 09:12:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836546143D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 09:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 836546143D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=88Hs5VMzG7sL+FOmDcbbSUsGBKdCkbJnflnxRI3sYsc=; b=Zg3tVcpLgBl/at+k3nNSiM8FB
	t3qYafeZXNDbTBYW7ZOf/YZ3l5IW+luZiSrZBUsbW6mpfErpuEJ239e84bAq2eYNn5nRS7T4Z0zQ/
	VgsZR+WPx7YxlI4Yk+ixcIGBV/tFfcpGm2Qwif+eTPMTea+WJpM4+BmIT+u9//JueicC3z6cbqumQ
	pXGwDMgMuMKVToptRMeOgnN6K2hRpY1J2PMINZnVdMcv7ekrKHjEukSoLQtJEbB8ovlhcQdWoyV5J
	Enf12IA0TvyySGIKOPSkc+SH3kCTemabGDCUTqXn10SbnLMp5xYa32ZxNbPh6DwA51fxcB1ZyJcqG
	5mKiGvcaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2iT-005Q6N-Qq; Thu, 29 Apr 2021 09:12:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2iR-005Q5z-O9
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 09:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jUQerQ7HmMjJ6I/BYS0A6Oi2QMhIX3dppb9FwnW9e9Y=; b=BFBSi1EgrOX9icn60vqhJ+yJfd
 egY/84ZRFXMcUJIDiOtwWYAfo2nC9igMwrxoJNo41jXDNXdgh6mER0RugsVik4oTdx3VhNmF3ifez
 QhHwZCLr4LF+O8CQcA5AiP4pAkVQQgtHq4nx7AzRrvTpT6mHCO4oDoPaDUu420eQ5RqEvR4vfLBR9
 0O5Wmti4rID+arqF/YmzDTw7orbpfF4evc3uFuqYbBwRVOILn3yAKNUI54FVuYnXPQLWZj7yuicJz
 +lt8bFNJ2+jNBMGQUtDsEIUVDiTY53j9cmcEBghwwDk8FhfiriemAmjfchxSSQRgesdc/6eNpzcfn
 732GGe0A==;
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2iO-000Vxn-Vp
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 09:12:10 +0000
Received: by mail-lf1-x131.google.com with SMTP id n138so103854057lfa.3
 for <linux-riscv@lists.infradead.org>; Thu, 29 Apr 2021 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUQerQ7HmMjJ6I/BYS0A6Oi2QMhIX3dppb9FwnW9e9Y=;
 b=qRK90K4NjKongoIsln74lxIykKe/b2JvthSH33TfE2+g+CFr5PbnjGg4nkINSkxGpz
 PfmGGOHik/6elmqnxUB14vTAM9+M6l+nlU/atjUAKRk7y+0fpq5cEqtkyXYHkJBo89Bp
 7/5BschtB4EGHak5z7CgmUf45Bw/uy55yFMQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUQerQ7HmMjJ6I/BYS0A6Oi2QMhIX3dppb9FwnW9e9Y=;
 b=RZx08UwvrZc3QXjB0E/5lYFcnrsNHEKrQZ7C/JN2LnuUVvRHuDnLuIYUkWTjw49iPS
 v5flGv0Zm9cw00IS8CycSwhOHpzRhVSwJ3cKbp0nEB8ZFAyuTMx6sYFj4ttgw6WW7Wro
 0AUIau0TTboGsa+4j+jyzsMQB2TYF0BU0x9keQljM22SFJgCz61d143U/+LyZZPUgZIB
 TUZmAaiyuHlZu4JuCP3E6J+tVhQJyT3QcUY2bnjRjCr26psn1UfDZB4s64G7dzMMl0cZ
 UqhkarNL5ShPqrJTF2ZA/jxICPBdGZ5D0cxEOq0MouPndOTFtpbqvIvgPD++wfOGipl2
 KP8A==
X-Gm-Message-State: AOAM531YeNn2rEvNkMHdjU33QfE2PDFQu7ecbm2NLGLQ+SEJACGAUPvd
 VCvxMXmqHY85D1FGPC/mogl2IG/UjXwJJkZNFIpBPw==
X-Google-Smtp-Source: ABdhPJwspHTwzOKICOpQaGFTHLVSyBQKTmIgOM5MIuJdnlGQ9vUHRtihLVXMxS4r52+QEJjZjC3nMP7Y9gaLzBivkx4=
X-Received: by 2002:ac2:5335:: with SMTP id f21mr23886022lfh.288.1619687526274; 
 Thu, 29 Apr 2021 02:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210429084541.28083-1-alex@ghiti.fr>
In-Reply-To: <20210429084541.28083-1-alex@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Thu, 29 Apr 2021 11:11:55 +0200
Message-ID: <CAM4kBBK=yQ=jXYw85Ti7Y3EyGd11aOYt7QnD4+fFFkDhvrwcxA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_021209_046315_429E0F79 
X-CRM114-Status: GOOD (  23.78  )
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

On Thu, Apr 29, 2021 at 10:47 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not possible when
> the kernel is executed from the flash in XIP mode, and as the SIFIVE
> errata must be fixed somehow, disallow to build a XIP kernel that
> supports SIFIVE socs.

Could you please hold off this patch for a bit? I will try to come up
with an alternative solution. It should be possible to define a
special section within the RW area and place the functions that need
such patching there.
Not that I like that much but at least we'll keep the ability to use
XIP on SiFive.

Best regards,
   Vitaly

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
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select CLK_SIFIVE
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
