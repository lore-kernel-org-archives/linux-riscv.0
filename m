Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D79C28B30
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbJV/PHVaHh4wCbOluEpsNQWbP2AYfksdwhy99TH8qo=; b=X4BCMX9cYK1NBb
	tIDZkc5uboFZPt1/ugJ3EQlCe0eU3HFPWFsNmfyCEgExpNYTK4UcmXUx3IyuRlUkS0d9GAvIB93/Y
	R18tn2z4GU6sMksQh/y+9C6Mjwu9Ms7x7Ao7pAvitCeuCcm5qoVGhCLuQz6GY/OrcnHymxzc+EFkc
	va8gqJnKMJIKTKFNkdKSiIH4ApSzxZ0ijl1C7BpRXydaMMBgOLd5FT2aP5pkjnXRmhoAZOCDm2/SD
	kyHF/72O6FHPwtwKpTnRXDfmCzNWUMNi22ws1pqTExWLq5kbztM5A/DEMVR0BY1Dy0MsmZE2Pz04y
	+cTbeY4ko36poiGRISug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIh-00000001FH8-0leN;
	Sun, 23 Mar 2025 13:23:39 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIe-00000001FGM-2Oyh
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 13:23:37 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d45875d440so17360465ab.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736215; x=1743341015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF1iVT3Gp1JCkjbWX7zYULPkp8dzcYyXF+RzM+PeslQ=;
        b=nYUC/BPt2DCIUjzAnLEtXNvXRg7UA1eEy92KlXUXVDPaYMCDYzoB9m1oIlVCZyGBWZ
         Glpi6sbD+7WIV3jrWm8/Vev4jLbSH0HnUpE5oIz33FRR6LUKVuqibzQxOFKZ9YZCpnrp
         I/tp35uFwZAJJrZbz9FGPQGcE3WePYynVPuRMWFJVVe23kPStjLBYw+y8/y01EQt6YBK
         CJYVjH06qSkSniFLMmpyy7pmv65CZVM0QgOePLFOJKcjenzH8qPqKkutzrrxrzj92Vih
         JqK8nkuPLHMIIrw00TV4xc5od+QmJ+c35A5vDAQB03X0MoUCLa8YRzl9O9dWbYCROHG7
         RLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736215; x=1743341015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MF1iVT3Gp1JCkjbWX7zYULPkp8dzcYyXF+RzM+PeslQ=;
        b=ZjFFWWxQMoEqJ7JCm2Zv81Nw5kq1huiEM3m5ZPN3IqVmJMHv9l9XryFQl4BIdm9OB9
         +EsMFqukmz4IaUjwCBwp6jLPL3AWuOjr7Vmlm3llvEz36Pm5a2+gKvaq1MXZelkWD+rs
         HrwRAaSAnL/Y37r5aGAhGCQz2cj6sdFg5qEgZJE/54h2yko87jk/jeNQsexsi4U8KBIT
         AeLvGDHXtnP1AdJ3JeOEsBh2kZ0iD5gjfSTOq5FLljNbS0mCAVvr6HKjgFQD3wfqaFnb
         nZcqTuQkpqcZBoB5nV2RkluboaPBsO1s3T85VJ+CcTW5bDF7sGa27aYlQ9l0twhYTKXG
         G3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCW0HyNIjW6mnt1NdxApz46iRDd/qVaKwB4RQH86eTpq5pDBJ8RRWvzpAPSyw1K1Oc5tm05kzTqpTpmzOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzis7+BfuAL6kF4+utOLP78M7q8pUdIb7K7+og3EpYoVugPjNB4
	2gXi/0Ubl9FxbRXnagh70Y40IMxr7vcD/L0tCmqmlehy2g28C4hoyVkvEdwKJ4k=
X-Gm-Gg: ASbGncuYpzTEnI5PvWSwvT1sVzYr5AzQixfMbGF2NVEwzmVo5ecxlmEy/St1eUdYi0J
	4ojNrsbNAB9Idi3xUUdjkJMSyeyepbb9SKoxAKScMzeYMJ8L2GosPwTA+7fSuGVuNzvW/WANFFj
	mSTXhttpNL/khff/jH6iGUzI2YJFp3RXjaidC72gKPAxmuoJqQACPro0KlTyAryWldSYoNa4WXc
	bTDBRhZhxjVQjjbK9Uhjhc7aKGfZ0QNEDDBIYbNNAkm9Dj0okfhi8ac++qk3eI20B9zF4cuneAZ
	nDG4uCNwfQfvDLfvMLbfGizQrhF18EiC0N+cSVhCq3sHJjt5R2njbXv5WJZJk9n4vyY/zbM5aSE
	uTrkhITeBrOcYI1BQFA==
X-Google-Smtp-Source: AGHT+IFR0CjPJdYQFsJ+qkfXY8PeJzk1jrSY+MFWWSTv2UJlux3/unLE6GBpx2aJu492yAFXoDeX/Q==
X-Received: by 2002:a05:6602:a117:b0:85e:2e8b:602 with SMTP id ca18e2360f4ac-85e2e8b0d55mr578692239f.2.1742736215295;
        Sun, 23 Mar 2025 06:23:35 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:34 -0700 (PDT)
Message-ID: <4ad5dc64-c6e5-476f-8674-bbedb8df5f8d@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com> <20250322161945-GYC11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322161945-GYC11633@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_062336_626070_6A6F6143 
X-CRM114-Status: GOOD (  29.66  )
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

On 3/22/25 11:19 AM, Yixun Lan wrote:
> Hi Alex:
> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define ccu_reset_data as a structure that contains the constant
>> register offset and bitmasks used to assert and deassert a reset
>> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
>> a structure that contains the address of an array of those structures
>> and a count of the number of elements in the array.
>>
>> Add a pointer to a ccu_reset_controller_data structure to the
>> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
>> the new pointer field will be null for CCUs without any resets.
>>
>> Finally, define a new ccu_reset_controller structure, which (for
>> a CCU with resets) contains a pointer to the constant reset data,
>> the regmap to be used for the controller, and an embedded a reset
>> controller structure.
>>
>> Each reset control is asserted or deasserted by updating bits in
>> a register.  The bits used are defined by an assert mask and a
>> deassert mask.  In some cases, one (non-zero) mask asserts reset
>> and a different (non-zero) mask deasserts it.  Otherwise one mask
>> is nonzero, and the other is zero.  Either way, the bits in
>> both masks are cleared, then either the assert mask or the deassert
>> mask is set in a register to affect the state of a reset control.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index f7367271396a0..6d879411c6c05 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>>   
>>   #include "ccu_common.h"
>>   #include "ccu_pll.h"
>> @@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
>>   	struct clk_hw *hw;
>>   };
>>   
>> +struct ccu_reset_data {
>> +	u32 offset;
>> +	u32 assert_mask;
>> +	u32 deassert_mask;
>> +};
>> +
>> +struct ccu_reset_controller_data {
>> +	u32 count;
>> +	const struct ccu_reset_data *data;	/* array */
>> +};
>> +
>>   struct k1_ccu_data {
>>   	struct spacemit_ccu_clk *clk;		/* array with sentinel */
>> +	const struct ccu_reset_controller_data *rst_data;
>> +};
>> +
>> +struct ccu_reset_controller {
>> +	struct regmap *regmap;
>> +	const struct ccu_reset_controller_data *data;
>> +	struct reset_controller_dev rcdev;
>>   };
>>   
>>   /*	APBS clocks start	*/
>> @@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.clk		= k1_ccu_apmu_clks,
>>   };
>>   
>> +static struct ccu_reset_controller *
>> +rcdev_to_controller(struct reset_controller_dev *rcdev)
> I'd suggest to avoid the line break to make it slightly more readable, intuitive
> as the 80 column limit isn't hard rule
> 
> there are maybe more place similar to this, I won't add more comments
> https://github.com/torvalds/linux/commit/bdc48fa11e46f867ea4d75fa59ee87a7f48be144

I disagree with this suggestion.  I personally find this
more readable.  As the first line of the patch you link to,
"80 columns is still preferred".  And regardless, it is my
(strong) preference to work within 80 columns in almost all
cases.

>> +{
>> +	return container_of(rcdev, struct ccu_reset_controller, rcdev);
>> +}
> since this function is only used once, open-code it?
> but I'd fine with either way if you prefer to keep it

The "to_<containing_type>()" function pattern is extremely
common, but I like this suggestion, given it's used only
once.  I'll implement it in v2.

> 
>> +
>> +static int
>> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
> s/k1_rst_update/k1_reset_update/g
> this is a taste change, but I found more people follow this when grep driver/reset

I actually had reset (not rst) before, throughout.  But it made
a few lines too long, leading to line wraps, so I did this.

In addition, there was a sort of consistency with the use of
"clk" instead of "clock", though I do recognize that abbreviation
goes way back to when Mike implemented the common clock framework.

I'll switch back to "reset" (and "RESET") in names, but be warned
I'll add some line breaks to fit within 80 columns.

>> +{
>> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
>> +	struct regmap *regmap = controller->regmap;
>> +	const struct ccu_reset_data *data;
>> +	u32 val;
>> +	int ret;
>> +
>> +	data = &controller->data->data[id];
>> +
>> +	ret = regmap_read(regmap, data->offset, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val &= ~(data->assert_mask | data->deassert_mask);
>> +	val |= assert ? data->assert_mask : data->deassert_mask;
>> +
>> +	return regmap_write(regmap, data->offset, val);
>> +}
>> +
>> +static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
> same reason, rst -> reset, more below
>> +{
>> +	return k1_rst_update(rcdev, id, true);
>> +}
>> +
>> +static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	return k1_rst_update(rcdev, id, false);
>> +}
>> +
>> +static const struct reset_control_ops k1_reset_control_ops = {
>> +	.assert		= k1_rst_assert,
>> +	.deassert	= k1_rst_deassert,
>> +};
>> +
>>   static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>>   			   struct regmap *lock_regmap,
>>   			   struct spacemit_ccu_clk *clks)
>> @@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>>   	return ret;
>>   }
>>   
>> +static int
>> +k1_reset_controller_register(struct device *dev, struct regmap *regmap,
>> +			     const struct ccu_reset_controller_data *data)
>> +{
>> +	struct ccu_reset_controller *controller;
>> +	struct reset_controller_dev *rcdev;
>> +
>> +	/* Resets are optional */
>> +	if (!data)
>> +		return 0;
>> +
>> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
>> +	if (!controller)
>> +		return -ENOMEM;
>> +
>> +	controller->regmap = regmap;
>> +	controller->data = data;
>> +
>> +	rcdev = &controller->rcdev;
> ..
>> +	rcdev->owner = THIS_MODULE;
> move to last?

You mean move nr_resets to last?  I'll do that.  I'll
order the assignments in the order they're defined in
"reset-controller.h".

>> +	rcdev->nr_resets = data->count;
>> +	rcdev->ops = &k1_reset_control_ops;
>> +	rcdev->of_node = dev->of_node;
>> +
>> +	return devm_reset_controller_register(dev, rcdev);
>> +}
>> +
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>> @@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
>>   
>> +	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
> ..
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
> same 100 column reason

This one I might go beyond columns, because it's only a few characters.

					-Alex

>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
