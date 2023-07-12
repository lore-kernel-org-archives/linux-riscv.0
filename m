Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D29EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqWrVpnj8WeTHxpMQR1ISOy+G7Ucg7hCZ7vsS3NlWQc=; b=i6+1aKGgBJ0UJNC1FxPrzT/1m9
	0gZuqRxvLvSKgPYl5BUxssA/rtwj6Gg1hiIkyefeK1hZVpY2i3WriOyl1woD3RDuYiZjwaUxkonK4
	UEhB/wgAP9vYcuhyAzuhdYKuZbA3OgPwNAHT98VfRObIfzSZFhxO1NIfZVwK7CVvnDKiWgA8FTsp1
	y6HNfKH0jiLwwpav0QJsqd6L3QEoGCqgrruAujq9ns5nSXiWcgs1WVB5DScPAN/F06n95fwLc/Oa9
	Bx+J9yUX3J2J8MmPMgMlYlfP+WvHu211YftHPbws7Y69FmYH87xs5D0b5dZpnF+VwP/nsb3rA81jP
	Gu2TVuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJccl-000ZRL-1K;
	Wed, 12 Jul 2023 16:23:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcci-000ZQA-2S
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:23:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 167F76183B;
	Wed, 12 Jul 2023 16:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B45DC433C8;
	Wed, 12 Jul 2023 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689179007;
	bh=nP0kTFEzVGID4WJotsstb9GIh2dmb5GIqR/6xgOaqr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBGbEOrDGNBhQJNOnloI2fTTfkYFnqnJrln+pqy6lCpNyh1RNAh98UOUWIfTFcAzD
	 dHPTSiRLGH5C34jyfdwGnbq6QGlRJj3h4OGVyBjpIR+8xNicVtM3/T449rQrITY9Dv
	 XMDKJo2MUJruLN1ffYPbiEYTW2yR3x2sCw3L6HSrKxaQh8rVESVE4YiDvTMfO+VHHc
	 3qx076iFNqyAfdgXja2zDT1HGZhKgqNve9mQ1GoSXOAlmim9Ms89oYsXQIGlrgx6Zz
	 VCG4ruh64MdRHMEZGkS45BVpDqq3tf4bJlNXrL9QBC/GMZEaOPJHVW6hOsjeOklMAf
	 en4nlRmU+hdUw==
Date: Wed, 12 Jul 2023 17:23:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Felix Moessbauer <felix.moessbauer@siemens.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Bovensiepen <daniel.bovensiepen@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for
 starfive devices
Message-ID: <20230712-single-crestless-93bf57c09773@spud>
References: <20230627080620.329873-1-felix.moessbauer@siemens.com>
 <20230710-villain-dainty-d1a90ce57a27@spud>
 <CAJM55Z_0X+UT1s9s4kqKuyg4hF2JooTMXe4RYTAzoEgY=+8A1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_0X+UT1s9s4kqKuyg4hF2JooTMXe4RYTAzoEgY=+8A1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_092328_878373_143D3D31 
X-CRM114-Status: GOOD (  23.19  )
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
Content-Type: multipart/mixed; boundary="===============7174034676134134922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7174034676134134922==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6yhNlt3iEraEviEJ"
Content-Disposition: inline


--6yhNlt3iEraEviEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 06:17:19PM +0200, Emil Renner Berthing wrote:
> On Mon, 10 Jul 2023 at 20:29, Conor Dooley <conor@kernel.org> wrote:
> >
> >
> > Emil, Walker,
> >
> > On Tue, Jun 27, 2023 at 04:06:20PM +0800, Felix Moessbauer wrote:
> > > Add the '-@' DTC option for the starfive devices. This option
> > > populates the '__symbols__' node that contains all the necessary symb=
ols
> > > for supporting device-tree overlays (for instance from the firmware or
> > > the bootloader) on these devices.
> > >
> > > The starfive devices allow various modules to be connected and this
> > > enables users to create out-of-tree device-tree overlays for these mo=
dules.
> > >
> > > Please note that this change does increase the size of the resulting =
DTB
> > > by ~20%. For example, with v6.4 increase in size is as follows:
> >
> > Whatcha think?
>=20
> I'm fine with it. I just wonder why it's only the Nvidia Tegra boards
> and the VisionFive's that need this. Surely other boards have pins for
> expansion cards.

It's totally not just these two - there's been a flurry of similar
patches recently. The RPi stuff got it - I think I Acked that one from
the DT side while Rob and Krzysztof were out of office, partially on the
basis that the Nvidia stuff had it (and IIRC Renesas).
Since then there's been a couple other ones that got the same treatment,
including 32-bit ARM Microchip stuff. I've been avoiding doing it for the
RISC-V Microchip to see if Rob decides that what I Acked was a problem.

It seems generally helpful, so I've been a little suspicious as to why
it was not done already...

--6yhNlt3iEraEviEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7TewAKCRB4tDGHoIJi
0nFMAP4z0kyCJ9bo9NdV1fEaEaWPTMD3SWgash90+nz8lEEzgAD/Yp90Wvv/78Va
3OsBKHedafWudPyyGbZWiAK2dfxTmwQ=
=13KF
-----END PGP SIGNATURE-----

--6yhNlt3iEraEviEJ--


--===============7174034676134134922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7174034676134134922==--

