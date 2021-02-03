Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC7C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 20:41:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A8C64F6C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 20:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A8C64F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NA99VLE9LCSs3PdQRcClQc6d4awr1OEH/LY+2vvTxUM=; b=sMH+JxLcD9ecOHu/UTBk64q5V
	TA3Q/RTLZaIe86BahqVIcimKOqM7tb8SlT32MSZDwLIeE7Fxb61xCJ/2D+vplVgBKZC4relLeaAQx
	wEmx4xdEJu1YUApFOE/LQw3mdLgz+uJropM6EtUnlARKrGkba11+cJiJ8kequeXZF94BhudGE41Dc
	UqIS5YbBDZmOxqsxg/gzR2xd9maPjilF3ncBW1iv3uwK0zG2jPJHhy2PdysupVyjKPM03b3EpVC9c
	JkT6nzSypJdQ+mh4QXkVyBzWu2NXSfyq3kR5baMfdBOcpJk1hVH65W8UdXyqY0fvzOZf2iC1A6kCM
	G6m5HogPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Oxk-0005nh-Cb; Wed, 03 Feb 2021 20:41:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Oxg-0005nO-P7
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 20:41:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D26460295
 for <linux-riscv@lists.infradead.org>; Wed,  3 Feb 2021 20:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612384875;
 bh=a155rDiUOTottK3BkpGV7GBGnkCxskQN2uR3TL7Vctw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hi43SE5VpL/+cZC2xHvp1iDB1HfNWB/jwplmjUvPf1PaeWmLra9S7qAc/fZ+Kcd/F
 e0KFp8e7TA28FbsvGIWn2ZvQDpKj8CmDkcxhZYzMg0oVENlnqBuFXnEHZzOUrX9mGm
 8GmGdyRZGbossbnmqv+TGU8ZDn5g7CV1s962DWN7TcPKgBwJhg0ej5XUCWr8wcJSPN
 uCHiE4dTcff9kqiym+On1aVI3iaKoGm3yFNUdwV61JpYBk9P4AAU0aItD3g8r0gzJA
 epJC8AtZ/2Qreqx/D//5PjD5YQOLrFhr3L0d/M1WKi+goaHc8IHi2ApnLsIzFaWkR7
 j+Sud+9q3UsQw==
Received: by mail-ej1-f47.google.com with SMTP id b9so1181995ejy.12
 for <linux-riscv@lists.infradead.org>; Wed, 03 Feb 2021 12:41:15 -0800 (PST)
X-Gm-Message-State: AOAM531azLg+JwDbI32vXj2/ZA/vGbSOXdNww0PT5+Z6RBnxPrug4MpF
 aH2swWWsq4DSDi8ORhRuypU29GKE+Hn8c9jcqg==
X-Google-Smtp-Source: ABdhPJwo6MDaFeVcL5eSWg9cKv2dOm2G3R6qtzjS3WgxrTzbKoMsX4swNQLb31rSbGCbi1pcSPUcmAZ5xShD6BHyT80=
X-Received: by 2002:a17:906:af41:: with SMTP id
 ly1mr4830556ejb.525.1612384873695; 
 Wed, 03 Feb 2021 12:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
In-Reply-To: <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Feb 2021 14:41:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
Message-ID: <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_154116_998596_398D14A5 
X-CRM114-Status: GOOD (  26.82  )
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

On Wed, Feb 3, 2021 at 6:52 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Tue, 2021-02-02 at 13:02 -0600, Rob Herring wrote:
> > On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> > >
> > > The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> > > interrupts property description and maxItems. Also add the standard
> > > ngpios property to describe the number of GPIOs available on the
> > > implementation.
> > >
> > > Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> > > of this gpio controller in the Canaan Kendryte K210 SoC. If this
> > > compatible string is used, do not define the clocks property as
> > > required as the K210 SoC does not have a software controllable clock
> > > for the Sifive gpio IP block.
> > >
> > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> > > ---
> > >  .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
> > >  1 file changed, 18 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > index ab22056f8b44..2cef18ca737c 100644
> > > --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> > > @@ -16,6 +16,7 @@ properties:
> > >        - enum:
> > >            - sifive,fu540-c000-gpio
> > >            - sifive,fu740-c000-gpio
> > > +          - canaan,k210-gpiohs
> > >        - const: sifive,gpio0
> > >
> > >    reg:
> > > @@ -23,9 +24,9 @@ properties:
> > >
> > >    interrupts:
> > >      description:
> > > -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
> > > +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
> > >      minItems: 1
> > > -    maxItems: 16
> > > +    maxItems: 32
> > >
> > >    interrupt-controller: true
> > >
> > > @@ -38,6 +39,10 @@ properties:
> > >    "#gpio-cells":
> > >      const: 2
> > >
> > > +  ngpios:
> > > +    minimum: 1
> > > +    maximum: 32
> >
> > What's the default as obviously drivers already assume something.
> >
> > Does a driver actually need to know this? For example, does the
> > register stride change or something?
> >
> > Please don't add it if the only purpose is error check your DT (IOW,
> > if it just checks the max cell value in gpios phandles).
>
> If I remove that, make dtbs_check complains. Looking at othe gpio controller
> bindings, they all have it. So isn't it better to be consistent, and avoid make
> dtbs_check errors ?

That would mean you are already using 'ngpios' and it is undocumented
(for this binding). If already in use and possibly having users then
that changes things, but that's not what the commit msg says.

Not *all* gpio controllers have ngpios. It's a good number, but
probably more than need it though. If we wanted it everywhere, there
would be a schema enforcing that.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
