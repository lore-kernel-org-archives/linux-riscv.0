Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6187C28B30
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/SdlxvzfvbPDknMSa+qpRDBd4TazonpcixZMr+3gI0=; b=KqYRQMN8EsRcaY
	a6fYc4q8G6EO5G6G3ep8irGzb1vSFkxA6xOZMtK3vLAz4XWETcBcYmMRigzc/iIZm0Xyvf7LVCkKI
	9A31u3S3/klVfp0QTVYawEFPFQS3iBRcmb4DMmghMqjNN/DoBv9UwzowoSk/3mRf/zOj58PuU/ez7
	ts98ED0W56DAmsCk7Gq5meWdGEY067MgFwrb0lIulibW05ruzfhesgA28UPJ1ekvp7tXc1SQydzIP
	NkE/y2tIyg0ZJmguowBpCBTf50AG7FE9vCsrjpkIBYoToZk0K2lID+Rxy7zFJLXSI4fCSYAWir1TS
	9B7Vo3I6Vu0iRa7qi5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIq-00000001FJq-1MK3;
	Sun, 23 Mar 2025 13:23:48 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twLIo-00000001FIg-0Yc8
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 13:23:47 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-855fc51bdfcso128249139f.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736225; x=1743341025; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTnereCUToCBjbpym0YZFtNwg1Scl5evNKMBH+DpSTo=;
        b=Y8KxlaFRUywmJgqPhtSKsuDxuaWYw03AIWeGEuXc8Z67nOmWXYYY+tiFvTOmc8xZjA
         TvivmzCBNk3TGnhWTiLiyDjgFkr4268lHUfKrIQPR1ugtbaAoCvULtqH+ruPKwkQTlXw
         66Qs86rU9UVkHxLGqjstx2IS0v32RkY1I7egs/bP1EPHpNX3Dui9PDsauBsZTZZxSJvL
         zKoOO2U2p8wfcCAkj1o4nHKQLWoa2X1o7aV8WMDisxfcPAnessWrqONyGzE5u5eXjlZD
         0ZfG/QIY7TWoX2ZUd2x8KWjP1Pi+8GeGbfja+Cj+DY126uCCL5JJbM436yAHr1t6LqPJ
         H9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736225; x=1743341025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTnereCUToCBjbpym0YZFtNwg1Scl5evNKMBH+DpSTo=;
        b=VXRWA1WKUNLf9PdfjNC7V+ooVtIkn6aQUVKR37otfP6EDb5hesNjGcYw6m3iDYRKrf
         CGzPgLJcI1dRehJw4dAeBczdduBNRTvPWPdowoDEB2BIfzssG3v86qcGANJ5mOt0KVEP
         sthzg969/0xocQKll7Y9/8bUawmntWCh30z65mn9FRrTWFVIgh28X3/EDcCMeEzxdMMw
         vdNJUabH2K+KqJUtep7BpNtwUxHhChDfDiEXAvErqg8WRgQojtK3Is7Uqn6tAw/BuSfg
         Q+p0XPHMD9ty6uffDS6uG41VtksEKJCI7tmjTqVqnhHvrUvEeuX3HT0U3ADzel0KTXvK
         00iA==
X-Forwarded-Encrypted: i=1; AJvYcCVsr34L+NNJBBiqhc0gtNPJhNxmfsPsQ/cw9pShJzMgDCPYf5BOUrNqBvfGwsqf/N0XjenqMJBF6WGreg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4sQt5yUteTPvkxpfY4WOn9mmmiWv0M4JbBo8M2iSo1wtPLif
	A0DZQRtrZ63KinKk7svh5xNJy66Uhh9CSqzxqacC4xtvKVf/fQQY+XctA5RgD8w=
X-Gm-Gg: ASbGncsBPerjNZ6CrHbZS1DQ11ccBmuSIVNdNuObuELc0Qri36PpI7OCwDrZQPAmNPP
	e3DPfyCO7z9xxOPjTp46exg8YVRXRnGbj6E2Gv5vpCV8J+d2CrWXxt6U6Sg6dWApoUxnPd7TrYw
	Ij6rKLdknqf0B6dytPk9VGS8MtA8VCzjDNAIh2cG1/clAlybFTkI6acmYiUuJRNBGH41ys1K3U+
	o2R7crEtoqfCKYgCEbKkG8M83Jgtnjx8Bz2PDNssMECRw7ahaxIAl0V/+qO/3OgBKU7jbrDj6b5
	BwVbhlPj2jRv4M+pd3Mdk6V7lWzktcJDfXdfzMZwl44Lj9jqCo043prFzcetr2En9zQVVztY2cf
	swsTXwBbbzRRnro0NCw==
X-Google-Smtp-Source: AGHT+IEyiEr0s0I0JWc39bQgGyyEOgsa8Hq3iEeguBlRcgoHvfxYc8cWRzvc6IC340C/Y3c8KTlAwQ==
X-Received: by 2002:a05:6602:4a03:b0:85b:41cc:264e with SMTP id ca18e2360f4ac-85e2bf076c2mr785677539f.6.1742736225099;
        Sun, 23 Mar 2025 06:23:45 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:44 -0700 (PDT)
Message-ID: <c080eb55-943e-4564-8dcc-dd5f27b296a9@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:43 -0500
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
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322164247-GYD11633@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_062346_180008_EE0ADAD4 
X-CRM114-Status: GOOD (  22.82  )
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

On 3/22/25 11:42 AM, Yixun Lan wrote:
> Hi Alex:
> 
> It occur to me it's a little odd to implemnt reset driver
> for RCPU block, but after check with vendor the RCPU region can
> be accessed both by ACPU and RCPU, then I'm fine with this.

I implemented just the resets that were found in the downstream
code.

I first implemented a separate reset driver, very simple, which
only implemented the resets.  I had a separate DTS binding (like
was done for the PLLs).  I was ready to post it for review, then
noticed that the registers used were shared with clocks.  So I
merged all of that separate code into the clock driver, as you
see here.

> ACPU - RISC-V Main CPU, with mmu, running Linux
> RCPU - real time CPU, without mmu, running RT-OS

I didn't realize there was a separate CPU running its
own OS.  Is this managed as a remoteproc by the RISC-V AP?
The reset signals, I hope, are only touched by the AP
and not the real-time CPU.  Can you provide any further
information about this?

> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Enable support for three additional syscon CCUs which support reset
>> controls but no clocks:  ARCPU, RCPU2, and APBC2.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 17e321c25959a..bf5a3e2048619 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -130,6 +130,37 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +/* RCPU register offsets */
>> +#define RCPU_SSP0_CLK_RST		0x0028
>> +#define RCPU_I2C0_CLK_RST		0x0030
>> +#define RCPU_UART1_CLK_RST		0x003c
>> +#define RCPU_CAN_CLK_RST		0x0048
>> +#define RCPU_IR_CLK_RST			0x004c
>> +#define RCPU_UART0_CLK_RST		0x00d8
>> +/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
> this comment looks odd, XXX?

Yeah, I meant to remove that before sending but I forgot.

The downstream code treats this one register as being
part of the RCPU memory region, and extends that region
to be 0x2048 bytes to "fit" it.

The hardware documentation actually defines a different
"RCPU Audio Clock" memory region, and it might be more
correct (though less convenient) to define that as a
distinct region of memory.

What do you think?

					-Alex

>> +#define AUDIO_HDMI_CLK_CTRL		0x2044
>> +
>> +/* RCPU2 register offsets */
>> +#define RCPU2_PWM0_CLK_RST		0x0000
>> +#define RCPU2_PWM1_CLK_RST		0x0004
>> +#define RCPU2_PWM2_CLK_RST		0x0008
>> +#define RCPU2_PWM3_CLK_RST		0x000c
>> +#define RCPU2_PWM4_CLK_RST		0x0010
>> +#define RCPU2_PWM5_CLK_RST		0x0014
>> +#define RCPU2_PWM6_CLK_RST		0x0018
>> +#define RCPU2_PWM7_CLK_RST		0x001c
>> +#define RCPU2_PWM8_CLK_RST		0x0020
>> +#define RCPU2_PWM9_CLK_RST		0x0024
>> +
>> +/* APBC2 register offsets */
>> +#define APBC2_UART1_CLK_RST		0x0000
>> +#define APBC2_SSP2_CLK_RST		0x0004
>> +#define APBC2_TWSI3_CLK_RST		0x0008
>> +#define APBC2_RTC_CLK_RST		0x000c
>> +#define APBC2_TIMERS0_CLK_RST		0x0010
>> +#define APBC2_KPC_CLK_RST		0x0014
>> +#define APBC2_GPIO_CLK_RST		0x001c
>> +
>>   struct spacemit_ccu_clk {
>>   	int id;
>>   	struct clk_hw *hw;
>> @@ -1781,6 +1812,69 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.rst_data	= &apmu_reset_controller_data,
>>   };
>>   
>> +static const struct ccu_reset_data rcpu_reset_data[] = {
>> +	[RST_RCPU_SSP0]		= RST_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_I2C0]		= RST_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_UART1]	= RST_DATA(RCPU_UART1_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_IR]		= RST_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_CAN]		= RST_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_UART0]	= RST_DATA(RCPU_UART0_CLK_RST,	0, BIT(0)),
>> +	[RST_RCPU_HDMI_AUDIO]	= RST_DATA(AUDIO_HDMI_CLK_CTRL,	0, BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(rcpu_reset_data),
>> +	.data		= rcpu_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_rcpu_data = {
>> +	/* No clocks in the RCPU CCU */
>> +	.rst_data	= &rcpu_reset_controller_data,
>> +};
>> +
>> +static const struct ccu_reset_data rcpu2_reset_data[] = {
>> +	[RST_RCPU2_PWM0]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM1]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM2]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM3]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM4]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM5]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM6]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM7]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM8]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +	[RST_RCPU2_PWM9]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(rcpu2_reset_data),
>> +	.data		= rcpu2_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_rcpu2_data = {
>> +	/* No clocks in the RCPU2 CCU */
>> +	.rst_data	= &rcpu2_reset_controller_data,
>> +};
>> +
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RST_APBC2_UART1]	= RST_DATA(APBC2_UART1_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_SSP2]	= RST_DATA(APBC2_SSP2_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_TWSI3]	= RST_DATA(APBC2_TWSI3_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_RTC]		= RST_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_TIMERS0]	= RST_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RST_APBC2_KPC]		= RST_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RST_APBC2_GPIO]	= RST_DATA(APBC2_GPIO_CLK_RST,	BIT(2), (0)),
>> +};
>> +
>> +static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
>> +	.count		= ARRAY_SIZE(apbc2_reset_data),
>> +	.data		= apbc2_reset_data,
>> +};
>> +
>> +static struct k1_ccu_data k1_ccu_apbc2_data = {
>> +	/* No clocks in the RCPU2 CCU */
>> +	.rst_data	= &apbc2_reset_controller_data,
>> +};
>> +
>>   static struct ccu_reset_controller *
>>   rcdev_to_controller(struct reset_controller_dev *rcdev)
>>   {
>> @@ -1959,6 +2053,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
>>   		.compatible	= "spacemit,k1-syscon-apmu",
>>   		.data		= &k1_ccu_apmu_data,
>>   	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu",
>> +		.data		= &k1_ccu_rcpu_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-rcpu2",
>> +		.data		= &k1_ccu_rcpu2_data,
>> +	},
>> +	{
>> +		.compatible	= "spacemit,k1-syscon-apbc2",
>> +		.data		= &k1_ccu_apbc2_data,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
