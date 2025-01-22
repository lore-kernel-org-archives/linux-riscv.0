Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3914FC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+xt9wbQuo3Lmd5a77wXmi6SPTMmuSE69adUuPN865Q=; b=A+J5W0fxURkf55
	e298B81kdxQ64EuZcvdTlkuHLS6PtVzncvgWTeBSsosTBrHhR4vPJd/k4wImcxf3VtsERlp+pSYSU
	PNIIsuUHA6XeQBuI1TGMmwdk3RkD8Lxh++MihFXzk+nbUQJkzn2zTxiyEjoWQtrSgWZysc7fYLIiX
	NReLIAwS7aOelsEoFXXAv+7xijqQ2fvP6zHhAc3d5s5fn6CL9Z0HMF4B2UBpx0W+CdIR+OgBywPtU
	Y1fpmsx9abpzMPgk0ZLpGuMFcTpMDkzzTslU/zBnYmDd5C8xhL/4Ub3cF4MuYzI3eSzy2V/SG+JqN
	z2my3jGXfsegczslOktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tagzo-0000000B8Nq-15nw;
	Wed, 22 Jan 2025 20:06:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tagxA-0000000B7yI-0Ed9
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 20:03:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216728b1836so1431975ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 12:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1737576235; x=1738181035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1bgavdzA6vjKZxygqub9VCVMgsHYIiDDbEG48FTIeM=;
        b=0nz+zF6mp8M7xchQzGTKzHolj4AiF9LNWq+OfkaSyP8hbV7W+CcwBeV4EbBpWw6png
         7b9p+bXyJ3FM4897gF4ewlyuS/I77Pts7Od5QrtFs7VM10JA3S8f/hUSjIu9Yw472edc
         qvZbsza380Rv9p66DOfsSPziG9lq0oZM8LFtGX7SaR2Af/ytfn1paF2gaBkGor+7B4XV
         +LbRhfvpCsBB3LJsoGd275Et9y4urHlLRr5qMBC0cNM0gIyLjrNpwP5VnIgyZvuQv9ew
         cEVcSaLl4MwcljK9gK+K/GyMXKFtS3dcy87ten/6ToCIflhI9EKgEEHmAEHCtFZyi0vl
         nRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737576235; x=1738181035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1bgavdzA6vjKZxygqub9VCVMgsHYIiDDbEG48FTIeM=;
        b=wSajq2quaYm78BvVhj+UAR6xXiMlcpSOsRqL8OaMr2KOUitLln6oa2rk3jVX45w6pn
         IeEoJLUD0NUOxsBSH/dTo3/C0kl8iodJXoQ/r8DlHHXFkFSdb2wFK18ud6UwQPmt5ARR
         Nku41+55k8SLSqg0qppJ8c2eWjqA6+xwZo0LXNTvjEMvBSxN7/9H9H1kLnogjtuiPBGW
         6NgMBJ1rRTAjNSt5/EyDxamXio2GpR+WkshZO2xDGCLIaygo8SIgzAqbMQ3hm4dzpCPN
         7+BA0WmcAtlSZL7A/0IN+umFbvVOsDIimzTXrCxmvB/y1HEDnvqBY0l99ZlKZmzkf33j
         WuCw==
X-Forwarded-Encrypted: i=1; AJvYcCVMijCcb7YaMTu5aN5YUP6zEohT7lDD3p446klvao8+icdTS9hsbBq+rvMWNgTcGJ4SHnNLUFsdOnCzkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqIXpOw6SJGtnmwLHAeFwHdpKGGi/H5uUPAKseMBS0FM3ZBH6d
	l/xeYDCmmBYHqBrWWnezAozzdThOBMQfANB4ZCXq/xMDhuyhvOie1ht+fnvxqAY=
X-Gm-Gg: ASbGncvZOqz0V+buCPyHr4MiatnHj3nJ1g5/pKMttc8mTuit43JsYYvlb7iDYBLs8b7
	wtZ+4CA7QF6ppThfg1kazUxi7DoJXmk/CCjU8mFpl27ScQ0SrEFJejdzPCOaGq/+MtNYc7svK5z
	ffmmohF0V1NyYeq0JeR8ULx7c5oJs5Ofuq2nYsesMljZ4L3N4ROdLcEst3R9c/sxqv6mkz0OFdZ
	7uoG+1If8yS/xqsB7Jt+1jVCTbOOpkawA/pkiZpQlw1dR0POzNZi4OkmEqAswAKCTcLPBIloey6
	9S7WMKW4SmlaRuJtjNoaqPzpMjisHWLztiQ=
X-Google-Smtp-Source: AGHT+IGYQoN/4V8moHcEtxB7o+Ard05IbWUKGDVqlmDureSsrLAV5hr6LIlCLWp033igRwLyKLj1LA==
X-Received: by 2002:a05:6a21:3388:b0:1e1:a8b7:b45d with SMTP id adf61e73a8af0-1eb2145ffc2mr35115554637.4.1737576234673;
        Wed, 22 Jan 2025 12:03:54 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc322a55sm11089789a12.27.2025.01.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 12:03:54 -0800 (PST)
Date: Wed, 22 Jan 2025 12:03:48 -0800
From: Olof Johansson <olof@lixom.net>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_120356_315868_079B2265 
X-CRM114-Status: GOOD (  24.75  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jan 21, 2025 at 11:38:11AM +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO ports, each consisting of 32 pins.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd9459061aecfcba84e6a3c5052fbcddf6c61150
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set of port controlling 32 pins.  A single
> +  interrupt line is shared for all of the pins by the controller.
> +  Each port will be represented as child nodes with the generic
> +  GPIO-controller properties in this bindings file.

There's only one interrupt line for all ports, but you have a binding that
duplicates them for every set of ports. That seems overly complicated,
doesn't it? They'd all bind the same handler, so there's no benefit in
providing the flexibility,.

> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio-port@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: spacemit,k1-gpio-port
> +
> +      reg:
> +        maxItems: 1
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges: true
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +        description:
> +          The first cell is the GPIO number, the second should specify interrupt
> +          flag. The controller does not support level interrupts, so flags of
> +          IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> +          Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.

Same here, since there's no real flexibility between the banks, it might
make sense to consider a 3-cell GPIO specifier instead, and having
the first cell indicate bank. I could see this argument go in either
direction, but I'm not sure I understand why to provide a gpio-controller
per bank.

Comparing to say Rockchip, where each bank has a separate interrupt line
-- so there the granularity makes sense.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
