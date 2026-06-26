Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50117CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 06:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8+8pQsZbib2WDR16XntKjdm7cR3cLwRrYTFZ5JIU4o=; b=S1OENQ1i1ssxxI
	vTjqgjOuiXAfNU2nC0SV9ITqBJBT4o43dXX6BHWaumbPv3PyMr+y4QLWZkxrGxXYb6/aVBqy6+Fu7
	+FqpkMoh2K7CR31JQ2PPo9HFYPzzjJd6/S35CSe0xJcY4/1A0hgdWFcPU51HieF1FXN512VChF30M
	gi8WbOahZ5BQkSP0uGk+LulDNjogmyfVcxRsf+jX2+47CUZ18es+zsJhUni8uBuUruqBbwBExHHwC
	TvelqI6TaC4HBIjBhrF6eUDWbhW1eAk4Wglmq5OIGzSET6P7XMMVhuOsDhqrFtdyK13sn4z3JgHzd
	dmfFlNEfYdtCMpiiq6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczdV-0000000AZ7L-0XGG;
	Fri, 26 Jun 2026 06:01:57 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczdR-0000000AZ6j-1Tcf
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 06:01:55 +0000
Received: from luyulin$eswincomputing.com ( [10.12.96.77] ) by
 ajax-webmail-app2 (Coremail) ; Fri, 26 Jun 2026 14:01:42 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.77]
Date: Fri, 26 Jun 2026 14:01:42 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Yulin Lu" <luyulin@eswincomputing.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Min Lin" <linmin@eswincomputing.com>,
	"Samuel Holland" <samuel.holland@sifive.com>,
	"Darshan Prajapati" <darshan.prajapati@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>
Subject: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260615-that-scarf-e048ef152676@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-4-pinkesh.vaghela@einfochips.com>
 <20260615-that-scarf-e048ef152676@spud>
MIME-Version: 1.0
Message-ID: <55962658.7bea.19f02850fe2.Coremail.luyulin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgDH3aDGFT5qhrYuAA--.8386W
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAgEKA2o9WJgTKQAA
	sn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_230153_530160_0E2EB5FB 
X-CRM114-Status: GOOD (  15.79  )
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

Hi, Conor. Thanks for your review.

> On Mon, Jun 15, 2026 at 05:50:12PM +0530, Pinkesh Vaghela wrote:
> > From: Yulin Lu <luyulin@eswincomputing.com>
> > 
> > Add pinctrl node and related pin configuration for EIC7700 SoC
> > 
> > Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts | 109 +++
> >  .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        |   5 +
> >  3 files changed, 1002 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > 
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index 1fb92f0e7c55..e7bb96e14958 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > @@ -6,6 +6,7 @@
> >  /dts-v1/;
> >  
> >  #include "eic7700.dtsi"
> > +#include "eic7700-pinctrl.dtsi"
> >  

...

> > +&gpio79_pins {
> > +	bias-disable;
> > +	input-disable;
> > +};
> > +
> > +&gpio80_pins {
> > +	bias-pull-up;
> > +	input-disable;
> > +};
> > +
> > +&gpio82_pins {
> > +	bias-pull-up;
> > +	input-disable;
> > +};
> > +
> > +&gpio84_pins {
> > +	bias-disable;
> > +	input-disable;
> > +};
> > +
> > +&gpio85_pins {
> > +	bias-pull-up;
> > +	input-disable;
> > +};
> > +
> > +&gpio94_pins {
> > +	bias-disable;
> > +	input-disable;
> > +};
> > +
> > +&gpio106_pins {
> > +	bias-disable;
> > +	input-disable;
> > +};
> > +
> > +&gpio111_pins {
> > +	bias-disable;
> > +	input-disable;
> > +};
> > +
> > +&pinctrl {
> > +	vrgmii-supply = <&vcc_1v8>;
> > +};
> > +
> >  &uart0 {
> >  	status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..7293df146aa7
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > @@ -0,0 +1,888 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2025 Beijing ESWIN Computing Technology Co., Ltd.
> > + *
> > + * ESWIN's EIC7700 SoC pin-mux and pin-config options are listed as
> > + * device tree nodes in this file.
> > + *
> > + * Authors: Yulin Lu <luyulin@eswincomputing.com>
> > + */
> > +
> 
> I don't really understand the groups here. I think you should make more
> effort to put more pins in each group.
> 
> > +		gpio1_pins: gpio1-pins {
> > +			pins = "jtag0_tck";
> > +			function = "gpio";
> > +		};
> > +
> > +		gpio2_pins: gpio2-pins {
> > +			pins = "jtag0_tms";
> > +			function = "gpio";
> > +		};
> > +
> > +		gpio3_pins: gpio3-pins {
> > +			pins = "jtag0_tdi";
> > +			function = "gpio";
> > +		};
> > +
> > +		gpio4_pins: gpio4-pins {
> > +			pins = "jtag0_tdo";
> > +			function = "gpio";
> > +		};
> 
> Like these 4 for example, why not group these?

The 'group' is used to correspond to the '-grp' tag in the YAML file and
has no practical significance.
Different board designs have different requirements for pin multiplexing.
Therefore, eic7700-pinctrl.dtsi only provides pins for the board-level DTS.
Pins are combined and used in the board-level DTS via pinctrl-0 property.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
