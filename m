Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE0AC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iJU5yzyoTJTTmMQiA3uNcYLS9zQY7mg+57bOYEbtmKw=; b=Vwf6pRtCZ705d5k1R2LdImgQPb
	fRz8eFNaGYnuSSEVngiHSLt3X0vcEk+SIGUUcIVsSPv3Mi4QKN26pOB+UqSD/T9ZAvdQczqepJliy
	gHSwxeDLpaTvyqCqu9Sp4ibBJ4vaUO2WceEycmpFIfA9gAvWK1CqCL1PhfOy4IedyLNiR6/l+Vzes
	4/HXKQAWBi4hvLZ7yFThsRU/RSjysCxORU3CfY1sqa18vMjP9J9bbdNmIMpDWTtpo0YZNG3KpriiU
	7SFROLBXzMZJaHXjaAgJSTjUANoUnvxxoRXU69MCPf5gMS495SH3iKNcTV4NjFhAnjOnitfjoKRD6
	J3xoMhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmqG-0000000EneV-1APa;
	Thu, 14 Mar 2024 15:18:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmqC-0000000Encq-060e
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 15:17:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e6c8b1ccd7so900230b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1710429470; x=1711034270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JL0iEjRkP+Wzhg7yrg5gEUCCcXYJeQFMMh/fE8SWiQ=;
        b=ZK8Sovr/MqgMKcb/HRZrJxvDOPueTSbqbRosyw+8A4DmbYWUZ8Ezq+ZVZMFTZixEPD
         3VHm1ALpTcDIaL6j3lZAsmcXGkzidjOzEbspMGQEZ/HPgboJzTv4YZpgjZ5MlrS+wdm4
         dhyYqDsq6gLZcSJ4F/AAgk+DM9ZbjJPvcECBp7GLk45+PUeEy8UvoIOsTAj/5ibqYjTw
         a6tQMGoIUnhzFVBOhdRAXnn+Hk6ibHDrUlL9eSfGTLlRiuBMMifIy6vDLpb2e22Z0gPM
         +Hb/qqKiBdCvr9sclVHzvcpn4l15zjTMGwkOM8peFSHkU2LmilxWrWJU2cRGnb0pu7KU
         EkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429470; x=1711034270;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JL0iEjRkP+Wzhg7yrg5gEUCCcXYJeQFMMh/fE8SWiQ=;
        b=Ex+7Qo8XtedRmZQVIj/fF3IOSl7zz0fCwBjMrDnRHbPdM4AmtaGFUC4/L4cgjv/U8E
         MOAkq+cns5BziShmC9P/IqfkqxWUbfEREa7Li+xG+luvLhwMo8O2sqEKShywe5/NkA2c
         XyyM2CIfSDsojNBarOG29J1PxQSehChljMyAaUW/kVNlczdwYjIWdeyGx+dg5zm18F0y
         g5ImumKJMq96nCkVgg5uTQ8zM+2bJdQke3+BjLU2+DVtsTATGjk8o7wHBwegTQKfDJna
         pxK4td4gfhTVSSlzfUS2E8MqUpKFihuJCbn/c9JlcoTdu7gViNM7mC63SHDCIGmKnpfq
         CiuA==
X-Forwarded-Encrypted: i=1; AJvYcCUPqJu+n/DFxVaJnrdYiFkDDhPD1z+gQPS0G6XqATr8g5w1GVFCmdpNx6xllQiJrJAz4nKgmIHeYXMEZP7yqeCRyoKReMtnCTr24OtLTyDg
X-Gm-Message-State: AOJu0YxVO9yEOX8TKtkgxFT18/1iJm+iQ6amcfxdr2Gk2MEGK474Skq/
	pS1lqNyhThrcyYlcFdTJy0iFNXz7RqnarXKX+HxyZCMqQmzhQa8g2dYR3LmoQpk=
X-Google-Smtp-Source: AGHT+IEMhsHjN9EHuuqrjhD85KwDVF/OLncdHir9Xb2P1FgONAts1jSMZ0pcHNGdzquENbjdvIjLqg==
X-Received: by 2002:a05:6a20:e107:b0:1a1:6a45:98db with SMTP id kr7-20020a056a20e10700b001a16a4598dbmr465045pzb.2.1710429470370;
        Thu, 14 Mar 2024 08:17:50 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902684500b001db608107ecsm1856324pln.167.2024.03.14.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 08:17:49 -0700 (PDT)
Date: Thu, 14 Mar 2024 08:17:49 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Mar 2024 08:17:44 PDT (-0700)
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: support SG2042
In-Reply-To: <35c348437b6e18972ccaf90d9c38040caccd1f11.1706577450.git.unicorn_wang@outlook.com>
CC: aou@eecs.berkeley.edu, chao.wei@sophgo.com, Conor Dooley <conor@kernel.org>,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, p.zabel@pengutronix.de,
  robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
  jszhang@kernel.org, unicorn_wang@outlook.com, krzysztof.kozlowski@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: unicornxw@gmail.com, inochiama@outlook.com, arnd@kernel.org
Message-ID: <mhng-3e62b204-0a40-4356-888f-060c0515c286@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_081756_203844_1E5BF6B8 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, 29 Jan 2024 17:49:45 PST (-0800), unicornxw@gmail.com wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> Add bindings for the reset generator on the SOPHGO SG2042 RISC-V SoC.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ++++++++
>  .../dt-bindings/reset/sophgo,sg2042-reset.h   | 87 +++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
>  create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h
>
> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> new file mode 100644
> index 000000000000..76e1931f0908
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/sophgo,sg2042-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 SoC Reset Controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-reset
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rstgen: reset-controller@c00 {
> +        compatible = "sophgo,sg2042-reset";
> +        reg = <0xc00 0xc>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/reset/sophgo,sg2042-reset.h b/include/dt-bindings/reset/sophgo,sg2042-reset.h
> new file mode 100644
> index 000000000000..9ab0980625c1
> --- /dev/null
> +++ b/include/dt-bindings/reset/sophgo,sg2042-reset.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_RESET_SOPHGO_SG2042_H_
> +#define __DT_BINDINGS_RESET_SOPHGO_SG2042_H_
> +
> +#define RST_MAIN_AP			0
> +#define RST_RISCV_CPU			1
> +#define RST_RISCV_LOW_SPEED_LOGIC	2
> +#define RST_RISCV_CMN			3
> +#define RST_HSDMA			4
> +#define RST_SYSDMA			5
> +#define RST_EFUSE0			6
> +#define RST_EFUSE1			7
> +#define RST_RTC				8
> +#define RST_TIMER			9
> +#define RST_WDT				10
> +#define RST_AHB_ROM0			11
> +#define RST_AHB_ROM1			12
> +#define RST_I2C0			13
> +#define RST_I2C1			14
> +#define RST_I2C2			15
> +#define RST_I2C3			16
> +#define RST_GPIO0			17
> +#define RST_GPIO1			18
> +#define RST_GPIO2			19
> +#define RST_PWM				20
> +#define RST_AXI_SRAM0			21
> +#define RST_AXI_SRAM1			22
> +#define RST_SF0				23
> +#define RST_SF1				24
> +#define RST_LPC				25
> +#define RST_ETH0			26
> +#define RST_EMMC			27
> +#define RST_SD				28
> +#define RST_UART0			29
> +#define RST_UART1			30
> +#define RST_UART2			31
> +#define RST_UART3			32
> +#define RST_SPI0			33
> +#define RST_SPI1			34
> +#define RST_DBG_I2C			35
> +#define RST_PCIE0			36
> +#define RST_PCIE1			37
> +#define RST_DDR0			38
> +#define RST_DDR1			39
> +#define RST_DDR2			40
> +#define RST_DDR3			41
> +#define RST_FAU0			42
> +#define RST_FAU1			43
> +#define RST_FAU2			44
> +#define RST_RXU0			45
> +#define RST_RXU1			46
> +#define RST_RXU2			47
> +#define RST_RXU3			48
> +#define RST_RXU4			49
> +#define RST_RXU5			50
> +#define RST_RXU6			51
> +#define RST_RXU7			52
> +#define RST_RXU8			53
> +#define RST_RXU9			54
> +#define RST_RXU10			55
> +#define RST_RXU11			56
> +#define RST_RXU12			57
> +#define RST_RXU13			58
> +#define RST_RXU14			59
> +#define RST_RXU15			60
> +#define RST_RXU16			61
> +#define RST_RXU17			62
> +#define RST_RXU18			63
> +#define RST_RXU19			64
> +#define RST_RXU20			65
> +#define RST_RXU21			66
> +#define RST_RXU22			67
> +#define RST_RXU23			68
> +#define RST_RXU24			69
> +#define RST_RXU25			70
> +#define RST_RXU26			71
> +#define RST_RXU27			72
> +#define RST_RXU28			73
> +#define RST_RXU29			74
> +#define RST_RXU30			75
> +#define RST_RXU31			76
> +
> +#endif /* __DT_BINDINGS_RESET_SOPHGO_SG2042_H_ */

This is now

Fixes: 1ce7587e507e ("riscv: dts: add reset generator for Sophgo SG2042 SoC")

which landed in Linus' tree.  Looks like that went up via Inochi and 
Arnd.  I don't have that in my for-next yet, so I'm just stashing away 
this patch for my tester.

I'm happy to pick this up if folks want, but it'll probably be cleaner 
somewhere else.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
