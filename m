Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17D8C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzjHwInpTJCyyf2CCjHb4iCInU+kurIq0zdC3EfC4fI=; b=VEd42hG1kYJxZX
	wyLEidOLU16R8/a+hBbzcJqqSGDYI+8cEAOrk0f+194FC+A0vszA42Y/fPnEXtxFbPxlz04viT6DK
	zx8AfzDPaqV0Va5pEfsCkZg3QGsmfLJjnpd216El6XEp4UocmAxO4epN4BjWxg2/Cdk10DCEwvNg8
	OjJ9iJrYP3weiqmSzIL1AmH+SgL/cROWEy+PiqfsG1LwBD+zONcgNtltXz2ELNAY1AxF7vP1yUEWd
	MLux7yqmiCkR1Mzir6K2XyqpMNUM7Mf2x0jmLYqm1ge9mHDRyLd2xWrfnX3Oamu4Zaalw0ctmdFjg
	jT6AeiYGfdL/gItwinSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGru-009AZZ-3C;
	Tue, 09 Jan 2024 18:30:31 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGrq-009AXC-39
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 18:30:28 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6d9b050e88cso1595357b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1704825025; x=1705429825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wuehQIOXoKxKvR7IfGc8qPJ5fDo+dRhQ24T0MSYH2w=;
        b=Xm3RHTAZ/+v/hk/uC3vYP9YnUlvZANDasSurPZBqpzQknijRCzL2WPc1Qo3Gpv4ymi
         GYd/c06IoGAsWlCiz7XInRqrY1ExAmeICg4CWUkMjvYk4dDJNpEhiIOBn/DEzpsrA9JS
         ooXR7IAlB3IPPuR9AE6Dx+6wz0tqmzl7LJeYai/LsFhVWdt92hmhtYwX41i4h2V00xJD
         1qcjd5qAxLbYCYyzSNRAtUhqKJDft+cv0ccd3yhrkI70xKqbVPD/MZ7FfVWfT8Ub7Ptk
         j6vJUrEhA+WSpDzXzB86RWFXK/Nuebr0IZ97W+CP5gFoUqHYAxmwotfeUSf8dJe4iPMf
         GRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825025; x=1705429825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wuehQIOXoKxKvR7IfGc8qPJ5fDo+dRhQ24T0MSYH2w=;
        b=uoPcuWRZVLu6IoWOgmPie+xVdTt0fCbvNiPLFnM+DKqlzPqW1Km85ttohsN3MC00vC
         cE3RN0RLz84827wzJ81JhlBEJxj20KkZNrSRW/UzxwowjoPgDjcYB+jH9zDAT6gB3bcZ
         lxl0fn+BIdly0fPwt9jzVyjEB3SiA5NUxHe1l2Ach6T+z4M0nAepGTykU9UiPFzfFqu9
         VBpiRj90CMQhZbMwb+06eJ1dcFNLXlLBugIeJQPTCuIfNXFEiHwC7EyQ0UYUabviKQVi
         d5nOvFN9S2Pwqehf2YemqUierBlx+F4mQ7CxC38DUsgaaMpnzhrGfFT57c7rME5bZY1P
         rBTQ==
X-Gm-Message-State: AOJu0YzQA3j4CiToLzPNqQ8vLshjx50jynaVwQ+7RiJCaM8UUZ4FooOf
	l4Zi3bTpG6cnjux9HBZHr07sFVYtArwg
X-Google-Smtp-Source: AGHT+IHMaIlxFZkyAjIjl7Fnz8/lzJ5jA7vI2S3G0WFQ6c+y6vsFBpuUI1mJKNcRCD/KUkvTSdiCsA==
X-Received: by 2002:a05:6a00:1d8f:b0:6d9:a0da:4fbc with SMTP id z15-20020a056a001d8f00b006d9a0da4fbcmr2895967pfw.36.1704825024696;
        Tue, 09 Jan 2024 10:30:24 -0800 (PST)
Received: from x1 ([2601:1c2:1800:f680:6e8d:949b:d6c1:a68a])
        by smtp.gmail.com with ESMTPSA id b3-20020a62cf03000000b006db0f35296esm1543303pfg.148.2024.01.09.10.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:30:24 -0800 (PST)
Date: Tue, 9 Jan 2024 10:30:22 -0800
From: Drew Fustini <drew@beagleboard.org>
To: Conor Dooley <conor@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2 3/8] riscv: dts: thead: Add TH1520 pin control nodes
Message-ID: <ZZ2QvqlWYxgfHgQX@x1>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-4-emil.renner.berthing@canonical.com>
 <20240108-majorette-overtly-4ec65d0a15e9@spud>
 <CAJM55Z_2zhELW3E7p94J05We17xTC2Rejs5AigNJOHCGHVr_zg@mail.gmail.com>
 <20240109-tiptoeing-twirl-ebb943e17a29@wendy>
 <CAJM55Z9Ka3hiNmgFuy01Yd0YyxL-SzS=A7S3k84=B1xABKbJhA@mail.gmail.com>
 <20240109-boggle-frugality-03a77cab8308@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109-boggle-frugality-03a77cab8308@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_103027_250155_B6051B81 
X-CRM114-Status: GOOD (  43.27  )
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

On Tue, Jan 09, 2024 at 05:34:11PM +0000, Conor Dooley wrote:
> On Tue, Jan 09, 2024 at 06:28:19AM -0800, Emil Renner Berthing wrote:
> > Conor Dooley wrote:
> > > On Tue, Jan 09, 2024 at 04:02:01AM -0800, Emil Renner Berthing wrote:
> > > > Conor Dooley wrote:
> > > > > On Wed, Jan 03, 2024 at 02:28:40PM +0100, Emil Renner Berthing wrote:
> > > > > > Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.
> > > > > >
> > > > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > > > ---
> > > > > >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  4 ++++
> > > > > >  .../dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
> > > > > >  arch/riscv/boot/dts/thead/th1520.dtsi         | 24 +++++++++++++++++++
> > > > > >  3 files changed, 32 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > > index 70e8042c8304..6c56318a8705 100644
> > > > > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > > @@ -44,6 +44,10 @@ &osc_32k {
> > > > > >  	clock-frequency = <32768>;
> > > > > >  };
> > > > > >
> > > > > > +&aonsys_clk {
> > > > > > +	clock-frequency = <73728000>;
> > > > > > +};
> > > > > > +
> > > > > >  &apb_clk {
> > > > > >  	clock-frequency = <62500000>;
> > > > > >  };
> > > > > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > > index a802ab110429..9865925be372 100644
> > > > > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > > > > > @@ -25,6 +25,10 @@ &osc_32k {
> > > > > >  	clock-frequency = <32768>;
> > > > > >  };
> > > > > >
> > > > > > +&aonsys_clk {
> > > > > > +	clock-frequency = <73728000>;
> > > > > > +};
> > > > > > +
> > > > > >  &apb_clk {
> > > > > >  	clock-frequency = <62500000>;
> > > > > >  };
> > > > > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > > index ba4d2c673ac8..e65a306ff575 100644
> > > > > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > > > > @@ -134,6 +134,12 @@ osc_32k: 32k-oscillator {
> > > > > >  		#clock-cells = <0>;
> > > > > >  	};
> > > > > >
> > > > > > +	aonsys_clk: aonsys-clk {
> > > > > > +		compatible = "fixed-clock";
> > > > > > +		clock-output-names = "aonsys_clk";
> > > > > > +		#clock-cells = <0>;
> > > > > > +	};
> > > > >
> > > > > Did this stuff sneak into this commit accidentally?
> > > >
> > > > Not really by accident no. It turns out the clock tree has gates for the bus
> > > > clock of each pinctrl block and I think it's better to add this clock
> > > > dependency to the bindings and driver up front.
> > >
> > > Maybe if I had looked a wee bit more deeply I would've noticed that it
> > > was used there, but it's always good to mention the rationale in the
> > > commit message so that it's more obvious why you're doin it.
> > 
> > You absolutely right. I forgot to update the commit message.
> > 
> > > > Since there is not yet any clock driver the initial device tree for the TH1520
> > > > included the dummy apb_clk that two of the pinctrl blocks derive their clock
> > > > from, but not the "aonsys" clock needed by the "always-on" pinctrl. I thought
> > > > it was better to add this dummy clock with the only (so far) user of it, but if
> > > > you have a better idea, let me know.
> > >
> > > No, that's fine. I was just wondering why there was an unmentioned set
> > > of clocks being added. If they're stubbed fixed clocks I dunno if it
> > > makes sense to add them to the board.dts/module.dtsi files though. Where
> > > do the initial values come from for the rates? Out of reset values or
> > > set by firmware that may vary from board to board?
> > 
> > The vendor u-boot sets the PLLs different from the reset values. For now I
> > think it's the same code for every board using the Lichee Pi 4A module (and
> > probably also for the BeagleV Ahead), but it might still make sense to move the
> > freqency to the board instead of the module device tree.
> 
> Yeah, think so. Only temporarily though, do you have a clue if anyone is
> working on the actual clock driver stuff? Seems pretty Deadge?
> https://lore.kernel.org/linux-clk/?q=th1520

Yes, I am working on it. Jisheng passed me his work-in-progress based on
that original patch you linked to. I've been trying to work out an issue
with the emmc clock but it seems timely to share what I currently have.
I will post an RFC today.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
