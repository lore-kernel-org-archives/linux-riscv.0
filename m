Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C35606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VPyFLhRn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q70UHiDe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VLztKEDr9UEjt/Dc9aRjfbeIRoGT33Nf192OdLJBwJY=; b=VPyFLhRnyaM6AltckcTCKCTdCk
	GlSclw26A3rUrmSpZFGoz719l6dG+/gnE8/aoFRN4v4HEYhOoOFSYxWCPEMV5YHPsKqWcLYnF2oPe
	5KX8V+Jmoem0k/YZ7Xob1iQQ6gSjFwHMeAayPEps/3/qwKTwLrTvNlOT34KwKe9gkLii7gYW9RXmV
	Fpq4UlIRVCMlOpmsdSH0jCrh9rhkgzVEZNaN3TVVX8nywsT2f9wp0sB2MgoSdglFmDPBlex2VbwcY
	qHT4qsspMesLuDLMRHVO150XzQleMri1tiKqgCnrwZJDqwsklOEQHEEA6wAmEKMhGFK778gKEBtxX
	uzxkNaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk3n-00000009rNJ-0jyf;
	Wed, 18 Nov 2026 18:07:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTk3j-00000009rN3-43uT
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:07:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AB13E63633;
	Wed, 18 Nov 2026 18:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805401F000C6;
	Wed, 18 Nov 2026 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025222;
	bh=6w82fxlooNXQ3FRv1spxGq7tCSr7KtlspMZHNaHW6JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q70UHiDeMAMQsw0MAvhhZ9W6sOlXnopF0pfq7j96Uxl6US4q702R07x57G5EfSOMH
	 vZKPBs8HFH13kMCUafN5GfPNXJwl6G8fDsBbu3gjz1GY6pNyHt4UI8tUgphaiHKHyW
	 kbig+K0jXYGUyiBFK9VFPvtQq6hlo2D8muaJ+4Ke+KeWWnDQtcZQ7zoemel7RmAWGQ
	 TzBmi5v3dmrMYBPSxF4Wo2Rbx8Km8DNMKlb2HKS5HMa70dwtGswThlrkdc513e5LKu
	 pmYT3RPYYvRS4yXjyqKoWSYZLSWh3P9Hbkz5Pq6rTWZtbA8elfPdejp1oukP5ZKe+V
	 FY8mOHOUoedhg==
Date: Wed, 18 Nov 2026 18:06:57 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: eswin: Add Milk-V Megrez board
Message-ID: <20261118-tiny-divinity-920c0b7f3be1@spud>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
 <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3495929352099548263=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3495929352099548263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LIM1ykOGY05fRYAT"
Content-Disposition: inline

--LIM1ykOGY05fRYAT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LIM1ykOGY05fRYAT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3pQQAKCRB4tDGHoIJi
0oRNAQDIIAUh/nrsZKHpfMnlgt+ICbZMj8fQ6CLKTflq8PCuwgEAgwVnOJlhSx6k
29KD+La6RdqEaXC37asFR1QjF/UoPwQ=
=6Wsm
-----END PGP SIGNATURE-----

--LIM1ykOGY05fRYAT--


--===============3495929352099548263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3495929352099548263==--

