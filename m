Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703BBC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rufrO3SosVB8BQwRKoc3p0K7D1O7xECLTY+5dVoKF0k=; b=cPz1MzKxQG+k5e
	2oFzpaap3VhCvBRiX6rn5T30PreJDnD0qfADYIjg63NiLf1gfN8zz2lJqis6UpsCIK1nRyFbIEBg8
	fFLxhhz9SSrLW+wpoYwUx2U+MLp3RdUeY5jW/w7MbNSOsaXdCGMGTCwuQRdWuv2QQffnIQafMljbA
	kxqHQwHOEEQeP0dpXKP/ev2zYOgrz54mJNDq4Itx3U1pdwC3IIjb4sYZYW9BQwuCrmUMLTSUYrP9E
	z8DnM2/+WS5x7SeWrCyIP1xBU0exne4bMahNS+HFTt5/JW2Noq1zYXMERmELAnONz54pU/84DCW6B
	5514ceGPdomHqdy0ghbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjjo-0000000GKN9-1t8M;
	Fri, 21 Mar 2025 21:17:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjjm-0000000GKMP-216z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 21:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=9I1UFRdpTQORdgr7JFOGekbkH0vyOzdoO/6a82DByUk=; b=PL
	4SZiXhSRtaDXCa/X5vPcQA+OKp1MG594XOOAMZye6xybAFFrxnFUBJOSlyGV4ZQ06509oIl6JrUGB
	kWm8bptJMhaxP64fxjvOFZ0oQkzLr0CAqMrGb0lFt3NSVkkz/xH3/Je14iIPgMncOosy6yuNNGG57
	4r22yXvEXLxjNvw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjja-006em6-2R; Fri, 21 Mar 2025 22:16:54 +0100
Date: Fri, 21 Mar 2025 22:16:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 13/13] MIPS: mobileye: eyeq5-epm: add two
 Cadence GEM Ethernet PHYs
Message-ID: <905d367f-ff06-4a3b-b410-1e3c65e31f54@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-13-537b7e37971d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-13-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_141706_519769_BF94F96B 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 21, 2025 at 08:09:44PM +0100, Th=E9o Lebrun wrote:
> The Mobileye EyeQ5 eval board (EPM) embeds two MDIO PHYs.
> =

> Signed-off-by: Th=E9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 26 ++++++++++++++++++++++++=
++
>  1 file changed, 26 insertions(+)
> =

> diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/=
dts/mobileye/eyeq5-epm5.dts
> index 6898b2d8267dfadeea511a84d1df3f70744f17bb..20dfc85681bb03330981ca0f1=
1b2edfff3fa57bc 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> +++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> @@ -21,3 +21,29 @@ memory@0 {
>  		      <0x8 0x02000000 0x0 0x7E000000>;
>  	};
>  };
> +
> +&macb0 {
> +	phy-mode =3D "sgmii";
> +	phy-handle =3D <&macb0_phy>;
> +
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		macb0_phy: ethernet-phy@e {
> +			reg =3D <0xE>;

The DT coding style might say this should be lower case?

> +		};
> +	};
> +};
> +
> +&macb1 {
> +	phy-mode =3D "rgmii-id";

Hurrah.  A correct rgmii phy-mode.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
