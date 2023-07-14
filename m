Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB29CEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Toi/xBqPgBJuAqu/Nr5xtbpHTMvMV7kpcGbdkBtZxXI=; b=L8oC7AT0i6Ui0ToyTB9OEljkUu
	Wu7+sohAwZXzqfYanfGdjfwbaZ+9YMJAUCbxwJfZpbw8zCN4l3Vb7HqwHARNE5+yRtxijaPOYGR/C
	BX/DYVyRarea6EeUIbTDx0HIcGAq59EnJZjRmkJ9Afw933gDJMYszlRAkABT7pJcUJZmLqyqmv6kD
	picEWyQzKozCBK44M2Xx5pa5xVbQdgZWoWxEF+YvzREsZmeu9vTZ8SaVkAFPokqwx7PQYicVG0PeZ
	WEiaf5MUjdqHaVhzkduejwfAY4ylvM08JNJ1VHFR9mg30UrWgvinONA+StKjUC19IuGneCuDcSYRv
	VKgaa3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOM1-00754I-0m;
	Fri, 14 Jul 2023 19:21:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOLy-00753t-2P
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 19:21:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CC9A61DAF;
	Fri, 14 Jul 2023 19:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753A9C433C7;
	Fri, 14 Jul 2023 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689362480;
	bh=HlSo97v6Rn4ZFyzCP9MkWFuPOjxFt2cG2QzHLmHNqgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/GIKHqG7xKwKn0yC95mrTLzcgC/2pU09q1KpO2/W2606kEovtTwedZprhkU4+6Xn
	 p1e/NNzDBMVKmgPsgrx5kAGyGAwjFSdb3D3ftkQ2z6Vk6CxWEh8E8/PkOmWPKFRylK
	 TONSppvLg4hwzVwP+LXi3ZmIBmU6vBlHV1gDwnlH3tguY9jrOe4OZujJAiX3dwZR7O
	 cRUjBLMu+o1DSw//3rTRVY7HtNp+f9Kf+BIUn7mdiVNKtKMNvzN3z8sswLpML6hxuS
	 LbJucjVu3RcNPjzrwOwGjXG5PXevWskAlZkSqeU7l7z48Kb6niBTCBoEPlnuzmw48I
	 5GAjxTZf1nytw==
Date: Fri, 14 Jul 2023 20:21:16 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230714-vowel-compound-4161ecb6b48d@spud>
References: <20230712-postal-affiliate-0d61a209897f@spud>
MIME-Version: 1.0
In-Reply-To: <20230712-postal-affiliate-0d61a209897f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_122122_830537_23D641CD 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: heiko@sntech.de, remi@remlab.net, charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5796002971103572949=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5796002971103572949==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SmLyNhNcF1p7z0Iv"
Content-Disposition: inline


--SmLyNhNcF1p7z0Iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> The last merge window contained both V support and the deprecation of
> the riscv,isa DT property, with the V implementation reading riscv,isa
> to determine the presence of the V extension.  At the time that was the
> only way to do it, but there's a lot of ambiguity around V in ISA
> strings.  In particular, there is a lot of firmware in the wild that
> uses "v" in the riscv,isa DT property to communicate support for the
> 0.7.1 version of the Vector specification implemented by T-Head CPU
> cores.
>=20
> Rather than forcing use of the newly added interface that has strict
> meanings for extensions to detect the presence of vector support, as
> that would penalise those who have behaved, only ignore v in riscv,isa
> on CPUs that report T-Head's vendor ID.
>=20
> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension=
")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

=46rom speaking to various people on IRC, and Guo Ren's information that
the c908, which supports the standard version of vector, has non-zero
marchid, we may not need this patch for now.
There's no real urgency to prevent a future regression in support since
marchid will differ between the c908 and the existing cores that only
support the v0.7.1 version of vector, so this could be applied at our
leisure IFF an issue does actually crop up. I've marked it as Changes
Requested on patchwork.

--SmLyNhNcF1p7z0Iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLGgLAAKCRB4tDGHoIJi
0h/VAQCYGfUSE9ZiKrnWQ1ppMmMrYcUi5sjQhpIdqOJoBigYyAD/RU+Sb86mvinn
FgvTrVn/tvKhc4tsSOO4I/q8+HH7tQ8=
=p7d0
-----END PGP SIGNATURE-----

--SmLyNhNcF1p7z0Iv--


--===============5796002971103572949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5796002971103572949==--

