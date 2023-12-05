Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FDBC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E47qXviFxzieC5DKSXIUyxAfmztj3i2+XUJRVl/7lPw=; b=KffyBhZomdy3B/
	CJTZew2TOMvvsIyDNALbeDjBviwBtOWVsPj9sZbb1UCfPIS6Z69/OFXMySswNgfqjLIdIEObGRKng
	SO/As95vRxFdomvRtIE0aFSQ0J/JvlT3gBSgpfBR5viffQdWOjbkzm5VRq13ZzIiQdHZki1nSyWZZ
	ieCOG40JWMLe8eavqmspmXmYil6uJM5aHppgokxrgYXrOBwvxVcEfIe8KeANNH0u3xa14F6zkrAH5
	sBCcVuZQWtcLMtM4EClNDAmz1L59NqutrNHHtt3abYf01sXvYXKO1FIZquP2VYGNxHJhpVcbvV1lJ
	QHOlFer5bBdc27h8DoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAPOw-006SBN-0z;
	Tue, 05 Dec 2023 06:59:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAPOl-006S93-1m
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 06:59:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1c7b20f895so20342166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 22:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701759550; x=1702364350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XE6y6O/Gg2XCJxJTYDCBWYVcnKRh0Dta4ePvGTjfjos=;
        b=j33+u3cqAx1K+/00zvug7/B8mGdeDKM96D0dXdC/vtVaslSflToe8vUVbsBokNWRb2
         9mF+U+PJxaXbVjFVfF569UcxHc75KVEsMRQdWEUhAAVCGs7ZTfYfr8hZrkemezEjkKkd
         lrRBVQNLD4HC2AaDVM6UtYNVtyR74LnVdpL3bJkxj6iSA2QYpDNmcw4RnkEQ5uqTqmiH
         a+0OPWh/TaUOQH73sjni9z01/+evZeBigEYdn4dMgPkv1QLhEuj3hlVOVZpZkK6+2Wlg
         9t4fadqG/DZpgaFrCjXAwwfpSq8bRiU8LzqWORwcSZA14U3Tco5pyJfYyFY5Kyzun/xv
         GdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701759550; x=1702364350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE6y6O/Gg2XCJxJTYDCBWYVcnKRh0Dta4ePvGTjfjos=;
        b=Y/wFD1HQHglJ50G1og9ebkZQks4kvhoKOO0/f8/ELmFQjNECfIFrWLgNoqxY96GsTj
         HYhBQWnRTlx/2cOGPenF0PdvM4nr0TDWvUNQqFzUnsc9FDZmD6HCKH0sRG3bqILpC1wJ
         3w7wGPQ/FySMlxJGlUPmh8aHqCYt2IV8iNOfTpYqOR8eujbXTpvD3yi/rtsfJIXouSso
         72Cys/i7A0AyVvyCwghAJjPNa5kb5y+wRIDmfcUd85Nu2JjfseSJ/AWt6eHizO47lIH9
         EwQl/ywoJMwpLPBCeMsAaVDG7yItv7Kxsp0/qr+bL/52Nvwu06kNoVw4tMwTqRHuMr8/
         0MOQ==
X-Gm-Message-State: AOJu0Yyk1dre4mC/SFuvYhQ6i2ZKvMK9bw9+rgGCGy0i9mJkPKrtjzHm
	gW+Upvil5+Rq5OS/iPCBuZI/QA==
X-Google-Smtp-Source: AGHT+IFu17PZqO8nHtjyGiCZfhb8tozOJnm3cDoeIYUwUZBaKTHwQCRnT5k8gUwXnQGYCVqyQ69usA==
X-Received: by 2002:a17:906:109e:b0:a1a:d0f2:64fe with SMTP id u30-20020a170906109e00b00a1ad0f264femr2661168eju.101.1701759550145;
        Mon, 04 Dec 2023 22:59:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id lt12-20020a170906fa8c00b009e5e1710ae7sm6156772ejb.191.2023.12.04.22.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 22:59:09 -0800 (PST)
Message-ID: <3bfdb349-1298-4a59-a807-e72b52500b5b@linaro.org>
Date: Tue, 5 Dec 2023 07:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display
 system
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 xingyu.wu@starfivetech.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, p.zabel@pengutronix.de, shengyang.chen@starfivetech.com,
 jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com,
 maarten.lankhorst@linux.intel.com, suijingfeng@loongson.cn
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-2-keith.zhao@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231204123315.28456-2-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_225921_394156_F1777CD3 
X-CRM114-Status: GOOD (  18.41  )
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

On 04/12/2023 13:33, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> dc controller, hdmi controller,
> encoder, vout syscon.

Nothing improved here.

> 
> add the path of yaml file in MAINTAINERS

Neither here - still these are not proper sentences and wrapping is wrong.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../starfive/starfive,display-subsystem.yaml  | 104 ++++++++++++++++
>  .../starfive/starfive,dsi-encoder.yaml        |  92 ++++++++++++++
>  .../starfive/starfive,jh7110-dc8200.yaml      | 113 ++++++++++++++++++
>  .../starfive/starfive,jh7110-inno-hdmi.yaml   |  82 +++++++++++++
>  .../soc/starfive/starfive,jh7110-syscon.yaml  |   1 +
>  MAINTAINERS                                   |   7 ++
>  6 files changed, 399 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,dsi-encoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-dc8200.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/starfive/starfive,jh7110-inno-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
> new file mode 100644
> index 000000000000..d5ebdba3fb36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/starfive/starfive,display-subsystem.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/starfive/starfive,display-subsystem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive JH7110 Soc Display SubSystem
> +
> +maintainers:
> +  - Keith Zhao <keith.zhao@starfivetech.com>
> +  - ShengYang Chen <shengyang.chen@starfivetech.com>
> +
> +description:
> +  This is the bindings documentation for the JH7110 Soc Display Subsystem that

Drop "This is the bindings documentation for " because it is obvious. It
cannot be anything else.

> +  includes front-end video data capture, display controller and display
> +  interface. such as HDMI and MIPI.
> +
> +  JH7110 display pipeline have several components as below description,
> +  multi display controllers and corresponding physical interfaces.
> +  For different display scenarios, pipe0 and pipe1 maybe binding to different
> +  encoder. for example,
> +
> +  pipe0 binding to HDMI for primary display,
> +  pipe1 binding to DSI for external display.
> +
> +          +------------------------------+
> +          |                              |
> +          |                              |
> +  +----+  |   +-------------------+      |   +-------+   +------+   +------+
> +  |    +----->+  dc controller 0  +--->----->+HDMICtl| ->+ PHY  +-->+PANEL0+
> +  |AXI |  |   +-------------------+      |   +-------+   +------+   +------+
> +  |    |  |                              |
> +  |    |  |                              |
> +  |    |  |                              |
> +  |    |  |                              |
> +  |APB |  |   +-------------------+         +---------+    +------+  +-------+
> +  |    +----->+  dc controller 1  +--->---->+ dsiTx   +--->+DPHY  +->+ PANEL1+
> +  |    |  |   +-------------------+         +---------+    +------+  +-------+
> +  +----+  |                              |
> +          +------------------------------+
> +
> +
> +properties:
> +  compatible:
> +    const: starfive,display-subsystem
> +
> +  clocks:
> +    items:
> +      - description: Clock for display system noc bus.
> +      - description: Core clock for display controller.
> +      - description: Clock for axi bus to access ddr.
> +      - description: Clock for ahb bus to R/W the phy regs.
> +
> +  clock-names:
> +    items:
> +      - const: noc_bus
> +      - const: dc_core
> +      - const: axi_core
> +      - const: ahb
> +
> +  resets:
> +    items:
> +      - description: Reset for axi bus.
> +      - description: Reset for ahb bus.
> +      - description: Core reset of display controller.
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: ahb
> +      - const: core
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

NAK, you just ignored my comments. More than once in this patchset.

I stop review. You must implement entire feedback or respond to it.
Especially when ignoring feedback results in buggy code.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
