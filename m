Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14504C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B5E60EFE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7B5E60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXGY+TiWLXiP4iaLt/uf9i/flkzANe6IPoJ3isqvEAg=; b=Zw7sC8cZBdm78T
	ly5Pz91ac/j2XDEBnLUGIiEhzY3c4pTyuYtipzzXD64e7np2iqdNg2IZB3a98qI0uhGsFMCWxtSeo
	+bdEHBI/rXaWyksp7ySADDGsc8oHuZ8yrZvERE9U0EnegBCVy7arvymK5aYJOlFXPLmTEJ5QtZCEi
	+Bb/5BcPl8jwdXl69j+s2AswiHczl5Sbt0NtQnijP7Sp3MEfDslnsXKUSdrXOpATP5AHG23IDiBDF
	3uPYjBxVyO+hS1ihwEbmQKov9MIEbXowG/axuH/UApRXQilLKMlpCkSWqaeI72xUOSm6Ht+0LCMHo
	a6vCj4C4dM8nOos8PDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maISQ-00D8Vh-WD; Tue, 12 Oct 2021 14:08:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maISN-00D8Tn-SO
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 14:08:41 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maISM-0006W6-Jk; Tue, 12 Oct 2021 16:08:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1maISL-0002ib-VS; Tue, 12 Oct 2021 16:08:37 +0200
Message-ID: <ea74ee13d663fdf9df534bb06b5096198aef7920.camel@pengutronix.de>
Subject: Re: [PATCH v1 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby
 <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, Sagar
 Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>, Atish
 Patra <atish.patra@wdc.com>,  Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Date: Tue, 12 Oct 2021 16:08:37 +0200
In-Reply-To: <20211012134027.684712-9-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-9-kernel@esmil.dk>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_070839_946406_50C0F647 
X-CRM114-Status: GOOD (  13.40  )
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

On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
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
> index 000000000000..1985ccaf8605
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
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
> +    rstgen: reset@11840000 {

Better call this reset-controller@11840000, same in the .dtsi.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
