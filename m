Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BFACDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxtNOhRHWSRXZWcASyvcTqPiU7zPoEJ7f6aqHpZ89lc=; b=q/QJMtY6lseAbu
	HiWrn5k3ugSMp07ZYQjkjxuzWgj8yvatd0acKtQYikADPa8bOexCLhu8S88kylmiebB2aU2nObbwm
	zTLa8/3DvUFx4zQJH0t9DuClLYA8A9yRPhedY8nB37pCBQW2TKHbjwgxYWEpVp3tPinbBUFUrLybe
	n5WsoRwTO+GozLtFXeGURO2CRlFUH0tJFFPQwc3nh0BggFq/n5fBNPeEyBzDuTStfMq9cT69LcHfB
	0Np4DBkDYJLPaW6j8fBDvvfKmReazjQ9MHe6iTbe6pwdw3d1gQjFzzruMzC8uceWn87LAoF0sxUhX
	qjn67sHmktCm9vdR0n/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0Gb-0000000Ac3j-1MLP;
	Fri, 26 Jun 2026 06:42:21 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0GZ-0000000Ac3E-08nT
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 06:42:20 +0000
Received: from E0006800LT.eswin.cn (unknown [10.12.96.77])
	by app1 (Coremail) with SMTP id TAJkCgBn+286Hz5q5MUuAA--.51254S2;
	Fri, 26 Jun 2026 14:42:04 +0800 (CST)
From: Yulin Lu <luyulin@eswincomputing.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: Re: [PATCH 3/7] riscv: dts: eswin: eic7700: add pinctrl support
Date: Fri, 26 Jun 2026 14:42:02 +0800
Message-Id: <20260626064202.1045-1-luyulin@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260615123315.ABB4A1F00A3A@smtp.kernel.org>
References: <20260615123315.ABB4A1F00A3A@smtp.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgBn+286Hz5q5MUuAA--.51254S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW7tr1xAF17CF1UZw4fZrb_yoWrGr1xpF
	W3WFZ3AFn7CryxJ3y2qw409r47Za1fGFnIkr1Dtry2yrn8uFyftFsYyr45Xa4UZr4FvrnY
	vF4Y934IvF1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: pox13z1lq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_234219_269150_6BD453F6 
X-CRM114-Status: GOOD (  22.90  )
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

Hi, sashiko.

> [Severity: Low]
> Should this node be named using the generic regulator-* pattern (such as
> regulator-1v8) to avoid dtbs_check warnings for deprecated names?
> There is also an extra leading space on the properties within this node
> that deviates from standard spacing.

I will rename this node to "regulator-1v8".

> > +  regulator-name = "vcc1v8";
> > +  regulator-always-on;
> > +  regulator-boot-on;
> > +  regulator-min-microvolt = <1800000>;
> > +  regulator-max-microvolt = <1800000>;
> > +  };
> >  };
> [ ... ]
> > @@ -25,6 +35,105 @@ &xtal {
>   clock-output-names = "xtal24m";
> >  };
> >  
> > +&gpio0_pins {
> > + bias-disable;
> > + input-enable;
> > +};
> [Severity: High]
> Will these pin configuration overrides be silently ignored by the pinctrl
> core during boot?
> Since these pin definitions are not referenced by a pinctrl-0 property in
> an active device node, and are not configured as pinctrl hogs in the provider,
> the intended hardware states for these pins will not be programmed.

I don't think this is an issue. These pin configurations won't be ignored by the kernel during boot.
Some pins have input-enable, pull-down, or pull-up settings that differ from the chip defaults on
certain boards, these configurations are added these configurations in the board-level DTS.

> [ ... ]
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..7293df146aa7b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi
> > @@ -0,0 +1,888 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> [ ... ]
> > + hdmi_pins: hdmi-pins {
> > + pins = "hdmi_scl", "hdmi_sda", "hdmi_cec";
> > + function = "hdmi";
> > + };
> > +
> > + rgmii0_pins: rgmii0-pins {
> > + pins = "rgmii0_clk_125", "rgmii0_txen", "rgmii0_txclk", "rgmii0_txd0",
> > +        "rgmii0_txd1", "rgmii0_txd2", "rgmii0_txd3", "rgmii0_rxclk",
> > +        "rgmii0_rxdv", "rgmii0_rxd0", "rgmii0_rxd1", "rgmii0_rxd2",
> > +        "rgmii0_rxd3", "rgmii0_mdc", "rgmii0_mdio", "rgmii0_intb";
> > + function = "hdmi";
> > + };
> [Severity: High]
> Is the hdmi function correct for this network pin group?
> It appears that rgmii0, rgmii1, and the i2s pin groups that follow all use
> the hdmi function. This will prevent the pin controller from routing these
> pins properly, likely leading to driver probe failures when peripherals
> attempt to request them.

I will fix the function of rgmii0_pins and rgmii1_pins to rgmii, and the function of i2s0_pins,
i2s1_pins, and i2s2_pins to i2s.

> [ ... ]
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index a7ebb11159580..8798c50f7584d 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -349,6 +349,11 @@ gpioD: gpio-port@3 {
> >   };
> >   };
> >  
> > + pinctrl: pinctrl@51600080 {
> > + compatible = "eswin,eic7700-pinctrl";
> > + reg = <0x0 0x51600080 0x0 0x1fff80>;
> > + };
> > +
> [Severity: High]
> Should the existing gpio controller nodes (gpioA, gpioB, gpioC, and gpioD)
> be updated with a gpio-ranges property mapping to this new pinctrl provider?
> Without gpio-ranges, the GPIO subsystem cannot translate GPIO offsets into
> pinctrl pins. The pinctrl core's .gpio_request_enable callback will not be
> invoked when a software component requests a GPIO dynamically, preventing
> the multiplexer from automatically switching the pin to GPIO mode.
> >   clk: clock-controller@51828000 {
> >   compatible = "eswin,eic7700-clock";

I think add gpio-ranges is unnecessary, the driver does not implement
the .gpio_request_enable callback.

Regards,
Yulin Lu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
