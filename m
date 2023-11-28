Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD646C46CA3
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG66tv7kR+G9Vrp0kuLiv8lgtkSplJPArwoXsgKKDBg=; b=KJr45gI8Jfs726NGTo3zcMOGLJ
	J7sXPpwgb+8wVQtr1+XKnrA7XrfAiMzD9TxuTK1nF+fTV83bffjgxNkeB0a8GHg6BVQsBsuDHImZy
	rvXymnfAjj4RSga4ub8J/2KZVqu0GVXX5NbhRYssFzCMkEeDTk1fY/p8xVLhli6h8lJpa5xYtDAoA
	fVZOMGHLmJqc7NWHO7wROo2zLzA9kF0QTQj9hPm60lpkLNCUyE6517KaiuvDO0BSq1pJ8mTZZfqHy
	Qk87K7xrCAcFwTfVePO6tkfnqYUt6afVndkgXdx+AHRx+kEekJ9tRQJxjImaUn/lQVuIUKFSa7Khy
	tg44GTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r82IX-0061T3-29;
	Tue, 28 Nov 2023 17:55:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r82IT-0061Pq-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 17:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D3D1CE1BFE;
	Tue, 28 Nov 2023 17:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D643EC433C9;
	Tue, 28 Nov 2023 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701194094;
	bh=N3vZMmlwPmMLxmgsU8NU5aW8UlcCxY+iRKRi4fSgJas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hsiw/925cVatmSVS2Mjf+lwGsahVcUe9gEJwVlcmNPn+zWbmwNZ2MPg9C24I1RYFq
	 skwNvzE0segMkYvoLC58hDXsNzhnsX3tfykvPEfkeBlgAQXPLVjPalu2EOmmIgvATQ
	 aoxfGaC2vUW1mpXBAFr/E2qRXkpGsa6WRLj3i45jI8GsHf/aJokHiMdpDsswRmp4Ah
	 DfMLen3NJkBkTvG87EMmW3JR0n8L0v4+iXgXwtJcN0VoeGH7M1OgsO9pWPe5lQyExH
	 iZTLYaSNqnPLlBpXSFPrzBksF+fRvVV8C9J7TpdYC6shFoTQk/+7WWgpHw8LPVNmEh
	 zdq2ORS22eNSg==
Date: Tue, 28 Nov 2023 17:54:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ebiggers@kernel.org, ardb@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
Message-ID: <20231128-await-tipper-2094715466f2@spud>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231127070703.1697-5-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_095457_723662_909A7591 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3790818888657454855=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3790818888657454855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c+Bx+5YDpVONEprp"
Content-Disposition: inline


--c+Bx+5YDpVONEprp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +static inline bool check_aes_ext(void)
> +{
> +	return riscv_isa_extension_available(NULL, ZVKNED) &&
> +	       riscv_vector_vlen() >= 128;
> +}

I'm not keen on this construct, where you are checking vlen greater than
128 and the presence of Zvkned without checking for the presence of V
itself. Can you use "has_vector()" in any places where you depend on the
presence of vector please?

Also, there are potentially a lot of places in this drivers where you
can replace "riscv_isa_extension_available()" with
"riscv_has_extension_likely()". The latter is optimised with
alternatives, so in places that are going to be evaluated frequently it
may be beneficial for you.

Cheers,
Conor.

--c+Bx+5YDpVONEprp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWYpaQAKCRB4tDGHoIJi
0gizAQClyXLat6AoDqeEMU7fszIl0aqY562jWFVvkg9MjgR24gEAzNdLynP6jTGp
PoJqYxyEhhUhpsxklOCYQbwZPyDf8ws=
=ixTm
-----END PGP SIGNATURE-----

--c+Bx+5YDpVONEprp--


--===============3790818888657454855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3790818888657454855==--

