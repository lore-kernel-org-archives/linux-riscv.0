Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A59EC02184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvP0Q0c3HAah+NAe4zgGi4KLSMCSHsJj5LCkMjiKDT4=; b=xGLYftZyDmGCwuHnfwl5ldtWuy
	7pTJTQkLlj8ZbivCaGuTjtd+IEyDVZpnScL8PgI82+MSd8FkQpwq3tLmBkCHxrnUV8QTyOeaV10Tr
	CyVAmPHEBCXnR9dYv1jxVUuusTZjxmvvJCSwwrRv8nVFniCh7n7IHq9ySF3r/xZsGXUjWXSvzG9WU
	5QUy14ctHSwNcG7VBTJtcMioslADW+8uzXEdbpK9rKx96uGlkHhBTm4x8gvG42jH15j32ZfeHhMRT
	OwjBwHAOMNOD+GRggBafdo3xXUUU/8b4obszrCJDZR8yVeKvPlMS7gp1t/UnfHBownddGkDRuLOi4
	pHrJbY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPPT-00000006FyV-1huH;
	Mon, 13 Jan 2025 18:43:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPN3-00000006FJl-3FMs
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 18:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B6DB5C5780;
	Mon, 13 Jan 2025 18:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E664BC4CED6;
	Mon, 13 Jan 2025 18:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793664;
	bh=T/zvm53Rrua2MvvtIf3s8XXzpqGQHMtiudTtoxeh1y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SR850yB3ztQ6i9gjnaEux9W97DHvN/kSRAlvUZFSCjeWw2K5npxpam5dyGCewP8f4
	 ZWZjgT5sKk8zCPwLSN+ljSdMcvxi1nfMzBONg7EBdDsDX+3EahGKqpcDiR6EKiicHe
	 8J3v3ohETXET0Hmf38KnrWSr1y+rURfds4znfv2Y/L8ForrUgTLtLmRzWcIz10qu0T
	 Tn0KbEoq2STjJDy4boQpAXWUAs8BqzWDeI5pYT+YBzhMl7Ko2EyqAgFFyGBLPsa9vS
	 qqEXxfkchs0uGPwBM9K7kYKoW7qzQrRb6viw3UwychDZo8AL2V+o4SwUS4tAGEhMnO
	 9B0tLHd8iv+mw==
Date: Mon, 13 Jan 2025 18:41:00 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/3] riscv: dts: starfive: jh7110: add DRAM memory
 controller node
Message-ID: <20250113-snipping-ebony-0c3f34773570@spud>
References: <20250102204137.423081-1-e@freeshell.de>
 <20250102204137.423081-3-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250102204137.423081-3-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_104105_852193_3F2B0126 
X-CRM114-Status: GOOD (  13.20  )
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
Content-Type: multipart/mixed; boundary="===============5624708259213641408=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5624708259213641408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3b4XuE3LPVe4Hvk9"
Content-Disposition: inline


--3b4XuE3LPVe4Hvk9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 12:41:22PM -0800, E Shattow wrote:
> add DRAM memory controller node (no driver), required for U-Boot to boot
> successfully.
>=20
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 0bc922b3ae8a..6948974400c1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -381,6 +381,19 @@ ccache: cache-controller@2010000 {
>  			cache-unified;
>  		};
> =20
> +		dmc: dmc@15700000 {

memory-controller@157.... cos you don't need the label and "dmc" isn't
generic. You're missing a binding for this either way.

> +			compatible =3D "starfive,jh7110-dmc";


> +			reg =3D <0x0 0x15700000 0x0 0x10000>,
> +			      <0x0 0x13000000 0x0 0x10000>;
> +			resets =3D <&syscrg JH7110_SYSRST_DDR_AXI>,
> +				 <&syscrg JH7110_SYSRST_DDR_OSC>,
> +				 <&syscrg JH7110_SYSRST_DDR_APB>;
> +			reset-names =3D "axi", "osc", "apb";
> +			clocks =3D <&syscrg JH7110_PLLCLK_PLL1_OUT>;
> +			clock-names =3D "pll1_out";
> +			clock-frequency =3D <2133>;
> +		};
> +
>  		plic: interrupt-controller@c000000 {
>  			compatible =3D "starfive,jh7110-plic", "sifive,plic-1.0.0";
>  			reg =3D <0x0 0xc000000 0x0 0x4000000>;
> --=20
> 2.45.2
>=20

--3b4XuE3LPVe4Hvk9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4VePAAKCRB4tDGHoIJi
0ionAP9g3QNWpTEXXRVRxXQxyhXILbo0elaHS7fbHjlmUM+d3wD/ahxKskN6nmMH
6TL9Ewl+FkykbOS93ADaxPwr7ODVugA=
=v8mb
-----END PGP SIGNATURE-----

--3b4XuE3LPVe4Hvk9--


--===============5624708259213641408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5624708259213641408==--

