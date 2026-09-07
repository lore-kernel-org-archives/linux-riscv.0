Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AF0C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM88YZTc7S+h0WXjDWnk/OcMBcYudgS7ZtJ3XQDBk6Y=; b=JV0WEEjGdBLclVrqYiHJ3D6+eD
	wbrVb/p86rB5HvI/PCEyx7ZFXM7twD4+jsZjcwdbqVBuvo+IK0iP2Gx22oKWEItGOszHO4lgRH7or
	f70GExnyZMQoLkqJqgSzyqbjLUxNFHVpHYre0wanM2MmepjjVDLarwaIJWEwR0PiGtps5mNaR/suY
	23ELNC96QjhpjOpXCrSJMzhK4UoHmMclppHEv6YQh3owJtLbSoniY3+Nakeckw7zfWs/z2pZdN+Oa
	e+AkrLYyoBpsJ3Uv9mN/Chxxbva1hjldOI3DZl9c0beRw5o5KohQx9j7ISt+m4EoI0FE3JaKx5G52
	9+l2OqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UwB-00000006IW0-0B42;
	Mon, 07 Sep 2026 08:42:47 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Uw8-00000006ITX-0pTk
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 08:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788770550;
	bh=yHCVeW/8VwrYJ68Qkewz1g1dKX6qVgzMZhqZvnvGTp0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NjiMJ+SYes74uePdnQ7Zhe82jEUMfGwy/hSLQO+LbBibi6OyDzO4MRkeHmNSyICiP
	 7IWfTYCiFYKCK79TH3/bk/egYB7HDWJPrAykW9oKgaqGYIhbHjGB2ROLVPirLlvJDo
	 kCjItFpl2BbRxdJWhiZM53rx1pQrAR+G5385f2q4=
X-QQ-mid: zesmtpsz8t1788770544t3ba04c59
X-QQ-Originating-IP: ij1MO0uxI1//XoyXbOGLzQihrsJbw3343CI25+CyBHk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 16:42:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15574196219480591680
EX-QQ-RecipientCnt: 20
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 16:42:19 +0800
Message-Id: <DL8Y8HJ75OUV.2AC7IAYJ0UB26@linux.spacemit.com>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com> <20260812-b4-spacemit-k1-usb2-v1-5-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-5-f28cf29e522b@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OFoXdVIInG+RDtkto4OqsOWYRqY2Uy3kymiablynzo66wsKqzKLeMG3V
	h3TyAUmxulv6YB92hisnG8Ahxt5NgYaqs0NCuutnKBN76/18wK3W4mXKE7ha3+1sFsltsqc
	+ED2A3jDnZBHxGyv6nRawXxey8tLtVIY4bGrxlQtc5P9HriKOM7oV5HyUA8tOCjY4u2fg90
	VxgZhJyN7GoyWFZmPiY1pJ3USDe5vaBuwFQuEIo8ldzFy/BiYj/Y/agC2crVAXAifSL5+Wz
	ODpQoY0plIoR6zGbtNAMQes2G+ijJFiirDdUSg4X2ELuhgKrLoE2nyHHSqBbRU1U7xGol3X
	u3HhcB6KAY0q/SFmzEbImJ5Q5Coo0Ey5DN3p+ZrbNUsDLtYScn0x7uaK2PbQNoomIDtKB2B
	A+eQfYO6sXW5Dq6X9apskZvOHsVqfrMYl6V+kvHbxF8zwnkXG+i3AwNQ/lOu/otH6a3n5LF
	E7I14bghSBijsy/KHIyFcdgroh/+A19t1JUrSw0VN5/0+TRJvFRHCUHwQLCRAfjK8fwd1Ce
	VyWZGGMaRrd8Q9FMnfGV9LPPdh5uOEO/I7ndxV/fn7lUKEAys6NcK7T8D6twyZ4Q4imOx8S
	Fi6DeBTtrKzSLSjRMhT48nSQigli+qLzkThR29PwGgQsOlRb7Rvxw/5R84aX24bl15niPcY
	A3TuyVOGfZoltmFEmVrUlrHsyzh2I6R9JZruoeacJFwPhfw/Q4O9YcGUDZDTqPy/OjJLqLe
	vbJRb7DTxMrU/T4eEDhgb1OAEwKgF3PcbR3QgSmT4CSToX6O8flUnSGRSFtLzT84omPGgAS
	11y6c0id2MfPPzmY/ZrdbD/dLRtdEdKCBzMp6tDv9QpF6PiqnSqIEorQ20srbZzYcaq0Iy/
	oig8wZNAQfxJx1ZezCxC2cBGzbp7tezLmpCWUuIv14MGMoSedOkB17nmcr7e1/3Q+lnCVuG
	22WLerJRClpSD2bqUcN/Uu08zSsxWwwf1SkYqRAkTUhmRH8JOQemdMy53KZ1mFy7IDHc8xh
	S5ENixmlWLXR0RneYxgnr63NbZfbB6bv9I7z6uUn5AwJQe2TCRbL4nYtibRvVJinWkTgyLL
	EaziIL2UmYW6Neg7Nbu1P11OVSQYMFOfg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_014244_925777_77ED4AA6 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: multipart/mixed; boundary="===============0203973522880660806=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0203973522880660806==
Content-Type: multipart/signed;
 boundary=45e5895e4c3e82e45f3be96fceae5c1f0b830969d7cc94f6648371c4801a;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--45e5895e4c3e82e45f3be96fceae5c1f0b830969d7cc94f6648371c4801a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 12, 2026 at 5:26 PM +08, Junzhong Pan wrote:
> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
> mode by default. This port have no VBUS supply capability, thus host
> mode only works with self-powered device or hub. User could switch the
> role in sysfs.
>
> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
> support cellular modules.
>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index 72f77e9edd63..fd0f96262009 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -350,6 +350,22 @@ &uart0 {
>  	status =3D "okay";
>  };
> =20
> +&usbphy0 {
> +	status =3D "okay";
> +};
> +
> +&usb2_0 {
> +	status =3D "okay";
> +};
> +
> +&usbphy1 {
> +	status =3D "okay";
> +};
> +
> +&usb2_1 {
> +	status =3D "okay";
> +};
> +
>  &usbphy2 {
>  	status =3D "okay";
>  };
Could you keep the USB nodes in the same order as in k1.dtsi, with
usbphy0/1/2 first, followed by usb2_0, usb2_1 and usb_dwc3?


--=20
Troy Mitchell


--45e5895e4c3e82e45f3be96fceae5c1f0b830969d7cc94f6648371c4801a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap546w0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvvCQA/3TMCabR6SOxIQsLp3SeFZYsrwhnszx/dAlUR50L
2rc1AQClb0UwfcFZC4MPdfk85Rg2JoRIAwKQFKP//cnSYMzhDw==
=IXf1
-----END PGP SIGNATURE-----

--45e5895e4c3e82e45f3be96fceae5c1f0b830969d7cc94f6648371c4801a--


--===============0203973522880660806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0203973522880660806==--

