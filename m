Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA23C36002
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZszqhFSTIXpFgq2dIYoTqmVxrHOtQqFOMweILCERqAg=; b=FACNwkUQyyXr1R
	yFep1vOQuqIar/56ca4zqm5WqsGVZ70Oq5HDEXjDB0TM28BM+bI9HaMA/QpMqK4FDqeVLdu5V7GfT
	2bdAYjN4tTazVW/lkmLeEYSr3qsn6hUd7EoTXCiff5+BrMJ+GmOHH9SgHWSSC1VzoBnCNBtvtB0cS
	At0XrtC8XgKZU3B0v4T1IiCOjXqh5qk8rdhc/rasHuEvgntJxZ3jr3xC8lH5+NtWon88bHZXm2K/9
	vYhdFGxwI6NrU5ALDQM5pWvlMlGTkCCgGQShPs0rz7tjFIYOZR8E1WTOAFUoN7ooqcSfGvC7YCbWX
	U0H/kY7BxzG12Ix3lxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIm-00000001FII-35KZ;
	Sun, 23 Mar 2025 13:23:44 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIk-00000001FHT-03EB
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 13:23:43 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso116471239f.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736221; x=1743341021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rjwFsPUVvvPhnWO0yZbKmPZex9tHV8eOTprS6xHwcQ=;
        b=X0YAhPi/fcfvI4woGYb/7Bj9090M3Jhf0SOeTNbSa6DzU07pLeO9BFGhaYFQ1uZmNH
         3Gkjk1NM8xQEfC7prBKD7PXmzLeNGKc1NNiFXAWfFXzMxFbxSEmk3MF0sHo4u9xY4UNh
         rqUIzwocB2lZaxUxJNs+9bQBFZ+xTh83o89lX9TpML0CCCCv0fcAXoNy+NJrFgCGfY24
         AYn3PUxKhbI5Z2QofICKxU2vZOrEq1vq+caFWuaL3x8/tUnS6R7e73mJfwlqPH2TzorW
         Ozhq5BjNwtDAW0isGe1u0jCjGZiOPg/UtnxDs2LWYqSBfRrc/EgH+IjkMquZfoMEgBpV
         h1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736221; x=1743341021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rjwFsPUVvvPhnWO0yZbKmPZex9tHV8eOTprS6xHwcQ=;
        b=Kb739BQhEiOoAracJPt3yBYp04MrNuwmpyOIoBL/D125U2aQAD/W6Ta0m8EOxLhKMu
         ivcuYv2S1XgdHn5rELRaWUMDuL5g1w9JZ2cG5LiToxArjgaadqsbvVb+BS5c6uSaF813
         LDeL8ohm41I0tw8s+6JzxyTmNk/yhIasfE3A13YjWAVAPViAibVhP2MurHBSQZtB75bf
         pVtA7nbdOh/qBChuD9urHKinsbnjbxauWx0PblJN3AUGVGBMcQzQ5FQITS/b5oBYrtUM
         +d9K4BPmcmbtl5RTTZ+FZI7i3+WUZXkuMbM8Q6rvOpXUsx3MexfXyQUynojFdKNpFWRh
         EpYA==
X-Forwarded-Encrypted: i=1; AJvYcCXDcZUeuV4DY9Ly6Uv32GfzWZRQa1iQBRSJu+9Vw3po1bRKHFWz2FU/Nl+ILcvwX/z8PKSxVhDE6guz3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH7hnCMJMLj0K+li22oTFKAk6iU9Y7Bbu9spokShdEwjlLWTiA
	rZuaXaooJ0CeySvhu2Gnz5PxQ+HFELjlm7zauzVccn1F0sj0zJQZ6yY+YvqdLKs=
X-Gm-Gg: ASbGncu4TbKTEwK5E4A7ifNRPZMCfz2UiBQdgwNlVGT7N4EzvO8PVWt3GSWmGr++raC
	FlUFaQuftMIYl+FYtnL8Gk1a8MzQugHdWRDvTptL5Fm3bA7EjI93RDL42ViGwTZHvG6DPw2xydY
	yGzv4k0Sm7Gg5ujKWq1APbrw51aLiLXm3HH3FpQj2/OxZ7dHAD+eNqfOx7EBkVUEAnNirKxsf8x
	ngYoV9IMu4xcSajLZ2EtrmyTp9DYQh4puafjnYBk8Bsrt6MY5dw1xAyeBWLzb0d/Zun75/J9Lnz
	FGxZQqehTLeHaOW7Z8q+xSyNxqntD1w4v7SnHTZzJRN1O2WaMgLMC/5iq89dZ0i8wtUsjeyuzAG
	+qROOtZvtmYZlrMK6rA==
X-Google-Smtp-Source: AGHT+IF7Fd96mUgZBjBUyzdPCTDqsovLEsSmo2AzCv+iLTRjoA03l+8HJEkqodCvbMpbBAiH42tMqg==
X-Received: by 2002:a05:6602:3a0f:b0:85b:5869:b66 with SMTP id ca18e2360f4ac-85e2ca18965mr965437839f.1.1742736220910;
        Sun, 23 Mar 2025 06:23:40 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:40 -0700 (PDT)
Message-ID: <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-5-elder@riscstar.com> <20250322162909-GYA15267@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322162909-GYA15267@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_062342_058675_77C7379A 
X-CRM114-Status: GOOD (  12.75  )
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

On 3/22/25 11:29 AM, Yixun Lan wrote:
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define reset controls associated with the MPMU, APBC, and APMU
>> SpacemiT K1 CCUs.  These already have clocks associated with them.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 6d879411c6c05..be8abd27753cb 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> ..
>> +static const struct ccu_reset_data apmu_reset_data[] = {
>> +	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
>> +	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
> ..
>> +	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
>> +				      BIT(9)|BIT(10)|BIT(11)),
> 100 column if possible, also add one space between "BIT(9) | BIT(10) .."
> continuous bits can just use GENMASK for short?

You'll notice that every place that has multiple bits in the mask
also have a line break.  I kind of liked that as a way to highlight
that fact (i.e., it goes beyond my preference for 80 columns).

I will definitely add spaces, that was a mistake not to.

I will not define this with GENMASK().  In this case each bit
represents a single reset, and so each one is significant on
its own.  It is *not* a mask of contiguous bits, it's a set
of bits that happen to have consecutive positions.

					-Alex

> but may result slightly unreadable, anyway, either way is fine by me
> 
>> +	[RST_QSPI]	= RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_QSPI_BUS] = RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_DMA]	= RST_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_AES]	= RST_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_VPU]	= RST_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_GPU]	= RST_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMMC]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMMC_X]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_AUDIO]	= RST_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
>> +				   BIT(0) | BIT(2) | BIT(3)),
>> +	[RST_HDMI]	= RST_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
>> +	[RST_PCIE0]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_PCIE1]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_PCIE2]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
>> +				   BIT(3) | BIT(4) | BIT(5)),
>> +	[RST_EMAC0]	= RST_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_EMAC1]	= RST_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_JPG]	= RST_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_CCIC2PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
>> +	[RST_CCIC3PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
>> +	[RST_CSI]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
>> +	[RST_ISP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
>> +	[RST_ISP_CPP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
>> +	[RST_ISP_BUS]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
>> +	[RST_ISP_CI]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
>> +	[RST_DPU_MCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
>> +	[RST_DPU_ESC]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
>> +	[RST_DPU_HCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
>> +	[RST_DPU_SPIBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL,	0, BIT(4)),
>> +	[RST_DPU_SPI_HBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
>> +	[RST_V2D]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
>> +	[RST_MIPI]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
>> +	[RST_MC]	= RST_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data apmu_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(apmu_reset_data),
>> +	.data		= apmu_reset_data,
>> +};
>> +
>>   static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.clk		= k1_ccu_apmu_clks,
>> +	.rst_data	= &apmu_reset_controller_data,
>>   };
>>   
>>   static struct ccu_reset_controller *
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
