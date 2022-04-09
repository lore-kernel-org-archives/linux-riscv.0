Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EAAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Apr 2022 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbam5CL9ZtkLgzxkIYH2HZvFOpGrJoZKmNaNl8JfMq0=; b=JoBnwWfmmIyB2n
	5GCUO1NwyRKNiPGE/zbNHihU079yzmXmP2Wzphfh+yQiA775CBM9F9WlMdT40CIHneYR7pYd20nPY
	htCEWQcoLz57KpDt19Np1Ezts+wnQEtiwdr8J90gQ6VoRS1Go6MVVQpewOzL3B2uvxSdWJ4P5dJ3G
	XkkSAqrTVWlpgUAh9xxA08sW8O+rFsdvWzyIWDhA2jcVh03M8fprxQXm5twxbJ+8B0vvaxeYz6fNt
	mlUOrfSHrkO0cgWdyhiqAV4x+GpF/rqS4fWcn4wzam1k6sLVODHeiHlFtZdDQufXZJVIvhJoYu4Qa
	w+Yp+oGoO4IQVIzQn2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd5JB-002Uez-5W; Sat, 09 Apr 2022 07:14:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd5J7-002UeS-Ar
 for linux-riscv@lists.infradead.org; Sat, 09 Apr 2022 07:14:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d3so15911799wrb.7
 for <linux-riscv@lists.infradead.org>; Sat, 09 Apr 2022 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=HzhZ3bjU1PEmPe2hwuJeZrkyDW35jm9x4B5yGB0bqZ0=;
 b=z/2PBvrci46A223ORsA3V1EMb1SgPUGSYjUx8bqkYUtMjKLlNT9vW3686rNO95bISM
 NBpMrc5lWZtIAnyF9nmuGlfUaNLZwZnZVIts+jaGKWlkLNe7BxchFAtC8bSXcJt9CgBh
 ZiOOiGuYnx90JPeO6OtVMScIrtMjBLulN1Ng1lZVKp4Y8etWGeICrX3gHcZFo2AbMGe3
 gR9r4qUqOomrJ+H2nvAvrIw4X/vHMkMXhWnuflaktRS08th5U36rXXHYNT+s5sJWkk3m
 NqMFm4FNho9ug898GALI4OEsB/Q/nEqCw8qksj8vf5gHb1L7OPCR502UwGOPnR+9dxsm
 zf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=HzhZ3bjU1PEmPe2hwuJeZrkyDW35jm9x4B5yGB0bqZ0=;
 b=Q7D+FOxL+4Ws9/nrp1kRgaBn/QjCDwknfJbpGCpmOMTKdpoRJU2JvSBsb1rrj2bEnT
 jV6Yue6liC4E59yr2YOKHtvKd7mGdn6VGPCcCKLL0Snlw4ZP8iCk3JCIhBOcAgRZMJmB
 3LYKCjYqI0h6b37JxrF38eUjgo+0QG9x8Ls/xvJ0j+ZAHPXGfqRI3hEqkVG49N+numBq
 M2eFCIPaegMy16cCJhiMMfUxUbp16jafNeCGJK7boeWGBfD+y2VqJ27AAzDWcrYN3tv2
 DV27BVJMxRycZwmkBMmvezXnHxgAfLG220oliJN7r8aJrcez1djB/cWzFUM+swhG3TgO
 YhMA==
X-Gm-Message-State: AOAM5326mL0JaRNsGlc0nj6d+VJjMN8pGnxNhBhB+M7PsEH+PwX/7l3U
 q9/i3Hl67DE1sT8YntvGVxuEAA==
X-Google-Smtp-Source: ABdhPJzZvbXk47Qg+XFtSusWdXHB93I7ufry+eUoPOyQxqyPD1Klc1Q6spp6YTEFUje/wE6rXPgNjA==
X-Received: by 2002:a5d:44d0:0:b0:207:9ac8:2c3b with SMTP id
 z16-20020a5d44d0000000b002079ac82c3bmr3792006wrr.688.1649488490827; 
 Sat, 09 Apr 2022 00:14:50 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d50c8000000b002061622ec88sm13207416wrt.105.2022.04.09.00.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 00:14:50 -0700 (PDT)
Message-ID: <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
Date: Sat, 9 Apr 2022 08:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
From: Conor Dooley <mail@conchuod.ie>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>, sboyd@kernel.org,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, palmer@rivosinc.com,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzk+dt@kernel.org, mturquette@baylibre.com
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
In-Reply-To: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_001453_643071_92BC98E5 
X-CRM114-Status: GOOD (  19.27  )
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



On 08/04/2022 16:29, Conor Dooley wrote:
> 
> 
> On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
>> On 08/04/2022 16:36, Conor Dooley wrote:
>>> Hey,
>>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>>> clock for the rtc is actually missing from the clock driver (and the
>>> dt binding).
>>>
>>> Currently the mpfs clock driver uses a reference clock called the
>>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>>> (config) clocks. The frequency of the msspll is determined by the FPGA
>>> bitstream & the bootloader configures the clock to match the bitstream.
>>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>>
>>> However, the msspll clock is not actually the parent of all clocks on
>>> the system - the reference clock for the rtc/mtimer actually has the
>>> off chip oscillator as its parent.
>>>
>>> This series enables reading the rate of the msspll clock, converts
>>> the refclock in the device tree to the external reference & adds
>>> the missing rtc reference clock.
>>>
>>> I assume it is okay not to add fixes tags for the rtc dt binding?
>>> Since the clock was previously missing, the binding is wrong, but
>>> idk if that qualifies as a fix?
>>
>> Usually ABI breakage, even if accepted, should be be tagged as fix
>> because it is clearly then a break of other peoples' trees...
>>
> 
> That means either a) do something messy in the clock driver or b) mark
> the whole series as fixes (and roll it into [0]).
> 
> The second option seems far more sensible to me, do you agree?

Having thought some more about it, patches 2, 3 and the rtc part of 7
should be moved into [0] since they're fixing a binding that only
arrived in 5.18-rc1.
For the rest, make the second part of the reg optional and if it doesnt
exist just return prate for the msspll clock?

Thanks,
Conor.



[0] 
https://lore.kernel.org/linux-riscv/20220408133543.3537118-1-conor.dooley@microchip.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
