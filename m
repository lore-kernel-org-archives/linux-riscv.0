Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7647C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJhVodLEGottKQ12i0VkSRU7MuyT75Cw9QH9KBgNTlY=; b=kF97S2aFRnRpb5i3XIqGk3d3q8
	58MKu5y9D2YQOEXEGUjBYHjQ65JDGsDnu0jVsWoj3W3HtMfRouRvGat4GPtre2ANA2EgXPPJgf2RA
	t6MTWh4cD9FSIz2HsOibKKjK51JL2Y0qtCSI98VBglAWyXCX2YDBIcFKYyGUxDfU6T7bY6OPLxlDn
	6MOq0cBIJs8yICZGK2dgwPGr5Mdhh/8I3x6218lynvsXyfdaTC6v/ZTrYFzSYtPRyXa8QyVwWwwuC
	/WF1mJfEQitJ0vFO2MxDaIfeM8eRZ7egowWiyxCaWl7QvyxakGcMuiMO6IW5+09KCG57thWLmRbAq
	TNMhpw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xFo-00GVch-0Y;
	Tue, 14 Nov 2023 17:31:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xFk-00GVcK-2a
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 17:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F287611CB;
	Tue, 14 Nov 2023 17:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA62C433C8;
	Tue, 14 Nov 2023 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699983066;
	bh=jkdZ5mB8QhSCTtNuc3Z7qON1sLEsZWx5t6SxsjDMGrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/nqQqQETcc6iJBWzf7IQ80EGqqzYiyeoUkgDRfthRxuXU/cN0o8EA4tLfr/gCvu0
	 cxnOX3lXlWEaTok3f1T3B9mAFu0NV8pmCAxpqmX879b/Z/z69cOxJYFO9pSUFs/l80
	 c7CXKBucLPv8JA/x+y4unWR/JWxJADBLx0OmvyuC7sh4riivdIulLOkC4qvoePnA0i
	 yUO5/HgZxbAKEstTwaIPQ9UkcZbVWzRnABpFz8mTMZkmTzrHMKNOFn6ZQCFbqce+AW
	 OayixMJOiZRrapUAeARwyohnaCxTNgoLzBsh/+k+2RRJta8q2DjtEbpKCqtnPUE4iT
	 9Iul1XOM/goDg==
Date: Tue, 14 Nov 2023 17:31:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Message-ID: <20231114-grumble-capably-d8f7a8eb6a8d@squawk>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_093108_888156_7AD81981 
X-CRM114-Status: GOOD (  18.57  )
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
Content-Type: multipart/mixed; boundary="===============3293669269650731216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3293669269650731216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BObCPPDlTCtpWM3f"
Content-Disposition: inline


--BObCPPDlTCtpWM3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:20:11PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add clock generator node to device tree for SG2042, and enable clock for
> uart0.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi | 76 ++++++++++++++++++++

There's no need to create an entirely new file for this.

>  arch/riscv/boot/dts/sophgo/sg2042.dtsi       | 10 +++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi b/arch/riscv/bo=
ot/dts/sophgo/sg2042-clock.dtsi
> new file mode 100644
> index 000000000000..66d2723fab35
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +/ {
> +	cgi: oscillator {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <25000000>;
> +		clock-output-names =3D "cgi";
> +		#clock-cells =3D <0>;
> +	};

What actually is this oscillator?
Is it provided by another clock controller on the SoC, or is it provided
by an oscillator on the board?

> +
> +	clkgen: clock-controller {
> +		compatible =3D "sophgo,sg2042-clkgen";
> +		#clock-cells =3D <1>;
> +		system-ctrl =3D <&sys_ctrl>;

Why is this node not a child of the system controller?

Cheers,
Conor.

--BObCPPDlTCtpWM3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOu0wAKCRB4tDGHoIJi
0uT6AQD3FJYKLUrrVpL4tzEV3YskeSlnVP66eWfgWIZ+3O5aagD/b5dttSrtKFIt
S80P7AKBwUKY+5II2CtmlSZ4eep63Q0=
=4vEb
-----END PGP SIGNATURE-----

--BObCPPDlTCtpWM3f--


--===============3293669269650731216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3293669269650731216==--

