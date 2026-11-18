Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF53606CA67
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PcMRMU6f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4KFUrn1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sbb7f73VE+fP+gkiwowCqfDylUbKNAcLS1VdISZ5txY=; b=PcMRMU6f8YmD20C63m4oR2CUVI
	HSRhTcbPcsdzgCaQNvc3nC9pzo5YYMX4UyfB+TvCmpdOt+PD/RdI6Z2MFl//Liarc5ynxUQIDwB32
	yUp5rwyPRIHajFJQV+jw+N9WxS1h3Ki11q0spw/lCWG6kyZU38RZso3J4BuicxTicJrWWxbJ6mFEW
	B56jLWZFjNLf3gbVECMg81HgMSSHR219h6k8spi1IJZ9X3CCx3XS2ZWTVEkV0+iYKGDcL3cLJ6mJ7
	TQR+4TTodAcLM8g3WfYzJm9IMPbTtEYdaPIFMz5KtdNR4zTPuzG8kYfUBd0mqA7tevjyn+CQEFL1b
	BOVlaZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjS1-00000009ljg-0ssM;
	Wed, 18 Nov 2026 17:28:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjRy-00000009ljP-05X4
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 17:28:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A52F863412;
	Wed, 18 Nov 2026 17:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE921F000C5;
	Wed, 18 Nov 2026 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022880;
	bh=RnXonwrvoZVLtQsjLteHNbVkhm0Zy7su+D2bNWm+tfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V4KFUrn1plYU+7KFXMyDAEoxNpcEbAzsB/roEORSGeYRdUvMl+Oqw1AoPBWnYVCdd
	 ZD9/YntEdgMWb50ZwDj0o8lEwL4QAJyJVPDQ63lmtHvjEa4/xcxIXxR2h3+o+TaXj/
	 UHhCEfN0Jo/aFpwzWqgxVkBw43P07nBUpQ8Zi2+51xvASGKtFQJrkwxZG1liKhY3rG
	 59H2PLvPXh7MjUNeV5KIEHhDswzYgyvnDZMX8mK7yByzO0UAmwgtLceoE2MfDngQQt
	 d9JCobpXQLKFg4Pvw2FaXrfRjJayOqpdW4jHJ871g5Iudd8XZsopICEJm2cxaX/8C1
	 iDiRXol4Xd6Kw==
Date: Wed, 18 Nov 2026 17:27:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	"inochiama@outlook.com" <inochiama@outlook.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
Message-ID: <20261118-endorphin-coral-38e49336e204@spud>
References: <20261116-canary-pedometer-9df9d756da82@spud>
 <53de742f-60eb-48ec-a883-410431aac274@htecgroup.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <53de742f-60eb-48ec-a883-410431aac274@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3514830988778918265=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3514830988778918265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7C2DnlLPik6/hGFg"
Content-Disposition: inline

--7C2DnlLPik6/hGFg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 02:23:39PM +0000, Aleksa Paunovic wrote:
> Hi Conor,
>=20
> On 11/16/26 18:40, Conor Dooley wrote:
> >> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>
> >> Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
> >> and the board binding.
> >>
> >> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> ---
> >>  MAINTAINERS | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918=
e673c7977d9de91823 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
> >>  F:	drivers/usb/musb/mpfs.c
> >>  F:	include/soc/microchip/mpfs.h
> >> =20
> >> +RISC-V MIPS SoC SUPPORT
> >> +M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> +L:	linux-riscv@lists.infradead.org
> >> +S:	Supported
> >> +F:	Documentation/devicetree/bindings/riscv/mips.yaml
> >> +F:	arch/riscv/boot/dts/mips/
> > Right, so still no git tree here. How are we going to get this applied?=
 My comment on the last version was: | You're missing a MAINTAINERS entry f=
or the platform, since someone is | going to have to pick up the patches fo=
r the arch/riscv/boot/dts/gf and | that someone is neither Palmer nor Paul.=
 | See Documentation/process/maintainer-soc.rst for more info. | | I'd appl=
y patches as a very last resort, but even then you'd need an entry | to mak=
e sure that you're CCed on patches for the platform because I | don't care =
about the platform and would just apply things that look | correct if there=
 was no reviews provided. You have added the entry, which is great, but the=
 absence of a git tree implies you're not actually intending applying the p=
atches? Ideally you, someone that cares for this platform, would do that - =
and the lack of a tree implies that you're expecting someone else (me?) to =
do it. Cheers, Conor.

> I was planning on updating that later once we've decided which tree to us=
e. I'll fix that in v4.=A0

Cool, thanks!

--7C2DnlLPik6/hGFg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3gGgAKCRB4tDGHoIJi
0nS9AP9h2SSQCgR8joxKlMts6nqIrBad1TtQAnXdHy8fF9ocVAEAxGah61lFibco
nL74YqKKcXYtpC5oa+eb+s51kaFt0gc=
=dUOj
-----END PGP SIGNATURE-----

--7C2DnlLPik6/hGFg--


--===============3514830988778918265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3514830988778918265==--

