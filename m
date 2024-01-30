Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BDC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 12:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLqHCPfAG1QFj+jXYTIMOeZJ3VQuRZEuHpFIPMIOnKI=; b=tDGOuCKo7ih9qB9f0XCCPggPVV
	4NWF4ydFZzdGK5ZOOrtC9N2vQ5x/ElYIsPGjLmfKh/fEyIQZx2N2WmqbPtc1dQnlp9m+J4EmK0KDn
	4PsjNHZ2hSvkMZVjZAPr/aAwa6EQHeUIKlIXrN2FtPL5bWhV021eMpbgp/AdTHFJoJkx78Ql+xG22
	Ctewcwkm7D/CWZuhh1iDIbI+TQmq6bIEqB4yK9jV34vQZlotQtEo/UdazD90eTUJ0BNxyVjN2FBEH
	6cYGX+2n3bEtIvsUapRwewCL8uK3yFEVDGoOvqsnTkuRRwVks16hjoEvQlFL3a8TG81WPSOV0kflq
	BSjWix0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmyu-0000000GctI-2qpn;
	Tue, 30 Jan 2024 12:12:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmyr-0000000GcsA-1yZd
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 12:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706616765; x=1738152765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ts6+3cKiUi9J177cwzVgCHsWG2TI3IL/jBqFMX29Dpg=;
  b=I4UHSFil2A7LcGhO6GPsBOTh4sLbGLZjM3RTuZN5NEhe5NdLAG6OxYNJ
   ORYDSdXKsuQqNhRCjPJ5pZvAsUwNzAA7e11jpnNZDEvBmTb78S4IWJ+el
   gynk/OzyzrP5bk7QNFBvDhovbACkV9yeFSEmXUu26QfS0ZCagj9CMZiK7
   Ct/4vszZ1jX7qCwbW6GKYdiFTG/Cq1Qxayro90zMPpmL8EBiTbhquFDzW
   ZDYGcHylU0O3gqK6OgQ89R9VPliqbojj5zZsrWAOlTlf4cvBkbo8OSQeW
   L6qB2jFg2jxUC3YDQbpQcTO8SgRohrStYUVGbx9QMfvh1Y+QJemQMTZuP
   g==;
X-CSE-ConnectionGUID: daF2h1OmQfmAoCYQvT7ARg==
X-CSE-MsgGUID: SGmXWDjFQGqzfcOyr/9P1g==
X-IronPort-AV: E=Sophos;i="6.05,707,1701154800"; 
   d="asc'?scan'208";a="182745230"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2024 05:12:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 05:12:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Jan 2024 05:12:22 -0700
Date: Tue, 30 Jan 2024 12:11:44 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Wolfgang Grandegger
	<wg@grandegger.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240130-narrow-lyricism-8b25baac7bb2@wendy>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
 <20240122-uncoated-cherub-a29cba1c0035@spud>
 <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_041245_670823_2A5E6BA7 
X-CRM114-Status: GOOD (  18.46  )
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
Content-Type: multipart/mixed; boundary="===============7260568721640000058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7260568721640000058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HOtgW7KLF4e36W+S"
Content-Disposition: inline

--HOtgW7KLF4e36W+S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 04:31:32PM +0100, Marc Kleine-Budde wrote:
> On 22.01.2024 14:56:09, Conor Dooley wrote:

> > I think we already had this discussion on v1, where I said that the
> > binding requires the clocks to be in that order, regardless of whether
> > or not clock-names is provided. You feel more strongly about it than I
> > do, so I will add them when I get around to sending a v3.
>=20
> Yes, this discussion sounded very familiar to me, never mind. Keep it as
> is, and let's get this binding and the CAN driver upstream!

BTW, I didn't see an ack on this nor do I see it in linux-next (yet).
Are you expecting the patch to go with the rest via the clock tree,
via the DT tree or will you be taking it with CAN stuff via netdev?

I can resend this one patch with a netdev appropriate subject prefix
if you like.

Thanks,
Conor.

--HOtgW7KLF4e36W+S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbjnfwAKCRB4tDGHoIJi
0td9AP91wL1UJKxv7WEXkQU6wml5iEFKMQpde0b5OMFJLiz7ggD/cJBfDDVA8GxG
4K79+ItvQhc3pNrmvQLtKEyZc1+fRQ8=
=AXqd
-----END PGP SIGNATURE-----

--HOtgW7KLF4e36W+S--


--===============7260568721640000058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7260568721640000058==--

