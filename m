Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C1DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+39c1aadiQ+YMD+mLcZebXMVNrM3MLaMop1mUlOfJQ=; b=tffUevNWHAFuHs
	NfeZ6phFS4NixyJJ6gx5V//TUUFB9rF+KHB1UEEonyHMj6clsuJBwM+DnadAAY1bRmmOIROQ0RHMk
	MCEJtJ3BoDZuLfmEzrYGFEV2viutpng1W4Fsue6fmGSyem+x0FSqBR95a6XGswj0QuKXRbBC/AdHr
	JCERb5g4fEdpVAROl45TzvlrZ10Lc4PpdUvlObQYiX8/G7wlVWqxXJPhKqrMWaBNXnLxkZG1FE4lT
	Rj9u/1vuaWNn3ZkApER95ArEO6zvGNTL+2/XC9mQ2me5VBqlJalrpiyhzeF81GnokXA/vfiP5G8Jq
	yDm5mDDrryE95ppCpKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDoLs-009isw-3Q; Tue, 19 Jul 2022 14:37:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDoLp-009ipJ-3W
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 14:37:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id ay11-20020a05600c1e0b00b003a3013da120so10116477wmb.5
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=13i0/0dHDWi3Tz13pQIy2h+YZzYm8zFkGL1fzxGqmuY=;
        b=Dc9qshxWkOXoVpeRUOWXqvpJrKUxArsmLW0NXjuZv5YDKKFa2Abk13pR9Fw7HOpsC2
         hvtQ9aaLQPeb4FWX0Jroj+ryDzDFrO1N9NXIWCjcY0mb5M2qy+WXB//MHr2LQMoMKZAM
         1lBh/D3EwLEd8QLtpTcdhfUEpXN2H0LTq/L5Wve+ABzp83zffEGvDZ6IUQ3rYjxwHBFo
         EBW3biuXNrckDn19gRuWBo+/mVwT5c29SxdI6j4wr6iPHp7mzocV9p50UEuqNiDPYM4Q
         mc2s1CbVjXq0TQUClYoHsIk3s7XtsEPsXuel2zD/ja6J4aLXc+Ud78OrJL0iz+37gN9S
         XZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=13i0/0dHDWi3Tz13pQIy2h+YZzYm8zFkGL1fzxGqmuY=;
        b=eqFL/qW1YO7y4ZaC7KMQH1MB81VoIdcv7lNnp9c331ou639vtzmahBR4akBM+17baK
         85EbX9H8ZpevXRbU2z0thZnqqqfLv5olYtzAtkeTfavlEhQ/DjTkUDZGdHyv+IRZOx13
         fJKaokSMammIXQ3u5y//pGW+VEk/Edz4BDjeL7AuNd88YEtu4EUUDfzhiw2yOguVBWX8
         Ftl6226KPcQhjb9jPPdyGhn2PNRtAjrCbquknhsu7voirFPImnFVBC4vzqJZQs9SpThL
         O3ivYd0iy6yT/Xh43L2pUyGJdyIQJzNdWL8wllEEfyzYQPeOHWoHxsKCS0mAIHb84FPQ
         BBHw==
X-Gm-Message-State: AJIora87NSI/ZJyJxlPat+jcFd9Opai9digp4Nagui7T4xr5cGLAKfMN
	+oOTJo/IWQJ03Iuf57f1kpb5KA==
X-Google-Smtp-Source: AGRyM1tCx3e3TI0EjYZ4gYglOXYON94UkAj86OkaD0BcFK9/cemoKGaTW1p1o37GsZxCjg70+qR1LQ==
X-Received: by 2002:a05:600c:190a:b0:3a2:e8cc:57ca with SMTP id j10-20020a05600c190a00b003a2e8cc57camr31823297wmq.118.1658241445315;
        Tue, 19 Jul 2022 07:37:25 -0700 (PDT)
Received: from [192.168.2.90] ([109.76.0.125])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b003a32297598csm2893662wmq.43.2022.07.19.07.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 07:37:24 -0700 (PDT)
Message-ID: <73f9d00c-b64c-7c70-c49f-99d3894fad24@conchuod.ie>
Date: Tue, 19 Jul 2022 15:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 09/21] arch_topology: Add support to parse and detect
 cache attributes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 valentina.fernandezalanis@microchip.com,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 Rob Herring <robh+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Ionela Voinescu <ionela.voinescu@arm.com>,
 Pierre Gondois <pierre.gondois@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Gavin Shan <gshan@redhat.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <20220704101605.1318280-10-sudeep.holla@arm.com>
 <CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_073729_198533_24F2B6B6 
X-CRM114-Status: GOOD (  31.34  )
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

On 19/07/2022 15:22, Geert Uytterhoeven wrote:
> Hi Sudeep,
>

Hey Geert,

  
> On Mon, Jul 4, 2022 at 12:19 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>> Currently ACPI populates just the minimum information about the last
>> level cache from PPTT in order to feed the same to build sched_domains.
>> Similar support for DT platforms is not present.
>>
>> In order to enable the same, the entire cache hierarchy information can
>> be built as part of CPU topoplogy parsing both on ACPI and DT platforms.
>>
>> Note that this change builds the cacheinfo early even on ACPI systems,
>> but the current mechanism of building llc_sibling mask remains unchanged.
>>
>> Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -7,6 +7,7 @@
>>    */
>>
>>   #include <linux/acpi.h>
>> +#include <linux/cacheinfo.h>
>>   #include <linux/cpu.h>
>>   #include <linux/cpufreq.h>
>>   #include <linux/device.h>
>> @@ -780,15 +781,28 @@ __weak int __init parse_acpi_topology(void)
>>   #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>>   void __init init_cpu_topology(void)
>>   {
>> +       int ret, cpu;
>> +
>>          reset_cpu_topology();
>> +       ret = parse_acpi_topology();
>> +       if (!ret)
>> +               ret = of_have_populated_dt() && parse_dt_topology();
>>
>> -       /*
>> -        * Discard anything that was parsed if we hit an error so we
>> -        * don't use partial information.
>> -        */
>> -       if (parse_acpi_topology())
>> -               reset_cpu_topology();
>> -       else if (of_have_populated_dt() && parse_dt_topology())
>> +       if (ret) {
>> +               /*
>> +                * Discard anything that was parsed if we hit an error so we
>> +                * don't use partial information.
>> +                */
>>                  reset_cpu_topology();
>> +               return;
>> +       }
>> +
>> +       for_each_possible_cpu(cpu) {
>> +               ret = detect_cache_attributes(cpu);
>> +               if (ret) {
>> +                       pr_info("Early cacheinfo failed, ret = %d\n", ret);
> 
> This is triggered
> 
>      Early cacheinfo failed, ret = -12
> 
> on all my RV64 platforms (K210, PolarFire, StarLight).

This should be fixed by Sudeeps most recent patchset, at least
it was when I tested it!
https://lore.kernel.org/all/20220713133344.1201247-1-sudeep.holla@arm.com/

> -12 = -ENOMEM.
> 
> The boot continues regardless, and the K210 even has enough spare
> RAM after boot to run "ls", unlike two weeks ago ;-)
> 
>> +                       break;
>> +               }
>> +       }
>>   }
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
