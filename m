Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83540C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zgLgrObVRaI1PiQCwJhkVDSQ7WhpZzVBtnsHP5HiaA=; b=fPLbHcYTctWim6
	dIxOfFBhUm4JxFN70UVzOchUKBs9vYxpXyCFWL1qAaCDSzPPO02XuUOZXczMx5FPt+8kRpsVLdt0D
	AiHaBTo3NYb8VgGoFzx4HJaiUJrUqg+8IOSYfcwoOXX/B/jcweNIJGV0XrZA31hcUaq/or2KzIKkR
	sJlgJcAsNOUjRCCWNYtWNCcvF5IyNe64xMaomD4MO4ro6m1pdtnSMllJA4V77IUi5/0vk0VYA/E/o
	6MqhtTmj9OHIP+GoHsnOKKrln3YVVBWfLrtLhIozOH2b6k6QxmaB3WiReOFrPqIDNs+aNzYWcMaUn
	oVy9u4eI1hRIZQiJcVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twgk7-000000032jK-1iTI;
	Mon, 24 Mar 2025 12:17:23 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twgk5-000000032iu-0tb2
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 12:17:22 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-85db3475637so167056539f.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742818640; x=1743423440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=PSpuITK1gvpurGT9+rmJYvU21j6N57K2+iPK96f+NB5Rred1i0w+YFMOP3hrU1aJdL
         uzsR7L33Ji6gma6JhgreEy0tWqRYSI444Cm3Xhy/wmpvuIWdD+m7AMtcpdzFaoc4ZQcH
         QaYgp7IEODRvvJn9DDJroWc4mJX7UJJwt/VH1ThyU5kY6QryEnOMpWjgrMWPzWOQ34QB
         OAus/okUiOXYASCZs1kLXbw9fxXT7Eq4EV6FmhT6q+9b3z8UJzlDHuVPvL4yNK2o0MU2
         vMFCsxiujq26YrR51182UWxhtGB7AJrMdaA2UQdqFPJMX2VEvR7YeK/iFo2pfwdtEOYZ
         WrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818640; x=1743423440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=qlYMx09bTvk4ZsaoCHnvH6ZsD2XD9v0UIDb9Z8k9uLzsYHtGwc4ZVLlJGZLy/GvP0O
         Pvvef5jc2+FnAiJDtPL7zFdhe4QefAhHTewn8cHxK9DkuMA0VdzxdRHgQ6WodR95HFYO
         tLRCM7vNGNAjQdbsc4+FwpJzBfXVG2pAejN+bi6rAbpHEpWTdDzLNdmkc9YvdcGrt9N4
         jYVtNGBkwsBfeoTSift2vj/veeuuyiYRgcJi/4NLUXCZXl5Pxq7XWpC9UvbQUiLlkNGo
         YRt9qmwj6dC1Yggrbn5I+7EV22TiUWp4rbJcHjwTE8e6bFTBMTFD1iSOouxsbs6W8BoS
         Jfcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+2y8AAA8hc5T6OgVRVbpcZmLjuVvGf3iX7UE+9HF9dRetRBelq+8ST48k+dFvrCkrH0uttcKUYoddjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFuRwCDkI9U01zFca2QXArONXrnlUPqiRir+i6pUn7xAINpKfq
	O3MZVbHdC4Wzlx2W0L9i+uipfZNASdaiVj5hJmNn248Rd9TZMkUv4mckM+s4eAasvwbaBYUZn0S
	F1f8=
X-Gm-Gg: ASbGncuhr6i/dgt7SWV8womOzdhoryY8yxqs8tigLsWRWc9jixC2JcISL7kfmROaHHZ
	eOH3HzSGVpyw0Mf7owDYFYqIK63lvo/HDBGiCyqyMR6xOkXUc6VtZL7gyGTyu3hUVg9tX72ajMB
	2WP6y31pL0aQ7Dwie/rVedhzCX9q0WqhHw//2ez8JjxP4aCEKfU+dRcbwGSI1GmbnsxL9h7SP5F
	n+IxWkfIhtpyQYeNTOFHackIbXp7t7nuu+II4kg5mOx08yRtWCIHab3elqs/R0wmmdyyi3ghzqs
	VLNsexlXvS15FCJHdt9wpQQrKItvTGU8sxj3b0YkUAw59Js3opNQFk66UUlZX9uLfRht8v6Rz5v
	mPAfER8iTeISurydzP+M6gE6xE+vm
X-Google-Smtp-Source: AGHT+IFRMWJu8cQwf/wCsj/90WfTQghFt/WjaXKq/fnbgU/ftzK6xeINV2Af8c2Selfxs/zF8TcQyA==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr1629181439f.1.1742818639889;
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c42esm160016039f.30.2025.03.24.05.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Message-ID: <b8edc46b-bc99-47c1-8900-0e08c97de9d6@riscstar.com>
Date: Mon, 24 Mar 2025 07:17:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Haylen Chu <heylenay@4d2.org>, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <Z-FHt3mDyEBKpa8O@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-FHt3mDyEBKpa8O@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_051721_389368_B063AA64 
X-CRM114-Status: GOOD (  32.37  )
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

On 3/24/25 6:53 AM, Haylen Chu wrote:
> On Fri, Mar 21, 2025 at 10:18:25AM -0500, Alex Elder wrote:
>> Define a new structure type to be used for describing the OF match data.
>> Rather than using the array of spacemit_ccu_clk structures for match
>> data, we use this structure instead.
>>
>> Move the definition of the spacemit_ccu_clk structure closer to the top
>> of the source file, and add the new structure definition below it.
>>
>> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
> 
> I've read your conversation about moving parts of the patch into the
> clock series, I'm of course willing to :)
> 
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
> 
> This is something like what I've dropped in v5 of the clock series so I
> doubt whether it should be added back in clock series again, as at that
> point there's no reason for an extra structure: Alex, is it okay for you
> to keep the change in reset series?

That's perfectly fine with me.  It's not necessary yet, so it's
just fine for you to do things the way you did, and I'll add this
in as part of the reset series.

> ...
> 
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
> 
> This error message definitely should go in the clock series.
> 
>> +	return ret;
>>   }
> 
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
> 
> Looking through the reset series, I don't see a reason that
> of_device_get_match_data() could return NULL. This is also something
> you've asked me to drop in v4 of the clock series, so I guess it isn't
> necessary.

You are correct.  I'll drop it.  I contemplated this and thought
it's useful to tell the reader it's necessary to not be null, but
you can tell it has to be by inspection.


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
> 
> For using ARRAY_SIZE() to simplify runtime code, it's mostly okay since
> binding IDs are continuous 0-based integers. But I split the handling of
> TWSI8 into another patch, which creates a hole in the range and breaks
> the assumption. Do you think the TWSI8 commit should be merged back in
> the clock driver one?

I didn't understand the reason why you separated the TWSI8 into a
separate commit.  Now I know.  The hole in the range doesn't really
matter much; you already initialize your ->hws[] array of pointers
with ERR_PTR(-ENOENT), so any holes are handled properly.

					-Alex
> 
> Best regards,
> Haylen Chu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
