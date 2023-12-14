Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7042FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlYZazJBf/9bECURYXauRUCfVC9MekhheXrEy2L9E+4=; b=vzCWOCiEEcpzBlReCbCN9Llks9
	2eCShhSjbKVUiwVZky571lBFV8UE2INcyDByrmb2QYU4nT1Ow1wWE0wwYJamJx5Krgi7pL4+b1hCo
	iWWRlxrijSlAHfyhvbYI/1pVK5S/Z31nXwY7d03SKV0m0HpVjJom+J1QdqKJ2FiFyofbndN0gWX6d
	VkUW0eXD2dNDUaeDKxIIzFTbFvYqq9x/9PBJa4xlibg2HgJJpw5n/dHVgZHobvYdS3WHMO6IhlEoM
	MVD/N7rhOOL0pi+PNzk/5DTT17V1ei4zbET1KT8AbFsCapMNSzLwR4kZ5cVsXVnkCs2FjjwGVDk90
	vbnTnAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDm3j-000SNh-2y;
	Thu, 14 Dec 2023 13:47:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDm3f-000SMD-2U;
	Thu, 14 Dec 2023 13:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4B1A1B81860;
	Thu, 14 Dec 2023 13:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03207C433C8;
	Thu, 14 Dec 2023 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702561641;
	bh=lWqoyY+Lp0x9QIy2h5s/P2Ib5HZKYH1QdBbOLtUFQsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/Diy8RFki0Xj0UHq3i2rCZfhaqQg8EttcvF9psMEeM0+YTNy7zkRYMakriJZiqLK
	 dBOBbHJ+2pqIQ0Qiwgg2Tr1V9wqcoRJR7PDuwBSk4mBYFvTth01psHiZwYVmPnOXFz
	 5ZxP23bDpK1suw9uvM+qoQSUZ5tw10ARjNfqk6zQtsFdG1PWOwxgbD2ZmqHv2CYbpC
	 9VPpcEJFmiFv05M30RH9pLf4nm5OPAT2tauPWu6Qol9Fq1zAhY/NLJC7PSJXfnbV27
	 uuzPsug4M8oVleSFbo6yHZdfymHCVUNOMf/YNt6auGzR7/YglzJO7oLpFmFiQT9mXD
	 5eH3JiIG3ZIhQ==
Date: Thu, 14 Dec 2023 13:47:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU
 frequency scaling
Message-ID: <20231214-junkyard-corset-d35b01bad69f@spud>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-2-fusibrandon13@gmail.com>
 <20231214111446.camz2krqanaieybh@vireshk-i7>
MIME-Version: 1.0
In-Reply-To: <20231214111446.camz2krqanaieybh@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_054724_082287_87F59B3C 
X-CRM114-Status: GOOD (  25.02  )
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
Content-Type: multipart/mixed; boundary="===============2550230450572392884=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2550230450572392884==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Bt0sbK2SeaAxN2v"
Content-Disposition: inline


--4Bt0sbK2SeaAxN2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 04:44:46PM +0530, Viresh Kumar wrote:
> On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> > Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> > another at 1.08GHz. Switching between these can be done with the
> > "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> > appropriately, with inspiration from
> > https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts=
/sunxi/sun20iw1p1.dtsi
> >=20
> > The supply voltages are PWM-controlled, but support for that IP
> > is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
> > which seems to be the default on most D1 boards.
> >=20
> > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > ---
> >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv=
/boot/dts/allwinner/sun20i-d1s.dtsi
> > index 64c3c2e6c..e211fe4c7 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
> >  	};
> > =20
> >  	opp_table_cpu: opp-table-cpu {
> > -		compatible =3D "operating-points-v2";
> > +		compatible =3D "allwinner,sun20i-d1-operating-points",
>=20
> I don't think you should add a new compatible for every SoC that needs
> to be supported by a DT bindings and cpufreq driver. Maybe you should
> just reuse "allwinner,sun50i-h6-operating-points" and it will work
> fine for you ?
>=20
> Rob ?

The driver can definitely just reuse sun50i-h6, but the binding and
devicetree should have a soc-specific compatible for the sun20i-d1.

That said, the compatible does need to be documented, there's a
dt-bindings patch missing from this series.

Cheers,
Conor.

--4Bt0sbK2SeaAxN2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsHYgAKCRB4tDGHoIJi
0llNAPwPlCtHYqdw3PHm/F9o63nh77wIsWE9SawYpIg6XvVYSQEA3ontbKuKxaUy
sMpsYI0c/7MsH2HbQPLjiFJVxobR5wo=
=L6Mk
-----END PGP SIGNATURE-----

--4Bt0sbK2SeaAxN2v--


--===============2550230450572392884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2550230450572392884==--

