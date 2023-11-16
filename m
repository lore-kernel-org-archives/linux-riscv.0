Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A7BC197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKsQ6gXagNYvTAiiTJ5yOh/IcDWY2I3TNG7Msd/TiEg=; b=P+Jg+KJpTUkY7l
	YZHjZMj6pwHNB7uVqdtUMwYd3feVPOFlcVu3MR3Vw4WbEM4iyliYi1v6ye79XFilFv1eZU9rKC0xX
	Po4UABPhUrHghWFaPrtGRSPUN3qDuCIN0FGEQqx1vKFGfmozyNx0LVuhxOvv6ZPws7y3tMGA1nfao
	AyhqLmzH9sxP7x38kzed6Wi7Lo7RmYMWg8QQuIFNjaRCcRVcKGvyJta+mQqDv6yp0ixqsNTtK+dZ0
	ChqBtVusMp0f8XDmjAxpeH3yOQZ+Bu/AR8t8suBdqCRQkES8NDIEKu7gV/eIHvkG3jMGdU7ccPmCE
	TPteXkqsQ5R2dy+/2+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3fLd-003zRL-2m;
	Thu, 16 Nov 2023 16:36:09 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3fLb-003zQR-0R
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 16:36:08 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1f066fc2a28so510041fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 08:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700152566; x=1700757366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5Wjrv89VUF6VK+5eLlsl+F92OjgJxoSWW7Pt0LnUc0=;
        b=BYLWl7LKLyYt80AJPQ7Lr2an45ErzvwhLJWnl94Km/O70p+TV7/3pSA0YYwQwpKe+b
         5Bvi7dGcIlme1Kke4CwJOBhXYeu40DvZNYDKQKEch2xKGr2Iebg7IH1C4vjXSBllDZ0c
         mChVUS2DkQecVfMjvjQp/QgOj8nkD1CJvyoefqSTf1GSXMPh9YNPbL2Uv71SL7fTSz2J
         IkQAJ6M1gl/fJT+Lj/5kpI5xPEIdLcQdcJCGdr99S7FoymYYBykJu8OAKQO9DCwdUyvX
         UQTiYxhby8Dk6uSsw/43Xae5sBtxIa+z7lH2cdtoI76nw2ELtZbns/EYyMCf5NDgNdH/
         urDQ==
X-Gm-Message-State: AOJu0YymDYzcPjSNsiw/wLZGW9pccmE0AAA8YQ7QQFWpDbpWmq9oLgdL
	1216w3t/jeZqP8ttYmPs4w==
X-Google-Smtp-Source: AGHT+IF3gy4IUmEGMCjjYmdSclHOPslU2XoqVhRBKPtIzVctlJ4JUPqPVYgJKXB/qDqsNymCUQ1jaQ==
X-Received: by 2002:a05:6871:a302:b0:1f4:a122:6b02 with SMTP id vx2-20020a056871a30200b001f4a1226b02mr17782043oab.45.1700152563863;
        Thu, 16 Nov 2023 08:36:03 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ec21-20020a0568708c1500b001e5ad4b2f65sm2216550oab.19.2023.11.16.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:36:03 -0800 (PST)
Received: (nullmailer pid 2446073 invoked by uid 1000);
	Thu, 16 Nov 2023 16:36:02 -0000
Date: Thu, 16 Nov 2023 10:36:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Message-ID: <20231116163602.GA2440245-robh@kernel.org>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113005702.2467-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_083607_171796_69F1FA35 
X-CRM114-Status: GOOD (  19.74  )
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

On Mon, Nov 13, 2023 at 08:57:01AM +0800, Jisheng Zhang wrote:
> Add the reset device tree node to cv1800b SoC reusing the
> pinctrl-single driver.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> new file mode 100644
> index 000000000000..ed78b6fb3142
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Please match the licensing of the file(s) that include this. Not that 
there really anything 

> +/*
> + * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
> + *
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +
> +#define MUX_M0		0
> +#define MUX_M1		1
> +#define MUX_M2		2
> +#define MUX_M3		3
> +#define MUX_M4		4
> +#define MUX_M5		5
> +#define MUX_M6		6
> +#define MUX_M7		7

I find defines with the number in the name to be somewhat pointless.

> +
> +#endif
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index e04df04a91c0..7a44d8e8672b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
>  
> +#include "cv-pinctrl.h"
> +
>  / {
>  	compatible = "sophgo,cv1800b";
>  	#address-cells = <1>;
> @@ -55,6 +57,14 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		pinctrl0: pinctrl@3001000 {
> +			compatible = "pinctrl-single";
> +			reg = <0x3001000 0x130>;
> +			#pinctrl-cells = <1>;
> +			pinctrl-single,register-width = <32>;
> +			pinctrl-single,function-mask = <0x00000007>;
> +		};

Even more pointless is the defines are not even used.

> +
>  		rst: reset-controller@3003000 {
>  			compatible = "sophgo,cv1800b-reset";
>  			reg = <0x03003000 0x1000>;
> -- 
> 2.42.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
