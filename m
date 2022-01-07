Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A292FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDT906BKPZndUwUIZx5JYtVxCZbNZLA3Ixwgc0mstEo=; b=k5OwGxVJpkucKt
	ABGXnZhCeDf8nAnrMDdheHkhXvYIB2OzX6PHAW+cGau2TojgNFh0eDBVdedJunsCKO/1cbhnR2Wja
	UIngdRmGVFFnX07fjVgvJFIRMzBq5LVjTLDYySKDZ1i54aQw/Us57S5+sSqucd3LINT0eazwss0ky
	QnsVKA89A1il6jomg7fqecv1ISLg8BN7RgkFp576nDQ0A9GQ5s2TPuxE6YU0m2rAMPKUrsQXvMkZy
	PjVTen8gLD6CYwO958s0D7HGMOUNiVrhEw0GHglgJlLH21HS3y0OzwCwI2ZR1Tg/mwuXGVW3bkx8t
	9Y+JnzrCbyp782Si3Biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5see-004hn0-Ts; Fri, 07 Jan 2022 17:03:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5seT-004hkx-0S; Fri, 07 Jan 2022 17:03:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8653861F80;
 Fri,  7 Jan 2022 17:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A11CC36AF7;
 Fri,  7 Jan 2022 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641575019;
 bh=OFEHu/bkwozuqgXzmAJslWkaBtA/8D7wQRLLpTkuX10=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g3j3AWguhtz9Ax4HaYWyVFJTrVmh++66LQtuos6qOmFxhrRerKv8mq6Ap3/eUMY1g
 ywXnPHwHHsPTK+G8/XyvT14E91Pbq/NlcXWgWg5MSg7ni9uuFT4g557BSa5DwNrnTs
 7L1AOT5sK2UYixVIwXdgGskmMWwWxjz9uBqq3CvqQbSyqkxs8EqcgkpAmdjnieVA7D
 +IQp1JeMf6h03hhI/PMi8zgypqmwQjJrnwsWMWb0cxe2rt43GcPRQv57cWuT/CHJBS
 8Vscu3b7VfSHp1+eVPdviTyf6vUt/AL0AgqLhPQ946jUr4tajOtbjQRSQcxryIz9zf
 UYidjqVfdbWPg==
Received: by mail-ed1-f53.google.com with SMTP id j21so24445251edt.9;
 Fri, 07 Jan 2022 09:03:39 -0800 (PST)
X-Gm-Message-State: AOAM531ZRDwdXmUt7QHYy1R7N/MjQDraXLu/s7e4EbWFV5KR0Jcz288G
 P+c1S9tLh6C/8jLBmtMrvmhuWQQs8NwW2FFDeg==
X-Google-Smtp-Source: ABdhPJyVHvfifLk+kw1sqHl8xV7RW2+DKP2YJdCdWKyWvhJDsj6/0F6MjSoppkQ/mBd9/4EtbX68a6mdmbqlGPBPU48=
X-Received: by 2002:a17:906:d184:: with SMTP id
 c4mr6269057ejz.20.1641575017424; 
 Fri, 07 Jan 2022 09:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20220107031905.2406176-1-robh@kernel.org>
 <cf75f1ee-8424-b6b2-f873-beea4676a29f@ti.com>
 <CAL_JsqL3PGqmzA0wW37G7TXhbRVgByznk==Q8GhA0_OFBKAycQ@mail.gmail.com>
 <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
In-Reply-To: <8902cefa-e2d7-1bcc-aae2-f272be53d675@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Jan 2022 11:03:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKScenYRO4QERfdB-e8-70Va1tMBbSTXbAoUp+AVTk8Pw@mail.gmail.com>
Message-ID: <CAL_JsqKScenYRO4QERfdB-e8-70Va1tMBbSTXbAoUp+AVTk8Pw@mail.gmail.com>
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
 Hari" <hnagalla@ti.com>, 
 "Menon, Nishanth" <nm@ti.com>, Vignesh R <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_090341_173947_7014106F 
X-CRM114-Status: GOOD (  38.28  )
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

On Fri, Jan 7, 2022 at 10:29 AM Suman Anna <s-anna@ti.com> wrote:
>
> Hi Rob,
>
> On 1/7/22 9:20 AM, Rob Herring wrote:
> > On Fri, Jan 7, 2022 at 8:27 AM Suman Anna <s-anna@ti.com> wrote:
> >>
> >> Hi Rob,
> >>
> >> On 1/6/22 9:19 PM, Rob Herring wrote:
> >>> 'interrupt-parent' is never required as it can be in a parent node or a
> >>> parent node itself can be an interrupt provider. Where exactly it lives is
> >>> outside the scope of a binding schema.
> >>>
> >>> Signed-off-by: Rob Herring <robh@kernel.org>
> >>> ---
> >>>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
> >>>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
> >>>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
> >>>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
> >>>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
> >>>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
> >>>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
> >>>  7 files changed, 15 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> index 9ad470e01953..b085450b527f 100644
> >>> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> >>> @@ -43,7 +43,6 @@ required:
> >>>    - gpio-controller
> >>>    - interrupt-controller
> >>>    - "#interrupt-cells"
> >>> -  - interrupt-parent
> >>>
> >>>  additionalProperties: false
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> index e864d798168d..d433e496ec6e 100644
> >>> --- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> +++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> >>> @@ -175,15 +175,6 @@ required:
> >>>    - ti,mbox-num-fifos
> >>>
> >>>  allOf:
> >>> -  - if:
> >>> -      properties:
> >>> -        compatible:
> >>> -          enum:
> >>> -            - ti,am654-mailbox
> >>> -    then:
> >>> -      required:
> >>> -        - interrupt-parent
> >>> -
> >>
> >> There are multiple interrupt controllers on TI K3 devices, and we need this
> >> property to be defined _specifically_ to point to the relevant interrupt router
> >> parent node.
> >>
> >> While what you state in general is true, I cannot have a node not define this on
> >> K3 devices, and end up using the wrong interrupt parent (GIC
> >> interrupt-controller). That's why the conditional compatible check.
> >
> > But you could.
> >
> > The parent node can have a default interrupt-parent and child nodes
> > can override that. It doesn't matter which one is the default though
> > typically you would want the one used the most to be the default.
> > Looking at your dts files, it looks like you all did the opposite.
>
> Hmm, I am not sure I understood your last comment. Can you point out the
> specific usage?

Perhaps an example. These are all equivalent:

parent {
  child1 {
    interrupt-parent = <&intc1>;
    interrupts = <1>;
  };
  child2 {
    interrupt-parent = <&intc2>;
    interrupts = <2>;
 };
};

parent {
  interrupt-parent = <&intc1>; // Or in the parent's parent...
  child1 {
    interrupts = <1>;
  };
  child2 {
    interrupt-parent = <&intc2>;
    interrupts = <2>;
  };
};

parent {
  interrupt-parent = <&intc2>;
  child1 {
    interrupt-parent = <&intc1>;
    interrupts = <1>;
  };
  child2 {
    interrupts = <2>;
  };
};

You could structure main_navss and child nodes in any of these 3 ways.

>
> All our K3 dts files have the interrupt-parent = <&gic500> defined at the
> root-node, which is the default ARM GIC.
>
> Let us know if we need to fix something in our dts files.

No! I'm just saying there are multiple correct ways to write the dts files.

> The
> > only way that wouldn't work is if the parent node is if the parent
> > node has its own 'interrupts' or you are just abusing
> > 'interrupt-parent' where the standard parsing doesn't work.
>
> All our K3 gic500 nodes does have an 'interrupts' property.

I said the parent node, not the 'interrupt-parent'. In this case, the
parent is 'main_navss: bus@30800000'. It doesn't have 'interrupts' in
your case, so only the 2nd case is a possibility.

> > You are also free to use 'interrupts-extended' anywhere 'interrupts'
> > is used and then interrupt-parent being present is an error.
>
> Yes, this is understood. The OMAP Mailbox binding is reused between multiple SoC
> families, some of which do not use an Interrupt Router in between.
>
> So, whats the best way to enforce this in the specific schema? I have used the
> common 'interrupts' property that applies to all SoCs, and enforced the
> conditional 'interrupt-parent' only on relevant compatibles.

You can't. There is no way a schema can ensure you connect the right
interrupt controller just as it can't ensure you used the right
interrupt number and flags or used the right addresses. Well, you
could technically, but then at that point we could just generate the
dts from the schema.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
