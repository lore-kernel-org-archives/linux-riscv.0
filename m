Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2BF106ACFE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 00:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25mBgAPCRnAd7HdZVifvAqJB9Wl2yiH0uOiXqMpQOe0=; b=uqe6/xIjb1fEMW
	2aJ+uoLyFTc3SIGXiHfPwrQhPrKae9yTsknk/ufWBj1DIFY9YhD3CyK5UTqojWxjXtRrqBKRSPP6I
	Q7pEHtxrQEElOL8DWTJlYZa8EQ3+YlF1wSaQSUjKKObPp3NwhL5/AhSiUeYQxktaxdd6d1DsvPo7c
	DqMlehLRPlb991I5rzCa21lRWxuqng84Bmt6YfS+thdgGVBxNz8O1G/RqE6aR50Xg5y+GN4WLKMGT
	gbumHtZTDm10OqgwARVQgGbIyi4pneEXt7AOCVOHH2y9Jli8T/9ORMM4bwdWE7e+dCQZH6IssF5+a
	kmzVuIPr2zBEvePBgFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qFm-0000000Fu9R-3TUC;
	Fri, 13 Mar 2026 00:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qFj-0000000Fu8T-2pAh
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 00:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E43EA436F0;
	Fri, 13 Mar 2026 00:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53872C4CEF7;
	Fri, 13 Mar 2026 00:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773361182;
	bh=X/kBY42h2F53qu8QE7AbaKPKfnSDqElz1IdGpmh/fhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a12XMP5sfnB42RfPxKpgsQv5hq4zHDdIBjy5Q988JiS6XqmeILThiPKi3iPd6HY9f
	 UtFze1vbnxgCPxYscdJNs793I/dCtKLWq3pCt765jybYI9Nv6ihUSGdC/1jJnRP1uj
	 stVrbnCD4Zy/uhaomAXXU3ng0LpFnf0B+6b8iXR68pYW1w+c0226L0iNIt6Hu4YtA7
	 bCbETa1qz2JsOlTc3/mulGNQdTX/YNziQxWfnF9S8wk+0GPcYHvcYEXKudsu2ErGuk
	 3uZGreu35b4d988SKwPmSfyf0XtkIvIWQmG95uXQCnZP0KCZxhqHW5+A3Cty23+VJa
	 rvtNQMJ6NgoGA==
Date: Fri, 13 Mar 2026 08:19:40 +0800
From: Yixun Lan <dlan@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
Message-ID: <20260313001940-GKA407679@kernel.org>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_171943_781682_B45E141E 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Trevor, Iker,

On 14:27 Wed 11 Mar     , Trevor Gamblin wrote:
> Hi,
> 
> On 2026-03-09 07:40, Iker Pedrosa wrote:
> > Add Spacemit P1 PMIC configuration and board power infrastructure for
> > voltage regulation support.
> >
> > - Add board power regulators (12V input, 4V rail)
> > - Enable I2C8 for PMIC communication
> > - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> > - Set up regulator constraints for SD card operation
> >
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
> >   1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> > @@ -19,6 +19,25 @@ aliases {
> >   		ethernet1 = &eth1;
> >   	};
> >   
> > +	reg_dc_in: dc-in-12v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "dc_in_12v";
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +	};
> > +
> Is this the correct voltage? I don't see a 12V rail in the RV2's 
> datasheet, and the board's specifications only indicate a 5V USB-C input.

Right, this should be fixed. Please note Han submitted one version of basic DT for rv2
which I think that series will go in first

https://lore.kernel.org/r/20260310161853.3900605-1-gaohan@iscas.ac.cn

> > +	reg_vcc_4v: vcc-4v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_4v";
> > +		regulator-min-microvolt = <4000000>;
> > +		regulator-max-microvolt = <4000000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +		vin-supply = <&reg_dc_in>;
> > +	};
> > +
> >   	chosen {
> >   		stdout-path = "serial0";
> >   	};
> > @@ -92,3 +111,32 @@ &uart0 {
> >   	pinctrl-0 = <&uart0_2_cfg>;
> >   	status = "okay";
> >   };
> > +
> > +&i2c8 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c8_cfg>;
> > +	status = "okay";
> > +
> > +	pmic@41 {
> > +		compatible = "spacemit,p1";
> > +		reg = <0x41>;
> > +		interrupts = <64>;
> > +		vin-supply = <&reg_vcc_4v>;
> > +
> > +		regulators {
> > +			sd_vmmc: buck4 {
I'd suggest name it more generic and add a comment where device reference to it,
since buck4 requested by more than one devices, will make people less confused.
something just like:
			buck4: buck4 {

> > +				regulator-min-microvolt = <500000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-ramp-delay = <5000>;
> > +				regulator-always-on;
> > +			};
> > +
> > +			sd_vqmmc: aldo1 {
> > +				regulator-min-microvolt = <500000>;
> > +				regulator-max-microvolt = <3400000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +		};
> > +	};
> > +};
> >
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
