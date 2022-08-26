Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F08ECAAD4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FVhTKlIK7pU5V3cowlQBZh4hs2FV0RF1Pnihwet/P+g=; b=br6lGx318jOtZcrh10wprZYQrF
	wJfhAQ+Ap8sSDdMEMzkNJOYim6yG2kfahwFNsYAC8dumgwyNiwPJBzwWJyYvvgcu27xt68JJbAWuX
	IlARex4rh3RJzDWxpiyhxkw25bG5u+iMgQsQP9dtT7Lv9c8N1/Wypfc/FyV6O3Srg+zclfWviaw2K
	Z/ppgFoNhuDm6qFWqOvjweLaG4do0vy7S7qA2eEo/fQdBReM44A5wBCF2OfxaAwpWf8DaBYSWUJe4
	jbes2M17Ec64w8m6fVhopMnNdctEOCm+ZVQlO4yZszEhq8wjM3GrZOJqf/3EPLekHDOksfeb5VWHa
	PspqCxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaS9-006IqO-3f; Fri, 26 Aug 2022 14:36:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaS7-006IeA-3I
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:36:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id m2so1747595pls.4
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=3s/DZ1HMqv5ArgVIfPof2jbOwBTqzvpHj16AfB2LQj0=;
        b=BZYGbfglNN8fxsFeOWsuC0LXGX2d/8nArqKX7dVH4c/wys6/GG+suHxzkQJlEqTsdT
         +DXnjPa2SLm+Op25EqIHYRgr8iq46eRbWYZ+Gm2dlXPt2essYIP6kjfkqzwZDhzqrxEl
         JewMr4g0Ql6myCi3MuH/ORzD05ASBg5E8BgCvvIiNIOv+qlyQocoOVTQ/NT1ejb9fy/r
         7xtNYXOCmi6vYWx5pIVBeURMa5Wx5DHfP/lZq1/Wkx2N8gK1VcHIqnFeemfX5uYthpbG
         xql1KpDSfo6OvZ8xlR39KvJQnCiC+aNKKIEfXJlJ8RnmIQLGih0hluPjp1LJ5K7I5oZj
         E9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=3s/DZ1HMqv5ArgVIfPof2jbOwBTqzvpHj16AfB2LQj0=;
        b=F1F495yN+Po5qSuwtV5lAggRPTmWdFGm7kj1SKrCxlQRBrFHshQmLYW8xJn0AWMWRs
         waB8G/rOua/RJQQssdqbFpRujsJriQspu1vOxu4ZB3xFc/oaduKyP0wlMxmqv9Uy+7OS
         gEvZgDe6UVHWCsQ8aOj5YH9vbL4deXiKqMVlu/efS1m4uGmZXYc9F0b4OfSSp/zTT74v
         3OldlcVFVlwsqOh2I4hrKy36LDdAY3xZDgYCWfYBFtPq+6lp2jL+j+QaVfUO9l3PCx+J
         jG0PH7qI/QbLd8C2Q3nTXrghwbysseOijS50frQ6MGa0PoAHyAKKdv5+vnCYe7NQoERT
         fiVw==
X-Gm-Message-State: ACgBeo1vfBwPriR3Pa3Y1x4TmUo9Iiar8DJdvVr2F8GecyPn5gaf6KEH
	zN2W+YWE+A1FWAtIjN94HFtUG5aXf19npA==
X-Google-Smtp-Source: AA6agR4zIgpIZ2CZPqZlSbGx+bqX5pgq2MOr6rh7Ztu0DVlWBE1iN3FOffN/AYPJH7RWDTJRnszOgg==
X-Received: by 2002:a17:90b:4a41:b0:1fb:77e0:3ff2 with SMTP id lb1-20020a17090b4a4100b001fb77e03ff2mr4848871pjb.161.1661524611313;
        Fri, 26 Aug 2022 07:36:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id k27-20020a635a5b000000b0042aca53b4cesm268925pgm.70.2022.08.26.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:36:50 -0700 (PDT)
Date: Fri, 26 Aug 2022 07:36:50 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Aug 2022 07:36:36 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: enable CD-ROM file systems in defconfig
In-Reply-To: <20220812200853.311474-1-heinrich.schuchardt@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-69fe0aa5-65ee-4dc3-b3ba-41e307ebc4e5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_073655_156027_08249717 
X-CRM114-Status: GOOD (  14.94  )
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

On Fri, 12 Aug 2022 13:08:53 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> CD-ROM images are still commonly used for installer images and other
> data exchange.
>
> These file systems should be supported on RISC-V by default
> like they are on x86_64.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index aed332a9d4ea..05fd5fcf24f9 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -166,6 +166,9 @@ CONFIG_BTRFS_FS=m
>  CONFIG_BTRFS_FS_POSIX_ACL=y
>  CONFIG_AUTOFS4_FS=y
>  CONFIG_OVERLAY_FS=m
> +CONFIG_ISO9660_FS=y
> +CONFIG_JOLIET=y
> +CONFIG_ZISOFS=y
>  CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
