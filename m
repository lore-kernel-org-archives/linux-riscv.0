Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2131FC63797
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6sp592P/sZ5ExLTWEV9gJ8QcCr5TCbNZe6iTT1ixos=; b=t8EQb0tkphFth5
	g6XE7/pNIIXQQkI40Cd7EN2LqtPwZ+LUvNJ27fkzLsfuWWnMl7fWJR56CjyvW7fsB5YLe9hbewKBb
	Tc8cjc4f+71XDFvrIkSl9xhxia1D+g/BgabBJKcPDQSrbn7wSlwbizP0l7y/OpPKawmH10cNKohbZ
	vzwv/fECvRj6ZIjVSHlyh3Bv/7xImublnP/u/HeePIBcBJcemA7+diz7K+jSv/3c4NGM9ZeRJBDyQ
	V7oFhCtFb57I0lArggO8xfhM+lBnThpkKBKMIgX5c0oM/ky5+fiJHrHLo5IQRwMBTvn/AFPLuMrjM
	5+dEi1ENyQ2zt0uBGEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsPR-001C3e-KG; Fri, 03 Feb 2023 09:31:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsPO-001C2a-Ux
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:31:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id h16so4046626wrz.12
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 01:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RsIvhlNhsuqxFf9ZP6UUldQV5rhEIuniVcY9EEdflHQ=;
        b=dS9U7K4hx5+UHNLv0nbXOEx175H0lar03m9RgJtrk67LYO8KhBbp6DLmDIht4HFRou
         i+HddtcrDo1LT2wjnJ8Az4t1RBPKk3f18ghM+k1jPJ5BHJ4Wlz56SufdXNRd/mSbDX3I
         WQrwRs67You+4kPoYchd4zUH59vbnYAjqBqoir45C+7D3cPpbNy+eEyH4s3URfxc5soX
         p3NlVS7Bnj40hO02bZzwvlc6DFF3vyywR/blHFdfKQxOdO4UrrUunYD8ozM2PB7mmyaZ
         tRQNH8hLYWc0M9r0VNcwmxF3q5D6CmmQRSALwuWVnidB1wEuvtQGQcvgBK38a67OR2C/
         pACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsIvhlNhsuqxFf9ZP6UUldQV5rhEIuniVcY9EEdflHQ=;
        b=VKlYO/klLF/3D6hJkPVesyxctb29z7vthZ1nE28G/RabS03UqpzhwCpogk05RCSe3v
         HdiCrWyZ/IEs1b3x3Yfw0G5wpi95mQcoDVo8++sEWHB4dJp9s6/CTDO6hRP/48wup8HD
         H5VToxmE33mTHTdRQ5PZgqRI9Lpw3/LlFEmlF0gpDD55WyElqJJX7SmiMJuqhtEfXxOG
         Bkeo9clpqZS0dqG65euP2yrlLyO5oZdRqpbhAJ8JzvmjK7ioRMQ6JECusFy454Eq2APK
         wJ5Qb5YtLANDR7exLpAIv5t8TVGdyxekKmqpBNN/S27Lyv+hl+r4opkXyEidnw9yLZ9j
         x5MQ==
X-Gm-Message-State: AO0yUKX1Utkwt9pHL+vHWF1ftQAVBOzQ8G6fvjnYtwJZf7x3XH+LbvNi
	dKPwLDzUec/Lo7iMR004dbEqyQ==
X-Google-Smtp-Source: AK7set9mhThVU4ZMUNjEG8Lt9BDIM9Z02zk0GC4q6tDH4m3bgoRblmm6ZN9SDVH1XSK5Yz/djY/Wfw==
X-Received: by 2002:adf:f705:0:b0:2bf:bb0a:e486 with SMTP id r5-20020adff705000000b002bfbb0ae486mr8457821wrp.30.1675416659339;
        Fri, 03 Feb 2023 01:30:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d6b83000000b002366553eca7sm1508672wrx.83.2023.02.03.01.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:30:58 -0800 (PST)
Message-ID: <ab9a4a7f-a8fa-fa29-95e9-941096359de1@linaro.org>
Date: Fri, 3 Feb 2023 10:30:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <20230203081913.81968-4-william.qiu@starfivetech.com>
 <3c5bda9f-08b9-f2ba-6951-9fc614d4debc@linaro.org>
 <afe28108-9b85-982c-90ee-8cd58c9b6fb2@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <afe28108-9b85-982c-90ee-8cd58c9b6fb2@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_013103_030773_C1393D8F 
X-CRM114-Status: GOOD (  15.23  )
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

On 03/02/2023 10:23, William Qiu wrote:
> 
> 
> On 2023/2/3 17:02, Krzysztof Kozlowski wrote:
>> On 03/02/2023 09:19, William Qiu wrote:
>>> This adds the mmc node for the StarFive JH7110 SoC.
>>
>> Do not use "This xxx". Use imperative mode.
>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>>
>>> Set mmco node to emmc and set mmc1 node to sd.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>
>>
>>> +
>>>  &gmac0_rmii_refin {
>>>  	clock-frequency = <50000000>;
>>>  };
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> index 64d260ea1f29..ae1a664e7af5 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> @@ -370,6 +370,11 @@ syscrg: clock-controller@13020000 {
>>>  			#reset-cells = <1>;
>>>  		};
>>>  
>>> +		sysreg: syscon@13030000 {
>>> +			compatible = "starfive,sysreg", "syscon";
>>
>> No:
>> 1. Undocumented.
>> 2. A bit too generic. You should have here SoC specific compatible as
>> well (either as second or third compatible, if all your SoCs share
>> register layout).
>>
> 
> Hi Krzysztof,
> 
> As for the compatible, I will change it to "starfive,jh7110-sysreg"
> in next version,but for undocumented, I don't get it, can you
> clarify that.
> Thank you anyway.

You need bindings for it. I don't see it in linux-next, cover letter
dependencies nor here.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
