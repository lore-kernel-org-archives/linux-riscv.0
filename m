Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D72DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 20:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F04D64D9D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 20:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F04D64D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7M7+M5vAg/fdffhMbY3Sp2zwM4xLi/TgHCHGrlaQe/U=; b=z8oBnPH0MwA5NMQf416jUIvtG
	VN2ff5LJNpygtrCoVMVIBp3YO5yHTsthF6F5YKi9kwQeAEPIARC5CHOipK0jukOacBI01qZZ8gknE
	KRklP8nE7u8tKXx/u8cXWi/GKN27BOfpmzN5w1l/qtoib5nulUaFqa/5RZLIziNM5MIthgYKCG+HV
	1yRgoTiCL04AEtgZg/Im5gsU2KpSpz4ILUk2z7L8DBEe+3JFYxyaQVdkx/9cHHrXizI9Y1FKlbNzQ
	FphXxUXvyM0K4y0pR/LSxfsXC0gB6a3Z4IuFpQOVOBCiibh6kW5MOftkI9By2LWFrF/rPVaNbX4JU
	mP5WCSghA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l87Jy-0004zO-DX; Fri, 05 Feb 2021 20:03:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l87Jv-0004yw-Hg
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 20:03:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40A5364FB9
 for <linux-riscv@lists.infradead.org>; Fri,  5 Feb 2021 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612555390;
 bh=/sm0XIpYKkbbjV7i8gGDf7MGQI0+kwueOURFLkLCfn8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rV80DqNyBc9wFNSdE7QihSgz6KJAQcmk6iKtwTb8OGYcy4E4gz97oDTpeECMu0CTl
 AtVAZOGmMeUuQPCXcENnTue1nAs6mBHQdx8UrAyv9FLP8H2zCFefBHZmiHJpczae89
 t7daDtbjjD2w4KYBE3EhC4u0Fp/OSZD+pyby6v1W573Ikl4TM+5VlFGWi3wVRfaREo
 AxlbJjGzSh9JncXa7vXqtoxjoooxot7HrJOnpRRUIY0m745rh9BhhRrgmuXytvdMvZ
 v3ki0eSfO+gHz3ro4Qw8A+RbQAcYEUyPozvfSi9cmX5cEEobcCC73W4jIT7o0MSCgq
 TeXDPI6L9/8Pw==
Received: by mail-ed1-f54.google.com with SMTP id s26so4500927edt.10
 for <linux-riscv@lists.infradead.org>; Fri, 05 Feb 2021 12:03:10 -0800 (PST)
X-Gm-Message-State: AOAM530ZKqyHaX08EbPsK6Hp3W+Rj9xYGDHdpU0YWgDzHtnw0WMEGBad
 vVe47JzvP+PkuV5bYj2Mk3QMt7trZ6yo7r1+kQ==
X-Google-Smtp-Source: ABdhPJzBHkTtjVBrbnsOTF9Lxv+UMFECyuQYT1i9z3hc1GjaFelWKAf725itttHfhkLfhX/WJ3vdHFxsp11RjM/bG0k=
X-Received: by 2002:aa7:c7c8:: with SMTP id o8mr5227961eds.137.1612555388731; 
 Fri, 05 Feb 2021 12:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
 <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
In-Reply-To: <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Feb 2021 14:02:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
Message-ID: <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_150311_749540_FE75F3CB 
X-CRM114-Status: GOOD (  38.43  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 3, 2021 at 6:47 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Wed, 2021-02-03 at 14:41 -0600, Rob Herring wrote:
> > On Wed, Feb 3, 2021 at 6:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> > >
> > > On Tue, 2021-02-02 at 13:02 -0600, Rob Herring wrote:
> > > > On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> > > > >
> > > > > The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> > > > > interrupts property description and maxItems. Also add the standard
> > > > > ngpios property to describe the number of GPIOs available on the
> > > > > implementation.
> > > > >
> > > > > Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> > > > > of this gpio controller in the Canaan Kendryte K210 SoC. If this
> > > > > compatible string is used, do not define the clocks property as
> > > > > required as the K210 SoC does not have a software controllable clock
> > > > > for the Sifive gpio IP block.
> > > > >
> > > > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > Cc: devicetree@vger.kernel.org
> > > > > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > > > > ---
> > > > >  .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
> > > > >  1 file changed, 18 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > > > index ab22056f8b44..2cef18ca737c 100644
> > > > > --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > > > +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > > > @@ -16,6 +16,7 @@ properties:
> > > > >        - enum:
> > > > >            - sifive,fu540-c000-gpio
> > > > >            - sifive,fu740-c000-gpio
> > > > > +          - canaan,k210-gpiohs
> > > > >        - const: sifive,gpio0
> > > > >
> > > > >    reg:
> > > > > @@ -23,9 +24,9 @@ properties:
> > > > >
> > > > >    interrupts:
> > > > >      description:
> > > > > -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
> > > > > +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
> > > > >      minItems: 1
> > > > > -    maxItems: 16
> > > > > +    maxItems: 32
> > > > >
> > > > >    interrupt-controller: true
> > > > >
> > > > > @@ -38,6 +39,10 @@ properties:
> > > > >    "#gpio-cells":
> > > > >      const: 2
> > > > >
> > > > > +  ngpios:
> > > > > +    minimum: 1
> > > > > +    maximum: 32
> > > >
> > > > What's the default as obviously drivers already assume something.
> > > >
> > > > Does a driver actually need to know this? For example, does the
> > > > register stride change or something?
> > > >
> > > > Please don't add it if the only purpose is error check your DT (IOW,
> > > > if it just checks the max cell value in gpios phandles).
> > >
> > > If I remove that, make dtbs_check complains. Looking at othe gpio controller
> > > bindings, they all have it. So isn't it better to be consistent, and avoid make
> > > dtbs_check errors ?
> >
> > That would mean you are already using 'ngpios' and it is undocumented
> > (for this binding). If already in use and possibly having users then
> > that changes things, but that's not what the commit msg says.
> >
> > Not *all* gpio controllers have ngpios. It's a good number, but
> > probably more than need it though. If we wanted it everywhere, there
> > would be a schema enforcing that.
>
> If I remove the minimum and maximum lines, I get this error:

I never said remove minimum/maximum. The suggestion is either add
'default: 16' or remove 'ngpios' entirely.

> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml:42:10: [error] empty
> value in block mapping (empty-values)
>   CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> ,gpio.yaml: properties:ngpios: None is not of type 'object', 'boolean'
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> ,gpio.yaml: ignoring, error in schema: properties: ngpios
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/gpio/sifive,gpio.yaml

ngpios: true

or

ngpios: {}

Are the minimum valid values for a key. (Though not what should be done here.)

>
> If I remove the ngpios property entirely, then I get a hit on the device tree:
>
>   CHECK   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml
> /linux/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml:
> gpio-controller@38001000: 'ngpios' does not match any of the regexes: 'pinctrl-
> [0-9]+'
>         From schema:
> /home/damien/Projects/RISCV/linux/Documentation/devicetree/bindings/gpio/sifive
> ,gpio.yaml

That's not upstream, right? Then fix it.

> Now, If I change the property definition to this:
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 2cef18ca737c..5c7865180383 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -40,8 +40,11 @@ properties:
>      const: 2
>
>    ngpios:
> -    minimum: 1
> -    maximum: 32
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of GPIO pins implemented by the controller.
> +      It is 16 for the SiFive SoCs and 32 for the Canaan K210 SoC.
> +
>
>    gpio-controller: true
>
> Then all is OK.
>
> Which option should I go for here ? If we want to avoid a dtbs_check error, as
> far as I can see, we can:
> 1) Remove the ngpios property and remove its use from the DTS, which is not
> nice in my opinion

Again, it depends if there are users depending on it. A user being a
GPIO driver somewhere, not a DTS file. The GPIO driver in the kernel
doesn't need it. So u-boot? BSD?

> 2) Use the modification proposed above

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
