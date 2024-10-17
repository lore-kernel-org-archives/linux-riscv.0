Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A63D3C52A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LACw0K+4DVkvdU4QftC9i4Mhe7MWJCvn7hsmV7bkvg=; b=eTLH2PsqRR5CiKhytjojl5tI6W
	qCtzBAs+YAA8hBhvMU8nQ0U4M2szMZG0emadel90n/HWvZ6RtOGqE1bBHrWEPMv+98jEWeuCLruIJ
	JmauRCzqdWH/vrn4KFFdUo1MlRqSqlcdZFYL7pd/6YNO7ijViFUV3KPUXDfT3wP4zJg/4ns9EF7vN
	10y4W+iErn/8qw1Qy/55W/XeAOYzeOjoHD2DAAMYTS+HuB21VYmCX47lZ0aXeufC+136Q4LH7BA11
	sxV80w9n9Ax8CzzbAZZS4toDdh1LNF0V1F4H+Lohc6P4gIz15EvnI40l4JdckBNcnFSNnUT/s9X1o
	GvowzHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ufj-0000000FmXx-2AUa;
	Thu, 17 Oct 2024 17:52:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1UfR-0000000FmUl-3GPb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 17:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EAA25A4421F;
	Thu, 17 Oct 2024 17:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDF8C4CEC3;
	Thu, 17 Oct 2024 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729187528;
	bh=gmOt13pVPmIXcY0OIAOohx40/5JMQplh61ctXWIWaUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2Az3lytMc3zjIDcqG16DuKCCGrBrOYDPGEDE39DOPaF2+SEcc8x39uCb8POps19L
	 HjODyGTdz+Hb11q/lPG0+qeKi5OEb1lIWNl3cndhmy8kJW3x00D3NyjI7Cztxkhj5n
	 BI5d62MLCV99uCGYtjovS+0cVhuLAeNtLE3HrQXcFXhcdW9Lx1ucSPsOl28k/guwpj
	 1a04lOMGGoCLygH1zWJUke7N1ryVFka/McFNlQy8kPRv9Ftmj0NIKRVQGyBMaYWG94
	 UjqqwdhXuX3g20yVPiO6HNo9/5jmUejo+TSSWKon+TPLTpYYTYMCuQdnVLriZtP/uC
	 +4/8NN5GBBD2A==
Date: Thu, 17 Oct 2024 18:52:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v1] riscv: dts:
 starfive: disable unused csi/camss nodes
Message-ID: <20241017-condone-angelic-9d4936f1fd37@spud>
References: <ZQ0PR01MB130298186E09DA19CC1F7736F2472@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ0PR01MB130298186E09DA19CC1F7736F2472@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_105209_900634_041BD420 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Type: multipart/mixed; boundary="===============3313683945827747115=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3313683945827747115==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VgIo2QEZSi5NGsOb"
Content-Disposition: inline


--VgIo2QEZSi5NGsOb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 05:49:56AM +0000, Changhuang Liang wrote:
> Hi, Conor,
>=20
> > Hi, Conor
> >=20
> > Thanks for your patch.
> >=20
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Aurelien reported probe failures due to the csi node being enabled
> > > without having a camera attached to it. A camera was in the initial
> > > submissions, but was removed from the dts, as it had not actually been
> > > present on the board, but was from an addon board used by the develop=
er
> > of the relevant drivers.
> > > The non-camera pipeline nodes were not disabled when this happened and
> > > the probe failures are problematic for Debian. Disable them.
> > >
> > > CC: stable@vger.kernel.org
> > > Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera
> > > subsystem
> > > nodes")
> >=20
> > Here you write it in 13 characters, should be "Fixes: 28ecaaa5af19 ..."
> >=20
>=20
> After fixing this:
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Ye, I know it was 13 not 12. I don't think that's a problem though.

--VgIo2QEZSi5NGsOb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxFOxAAKCRB4tDGHoIJi
0r24AQCKINQVQ9g7jUqAtlal7Z82+REbGOsv+I+oqRMQduOLKgD+K/ZCmiECTEgx
z4CTuvZPyZwHRwjzkEUY9OmWxrRT2Ac=
=nBzS
-----END PGP SIGNATURE-----

--VgIo2QEZSi5NGsOb--


--===============3313683945827747115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3313683945827747115==--

