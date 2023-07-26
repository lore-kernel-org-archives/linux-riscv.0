Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A6AC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn5QmWR1b7di9358fei9gM/OLkRi8tiirELJeQhqpL4=; b=LSTaCjY26SoiHw743LcrYw/LX3
	Vo/wxbALc4t3/q19ZMEPJKpznZQi2uJIkQZb47sWx8xx/C+dxURVQJMoLlx6GpnSWf3RJKUZaHS9e
	OwvRCWud/D/9f4eo5G9PsSym76k2Re9Z3BlqesO+2BWVmm60iRqgYsV62RmYEDUwCdeqq75vGlPZi
	CAYPtaPzNrQifn9qtu6G0BuOBR95sQe4MFEf5rsrjRi8XqcSzO7rh0cI/SFCNJNS7FAxwqW2VKwmi
	CwWtaLo3idH7CJS0oaiEUACHQryd6dYTMOZygOauO6nJJmtee2Ycs/DvaMGkwg8BjPnWP1YBVGxA4
	p8AY3y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYSh-009KDv-2g;
	Wed, 26 Jul 2023 06:57:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYSd-009KBC-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 06:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690354647; x=1721890647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vd07SnfC4HrMoorJ4Hu0vy2odr9oC7toBhuZCsbfO+M=;
  b=zua4/ivVCx7ZHVw8Ify5Sb7z1dvbVFRynesK8C6X8ZT8DpB0pQA4Oa7J
   JfAx23o5XLz17c6w8aAPYcg7OZ1paD+B+a1F1U9VGsUbX9+I9cW7WWCbl
   C5AkUTPgJjW2OlpIMsD6bE4mZz3oQapVutdWaYffJUfRk+vo4BWzHI1Ea
   Toik3dN39rIZkLRcXAW+z0UgZiR3GZyU0H4WhexFrshyYYVqM7Gb4hrC6
   GActKMof2mkczzWoDwrEEMaXKYpNFhDEJucH1ZfTj2YDmS7zxFzHt8twg
   1y3xbxne9FBHeTHdGQF6AdBZ7kXlSjvtAbSaDIpsWLkMYj4sT0mv91jIN
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="asc'?scan'208";a="237821244"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2023 23:57:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Jul 2023 23:57:21 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Jul 2023 23:57:21 -0700
Date: Wed, 26 Jul 2023 07:56:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/1] RISC-V: clarify the QEMU workaround in ISA parser
Message-ID: <20230726-wisplike-passably-a043e4d8192d@wendy>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
 <cover.1690350252.git.research_trasio@irq.a4lg.com>
 <8a127608cf6194a6d288289f2520bd1744b81437.1690350252.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
In-Reply-To: <8a127608cf6194a6d288289f2520bd1744b81437.1690350252.git.research_trasio@irq.a4lg.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_235727_834956_2612CCA5 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: multipart/mixed; boundary="===============0941758890924790465=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0941758890924790465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8jpAoCl6KGBo9xIz"
Content-Disposition: inline

--8jpAoCl6KGBo9xIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 05:44:16AM +0000, Tsukasa OI wrote:
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>=20
> Extensions prefixed with "Su" won't corrupt the workaround in many
> cases.  The only exception is when the first multi-letter extension in the
> ISA string begins with "Su" and is not prefixed with an underscore.
>=20
> For instance, following ISA string can confuse this QEMU workaround.
>=20
> *   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")
>=20
> However, this case is very unlikely because extensions prefixed by either
> "Z", "Sm" or "Ss" will most likely precede first.
>=20
> For instance, the "Suclic" extension (draft as of now) will be placed aft=
er
> related "Smclic" and "Ssclic" extensions.  It's also highly likely that
> other unprivileged extensions like "Zba" will precede.
>=20
> It's also possible to suppress the issue in the QEMU workaround with an
> underscore.  Following ISA string won't confuse the QEMU workaround.
>=20
> *   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")
>=20
> This fix is to tell kernel developers the nature of this workaround
> precisely.  There are some "Su*" extensions to be ratified but don't worry
> about this workaround too much.
>=20
> This commit comes with other minor editorial fixes (for minor wording and
> spacing issues, without changing the meaning).
>=20
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Pretty sure I gave you a Reviewed-by last time? Nevertheless,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--8jpAoCl6KGBo9xIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMDDrgAKCRB4tDGHoIJi
0sMOAQDoPQpOeSH9Kua7FR7E9p2mZftOWHlDsEkvtd4heiJ8BgD/Y4Q76Te3D493
oiK0cCV1eO5+fsdCG9HidLCaoEXH4Ag=
=C2OP
-----END PGP SIGNATURE-----

--8jpAoCl6KGBo9xIz--


--===============0941758890924790465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0941758890924790465==--

