Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06114606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W22Elf0u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Pmrp1zLQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2zbeFMT1AXCeOIWtoWj5rVP7dVkJb7zwlO8bYLCnu1Q=; b=W22Elf0uUna/CxmqX1gyEv/yf1
	1CCiyrk3hIhoQUTwiTAfSVFLE7lusKs00KapCryTKePypdMyXkLAIJ+wXGHn/riPArp5DXn9UfZ97
	+Zcaure8kjXXgjdrlHGq1omlnJC/hsNT8c9O831k+Jba3UxdOtDccQ23RAJ/96sSruwlumme5V7Zq
	JcJDecPkqgz9+5zNuJ4VYmZDPICDcFtdo8eVDw+WIDfh0gLMvSoon8aa89ZByCOK6C1Pp4+ZDbUvO
	MJwy3FP+vKwhSd/zE4eX5Pdl+XchPFlZi/JqXNu57PbYtHy4WBux8BhzccAQPfxyhXyEiO7ygyAT/
	TfZ96yvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhTd-000000039WY-45e8;
	Tue, 10 Nov 2026 08:45:13 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQhTa-000000039Uc-3pgZ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 08:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794300281;
	bh=sUto69GneM3/21N1G4JPtL94JDaDhP2/KjnoIeniECk=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Pmrp1zLQtx/5nIr+Y5iQ2mlQeMA1CYwGweLyEYJAh7qy5//x4lI597D4KpAhYE8R9
	 JYWJDdpP5cWGd++UMpi1H7c4UCla7UMwVQRmY4nP/MysInDHirSrCzz2nWdqGU1Hw9
	 Z16dzNPqvJF7dDxht4xbY3dBQJyEr70QYZWWPM18=
X-QQ-mid: esmtpsz16t1794300279t7e784a46
X-QQ-Originating-IP: RZyIr1RkrL/Ze4oQ+7VPt95YCi+emVuRwyceRtOz8jI=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 16:44:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8600440983646492188
EX-QQ-RecipientCnt: 19
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 10 Nov 2026 08:44:36 +0000
Message-Id: <DMRED3CXA5IJ.3FLQ7UFUTN0R9@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: =?utf-8?q?Fr=C3=A9d=C3=A9ric_Mah=C3=A9?= <frederic.mahe@cirad.fr>
Cc: "Marcel Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Vasily Khoruzhick" <anarsoul@gmail.com>,
 "Alistair Francis" <alistair@alistair23.me>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <linux-bluetooth@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
In-Reply-To: <20261110074607.363918-3-frederic.mahe@cirad.fr>
References: <20261110074607.363918-1-frederic.mahe@cirad.fr>
	<20261110074607.363918-3-frederic.mahe@cirad.fr>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MShfLn39PbN2APgg9dvNoZD0mnyzgy9+pWI3O+qvUle3b+72Hb0DW5jh
	+1gCDbjd+J6Io1XLGyUL13hxdi0ki1gq0pJ+KDFHfB/PxOpOwYu8ItIbIcCW+oH/XS3N/8S
	3frioK4ctTvZZ1UX8eLcegFjaLe/mfvqvycD1gu8jSaRR2aFiO5BRdO9lzjxgHppMC+uAD7
	ziP8QK5WcvnB7tTI3bvuspACf89XB65k2y7PIR1pThs9AkArppm5KfHtyBtVclpsdmmuDsU
	VfyfZ+CrsJ5HFDQSvsOwGPr0SC7Cx8kD5cirKakzwiqSbJJz/bXQC7S1ux7M6IYiJDppUXG
	ANqtTgZ4YadObYvv31A9sYRFxhk+xkksh1ydebGUTEx5tCTACBQfky8uSnAk4g4mb3ECQ7Z
	Wfcn+blF/AKUNaMCwoltRdF4AVbMwLdC+Y9A0czXxiroI062FNF25SVEzkburqCPIZ0rb1Y
	SDvnNcQXsZfqEcJfQZqNsofkskEnK0+QA9BoY5PXDDnQ2M1gJIxz6rz6hy3MNJ9IdxIqIVt
	qvtjCNE5yX45Y5n1adxttOhK0tdUexuAyG5kuwwKqNOiNWEj9UCzSfvKHOh4VBrGwaBK45w
	JJc0NSCtAriyyptUxrqLDP2f7imKpUM87cTaRcYv3hpFELUtMh5lFYzom+Os9jSh7yPahpC
	HUz4apRyc+iXTQXIWNZX5dwahwEi5dUN2OzsuSP+1uWt0tIDSnOXO6q3b+64VEvbjUVj3fW
	0Ukh+Fl7gJ6EBPBGyklAxHR47iHcGAwQb0ICJvb9+FKk9wpOGy9zJ7SkugIabFPSxaZCIpO
	yjY7F7HylA1FHqWzHNGlo44pMZXU6yETsISwUYavcdmGFtI3gvaAygBRxgOm/t9fCTenvUw
	zJw6SMh1JcNDXBKxlkTJFbV7B0wdAT5yeclqbUebsCH6Gg1y7KwgUIvumPMGAvxL/p4p3n4
	5iGR/MjDrnIEsmc1kLO7ofIJbFK878qTg+DGkYl7oOEXlktShgdkvraqlyL+Vm7P1ltc1XP
	qg8khqNHQFfsQQaP5ApNt4X6v0rK51vqbawxm53SB0KH1rquATxoPaiZmCIwiDZbMRWh7jm
	mpasRtzGCriChpZJ5QTUcw=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_004511_779776_48084C34 
X-CRM114-Status: GOOD (  11.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6862486774070025804=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6862486774070025804==
Content-Type: multipart/signed;
 boundary=18f11060a803f47ff361742ba8691daff4c6fbfbe03e1b9c377f4db00c26;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--18f11060a803f47ff361742ba8691daff4c6fbfbe03e1b9c377f4db00c26
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 10 Nov 2026 08:46:07 +0100, Fr=C3=A9d=C3=A9ric Mah=C3=A9 wrote:
> The BPI-F3 has an RTL8852BS module whose Bluetooth part is on UART2,
> with hardware flow control. GPIO 63 powers Bluetooth on and GPIO 64
> is the device wake line.
>
> The firmware config switches the UART to 1.5 Mbaud, so take the UART2
> clock from the 48 MHz slow_uart2 clock.
slow_uart2 is a programmable divider (MPMU_SUCCR_1), not a fixed
48 MHz clock. Its rate is whatever the bootloader left there.

[...]
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index 58035d886..280adc9dc 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -383,6 +383,21 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> +&uart2 {
> +	assigned-clocks =3D <&syscon_apbc CLK_UART2>;
> +	assigned-clock-parents =3D <&syscon_mpmu CLK_SLOW_UART2>;
Please add CLK_SLOW_UART2 to assigned-clocks and set it explicitly:

	assigned-clock-rates =3D <0>, <48000000>;

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_0_cfg>, <&uart2_0_cts_rts_cfg>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "realtek,rtl8852bs-bt", "realtek,rtl8822cs-bt";
> +		enable-gpios =3D <&gpio K1_GPIO(63) GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios =3D <&gpio K1_GPIO(64) GPIO_ACTIVE_HIGH>;
> +	};
> +};

--=20
Troy Mitchell

--18f11060a803f47ff361742ba8691daff4c6fbfbe03e1b9c377f4db00c26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavLZdCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9shwD/ctzYIBUZsuLe
dMFLfduAxPc7n4ySob06tzWvF4yFEtYBAO20Qqsvk4E1YLuWVcrPvgvy6Z/0EImi
egn5XeWhGVkK
=3dgM
-----END PGP SIGNATURE-----

--18f11060a803f47ff361742ba8691daff4c6fbfbe03e1b9c377f4db00c26--


--===============6862486774070025804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6862486774070025804==--

