Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CA6EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvn/XLCFjBseR2tnqn+YzqiQ/IyDeSnC8r+QGkHbnmo=; b=mn/dZ/7pMHNK6W/f1cdB8sUcQ0
	c5SrHSP9c/CgztRASem0kWS72TObW2ogO6NXnwA6cLjF+Mvphp/SCeeEYk/84gvKzRlaLBzO3oxaY
	cvtPNcsTF5VLc4gyvRgatrenFnAezdjbqOFIUz5n717FkMppEBCSGG9fJdBFjsKj2W59IYVoNA9rH
	LGkRl8R4c3YFN6KaUIArEI1HWVo4hf5AOrOfyXL9fQH97meRGVNmr2K04AJbTZKPRaQj+RvgVmCG4
	k9WVqadMyJXj/bylEjFigDRp2eUvHhB3t7gOZ4gzzN4ssu697xvHEu1h6qxakve/1JBCDodCYkzOR
	aC1iT4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAaid-0046qF-04;
	Sat, 17 Jun 2023 18:32:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAaiZ-0046pK-0m;
	Sat, 17 Jun 2023 18:32:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8836660DFA;
	Sat, 17 Jun 2023 18:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E07DC433C0;
	Sat, 17 Jun 2023 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687026730;
	bh=BPe2IYTHljmcrMFeMir0hnmfuCQpejeGHvXcXSDBQdY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=u1vjnV0HF2Hxycru5cALAA+PertYSaEP3FrkDdFh6ATyNGItXXL8DEjtw5nLO97gK
	 RR3RU/0wGD+ebnMuBwnsdmm0aVcE3w8X0uR7bkXj6RkmVCaZCePAvrMG7qSuQ2vQBt
	 m7+oMHmLQfKS8Ol9U11zw/dsIKlAeNbaV28MMQ5spxN/+8/j2W3/A1fLjJzfV5TKSz
	 BRV0M6II0sO6Aazsc417QfguIt6ds2u0H6LhT4+0r9oQomY5KqLZJHFkIuUt51wpif
	 l0HHinZKGS8kKusyFrexFFSDOLO/i4Qizjnffz/VAwaDF8bToQ2mHomgCk169zkwna
	 fQ+++aPts9UKg==
Date: Sat, 17 Jun 2023 19:32:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, soc@kernel.org,
	Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] Documentation/process: add soc maintainer handbook
Message-ID: <20230617-succulent-surgery-3dbbf9454737@spud>
References: <20230606-escapable-stuffed-7ca5033e7741@wendy>
 <05c50d10-080b-43ab-9131-98f71508ac2d@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <05c50d10-080b-43ab-9131-98f71508ac2d@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_113211_318874_31D30775 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Type: multipart/mixed; boundary="===============6394336918969189107=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6394336918969189107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXt03RDOZ/SFc507"
Content-Disposition: inline


--IXt03RDOZ/SFc507
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Arnd,

On Tue, Jun 06, 2023 at 12:23:26PM +0200, Arnd Bergmann wrote:
> On Tue, Jun 6, 2023, at 10:27, Conor Dooley wrote:
> > Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> > would be helpful in trying to bring on board maintainers for the various
> > new platforms cropping up in RISC-V land.
> >
> > Add a document briefly describing the role of the SoC subsystem and some
> > basic advice for (new) platform maintainers.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes in v3:
> > - sort out a rake of spelling/grammar bits spotted by Randy, apart from
> >   the one noted as a suggestion
> > - drop the refs for document filepaths
>=20
> Thanks, I've applied this in the soc/newsoc branch of the soc tree
> now, which is where I'm already queuing new platforms.

Having cited this document for the first time, it came to mind that I
never mentioned putting the submaintainer trees into linux-next. Should
I send a follow-up patch for that, or do you think that that isn't
needed?

Cheers,
Conor.

--IXt03RDOZ/SFc507
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI38JAAKCRB4tDGHoIJi
0nr2AQCIEMd90RhzvX3lE850o7J/LohZECq0XBWZ+2pE65D+wgD/dFQUFhEDm1DU
l4ba/OpCXfJP6y5zlaUcycb/4Ys+QQQ=
=T17D
-----END PGP SIGNATURE-----

--IXt03RDOZ/SFc507--


--===============6394336918969189107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6394336918969189107==--

