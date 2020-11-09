Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72767C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6AFF206CB
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 21:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVUd7CIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6AFF206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lP3SkUCZQLBHmlZHSVYi7dfEWNceLdSInLXObKEAhTQ=; b=fVUd7CIeCBVvV91ZtXCpRvXQQ
	vcBH2iiJTGfgxlJvDAsFOlzVYTQVX0d4kRIWNMUWl8C/CHu7HftxsrihYvZHftPGMCXkbOBfKTS7A
	8JajtjECpQicktJBs3VWpUUzMysMM/z6l3VI17S29LrMyqlRCNB8R7ZZpldzG4m/62fl5Yra+8LVU
	rUx/54kS6bLdXz9on+acqLV892QZeOD7YiZy7KjIKaikQ1M3vXtKSflOSoDby+iWpxjAuEgsY7GkI
	/U2Dr/0QA6WeO3LpePOWTtwCQ7mPHzgLBNUJXyOOkKAxpeUkXhpetWCXHAAf+4C7KA88eD4ai73KM
	oJVtIA+Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFBA-00050h-DG; Mon, 09 Nov 2020 21:58:24 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFB7-00050K-FQ
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 21:58:22 +0000
Received: by mail-oo1-f67.google.com with SMTP id l20so2592952oot.3
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 13:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rprblfe+luJ0hSeeUEc97b4ulGTxy/C3pizbTWGIRPY=;
 b=raP8vtQk/mZ/mwZ5yOWOZ6sCHkWuBHx01Gqff99Z31nPCtxVSthVTPYwvIAPa8t6+J
 QBiwWtHqx//GEMRYptSPogw3RkSphf0dq/zUnmvOByQzRdZCQ1TxeWFgRD5pnNVyWqms
 9PKb/+zx2cZbsWiA0BsiDM3kue8IFb9OUUUddFuFZXYrZrip+BMwlbPblqvOk9RX2kNe
 pICattiK5RPDFanZvj6rJ7ZYGdYhImgAr6K3YOk8VINHHRPoggiSEyI3YlLPQG9s7HCe
 0BksKg+OYuc2gabP4kDyFe2gGQ2XwwvjWaNlWZNAnPxDdQqFcLeGufChjlQBl85xUa0g
 uo7w==
X-Gm-Message-State: AOAM533ewZA4dPWwARu+7rZMlhpOZwd+F9YKJf3JzeXbVnJO2TMoYSej
 di8W6aoVETNK5Sv6m6yqcg==
X-Google-Smtp-Source: ABdhPJwQH/VtC6qE0HHNpBy9dQppn1TYJUlWL8V73R7BJZQqKIK8+ExMN1LXYwZX04+vooKRFikYrw==
X-Received: by 2002:a4a:8c4f:: with SMTP id v15mr11617101ooj.52.1604959100668; 
 Mon, 09 Nov 2020 13:58:20 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q24sm2813780otm.22.2020.11.09.13.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:58:20 -0800 (PST)
Received: (nullmailer pid 1828426 invoked by uid 1000);
 Mon, 09 Nov 2020 21:58:19 -0000
Date: Mon, 9 Nov 2020 15:58:19 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 23/32] dt-binding: Document kendryte,k210-clk bindings
Message-ID: <20201109215819.GA1826748@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-24-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-24-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_165821_548691_38642CAC 
X-CRM114-Status: GOOD (  18.65  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:14:11PM +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Kendryte K210 SoC clock driver
> in Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/clock/kendryte,k210-clk.yaml     | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml

This and the header go in 1 patch. And before the driver patch.

> 
> diff --git a/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
> new file mode 100644
> index 000000000000..02f5f8a86bc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/kendryte,k210-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 Clock Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Kendryte K210 clock controller driver which support the system controller
> +  subsystem supplied clocks for the various controllers and peripherals within
> +  the SoC.
> +
> +  See also:
> +  - dt-bindings/clock/k210-clk.h
> +
> +properties:
> +  compatible:
> +    const: kendryte,k210-clk
> +
> +  clocks:
> +    maxItems: 1
> +    description: System fixed rate oscillator clock
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +
> +    clocks {
> +      in0: oscillator {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <26000000>;
> +      };
> +    };
> +
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      /* ... */
> +
> +      sysctl: system-controller@50440000 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        compatible = "kendryte,k210-sysctl",
> +                     "syscon", "simple-mfd";
> +        reg = <0x50440000 0x1000>;
> +        /* ... */
> +        sysclk: clock-controller {
> +          #clock-cells = <1>;
> +          compatible = "kendryte,k210-clk";
> +          clocks = <&in0>;
> +        };
> +        /* ... */
> +      };
> +    };
> +
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
