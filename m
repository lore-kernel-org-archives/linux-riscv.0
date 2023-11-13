Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F1C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoTzQ06+jByGPI4O+z0prdRAKA5XczXK9vXtXh2iYlY=; b=jRi0Z+t1ZQe8Il
	2y95f+mUU6qnRXm+gZKCCIUrSArj6MuuuN8YSxVCz0684xibPZ0Sj/Fxbipnvk9YM5cR0XM2UGurj
	JpDLep7RqqhyHfAMyq5sNlamSqp0ZxlZ74yy47VDzZEQgFmf1Fzgm4fusNfRjjec8LJvq4FKjmz6x
	27As9zl/dmJ9RtlkiT66kSNgVcdPKh4M8Ca90MOjxwhz/bOw1EUjx+15DKZ8nUXNp/WaM5SyQ6SeL
	XA05iY/YbLMLbHKpBkVZhGFa8iTzS0cZfJFsxKbQ3WO9wp2DTnek08nww0jXg8yU7D+/GYC52XXb/
	2tq29oxppffZmODIHuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z0Q-00EFap-31;
	Mon, 13 Nov 2023 15:37:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z0N-00EFa3-17
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 15:37:40 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41b7fd8f458so28967471cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699889857; x=1700494657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tzWoq297WulTYALKaxRqew5uETGDYoNQPFDim6ud7Y=;
        b=TLEe9KUm+ru31W0vscGHiNxbO4sihi56Umcy+zY8dQA34RpW3udV4DyjC0ccBxcNgm
         DrVMPjZEVhW2sehJD5OB27/VNMRJTQ739LQoen/01JlfT9Gpvzm4LpfIl8NedmocwIs8
         WDaGMwAcuQrAEbkqbd7rAiwcnpW4hF0Yy1alb3ubn4Q/KMoPB7LI9YM6fx/90a3NIg6D
         Qsu/Lm0jw5fzp9Fg9fsWPU6NvsId03sryHpLCznYrjQZ+IMOKMSjukybbIBPRd4ulbI2
         lpr3wrwTJ+LR+Tr3rMtBjwMk2iQmiW6eYKa9V0DTiz/s40dj5yhoKiWfsZzXwSaeLiz8
         tb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699889857; x=1700494657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tzWoq297WulTYALKaxRqew5uETGDYoNQPFDim6ud7Y=;
        b=ktyw9RvM42zfyH7NLAxMBjbz7jfnmTKORKoMMlzCsrBQM0VWUvf2onnnoKfG8z/iAr
         IGi4mtyXVWHXCCN8PfgNpNKarpfrRN7BTg7FfRiOf544Wn65NiE4/8p1rr7uzw+YVlyp
         VwflSlT6nhAlxR+V+rAxWuSECnJz2nQq5kTYCQxxRoFX/BErK603yacoHQQJK7tPeq7z
         7iLEq6lFpawTomvD+CaNum2ZQ8eDybfk1tooEjxjJ5a2FLoI5QiJ/hPYmF8FtLYo6PjE
         0X7sy7nyqNXd1QrKn/3dokyjR9asgiE/gLzdSnjo0De1Bb69iD2ThUyZZYqJ1gdVhyxt
         BdsA==
X-Gm-Message-State: AOJu0YxEAHOI+oNKvSXZBOSLvnRGfNF0L4Xg6WnjmiylStXXSeVNLdp1
	SMlWsqMFWIuwznnEkoHKP58Zqw==
X-Google-Smtp-Source: AGHT+IG8E/omZHPUI+v3RUdT6i8N7Zm0/RMqKn+N3J3X13lnSqMYv1fnuditgTZu1q3iP19bWHlFNg==
X-Received: by 2002:a05:622a:245:b0:41e:a932:31f8 with SMTP id c5-20020a05622a024500b0041ea93231f8mr9811668qtx.6.1699889857255;
        Mon, 13 Nov 2023 07:37:37 -0800 (PST)
Received: from [172.25.81.170] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85313000000b004180fb5c6adsm1996974qtn.25.2023.11.13.07.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:37:36 -0800 (PST)
Message-ID: <7cccf188-c47f-4865-95ce-dcfedc1429dc@sifive.com>
Date: Mon, 13 Nov 2023 10:37:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset dt node for cv1800b
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-4-jszhang@kernel.org> <20231113143224.GA130254@ofsar>
 <ZVI9bzAhPnHhVg8A@xhacker>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZVI9bzAhPnHhVg8A@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_073739_401125_65FA3092 
X-CRM114-Status: GOOD (  20.74  )
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

Hi Jisheng,

On 2023-11-13 9:14 AM, Jisheng Zhang wrote:
> On Mon, Nov 13, 2023 at 02:32:24PM +0000, Yixun Lan wrote:
>> On 08:55 Mon 13 Nov     , Jisheng Zhang wrote:
>>> Add the reset device tree node to cv1800b SoC.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> index df40e87ee063..4032419486be 100644
>>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>>> @@ -54,6 +54,12 @@ soc {
>>>  		dma-noncoherent;
>>>  		ranges;
>>>  
>>> +		rst: reset-controller@3003000 {
>>> +			compatible = "sophgo,cv1800b-reset";
>>> +			reg = <0x03003000 0x1000>;
>>                                           ~~~~~~~
>> 			        it should be 0x28
> 
> The reg space is 4KB, but only 0x28 are used. I think 0x1000 or 0x28 are fine
> since the ioremap granule is 4kB.
>>
>> while please also note the 0x24 == SOFT_CPUAC_RSTN, does not compatible
>> with the reset-simple driver, but as it's not implemented nor used in this driver,
> 
> But the functionality of this "autoclear" reg isn't used at all since we also
> have "sticky" reset to acchieve the same feature, I.E reset cpusys. And in the
> usage case of reseting cpusys, I believe "sticky" reset is preferred.
> 
> And except the cpusys reset which has both autoclear and sticky, other
> resets are sticky only. I'm not sure whether it's worth to write a new
> driver for almost useless feature.

As long as the device has its own binding/compatible string, it is always
possible to replace RESET_SIMPLE with a custom driver later if needed. (Or use a
more complicated driver in some other context, e.g. firmware).

Regards,
Samuel

>> so we should be fine with this?
>>
>>> +			#reset-cells = <1>;
>>> +		};
>>> +
>>>  		uart0: serial@4140000 {
>>>  			compatible = "snps,dw-apb-uart";
>>>  			reg = <0x04140000 0x100>;
>>> -- 
>>> 2.42.0
>>>
>>
>> -- 
>> Yixun Lan (dlan)
>> Gentoo Linux Developer
>> GPG Key ID AABEFD55
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
