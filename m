Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE11C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 02:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3lBB3MfAe1s3iRQcUbGDwOYVZwNueQUSGCLl6RiVE9o=; b=KdjREObexMOfJmQ2Cz//B7WQkL
	lFiihYsyZcLwvzu8hlGMAtqDUr/t1d9sIPH7DUoJdQrvlYkH+pP9n7MW3No3ed6Z5S5mDhbHxNmih
	bg/dbpK/TdAvI+gYMvGXnn1DXPhnmrlkEr0LO+ae1u1hBDQoPVVzoqHSzjrIP5yeTL1N5G6S0XC9M
	x8R3dj52sMSioW3LEuwKF9RDIq0NXycxaZtc772uOAzrwKvSpQzV6ufN7uzENLUohAQCkjGIVllGp
	lmNoPI1WllbAEURTptzV8gbxkba2smulcNs8URvD6SEBKN7Eo1YnNYyRhhXxH/Tqqhk8aDWNtTU7V
	OVyUykog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na7AZ-004IZm-Ub; Fri, 01 Apr 2022 02:37:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na7AT-004IVt-N5
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 02:37:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id p17so1262423plo.9
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 19:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dSzGnbquoGpvfekF3+JSElEXmIkzDvN1jgGM1Sss5ik=;
 b=73XfenG3pR4e8k8WwYXUCm8KRLeDyor4l/6dcX7PWZNA+ExQFPnSHDIhjhG+y2n654
 a4Z3/UzKFxj34A3uUWV18T1VXixwPAHicLiu1Udgb6OPffWPSebu4S2cOZ8CebJWNOE4
 SOF3AUgAnBQB28yl/J9ephB7PZE8vsR/xUJo0HNkbp+/2VAqu9SaTL1QMmToskhKw/yM
 qY1yOyElMmqwmlZNdRI5bqReAzvO4tx0vXhUSQqoFGospj8PmpmPWpjttCUW429uhaWN
 RvzKaHBA/flY2MggApnpNXhyJoGugk+bdvxQMOkQ6PiSafFQPfKgiap4pkcrEtPGkJP4
 nHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dSzGnbquoGpvfekF3+JSElEXmIkzDvN1jgGM1Sss5ik=;
 b=SD5DuPD/UCFWUaqRS44vOHgqwSa11nOhM1DGlxzHs/uONLJgrudqklA6aN10Tur+LN
 oJOTftgBI2pflshF3jNzWSQ8hNMfT1PfeDnhsCysrUNCtxOv81U8kmO9rc3CULYooqnV
 W6s9rVwKLdenolit3/OrUF9hYGDqmBM0o6HRLEYkZUMryucGJ5edD9wWpmaSZ01HHlOw
 x/3zE3iES20rdq1kPRAtRobnhkrSmEtXdImvvAoxUOYy+q6tcSR6+ExZHXOt2JRgHbgN
 1TwXPvntzNuPI7geIAc3tY2Az7vNvrMyTyG5qgtmUBjjCTRCECrb/RCW6hEzcMprndLu
 vxKA==
X-Gm-Message-State: AOAM532OKyNemz0rMk5v13Eq9jSuPabbjUtappquH2m37PAfhIkKqz8i
 Ae/udTThGdZlrN7y5o1zdjqgVw==
X-Google-Smtp-Source: ABdhPJxAXkMECDqCbVJu0jvPhm8GCAbKB5MwB4XPjx0E3ipQetCmEarl4Afe2ZOldds0saCiXbn3jQ==
X-Received: by 2002:a17:903:41d0:b0:154:de5:a240 with SMTP id
 u16-20020a17090341d000b001540de5a240mr8464375ple.32.1648780656632; 
 Thu, 31 Mar 2022 19:37:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 il7-20020a17090b164700b001c779d50699sm12130159pjb.55.2022.03.31.19.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 19:37:36 -0700 (PDT)
Date: Thu, 31 Mar 2022 19:37:36 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 17:49:16 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: defconfig: Drop redundant SBI HVC and earlycon
In-Reply-To: <20220330234739.1956-1-palmer@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, heinrich.schuchardt@canonical.com, atishp@atishpatra.org, 
 mchitale@ventanamicro.com, alexandre.ghiti@canonical.com,
 damien.lemoal@opensource.wdc.com, 
 axboe@kernel.dk, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-6019c9cc-b2f0-405c-91de-981ce90dd9d9@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_193741_979937_1A1077AC 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, 30 Mar 2022 16:47:37 PDT (-0700), Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As of 3938d5a2f936 ("riscv: default to CONFIG_RISCV_SBI_V01=n") we no
> longer default to enabling SBI-0.1 support, so these dependent configs
> no longer have any effect.  Remove them to avoid clutter.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/configs/defconfig      | 2 --
>  arch/riscv/configs/rv32_defconfig | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 7cd10ded7bf8..74df9e1dd2d2 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -64,8 +64,6 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> -CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> -CONFIG_HVC_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index e0e5c7c09ab8..cabfd6a5b47b 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -62,8 +62,6 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> -CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> -CONFIG_HVC_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y

This and #3 are on for-next, I'm holding off on #2 pending testing on 
the K210.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
