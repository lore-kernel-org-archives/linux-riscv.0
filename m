Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1FBC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDM2iHhH761OoWD/TibVDmmfuN2JDmFKbsR/iTzA9zA=; b=4obOkgeJwjffXgFnFbJEeLEnGM
	4xnaOjcq6bnNopNHXzN6q+MKYtOcb8XWRgBf31pddrZoKzLxeLCaJ9s0U6dTBHyLRQnaU891Yg8UH
	DPWnB0xjOKRmgkdclLZejo4D2w0AvqU/RRE340/qUJXXe2uJAmO8X0gD50Gg7ljMZO0Qfwxn6Z3nr
	DHvXcgrPkAvc2IfbrJ60QhRbd510jAHfRcpaBxQENzgbq8kj4VC54yq7Ijd0/G1GYji9MZ4KBgj9V
	E4WI7X7rbbeY8eWMoSdpuOMYGlVk3Simp5dHuJgYJGbu7pUCfwWjV0LtJO+hPIXqt2/GN3axZ1wni
	Eckn89qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIt-00000004nBk-0hQn;
	Tue, 22 Sep 2026 08:56:43 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIl-00000004mya-2tCs
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790067344;
	bh=QJyVwtKSewGzHI+ReObmC25SE/N8bNoOAYhfVLfu9jE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QuAio5tWBhg+BdgaEvpzXWtWYbNDIr5FEnoloENdWghduZWQ7S0CaL0WkBn+PAWn7
	 qZAaSqS4SYIFw8GGiutUP2wQ9b2ziCunrPuW+uvx9R0LKUBJedEZmckB368D95OzJ2
	 0wwpHBiKHlcCNHhSP6M0UpAT/ybc0OtjPhsrQPvY=
X-QQ-mid: zesmtpsz7t1790067342tf3de2c6d
X-QQ-Originating-IP: S9iYn0j528t5SWdRrrbA6iz1oreq6FD1VOr214a9x/Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Sep 2026 16:55:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7129964714333372295
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Tue, 22 Sep 2026 16:55:38 +0800
Message-Id: <DLLPWUHF8WRQ.13YQTP32MG59Z@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Conor Dooley"
 <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
References: <20260920100000.3888256-1-amadeus@jmu.edu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg67aCHmB71aP9d79zNRwdmEAh/x94A3a6Tp7GCgtnNVY/a
	GGy94m5i7wEBa+PI2kF5jtaPgma3Jw9T9v6RE672gzfaSmMcPBjhG+ahf036ookhbHoPH6h
	M0aqlA/ksa1TatfS+t6PpBV73oxXdJFX9I6L5cwAEknxmHlEP16u3nFrNVDZIZy7UMMN6IV
	CQlDyrHbzvTrFuKQ+FlTys5QX55dYSNT3lLbOAcaOVy+P9dyGfOYKDCDOJP+ggSLCiIJmK1
	3WtnY5T5P0zDSdDUJmCRGKRci22G7ehtrQPCLZS8Ll2j/qjuV/vR8fpQrFk4OhsVk3EvuI6
	UfQnBqjcQkQCxu9cRgHBtkBoFohi4a7aM7XggccvchvwswfpJh8quzPo3xqukXAMgwLalDX
	EquMofPWnaAQd0hjmXUd+nW1Ya6+kFhfwclcBRJTfxgylszQIakHNYOH1KyZEGcb46Ys0pU
	0Vog4d3XvBJ8QV8NiCrRXxkqcfalbZMHSl3nXquX+rTQY3vVYVXMpwamwb0kmUWaIugcN3r
	MuagT5K+a84lBi6UvesMrszu4ylJBtkeyLPcV765VijNKFenvO5FEJ3GMYEtS9BV6POULCv
	SNHeH1aVA5TD49KqZ1VwioPg2eRgXgmkXFZHjdobWua5XFZL/WqB2te28YZ1vaqElgyXHWp
	cG1rebj2mO/V8Rj2lwGcZDM1B0n8hmJ5smij2wHUBHIRj6H5I4hGZKSQDaAsGGkCyzZt/oj
	6BgzVg7HVV3M4zMgTmV2Ehji7tlRRwMWexziYDCoVzry1ykOY0y6trqmG96OsFfsDCMGWLw
	Km9B1T87smOjGLNde1ysH6pE/L0Lljzk+gpvrbA/At0q33EDNeaIQ3l1n8IWEP2dG//v65U
	I2v9wlxjVooROD9Z0Cy1zwt5m+A4/sCatNuigThgclt4Vg5Fv5tPH2KMW1wRnqERdJuWEJi
	/jTN4g/ZCIWuzAq0Zj8Crc2fN4AT+OdhBijtxgS9b2NIoeQCRpsd7/+16g5uAteVHkXzm9q
	4MrQW5bm8zZyaIRPZxF9sFDy81bwQ3Zi9kklffADEQzsgtCf6EMvY4uPLGZ6OScKvVL9OEE
	A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_015636_641470_71FDBBC7 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: multipart/mixed; boundary="===============7478914754122556570=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7478914754122556570==
Content-Type: multipart/signed;
 boundary=d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 20, 2026 at 06:00:00PM +0800, Chukun Pan wrote:
> The EEPROM on the OrangePi R2S and OrangePi RV2 stores the MAC address.
> Assign it to Ethernet, with eth1 having a MAC offset of 1. Remove the
> Ethernet alias to avoid U-Boot patching incorrect MAC addresses.
>
> [...]
>
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -16,8 +16,6 @@ aliases {
>  		i2c2 =3D &i2c2;
>  		i2c8 =3D &i2c8;
>  		serial0 =3D &uart0;
> -		ethernet0 =3D &eth0;
> -		ethernet1 =3D &eth1;
>  	};
> =20
>  	chosen {

Where do the incorrect MAC addresses come from? Linux prefers a valid
DT MAC over NVMEM, allowing a bootloader override. Could we keep the
aliases? Removing them also prevents intentional ethaddr/eth1addr
overrides.

> @@ -66,6 +64,8 @@ &emmc {
>  };
> =20
>  &eth0 {
> +	nvmem-cells =3D <&mac_address 0>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii0>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -90,6 +90,8 @@ rgmii0: phy@1 {
>  };
> =20
>  &eth1 {
> +	nvmem-cells =3D <&mac_address 1>;
> +	nvmem-cell-names =3D "mac-address";
>  	phy-handle =3D <&rgmii1>;
>  	phy-mode =3D "rgmii-id";
>  	pinctrl-names =3D "default";
> @@ -129,7 +131,7 @@ eeprom@50 {
>  		nvmem-layout {
>  			compatible =3D "onie,tlv-layout";
> =20
> -			mac-address {
> +			mac_address: mac-address {
>  				#nvmem-cell-cells =3D <1>;
>  			};
> =20

Have you tested with AT24 and ONIE TLV built as modules, including
network-root boot? Without a bootloader-provided MAC, Ethernet probe
may defer until these dependencies are available.

--=20
Troy Mitchell

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarJCig0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv2U8BAJ9HtLWnl55CiMGdaDRYSZReiOVteADUBzeJJoQK
JuYEAQCgs2kWGxqs5Ilk5rGt22lx7egm/u1lHicDhhiCJ7SiAQ==
=TcPt
-----END PGP SIGNATURE-----

--d72ad57d5253791581f049dab24561afb713182c6bd228dc2826c5d750c3--


--===============7478914754122556570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7478914754122556570==--

