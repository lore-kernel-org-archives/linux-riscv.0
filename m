Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A65C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWBXzB/7QlRq/lCSRwqQgI4lWsjtJMNC1/UtxPHeNu8=; b=XNZPkJzO4X0l2RAU70nQwIFA+w
	O4D5hzrBYfpCDbKmHopsLaAzTLuGXGKa5lXnZAG2thmYFRa6lrvk3sSKjikWBHuDlXG/UhLvLsu/j
	vrHwJjD8Vx6ZRv3HmJd2jK8Of+pCXcmKIw4esCmUGmXF/+S+HH6MhAzT05XfyNlCP1OoeCKYmD2uD
	pW86+24LC3d5kk8LtDgr5xhK8+Ik5gkl15yJz0DDns7Ow0hiLvJnZlG+ZFwvJmrzlr+qU0nn8NCcw
	EKAXLwWUZ5Uc6pD++lC9wkaQDmYGE2vyo9ihaSy8os1fWwMK0rx2UcL6Q606ndtpsDouxfsQePLtH
	/C+8ywyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4QI-00Cc2a-1v;
	Tue, 27 Jun 2023 08:51:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4QG-00Cc1p-1T
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 08:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687855900; x=1719391900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CXsYWghN+E3gwCoJ+rRyfawRMHzc9mlxaZI/0JHowCY=;
  b=J/5uPvEGH1Yy77Bc6l1p3YM5ii/B+n32xLgRFa8hapQJZmSILu1j56PB
   8Wq56pLBdwYOTZU1hv91s/skoQyXpsaYf6X77SpoS7uHjSPBPkEDB9R+s
   X/Lp/VOIW8z/IJx72+sy4ipofCpaMk7Xc4AHKYBZE0+I84h8iTNps5I2g
   hSNuis2df4xVG5r/r+eaF8ib/2Zc/KloPvcbTIaK7Xzv7IGqemnOkRwRE
   B2joywDvo0jiEX8uPYtaIRGIt5KpA4OSyXb1DnKDsa8NeWeUiZKYOfgZW
   H7AHNqgucQFub/FY14VxzDNgUfEbDdCqNb1/0lO7lrHazcdVls9moVnvO
   g==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="220027967"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2023 01:51:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 27 Jun 2023 01:51:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 27 Jun 2023 01:51:34 -0700
Date: Tue, 27 Jun 2023 09:51:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	<palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230627-gosling-crouch-635c07ae05b3@wendy>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
 <20230626-dragonish-romp-9acf4846ae01@spud>
 <20230626-4fb963235f3ab08383a6d9ab@orel>
 <20230626-ragweed-whenever-5b22e180dcd1@spud>
 <ZJqXj7UdegnRP4mI@sunil-laptop>
MIME-Version: 1.0
In-Reply-To: <ZJqXj7UdegnRP4mI@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_015140_620546_3A8DF685 
X-CRM114-Status: GOOD (  24.51  )
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
Content-Type: multipart/mixed; boundary="===============5069980935227367449=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5069980935227367449==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ThX69JfIuFO+nHyA"
Content-Disposition: inline

--ThX69JfIuFO+nHyA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 01:32:23PM +0530, Sunil V L wrote:
> On Mon, Jun 26, 2023 at 05:16:09PM +0100, Conor Dooley wrote:
> > On Mon, Jun 26, 2023 at 06:05:40PM +0200, Andrew Jones wrote:
> > > On Mon, Jun 26, 2023 at 04:51:29PM +0100, Conor Dooley wrote:
> > > > On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> > > > > On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:

> > > > One of the few things I know does parsing of /proc/cpuinfo is:
> > > > https://github.com/google/cpu_features/blob/main/src/impl_riscv_lin=
ux.c
> > > > and that doesn't seem to care about the mmu, but does rely on
> > > > vendor/uarch ordering.
> > > >=20
> > > > Makes me wonder, does ACPI break things by leaving out uarch/vendor
> > > > fields, if there is something that expects them to exist? We should
> > > > not intentionally break stuff in /proc/cpuinfo, but can't say I fee=
l any
> > > > sympathy for naively parsing it.
> > >=20
> > > Yes, it would be nice for ACPI to be consistent. I'm not sure what ca=
n be
> > > done about that.
> >=20
> > Print "unknown", until there's a way of passing the info?
> > Speaking of being an eejit, adding new fields to the file would probably
> > break some really naive parsers & quite frankly that sort of thing can
> > keep the pieces IMO. Ditto if adding more extensions breaks someone that
> > expects _zicbom_zicboz that breaks when _zicbop is slid into the middle.

> Instead of unknown, could you print "risc-v" or "riscv"?

I don't really see how that is better. "riscv" is not the uarch or
vendor. If we don't know, we should either say we don't know or omit the
field IMO.

Cheers,
Conor.

--ThX69JfIuFO+nHyA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJqi+QAKCRB4tDGHoIJi
0odMAP9kKtThcpSAcsqVjnS6huAGPWKUX3mutzPXNe6QTDlWoAEA0U6dhi0/NMhn
piv1C2IwpR2atmi3IYJKU226a/OWxQU=
=NB1e
-----END PGP SIGNATURE-----

--ThX69JfIuFO+nHyA--


--===============5069980935227367449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5069980935227367449==--

