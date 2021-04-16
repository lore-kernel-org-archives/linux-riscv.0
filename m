Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE84CC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:42:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8E361103
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8E361103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lry0Tnzcf0Ha2kPYZ20sT4yAqTJDbr7q9BAcQc9kZn4=; b=F3ATiNaRXDc3ifjEaIvwz9fak
	Rkw/82cHKoI8GdA1g0XJ5CBQU1Xou08ElR58erk0PoN2JKOjt0XC+Zp1RG+MLMxUM6JFYDmUgkOxB
	X1BKDf5SVJIMDSfOxA089OgNFZO+lyuuxESHzE7AXtfEUX9p0vaWbRt4F8eIMwEJbMXZSZYiVAHDz
	zta0vJbQ9vDWQy+4aThBNs8xDcR8ODtpDgtOrtNSwQ+W7eSAs1cQ8JOWGaGdaB1AixgK08Huo1wS4
	DkXsCNKBdDjCwjxyWnJyLK9dMFRaE8AjOjnUO9Jo5/tAnIX7uwgf76WlL7qfc5w3hXNxw+xNmqmOy
	zimj1AB8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXLvR-001m2N-UL; Fri, 16 Apr 2021 10:42:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLvK-001m1K-Sx
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 10:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zex7i7Gm7ilDvh/qRtb14tTVDUsTiPnIyJ8lJBlTVDY=; b=lT9sFjuSAtVxbpnSKXlh+c3Zww
 gI/uxc8sTe+gl1Vbc+Lg+K+6+MK6mQ+McurD6AbU4MW5qRAlr/ScNmiW3qoNCsyekeWoRJLlO9+tq
 64matzAQQ9x7IbumIRVKEBYYhN8XiHOo+h99rfsEM5lrIWRjGf3iF+9atrTiT5qa032qWZEO0aAsJ
 HlnwP+NAnsc2XRyLNds5uwOe9+4Esgs2PyEgqlC6Hgl1BPnwksIt4QiRuy2ptbDj38v5s2Odsm/Yl
 4CYD/TPoiTcjUVHQa6IGNqxpT8oxmKT05qfNUmkDmjAwkjce+YwW3clYWqMmjqvhGEd0QgT4tkeVH
 pEuMDikg==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXLvI-009Hmk-Dz
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 10:42:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k128so14036587wmk.4
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zex7i7Gm7ilDvh/qRtb14tTVDUsTiPnIyJ8lJBlTVDY=;
 b=o+NE8pGADgY4FrSGIXWUfJDlnJ1juLdQCdEiocUx/f4kBswMU6EacEfCbch4zfDr8H
 +8aCGjJXpl6SK20MOt1VpdXaX4BbkHmki5A2hh1gmZ20w2EMJP1VjnEsC8VADb9byTqY
 lE+sl5rG/g22g2pLcBDdBqPUtuuihLLbi7A6mVCOjdUC+LZqLYwD2VrW6Q33ZmABcitG
 osCWWS16aeTjD/SapJryOxU2/k5hi64Zs2KKTkPikhugxITJ9wbjvvaZwkFN1zhfoIGY
 lMbuOFwM6i8S1cr0T1JDeA7IJyAS5SdymT8sxxaVslfrawq50NfS7neQz6FJIXPKg4kh
 wuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zex7i7Gm7ilDvh/qRtb14tTVDUsTiPnIyJ8lJBlTVDY=;
 b=smErEK7o2+hvLxxSsNq1rc3Kr66YHTlVi+jgTgeX/TslnjnF2jFzPUdKZREBHIgbN6
 Xr2NyahawaDF+oy6WoKmt0RBm03K9Pa/IUzNddnWPrleiEvU6TMEzhQVWoT72TJBj6io
 sFkmJBseLNHh1l4p4j29YqA5VmwQedYY7NQozeI8plYxbMHMVqeeSDkFvHVpEBGOLtM8
 fkjT/KlFhci4MABK6empim+H1kZJY3cIVNDPuM6VDnp2vOUVRcwq1vCnnjfCgtEOx6Cc
 TN8DhXLqbHUVx6revrq7BNhIUvsFMfaJTu3dlUCyvARVlh+Jpokyf4Elg5FAWZJeFSlw
 LTZA==
X-Gm-Message-State: AOAM5300FysYr6Xhx4fpJA5EnuwUJtJPJFVh5ucAKEdz2JJKXJBPyfZo
 gnWAmvnmNUAq7OZXdf3WZN+4O6U43craMACKq1N9+Q==
X-Google-Smtp-Source: ABdhPJzSZVwXQXIP/gEzyKiBpeLInXpc+75cZ3dvpf3JNqEHMcXwCYZIJpV2ZQZVzZT+LiXa+F2urN3JdQz1K4fuTB0=
X-Received: by 2002:a7b:c348:: with SMTP id l8mr7746989wmj.152.1618569721686; 
 Fri, 16 Apr 2021 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210415110426.2238-1-alex@ghiti.fr>
In-Reply-To: <20210415110426.2238-1-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Apr 2021 16:11:50 +0530
Message-ID: <CAAhSdy2pD2q99-g3QSSHbpqw1ZD402fStFmbKNFzht2m=MS8mQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_034204_559343_C0B29F05 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Apr 15, 2021 at 4:34 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> If CONFIG_STRICT_KERNEL_RWX is not set, we cannot set different permissions
> to the kernel data and text sections, so make sure it is defined before
> trying to protect the kernel linear mapping.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Maybe you should add "Fixes:" tag in commit tag ?

Otherwise it looks good.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/setup.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 626003bb5fca..ab394d173cd4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -264,12 +264,12 @@ void __init setup_arch(char **cmdline_p)
>
>         sbi_init();
>
> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>                 protect_kernel_text_data();
> -
> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
> -       protect_kernel_linear_mapping_text_rodata();
> +#ifdef CONFIG_64BIT
> +               protect_kernel_linear_mapping_text_rodata();
>  #endif
> +       }
>
>  #ifdef CONFIG_SWIOTLB
>         swiotlb_init(1);
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
