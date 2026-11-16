Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B831606A32C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLdPIGKW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lBwdMtiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bz/9XliqKISsdxir5pEOJQ3k/mGkH92/JCKhLjYE+t8=; b=nLdPIGKW3+q6xpFA+CB60lPZEk
	T0QDColGlmTiRFCZxE5th1/+IuN/EId865RmCHJXvx/Gd4YnxUsHA67TzqBh0X8wEjZsULhCecap7
	t22dPzfCmoI/3raTQGljjnqDoJo6plRmkhBnLJAVfg8k5tsEY7PD7ZP5B03nKXXbq7TvZq5mhvLJz
	91iyLjZibx5c8ODScoJe1MvX8wvVEIwnx18MwzIA/wrqOGS6aPyXsT+jZ8LZB6MVGSgtJaN6tUvOI
	5JvmASzTb+s2pmdslw1Me0oRjiU4/PEB1Fu8vMDmnRkUVHUWJQKsJ+28EloccZ6qa9D7egl/gFy8d
	669uyrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13I-00000003UUR-3boA;
	Mon, 16 Nov 2026 18:03:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13G-00000003UUK-3pnK
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 18:03:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6A6541E9C;
	Mon, 16 Nov 2026 18:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCC61F000C9;
	Mon, 16 Nov 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852214;
	bh=WFKF8TJjLvFYAaPjC2YxhZShngdw1jZ6Mlp+B+lilQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lBwdMtiPQ6HAFV7uxQPyLzZgj+HUBCr9yvaX16XdLnUVxWLsNJX46V9J9h3ryEmJP
	 OsrfDTbOXhXYgMJuqcVR9XHuAdjRWp330pSj9YTQBsJPdLm8POiJCZRDeHip8eqXRB
	 OfnG8XxVbjU32Bl82wRQ3spbBLxsusYxo17una/YDzzfVUQwnt7uS8d6m5n4vN9vvL
	 nnv77br/EkPkaTzwBVdSEaJ3XEFyOC/0FOA5al7pGxmm9Mp7tRTFOQXDeb8Q25rdhR
	 yTv4rAE5MXTY+YQa5hijrMyjMjJL//Bo6pj64j77Zw4eoDbAD3JsEuPtM8ZpAyCp1Q
	 E4dQzWRPOnMAg==
Date: Mon, 16 Nov 2026 18:03:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Message-ID: <20261116-renewal-freefall-49f4293903c0@spud>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8681482193004682617=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8681482193004682617==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6d0eNxJMD7Efv/LA"
Content-Disposition: inline

--6d0eNxJMD7Efv/LA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 07:52:15PM +0100, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thanks.

--6d0eNxJMD7Efv/LA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtFcQAKCRB4tDGHoIJi
0oJzAQD7hEupl2KpNFe/m14Et5KQQJiFvG7NFJaYnD3zS3gt0gEA/HZL9OtWtfSf
x6oKb0UDrB38UcUYIyLXW9rekLgjQQc=
=nK4E
-----END PGP SIGNATURE-----

--6d0eNxJMD7Efv/LA--


--===============8681482193004682617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8681482193004682617==--

