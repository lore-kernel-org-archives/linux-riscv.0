Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E156C25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qeV2M0K6ADlgyc5FMftc2gJyZ26rUBVivE5h6+DWUDQ=; b=NeSOJicJyLpCO2uYw85PSr/QaD
	DWQC0LtIRXBtlCiUH5A/fxH09J4MDGwkOF25AB/dZXj5j6LRJW4rNvc8w+9ikgXskGUX32QgzYbg1
	A7JDUynnYTiYotp3S3ayMCn110N6j5asFODZFsFssiBaUiCCYocQpIrrgiHRLce9rbjVLZ4OAmOj1
	+R+mmvU1E9KQcnt+o3caXUgMhDxa9fhBHQvvRAl4JWTx47iI+gSUG3Cp7Wf6dEtfEunpRO2GSx7wL
	A9u28+JK1DP3OmtZJRfeJ/4xhqUuArxMQKlp/8PrAZ983tIEf8Cix+AIaArXq9iEZRV063OYSCBLd
	9ZrWapxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRjJ-00H1sH-2K;
	Fri, 27 Oct 2023 18:38:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRjG-00H1rK-2R
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4C5CCE3D26;
	Fri, 27 Oct 2023 18:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A09C433C7;
	Fri, 27 Oct 2023 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698431917;
	bh=ST4J4uVD7J/Mq/vL7XaZM3mtZ3PwaVzL06JUPaESq9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbLXCIvymjtmabOlRja1JfUu227rsbH09ABUPCat0bpYPi6WIZl1Pb2j7k+Iyp3nn
	 hngm5E3WTkLFgjQQ78EWCRFxYTR6bXnlHKxl9v+b41z0WZgtgVrTpKoWnZfFI1d43Z
	 I9WFavBLdwNddrmA8F6aYO5XdxwFDRnOLfukH8AVEi2tMdU3uNLUsiVFkrMX/gqorN
	 ordH55IwUfqQd8L/VQ+cAPEn+YaPl4oedOVpFLP4mj+q/OjiVn8UJooq05myswfJJj
	 TIYiSZA7LEZiacNU4LMvo5yEyuwtFRU5MfdIF49CD+uFr3oAvYODKBtpTVhPe1pD8U
	 8P2RrSgBKVcDA==
Date: Fri, 27 Oct 2023 19:38:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: cache: sifive,ccache0: Add StarFive
 JH7100 compatible
Message-ID: <20231027-freezing-pointed-53c73b0ae227@spud>
References: <CAJM55Z-vw1sbks0KcHOXMzP-6c9NMg+GOndi2pQ7iyWh0=oQiQ@mail.gmail.com>
 <20231026-paycheck-equation-b0f1a1191bf2@spud>
 <20231027182236.GA2853373-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231027182236.GA2853373-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_113842_970292_7C6F6126 
X-CRM114-Status: GOOD (  15.64  )
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
Content-Type: multipart/mixed; boundary="===============1021764783415823770=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1021764783415823770==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SeokC8kRK7bMnsPN"
Content-Disposition: inline


--SeokC8kRK7bMnsPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 01:22:36PM -0500, Rob Herring wrote:
> On Thu, Oct 26, 2023 at 02:10:37PM +0100, Conor Dooley wrote:
> > On Wed, Oct 25, 2023 at 11:56:37AM -0700, Emil Renner Berthing wrote:
> > > This cache controller is also used on the StarFive JH7100 SoC.
> > > Unfortunately it needs a quirk to work properly, so add dedicated
> > > compatible string to be able to match it.
> > >=20
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> >=20
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Did you want me to pick this up? Or you or Palmer will?

Me or Palmer I guess, I was going to take the lot together through soc.

Cheers,
Conor.

--SeokC8kRK7bMnsPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTwDqQAKCRB4tDGHoIJi
0ublAP9H4KL8LXkV1jQ9dF6slNKqtn+yMaV3hmHpa4k2f/lnowEA7Wl2/62I5sVs
OBGRLUt/nQSPEMzEklP7Tup5Er1tEwE=
=Kmup
-----END PGP SIGNATURE-----

--SeokC8kRK7bMnsPN--


--===============1021764783415823770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1021764783415823770==--

