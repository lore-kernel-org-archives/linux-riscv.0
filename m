Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4674DEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VR6yG3BvFfNNkRgjjSY0lJ+i0fd+HYH2v7dwmw0LP2U=; b=oK8zUlGw3W21Q7
	6cLBzThTfTnmv4r5q9yNHfw8tSkSdcwV235gkZ6PDv3eFk2pQ3vmY6ER+BmVgVP4/rSstyWUTZx4h
	oUzgSOhK3XKLbTt593RRg8pvVig5QBFT1r9za8wCE1JxiV3pGa4ZHtwQyLDIVenLYN4QpK0gw0efl
	nIrSIyX/Cvm8CjfkvBXmmQiWpya/Fph13clZoonpog9oqtmVDMtP0UYiv3FtTDo0GH/QAhHKxzV+O
	y1FVO+qSS/3k+F1Pa8XWkxG1xLEcCsvRqeXtFCNwRo+h/gUurPVtNQ2DsZGL8cvgNxujd2UiZiTvl
	uFN/Q/O9evgZSR7f+eAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q98no-008r41-10;
	Tue, 13 Jun 2023 18:31:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q98nj-008r32-0g
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 18:31:34 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51874324c2aso1576232a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681090; x=1689273090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5thdLVYeuJeTUk/dZICHlBR7keQEdx+TmjFnb0n07Q=;
        b=TGJMmaL1gE5Q2ei5/JJbiK4nLEnwa8oW9QXxz2BtKtJe+JioR6sSCUhdBozJ6zylJ3
         iwQ/0wMMmDEDklaueG8Pe2vQSHAcDVP6MxpSteYwajWkXPOJm3JnXYTqc+YggiW1238e
         8pp63h2Gfp+PViIeO+i5PfrY5JjAEMDR/snslhBXQx8DNO3MeSJkZPTiPAFY7tlLuTnH
         O01yt8Y9AnVSQ28TRHw6mnvCuLJTlhJ29cb4+8tnxZQCxWCPd/gCEgMfd34nUUFbNPnH
         MWi3T1RwtYZG+PgT4m3U2PAiw5TQK0/PYgXOWRzUPIh6TdX/eTqo+6iuch9OvF3xxQnn
         jG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681090; x=1689273090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5thdLVYeuJeTUk/dZICHlBR7keQEdx+TmjFnb0n07Q=;
        b=QctqrJquGgpvmOs2BrYSYEePQaAIYdCfdyIHagGVXm8YkFMBr135SG6oT38Z89NlA7
         t5tXEVDvihM/uxGrb5wS/JDsAcm9YzveOEgG1XYfcKt1s4vhHpJLqvtKua1do8/TNL2+
         KDP68dkpm7YFNM+korV0mHF8crfRC3wXN/XLbJl4jkkkmUa41dcUL8PMCLzR1S2Wr4ls
         z2pXclR/G5VAyPD0rrm17jfpyzqIpzfuQVjubhoyyITAJFP52M8t5BPYrBBFTaRS3DzY
         9OuTKLdOX/StjgJetpuipaNp+/Xz0onXjoRvC6CKp6kvEF9ObYUDQcJf9KoIHomFMJPH
         /UXw==
X-Gm-Message-State: AC+VfDyZrzFC7UBAmmBTkFQXo4GlqiiO+3ZYJ+w/l1O8/qBAbsLzP7D+
	0F6Wsd0ZK7uVnNYSQs59dh5Iuw==
X-Google-Smtp-Source: ACHHUZ7FW4zcNCHYDLc8YmIToBwJQq9MRqn3NydANM5LTgdwq836BPniBmMoR6EXg/p91D8iAKdAqw==
X-Received: by 2002:a17:907:3fa4:b0:977:da9d:b842 with SMTP id hr36-20020a1709073fa400b00977da9db842mr13680418ejc.74.1686681089686;
        Tue, 13 Jun 2023 11:31:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b00977e0bcff1esm7071095ejb.10.2023.06.13.11.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:31:29 -0700 (PDT)
Message-ID: <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
Date: Tue, 13 Jun 2023 20:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613125852.211636-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_113131_273469_651E361D 
X-CRM114-Status: GOOD (  17.67  )
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

On 13/06/2023 14:58, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..a81190f8a54d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"

Where did you implement the results of the discussion that only some
devices can have power and clock controller?

According to your code all of above - sys, aon and stg - have clock and
power controllers. If not, then the code is not correct, so please do
not respond with what is where (like you did last time) but actually
implement what you say.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
