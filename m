Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkEVBYNeto110OHK5M+BfcHNHE/OKY+bFWGFbiO59bE=; b=eRBteHIouwM6v0
	gbMZEvbQy72lE6MnjjJJo5w++HfUb82fmFVdo/To7ACB8z6xg6PCGwPE2OYk/mIgaZM0sg1Pvgwnx
	yjeBUcEJLgjZDx+MssPZ+aQjIaa6+3a+/mdHlXrLk/+0Cd1UgU5TP9Cocb5+cn+a5eh2djEHf1Tqr
	TOJwykT4jUOQwTGsPXqFQTdt7maxDVwqzNWA8CSBDsfYC5YwCNQp9jvSojA8o3yPl4NNmV+wjsNna
	mV/u30kJnj+C6Vz3YgXCdeGH9yZNhmeQ5H1ejLC6i3LO/esGilQpAa1Y57ZPgkBH2nceWKzxtY/mp
	2IkSI+KVCjYtvs+XiyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5r2h-004S0H-8R; Fri, 07 Jan 2022 15:20:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5r2U-004Rxe-UH; Fri, 07 Jan 2022 15:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB590B82630;
 Fri,  7 Jan 2022 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDBFC36AF2;
 Fri,  7 Jan 2022 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641568819;
 bh=JZSDTXn831jsHLaeMlhV91a2NBUCYRKTYU4k2JJ3SEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aiW2Oo9rqnSvZMty9UZIT7Su6WRlpFZC4qB33eV+4HwGl+1IEQ29rltyVDfSbQmYo
 4e+xjseIQ4gjpJnncgYW0+GQl2lY/7Pc42gGUb0HiGc/0qpispy2oluvsAY69ZD+o/
 408clmpmDydeZ97b3Dy1O1mPHnlKDiJt28KxuXWVqXU8bN1D7Dnjh7+Li9+ax4mQwn
 gccb1AzgDKTqPVeTjGMCgkxl1J6N7g4Dn8aJG38k94S3wa9itzjU4IrMFrp6JrHwhB
 p5qTIQsCbQ19nz6d2GayyCfJucnwGsufy68qYS1iPodeLHrJ/P5hRUyh1a7woIqFWF
 MsuEB755uJd1w==
Received: by mail-ed1-f44.google.com with SMTP id u21so762393edd.5;
 Fri, 07 Jan 2022 07:20:19 -0800 (PST)
X-Gm-Message-State: AOAM532GmvNnXuxLcsfqqC5WEGJTNurCTnb5cDnVsB79MBr8rH53S9Yx
 wIVGz9Y9lmAB/FEQzoBfFEW5N0QuvYOPfs1sZg==
X-Google-Smtp-Source: ABdhPJz1jllAhtHnE/GCaPMpieaWkmlnAW2CajB4Bv3UzewhAkigmenmu4JVTDvGexXd518wf1HJZMvSArTFrZXD/Rw=
X-Received: by 2002:a05:6402:1e88:: with SMTP id
 f8mr57554194edf.2.1641568817622; 
 Fri, 07 Jan 2022 07:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
In-Reply-To: <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jan 2022 09:20:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Message-ID: <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
To: Suman Anna <s-anna@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Michal Simek <michal.simek@xilinx.com>, - <patches@opensource.cirrus.com>, 
 John Crispin <john@phrozen.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 netdev <netdev@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, "Nagalla,
 Hari" <hnagalla@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_072023_299147_30CE97C2 
X-CRM114-Status: GOOD (  24.88  )
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

On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 1/6/22 9:19 PM, Rob Herring wrote:
> > 'interrupt-parent' is never required as it can be in a parent node or a
> > parent node itself can be an interrupt provider. Where exactly it lives is
> > outside the scope of a binding schema.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
> >  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
> >  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
> >  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
> >  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
> >  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
> >  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
> >  7 files changed, 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > index 9ad470e01953..b085450b527f 100644
> > --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> > @@ -43,7 +43,6 @@ required:
> >    - gpio-controller
> >    - interrupt-controller
> >    - "#interrupt-cells"
> > -  - interrupt-parent
> >
> >  additionalProperties: false
> >
> > diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > index e864d798168d..d433e496ec6e 100644
> > --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> > @@ -175,15 +175,6 @@ required:
> >    - ti,mbox-num-fifos
> >
> >  allOf:
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          enum:
> > -            - ti,am654-mailbox
> > -    then:
> > -      required:
> > -        - interrupt-parent
> > -
>
> There are multiple interrupt controllers on TI K3 devices, and we need this
> property to be defined _specifically_ to point to the relevant interrupt router
> parent node.
>
> While what you state in general is true, I cannot have a node not define this on
> K3 devices, and end up using the wrong interrupt parent (GIC
> interrupt-controller). That's why the conditional compatible check.

But you could.

The parent node can have a default interrupt-parent and child nodes
can override that. It doesn't matter which one is the default though
typically you would want the one used the most to be the default.
Looking at your dts files, it looks like you all did the opposite. The
only way that wouldn't work is if the parent node is if the parent
node has its own 'interrupts' or you are just abusing
'interrupt-parent' where the standard parsing doesn't work.

You are also free to use 'interrupts-extended' anywhere 'interrupts'
is used and then interrupt-parent being present is an error. How you
structure all this is outside the scope of binding schemas which only
need to define how many interrupts and what are they. Ensuring parents
and cell sizes are correct is mostly done by dtc.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
