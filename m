Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977FDC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph+CxP01ykqznJhWGc9SXGxJs2kXxir4pu1V70QG7LU=; b=sjkt7ogF9EDMh3e9sZGe+insFA
	7xsQHAWIZk40axXYv1jmhi47luBAoke+LOfJD5aCh8GqE6YqH+Caux0PwAfwCQTN+Ua4yH/MCOyF+
	MnuTq98jMHAQgjISKZE7osYghGB51VF3jO6Sontq4J4Pif0As6Gzsi5DM3qsO5AZCGU9yJW9q3LU/
	+T+vxTZuzl/MU4OHGLx3tn4pcQtp3yLWY6pml7FkGDUfijoHzh2UY6aXSvSml+OgoUf327Bdz5XM6
	lIQV1o54r0oCCuhDNZSLCGQdaH4OMbPbjrazbd2kNMHpohFDQ+AujQnI+YJRB2AzxcQZNP9lO8y7P
	Gl4xc+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeXd-00GA74-0B;
	Fri, 08 Dec 2023 17:21:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeXa-00GA6N-1M
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1729CB82B23;
	Fri,  8 Dec 2023 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEEAC433C8;
	Fri,  8 Dec 2023 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702056088;
	bh=ryi1+JoVfvgu/u0KzMXd0k5DlGLPr5+GS23H098zLjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asAvpaBXzdOpyoA0TtI3pkRNSJhbYdZyq+M5kiBfp3doZzKntMBxjRpQZL/i/E1pW
	 X9KMj34VwfBlGJe5jJv/TcIY1Rsf1XvdBeVWDQOrTHKuujFDz3MhcAY3sVco58dHET
	 Ac3nVenKZwcCxdoONX+h7Ap4l8xSIbByhRuDSXyBBaHuTdd781U39IpaUa4nQl+hJ2
	 aTVhjLoSzphqmmvoY7inlhIOWstPPskRHGUnUMjF+/KT/55bqKHJo0OxKxu2HnlZ4s
	 jbNXijq5InVNIvpg7bDRGWD/okT2k8pYX5NvvJJEHGbwV2wQmgI9zGECJMnwTni8IR
	 bfsBNvXrybyrQ==
Date: Fri, 8 Dec 2023 17:21:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v1 0/7] MPFS clock fixes required for correct CAN
 clock modeling
Message-ID: <20231208-overlay-idiom-620c83d2775c@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-atonable-cable-24ce1ceec083-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231208-atonable-cable-24ce1ceec083-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_092130_596398_809B8164 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: multipart/mixed; boundary="===============2986243055390506855=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2986243055390506855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qTXgDU+xTXR37z/4"
Content-Disposition: inline


--qTXgDU+xTXR37z/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 06:17:54PM +0100, Marc Kleine-Budde wrote:
> On 08.12.2023 17:12:22, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Resending cos I accidentally only sent the cover letter a few minutes
> > prior to this series, due to screwing up a dry run of sending.
> > :clown_face:
> >=20
> > While reviewing a CAN clock driver internally for MPFS [1]
>=20
> > 1 - Hopefully that'll show up on the lists soon, once we are happy with
> >   it ourselves.
>=20
> A CAN clock driver or a complete CAN driver?

Heh, should have proof read it again in the time afforded to me by the
accident release of the dry run.. It's the latter, sorry.

--qTXgDU+xTXR37z/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNQkgAKCRB4tDGHoIJi
0iZWAPwNWUowlloTZivBoyo83wk1jjTAlFSA9wYjLGxZhT8cXAD7Bt8TdOacG3dL
eZWhIXHj1CMUfYoRUaqAPO5bzj51xAk=
=/P9s
-----END PGP SIGNATURE-----

--qTXgDU+xTXR37z/4--


--===============2986243055390506855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2986243055390506855==--

