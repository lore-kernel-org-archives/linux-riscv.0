Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D247EEAA5F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVMPEzblmhAsgJq0D+BxLuHHlNoywtNYILpsHMESyvQ=; b=Jwx4xe5/yuyaTDFORDwvzKKToT
	cNPDShoReO+sEFQFt2Svzyeu3eYfAsK+mR3YMXY6PKKcAHMdxb68lBbh1fDAE3A2PRwhlUxr6RN/S
	17zMaXoYORmipDsXZfGbUj17Gr95D9VG7RxvA+4esPTS2nxcL9sGpk6jBQ/+9ILMhVjT73GB2ePcj
	sZQ9WJHfxgC4Jxo8Da7Fc/HTcwBCJoUQuzY7ZvxI/hqOnJAbzUr+O5iV4vAa9f96v1XxFoeO8X20o
	3uSIlAcipWXQhmBdh+OHBEIuy/Le2igba7TRV6eZlaENJo07cn+BXdDwnop1MfEyeUboqh3W9054y
	1srvhnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqfl-00920r-2C;
	Thu, 14 Sep 2023 18:02:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgqfj-00920O-0U
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 18:02:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 492C361D57;
	Thu, 14 Sep 2023 18:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E94FC433C8;
	Thu, 14 Sep 2023 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694714553;
	bh=u2uKvCKS3midq3haWQnJKbw1soML/UV33sJ4XPbBMH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNewOcqz4IYX15gybK4ltio6PlLFZBa6NN9tHoxcvJfKbppUVlS33bLQQ3ev3n7n3
	 5jeV1xOdPUqdMbyF+lacjzlKV+oCBGFiWQLfavlVVBnkPWr8W9obtKwGmkPLrL6jBB
	 HLPdQtP8IGVrTzZt0D42pwrlzGKj0KB9PKYoJ51XkU2DtkVzOa0X2MKtJTTbJ4/DOj
	 nmU9+dux0DUar3PEqDQStAv/VUR6LOesWGg8zQ9/VWSZN2oYxjdGqUX6IMDowKBSZo
	 Cty/e7i16lO3xVVUWKnFFUkLdBzlkYm/WbYIQbbi93RFYAbgJXB/IRncId/cKoG7FX
	 SUj/NOwqEbHag==
Date: Thu, 14 Sep 2023 19:02:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <20230914-thinness-overtly-70c49b219c26@spud>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <20230914-mural-deskbound-0e37d0767f6f@wendy>
 <ZQNJ0LQhZyJWlcSy@ghost>
MIME-Version: 1.0
In-Reply-To: <ZQNJ0LQhZyJWlcSy@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_110235_231883_575D45F2 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7207954748709180390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7207954748709180390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ChjGALr+r4z5FydN"
Content-Disposition: inline


--ChjGALr+r4z5FydN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > +#ifndef CONFIG_32BIT
> >=20
> > These can also be moved to IS_ENABLED() FYI, since there's no 32-bit
> > stuff here that'd break the build for 64-bit. Ditto elsewhere where
> > you've got similar stuff.
> >=20
> > Cheers,
> > Conor.
> This is an ifndef, so 32-bit compilation would throw a warning about
> shifting by 32 bits if IS_ENABLED was used instead.

 Fair enough. I did accidentally invert things in my mail, I did notice
 the n, I just thought it did the elimination beforehand those checks,
 sorry for the noise.

--ChjGALr+r4z5FydN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQNKtAAKCRB4tDGHoIJi
0hQIAP0TaJ5v9C2aA8jh9MwH/7topxwBBzwWIRbDvY/3q85ADwEAvxQzCaG4ICHq
BiX5F2KfS/M6cJhJcXvBCcJrctFo8w0=
=Sgyp
-----END PGP SIGNATURE-----

--ChjGALr+r4z5FydN--


--===============7207954748709180390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7207954748709180390==--

