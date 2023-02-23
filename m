Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18F0C636D7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hoa7yh/7SNULoSq0qw26+DZPObFWEfgckzDTMerkrHA=; b=Ri4Yl59V0nT05u
	wtt/6IBUy1hbD5F4qYnEfHSsZm5xB61IQqB/7JLwJpJMfvSB2KfqeMBYOMsPL61qCijOuusLmMT8n
	/QImEDlv9VFJg4uqDH2jIV6lApVTVPSVPdR1b601AKBi2rx320YQE+SiigGqNd9egvVypvK+4HfLr
	7YqkCnnFe+qgrN8Jnq+zUt557Ws4keOhHlVyT8nZopNeVK8joo6Q0jPdLsYm4OsYUcUw0MmSetpXG
	ssX4PlKNdbeSYPxH9mtBCc5kCjBLTEoDdbheTqFg0x0Wt7+Pt21eLeGxz1KQxufZSzFIIIqNSqNS/
	YQm93ILd6FPqJkNSRv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7Km-00Fap2-3w; Thu, 23 Feb 2023 08:52:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7Kj-00Fani-HC
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 08:52:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id s26so39525140edw.11
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kARWkjDKq+Noo8lk+NWDkTGoxjUlcit/++E6qycI6sc=;
        b=gH1XO0dF11EU4Qw0NYaCkcjTVMmK8AgxltVhr8B/K1NFVruXZ+9+TPAuCYKxo7n8Ry
         QXfjV+KMjK2fb2qGdcOprXdHbkHtU9+wLqchNRiywwbZjHQMTNLjiOjh/dtbFgTTRUCE
         9Br8lgShjzpjY5+EiuiRhM4gYthP9kqMnFVL8qR5B7NQ+absw6dSwbZrGLnhdTU3fTxA
         XHPFWkPzPlo0EFeyyjlFqiFVMQ6ZQn4kfVRbXoJTqbRvUlbkOxbncRzDhZLeZxHEQOSI
         UkMCg7sTK5B5Y0pm/Rie9Ikh1dYnVwW0Zt0ZFZfiauLTE15qWb8fK5RKNoIj+zQXwWJ6
         9baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kARWkjDKq+Noo8lk+NWDkTGoxjUlcit/++E6qycI6sc=;
        b=F3XgIPqByMkw12sP7gHaaFILduKHTg8ADedF7sGdmckVKUMpL1jvx76SFcna0zB+e0
         E90JVVXdFU8h35OR7Ht0DWwwCZjAzvQQCzvIztAQ1iAJZRm5f0k5qjG4vPaOy3JpnjNq
         xgTha5QSX2i90nJcm3676TurKTRPawNNbw2/1EBbExpmwWU6f68LIYaiszNJwbjv4VYA
         TaTu6UZg2Si0YtaPZk1txhbMJblwEvrx1NJc5X/v8TZdLtDocTBpQfhcDf26gNk3jYM1
         BmhHOrVJdPP4N+2eF4ev3Btz7n48ykBKZJqHsPgdMDGQUtmZAxvv+4McU7tL5GVOoAQJ
         eSDA==
X-Gm-Message-State: AO0yUKVyCoijhhju/QR/23t6RT7dFGm5CDlAIdU4YZ7S+qm7OTFnYFiO
	AGezTtL84IB1NR9mk18fdXQ/+w==
X-Google-Smtp-Source: AK7set+xA5noulJ+d7bZ1DgrEI4firm9dkLQAGXGypj191Spet4/E5orCmtdDVL1pFvRcIaJYLdZ0w==
X-Received: by 2002:a17:906:ef8c:b0:8b1:806b:7dbb with SMTP id ze12-20020a170906ef8c00b008b1806b7dbbmr20696575ejb.51.1677142326927;
        Thu, 23 Feb 2023 00:52:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bh13-20020a170906a0cd00b008d9ddd2da88sm4123884ejb.6.2023.02.23.00.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 00:52:06 -0800 (PST)
Message-ID: <a8f723cf-d120-0102-d9b2-d40bfbf78349@linaro.org>
Date: Thu, 23 Feb 2023 09:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add PLL clock node
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-4-xingyu.wu@starfivetech.com>
 <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
 <842e5825-07ad-1806-d969-f54d9a9eed5a@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <842e5825-07ad-1806-d969-f54d9a9eed5a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_005209_603960_D6026564 
X-CRM114-Status: GOOD (  16.09  )
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

On 23/02/2023 09:47, Xingyu Wu wrote:
> On 2023/2/22 17:09, Krzysztof Kozlowski wrote:
>> On 21/02/2023 15:11, Xingyu Wu wrote:
>>> Add the PLL clock node for the Starfive JH7110 SoC and
>>> modify the SYSCRG node to add PLL clocks.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++--
>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> index b6612c53d0d2..0cb8d86ebce5 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>> @@ -461,12 +461,16 @@ syscrg: clock-controller@13020000 {
>>>  				 <&gmac1_rgmii_rxin>,
>>>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>>>  				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>>> -				 <&tdm_ext>, <&mclk_ext>;
>>> +				 <&tdm_ext>, <&mclk_ext>,
>>> +				 <&pllclk JH7110_CLK_PLL0_OUT>,
>>> +				 <&pllclk JH7110_CLK_PLL1_OUT>,
>>> +				 <&pllclk JH7110_CLK_PLL2_OUT>;
>>>  			clock-names = "osc", "gmac1_rmii_refin",
>>>  				      "gmac1_rgmii_rxin",
>>>  				      "i2stx_bclk_ext", "i2stx_lrck_ext",
>>>  				      "i2srx_bclk_ext", "i2srx_lrck_ext",
>>> -				      "tdm_ext", "mclk_ext";
>>> +				      "tdm_ext", "mclk_ext",
>>> +				      "pll0_out", "pll1_out", "pll2_out";
>>>  			#clock-cells = <1>;
>>>  			#reset-cells = <1>;
>>>  		};
>>> @@ -476,6 +480,13 @@ sys_syscon: syscon@13030000 {
>>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>>  		};
>>>  
>>> +		pllclk: pll-clock-controller {
>>
>> Does not look like you tested the DTS against bindings. Please run `make
>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>> for instructions). You should see here warnings of mixing non-MMIO nodes
>> in MMIO-bus.
>>
> 
> Oh I cherry-pick the commit of syscon node and it also include the MMC node.
> I will remove the MMC node. 
> I used dtbs_check and get the error 'should not be valid under {'type': 'object'}',
> If I move this node out of the 'soc' node, the dtbs_check will be pass.
> Is it OK to move the PLL node out of the 'soc' node? Thanks.

Shall it be out side of soc? How it can then do anything with registers?
This does not look like correct representation of hardware.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
