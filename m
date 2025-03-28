Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73510C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxu5qbPVQlDAvC0tLtMsLO1wsQAjnpiCubfAoXozIcw=; b=YZwzqwLiSnQq/1
	fODaySY/CwSTtzV4rYEpjTtaw+l/Qg6q+Tp2H6n2kTpAtZpxIkz75v5DIBZfmZ81aW8TcsdfMUEWq
	mB34/D2Q3dsLGHMs6qRTFtvpKUOH9f6KUcMVWn4IgDK3l6O4FNzhey+TK1iZvDaLIjDD7fo0JO+JX
	iK1l3zZb3jphhJTPfzx8o2+2mO5KxCeAzAgTlm0mNsS/qdUw50bbylAmFBd1u4TJnkNUVhac6E6qw
	aso8ktbomQUAticxqAOF6laYqtuWhBCcy0zo6zJI2UjNrp4f2gZ7RKu6Xp5PPQd6AtmmNQktMGP72
	d/0U4suH/fSgBkL0qFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDRd-0000000Dzbc-3BrO;
	Fri, 28 Mar 2025 17:24:37 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDRa-0000000Dza3-3MYJ
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 17:24:36 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-72c0b4a038fso1600912a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743182674; x=1743787474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzrxTuw1glnQc1Rwu7OVa3OJ84tPcZV4rNFQcBi3m6A=;
        b=A5YjsZJI1wuXjhT5AbKp3GL/9LjyLsK3RtB0IRuWz5p+K+ETow6W/Q/4UJJOF7V1gX
         nqdBTeSW9YtWHgaCeehW+j0cgzVYh3nvdasGMa+PVbKqvHWhKi5Fy8iT23WMmAXRzcOQ
         W0jyl7lGhwmuCtgxkVs4TqJHOlGOl4QaDCj/b5lA7khdPRbdFKa2lPdlfBGrBKegEA+P
         KuOX7NJU35foIDiV/Zm+dhPh+jt/gJJ10il6mYQfrKdDehl0UblJzv8/ugOhuoo2BBhK
         6XaGJCBZbDs8Y2UKhdzx/f8oPhbU1y3d0yzC3EPtOKC8oK7CKpHZalFoWeNyi0FryTEY
         /vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743182674; x=1743787474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzrxTuw1glnQc1Rwu7OVa3OJ84tPcZV4rNFQcBi3m6A=;
        b=k0Yzo1HIFfNbaOE+M8ip1TsbaNewMSjDTLwN/tMVwGp2pFXtTW8c+N+YP5Sr9nVYVH
         UbqrlhrC/iecqRRTcjuoPRbUDD6TnXBlnCJ1DRggiXtZQ5syyAy8KJNT9jUi73uF9qRm
         c620bXQ/MHhV+IFgqjBG5sLpHLP5ADBR8ltZryAoz3tvqaiFc+E1keJyYFY9IBspUZW8
         krnMzkz8lMDlQF997h9PT4GqGAcUHPz1+CJQWm9JzDLymBVdICqDCBTsyFEAx1Yllq2w
         8AzcIXhzK0K6d26bkfsRyIJBft7Eg2gQt58QnF5oT/hTKjn73LVfcjdT585jIExEcFDQ
         lXnA==
X-Forwarded-Encrypted: i=1; AJvYcCW32zzoOFUudsjcayKz+Yd19DGAzfSlyFB0MCAIiSEe1WXFNRtKPLDGvbpXuH1+bAFc0Ba9bEEyBUSF/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxClnwpmkUIhVj9cLyZp4qWJVFWc5OrUPdCj4d0SejS9YVTtb7u
	uy3r/q1q3GSG33rU+Hkx6XS2QBKEBVxop3JfbBsN2mYBD7jFl691WQgy8oTRI7Y=
X-Gm-Gg: ASbGncuZfc4NRMLEZUPqK1+zQNNfM2yELv3qv0Ck1CBaPa7AGMI1nFQvWpD4LhkJLMN
	1Jf1tT0pCLdHcalSIHPWJ1NG6eCJIb9ugaAnzbQXSniHEYNj79uDhvAqP1bQ1OhrgYliWNaUiT/
	Go3TVI1WPxUSr/VErbuqgqAs8rwBphdY/LtZMUsbvsganJ0VcOkhAgYnDc/+ruMQTatxm3+ZZPl
	jI1PHgOqXDlRlU+ULQoECE7W5lnue5Qk21H3xacpw6LCB/G2fq86vNtdoUFj1qVmYjrthJ4edqZ
	09WIMuk7pWYlzMK0aP7gjBiy48kyCQMbeEyZionb1tIkLF5ifMDH19cmPl+c5l91IPlOxV5eeFp
	77FjJDVhK
X-Google-Smtp-Source: AGHT+IGyjy8B7DadiigM/xeS79qe+47ot9k7yWzDBDqfQeQidZF7a2d8EVjKnnq/rTcqt3/OlQlrZw==
X-Received: by 2002:a05:6830:264f:b0:72a:1a9f:7dc7 with SMTP id 46e09a7af769-72c6378f5b5mr131526a34.7.1743182673484;
        Fri, 28 Mar 2025 10:24:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-602844e6574sm401475eaf.2.2025.03.28.10.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 10:24:33 -0700 (PDT)
Message-ID: <3cccf190-112c-47d4-997e-3b3cf5e7a29e@riscstar.com>
Date: Fri, 28 Mar 2025 12:24:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <20250322155034-GYB11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322155034-GYB11633@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_102434_981439_D0DEAE7C 
X-CRM114-Status: GOOD (  34.41  )
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

On 3/22/25 10:50 AM, Yixun Lan wrote:
> Hi Alex:
> 
> this patch change relate to clock only, so how about let's fold
> it into clk patches (which now has not been merged), so we make
> the code right at first place? cause some moving around and renaming

I realize now I didn't respond to your other comments.

You suggested incorporating this change in the clock patches,
but I believe Haylen wants to avoid doing that (or doesn't want
to use all of it, anyway).

> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define a new structure type to be used for describing the OF match data.
>> Rather than using the array of spacemit_ccu_clk structures for match
>> data, we use this structure instead.
>>
>> Move the definition of the spacemit_ccu_clk structure closer to the top
>> of the source file, and add the new structure definition below it.
>>
>> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
> any good reason to change this? it make the code style inconsistent,
> do you just change it for shorten function, or want it to be more k1
> specific, so next SoC - e.g maybe k2? will introduce another function?

I think I was trying to shorten things.  At this point it's hard
to know which things are K1-specific and which things will be
generic for anything from SpacemiT.  Once something new comes
along the code will be updated based on what needs to change.

That said, I'll not rename this, and I will use "spacemit" rather
than "k1" in all of the new symbols I create.

>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 58 ++++++++++++++++++++++++++---------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 44db48ae71313..f7367271396a0 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -129,6 +129,15 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +struct spacemit_ccu_clk {
>> +	int id;
>> +	struct clk_hw *hw;
>> +};
>> +
>> +struct k1_ccu_data {
>> +	struct spacemit_ccu_clk *clk;		/* array with sentinel */
>> +};
>> +
>>   /*	APBS clocks start	*/
>>   
>>   /* Frequency of pll{1,2} should not be updated at runtime */
>> @@ -1359,11 +1368,6 @@ static CCU_GATE_DEFINE(emmc_bus_clk, CCU_PARENT_HW(pmua_aclk),
>>   		       0);
>>   /*	APMU clocks end		*/
>>   
>> -struct spacemit_ccu_clk {
>> -	int id;
>> -	struct clk_hw *hw;
>> -};
>> -
>>   static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>>   	{ CLK_PLL1,		&pll1.common.hw },
>>   	{ CLK_PLL2,		&pll2.common.hw },
>> @@ -1403,6 +1407,10 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_apbs_data = {
>> +	.clk		= k1_ccu_apbs_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>>   	{ CLK_PLL1_307P2,	&pll1_d8_307p2.common.hw },
>>   	{ CLK_PLL1_76P8,	&pll1_d32_76p8.common.hw },
>> @@ -1440,6 +1448,10 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_mpmu_data = {
>> +	.clk		= k1_ccu_mpmu_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>>   	{ CLK_UART0,		&uart0_clk.common.hw },
>>   	{ CLK_UART2,		&uart2_clk.common.hw },
>> @@ -1544,6 +1556,10 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> +static const struct k1_ccu_data k1_ccu_apbc_data = {
>> +	.clk		= k1_ccu_apbc_clks,
>> +};
>> +
>>   static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>>   	{ CLK_CCI550,		&cci550_clk.common.hw },
>>   	{ CLK_CPU_C0_HI,	&cpu_c0_hi_clk.common.hw },
>> @@ -1610,9 +1626,13 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
>>   	{ 0,			NULL },
>>   };
>>   
>> -static int spacemit_ccu_register(struct device *dev,
>> -				 struct regmap *regmap, struct regmap *lock_regmap,
>> -				 const struct spacemit_ccu_clk *clks)
>> +static const struct k1_ccu_data k1_ccu_apmu_data = {
>> +	.clk		= k1_ccu_apmu_clks,
>> +};
>> +
>> +static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>> +			   struct regmap *lock_regmap,
>> +			   struct spacemit_ccu_clk *clks)
>>   {
>>   	const struct spacemit_ccu_clk *clk;
>>   	int i, ret, max_id = 0;
>> @@ -1648,15 +1668,24 @@ static int spacemit_ccu_register(struct device *dev,
>>   
>>   	clk_data->num = max_id + 1;
>>   
>> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	if (ret)
>> +		dev_err(dev, "error %d adding clock hardware provider\n", ret);
>> +
>> +	return ret;
> I'd use "return 0;", nothing different, just explicitly short

That would mean the caller doesn't know about this error.
Why do that?  The caller is free to ignore it (but really,
shouldn't).  I think it's important to pass this information
back.  I'm going to keep this "return ret" in v2.

> 
> ok, I can understand this change ease debug procedure once there is problem.
> (but I'm fine with either way, failure should rarely happen & will
> identify early)
> 
>>   }
>>   
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>>   	struct device *dev = &pdev->dev;
>> +	const struct k1_ccu_data *data;
>>   	int ret;
>>   
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>> +		return -EINVAL;
>> +
>>   	base_regmap = device_node_to_regmap(dev->of_node);
>>   	if (IS_ERR(base_regmap))
>>   		return dev_err_probe(dev, PTR_ERR(base_regmap),
>> @@ -1677,8 +1706,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   					     "failed to get lock regmap\n");
>>   	}
>>   
>> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
>> -				    of_device_get_match_data(dev));
>> +	ret = k1_ccu_register(dev, base_regmap, lock_regmap, data->clk);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
>>   
>> @@ -1688,19 +1716,19 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   static const struct of_device_id of_k1_ccu_match[] = {
>>   	{
>>   		.compatible	= "spacemit,k1-pll",
>> -		.data		= k1_ccu_apbs_clks,
>> +		.data		= &k1_ccu_apbs_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-mpmu",
>> -		.data		= k1_ccu_mpmu_clks,
>> +		.data		= &k1_ccu_mpmu_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-apbc",
>> -		.data		= k1_ccu_apbc_clks,
>> +		.data		= &k1_ccu_apbc_data,
>>   	},
>>   	{
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>> -		.data		= k1_ccu_apmu_clks,
>> +		.data		= &k1_ccu_apmu_data,
>>   	},
>>   	{ }
> 	{ /* sentinel */ }

I think this is unnecessary but I'll do it--you're the SpacemiT
maintainer so you can define the style you want.

					-Alex

>>   };
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
