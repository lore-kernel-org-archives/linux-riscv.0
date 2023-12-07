Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFEEC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yvme040QybJouu524on/PDRZR8Gn4xA4vvhV5ZFcXk=; b=bS7ZfivaIcQdZu4rn+CYVS5VaS
	xN80pNUu9gnsT/U8P0eQ93kL/AQ8LHKRS3+ArUnQ+NVDR8J5kmve/eNFGAR8jO7vnf88flpb7ewj8
	t5vY6VreVP/TE203fQXKzoPO5blEUit4rtRAaYc7ykEvpPs4L3AEAuobQ9DvV0NKYHB4JCUI0RMWt
	jYVwdqBRlBwmu1MR8crGaAfp71dQmpNZ5nrxQ7KsfSVbuZP8AQZI+U2Hf4OdpFQyDnk7PPRNAvKdb
	OXrFSSlVA/Dk4pU5AelnxUiUOlf65z1MeJKaeW5Wjd2RExvnObJOX4PO7iZ2ehYJO/SkbqTInmuWi
	/pYuRuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEAo-00CsVr-1C;
	Thu, 07 Dec 2023 13:12:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEAl-00CsVU-0z
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 13:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701954731; x=1733490731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4hPha8F9u1bHaqRGRfkg8SwanFYTgp+4Z7tK+Ubzcjs=;
  b=SMbROKvNGMhEfPPIJD+crHQ76d3VDoMOmuQRmmfoFc1tM4Q0Jv0ekV5f
   eBycr7V2EMBnfmAf4Q5XKtbJ9ZrBYyvku6HHdI1kqObESNoS7pBS7Sx1C
   xYoaeAI3bjxLMX3CUFdwgG4WFsUKQSRV+lgVHvBXpZlpnjPD++zyu/ON2
   QGe1GaiEIWDuyfRb+vEsmA2a6q3QXYQ0AzH3jVhcMk+9Bh7PCkyUcR1Ze
   4ol0IpFhoQLLDeX+aPC6syqiallT5njQ+q1Ra2BEesim9+yHO1Ck6CM7y
   PabBf8QO9MquiUmGCAWLXtapD+Ipy3mG1U12OPHjHnuPPImKYW5DweJnE
   Q==;
X-CSE-ConnectionGUID: JQolBRUHQTen03AsQHVsCg==
X-CSE-MsgGUID: phlp69xtRlu1zFivcfKhmw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="asc'?scan'208";a="13247861"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Dec 2023 06:12:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 06:11:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 06:11:53 -0700
Date: Thu, 7 Dec 2023 13:11:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<geert+renesas@glider.be>, Atish Patra <atishp@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <apatel@ventanamicro.com>,
	<alexghiti@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>,
	<suagrfillet@gmail.com>, <jeeheng.sia@starfivetech.com>,
	<petrtesarik@huaweicloud.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20231207-buffalo-varmint-de843c8a12bb@wendy>
References: <20230810-crewless-pampers-6f51aafb8cff@wendy>
 <mhng-550dee8b-a2fb-485b-ad4d-2763e94191b4@palmer-ri-x1c9>
 <20231206-precut-serotonin-2eecee4ab6af@spud>
 <CA+V-a8s3MjvpD8gAE7-mOUc6PEytbPOR6x_PHuw0J0hOLkaz-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8s3MjvpD8gAE7-mOUc6PEytbPOR6x_PHuw0J0hOLkaz-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_051211_402150_365EAF67 
X-CRM114-Status: GOOD (  26.13  )
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
Content-Type: multipart/mixed; boundary="===============1571790242069316316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1571790242069316316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f9Fz83/CoTY3gAXZ"
Content-Disposition: inline

--f9Fz83/CoTY3gAXZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 01:02:00PM +0000, Lad, Prabhakar wrote:
> On Wed, Dec 6, 2023 at 2:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Wed, Dec 06, 2023 at 04:52:11AM -0800, Palmer Dabbelt wrote:
> > > On Thu, 10 Aug 2023 02:07:10 PDT (-0700), Conor Dooley wrote:

> > > > I'm perfectly happy to drop this series though, if people generally=
 are
> > > > of the opinion that this sort of firmware workaround is ill-advised.
> > > > We are unaffected by it, so I certainly have no pressure to have
> > > > something working here. It's my desire not to be user-hostile that
> > > > motivated this patch.
> > >
> > > IIUC you guys and Reneas are the only ones who have hardware that mig=
ht be
> > > in a spot where users aren't able to update the firmware (ie, it's ou=
t in
> > > production somewhere).
> >
> > I dunno if we can really keep thinking like that though. In terms of
> > people who have devicetrees in the kernel and stuff available in western
> > catalog distribution, sure.
> > I don't think we can assume that that covers all users though, certainly
> > the syntacore folks pop up every now and then, and I sure hope that
> > Andes etc have larger customer bases than the in-kernel users would
> > suggest.
> >
> > > So I'm adding Geert, though he probably saw this
> > > months ago...
> >
> > Prabhakar might be a good call on that front. I'm not sure if the
> > Renesas stuff works on affected versions of OpenSBI though, guess it
> > depends on the sequencing of the support for the non-coherent stuff and
> > when this bug was fixed.
> >
> ATM, I dont think there are any users who are using the upstream
> kernel + OpenSBI (apart from me and Geert!). Currently the customers
> are using the BSP releases.

That doesn't really answer whether or not you (and your customers) are
using an affected version of the vendor OpenSBI?
The affected range for OpenSBI itself is [v0.8 to v1.3).

--f9Fz83/CoTY3gAXZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXHEewAKCRB4tDGHoIJi
0qAVAQDuyK5FCD922oVznNjcMLfpdk3VinS8Td2EgK/P06qa2wD+NHaA5dhQABPZ
AL8kEYvuUajwlHISzPfMrsohnzvnlQE=
=LBlc
-----END PGP SIGNATURE-----

--f9Fz83/CoTY3gAXZ--


--===============1571790242069316316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1571790242069316316==--

