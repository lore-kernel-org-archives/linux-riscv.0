Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE789C47DA2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhz9E9gX4X66LpQB7bCW0F72j1pcphULx0ArnzUnv0k=; b=YZdFZfb1Y0J88wgFNWvX2UK/Pd
	ZGuYEstYx1v4hnbkm65iN0JFQpejjDYM0eJxCI6eWzoBb9wAcLY1OOGLTOHi1NWSddNlhPlcMGNqq
	dpln9FpgtrQENshwmHwdAHJ0p5REd/KmNtb5LzJs56oPvDZcBikkcRcC3oXgEjjd/Cw8xDtnmVpj7
	GeOinxUoRq3TAQMCEd3Tiefaj3UBN15+Be64Q6agI434KMH1BaDpzkGzybin+1IwwzfF8GN2qNFJh
	iKkmakCknJ4WCyN2BJnXwGEYAM8ZJugqK3PvlwWAAjS8eHiqY5mrNjQpjTVHuvwpEQUUXOhxi9zN4
	V1ikDzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnBF-00CmW9-33;
	Tue, 16 Jan 2024 17:24:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnBD-00CmVC-0P
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 17:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 460C4CE19FC;
	Tue, 16 Jan 2024 17:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2C2C433F1;
	Tue, 16 Jan 2024 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705425888;
	bh=68zk3+ROqHddAWsTHPJT5uR90VY+a194t7rgF1l8zAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUDRWVpGnr/WN61mxuVJCg1zwkmOf45QyVfUSV4PfrowukX4tDpzQA7g3ARhsOZZQ
	 /Awj5cfcq/61w0EiIJbLx0+bG5tLs0yc6cFEFbm9AXP8ByIBenRigYpJs0lUdlq/mM
	 HRownv6XmNkNf2Wd3e2AG5hvYSoGHPcSOWxjqxgx/y+xAtXa7KQRo0VOI1StgGxuWd
	 3QWVrdoQ7bV/aW4/3TdBcLKDTPso0HR+TsH8BNeD+kP1L2V5MsiBP1Jk4mGpdVTKkb
	 IfSdp/+rHGmvZykZEIjADUeEBxImuAIHk/jpyJL60Z7lhGfv57A3/6gYB3x+4iTman
	 66ktziwXDmi8w==
Date: Tue, 16 Jan 2024 17:24:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: sophgo: Add clock controller
 of SG2000 series SoC
Message-ID: <20240116-music-luckiness-3220a9efdbbf@spud>
References: <20240116-doubling-fanning-2a46405942ae@wendy>
 <IA1PR20MB49535AA4F070E70BB5C9848ABB732@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49535AA4F070E70BB5C9848ABB732@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_092451_521373_916A061C 
X-CRM114-Status: GOOD (  26.86  )
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
Content-Type: multipart/mixed; boundary="===============2835500236636894238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2835500236636894238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r9tQTiOuQ4372n5L"
Content-Disposition: inline


--r9tQTiOuQ4372n5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 04:00:45PM +0800, Inochi Amaoto wrote:
> >On Tue, Jan 16, 2024 at 08:27:59AM +0800, Inochi Amaoto wrote:
> >>> On Sun, Jan 14, 2024 at 12:16:58PM +0800, Inochi Amaoto wrote:
> >>>> SG2000 series SoC has the same clock as CV1810 series, but the clock
> >>>> related to A53 is functional in SG2000 series. So a new compatible
> >>>> string is needed for the new SoC.
> >>>>
> >>>> Add definition for the clock controller of the SG2000 series SoC.
> >>>>
> >>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> >>>> Link: https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-datas=
heet-v1.0-alpha
> >>>> ---
> >>>>  Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml | 3 =
++-
> >>>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-c=
lk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >>>> index c1dc24673c0d..59ef41adb539 100644
> >>>> --- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >>>> +++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
> >>>> @@ -4,7 +4,7 @@
> >>>>  $id: http://devicetree.org/schemas/clock/sophgo,cv1800-clk.yaml#
> >>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>
> >>>> -title: Sophgo CV1800 Series Clock Controller
> >>>> +title: Sophgo CV1800/SG2000 Series Clock Controller
> >>>>
> >>>>  maintainers:
> >>>>    - Inochi Amaoto <inochiama@outlook.com>
> >>>> @@ -14,6 +14,7 @@ properties:
> >>>>      enum:
> >>>>        - sophgo,cv1800-clk
> >>>>        - sophgo,cv1810-clk
> >>>> +      - sophgo,sg2000-clk
> >>>
> >>> I recall before you mentioned that the Sophgo folks were considering
> >>> renaming one of their devices. Is the sg2000 the renamed one, or a
> >>> different chip?
> >
> >> The sg2000/sg2002 SoCs have one A53 core which cv1812/cv1813 SoCs
> >> don't have. I prefer sg2000/sg2002 are different chips, or at least
> >> an enhanced version of existed cv1812/cv1813. It is not a simple
> >> rename.
> >>
> >> For this patch, the sg2000 doesn't need to disable A53 related clocks
> >> like cv18xx series. So this compatible is needed to bind to this new
> >> logic.
> >
> >I'm not disputing the unique compatible - you previously mentioned that
> >Sophgo were considering rebranding the cvXXXX series of chips going
> >forward and that one particular chip might undergo a name change.
> >I was wondering if this was that chip or just another device in the
> >series.
> >
> >Thanks,
> >Conor.
>=20
> For your question, this is the rename chip I mentioned.
>=20
> This is the name mapping I have known:
> cv1812cp -> sg2000
> cv1813h -> sg2002

Great, thanks :)

--r9tQTiOuQ4372n5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaa72gAKCRB4tDGHoIJi
0g8eAP9HUpaP7XCMrJxxok89GSOryAQNXy7yCjtp5wJ3O8mY3AEAuG5OIjPyP8LX
pAAvqf/m4HKVviqiyTQZXUwq+3K2Mgk=
=2l75
-----END PGP SIGNATURE-----

--r9tQTiOuQ4372n5L--


--===============2835500236636894238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2835500236636894238==--

