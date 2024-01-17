Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95FDC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8HW4gCZbxUKmNgm91qMsrMsE97PwRHe2Ul1BkfvpmA=; b=2Tb9YAKJ6W8MUJ1JvDN6iavjfx
	HyOheFdj4gLT403qgJ5i+noA4PEJIJiCwZLnZZEwNjkkpC64ZvBT141obWAPcmgURJmmOf1xgue6A
	UDrbiyuRyRG1+Y8qtU+20G/SAVPo+j4b/1IgvpTmh8t70QCMMR1c/EklelTkB9aEOM4qr0rAyR8K4
	0oKOcscHmYVHP3GQbxjYFM9TP5WYk6b1liwYurVDzRpE0EBQXNjziQAcCABV8Rne+XYeEuU7Dj8Zg
	Y6WXTmLCCywbLq7dw9GtWYxSV41sxKUUbCTHZItTxb+92PQe8ca2V3tKBJFwQ/u9CIkTKzCBiHxD7
	MOtp9JPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5Vv-00GDjK-2D;
	Wed, 17 Jan 2024 12:59:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5Vt-00GDgA-0y
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 12:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B17ACE0A16;
	Wed, 17 Jan 2024 12:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A2FC433F1;
	Wed, 17 Jan 2024 12:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705496362;
	bh=vTROU2jcU9nWu+CYX4jqFbAAujvImlfaJDPY2q8o8Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVmsQiohhFLbzEQ+55oJIC2vG/AfBFQp+crYO8KcUBSUXbSn/n2rgGYe131BHgJ8N
	 sg6NmbnJEMvp1ENbKLpdK/6Ykpt6K+f5/fOELRfltkioAezyQd4ghtkGkO1/5dwvbT
	 x5B7WiPDdSV8YtcOntlAvvEsVKgPg2tlv3NDv+47IS0LxntC70PqL2HzvDXBup5uQB
	 A/ChkdwtGpnXEnaR2ANhrdQ1gu8tilKkpJhowzmX+NAAgbZ4BjutJ+NvS40WACVda3
	 NdFW1Bzn06aSa5tdM7U0wqCgmPM4tkmF3sFFZkbchkVPLkxkjUmiQsi6MXsLO1wraE
	 ThhoM1oS0qliQ==
Date: Wed, 17 Jan 2024 12:59:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, inochiama@outlook.com
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Message-ID: <20240117-turbulent-sustained-bf960186f7cc@spud>
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com>
 <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
MIME-Version: 1.0
In-Reply-To: <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_045925_541171_FEE55CF6 
X-CRM114-Status: GOOD (  17.26  )
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
Content-Type: multipart/mixed; boundary="===============5158143225957190960=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5158143225957190960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ST0BWaOiT7MOC+eD"
Content-Disposition: inline


--ST0BWaOiT7MOC+eD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 08:44:12AM +0100, Krzysztof Kozlowski wrote:
> On 15/01/2024 17:06, Jingbao Qiu wrote:
> > Add the rtc device tree node to cv1800 SoC.
> >=20
> > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index df40e87ee063..66bb4a752b91 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -119,5 +119,17 @@ clint: timer@74000000 {
> >  			reg =3D <0x74000000 0x10000>;
> >  			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>;
> >  		};
> > +
> > +		rtc: rtc@5025000 {
> > +			compatible =3D "sophgo,cv1800-rtc", "syscon";
> > +			reg =3D <0x5025000 0x2000>;
> > +			interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&osc>;
> > +		};
> > +
> > +		por {
> > +			compatible =3D "sophgo,cv1800-por";
>=20
> What is this? Why is it here, how did it even appear? It misses unit
> address and reg or is clearly placed in wrong place. It seems you
> entirely ignored out previous discussion.
>=20
> NAK

It doesn't pass dtbs_check, so it's automatically not a runner. Please
make sure that your series adds no additional warnings at dtbs_check
with W=3D1.

Thanks,
Conor.

--ST0BWaOiT7MOC+eD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZafPJAAKCRB4tDGHoIJi
0iSTAP9PWEFPH4zQ1xBK8WJilwJJ9LXJX6NS+x9taovIstROjwD/eoiJGotb3Uyw
fZm3S1Pu5lHW4CRa4GOtJs500WJuZAk=
=353h
-----END PGP SIGNATURE-----

--ST0BWaOiT7MOC+eD--


--===============5158143225957190960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5158143225957190960==--

