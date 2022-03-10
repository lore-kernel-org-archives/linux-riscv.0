Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5EyeEPo19vvMN5BhGiA1wrciZ6yNg/8wbPHbpnrzZmM=; b=SucUwp5NunZLtw6UwRogc6Gyur
	rs7EWrAfgE3C8/Mp9HjXk26S+gLin/GDuuje8vMeWVpHOj/ffgOFG6SnmY7SQGzZjq3zCfUKGVf5p
	E3lJzfiAqmDrNmRwH40MS6oCBXbchj9oThL+PsXsnBh2aE8STE0XKQ6esy/VvQ1YqZNfR/RMyFcW4
	J7t7A19FyGaVH8Uz1hqIJlq5IDvAgvZxB1poOD75LxT22CstVj2VYolYcN8cG157dDgsIWx/TBBAz
	n/t1uTfmf+khsS8Xa6u49cIki5djDuUN8BdUDTxLoupmxfTXNBLmk+TJigEs7p3YpG5i6u1bbKuUz
	Jje4vvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSP3y-00Dvpe-Ri; Thu, 10 Mar 2022 20:07:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSP3w-00Dvoe-Ld
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 20:07:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id p17so5843946plo.9
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 12:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Ppb+nGqWIW/h/QwBcLw4pfKIt8cQodBBM6cAdLT5fmg=;
 b=YBCZBfTIz23WWu52f/w33APGnaMo4Ft4vbVYLvHDN5C8XSlriqdDpZ2Eohqo/r8lOM
 GbJ393d6CB40bzKpuc7X+GXaJ93iAZHIZCnVQsc8VjEtG3zEaldDyQffxuWaZmbaxUhg
 nomlAeOcgZixR3aA5pCDXs3fcAz4LForgtfbNVXWUQ1SkBqCNH1a/6TZFAGl25xBXKDT
 ZPLlVFfx2w5RC1Q2gbS9fwGkNeCMwKcHUiMGPU0ZI2Vi7xCO+xRkwPsBQYho/397MX0+
 O88MiL4bFACHTX0DbUkIq+05yugAALYXQVQMLvD6dkxqaXz2TdeOEa2z5Qk7YmBWJhNv
 fTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Ppb+nGqWIW/h/QwBcLw4pfKIt8cQodBBM6cAdLT5fmg=;
 b=AOkerMKJ6ZBFkV4Rn+y+UQis0y98B0FHucWVQsFCuquuEsAwUu3VrL/pVF335SXLhx
 nDO2P/pJNMalxoBOdLwJne/ZXDuroRFsp3KWqaYreP3n3eLXw4JBumYW63d2SV7hfAs7
 zifSxeEPSOyo10A0mStLwNA7IsFQ6gaVEfV109if1mcfoSQwxdpCH/UwPbTAifuVeE57
 P+b7w3s6r8oF0IM5kh/RZGiW+NgP858EJoKwVEn/jE2duXxjh+290oa4VPFJTbH9MS7v
 0FUbzs/dmF6YUlAfOqn2oS3XvbozVfzKmI7xBPPkhrXtbEiPJPJY9MEVVGoO7k+ipZox
 nmOw==
X-Gm-Message-State: AOAM532snjd/SLwyxyiB5u2X8Bt6S54E4Bf6MADqLa2XDBAWg7Nun1Vn
 yPVnEz1cZ+z7jZCXXaVtDTPMRhEJaNZB9g==
X-Google-Smtp-Source: ABdhPJx4NYlzgFs+WmYMXzXTZ4RuxK05hR+/Tjnk6lJFxCjljwre381MVmPlu9JE10S/2ylACzy2bQ==
X-Received: by 2002:a17:90b:1e01:b0:1bf:5f6e:cbef with SMTP id
 pg1-20020a17090b1e0100b001bf5f6ecbefmr6853622pjb.130.1646942823454; 
 Thu, 10 Mar 2022 12:07:03 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 a32-20020a631a20000000b003756899829csm6258878pga.58.2022.03.10.12.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:07:02 -0800 (PST)
Date: Thu, 10 Mar 2022 12:07:02 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 12:06:07 PST (-0800)
Subject: Re: [PATCH] riscv: alternative only works on !XIP_KERNEL
In-Reply-To: <20220210164943.2646-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-3d749a55-0e5d-49fd-8682-06e8a058dfe0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_120704_735830_A34E3126 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, 10 Feb 2022 08:49:43 PST (-0800), jszhang@kernel.org wrote:
> The alternative mechanism needs runtime code patching, it can't work
> on XIP_KERNEL. And the errata workarounds are implemented via the
> alternative mechanism. So add !XIP_KERNEL dependency for alternative
> and erratas.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig.erratas | 1 +
>  arch/riscv/Kconfig.socs    | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index b44d6ecdb46e..0aacd7052585 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -2,6 +2,7 @@ menu "CPU errata selection"
>
>  config RISCV_ERRATA_ALTERNATIVE
>  	bool "RISC-V alternative scheme"
> +	depends on !XIP_KERNEL
>  	default y
>  	help
>  	  This Kconfig allows the kernel to automatically patch the
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6ec44a22278a..c112ab2a9052 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -14,8 +14,8 @@ config SOC_SIFIVE
>  	select CLK_SIFIVE
>  	select CLK_SIFIVE_PRCI
>  	select SIFIVE_PLIC
> -	select RISCV_ERRATA_ALTERNATIVE
> -	select ERRATA_SIFIVE
> +	select RISCV_ERRATA_ALTERNATIVE if !XIP_KERNEL
> +	select ERRATA_SIFIVE if !XIP_KERNEL
>  	help
>  	  This enables support for SiFive SoC platform hardware.

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
