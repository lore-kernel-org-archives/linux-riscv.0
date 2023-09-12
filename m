Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD4CCA0EF2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXrWFl2+KdLLaj56sE48fmDtTubjFAjeaFf0BSt2p5s=; b=svEZ+4IiicUAvXUm3VFg7/m1wm
	z5r27plUQnldKYYQKYOFdYb6oyb1Jg2kpjlcH1aKufCEKTBb0P64MKPmQntPeNmK3Af+hgUVL85sD
	zq4nX1DTL1CIQqT/UpIXu15ZpcT8RXPK3Pl/Yw6Q/AMlPO1hXAx5YwSAnGeJX5f8d/mZUctxPQ65+
	87DRU+Z3WRojFCe/0ueuVXofRLuPWzZqeqT/+p+MUB/essgU4sMjGGvzjkTqztYQKOj71esw0eMvi
	HB6HyVAwZ4SlfgNGEntxOV/Y+CeLH9Q0yJ5QK0naQRIuCYAG4CVD4lqQtr//gSzhibBfJJpwxYPN8
	0oZmlUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5tv-003mnn-1C;
	Tue, 12 Sep 2023 16:06:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5ts-003mmu-0y
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 16:06:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E8C6614C5;
	Tue, 12 Sep 2023 16:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA50C433C8;
	Tue, 12 Sep 2023 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694534762;
	bh=Q/TEkMWLXQKDzVgkahRn+n43VpZCdu0lgRVofBA7+Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpDQ5mpok4kTlzsx+0W8ao1sDPfIZK7GybvEEX/87ZRQSoz6ufqt0O629BFP0gQfW
	 JXrGpqPM921dMCTs5Jb1Df87osNZhr5BaoeZI4wbBmipnKSJtiWPl/ttr+gdGobpb1
	 AJyo8+zH60kbFZFfWoGgM3mNdCApQETLq5RxG8g8/tsnFT6OECEInSXKbdu3nZrugj
	 O7UJSTAb5LWhHD8SCDamfH58UFh75LbaenlPmw/HDzoBJDd6cvdUdCftj3NUXGNdJL
	 1YpZZ2plXX9+L/dU/YREAUYHzMQHsodMn++icX7y+dNAEYE332+gcjDfHAJ+Zoh2C4
	 kg+zz/7Owl1rQ==
Date: Tue, 12 Sep 2023 17:05:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: arnd@arndb.de, Changhuang Liang <changhuang.liang@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>, linux-pm@vger.kernel.org
Subject: Re: Missed soc/genpd PR for 6.6 mw
Message-ID: <20230912-postal-succulent-d83861d769ad@spud>
References: <20230911-scouring-squash-3ef2cc8b1ee2@spud>
 <CAPDyKFqB_2KiqYy1Li1sGkXPiEAnc2GOUO7SdqCxy5G+YkeLcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqB_2KiqYy1Li1sGkXPiEAnc2GOUO7SdqCxy5G+YkeLcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_090604_380602_55072DBB 
X-CRM114-Status: GOOD (  21.34  )
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
Content-Type: multipart/mixed; boundary="===============7259313474858934671=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7259313474858934671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gdsE8Rlaoyspx0wO"
Content-Disposition: inline


--gdsE8Rlaoyspx0wO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 11:09:51AM +0200, Ulf Hansson wrote:
> On Tue, 12 Sept 2023 at 00:11, Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey all,
> >
> > So I've been informed that I made a hames of things and forgot to send
> > my soc driver PR for the 6.6 merge window. There's not too much in my
> > branch
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=
=3Driscv-soc-for-next
> > so I would've kicked the can to 6.7, but the majority of changes there =
were
> > made to the starfive pmu driver that has since moved to the new genpd
> > subsystem.
> >
> > Sending a PR to Arnd for 6.7 with the pmu bits & based on v6.5-rc1 does=
n't
> > seem to make all that much sense to me, since that stuff is no longer in
> > drivers/soc, but rebasing on top of v6.6-rc1 would make these genpd cha=
nges,
> > with a different path to Linus.
> >
> > What's the best way to rectify me screwing this up? Should I split out
> > the non genpd patch and send a PR for that for the genpd tree for 6.7?
>=20
> Yep, that seems like the best option.
>=20
> If you think it's better to re-post the re-based genpd patches, I can
> certainly pick them up from the mailing lists too.

Cool, I'll try to do one of the above tomorrow. Thanks!

--gdsE8Rlaoyspx0wO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQCMZgAKCRB4tDGHoIJi
0k/RAP0ZqY8mLJi3PfQkOA/0RkMdz91zRn/e7yBskW8Y/TgEQwEA50GlQEqMfL00
22snh32/SkoUK7nbNCGoVBF2nmqBKgY=
=FxtK
-----END PGP SIGNATURE-----

--gdsE8Rlaoyspx0wO--


--===============7259313474858934671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7259313474858934671==--

