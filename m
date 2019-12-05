Return-Path: <SRS0=wiyu=Z3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2C2C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 17:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785D324651
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 17:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAydnpxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785D324651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Beu9Ho0H5ERuGsbF7ZjrVG0ZON0A+E7tAAYEYAdqCyk=; b=HAydnpxMYfr/PErege4si1J49
	fh3no4zuuF1bT/cHcC7mLyivXiPXy4eQbdA/LEbDqToU5iXVmRwwwtaAGJSGSrHuIvtvECVdX5S1n
	Qy6xN55srib5wr0iYlG182nWoy+xn+3vFwrx7rlkKlnPL+gmOEaTU/xJbGDJ8Y8UVedq3H1rLk6r3
	Wi9CB4ZZiHucJ+6Bai4JA61DN/sXpIQqric7CcoK7i+YhzAvN2JVph7V4FuQEEcmzzFpdvTy5QSgc
	t/uSoq6xdrUjnb0VBvnCPGwkZtKpbHhcK0undPk1pvefUKDe2KrWUwHV2+OLi8h08PzdXeutneNs/
	bUQR9cb5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icuui-0005S5-Tj; Thu, 05 Dec 2019 17:27:40 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icuuf-0005RJ-Gs
 for linux-riscv@lists.infradead.org; Thu, 05 Dec 2019 17:27:39 +0000
Received: by mail-ot1-f68.google.com with SMTP id a15so3328440otf.1
 for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2019 09:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Beu9Ho0H5ERuGsbF7ZjrVG0ZON0A+E7tAAYEYAdqCyk=;
 b=AwvM98JhalpYyvaONeMh+i8+G1xqZroBMIyKdA6e2Zozca3zLyf2shhosImMGfRry9
 +vZjwkqYCi7gbyNoR/Dd6tEuIeqAY5ziziCbdK6h3WwVp5soRAJJ4oMTt87UozfvMAnW
 YDeHeERl5qnVKlpYwplrEK07KGWlRiyxV3Cs4xWqnxgD+aUq0Lcl/eehVa6DQuVZYhWx
 67iFVG6RJkuOHWlAdVHQZX2W+/ovpXOz6FE1wKe+lhzjvWth0Yvj+E9ZEsHP4MsuVdM3
 KFMQRmH4ngmNogu8MEY9hMk4sCphi1wTHLHy/slOaF9yYgf2HPDr8MwZ61PZaHSaXtK7
 R9cg==
X-Gm-Message-State: APjAAAWVs3ke8BHb/ky2qQKmYU3RzngXJA9xVM5FItVvIdZGQgKqEiG7
 44xyW+8Cc2GU7mLHL6LCdw==
X-Google-Smtp-Source: APXvYqxb1R7cDem9EDJctkKteK+d2GKVLOTXRE+1a0UnGmCMVMgu/gG/KmmksWOK1FE9rpvhpmjXHA==
X-Received: by 2002:a05:6830:1e61:: with SMTP id
 m1mr7623640otr.68.1575566856033; 
 Thu, 05 Dec 2019 09:27:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n25sm3724656oic.6.2019.12.05.09.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 09:27:35 -0800 (PST)
Date: Thu, 5 Dec 2019 11:27:34 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
Message-ID: <20191205172734.GA18142@bogus>
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com>
 <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_092737_558537_2886BA30 
X-CRM114-Status: GOOD (  14.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "atish.patra@wdc.com" <atish.patra@wdc.com>, "maz@kernel.org" <maz@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sachin Ghadi <sachin.ghadi@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2019 at 05:58:03AM +0000, Yash Shah wrote:
> DT json-schema for GPIO controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/gpio/gpio-sifive.yaml      | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml b/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml
> new file mode 100644
> index 0000000..49214bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-sifive.yaml

sifive,gpio.yaml would be the more standard naming.

> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings: (GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-sifive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive GPIO controller
> +
> +maintainers:
> +  - Yash Shah <yash.shah@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-gpio
> +      - const: sifive,gpio0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      interrupt mapping one per GPIO. Maximum 16 GPIOs.

What's the minimum? If not 16, you need 'minItems'.

> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names: true

Need to define the strings. Or drop because you don't need it when 
there's only 1.

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - clocks
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/sifive-fu540-prci.h>
> +      gpio@10060000 {
> +        compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
> +        interrupt-parent = <&plic>;
> +        interrupts = <7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22>;
> +        reg = <0x0 0x10060000 0x0 0x1000>;
> +        clocks = <&tlclk PRCI_CLK_TLCLK>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +      };
> +
> +...
> -- 
> 2.7.4
> 

