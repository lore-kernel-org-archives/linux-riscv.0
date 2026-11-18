Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58B606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PNiwWhv8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCgNfw9F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fq4ueQF/nBVUF8eybzon92G9kl47XJ2GBvOUkI+9K+M=; b=PNiwWhv8S8NNMob06H7IpOwFPW
	xG+xbTkTi88uCdoZfj4DCsVzBdSPk9n0kg0vy2heI2a6EG2gI9lslh6BaFGxe0rCqEXoRa37jGbhY
	geXzNhx+EwsXnyiBL8SocaOlGlHJhdB/VuFAiuYHp+UHAfYW+BjWAf6kZEiP/MDPiklkWJX7UPR6y
	6iXAf5D4SQKW0fSZfZnLnMo31Kw9NIdKsmLy3CKWmLdKhsD91PtC0vFXggz/2BEir0Mo7ExiRLo4Z
	mvxmOIKIjyhEcLCBAoRvppZIus9hwcn3IqebqTElCKRn9uiiW/1X5gcub7/AIsTebSY7Y/U8osBIZ
	OPn/r01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj8Q-00000009hpd-42aG;
	Wed, 18 Nov 2026 17:07:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj8P-00000009hol-1E6A;
	Wed, 18 Nov 2026 17:07:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A94AA45602;
	Wed, 18 Nov 2026 17:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514611F000C4;
	Wed, 18 Nov 2026 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795021668;
	bh=1082igN8AgArxQJ6WvmrNI+Gc7WS+2/LYjRpQ2Ge3Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QCgNfw9FgQK+sm5NRvdWobhMGhtjBzuObXQHEjX1yuhdiiBLYB0bTRTLmyx6fA8kJ
	 UHbkZjfg2xM6NV6Fx09wyv0Qw9cmOGqEbDfQynp0Xfyg3RI+neNW9r+ioVkyG+/A+5
	 8x6SbqumZKvLr+liTbgiCqHzllt++Dxv+YHm/HbjShj3gyfRl1pzdQOwAhqNzBovvm
	 f+PrOSIvLjHTBV0MzhK/eYbE6mY1kut9NlJ6uuMrjLdRizvupv1TeZDHBuSK+Q7zUo
	 Mibg2IC3WkhnVR7XiiG827juW4oPIHLCViYkj3mA0/csL0NMxbZRVcbTO19V3GeyAy
	 4FIPM3WQfqiWw==
Date: Wed, 18 Nov 2026 17:07:39 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jun Chang <jun.chang@metanoia-comm.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	CL Wang <cl634@andestech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/25] riscv: add support for the Metanoia MT2824 SoC and
 MT5824 EVB
Message-ID: <20261118-unlovely-danger-3cab5aa87742@spud>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <_koitdIgQPmk89LDhlUlJQ@bootlin.com>
 <20261117-calamity-quiver-96d0d568b338@spud>
 <tSRWYJl8QRO6qpOrYOmeTA@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <tSRWYJl8QRO6qpOrYOmeTA@bootlin.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5383256271445332734=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5383256271445332734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qHjQ/oQFDRYJL6Ds"
Content-Disposition: inline

--qHjQ/oQFDRYJL6Ds
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 05:08:33PM +0100, Beno=EEt Monin wrote:
> On Tuesday, 17 November 2026 at 18:30:58 CET, Conor Dooley wrote:
> > On Tue, Nov 17, 2026 at 11:41:52AM +0100, Beno=EEt Monin wrote:
> > > On Friday, 6 November 2026 at 12:15:09 CET, Mark Brown wrote:
> > > > On Fri, Nov 06, 2026 at 10:29:57AM +0100, Beno=EEt Monin wrote:
> > > >=20
> > > > > The series is organised as:
> > > >=20
> > > > > - patches 1-14 add the device tree bindings, the Metanoia vendor =
prefix,
> > > > >   the RISC-V board schema and the SoC block compatibles
> > > > > - patch 15 adds ARCH_METANOIA and selects the AX45MP errata
> > > > > - patches 16-23 add the reset, SPI, watchdog, MMC, PHY and USB ch=
anges
> > > > >   needed to build and probe on this SoC
> > > > > - patch 24 adds the MT2824 SoC and MT5824 EVB device trees
> > > > > - patch 25 adds the MAINTAINERS entry
> > > >=20
> > > > This sort of thing tends to work better if you submit the patches f=
or
> > > > subsystems as separate serieses, it avoids enormous CC lists and ke=
eps
> > > > the individual serieses a managable size.
> > > >=20
> > > I agree, and I am reworking the series that way. Version 1 was intend=
ed
> > > as an overview of the complete SoC support, but it ended up being too
> > > big for a single series.
> > >=20
> > > So version 2 of this current series will be only the platform basics
> > > (2 patches):
> > >=20
> > >   - dt-bindings: vendor-prefixes: add Metanoia Communications
> >=20
> > >   - riscv: add ARCH_METANOIA Kconfig entry
> >=20
> > Realistically, this does not need to be a prereq either, because you'll
> > have "depends on ARCH_METANIOA || COMPILE_TEST".
> >=20
> True but checkkconfigsymbols.py will then complain about a referenced but
> undefined Kconfig symbol in the following series.

Do people actually care about this transiently failing in subsystem trees?
For that matter, do people care that the vendor prefix might fail in a
subsystem tree as long as it arrives in Linus' tree from another PR in
the same window?

--qHjQ/oQFDRYJL6Ds
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3bWwAKCRB4tDGHoIJi
0mflAP4mPyCBWxjRHa5hM3Th8QKGT/GcS2FW3txaiRkFbQ3zDQEAqGN5oVKdjCh+
kLDcm68sMAeSJ5Q0sGQa7uNSaVeIrAk=
=4VYb
-----END PGP SIGNATURE-----

--qHjQ/oQFDRYJL6Ds--


--===============5383256271445332734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5383256271445332734==--

