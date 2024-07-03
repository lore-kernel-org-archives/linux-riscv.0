Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E1C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yETkYkEpFqBmvYjsHd8e+HmX9IANYhDggYNzmon3sRI=; b=z5ExCbrBOSA+n9
	vfQwnzJ8kRlZ2YvLAOauWgQqCYF33/uYajB/VLSGGkK4v63G6841G5KgCi+1XFShdcau8r03nKoRF
	qq6soed+aG35thGJdRLz1fZf3mll08Y78JARQZxP43ygi9bE1pOszjeWjRz2WTc8mH5eDdQFWxyN3
	Vh+qm5F1Ewg7/XyA+2KUfpH/2jzI+YBNMHDGtXzkSI2IvU50ltD1A5mJ84Qii2GJbsRGfQxNBTqjl
	sj7TWdNXsto/xtLxOWEdvhPZ9scg8lqyjzvZBbhKuw2ProzWmIQ2UlT2BvcQgavYHTHPyN/QGdlaB
	bKksrMXzGhbIDNvelbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Td-0000000AajV-3ZYJ;
	Wed, 03 Jul 2024 15:00:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0Px-0000000AMqP-43mz
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 13:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBC9C6223A;
	Wed,  3 Jul 2024 13:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C281C2BD10;
	Wed,  3 Jul 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720014784;
	bh=9N8yVPzno2N9d24Snv1GHc+eDBmXHT41IhW0UTd1FJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrqbGcY3PeLUqWFqLP2gHFfZQA13YUIpyeXzzFEC527S9yHYTXpj7UrJ03Qr6BOVj
	 VBobvRhHTBQIKsICEEbwdFeW6uAjLdXE0Joi+VMxUsgIO0nKeU1oi6uEd3vaJfHdzq
	 G2EaD/EVYqXIuTJDbnvdZLNJ/39FmVAUpPoYy9zWM637U6qgZsEFiWCUlEF5DmLU1+
	 zPbP6jgYhL8mXfAlW4v7ysfqpNYDQHDcKb+s0aQ8otboVeJ3esWgKULvFi3Ak2dVuQ
	 /lhsTRxvFHKDePcBeE9Cb2HFwDm4amrtJ5+iimlQNSIgenNmvc9DiJkZrTot1g/izx
	 M7x41TvzJ60dg==
Date: Wed, 3 Jul 2024 07:53:03 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl
 bindings
Message-ID: <20240703135303.GA56155-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com>
 <20240115173657.GA999912-robh@kernel.org>
 <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_065306_196518_75CECB2F 
X-CRM114-Status: GOOD (  41.60  )
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

On Fri, May 17, 2024 at 07:48:17AM -0500, Emil Renner Berthing wrote:
> Rob Herring wrote:
> > On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > ---
> > >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> > >  1 file changed, 372 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > new file mode 100644
> > > index 000000000000..d3ad7a7cfdd1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > @@ -0,0 +1,372 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: T-Head TH1520 SoC pin controller
> > > +
> > > +maintainers:
> > > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > +
> > > +description: |
> > > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > > +
> > > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > > +  Confusingly the memory ranges are named
> > > +    PADCTRL_AOSYS  -> PAD Group 1
> > > +    PADCTRL1_APSYS -> PAD Group 2
> > > +    PADCTRL0_APSYS -> PAD Group 3
> > > +
> > > +  Each pad can be muxed individually to up to 6 different functions. For most
> > > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > > +  group 1 does not support muxing at all.
> > > +
> > > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > > +  be configured or has some special functions. The rest have configurable drive
> > > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > > +  addition to a special strong pull up.
> > > +
> > > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > > +  are then meant to be used by the audio co-processor. Each such pad can then
> > > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > > +  also configured in different registers. All of this is done from a different
> > > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> >
> > It is still not clear to me if each instance is a different programming
> > model or the same with just different connections. The latter should
> > be the same compatible string. That needs to be answered in *this*
> > patch, not a reply.
> 
> Hi Rob,
> 
> Sorry for the late response. I honestly don't know exactly what you mean by
> differenty programming models and what the difference is, so I'll need a bit of
> help with what you want me to write here.

Is the register interface of each instance the same? Looks like it is 
from the driver. So normally that's 3 instances of the same compatible.

> Any driver for the TH1520 SoC (not just Linux) would need some way to discern
> between the 3 pin controllers so they know how many pins to control and what
> pinmux settings are valid. Basically they'd need the data in the three
> th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
> to use.
> 
> https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/

Why do you need to know how many pins? The DT says configure a pin and 
you just configure it. It's not the kernel's job to validate that the DT 
is correct.

Aren't the pin names globally unique? So you just look up the pin name 
across all the arrays. Or you can just look up one pin from each 
instance to find which th1520_groupN_pins array goes with the instance. 
Or just have 1 array.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
