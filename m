Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT1ss5dkyABRv4zPYM+ovkvqVCtGmZP8RfTbfCnIiPU=; b=YBv9jKXMVJYbypXvSC7pS5GPqr
	DyuUWRLirhL7VH5zVRrARx1TTTbYSgkuEoS68XPL2Hys8E7XthqrusRzLODyhhlMGGk3zrWwheaDg
	HK3Thhtm+FmEQglEWKkpQZphORrcPry2n/swqEMexKCie57+A4Yv8qyPAa+VrxCoPrPIJIu/DpQ/q
	wsN4v6nE61krg8h4JBN/47SlaY1p3IgnEmkDqY402gfw3LQmS8aq/yAX+VTbj1bb30REuzs6SgCoV
	FAmftmNYhh99rjqumMLpDYatvr1z0BtPYZJ12seQP4mUK9QJXlQt0tguy9VCNgMn3+BM4aG5befon
	8WcuRVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyMs-00B5Mz-1I;
	Tue, 12 Dec 2023 08:43:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyMp-00B5Lw-0h
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 08:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702370630; x=1733906630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wgVHBzqoKPPGjfmpxOQWTXb8ZDh9UV5MdaG4pwJ/vWI=;
  b=liz492Az1DRVFbFw3IGHl6NzWZXlCChQTrnnv9Jr/h3PINCwPIubsc5i
   ptRyAz82hlTpCUQe7Mp+FSO5tHwW+NFDS8aYG9LoSebOSwXxxNCfEwv/m
   4hTuqh9c23dLUh/rG15ahaLtaz9M+z5ftaDsouQnfhIGOP2112pPwCK4J
   GJpLv/OMR3Y/WvnG4gA0iVGDc5JvRmDCWulH1tq3Ag//UHJVA5laiKX+s
   iSMRRSTm9VbhaCp5/DgPAwqOKYQk5sh/vQDpUDMOgNaNx0dYmXnJqfutr
   clVO35cmZzF6PUANJIqHDaoHfpccYawWuRQq4HCADo7sfYVsNnAjyodUQ
   w==;
X-CSE-ConnectionGUID: WiO6fCDNTCCj2lq+o3a3hw==
X-CSE-MsgGUID: am4cvTE2TnicaDYOgADGLw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="asc'?scan'208";a="180345961"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Dec 2023 01:43:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 01:43:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 12 Dec 2023 01:43:36 -0700
Date: Tue, 12 Dec 2023 08:43:06 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Randy
 Dunlap <rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Emil
 Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on
 !DMA_DIRECT_REMAP
Message-ID: <20231212-ambition-karma-4834afd4eb16@wendy>
References: <20231211-primate-arbitrate-fbcd307a0b00@spud>
 <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX0bETuMoZCZM7pAodbwyf0ttZMpKuq0ibBZX7S-YV8xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_004351_314441_3F8EFF74 
X-CRM114-Status: GOOD (  21.01  )
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
Content-Type: multipart/mixed; boundary="===============5391494891457853015=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5391494891457853015==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e2oQTY8OE7jKY5sj"
Content-Disposition: inline

--e2oQTY8OE7jKY5sj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 09:19:32AM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, Dec 11, 2023 at 11:06=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Randy reported yet another build issue with randconfigs on rv32:
> > WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
> >   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=3Dn] && !DMA_DIRECT_REMA=
P [=3Dy]
> >   Selected by [y]:
> >   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONP=
ORTABLE [=3Dy] && RISCV_ALTERNATIVE [=3Dy] && !RISCV_ISA_ZICBOM [=3Dn] && R=
ISCV_SBI [=3Dy]
> >
> > This happens when DMA_DIRECT_REMAP is selected by the T-Head CMO erratum
>=20
> or by the Zicbom extension support?

Probably, yeah. That was just the conditions for this particular
randconfig IIRC.

> > option and DMA_GLOBAL_POOL is selected by the Andes CMO erratum. Block
> > selecting the RZ/Five config option, and by extension DMA_GLOBAL_POOL,
> > if DMA_DIRECT_REMAP has already been enabled.
> >
> > Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required config=
s for RZ/Five SoC")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> > Closes: https://lore.kernel.org/all/24942b4d-d16a-463f-b39a-f9dfcb89d74=
2@infradead.org/
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.8.
>=20
> Or should this be queued as a fix for v6.7 instead?

Depends on your opinion on how critical such a fix is I suppose.

> > ---
> > I don't know what the exact fixes tag here is as I did not bisect with
> > the randconfig, so I blamed the one that added DMA_GLOBAL_POOL.
>=20
> Bisection leads to commit da323d4640704001 ("dma-direct: add
> dependencies to CONFIG_DMA_GLOBAL_POOL") in v6.7-rc1, but that is
> merely making visible the symptoms, so I think your Fixes tag is fine.
>=20
> Esmil: I think you need a similar fix for ERRATA_STARFIVE_JH7100 in
> your tree.

I probably need a similar fix in my tree for that, since I applied
Emil's patches...

--e2oQTY8OE7jKY5sj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXgdGQAKCRB4tDGHoIJi
0jbuAP91y7WApBZFEeiqbfME/Mo6p2pI+fFTDQeQretgcPSVNQEA0ZQFUcwsk10K
K1XlumMMEm3Lyb4/BNoAfFhLqNBlIA8=
=AJxt
-----END PGP SIGNATURE-----

--e2oQTY8OE7jKY5sj--


--===============5391494891457853015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5391494891457853015==--

