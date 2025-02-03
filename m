Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5244CC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 20:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdIaqYLZrfzXgAz+ZqFmxfRA1D+++yfoA4I0S2+jgho=; b=PwfZD/VAHQ8mKY
	CyrNovZUVIjYnjOXCB4+mST8iG/cPESkUh359nBBjyoqY11lgRfVHR/NfCaijkfoSzfzs0PrJi0AH
	/QteUo4cmwHLKpd4ut1NVjNqakz0sicNhkXoEEUR2zxdzAXrxM75ZHXRWTttwoGVNQyO1c+pFY2/G
	kPy+UmddSQ9qWGMTawJhJtQPZy1flGWuqEGG44lwkZLlotQnIKXaflwsV461gkBHGemTxSEUDRMpr
	Q6zwbRzTwCLnTdymZ92yVWMYrmHaG+cGRp2khN85TRlmHDoXNu5AFWjbDcJY6pIOMI8sVpQXwSlzl
	NG4ctt1RPSUTuzAW0pLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf306-0000000GWqG-2hLj;
	Mon, 03 Feb 2025 20:24:58 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf303-0000000GWpr-42tM
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 20:24:57 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-84cdacbc373so124665039f.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 12:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738614295; x=1739219095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9JFObA4COff1XvgL6pyI7Lgpee7/4aC4TK3AK7tuo=;
        b=Sb9x95HYgatIO69VyEqH/dtghDtc2iATvZBcaiyEGIrBz8BBhupvlNwAoDP7+uV55d
         OuZ1VpNH0e5UG/FtP7CZ1mAFs/Fd/c11re63tZeMafVDlttZ1lFnRpKvu+ieTZpNNP4p
         RS14jwX6vuCxB+B+7yyJ2WKKht1Wfj4nOvlCH2zQok85MqQ2R6OI1isZitp/+xdFM4gL
         ZPvwqO0vjUTYHK3g9RzHScrv2/3jnvGdiuyig82vSp8a85rTOLizyrF4JGSMHKVAHLUH
         9aecRJk4IcLlRFFYgbJvDG4lAzXy7iPYpqS0XqptioWqy7ZWVfJTRm0SGnr21hkiu4rS
         w2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614295; x=1739219095;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9JFObA4COff1XvgL6pyI7Lgpee7/4aC4TK3AK7tuo=;
        b=i8eC8v/zEnKv8xYQl7qEsrtkgQ8zmwLXnbQ/7rePllCNlGGJ1WnUwpoA6BqcjI3DAb
         /HaGXZ9HNB5WrWJF90WML6SGqj/L+8IDFC0lnkdXrRpxG2HiEBIDeLenB/X26wGLa4kP
         /UVRdb7ghHPnMIKiqkA/48NlTCCXIZycU87H7J3OlqiQDh4T7uoj+MsI/MkPlq964vO0
         ZGUCnelH8kCmqEEBt8CiEUX8TQorQiFJZCPIhVvBTbn1s6fwa7/OQPJdGQ+/Olk2u2MI
         nSRxpjtWUVQrq1U5oYuGNuQItQvQ8roB4TbR7FJbM0nMMzCOmiOsERepLNAtXp5RbOZh
         8hjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+HMqzmVdQBqWjpfPESiGOb9vGU05O4nYLnmNaxEQ+c6x37pXf5ieWxJCzyjI+Lfwv5hS+kjfJ789EBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFTl0A/kPiHeLZ+MkJgQ9kIpHMbZZbCyFEBVQawi6BZCBckqp+
	KkMoVnoVw7BtnMuCumF9359dc66UEVSlvxwL3lFtHI8bWEtwPMwj7E49bftNHCo=
X-Gm-Gg: ASbGncvlDei45spqr1gGBTaXoTwDcId3OCh83oTNOJHabwCF7Rsy/1t3U65LFTq0O+v
	tqGs5cF50ep9UFxUus7NQstoKRNdoVcFfAn73s6zUDP5w0I093SWT02n6i+xrflC6XeS2xDl4QO
	8bSGKJT9htEnqwmKWnzQ3bjTSHm2PxpuctvME3GenyhOtdk+lTc+pMt9MpklnE/B/AO0iEk/y9S
	HQPy8Rp4ccU5bCpZ+D8lECg++fN21l/BWKhaUmTU/agqqvRQU3iXLckrkFTDbe5LwJQ+LybNFE5
	snyOh4+jz9VsO2VISxjLYZDThrGVfMmdJUWIcOI=
X-Google-Smtp-Source: AGHT+IHEJGxfKm/XxR5HOi6egCzTPsETR1qnlZiOaKKIny+VHepRdiI6w/LjA3M3OvHKbwmvA+nh+Q==
X-Received: by 2002:a05:6602:3f0b:b0:84a:5201:570b with SMTP id ca18e2360f4ac-854006dfe26mr2249929239f.0.1738614294882;
        Mon, 03 Feb 2025 12:24:54 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ef58sm2399719173.5.2025.02.03.12.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 12:24:54 -0800 (PST)
Message-ID: <237ce4e3-d66f-43ee-bd4e-38007dc750e5@sifive.com>
Date: Mon, 3 Feb 2025 14:24:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: clock: Add bindings for Canaan
 K230 clock controller
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
 <20250203-b4-k230-clk-v3-1-362c79124572@zohomail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250203-b4-k230-clk-v3-1-362c79124572@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_122456_037050_B69BCE86 
X-CRM114-Status: GOOD (  17.07  )
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

On 2025-02-03 8:49 AM, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 43 +++++++++++++++++++
>  include/dt-bindings/clock/canaan,k230-clk.h        | 49 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.

From the way the driver is structured, this looks rather like two separate
hardware blocks, not two groups of registers for a single hardware block. For
example, the driver registers two clock providers for the same DT node, with
overlapping indexes. This doesn't work. Either you need two separate DT nodes --
one for the PLLs and another for the sysclks -- or you need to include the PLLs
in the binding header below at non-overlapping indexes.

Regards,
Samuel

> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>,
> +              <0x91100000 0x1000>;
> +        clocks = <&osc24m>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..47d966fda5771615dad8ade64eeec42a9b27696e
> --- /dev/null
> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef CLOCK_K230_CLK_H
> +#define CLOCK_K230_CLK_H
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
> +#define K230_CPU0_SRC			0
> +#define K230_CPU0_ACLK			1
> +#define K230_CPU0_PLIC			2
> +#define K230_CPU0_NOC_DDRCP4		3
> +#define K230_CPU0_PCLK			4
> +#define K230_PMU_PCLK			5
> +#define K230_HS_HCLK_HIGH_SRC		6
> +#define K230_HS_HCLK_HIGH_GATE		7
> +#define K230_HS_HCLK_SRC		8
> +#define K230_HS_SD0_HS_AHB_GAT		9
> +#define K230_HS_SD1_HS_AHB_GAT		10
> +#define K230_HS_SSI1_HS_AHB_GA		11
> +#define K230_HS_SSI2_HS_AHB_GA		12
> +#define K230_HS_USB0_HS_AHB_GA		13
> +#define K230_HS_USB1_HS_AHB_GA		14
> +#define K230_HS_SSI0_AXI15		15
> +#define K230_HS_SSI1			16
> +#define K230_HS_SSI2			17
> +#define K230_HS_QSPI_AXI_SRC		18
> +#define K230_HS_SSI1_ACLK_GATE		19
> +#define K230_HS_SSI2_ACLK_GATE		20
> +#define K230_HS_SD_CARD_SRC		21
> +#define K230_HS_SD0_CARD_TX		22
> +#define K230_HS_SD1_CARD_TX		23
> +#define K230_HS_SD_AXI_SRC		24
> +#define K230_HS_SD0_AXI_GATE		25
> +#define K230_HS_SD1_AXI_GATE		26
> +#define K230_HS_SD0_BASE_GATE		27
> +#define K230_HS_SD1_BASE_GATE		28
> +#define K230_HS_OSPI_SRC		29
> +#define K230_HS_USB_REF_50M		30
> +#define K230_HS_SD_TIMER_SRC		31
> +#define K230_HS_SD0_TIMER_GATE		32
> +#define K230_HS_SD1_TIMER_GATE		33
> +#define K230_HS_USB0_REFERENCE		34
> +#define K230_HS_USB1_REFERENCE		35
> +
> +#endif /* CLOCK_K230_CLK_H */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
