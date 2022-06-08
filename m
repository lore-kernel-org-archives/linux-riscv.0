Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F73C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 12:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYTtuXE5Osi/qyZR9zF4QhtVJ4/lU7OQ8+V2DCLUcCs=; b=D4aRov2Qmf3key
	UnlFlTuUHgTuFOiIjX80+pQaTiHxMEfiEECrFk0VuBzTw52QUJpSnkEjv789qGaLJyeyjf/xfT7K3
	Ga89gAjJd9BfatLgS2bpghVfDGc9KEL+J3yiS1DSXp4JwCOeSUKFlDWAhVEPASO0AQO15ZjCQ5QK8
	9VRyieB/BmZFPzJnWPuV8dbPupDyCAwHcmrALtcwLH8Vcb1b0QNpg8UJffZ4t9qSGiB+KreetMtTE
	4RVJlT5sFFNXrr2FovHyetMM+PZ0n5Zam7tYkpDhp0FiX2xpfjdqgDg6rrub6+dGNBMOpQybHSdWw
	PCRmPElXEk9DB6sI+EzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuhD-00D2RZ-C9; Wed, 08 Jun 2022 12:21:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyuhA-00D2QK-4x
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 12:21:57 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 77E2D3F161
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1654690901;
	bh=sGA9dZic3HoKYVxlqMeol7j55+lBG94ICRpJGuIPQA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=abZe3hAT5y4+eimwLzIwyAHimH92tqcuSzP3kRiQUmzxtuuuOH/tqrCzlUuwsHq0e
	 zc+3aW5qIHIt+1BjePyC5IHpIgSc22ma5ELoegV8CH0l34aJ17TRN1KqU7U8dKFPEi
	 fPSJRjTArM1sI32QKgFsB15eHH3uKi5bv00Ks6RwZTjMwuhrtyrKvNS5QJtB/bcr2H
	 gL5D9yNeI8qYYSkaN+QIdv7xxDgg7J5UVhrjGAHAuWav1+pfNl2MQ/ZY+orddOA1FC
	 s35aJeMtwc8glt/un/Gp3pbBLnj5QZIQN8Yyx3PhmU23AMOSeKDvWrnYXQA/OHqdg/
	 lQdRHfeYT8rzQ==
Received: by mail-wm1-f70.google.com with SMTP id o3-20020a05600c510300b0039743540ac7so6882182wms.5
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 05:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sGA9dZic3HoKYVxlqMeol7j55+lBG94ICRpJGuIPQA8=;
        b=FjJp1zZUWys+uayvpLbsNg8XBw8/rHipdfEBs45hpW53XimO3RvXRzxlz7Uvuw966l
         SSxQDvn007Yer9x4k9TbXKXOs+tzmk6Y1UheGUzZa7KudzX8HMkCuIDL+Z10M5dT3ZJa
         rUN6vHUcpnwI/fjwEAUGxjPegFp6GvMJQOYY4saxE9w29TnqdezZoNq90dQslWwuAM1H
         BP631vT7HHmw4qjkcjVQtNTGULk4zSfCT9xQD4pbvIM5GlTPYUSERgi3XK/zGhfseIR5
         ZvJY+sP1e4uYMYeYbRxqf+2qXWz2vjjGm9NuZdYLM1mhkQyvrSq/l+hOSfifqwUGIemm
         zUdg==
X-Gm-Message-State: AOAM531wG+gRxx3EaKuuUa4tJfKQiiwGeqX34LsfwiykRnFIH8S6ZFl5
	UoGzrIJ2ezVqQkkpKMwUApbUQjfuhAQbE6mJPiFB34gKatBmgJ/Rip1sJbiczbtffClXcog1t6W
	NP3O6chYNguVyHADoRYd3CK2qGE4W7M+99FRuwFMW2ZEukw==
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id f15-20020a0560001b0f00b00210313aef2amr32273805wrz.281.1654690901209;
        Wed, 08 Jun 2022 05:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZMMPD/zGJeGmHC/em1a13KMLY2FJCpjFs/lGpqxTvm4WuLFstyFGGh1b6rRmJG/iibHyo+w==
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id f15-20020a0560001b0f00b00210313aef2amr32273777wrz.281.1654690900967;
        Wed, 08 Jun 2022 05:21:40 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b0039c64d0c4e8sm1540272wms.45.2022.06.08.05.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:21:40 -0700 (PDT)
Message-ID: <244df608-ef96-d3f2-2463-1cc82728e70f@canonical.com>
Date: Wed, 8 Jun 2022 14:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] riscv: dts: microchip: fix icicle kit's dr_mode
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>
References: <20220607132204.746180-1-conor.dooley@microchip.com>
 <20220607132204.746180-4-conor.dooley@microchip.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220607132204.746180-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_052156_378384_64D26C6F 
X-CRM114-Status: GOOD (  18.02  )
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

On 6/7/22 15:22, Conor Dooley wrote:
> The usb on icicle kit is actually configured for otg, not host mode.
> Swap it over.

To my understanding both host mode and OTG mode could  be supported by 
the hardware.

Jumper J17 on 
https://www.microsemi.com/images/10/MicrosoftTeams-image%201.png.
USB device mode selection - Open: USB client. Closed: USB host

Is OTG really the most important scenario for running the board? I 
personally would prefer to run it in host mode to add more peripherals.

What is missing on the driver side to enable host mode?

Can we detect the 5 Volt jumper setting via GPIO?

Best regards

Heinrich

> 
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Signed-off-by: Conor Dooley<conor.dooley@microchip.com>
> ---
>   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 044982a11df5..121b01c8784f 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -158,5 +158,5 @@ &syscontroller {
>   
>   &usb {
>   	status = "okay";
> -	dr_mode = "host";
> +	dr_mode = "otg";
>   };
> -- 2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
