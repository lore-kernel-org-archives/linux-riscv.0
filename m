Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAFEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8siev/sZ2shg8YRNGLaQxyCQFA7YUCHVU5dhD93iCPc=; b=BiZP7XtTmZ8w+b
	61xpRkp4ULCkI+OrIKt/AJGwUFEary/63nN6Md+9r6LNQJSoWx4jfamdOhkTJsINzHju8nS2lBa2W
	5CEQzYcvk8oo8YTDdao1Ged45yx++vVAN6y3JtgF/gLB40grZx9wuTNwrYxth2Kq5LspwkvwmBCMv
	w33tzx9hMHIfcM7vsrOLxcIpbzg72bSg2s/JKXXhU7vR/WyrVJdUBuMyCfSgZKCfzljEZfxfGRJtK
	6y1g6tjQq+LUoAqI2w9YENsbk6FdRgsnTgEjpGpzIijNMga5XG9RjzFOLw9tuRUtqSAlZNjxiO62c
	rE9nENpEkP8OJRhJdNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2LJ-00BO5G-Ol; Mon, 21 Nov 2022 08:39:53 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2LG-00BNsr-6S
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 08:39:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id h12so13671468ljg.9
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfCkci6WAZIMqirtlBXVAgsIpWsivyGhwX0F9z3bWiU=;
        b=x9dQ5gz9Db5VI+Z2oZrHNOOrl6Z4x7BtjhTdTIThj0UAk/R288TW4FwtXNuORuBjga
         D3J8jPefxGlLGwk3ktURUv/eA86KF8QhOMe4FTM0aHQ2mimI5XCBK1vxD/d8zgYxKvtk
         Bwqzq+7F3BVm33TdARoIamWOCo1BBtSEqIShD9ktZJDlXnOMBdoMG6B1Sn4mWF9qhVrp
         JzrUIpk7fBQRCb9Bz4ycfccudvVO/9liYC3yDuSwSyW4UVY3hlRUfzqPw++l2v4P6Dbl
         fzevFLGbJXsK8fNeJrj/NMXcqsXuIyVNFHeXHJ+bRfCuCBiAME5OQ1zuNL1oBYXA3G+2
         ABNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfCkci6WAZIMqirtlBXVAgsIpWsivyGhwX0F9z3bWiU=;
        b=1H9k00v8kn7uDEQ4Q59oKAmYgeg/GcQ09jcwbqYxX35P6NmQJPAAPnNo2FNuSQa5VX
         z2usjkDb+XHwCWYZlVYXmNCAMQ6rpyCfNeOmmlUrauz1u52juUlqh0U6lAhdbzi6PYX6
         9iAyaZe7BcByxl0bWbnKci73NrYXxNgQt7TLmMbKYs0xVLFByGYbIWBB8sBrd2hlRxqo
         WhSW9afm8Xt7HRbC23iGTauTWYuYlFeVaWS4ouH28WP8lwBVoHXr+dZoCc7yxZYtJlhG
         SEyE2KMRtS4cx9RLjHOVeunWVgZvu96jV1IeEGHOw+5p+LMinK1TTRKRcR4n38iB+D0p
         belw==
X-Gm-Message-State: ANoB5pmLWhQOsYRPTugb9vukeSUUU1mPDgrfl36hL1b0vuvTLE5tm/5R
	1bqPrtlnvZ9Gc+MzrTSn8em5tZG0tj/cnuKD
X-Google-Smtp-Source: AA0mqf4+cHjraVxBZWmP3/8G0vOaaHJL8lOp3PrnDsdPi67/SyOnVVqr4fn6Qm6+O4ikKowYJmJFKg==
X-Received: by 2002:a2e:b55b:0:b0:26c:554f:87a5 with SMTP id a27-20020a2eb55b000000b0026c554f87a5mr2132957ljn.452.1669019988308;
        Mon, 21 Nov 2022 00:39:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y18-20020a05651c107200b0027741daec09sm1306234ljm.107.2022.11.21.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:39:48 -0800 (PST)
Message-ID: <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
Date: Mon, 21 Nov 2022 09:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
In-Reply-To: <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_003950_296347_3EAEB542 
X-CRM114-Status: GOOD (  15.87  )
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

On 21/11/2022 09:38, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:11, Hal Feng wrote:
>> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>>
>> Add pinctrl definitions for StarFive JH7110 SoC.
>>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pinctrl/pinctrl-starfive-jh7110.h         | 427 ++++++++++++++++++
>>  1 file changed, 427 insertions(+)
>>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>>
>> diff --git a/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>> new file mode 100644
>> index 000000000000..fb02345caa27
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>> @@ -0,0 +1,427 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +/*
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
>> +
>> +/*
>> + * mux bits:
>> + *  | 31 - 24 | 23 - 16 | 15 - 10 |  9 - 8   |  7 - 0  |
>> + *  |  din    |  dout   |  doen   | function | gpio nr |
>> + *
>> + * dout:     output signal
>> + * doen:     output enable signal
>> + * din:      optional input signal, 0xff = none
>> + * function:
>> + * gpio nr:  gpio number, 0 - 63
>> + */
>> +#define GPIOMUX(n, dout, doen, din) ( \
>> +		(((din)  & 0xff) << 24) | \
>> +		(((dout) & 0xff) << 16) | \
>> +		(((doen) & 0x3f) << 10) | \
>> +		((n) & 0x3f))
>> +
> 
> 
> (...)
> 
>> +/* sys_iomux doen */
>> +#define GPOEN_ENABLE				 0
>> +#define GPOEN_DISABLE				 1
>> +#define GPOEN_SYS_HDMI_CEC_SDA			 2
>> +#define GPOEN_SYS_HDMI_DDC_SCL			 3
>> +#define GPOEN_SYS_HDMI_DDC_SDA			 4
>> +#define GPOEN_SYS_I2C0_CLK			 5
>> +#define GPOEN_SYS_I2C0_DATA			 6
>> +#define GPOEN_SYS_HIFI4_JTAG_TDO		 7
>> +#define GPOEN_SYS_JTAG_TDO			 8
>> +#define GPOEN_SYS_PWM0_CHANNEL0			 9
>> +#define GPOEN_SYS_PWM0_CHANNEL1			10
>> +#define GPOEN_SYS_PWM0_CHANNEL2			11
>> +#define GPOEN_SYS_PWM0_CHANNEL3			12
>> +#define GPOEN_SYS_SPI0_NSSPCTL			13
>> +#define GPOEN_SYS_SPI0_NSSP			14
>> +#define GPOEN_SYS_TDM_SYNC			15
>> +#define GPOEN_SYS_TDM_TXD			16
>> +#define GPOEN_SYS_I2C1_CLK			17
>> +#define GPOEN_SYS_I2C1_DATA			18
>> +#define GPOEN_SYS_SDIO1_CMD			19
>> +#define GPOEN_SYS_SDIO1_DATA0			20
>> +#define GPOEN_SYS_SDIO1_DATA1			21
>> +#define GPOEN_SYS_SDIO1_DATA2			22
>> +#define GPOEN_SYS_SDIO1_DATA3			23
>> +#define GPOEN_SYS_SDIO1_DATA4			24
>> +#define GPOEN_SYS_SDIO1_DATA5			25
>> +#define GPOEN_SYS_SDIO1_DATA6			26
>> +#define GPOEN_SYS_SDIO1_DATA7			27
>> +#define GPOEN_SYS_SPI1_NSSPCTL			28
>> +#define GPOEN_SYS_SPI1_NSSP			29
>> +#define GPOEN_SYS_I2C2_CLK			30
>> +#define GPOEN_SYS_I2C2_DATA			31
>> +#define GPOEN_SYS_SPI2_NSSPCTL			32
>> +#define GPOEN_SYS_SPI2_NSSP			33
>> +#define GPOEN_SYS_I2C3_CLK			34
>> +#define GPOEN_SYS_I2C3_DATA			35
>> +#define GPOEN_SYS_SPI3_NSSPCTL			36
>> +#define GPOEN_SYS_SPI3_NSSP			37
>> +#define GPOEN_SYS_I2C4_CLK			38
>> +#define GPOEN_SYS_I2C4_DATA			39
>> +#define GPOEN_SYS_SPI4_NSSPCTL			40
>> +#define GPOEN_SYS_SPI4_NSSP			41
>> +#define GPOEN_SYS_I2C5_CLK			42
>> +#define GPOEN_SYS_I2C5_DATA			43
>> +#define GPOEN_SYS_SPI5_NSSPCTL			44
>> +#define GPOEN_SYS_SPI5_NSSP			45
>> +#define GPOEN_SYS_I2C6_CLK			46
>> +#define GPOEN_SYS_I2C6_DATA			47
>> +#define GPOEN_SYS_SPI6_NSSPCTL			48
>> +#define GPOEN_SYS_SPI6_NSSP			49
>> +
>> +/* aon_iomux doen */
>> +#define GPOEN_AON_PTC0_OE_N_4			2
>> +#define GPOEN_AON_PTC0_OE_N_5			3
>> +#define GPOEN_AON_PTC0_OE_N_6			4
>> +#define GPOEN_AON_PTC0_OE_N_7			5
>> +
> 
> It looks like you add register constants to the bindings. Why? The
> bindings are not the place to represent hardware programming model. Not
> mentioning that there is no benefit in this.

Also: this entire file should be dropped, but if it stays, you have to
name it matching bindings or compatible (vendor,device.h).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
