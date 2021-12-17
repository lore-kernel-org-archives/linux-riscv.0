Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D53AC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sM1Rnk/WTtyooVUfUfwF2EvLzaUT7MFnUEHIbTI9nE4=; b=xLRSv8HOCz4o4Z
	9VXvrZi8iJ2WQT5E+oG2yooSARICLOKLLTjsLdajyhEE9m+TLuznBXAEcFi6ykgzSon0ikd2vQcyP
	rBVSJlg8eDRyF3twpT2ddfEtbPQnjvx7d+1wlHVUChi1yO2MQvuZrZlgYCD9o1Yt7yOlLDh4lkHV0
	hrs5H00Q4gnIN7k9FkyQCzQJxlp4Pe8WYER2BChmHWtXSTzEr/cGQ31TVaP4UkR/z7+vv0NfGcNgP
	sPvKvVcF+B7YpDN1fumkTIDdcv/XQl3uHRzclI3EV4sn3iLoH4SJdBG9HbCvlaCuB5RzlyAzFkf6p
	zDbA7gTEd6L06csxtanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myErK-00AoYX-Fe; Fri, 17 Dec 2021 15:09:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myErH-00AoWU-LX
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:09:21 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D65C43FFD2
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639753757;
 bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=nAz0qZe2GYdB43GZi+KMhhvSomsNdNgOecJ1CmLJodtUF5/A22allmvGVCgKV3ZyS
 gJ+waIIRFoQ3Z2Edg2XAJ/tVgHrZJxmmQgbcg7brQgPwOHUNql128O4LaXTResOOE/
 ZsdsMCulbmJwTmkaqMoYlotJCSOYw7wRrhkoXnw20CNBh8i3lxaPKst1F17ZdN5ugb
 7EYrYtHAIMJ13gn5I/ubGDO4TyT2OdSvMbJ7+ijXfhrQS9NHM1FlPiDm/G/lILXkZc
 pn6HXVJjRP9eZmgxvV1Ntmq7zQoSSyHoSoE0ncyEDZlccWsUzXoMXuztIUDTE0v7yI
 ADbAII7ZV7m3A==
Received: by mail-lf1-f71.google.com with SMTP id
 s11-20020a195e0b000000b0041c0a47fb77so1000023lfb.20
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 07:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
 b=jCo3MCz7h6BWogkpe97iaf1OQ24FSBWZjKJd9GdwSt30xPbVDhsXNnHU8AZ8oOyJrv
 A4jKoJ4RRoRaHlkLsQnwHvyBJea5XqKQ//gmuwScXOmZgdu1wqwZDwIQDipG2dJ/cIVy
 d6BJITr+S9+Xi38Si2FTvuoIM+BJAAIPZvalLQNgpjh+duuo+7TyovU9sLI+QYYlSbjA
 kE7DmCOO2jv//s+xoSe+rnf7Bto/nM7TRUYFzkNNCPYMWFrwxaCKFTJk/MF85Dx85TEs
 7UAw91zNRkq3yWXkQ+Xeil8lS/IrzUiNanI+iUoQK9yXIdGnuHNFo8vSk3JfoSsjKZi9
 rwcg==
X-Gm-Message-State: AOAM5330fCjlCl4iyj/Qj5caiUUoW99VsD8Qqn2yLWss/85PNSsJPp79
 Y38MBTVbJdIyJRd8qXxAnKXWPZWLZ7rGAEQoA+rbszHRxt1O87SFEI8oOooJzY+4+A5r5xgRc3k
 cPoSC9LP5C46+hA9AkMfwUpreCQKx46Vypu45vCRlgGXnDw==
X-Received: by 2002:a05:651c:324:: with SMTP id
 b4mr3004609ljp.188.1639753756752; 
 Fri, 17 Dec 2021 07:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHJzYnX2gs6VoqK9iRkmiSREooJ2FXXIbMDOX3XDHzAr4mBWfowLrbkwZGknR7FEjLbWDk2Q==
X-Received: by 2002:a05:651c:324:: with SMTP id
 b4mr3004581ljp.188.1639753756369; 
 Fri, 17 Dec 2021 07:09:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 d4sm1429654lfg.82.2021.12.17.07.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 07:09:15 -0800 (PST)
Message-ID: <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
Date: Fri, 17 Dec 2021 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Content-Language: en-US
To: conor.dooley@microchip.com, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, robh+dt@kernel.org, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, broonie@kernel.org,
 gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-18-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_070919_878025_09477650 
X-CRM114-Status: GOOD (  14.32  )
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

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the RISC-V/Microchip entry by adding the microchip dts
> directory and myself as maintainer
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..3b1d6be7bd56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16348,8 +16348,10 @@ K:	riscv
>  
>  RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>  M:	Lewis Hanly <lewis.hanly@microchip.com>
> +M:	Conor Dooley <conor.dooley@microchip.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/soc/microchip/
>  F:	include/soc/microchip/mpfs.h
> 

Good to have the DTS covered, so FWIW:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

You still should get Lewis' ack (unless he merges it)

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
