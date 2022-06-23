Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF90C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvFtl4VciFNPgtE2f3U871OcPKCMRnnFeOSQzJu1R48=; b=u5PMjavhzUgk08
	ieP28rpdPcD8JYWl+yRYqlSR2yXWtmZiI+k7ugHW63L/EqTZvr7lUAO1lEIzgaK20FY7PmVbicnm6
	PxAJ5K23EXRObB0j7RBbgidnicPYdvp0couuBbe/Koe+GgxPHWRshUcGy36i6Gpzju6vwVvi3c7ic
	n2yK39cEZHUiEe7rFZNHzkX7IktUTsj34hb8M5AOTNGDixooh54QvLN8S0DYpK2jhLzYY1tG9t7fx
	u//XvVWbjpfUIVb1MpZv/8gYGp+GxvyvvtbsGXzmabdbkp8NqFToNN5Vh5/Q8PhWOrQSh3/Jnh7xr
	VKljCq3w+zsVPaLu8PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M9H-00F30H-T7; Thu, 23 Jun 2022 12:41:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M9E-00F2y8-TH
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 12:41:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so1398181wms.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YKuhlfeie/APuzN1zX50F9wlajDVarix+gW9JqPWiT0=;
        b=UMP6RCyZP4CD6hOpGQbkX9Cj3bPk1ibYJbn4nsdNdndZTqQfI3/vZ8bIRLgJSIms8u
         CPePjkJfaFGkLpAH9WY7iFv9pbNYvYe5jqqSz8sj+2Qf4GfYVFiKObOiaJ7J+qH1bGvP
         VbLXbFzeDNL3kV5xpFgi8EPl9utzHo/yeUTmYj0EJVSqHBEOLi9N+dZTEkBtSiT1ZYoV
         E4fQE+A+R2BHBwNPUeWkzfyaoJLLBH+EMoSWnr4Qer7+DC8yHJI0iUtL7cob5S1ocket
         H2qCHNsne4oMOwFRLI9UMKSLvjNlpdi8dU2fdlh1bFht6a2RH8lnI13E785t9rZnNwvq
         L5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YKuhlfeie/APuzN1zX50F9wlajDVarix+gW9JqPWiT0=;
        b=TChIhMBliDs2S3TCMr0Mkuzv1d4VAEWnq39EskWHeqMxt7MDrOKhE9rPw+1bNnMOqC
         0PTRBXKrrW8Wf7Ue2Ls989SbSS7xjm3soyeoKYcRAXFJSdNQW1YtAeQVaVz+++CHISyx
         bKvhNET77qH4BBr4GfI6sjD44rugqF8MDFgpyfqsxVsM4LJKyemEk6ugpcDGMMGvESHO
         SmSaHqlLtIYmzRLgibFNhGT/Ghu2p8gAYB59vlT8Dv/xbNWx8yIVDTTMBtaurC1TIJuI
         hxzzWWvw5O4Ehk4yXRVPxhCD93h0hQuLw+MvhvcADWuUzm6NjgkAkf252roopLKdYeHn
         8+sA==
X-Gm-Message-State: AJIora+Z2+n09qTsGXF1ZokexxgNe0wr/195yild9/xqS12NZVFKBYky
	ICI/aHi4jO3PDd2vC/ZhVfF2bQ==
X-Google-Smtp-Source: AGRyM1sX86vrrjVPPP1yUcwx/sZIRbQprpzXl44FYJKuAjsvw6TD5Ua2hBw6xE35bd62RibFYqBp1g==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id r6-20020a05600c2c4600b0039c55a09533mr4015082wmg.104.1655988081094;
        Thu, 23 Jun 2022 05:41:21 -0700 (PDT)
Received: from [192.168.149.129] ([80.233.63.220])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4201000000b0021a36955493sm23104159wrq.74.2022.06.23.05.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:41:20 -0700 (PDT)
Message-ID: <4a76c7aa-62e8-385c-15a0-9992ec566de5@conchuod.ie>
Date: Thu, 23 Jun 2022 13:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>, Conor.Dooley@microchip.com
Cc: damien.lemoal@opensource.wdc.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com,
 vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.lezcano@linaro.org, palmer@dabbelt.com, palmer@rivosinc.com,
 tglx@linutronix.de, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 masahiroy@kernel.org, geert@linux-m68k.org, niklas.cassel@wdc.com,
 dillon.minfei@gmail.com, jee.heng.sia@intel.com, joabreu@synopsys.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
 <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
 <20220623102502.jiksqr3m6y733haq@mobilestation>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220623102502.jiksqr3m6y733haq@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_054125_016337_E609A202 
X-CRM114-Status: GOOD (  12.46  )
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



On 23/06/2022 11:25, Serge Semin wrote:
> On Tue, Jun 21, 2022 at 04:06:21PM +0000, Conor.Dooley@microchip.com wrote:
>> On 21/06/2022 00:17, Damien Le Moal wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 6/21/22 07:49, Conor Dooley wrote:
>>>>
>> ---8<---
>>>>>>
>>>>>> hmm, well I'll leave that up to people that have Canaan hardware!
>>>>>
>>>>> I will test this series.
>>>>>
>>>>
>>>> Cool, thanks.
>>>> I'll try to get a respin out tomorrow w/ the memory node "unfixed".
>>>
>>> OK. I will test that then :)
>>
>> Since the memory node hit that dt-schema snag, I have not sent a v2.
>> Going to be AFK for a few days, so I dropped the memory node change,
>> changed the spi binding & put the series on:
>> git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ canaan
>>
> 
>> If you get a chance to look at it great, if not I'll send a v2 once
>> the memory node is figured out.
> 
> commit 84df6ca0f277 ("spi: dt-bindings: dw-apb-ssi: update
> spi-{r,t}x-bus-width") looks good to me. Feel free to add my ack tag
> to v2 of that patch.

Sure, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
