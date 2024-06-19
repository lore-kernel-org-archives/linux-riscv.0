Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601AFC2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3305P0Oee8TraFeX+zqRTYHcKV6l2CF50YTTjY3/q7A=; b=qytxNkhBjlilVCZw70InfcDR5F
	em4+qg3KxkauWh9vpsUMQ69f2dEn8/bdz5UiDUrHnkqitjye7nWAYV+98XHj8IT9DWm2ilu9uQbum
	U1Bb5ALb0e1Y5NrL2Xs/KfXiDcLimLGDa/bYMwJZqVrZR5QCSWmbcPHH2XAPntmKg247HPDyrd6tx
	7Cn6f2jVJl6PgWNJbe1My/LTMV4OxtA9XAfPFQcenwcSSPYUOap0wC4pYGG4iubMmY5pon0A3rUIz
	52iz4dVGX785AD/g1sYwl49k6vc9gEKppRCgsUcQfbsMrJf0grtc8Y/ymfIZSRWSqLTarPHwqniwf
	xzCorUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtL7-00000000vrW-2pNO;
	Wed, 19 Jun 2024 11:18:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtL5-00000000vqV-0rC8
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:18:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5CD5CE1D1B;
	Wed, 19 Jun 2024 11:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F54EC2BBFC;
	Wed, 19 Jun 2024 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718795929;
	bh=z4T+IJBLwyf5+aKRPm9GucoAyD3f08lBm6C/VluK0Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipSTa62SfcCD6kWVUoBW1qjbaMOFa/kNXSXeFPQ/n8wwW0lG/18nkza5lJUwCeqQb
	 quHlYsyx81Og7GSKknkYPGpIWcApAhknBCQ4jsDn2VGdAqIJ7K2eGh6yWmQPFsceiq
	 jdVoTY5HHRzeMVOMEIIjPkJ84NkRRCCeH6lzcjqsTa0Z1rKJeC66LjJE5P+Y0u7ryh
	 PyBQqQWaHZRkEcLspdW64OAiywWGnljAeNCIRhRYnqBUa7INu2uPjOqNa5gsbRBSNi
	 hdqgVg2Cjgoui6YypjZLF+Z1obYbXfUdUzQKhvCFiHJuZc6kZlZeBDeOW9J3Q7cscY
	 KJUtQqN8az6Hw==
Date: Wed, 19 Jun 2024 12:18:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, cyril.jean@microchip.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [RFC v1 2/3] spi: microchip-core-qspi: Add regular transfers
Message-ID: <20240619-frozen-angriness-8648636f1440@spud>
References: <20240612-brigade-shell-1f626e7e592f@spud>
 <20240612-uphold-dinner-a47b4c44be18@spud>
 <ZmnPh39YyfS4ocNU@finisterre.sirena.org.uk>
 <20240612-spending-stalling-62070dbbcf3d@spud>
MIME-Version: 1.0
In-Reply-To: <20240612-spending-stalling-62070dbbcf3d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_041855_441656_42191D9F 
X-CRM114-Status: GOOD (  15.93  )
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
Content-Type: multipart/mixed; boundary="===============7132909367085800447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7132909367085800447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bZO+FHlLZI0c0AGy"
Content-Disposition: inline


--bZO+FHlLZI0c0AGy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 09:48:16PM +0100, Conor Dooley wrote:
> On Wed, Jun 12, 2024 at 05:40:39PM +0100, Mark Brown wrote:
> > On Wed, Jun 12, 2024 at 04:48:32PM +0100, Conor Dooley wrote:
> >=20
> > > +	//TODO: questionable robustness if both cs_change and cs_off toggle
> > > +	list_for_each_entry(t, &m->transfers, transfer_list) {
> > > +		//cs_change being set means we need to re-enable
> >=20
> > Is it not possible to implement prepare_message() and transfer_one()
> > rather than open coding all this?
>=20
> If I can, I will. I already found one issue with the cs toggling in the
> code Cyril gave me and I need to figure out why there's a udelay(750)
> required later on in the function anyway!

Actually wasn't too bad, glad to be rid of the open coded CS handling.
I still need the as of yet not understood udelay(), but it looks even
worse now:

+static int mchp_coreqspi_unprepare_message(struct spi_controller *ctlr, st=
ruct spi_message *m)
+{
+	udelay(750);
+
+	return 0;
+}



--bZO+FHlLZI0c0AGy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnK+lQAKCRB4tDGHoIJi
0p4lAQC9ueXu3bI/u1wcG0M7RbuNlGJDK37D2Q/ueWBcxQVIUAD+MkzD/mHoIpM0
MXOkMxtS9lWwiMt8z42Pg949gpXsMw8=
=h1cY
-----END PGP SIGNATURE-----

--bZO+FHlLZI0c0AGy--


--===============7132909367085800447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7132909367085800447==--

