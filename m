Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E8FC36011
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTgJCWNM3Fsh5YB0TZD11eC0RFRzKb4Dh7lSh0edYzY=; b=vjDkcjYf/fTrQ+
	LZXb+UbIuLMBhGg9Z41L+6+Gzig5cvly7+MPK7qW4FqEGFmQjg80jEwB5joV070q2hf8se/VWmwjZ
	vr2+1pKn7Evg/wD64KnBaXjQn0EX95s9208N23BcLW508lucROxcdzqMeNCDDKu+wQV3XeOCH9tmU
	4Zr1q5BfQ3DC9FuxZ3kiDIH63MWuF1Q62+mrJZwXYEUZHKKoLIJIs+qIng79JaLPJlgie3G0lMeIR
	lGpO+hOPKLmbkj5i6AT2w9OcmkPO8+B2xmKjI2anAfsb7vsFK88K57FgmI2hVhoVhcBzFoZ1sc+QY
	iDy9SrGXt3CWAm9jRnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDRi-0000000Dzet-1epX;
	Fri, 28 Mar 2025 17:24:42 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyDRf-0000000Dzbz-2jSu
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 17:24:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-601a891ab8fso1316706eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 10:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743182678; x=1743787478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLrzm/zQ4gwThho8YYqEd980PysyFD6/Tw5SCyS4qEg=;
        b=CFjRvX5vA16yRjNrbIXQyPlg+GgGnL2Lwc42CnMZ/ghK1KyKjVD4/Hbp5fCLqFRh1D
         sb4JifDaQxCc5FV/vIPWQ7lLNgor9VmFxLnhO4ILZHKaTbfYQ126Y3IJNjHl+qjedsDU
         unWRclls4TfYYr1ycqnlfHhkVEJ1yKBwleHEDCmr+OwIt5WmF9FssTHRrdzCJNbpyvDl
         pRDGIFsjUhfufxXSx8GXIisGUxYc9VWcHkj8OYLFvO6B8o1sKXk7kPIJYTLZSXwIL2sA
         7k7gTd1PJXmrRjqBK8+6epy/MDn6YMp7dnd1/caSDZ067ogpbPiM+muA6gieDKCYd8zi
         Ak9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743182678; x=1743787478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLrzm/zQ4gwThho8YYqEd980PysyFD6/Tw5SCyS4qEg=;
        b=Ir5kGKa2rYGASCLHWZ1IPrABonjv69WIfceh3VNgUIZ6GRq7JhuJsZSf4aUDtR6W61
         u1QkkLFMqnlEaKYllyhTPNiFElgW51gIJ1DpM6Y0PNmcFd/QeB1mSpvBVhJw0UeG6EmF
         RYUC5knAtaySCvDBNjvv4pdEppuYYOqEQwrUycBkNAGmLTUfKXpwOnwlX0iF8xUrzAZE
         bwa5GkPB6o2IgPOnXemROqDf25vM2Q/ObkNpWdfC2OIBGhMir/Y0kzh9NbboEHVVRx1z
         0biUfpV94YUvEljgNDaAEZn1iGV+ePUNYf+iQgsQt6+6cCP238Zp13EhYsqzb+mLS16I
         P8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV673o918cJXKbUknuPVWF6pfBH9iULIKLf6sYKMNCTez+ZsMqa+t4wCrZ6KIwmaRW8f7jmnyBRy02XIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqcEWoaV1VLQkvSkorZNF75zP1sueLYx9xotVyso4rx/5/qn5Q
	lUNZnfBSZCRh4p1Lb2+7iUTY9L1AhMutrkVviCWJnpz7RXs21uzdFM8wOEA9/Y0=
X-Gm-Gg: ASbGncvsmLVX+8JUxrRULLRXprUoGLurmoX9HAyy3QPc76v30ZBpRxRAg2o4mGyorKn
	LqtzSBIyeZHr9kYPAxiLWKUGrz7YLdQadTvgexQ1gEap2sNKNFDfRHdcKEsBJA3ySAr8paZNMyS
	QYbk+JhB1OMPbKnrtmTi4N+17ELz1jISlguZ4qPHPW7JbaWfwBNX2iTl81n9uJLe6kfrPHAM6JB
	NpIp/629g6FGIG119SclGXlomtlP4kZpMXXroRgn8celngccy6rsfccG6DZsm321JVi0XrdwR4w
	aTqXzpkNuedIrakPk7KAo9FM4Qqcfg3eUHV9sJrhwjsytaxJ+QbAGXUWSRYVsZUx2qfj5pJeyRr
	kjMzLZrud
X-Google-Smtp-Source: AGHT+IGsEzLTxyMqQfC/rhlkp/3Yy0FWpMm5miVCQoyz9/uttGUbad/c15R9zzLWjxbYr4ZawMaYsw==
X-Received: by 2002:a05:6820:1885:b0:601:d595:3b08 with SMTP id 006d021491bc7-60290414a86mr192697eaf.2.1743182678377;
        Fri, 28 Mar 2025 10:24:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-602844e6574sm401475eaf.2.2025.03.28.10.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 10:24:37 -0700 (PDT)
Message-ID: <8211eca2-c768-4472-a849-17208848d361@riscstar.com>
Date: Fri, 28 Mar 2025 12:24:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 6/7] clk: spacemit: define new syscons with only
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-7-elder@riscstar.com> <20250322164247-GYD11633@gentoo>
 <c080eb55-943e-4564-8dcc-dd5f27b296a9@riscstar.com>
 <20250324062129-GYA19363@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250324062129-GYA19363@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_102439_699867_0E5B31C1 
X-CRM114-Status: GOOD (  31.75  )
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

On 3/24/25 1:21 AM, Yixun Lan wrote:
> Hi Alex:
> 
> On 08:23 Sun 23 Mar     , Alex Elder wrote:
>> On 3/22/25 11:42 AM, Yixun Lan wrote:
>>> Hi Alex:
>>>
>>> It occur to me it's a little odd to implemnt reset driver
>>> for RCPU block, but after check with vendor the RCPU region can
>>> be accessed both by ACPU and RCPU, then I'm fine with this.
>>
>> I implemented just the resets that were found in the downstream
>> code.
>>
>> I first implemented a separate reset driver, very simple, which
>> only implemented the resets.  I had a separate DTS binding (like
>> was done for the PLLs).  I was ready to post it for review, then
>> noticed that the registers used were shared with clocks.  So I
>> merged all of that separate code into the clock driver, as you
>> see here.
>>
> ok
> 
>>> ACPU - RISC-V Main CPU, with mmu, running Linux
>>> RCPU - real time CPU, without mmu, running RT-OS
>>
>> I didn't realize there was a separate CPU running its
>> own OS.  Is this managed as a remoteproc by the RISC-V AP?
>> The reset signals, I hope, are only touched by the AP
>> and not the real-time CPU.  Can you provide any further
>> information about this?
>>
> As far as I know, the RCPU region can be acccesed via AP and real-time CPU
> from hardware perspective, there is no guarantee of isolation,
> so maybe software should take care of this in case only one side can touch

The downstream code implements clocks and resets that are
apparently associated with that real-time CPU.  Now that
you've pointed this out, I investigated a little further.

In "k1-x.dtsi" I see these used (in downstram):
   CLK_RCPU_UART1 and RESET_RCPU_UART1
   CLK_RCPU_I2C0 and RESET_RCPU_I2C0
   CLK_RCPU_IR and RESET_RCPU_IR
   CLK_RCPU_CAN, CLK_RCPU_CAN_BUS, and RESET_RCPU_CAN
   CLK_RCPU2_PWM0 through CLK_RCPU2_PWM9 and
   RESET_RCPU2_PWM0 through RESET_RCPU2_PWM9

In "k1-x-hdmi.dtsi" I see these used:
   CLK_RCPU_HDMIAUDIO and RESET_RCPU_HDMIAUDIO

Also, the memory region associated with the "RCPU2"
really is 0xc0888000 in the downstream code, even though
that isn't seen in the documentation.

Yixun, do you think we should remove code that supports
RCPU resets *and* clocks, until we really need it (and
we understand better how/why they're used)?


In the next version of my reset series (which I plan to
send today) I will keep the RCPU resets.

> for remoteproc, I haven't checked, and it's unrelated to this discussion
> (doesn't change shared resource fact whether remoteproc supported or not)

I don't understand why the AP would manage multiple
clocks and resets for a separate processor.  I'm not
going to look at that now though.

>>> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>>>> Enable support for three additional syscon CCUs which support reset
>>>> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 106 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>>>> index 17e321c25959a..bf5a3e2048619 100644
>>>> --- a/drivers/clk/spacemit/ccu-k1.c
>>>> +++ b/drivers/clk/spacemit/ccu-k1.c
>>>> @@ -130,6 +130,37 @@
>>>>    #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>>>    #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>>>    
>>>> +/* RCPU register offsets */
>>>> +#define RCPU_SSP0_CLK_RST		0x0028
>>>> +#define RCPU_I2C0_CLK_RST		0x0030
>>>> +#define RCPU_UART1_CLK_RST		0x003c
>>>> +#define RCPU_CAN_CLK_RST		0x0048
>>>> +#define RCPU_IR_CLK_RST			0x004c
>>>> +#define RCPU_UART0_CLK_RST		0x00d8
>>>> +/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
>>> this comment looks odd, XXX?
>>
>> Yeah, I meant to remove that before sending but I forgot.
>>
>> The downstream code treats this one register as being
>> part of the RCPU memory region, and extends that region
>> to be 0x2048 bytes to "fit" it.
>>
>> The hardware documentation actually defines a different
>> "RCPU Audio Clock" memory region, and it might be more
>> correct (though less convenient) to define that as a
>> distinct region of memory.
>>
>> What do you think?
>>
> I'm not sure, but from DT perspective, is it an independent device?
> if yes, then need to describe as a distinct region..

I think we should just remove these definitions.  And
because of that, I'm going to leave this as-is (included
with the existing RCPU memory region and device) in the
next version of my code.  If we decide to keep them, I
can separate them later.

					-Alex

>> 					-Alex
>>
>>>> +#define AUDIO_HDMI_CLK_CTRL		0x2044
>>>> +
>>>> +/* RCPU2 register offsets */
>>>> +#define RCPU2_PWM0_CLK_RST		0x0000
>>>> +#define RCPU2_PWM1_CLK_RST		0x0004
>>>> +#define RCPU2_PWM2_CLK_RST		0x0008
>>>> +#define RCPU2_PWM3_CLK_RST		0x000c
>>>> +#define RCPU2_PWM4_CLK_RST		0x0010
>>>> +#define RCPU2_PWM5_CLK_RST		0x0014
>>>> +#define RCPU2_PWM6_CLK_RST		0x0018
>>>> +#define RCPU2_PWM7_CLK_RST		0x001c
>>>> +#define RCPU2_PWM8_CLK_RST		0x0020
>>>> +#define RCPU2_PWM9_CLK_RST		0x0024
>>>> +
>>>> +/* APBC2 register offsets */
>>>> +#define APBC2_UART1_CLK_RST		0x0000
>>>> +#define APBC2_SSP2_CLK_RST		0x0004
>>>> +#define APBC2_TWSI3_CLK_RST		0x0008
>>>> +#define APBC2_RTC_CLK_RST		0x000c
>>>> +#define APBC2_TIMERS0_CLK_RST		0x0010
>>>> +#define APBC2_KPC_CLK_RST		0x0014
>>>> +#define APBC2_GPIO_CLK_RST		0x001c
>>>> +
>>>>    struct spacemit_ccu_clk {
>>>>    	int id;
>>>>    	struct clk_hw *hw;
>>>> @@ -1781,6 +1812,69 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>>>>    	.rst_data	= &apmu_reset_controller_data,
>>>>    };
>>>>    
>>>> +static const struct ccu_reset_data rcpu_reset_data[] = {
>>>> +	[RST_RCPU_SSP0]		= RST_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_I2C0]		= RST_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_UART1]	= RST_DATA(RCPU_UART1_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_IR]		= RST_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_CAN]		= RST_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_UART0]	= RST_DATA(RCPU_UART0_CLK_RST,	0, BIT(0)),
>>>> +	[RST_RCPU_HDMI_AUDIO]	= RST_DATA(AUDIO_HDMI_CLK_CTRL,	0, BIT(0)),
>>>> +};
>>>> +
>>>> +static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
>>>> +	.count		= ARRAY_SIZE(rcpu_reset_data),
>>>> +	.data		= rcpu_reset_data,
>>>> +};
>>>> +
>>>> +static struct k1_ccu_data k1_ccu_rcpu_data = {
>>>> +	/* No clocks in the RCPU CCU */
>>>> +	.rst_data	= &rcpu_reset_controller_data,
>>>> +};
>>>> +
>>>> +static const struct ccu_reset_data rcpu2_reset_data[] = {
>>>> +	[RST_RCPU2_PWM0]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM1]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM2]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM3]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM4]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM5]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM6]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM7]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM8]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +	[RST_RCPU2_PWM9]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>>>> +};
>>>> +
>>>> +static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
>>>> +	.count		= ARRAY_SIZE(rcpu2_reset_data),
>>>> +	.data		= rcpu2_reset_data,
>>>> +};
>>>> +
>>>> +static struct k1_ccu_data k1_ccu_rcpu2_data = {
>>>> +	/* No clocks in the RCPU2 CCU */
>>>> +	.rst_data	= &rcpu2_reset_controller_data,
>>>> +};
>>>> +
>>>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>>>> +	[RST_APBC2_UART1]	= RST_DATA(APBC2_UART1_CLK_RST,	BIT(2), (0)),
>>>> +	[RST_APBC2_SSP2]	= RST_DATA(APBC2_SSP2_CLK_RST,	BIT(2), (0)),
>>>> +	[RST_APBC2_TWSI3]	= RST_DATA(APBC2_TWSI3_CLK_RST,	BIT(2), (0)),
>>>> +	[RST_APBC2_RTC]		= RST_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>>>> +	[RST_APBC2_TIMERS0]	= RST_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>>>> +	[RST_APBC2_KPC]		= RST_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>>>> +	[RST_APBC2_GPIO]	= RST_DATA(APBC2_GPIO_CLK_RST,	BIT(2), (0)),
>>>> +};
>>>> +
>>>> +static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
>>>> +	.count		= ARRAY_SIZE(apbc2_reset_data),
>>>> +	.data		= apbc2_reset_data,
>>>> +};
>>>> +
>>>> +static struct k1_ccu_data k1_ccu_apbc2_data = {
>>>> +	/* No clocks in the RCPU2 CCU */
>>>> +	.rst_data	= &apbc2_reset_controller_data,
>>>> +};
>>>> +
>>>>    static struct ccu_reset_controller *
>>>>    rcdev_to_controller(struct reset_controller_dev *rcdev)
>>>>    {
>>>> @@ -1959,6 +2053,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>>>    		.compatible	= "spacemit,k1-syscon-apmu",
>>>>    		.data		= &k1_ccu_apmu_data,
>>>>    	},
>>>> +	{
>>>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>>>> +		.data		= &k1_ccu_rcpu_data,
>>>> +	},
>>>> +	{
>>>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>>>> +		.data		= &k1_ccu_rcpu2_data,
>>>> +	},
>>>> +	{
>>>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>>>> +		.data		= &k1_ccu_apbc2_data,
>>>> +	},
>>>>    	{ }
>>>>    };
>>>>    MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
