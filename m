Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F263C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004CE61107
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 004CE61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CG05yE8w8XP/By/Z5l0GvNYvhuv8MewTW2warEQ2/c=; b=rhiu6+Xc6jIToH
	v1pStJT3vjW5z/j6XkVx1U+hwHQ1RXilvCucoaHjArHzEr/pNUHvnSY13hJuObGJKIv7dpXyIiiaq
	duo9bvXzcQe73jyVFwcJGCQbaN8GSnow4w/aPHWoT3dh3vajBbdCAVvVBhQG95AbOOIj1/bpscGUM
	7bKvPAUgBmn4V9SY3VeWvSyosOB2+cE3VzIb8rCdww8Qir8EQ+dK4IUSKXmdQMFG4l4/s8m1ZhSYO
	0WuCHwRBdrcQpV74uZQWN6MEDwOnky81/2R2i7Dq03wTcWI+PXAG4y56epnOY25uw0F87BgJl9R9l
	2gsT4Rfsv4ALDpDvH3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGvf-009TmQ-5H; Fri, 29 Oct 2021 01:43:35 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGvc-009Tkn-9Z
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:43:34 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 m37-20020a4a9528000000b002b83955f771so2787271ooi.7
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g0vRry/q9gPa6K5DqnEdQ+MjuDPXnWlIXsLq1efeXiU=;
 b=T9YZdV+QSMRe84TSP+wc8uE1nArdD+g00w8Elh4teusD95Bpb1tyCnVaZ19R7vTSsp
 cRLo7moUKo1weOeuWbvySyPjtI/KSqoX9cjPvSYCR5wEaYP+p5HQhZ8wgdyLCGNkYiPk
 e/gSRZRN9UTdduZdz1Srh/gygYXIusJqVSE3j4p2gFOGEsD5fquvS22ohkrR8FMz1J2Z
 fOGiGuYHwBnxEg7CbGOsWra/cscVOQgzePF7ZsTiktEGErA+5v1EN+KSC8Uzk5ZX7L7t
 gjSEt2Oxc0ssj11yOzSr9tiPNvHxmz+kTr+HJQ0FB6ufSaYtr+mgp+DdwLNUkMcvMPQb
 biQg==
X-Gm-Message-State: AOAM531hroKGsExHmIm2ghvp8UTaVyEWv99IntGa8cW6dKucV1ABFvuY
 B1bR0VdBZ1kYGBVakbshw8GtkXGqww==
X-Google-Smtp-Source: ABdhPJyNVEv7cAeglRB/mWUpRoGfC/2zNsORUfP+htb5VfqOA1jyBofmsXbAWWcfU1MpLlzHQ6EsgQ==
X-Received: by 2002:a4a:b501:: with SMTP id r1mr5585148ooo.20.1635471806004;
 Thu, 28 Oct 2021 18:43:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e32sm1440963oow.30.2021.10.28.18.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:43:25 -0700 (PDT)
Received: (nullmailer pid 977190 invoked by uid 1000);
 Fri, 29 Oct 2021 01:43:24 -0000
Date: Thu, 28 Oct 2021 20:43:24 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Message-ID: <YXtRvIS9qHgP26zd@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-9-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-9-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_184332_364550_BE79A4AB 
X-CRM114-Status: GOOD (  14.85  )
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

On Thu, Oct 21, 2021 at 07:42:15PM +0200, Emil Renner Berthing wrote:
> Add device tree bindings for the StarFive JH7100 reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> new file mode 100644
> index 000000000000..c6ad5d7ad100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/starfive,jh7100-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 SoC Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7100-reset
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
> +    rstgen: reset-controller@11840000 {

Drop unused labels.

> +        compatible = "starfive,jh7100-reset";
> +        reg = <0x11840000 0x10000>;
> +        #reset-cells = <1>;
> +    };
> +
> +...
> -- 
> 2.33.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
