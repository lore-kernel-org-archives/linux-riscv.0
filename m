Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F332CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 00:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rngrYbhk4ZuXzuwcNztgEfYgTMch7twFUgZ0QfuUIA=; b=JaOKXMZry0sVzYV0U8JuS4/2Z5
	iV5wlHQaGQHDvQNxcjM/Z6WC0ETOOFbnyZIl2UE8DuQBh3IqPyW8CTq61m2IWQDeeATh/X8DajqoF
	7T4el3BsMu1XzMXohgENc9oi/VEReCVnO4Cm5GT/8MoGGWBpzc2VSoW7dmrW+xr1wY3roPe68m4Sk
	t6yLhVz3W3yQieG+Xdz2jT2YkE1Qdz9tQ098/DxStEywgGcgEhvpzRYAKe5QNmgB8uB0+Dysd3pJw
	Ir8JFQ6rAhNGbTpu5cAAgG0WyVKwIIYmd08ZhrdahIhMYUDuSi+njNqWIZQg/IbCy0a4ybMSxoRGR
	leFKz+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rroT0-0000000DLrU-2eBU;
	Wed, 03 Apr 2024 00:27:02 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rroSx-0000000DLp0-0Mn6
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 00:27:00 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a56a22004cso3180944eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 17:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712104017; x=1712708817; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJynIROMAU+9B7UDiFFRoCdDhIpw65xNX+rGxpgSGeo=;
        b=G1wZn0qrDWPjIPWs7VDMTk2WCCg39XdVThXPKSjMZZjfjQ/gewwHjGOZRaDGoBcCDD
         E9kQp/x1m+fJB4IE8fW18b1j2ByhdCqoFaU0RQ1KEbDmUjnzZcPxn+pK+Agc10aThKb8
         q96wljmItG5uglBDke+x88FoWulg2HKk52kZTzspm5wLWQdS+CbH6aTyhZh+v1TOEiZU
         VAXdPzo2nZsnFOfIH2z3XHb0hu+bpEhHe5U0O5znq0FpjYWUo3sY/e1IsIMpL8/ysqUA
         a2gPn6dNLhCG1Ml3135c4Cai1N9gejnA9dGkZKKhHZOHyViwh9yuoJJDa0BbF4YXLxhC
         k9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712104017; x=1712708817;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJynIROMAU+9B7UDiFFRoCdDhIpw65xNX+rGxpgSGeo=;
        b=u7uopP0Nvq2tGSBjsHWMMgUKTEnfzrlCJA6uBwaWvfYFrDVoPPvw97aOPj9/YgIGw7
         j/WZ+vHDdFrvH7wq4soRWEoFfvCo6DNDcldaz5oDWsDE07qmpEkbzAsOJTV37meoqJWN
         rzuaAkT0k3zI+icoMxqnpct2tDrIeiGsO2PuwAOBTo+Ziqs6l7Z3iMos7mnnu0GykLkz
         IcUgln3GpuOW0pOzv6nWoMx0xcQu/Cv8grI+ZOboTBM8zVMdHBYPM88MpaDRxW1cdssV
         SC1SHxG65YGTCc4FqweE1AKjdAnZyF+b5c/Qz407QzH92UdSSskvPnNijF7gRIQzu4pv
         /RLA==
X-Forwarded-Encrypted: i=1; AJvYcCXDzSe85yx8YRWaLTOMrInpTwbR3m7Qkx0B5r+Ox0j/9Hi/UVH2BAH/upq7KmutVA1fjwQC4Qg3ZZYeSatZqtDNK2gPTAhm2fUfASlEC7wG
X-Gm-Message-State: AOJu0YwYuz0M72wYbiBJAwEKWK9uY6PabXccRQO97Kw8n4DJhfv06ZT1
	/Nvg35trYGAryVOuBLMdy7v0C26IHiGoPKQ41U/LRS0N4SoY765n
X-Google-Smtp-Source: AGHT+IHhljBegJ+lKt5ZBT0wk8a5MZ4tYNQVcpSUH/dt+V7eojih7U8r9PBN6Az5f3nk+1efsx40eg==
X-Received: by 2002:a05:6358:49f:b0:183:630a:a88d with SMTP id x31-20020a056358049f00b00183630aa88dmr1197722rwi.9.1712104016926;
        Tue, 02 Apr 2024 17:26:56 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id a10-20020a63e84a000000b005dc491ccdcesm10213080pgk.14.2024.04.02.17.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 17:26:56 -0700 (PDT)
Subject: Re: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <7e363fb9-5dff-b8de-fd4f-54b3596ad179@gmail.com>
Date: Tue, 2 Apr 2024 17:26:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_172659_437123_DE137FCE 
X-CRM114-Status: GOOD (  27.32  )
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

On 4/2/24 9:18 AM, Krzysztof Kozlowski wrote:
> On 02/04/2024 11:09, Xingyu Wu wrote:
>> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
>> But now PLL0 rate is 1GHz and the cpu frequency loads become
>> 333/500/500/1000MHz in fact.
>>
>> So PLL0 rate should be default set to 1.5GHz. But setting the
>> PLL0 rate need certain steps:
>>
>> 1. Change the parent of cpu_root clock to OSC clock.
>> 2. Change the divider of cpu_core if PLL0 rate is higher than
>>     1.25GHz before CPUfreq boot.
>> 3. Change the parent of cpu_root clock back to PLL0 clock.
>>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>
>> Hi Stephen and Emil,
>>
>> This patch fixes the issue about lower rate of CPUfreq[1] by setting PLL0
>> rate to 1.5GHz.
>>
>> In order not to affect the cpu operation, setting the PLL0 rate need
>> certain steps. The cpu_root's parent clock should be changed first. And
>> the divider of the cpu_core clock should be set to 2 so they won't crash
>> when setting 1.5GHz without voltage regulation. Due to PLL driver boot
>> earlier than SYSCRG driver, cpu_core and cpu_root clocks are using by
>> ioremap().
>>
>> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
>>
>> Previous patch link:
>> v2: https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfivetech.com/
>> v1: https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfivetech.com/
>>
>> Thanks,
>> Xingyu Wu
>> ---
>>   .../jh7110-starfive-visionfive-2.dtsi         |   5 +
>>   .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
> 
> Please do not mix DTS and driver code. That's not really portable. DTS
> is being exported and used in other projects.
> 
> ...
> 
>>   
>> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct platform_device *pdev)
>>   	struct jh7110_pll_priv *priv;
>>   	unsigned int idx;
>>   	int ret;
>> +	struct device_node *np;
>> +	struct resource res;
>>   
>>   	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>   	if (!priv)
>> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct platform_device *pdev)
>>   			return ret;
>>   	}
>>   
>> +	priv->is_first_set = true;
>> +	np = of_find_compatible_node(NULL, NULL, "starfive,jh7110-syscrg");
> 
> Your drivers should not do it. It's fragile, hides true link/dependency.
> Please use phandles.
> 
> 
>> +	if (!np) {
>> +		ret = PTR_ERR(np);
>> +		dev_err(priv->dev, "failed to get syscrg node\n");
>> +		goto np_put;
>> +	}
>> +
>> +	ret = of_address_to_resource(np, 0, &res);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to get syscrg resource\n");
>> +		goto np_put;
>> +	}
>> +
>> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
>> +	if (!priv->syscrg_base)
>> +		ret = -ENOMEM;
> 
> Why are you mapping other device's IO? How are you going to ensure
> synced access to registers?
> 
> 
> 
> Best regards,
> Krzysztof
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Hi Xingyu,

Echoing Krzysztof's point. This piece code seems wrong to me. This logic belongs
to syscrg, rather than pll. Why don't you do the pll0->osc->pll0 switching from
syscrg side during probing?

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
