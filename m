Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A489ED46604
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 17:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/NHfJ/Ek7elPQxXw4PEcfSqTwcJnNfoJgjVeVf4/i8=; b=GhPsdR/4kHYkSu
	+WjkNWKsurnckXJtG7MWuBSfwAfCA+Co/fooUAB93e1oH0KsYGoE7Gg0m4G0H68vWo80VCdd2hd6O
	XTAdm2Up8P2gob0jiFVFqMDCFskwe5tz4AzfLbZdaHAk4fHHLzkPJGPqdA5rvV7fez+yzS2vtrFII
	AzzXKEHsjuA/IcaB33gM0NmyTDh7hrzeUG+sGKoYOUTBe83ykOtScT9wlIKOsC5hfDpevrCQU47I6
	n76sRxr9Q+lbAOOnJYMpyM0ec4TzV7Jpf+B6xLHL+0xXSKIoK7jrw0GwXaXC+zxVmEuIRzOLEHnZb
	5X6EUuAX5Walag0JVlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR83-0000000CqqR-3OF8;
	Thu, 15 Jan 2026 17:27:27 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgR81-0000000Cqpl-0a5K
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 17:27:26 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8c532d8be8cso117192485a.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 09:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768498044; x=1769102844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLlzGKvUrmAxxFHso9GvqI7pa/PyDGdLxFrtk+sdnXo=;
        b=GCr7be4LTs7ue5e5o2LdYT6lfxKIhO+CdNFxV8ucorZMOswXBglIEmAHYrEXws4f22
         eWxLL4kCmgu35FO4zEVSeCtpGyE5RzzCoo9gyIZT4RqSvJFruvrhuFdVTc6EFBr5lBYT
         5XH++y94SePZ9kD6N9Oya7Dnm+ymm4BbJZeujiK5V0nZxzf2R/qiz+Yo8DmgrgNx4JN8
         eyliPbObDOoBe3oIM7tdXo4GYnrlLLPS9c/TUkMyBoq6xc/IWvG6BkoonTF8aeSqqtex
         191fSS0v0BYQMUb5nge868TdlTgdo1ZDlReVDnFLSd0GL0BsKGWlnU2d8T7p9h7v/KJV
         hQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498044; x=1769102844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLlzGKvUrmAxxFHso9GvqI7pa/PyDGdLxFrtk+sdnXo=;
        b=Q45NtBWXGOkjjvtHYnDn0G1QIHNzam6tmy1iI6htKvnw7N6k6QANh6TPdpugMt6nwg
         KfuHtnpKoH5Qcn2yjh+ph6t9aA2xDNVTFkSUm73Uf8q4jXrshXxbfdVrNBfyc3SFN1o3
         EX+dVGbJZEFTGUg6AihsasUFCwC+W6SxqE2S+sxBLN3M3OhE5drmwQnWt12Np+B/Iyp1
         0AodiRexieFveY53MdtuS3cQNHBJNswr9FERpYhvwCclIEUEI/P09Hnutrt5GehSFZvg
         izNvrvTW3Z4ZXuIZNGFZrKARGWFuZyzlvy7Yu/rsNc/ow6A9lvfS/+7ggxmxctSu7Fng
         uuXg==
X-Forwarded-Encrypted: i=1; AJvYcCUzBF/Si2DgNGUUYkk2UgY89jfRFCZbW3DxDkdsoWWOJeo9w8O+ktbAcFYLolq9ruLiIRtW1YnXEAoVNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+AuvFRzoDNGc9SPEUtyEmwPdNkY+pBEtvRbuU2XkSt0F6yz+t
	PgEnDS2N+HcK9BkDqWplUzAedShmVWLVAZn9rVKDcInQGtoxrZxQF2d0u/jFxy2TcjA=
X-Gm-Gg: AY/fxX4dDS8AImmwKfXhiGTROnP7BGuATB3ydPBaEFYiefmfwkuuLuDZR5T5JOqX9VC
	iWrHnFT4zQfDtgw+TtpnMI2FlCakxI6Kwlcx9fqhB9k8j3GNr3xuMk57pZYHgJmNXZtgJPPuY6o
	e2gAYkyRmfHa1ylhlRuu0fvvrNhez1BLl3PMO66brkydHnfGp9L9iBVc2F+AUnTB9C1smoFwqvi
	5LDoZk5dxiSFn/buG1yu5DbaC9XOLiPAWk4kuKGHnGg+0iF08eSZt7F8SfceZijpzpTD63Hx2cl
	2tm+eiqmzj5s4FxKjRDl775AWrhSOcq6zLFYL8I16DOq4nxOn7zp80AKvo64MvCe+xx0Eho+Qlr
	Z0224nPMoTc1cvxkU8z0uQsLOk8HGwfDe8eqsTT0OdLVaoePhF/YeUrCWpZEpkszoxVmswSwwcq
	t4I/Nn/pYZYlYISf3jldTQDmfn7g31WU5lI/vPz8XvN+d25cuJL9C4
X-Received: by 2002:a05:620a:294d:b0:8b2:e704:5626 with SMTP id af79cd13be357-8c6a670df9amr25669385a.38.1768498043505;
        Thu, 15 Jan 2026 09:27:23 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a9e5d1sm452354985a.18.2026.01.15.09.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:27:23 -0800 (PST)
Message-ID: <cb298eda-0cb6-491c-91dd-f46b0d78e321@riscstar.com>
Date: Thu, 15 Jan 2026 11:27:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: spacemit: Add K3 reset support
 and IDs
To: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Haylen Chu <heylenay@4d2.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
 <20260108-k3-reset-v2-1-457df235efe9@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260108-k3-reset-v2-1-457df235efe9@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_092725_213741_21E657A5 
X-CRM114-Status: GOOD (  19.72  )
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

On 1/8/26 8:22 AM, Guodong Xu wrote:
> Update the spacemit,k1-syscon.yaml binding to document K3 SoC reset
> support.
> 
> K3 reset devices are registered at runtime as auxiliary devices by the
> K3 CCU driveri. Since K3 reuses the K1 syscon binding, there is no separate
> YAML binding file for K3 resets.
> 
> Update #reset-cells description to document where reset IDs are defined.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Looks good to me.

Acked-by: Alex Elder <elder@riscstar.com>

> ---
> v2: Update spacemit,k1-syscon binding to clarify K3 reset is supported.
>      Update the commit message to add backgrounds of this patch why,
>        instead of what.
> ---
>   .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
>   include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++++++++
>   2 files changed, 178 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 66e6683a3ccb94af2ddf71bf443424adcb7a0d72..1a28af22cac1d474fec8af3b6c7dc674a75ee734 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -10,7 +10,7 @@ maintainers:
>     - Haylen Chu <heylenay@4d2.org>
>   
>   description:
> -  System controllers found on SpacemiT K1 SoC, which are capable of
> +  System controllers found on SpacemiT K1/K3 SoC, which are capable of
>     clock, reset and power-management functions.
>   
>   properties:
> @@ -50,6 +50,12 @@ properties:
>   
>     "#reset-cells":
>       const: 1
> +    description: |
> +      ID of the reset controller line. Valid IDs are defined in corresponding
> +      files:
> +
> +      For SpacemiT K1, see include/dt-bindings/clock/spacemit,k1-syscon.h
> +      For SpacemiT K3, see include/dt-bindings/reset/spacemit,k3-resets.h
>   
>   required:
>     - compatible
> diff --git a/include/dt-bindings/reset/spacemit,k3-resets.h b/include/dt-bindings/reset/spacemit,k3-resets.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..79ac1c22b7b5447af1596edcb67a5dfa981e9ee7
> --- /dev/null
> +++ b/include/dt-bindings/reset/spacemit,k3-resets.h
> @@ -0,0 +1,171 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2025 SpacemiT Technology Co. Ltd
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
> +#define _DT_BINDINGS_RESET_SPACEMIT_K3_RESETS_H_
> +
> +/* MPMU resets */
> +#define RESET_MPMU_WDT           0
> +#define RESET_MPMU_RIPC          1
> +
> +/* APBC resets */
> +#define RESET_APBC_UART0         0
> +#define RESET_APBC_UART2         1
> +#define RESET_APBC_UART3         2
> +#define RESET_APBC_UART4         3
> +#define RESET_APBC_UART5         4
> +#define RESET_APBC_UART6         5
> +#define RESET_APBC_UART7         6
> +#define RESET_APBC_UART8         7
> +#define RESET_APBC_UART9         8
> +#define RESET_APBC_UART10        9
> +#define RESET_APBC_GPIO          10
> +#define RESET_APBC_PWM0          11
> +#define RESET_APBC_PWM1          12
> +#define RESET_APBC_PWM2          13
> +#define RESET_APBC_PWM3          14
> +#define RESET_APBC_PWM4          15
> +#define RESET_APBC_PWM5          16
> +#define RESET_APBC_PWM6          17
> +#define RESET_APBC_PWM7          18
> +#define RESET_APBC_PWM8          19
> +#define RESET_APBC_PWM9          20
> +#define RESET_APBC_PWM10         21
> +#define RESET_APBC_PWM11         22
> +#define RESET_APBC_PWM12         23
> +#define RESET_APBC_PWM13         24
> +#define RESET_APBC_PWM14         25
> +#define RESET_APBC_PWM15         26
> +#define RESET_APBC_PWM16         27
> +#define RESET_APBC_PWM17         28
> +#define RESET_APBC_PWM18         29
> +#define RESET_APBC_PWM19         30
> +#define RESET_APBC_SPI0          31
> +#define RESET_APBC_SPI1          32
> +#define RESET_APBC_SPI3          33
> +#define RESET_APBC_RTC           34
> +#define RESET_APBC_TWSI0         35
> +#define RESET_APBC_TWSI1         36
> +#define RESET_APBC_TWSI2         37
> +#define RESET_APBC_TWSI4         38
> +#define RESET_APBC_TWSI5         39
> +#define RESET_APBC_TWSI6         40
> +#define RESET_APBC_TWSI8         41
> +#define RESET_APBC_TIMERS0       42
> +#define RESET_APBC_TIMERS1       43
> +#define RESET_APBC_TIMERS2       44
> +#define RESET_APBC_TIMERS3       45
> +#define RESET_APBC_TIMERS4       46
> +#define RESET_APBC_TIMERS5       47
> +#define RESET_APBC_TIMERS6       48
> +#define RESET_APBC_TIMERS7       49
> +#define RESET_APBC_AIB           50
> +#define RESET_APBC_ONEWIRE       51
> +#define RESET_APBC_I2S0          52
> +#define RESET_APBC_I2S1          53
> +#define RESET_APBC_I2S2          54
> +#define RESET_APBC_I2S3          55
> +#define RESET_APBC_I2S4          56
> +#define RESET_APBC_I2S5          57
> +#define RESET_APBC_DRO           58
> +#define RESET_APBC_IR0           59
> +#define RESET_APBC_IR1           60
> +#define RESET_APBC_TSEN          61
> +#define RESET_IPC_AP2AUD         62
> +#define RESET_APBC_CAN0          63
> +#define RESET_APBC_CAN1          64
> +#define RESET_APBC_CAN2          65
> +#define RESET_APBC_CAN3          66
> +#define RESET_APBC_CAN4          67
> +
> +/* APMU resets */
> +#define RESET_APMU_CSI           0
> +#define RESET_APMU_CCIC2PHY      1
> +#define RESET_APMU_CCIC3PHY      2
> +#define RESET_APMU_ISP_CIBUS     3
> +#define RESET_APMU_DSI_ESC       4
> +#define RESET_APMU_LCD           5
> +#define RESET_APMU_V2D           6
> +#define RESET_APMU_LCD_MCLK      7
> +#define RESET_APMU_LCD_DSCCLK    8
> +#define RESET_APMU_SC2_HCLK      9
> +#define RESET_APMU_CCIC_4X       10
> +#define RESET_APMU_CCIC1_PHY     11
> +#define RESET_APMU_SDH_AXI       12
> +#define RESET_APMU_SDH0          13
> +#define RESET_APMU_SDH1          14
> +#define RESET_APMU_SDH2          15
> +#define RESET_APMU_USB2          16
> +#define RESET_APMU_USB3_PORTA    17
> +#define RESET_APMU_USB3_PORTB    18
> +#define RESET_APMU_USB3_PORTC    19
> +#define RESET_APMU_USB3_PORTD    20
> +#define RESET_APMU_QSPI          21
> +#define RESET_APMU_QSPI_BUS      22
> +#define RESET_APMU_DMA           23
> +#define RESET_APMU_AES_WTM       24
> +#define RESET_APMU_MCB_DCLK      25
> +#define RESET_APMU_MCB_ACLK      26
> +#define RESET_APMU_VPU           27
> +#define RESET_APMU_DTC           28
> +#define RESET_APMU_GPU           29
> +#define RESET_APMU_ALZO          30
> +#define RESET_APMU_MC            31
> +#define RESET_APMU_CPU0_POP      32
> +#define RESET_APMU_CPU0_SW       33
> +#define RESET_APMU_CPU1_POP      34
> +#define RESET_APMU_CPU1_SW       35
> +#define RESET_APMU_CPU2_POP      36
> +#define RESET_APMU_CPU2_SW       37
> +#define RESET_APMU_CPU3_POP      38
> +#define RESET_APMU_CPU3_SW       39
> +#define RESET_APMU_C0_MPSUB_SW   40
> +#define RESET_APMU_CPU4_POP      41
> +#define RESET_APMU_CPU4_SW       42
> +#define RESET_APMU_CPU5_POP      43
> +#define RESET_APMU_CPU5_SW       44
> +#define RESET_APMU_CPU6_POP      45
> +#define RESET_APMU_CPU6_SW       46
> +#define RESET_APMU_CPU7_POP      47
> +#define RESET_APMU_CPU7_SW       48
> +#define RESET_APMU_C1_MPSUB_SW   49
> +#define RESET_APMU_MPSUB_DBG     50
> +#define RESET_APMU_UCIE          51
> +#define RESET_APMU_RCPU          52
> +#define RESET_APMU_DSI4LN2_ESCCLK     53
> +#define RESET_APMU_DSI4LN2_LCD_SW     54
> +#define RESET_APMU_DSI4LN2_LCD_MCLK   55
> +#define RESET_APMU_DSI4LN2_LCD_DSCCLK 56
> +#define RESET_APMU_DSI4LN2_DPU_ACLK   57
> +#define RESET_APMU_DPU_ACLK      58
> +#define RESET_APMU_UFS_ACLK      59
> +#define RESET_APMU_EDP0          60
> +#define RESET_APMU_EDP1          61
> +#define RESET_APMU_PCIE_PORTA    62
> +#define RESET_APMU_PCIE_PORTB    63
> +#define RESET_APMU_PCIE_PORTC    64
> +#define RESET_APMU_PCIE_PORTD    65
> +#define RESET_APMU_PCIE_PORTE    66
> +#define RESET_APMU_EMAC0         67
> +#define RESET_APMU_EMAC1         68
> +#define RESET_APMU_EMAC2         69
> +#define RESET_APMU_ESPI_MCLK     70
> +#define RESET_APMU_ESPI_SCLK     71
> +
> +/* DCIU resets*/
> +#define RESET_DCIU_HDMA          0
> +#define RESET_DCIU_DMA350        1
> +#define RESET_DCIU_DMA350_0      2
> +#define RESET_DCIU_DMA350_1      3
> +#define RESET_DCIU_AXIDMA0       4
> +#define RESET_DCIU_AXIDMA1       5
> +#define RESET_DCIU_AXIDMA2       6
> +#define RESET_DCIU_AXIDMA3       7
> +#define RESET_DCIU_AXIDMA4       8
> +#define RESET_DCIU_AXIDMA5       9
> +#define RESET_DCIU_AXIDMA6       10
> +#define RESET_DCIU_AXIDMA7       11
> +
> +#endif /* _DT_BINDINGS_RESET_SPACEMIT_K3_H_ */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
