Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F173C83F0A
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9HSIv+Guq7ZxWENUpLIMPkfSf5Gpr0sVPlC4q696V4=; b=2TrTrjcpBBsiOO
	MkV6EbX3UbdOrOhaR1NyMlU9oQYFsnaQA1W11Qz929ZVIJlBF9023CyTUP5V1/xupx4Ueo2zrp3KC
	H2aXCmBVDzSMFV3zBel2GBPUp8dTibKlU3PfxCP5Cj3hpIVSUbbJ4WQIWc8VqKgKWx5JQ0Q8yZJ1h
	dOQTfe6Ax9YmhgaVws7Kg0J+8Rkypk6Yz7FdmeLckWeCGkVuZgIAv1C/U64ZErKTdGIOmed5h0qbe
	W8avYNYkelNOULBr2tw2Ks3rL3y/V21zlij0vaJ+t40xYl5qr4gOtTsNyf5VpxT7i7wYclyGI+pEW
	LR5c0YQ0dEzMTtT2poqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYS2S-00000000VBY-3PIi;
	Sun, 06 Jul 2025 16:16:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYS06-00000000Uww-1jxk;
	Sun, 06 Jul 2025 16:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dVBOorKuIT7UYPImY9pxxlDpEL+PzMlcki2Z/1f6+vM=; b=Yl3G8I36EZk21kav9ptyI4TfIe
	A86kSvBJn8nvMAwdSaUeVsanhcB+rF5RN5XTNm/2X9t1i6/oBRvT6I7ynI4trNGAk56tduh2wfU5f
	Vy2yeQL2p596JKquRzJxFMOyCmTKFEns5sEFDl8WdN+vnkcu+u8y/vOr1x3Oauls7u5g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYRzj-000akM-7H; Sun, 06 Jul 2025 18:13:35 +0200
Date: Sun, 6 Jul 2025 18:13:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <279a7a96-2161-4dac-a09f-7bbbe2596538@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
 <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
 <5023306.31r3eYUQgx@lukas-hpz440workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5023306.31r3eYUQgx@lukas-hpz440workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_091358_455521_7606C733 
X-CRM114-Status: GOOD (  13.47  )
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

On Sun, Jul 06, 2025 at 11:06:34AM +0200, Lukas Schmid wrote:
> On Sonntag, 6. Juli 2025 09:38:00 CEST Andrew Lunn wrote:
> > > +&mdio {
> > > +	lan8720a: ethernet-phy@1 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <1>;
> > > +	};
> > > +};
> > 
> > Just for clarification: The PHY is on the SOM? I've seen systems where
> > the PHY is on the SOM, and the magnetics and RJ45 on the carrier
> > board. I've also seen systems where the PHY, magnetics and RJ45 are on
> > the carrier.
> 
> Yes that' the case here. The PHY is located on the SoM and the MDI signals
> before any magnetics are on the SoM's Card-Edge. The magnetics are required
> on the Carrier board (e.g. a MagJack or dedicated Transformer)

O.K. great. If you need to respin, please extend either the commit
message including this, or add a comment in the .dtsi file for the
SOM.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
