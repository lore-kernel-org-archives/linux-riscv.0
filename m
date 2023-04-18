Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF873C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2xikMLdGp4nA7xEDzmmpUmvfMteDMEMZD7EmH31/dQ=; b=hubJf8nyuwtFBV8H3KzUL12k5H
	vHnb/lujnoh9BwNGl8D66WrsK70IU3HNmnM7pUFn4gV/b/Yjpg9Lmb48QrwD+h93Y40r30HUaw3s6
	/695kRNiB0M8k8BwCMjuV4cD1HVB9QWdcLS2RuQ5wKXc3OXdoHFDHBAPwaAwBgcDUJcsyB/iLDLBt
	JrSBbynYsKTVddEJ2KxO8bEbK1zjc94YP/4kDHnFp+98GPk8l2DRtilO5GJ4QYnqG/Qp5uGsb2vgL
	DfDe7kJX/RGMatrdzHv/QCKM/rw0nhFvn93bTZC4XU8S+Jz/RLOBNRoY1njiPlECfxr+TyDM/x7oI
	p1kWuygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pop7i-002whv-1m;
	Tue, 18 Apr 2023 17:28:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pop7f-002whB-0K
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 17:28:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1BE460AD5;
	Tue, 18 Apr 2023 17:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45827C433D2;
	Tue, 18 Apr 2023 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681838886;
	bh=QCLMTGp0pSAawzsOxfqUZWtyxa1SJnm6R5Qw5FlWiBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uajfv6Bwv+DD9Vq+CBn1cSZzOAhNjxs/u0hDkHONopDzprf3D+R802y8LyxP7Axon
	 qJHKI8fH26kJHfUplSOuPamB6lmAygGxhqpCxi2wBKQSmOnQB7v3uCAXossgh/KMPZ
	 INkYU72upEymEGPZSfFJrjTiLGPdQdH18tsrCXbu6+JMLz7ePZYzj1ruFDnsquBDJy
	 BzU8GbNffHY01LIbbPjRejT9+1bs2/yPPIK5lcv2xDNh/Asdq98ARGXs5mgcMHRzGZ
	 PHyFfBxhZjyco+9k0ioy5ObdPJTrLC1xvHVGcHljsKBRVkhd1ZVdF8YB+JjXsm7JTp
	 5lyv7LgnxzNBw==
Date: Tue, 18 Apr 2023 18:28:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add cpu scaling for JH7110
 SoC
Message-ID: <20230418-talcum-unthread-618a5bd2758a@spud>
References: <20230417063942.3141-1-mason.huo@starfivetech.com>
 <20230417063942.3141-4-mason.huo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230417063942.3141-4-mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_102807_175337_4D46DC77 
X-CRM114-Status: GOOD (  15.48  )
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
Content-Type: multipart/mixed; boundary="===============8346860600777577096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8346860600777577096==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YJMzqe/hzL7IbIYs"
Content-Disposition: inline


--YJMzqe/hzL7IbIYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Mason,

Just one minor comment in passing..

On Mon, Apr 17, 2023 at 02:39:42PM +0800, Mason Huo wrote:
> Add the operating-points-v2 to support cpu scaling on StarFive JH7110 SoC.
> It supports up to 4 cpu frequency loads.
>=20
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 17 ++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index cca1c8040801..b25e6d68ce53 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -227,3 +227,20 @@ &uart0 {
>  	pinctrl-0 =3D <&uart0_pins>;
>  	status =3D "okay";
>  };
> +
> +&U74_1 {
> +	cpu-supply =3D <&vdd_cpu>;
> +};
> +
> +&U74_2 {
> +	cpu-supply =3D <&vdd_cpu>;
> +};
> +
> +&U74_3 {
> +	cpu-supply =3D <&vdd_cpu>;
> +};
> +
> +&U74_4 {
> +	cpu-supply =3D <&vdd_cpu>;
> +};
> +

Applying: riscv: dts: starfive: Add cpu scaling for JH7110 SoC
/stuff/linux/.git/rebase-apply/patch:30: new blank line at EOF.
+
warning: 1 line adds whitespace errors.

Cheers,
Conor.


--YJMzqe/hzL7IbIYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD7TDAAKCRB4tDGHoIJi
0nCIAQCGgCe1FJP8wpMrSgS8zFRx/3XZ/tG/QuMA8ezQyFQiwQD9E+NV9PcHcbsD
Ws7d9iEVlnQj6SVvRbx4tpMKsAV1ew0=
=1AIw
-----END PGP SIGNATURE-----

--YJMzqe/hzL7IbIYs--


--===============8346860600777577096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8346860600777577096==--

