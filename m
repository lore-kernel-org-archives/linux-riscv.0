Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EFAC47089
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA6V7EXwHtUBMBhJcoE77Asn09PPtHqJVUN4s313dkE=; b=bvTt+ZAEjufQByWdORTz6PoOQd
	17vhx0T8I6FG5kGUvpbDfeF7xi1WktuJVa1q2Vc3i+SqLOZ8XZlFUC8veGKmGT3dxyVBHNApvvmJR
	Koh69adRUaNYy2lf7djg7VMEVt4TGiY7fLZVN152gciAsVMR6URp/rN+7bYUIwqQ0aOf+TNRmY8td
	VE867nfg4eMSK7rLe5U1mBjVXNwMcDGMiR6ORnF/0xnslQtgCfETulHOVgabr7N/ulB3G2mfFgI05
	dmat4FKIdqPepPaSTHTH+9g/O1K2p3raPOfpVQsPnu+51EaP91AZkMsuONvE21RjVb2g3hiQcQDTx
	9/rkBPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xKE-006gjV-Hy; Wed, 07 Dec 2022 16:31:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xKA-006ggh-Gg
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 16:31:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21DD8B81F26;
	Wed,  7 Dec 2022 16:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948CAC433D6;
	Wed,  7 Dec 2022 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670430667;
	bh=XvN8Ts/aGY98RQx6MBG9BJW4THmGenJBnAKFdbfEvqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grIXzLSeWgfDquG6NpQcjVrZqcnCG3wwRYOCRKHk+W2cdIe+wUHnXajGIXMExoSS9
	 4PHxIHKXoVTplMw50ZbIhQYWJ6yJNUTH71wNzzo4Br+p6JnoorOS63spkZlZLQICtL
	 X1VNo0K1JuGlyyXUZxDX9vV8ShanaIEu15UqIkMK7CK6yyPd3vHSzSgm5GGrUFWw+a
	 btwsMh7jolMibDEHTgL7YFLgW2JeXbvrKYIguEjodrby6J1tvaQNrCOQB56Nt5frTp
	 kNsHp0KGyj9h1qRgN1pMVrZL1C/o9084Z2/Op6tsb6pnvg+8B1KxK/VG5wxfGbbefX
	 GPRQEoPYjduQQ==
Date: Wed, 7 Dec 2022 16:31:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	William Qiu <william.qiu@starfivetech.com>
Cc: William Qiu <william.qiu@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add mmc node
Message-ID: <Y5C/x80p8+6Tosk/@spud>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-4-william.qiu@starfivetech.com>
 <c0b84752-443f-d935-0ed8-c8ed4d212c2e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c0b84752-443f-d935-0ed8-c8ed4d212c2e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_083110_885449_75839FE2 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Type: multipart/mixed; boundary="===============6149157441774434925=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6149157441774434925==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nYE+9nWOMu6Q6hJB"
Content-Disposition: inline


--nYE+9nWOMu6Q6hJB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 04:14:53PM +0100, Krzysztof Kozlowski wrote:
> On 07/12/2022 14:17, William Qiu wrote:
> > This adds the mmc node for the StarFive JH7110 SoC.
> > Set sdioo node to emmc and set sdio1 node to sd.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2=
=2Edts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > index c8946cf3a268..6ef8e303c2e6 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> > @@ -47,6 +47,31 @@ &clk_rtc {
> >  	clock-frequency =3D <32768>;
> >  };
> > =20
> > +&sdio0 {
> > +	max-frequency =3D <100000000>;
> > +	card-detect-delay =3D <300>;
> > +	bus-width =3D <8>;
> > +	cap-mmc-highspeed;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	non-removable;
> > +	cap-mmc-hw-reset;
> > +	post-power-on-delay-ms =3D <200>;
> > +	status =3D "okay";
> > +};
> > +
> > +&sdio1 {
> > +	max-frequency =3D <100000000>;
> > +	card-detect-delay =3D <300>;
> > +	bus-width =3D <4>;
> > +	no-sdio;
> > +	no-mmc;
> > +	broken-cd;
> > +	cap-sd-highspeed;
> > +	post-power-on-delay-ms =3D <200>;
> > +	status =3D "okay";
> > +};
> > +
> >  &gmac0_rmii_refin {
> >  	clock-frequency =3D <50000000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot=
/dts/starfive/jh7110.dtsi
> > index c22e8f1d2640..e90b085d7e41 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -331,6 +331,11 @@ aoncrg: clock-controller@17000000 {
> >  			#reset-cells =3D <1>;
> >  		};
> > =20
> > +		sys_syscon: sys_syscon@13030000 {
>=20
> No underscores in node names, generic node names (syscon or
> system-controller)
>=20
> > +			compatible =3D "syscon";
>=20
> This is not allowed alone.
>=20
> > +			reg =3D <0x0 0x13030000 0x0 0x1000>;
> > +		};
> > +
> >  		gpio: gpio@13040000 {
> >  			compatible =3D "starfive,jh7110-sys-pinctrl";
> >  			reg =3D <0x0 0x13040000 0x0 0x10000>;
> > @@ -433,5 +438,38 @@ uart5: serial@12020000 {
> >  			reg-shift =3D <2>;
> >  			status =3D "disabled";
> >  		};
> > +
> > +		/* unremovable emmc as mmcblk0 */
> > +		sdio0: mmc@16010000 {
> > +			compatible =3D "starfive,jh7110-sdio";
> > +			reg =3D <0x0 0x16010000 0x0 0x10000>;
> > +			clocks =3D <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> > +				 <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> > +			clock-names =3D "biu","ciu";
> > +			resets =3D <&syscrg JH7110_SYSRST_SDIO0_AHB>;
> > +			reset-names =3D "reset";
> > +			interrupts =3D <74>;
> > +			fifo-depth =3D <32>;
> > +			fifo-watermark-aligned;
> > +			data-addr =3D <0>;
> > +			starfive,sys-syscon =3D <&sys_syscon 0x14 0x1a 0x7c000000>;
>=20
> This does not match your bindings at all. "&sys_syscon" is a phandle,
> not a number of tuning retries, as you expect in your bindings.

Additionally, a Link: to the documentation for where-ever these "random"
numbers that are being used would be nice.

+static int dw_mci_starfive_parse_dt(struct dw_mci *host)
+{
+	struct of_phandle_args args;
+	struct starfive_priv *priv;
+	int ret;
+
+	priv =3D devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret =3D of_parse_phandle_with_fixed_args(host->dev->of_node,
+						"starfive,sys-syscon", 3, 0, &args);
+	if (ret) {
+		dev_err(host->dev, "Failed to parse starfive,sys-syscon\n");
+		return -EINVAL;
+	}
+
+	priv->reg_syscon =3D syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	if (IS_ERR(priv->reg_syscon))
+		return PTR_ERR(priv->reg_syscon);
+
+	priv->syscon_offset =3D args.args[0];
+	priv->syscon_shift  =3D args.args[1];
+	priv->syscon_mask   =3D args.args[2];

Given the driver, the property description just seems incorrect and this
is actually the bit of the syscon that is relevant to the tuning process
(perhaps where the find the tuning values?). Without public docs or a
better description it is hard for (me at least) to know :)

+
+	host->priv =3D priv;
+
+	return 0;
+}

--nYE+9nWOMu6Q6hJB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5C/xwAKCRB4tDGHoIJi
0jk2AP9Do21/KrvdLHeize3eZ8BVU/CtKfDVdT3HO5AAwF0HvQEAkVhgyA+vpmpH
+06lNw1rMoHAqo+Po4oo80d5HRfPCAs=
=xHlT
-----END PGP SIGNATURE-----

--nYE+9nWOMu6Q6hJB--


--===============6149157441774434925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6149157441774434925==--

