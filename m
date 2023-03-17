Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A8C7618A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbPCEglPwmXP+QlDOTKKFTDCv8mQkEFaKhXWHth1zUY=; b=LANPESz6ErL7kJ/rK4Uxa3/G6W
	9lDJ2ZurAJ5xrCyNCPE4sY52/PBu16pbhuF13AI7WSHKgAfLk0UL4+5LrLDe9Oqm5znFrKel9gRZS
	gqs2kMeHNZNt0pmXIytxVPlpG3/M8taqyMnaKdSS0PrZWfrP1JQZKz4KJ5wsQLa3zegxeoAZxzK1s
	ROJ+oPVvJPjsE6WM5idfUzvLjf5MBapzqsEnLlm3OCJmjAJGlE4R5kKi9LMd9rG9Fo/hUWFaUJmuz
	95cr0Fgn+7N4Y4J/TqK4CQiHCoX9j7xe3x8EbEQji9dIrnKbl4/3iCcnKl6CgMZx3OULdtylEU1kJ
	Z3KPBGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCuq-002l2n-0s;
	Fri, 17 Mar 2023 16:26:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCul-002l0I-2q;
	Fri, 17 Mar 2023 16:26:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6BDA9B82640;
	Fri, 17 Mar 2023 16:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4C1C433EF;
	Fri, 17 Mar 2023 16:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679070405;
	bh=n+6H66wvmHVetszVipZwJ8WpSZp/LWO/rZfwt6G25D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3T+CEbN1PPJHBZvsg+M2JGn9hwQhMaV7u4JlGn8ATJPIGNSNoH2gcKCAaevsenJ/
	 nHLPy+/URBOzBEGc+2dlvuPHhmQ29c09ByDVS3EYpviQ26uQf7w1vXa17H1Sqstevk
	 LUs5tG53uG3ShI645HN2CTjS07Z5HrX0JYJP8dnmSDFzlx7wgYrXef4Hv2X+eVisXR
	 NcegmW6Fp8RYKTHOlo3Fal06gCIN3rgHzBAU1lCHnQhuY5uvGjfBgckpxLlEUN0ezX
	 qUyzdo0oPIqsBP/x3tnehYRd3eZy1TVFdFj62BbdJIzyFMxSfg7die6JFlMRLnpqFh
	 c/UFTVCrDo1ig==
Date: Fri, 17 Mar 2023 16:26:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
Message-ID: <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_092648_216957_49D930ED 
X-CRM114-Status: GOOD (  23.34  )
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
Content-Type: multipart/mixed; boundary="===============4892708367207398828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4892708367207398828==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="caemCzIw84yTLOE0"
Content-Disposition: inline


--caemCzIw84yTLOE0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 04:54:47PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2023 11:21, Cristian Ciocaltea wrote:
> > On 3/17/23 10:31, Krzysztof Kozlowski wrote:
> >> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
> >>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> >>> dma-names properties") documented dma-names property to handle Allwin=
er
> >>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which=
 is
> >>> the reverse of what a different board expects:
> >>>
> >>>    rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expe=
cted
> >>>
> >>> A quick and incomplete check shows the inconsistency is present in ma=
ny
> >>> other DT files:
> >>
> >> Why not fixing the DTS? The properties should have fixed order.
> >=20
> > I was initially concerned about the risk of a potential ABI breakage,=
=20
> > but I think that's not really a problem since dma-names is not directly=
=20
> > accessed in the driver and DT Kernel API doesn't rely on a particular o=
rder.
> >=20
> > If there are no objections, I would switch the order in the binding to=
=20
> > tx->rx, since that's what most of the DTS use, and fix the remaining on=
es.
>=20
> Since we added the order recently, I rather assume it is the correct or
> preferred one.

IIRC I checked around the other serial bindings & there was not a
consistent order that all serial bindings used, so I picked the order that
was used across the various allwinner boards that do use dma-names.

Before changing dts files, it's probably a good idea to make sure that
the dma-names are not used somewhere outside of Linux.

Cheers,
Conor.

--caemCzIw84yTLOE0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBSUvAAKCRB4tDGHoIJi
0jtIAQC5YztceqmIGvPluC63a+GsGjGCM2eYgc2qAXbbyfbI0gD8DjessEmSarDl
+RuYj2SLZeX7nSQSHyucSUpd/ty+qAw=
=iCfE
-----END PGP SIGNATURE-----

--caemCzIw84yTLOE0--


--===============4892708367207398828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4892708367207398828==--

