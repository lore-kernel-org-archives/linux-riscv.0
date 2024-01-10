Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6363C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRecV5S34fHPSfxO0uYSnx/8txPWv9S0K6uC83dibP4=; b=gPQY25PfdQ2szou4H2MMiKNrlP
	Zj8WitG52gTzjKH3+3rWozXRwmrCBE3rDO9EupPu9X/XploNgfq8NBKAgJPBoRxTD28MARBzRAEUh
	56u4crMY9psluCO4PLAtOWLtVrCW4iyki55jVjPEXC9INcagW0v613gB8i9q2M57mweLFEUM3CfHc
	o2Jf1V+ZV8QHzNAqL0Wg6kWIZdDzKZddttSU13fSgkGuteM1r3JuGTu+sT5C9jE69qAyEuC7smbhu
	NmqBPfzPuR94a8gWVOegkeZMMsJX77wuf3AgbF9w5z1F4Ma3SxIIsvbe2hayVmkfihas/od0a9P0E
	22TQfNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZ4y-00C8ZC-0g;
	Wed, 10 Jan 2024 13:57:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZ4v-00C8Yd-1A
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 13:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4B1C5B81D6A;
	Wed, 10 Jan 2024 13:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DB3C433C7;
	Wed, 10 Jan 2024 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704895026;
	bh=KX4nMw3GLOvc32C67PKcjUg1rWDpL+ovEal4aND4JEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hjet6GO3YR2W/KNak5Dfzl4DlIFe81vwMyh5cdGSuKAmJo1bsESDB8fTLfmFUi2qL
	 UgYjMA/dOQ79uKwHJHIA0N7ZPqo2zNGyamShnHfn8rrTIFZm2kgHGG3OiBj1aBLVr1
	 IshXzjOubebWFuCpULUHCd5yZCFi047L05OSWtdYA/Ev0oYyHbwoDeaEaExYTNPGfs
	 v43xRDSRL1qe7SSNUaNL6iiOw9b5MPxWvdrUfsXo5cBkGQMMTTh7C8hY6zxm6loNlO
	 Ozuuv8aCoOBsjXQtL8M3Bf6zDth0/5iLlqi/J8NA8jzcaWZjiFlq3pHuMsMkp5Hhnb
	 jE99hI63dNV6A==
Date: Wed, 10 Jan 2024 13:57:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v6 0/4] Enable networking support for StarFive JH7100 SoC
Message-ID: <20240110-quaking-unlisted-dcae7229a9f8@spud>
References: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
 <CAJM55Z9tKQ_hpxrGUq1Rx1kxzzs-dyd=4yT1z=8B7KQ=CZ4mjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9tKQ_hpxrGUq1Rx1kxzzs-dyd=4yT1z=8B7KQ=CZ4mjA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_055709_532720_86BE961A 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org, netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============9194185004369152548=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9194185004369152548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tCGlZoctadBRtAPJ"
Content-Disposition: inline


--tCGlZoctadBRtAPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 02:38:26PM -0600, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
> > This patch series adds ethernet support for the StarFive JH7100 SoC and
> > makes it available for the StarFive VisionFive V1 and BeagleV Starlight
> > boards, although I could only validate on the former SBC.  Thank you Em=
il
> > and Geert for helping with tests on BeagleV!
> >
> > The work is heavily based on the reference implementation [1] and depen=
ds
> > on the SiFive Composable Cache controller and non-coherent DMA support
> > provided by Emil via [2] and [3].
> >
> > *Update 1*: As of next-20231214, dependencies [2] & [3] have been merge=
d.
> >
> > *Update 2*: Since v5, the dwmac patches will be handled via [4], while =
the
> >             clock patches subset via [5].
>=20
> I'm not sure my rb my sense when I'm listed as a co-developer, but this v=
ersion
> looks good to me:
>=20
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Cool, thanks. Cristian, can you ping this series once the binding gets
picked up by the netdev folks after the merge window closes?

Cheers,
Conor.

--tCGlZoctadBRtAPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6iLQAKCRB4tDGHoIJi
0kbPAP0dbSyLIRPKeMG1shbfbFYtzw73fBt52A+2sdrLbJM5aAD+PQu/udrSe+dz
2BrPH1XVoW3NkL079PPlz/HGQidT8AA=
=z7mA
-----END PGP SIGNATURE-----

--tCGlZoctadBRtAPJ--


--===============9194185004369152548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9194185004369152548==--

