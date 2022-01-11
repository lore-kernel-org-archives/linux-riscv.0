Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0692C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+3Im4IcD9or0XpSs703p1g8CM8cIJ8osDmfrhU2uqYo=; b=YPDxbjr2dFFySKSOvkbuWPNwgi
	fo0DOw8sxFLQesBcDYU8SeQ2ZokMAH0vL0E3OPwpyA4RRt56kZaqLk+0XkwVp3A90ZdOee1BnAfJR
	SU6KVw+bImPtVXrT3+C9+gGIHWfw2WKMtiEVUnzB0eK3WfBnDJUImEoJguytCRAJErbJhDeFuXA8z
	591LXddqTlH256f0mWSYtsJEWIUlLkia8aISoOwQmDsPc9FcmNZHaHdbtkkoWAuSMy8DTy7mZQ1U4
	4CPspIcGtWfZRWlcSsWTzzBz+ifb2edyk3C4wLqzNS027S2zQOqAUrLVIBhHLUZVMwjMRQwvPI8kG
	e8SXnKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7KwN-00H3KV-Oo; Tue, 11 Jan 2022 17:28:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7KwK-00H3K5-Sj
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 17:28:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so6575778pjj.2
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 09:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=12+q0b6y6nH7kbDmn5mxOCkgQv+jyWWInPi8qR3sLk0=;
 b=JXfN+aLUdx2zlu9qac6uYhla2U/n8TT6p+hrU2GGv0I6TKuQe+IPgh8G5lv5757keI
 l5oDFnb4HpmzkMW6hgqDXu0R/FRYbjfs6AKjay71k5mZWDQkXNA3DAuMPbMBksXzp2xw
 FQ9PWBH9Ry/ouH+0AL2n0zYCPZK0gjci88ohw3L1motWzX7XKg5CDN1c9ErNPgh95FV0
 OX0dG4OBgbQjFk3zoxgez0BiFzqcJ5zVc4913i8lszMlKgwld3eJIGOYujLXcl1A9DDF
 SyWXmN5lD7NIhnlESzVUqYLSOb0TClQ0V4cCz+2tVvRdVx6rFTQrYx0I+JIVLxzdQOoS
 DHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=12+q0b6y6nH7kbDmn5mxOCkgQv+jyWWInPi8qR3sLk0=;
 b=FzDSrNgEUOTLWKC658vbZWhVdAywB938Pp9I0FkrK9BogN1SuYJAHlfm4U2F7nQTnP
 1nmB7DfWvI3qnMfJR7aGyx1iDWcEjmuzKkxGYUOXVgWX1zMEVMEFLeAsHgkNiAuIDuEd
 8t5lo6SNTEVikhMH6zsu8XveavGDw/JB2W9bVHoka7R7OUnThrFNbqzld+arY3PYtFa1
 tgKiMTz2zAjH3fi6T6QRxkaNNqM+VMURXasMb3PdUefrAwktq+CCZ+N3LS3C/3tNIV4Y
 a45laxpiSgT6sG19qnipe4nQHntwRGbgppv+s2mv7A6aBbXsGHXDEv89fwHnw0gQpUBt
 en/A==
X-Gm-Message-State: AOAM532bPcbuoFf8IdvufwW8AiEaBIXHPp6g5Guqo806PfeC9LbS6IQ6
 fjXymDGZ83Bp4CABZI2eVdBTQQ==
X-Google-Smtp-Source: ABdhPJyMMLCfkog+/r5Po8vgFXuxtpWPcgiAhliF7cPIp8Sqws1L7o06MOk1nanJj51Y59PSWbbI3A==
X-Received: by 2002:a05:6a00:1413:b0:4bf:a0d7:1f55 with SMTP id
 l19-20020a056a00141300b004bfa0d71f55mr5587142pfu.13.1641922086523; 
 Tue, 11 Jan 2022 09:28:06 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b21sm11261590pfv.74.2022.01.11.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:28:05 -0800 (PST)
Date: Tue, 11 Jan 2022 09:28:05 -0800 (PST)
X-Google-Original-Date: Tue, 11 Jan 2022 09:27:38 PST (-0800)
Subject: Re: [PATCH] riscv: mm: fix wrong phys_ram_base value for RV64
In-Reply-To: <20211202153641.1961-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alex@ghiti.fr, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-662897d8-3b0a-4580-a607-f853c01263b5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_092808_992105_381D4D64 
X-CRM114-Status: GOOD (  19.82  )
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

On Thu, 02 Dec 2021 07:36:41 PST (-0800), jszhang@kernel.org wrote:
> Currently, if 64BIT and !XIP_KERNEL, the phys_ram_base is always 0,
> no matter the real start of dram reported by memblock is. The original
> patch[1] is correct, I believe it's not corrected merged due to lots
> of #ifdef in arch/riscv/mm/init.c, I plan to send a clean up series
> soon.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007650.html
>
> Fixes: 6d7f91d914bc ("riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address conversion")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Thanks, this is on for-next.

> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 24b2b8044602..3c0649dba4ff 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -187,10 +187,10 @@ static void __init setup_bootmem(void)
>
>
>  	phys_ram_end = memblock_end_of_DRAM();
> -#ifndef CONFIG_64BIT
>  #ifndef CONFIG_XIP_KERNEL
>  	phys_ram_base = memblock_start_of_DRAM();
>  #endif
> +#ifndef CONFIG_64BIT
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of
>  	 * the addressable memory can not be mapped because of IS_ERR_VALUE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
