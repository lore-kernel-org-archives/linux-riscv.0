Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B88BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mVaF11OQgDJ/cv9qe6EJMhGuDOq+iWKHmkWGoyjCTSA=; b=m1MNG3GJml2ZfSIzQHS6Fpeack
	6GcCAlab6ttIiQr7mC6QpiRz1PjNfrKzcaAM/FhvjJA/2DOQLov2QGl1WPzE4m/ekhyFoJ+ZVqMh2
	PdtKYDZSJkY/uByetlX8vx17Prt+h/cpJXcRlN6G43AjG4Ug4ty6V+zfcxWo29QPYsdVta9rTQB5M
	7Uzg73szu3u8KJdsRT+WJk6mCbE9tM3vtbdc8yf+m3+EH3BrbJBnzyC4Ip2Fvj8JGPyUzuwsLOnI0
	PPQ0z2AKM67pI28cTcEx7YTtrxR+Zk8pPHnPOtLxondepdtBMw4Pdwc11vrhiHGT4NtotnGpObCl9
	796uhZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvOy-00Ar84-36;
	Wed, 06 Dec 2023 17:09:36 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvOw-00Ar6Y-2N
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 17:09:36 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b9b6ba42a4so27458b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 09:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701882571; x=1702487371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebrCX+s/Y/vVmHv1yCH1HySRy2V69fpkAgLFjl3R0nI=;
        b=MxOuo9Fvjpxe/w30vit8wRhZ93X7Eg+i+M0Y4xij+XZRgukOOSYfiPzNbjGeBfcIiK
         m8MUza5lCCxi1zSTwa3EuQqMofPVTFKqKWAV/zysAmOodOMhn0hkUr234kHYd9wY4eFS
         0HjogwFaUeoM3aTTabWtNbziS3+eHgyR1RTSzdtpc6V2YulwB0MKVnY3i1/pMMthU+K0
         179YcKuArvKvRCc8L3MrMatruBbnf61kejjyMYQSoheBGisW0hhsojAdFyrtH1zedNaU
         Ec7X+Y5cXbWmox0CI+FlXwJF2T0fxU8FHX6i9H2FF8f2noYtL6zKaft8ORiBw8u/7ni4
         uwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882571; x=1702487371;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebrCX+s/Y/vVmHv1yCH1HySRy2V69fpkAgLFjl3R0nI=;
        b=gSICK5/gMqr0SOg/IHrZ6cH1sMyRYPIPbhXFla5Av1tmOy/lkc3jzoDJmyu59umtjW
         zwnZCrmEGitQeOWZeh0SaU6iE24+Eva20ye0WBKEwfbL4Cq1B+U7DCUzI3V6RcwV+Xq8
         5+H3rhrJCLcGwB7jYJPtOr5bfe4ozKpD9G8nx0QoTGDea8Mt5FCr0L+U3J2oCESZZ3RD
         CJU0R9UyXLQxV0ggfqHjigvJ/MbBoiB7R+/vMX4uXJ9ATPn6Yer40S8pTxHNJjcoOJ/G
         xHGquK5yxGnNlqn8iFVll8ldi1quE/FLnhXmfy4iE0xBfydRUraW1XCuXHIuegWhFZWH
         EKLQ==
X-Gm-Message-State: AOJu0YxN2p63SEPbFcEbsurx2003UXtbl2TIA0e97cSd+fswVQClxI85
	Meg7JJDz9GMT1Oh/a0ExRN4pTvyNREodT6phqpM=
X-Google-Smtp-Source: AGHT+IGuQkE0n1LAuOq5AF8j/hKBwUXZppnsnN5YyGTCGJ1oFqClQUkOyOw7Od+cPjK0nrrDM+eS+g==
X-Received: by 2002:a05:6808:318:b0:3b8:9d83:ec5e with SMTP id i24-20020a056808031800b003b89d83ec5emr473367oie.20.1701882571169;
        Wed, 06 Dec 2023 09:09:31 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id j8-20020a544808000000b003b845ba61c8sm60240oij.12.2023.12.06.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 09:09:30 -0800 (PST)
Date: Wed, 06 Dec 2023 09:09:30 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 09:09:28 PST (-0800)
Subject: Re: [PATCH v2 1/8] riscv: errata: Add StarFive JH7100 errata
In-Reply-To: <20231130151932.729708-2-emil.renner.berthing@canonical.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emil.renner.berthing@canonical.com
Message-ID: <mhng-5a8c5e00-7f74-489e-b191-e5fc6c0ecd58@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_090934_770485_AFB81FB3 
X-CRM114-Status: GOOD (  20.81  )
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
Cc: devicetree@vger.kernel.org, kernel@esmil.dk, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, geert@linux-m68k.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 30 Nov 2023 07:19:25 PST (-0800), emil.renner.berthing@canonical.com wrote:
> This not really an errata, but since the JH7100 was made before
> the standard Zicbom extension it needs the DMA_GLOBAL_POOL and
> RISCV_NONSTANDARD_CACHE_OPS enabled to work correctly.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  arch/riscv/Kconfig.errata | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e2c731cfed8c..692de149141f 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,6 +53,23 @@ config ERRATA_SIFIVE_CIP_1200
>
>  	  If you don't know what to do here, say "Y".
>
> +config ERRATA_STARFIVE_JH7100
> +	bool "StarFive JH7100 support"
> +	depends on ARCH_STARFIVE && NONPORTABLE
> +	select DMA_GLOBAL_POOL
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	select SIFIVE_CCACHE
> +	default n
> +	help
> +	  The StarFive JH7100 was a test chip for the JH7110 and has
> +	  caches that are non-coherent with respect to peripheral DMAs.
> +	  It was designed before the Zicbom extension so needs non-standard
> +	  cache operations through the SiFive cache controller.
> +
> +	  Say "Y" if you want to support the BeagleV Starlight and/or
> +	  StarFive VisionFive V1 boards.
> +
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for dealing with this.  This is mostly DT stuff so I'm fine with 
it going via Conor's tree, but LMK if you guys want me to take it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
