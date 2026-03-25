Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33B0109E52F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 23:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8yvwsKHWaugseBRUuUzm3JjQ8+L9DapNgpV8lnYVeQ=; b=3WmtIcgA8+Y23Q
	lWMKyLRMKUS/9Xmfh56rgPmq9CQL4tGBooLvvhDU2cqEDbPIqLjAxRfx12pGs0XUckAEJVUEOmhtj
	IIreDg1ZoMI69gGfNBd/hFaQ/AtLD2GF13W/6A5yktaKwdLKISFPb0Uh0KiUQXh1WFMpMtkWX9sXZ
	BhQb0/WelIeIu4Q9ZSaYrMBnStsHobPR7rjniyKA4MJohvo9baOwdcmWoEvb6H0r55R/ZIuM2q3FQ
	YemYZ5OhI5MfCZgeCVfe6aPNzJIgZgijqbkwU6B/1MewNKORfna2JU6Z99S4eDzH6foFTrCyqOn2s
	RM1mDu5Ro/m3sJqKNHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xxo-00000004S6F-27nx;
	Wed, 25 Mar 2026 23:48:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xxn-00000004S69-1JRm
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 23:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54BBA60053;
	Wed, 25 Mar 2026 23:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856FCC4CEF7;
	Wed, 25 Mar 2026 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774482518;
	bh=nvy92Lzp/GDB7hdawZwNUt/EDzG9tQBtTUqoo+26wnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOFlObcflnSRjDlEvvzhmiprS9LEnc6Xq1FuQezugr9nHOp+UEduDF3FQd+jBa/97
	 AtrCujsUfIgrrxIdJE3/BWHqIU5P0ESqn7L/fdLNL++qibpAUYNB2dJu8/1xvT+Q67
	 QavC+g98T6qq/9Hja6mG95636vJ2bkfCiZoVwesItqxknxEdlwhl0+W4JLOd7fCVrw
	 EvGFkiUekNaPA5sS5IgtKB1dXUioHjJNIkWH+bTTOK1Glp0pnwbG7nVKNL2TmpswLl
	 NjhRhqfnTB/45ZtArs8w0xdaL5c1FRkG/91vGRoER1eB1YBKcYss5tVLP6qzRfsgCS
	 +qF/TWaUeB91g==
Date: Thu, 26 Mar 2026 07:48:35 +0800
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: add P1 PMIC regulator tree
Message-ID: <20260325234835-GKA777612@kernel.org>
References: <20260325-02-k3-i2c-v1-1-a793776b88bc@kernel.org>
 <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org>
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

Hi Krzysztof, 

On 14:54 Wed 25 Mar     , Krzysztof Kozlowski wrote:
> On 25/03/2026 10:56, Yixun Lan wrote:
> > Add the P1 PMIC's regulator topology tree for pico-itx board.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> > This series try to add a regulator power tree from P1 PMIC,
> > the PMIC is controlled via an I2C interface.
> > 
> > To test this patch, it will need the I2C patch series [1]
> > 
> > Link: https://lore.kernel.org/all/20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org [1]
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 185 +++++++++++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  11 ++
> >  2 files changed, 196 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b098dbd0e7a1..5b59c569dbde 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -23,6 +23,191 @@ memory@100000000 {
> >  		device_type = "memory";
> >  		reg = <0x1 0x00000000 0x4 0x00000000>;
> >  	};
> > +
> > +	reg_dc_in: regulator-dc-in-12v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "dc_in_12v";
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +	};
> 
> This is a pointless supply. It's non-controllable and serves no devices,
Yes.. I thought to describe a more complete regulator tree, it just
shows more information - e.g. from $debugfs/regulator_summary

> so it only bloats the DTB and slows down boot process without any benefits.
Ok, I will drop it then
> 
> 
> 
> > +
> > +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> 
> This is even more pointless because there is no user. Dead code.
> 
reg_aux_vcc3v3 is used by various devices, but I can drop it too,
leaves till there is device really needed..

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "AUX_VCC3V3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +		vin-supply = <&reg_dc_in>;
> > +	};
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
