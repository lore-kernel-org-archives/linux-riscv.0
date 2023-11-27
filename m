Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72758C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kYfVci6jVGpmFqL/joYssx17tT6wG/Y/XBhLK0RYSw=; b=aWKywVcP/OQV0P
	faakTC/USM6AtQWA3kOHy/0I9LhZfPQKnqT/uI7IcrSXDEixOENAEIxbX2D5T4XXWNWnKOTkYmOQg
	E4bCuLtHQYgZjp7k3CAk+i1bAJyjk4DTHGNQSyLEt8xT06nJY4sCRtFrV8ZA2E5TTRYpqYMwuiwNw
	fXAXv1A5VSPzvdTFMT/5Ebnh9OPQjfi97lF7m8rXs8j0ZfgmH9JhDprt5FgmPNoRhikfeEJwMDYbN
	HxXjJkBAr6IRCNVIDzfGDjLiPABz6KFXbp8hXs2//xRS8KpT1wSFqenljZAYlZdH7qOMn+dZv29Q7
	fcivUK6yaOoSKxW18n2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gHG-003E0a-1I;
	Mon, 27 Nov 2023 18:24:14 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7gHD-003Dzb-11
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 18:24:12 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d81faeefc4so998823a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 10:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701109450; x=1701714250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF7BpdESHg7ukGeVphyj0w+Q03SJQZ4KYg2HXNSbNFU=;
        b=AltRU8Z+NEmRdzglGSjkol068HD0rIV05YltP56TvAuCjZq0QNEEjjnvGl1GolTNLp
         FzGDdGC3IQcRMm+AoLc75adB6MqoFMrwxGTsvarm2wQnScI7kt8okbh6wN4mnRY5+sjJ
         0F1HMf++kf4I1DOKKRIHf8UDei2gQIsSu3exdW+W3SPXzBv2lbil9LotpuVhhXRRrJzZ
         fnjRDJWF6cULzlP4rRgFEcyWU1QSbhS0tb29IGpShtgTAcAvQLeiIqZ5/wq49ghCQTkB
         Em1qpUfIGbuOb+rjtYRofgQ+yz94nIS3yYNBhZrzR98kSkH+xZO/IXso7IQ51Z1gls13
         Wc6A==
X-Gm-Message-State: AOJu0YyGpS3SooWzx3pzmBr048LJFHpiMSZkffegNonz1DeAQT90YQrB
	txjZh8s54w75iwHY3OnOng==
X-Google-Smtp-Source: AGHT+IGZ1FUvDOFdx14sqdb4Qh4hz/OmI5KEpI0XR0i001qZqV3VfcIpq4j9OGYlfjltBcQdBbZFUA==
X-Received: by 2002:a05:6830:1e39:b0:6d3:a8b:b34 with SMTP id t25-20020a0568301e3900b006d30a8b0b34mr14340070otr.5.1701109450110;
        Mon, 27 Nov 2023 10:24:10 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v10-20020a056830140a00b006d834fd3399sm128109otp.59.2023.11.27.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 10:24:09 -0800 (PST)
Received: (nullmailer pid 2141620 invoked by uid 1000);
	Mon, 27 Nov 2023 18:24:08 -0000
Date: Mon, 27 Nov 2023 12:24:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add sophgo,efuses
Message-ID: <20231127182408.GA2131525-robh@kernel.org>
References: <20231119131332.999-1-jszhang@kernel.org>
 <20231119131332.999-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231119131332.999-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_102411_373510_67E3A58E 
X-CRM114-Status: GOOD (  14.94  )
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

On Sun, Nov 19, 2023 at 09:13:31PM +0800, Jisheng Zhang wrote:
> Sophgo SoCs such as CV1800B come with eFuses used to store
> factory-programmed data such as calibration settings for the built-in
> ethernet PHY.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/nvmem/sophgo,efuse.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> new file mode 100644
> index 000000000000..e4ae81a1742a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SoC eFuse-based NVMEM
> +
> +description: |
> +  Sophgo SoCs such as the CV1800B contain factory-programmed eFuses used to e.g. store
> +  calibration data for the built-in ethernet PHY.
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#

Why does a new binding need to use the deprecated form?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
