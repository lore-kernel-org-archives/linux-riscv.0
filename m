Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F399EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xrU8GOmwkjnmdGffZTzsnCpskJbk1K/dcA9ZgEEyj4=; b=YfsZo0BylgmfHY
	tIbMUe4ZCcEizXeulowzlk4IJX0i6mRQQUClCULcoAJ1s86eZotyXSuBvukpyqLHdTabfLkt445pP
	dG4H2aH9UUpn8eJtke2g047R5o1+so9iF9J0ecCTWheIPhFrYQ0fHO/c+0qxq0trpjpA1aIiKubf5
	kxFv/M/l6WFsHYXeiRPLrfHaBcFRQRNZJoWkm5EmEkCUxsxuLazW2pfwZhr/D7+pCkxvAT1uag7GI
	N+DnQxROe5kGgRnKEVoMfDqsVIR9lS9e4dBakepELPAOjH82I7XvUXVFNEPdErAz13QLnLCcWzNHu
	UTYNQrImsTK32wBCKikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4no-006ni5-0O;
	Wed, 19 Jul 2023 10:53:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4nl-006nf4-1s
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 10:53:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5217bb5ae05so5779512a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689763979; x=1692355979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSY7y/1+6yYaMus6riUbfDhWCuuda/0kYuX0FoEcddU=;
        b=tg85zqDx6jj/Z3CoCLI5djTDjzQF9aAMa3YgvXDnU0pyHXw7rcuzBpIwA8yBdLN9sY
         Ph7R3+uuSvOImNSnY1NHoDAUTAI9eZIAa8K89C7emG9iKk/bPn/lnYIzYHtztZG4BHUZ
         82KSkhPwiqrlrW4m8Za04gw0wk89u/ON6TvOn1LTgo/vBT5OqPfteSB6j2KYSKFlB1gQ
         21T9jvMOgpYSRS+qKZSd7HgIOJPfBrPq2TJB8YnexUYD+Oy4n0kWA2RUqxWv+mk7OLZh
         cqV1ZhU0aoD1jPlxkUUCDZb00zf7OU9fnId5WENJqms4je4A/wNIjwLwJm/K8xh03b9i
         JOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689763979; x=1692355979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSY7y/1+6yYaMus6riUbfDhWCuuda/0kYuX0FoEcddU=;
        b=OmlMm+TfJCOcx2bsF4x3Iv5fKtXPRwsRIVIBsyGt0w7RN5hZTKWpW3WQoP6sQRZjcA
         OgXDsi+kfHL6BTk0zx1cEfodQSRkvP8n34d27GD9doB+GihEdFYDr/sHoIXmrOg6uX7M
         U+k8c5b73FAfZkD4yuSTBRqK6S1Oey5Kzym+IsTvhgaKa2xdvQ0SFXVFqyyieTaZBVep
         aqPXKeUIDXOdDktRXo015JtZMVep8JWCr+u7PxLaznoCi5OyUmS61wvRDrkr7ebl0IEc
         FmvXjYajbbFMnFTc62v/XZTmGI/n+074p8ZbUzixOwc7OQYeTII4khE0JZ9+lzn0WVfj
         hAdA==
X-Gm-Message-State: ABy/qLZzBaA6OpgmChGSlWO7MtJt38E0nSi4EyOtpTNz9O4UdKkbud27
	vjUlKCU1tekLK7NjxqeMkkxD4w==
X-Google-Smtp-Source: APBJJlEqIKUOT6GxeKOCN3apXOlhXrfPpHxzoJyFUMl+xVLbqY0+PPhlyCxzpRR+/9kMh+ghLV4jQg==
X-Received: by 2002:aa7:cfd8:0:b0:51d:e30b:f33a with SMTP id r24-20020aa7cfd8000000b0051de30bf33amr2089692edy.34.1689763978715;
        Wed, 19 Jul 2023 03:52:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7da12000000b0051d9de03516sm2570472eds.52.2023.07.19.03.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:52:58 -0700 (PDT)
Message-ID: <c1dea7c8-2bc4-a113-0d40-098228fe3860@linaro.org>
Date: Wed, 19 Jul 2023 12:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/9] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-2-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102057.22329-2-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_035301_700545_5D3ADE19 
X-CRM114-Status: GOOD (  16.19  )
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

On 19/07/2023 12:20, Minda Chen wrote:
> Add PLDA XpressRICH PCIe host common properties dt-binding doc.
> Microchip PolarFire PCIe host using PLDA IP.
> Extract properties from Microchip PolarFire PCIe host.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pci/plda,xpressrich-pcie-common.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml

How is it related with existing plda,xpressrich3-axi?

> 
> diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml
> new file mode 100644
> index 000000000000..3627a846c5d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PLDA XpressRICH PCIe host common properties
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +description:
> +  Generic PLDA XpressRICH PCIe host common properties.
> +
> +select: false

This should not be needed.

> +
> +properties:
> +  reg:
> +    description:
> +      At least host IP register set and configuration space are

"At least" does not fit here since you do not allow anything else.

> +      required for normal controller work.
> +    maxItems: 2
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: cfg
> +          - const: apb
> +      - items:
> +          - const: host
> +          - const: cfg

Maybe keep similar order, so cfg followed by host?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
