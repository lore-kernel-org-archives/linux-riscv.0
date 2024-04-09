Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD93C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NIr17CVqK5UGA5Y2mqOSduqZI1VmvRppmQBTW9AYJY=; b=XcKUJooORckryI8ueu918mc5Wk
	cxEcCFGoHA9V7Jq58f/WoHZ7pgBM0rKrgQT/0FK8rBgtIX8julkRwuTq6zKfMfWLc6apw3DQeCLeS
	p2OHxo0TXC3ZB+Et6iXfvzu53wG5CJZFwKUksSYnzNzNQE7Ax/3bKAw4Mp5AqlgJuLXUc9383Ks48
	ySIiUwhTiHXS9PRfXrwF+Xfj3HYqCvdIPC2duyAoQ6t8u2soW4yMSNAQhHAwtI+WWjUArfxztNh3O
	niNwnpo0t6XKUiLZiXzQa/Z3tr4pVFB1lgmmWj9l1bowyxrhpG7+LpK9Zp7J21e35o92smKoHvuB1
	dLEzzYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCG6-00000002NCv-3S5T;
	Tue, 09 Apr 2024 14:15:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCG3-00000002NBF-2CLh;
	Tue, 09 Apr 2024 14:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BC48CE1368;
	Tue,  9 Apr 2024 14:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E60C433C7;
	Tue,  9 Apr 2024 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712672128;
	bh=k430QK7uR0afWm5iLxyZ0H+bkw6eRZQHyWK7YRup3qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPcB3SmWXdeEnUbHOsA/wrs2nSX3lSS69f6IVk9/NSkY25s3cnMNpw0fkW2aQZdMn
	 k6eOHyMTFwCXWqH+SOFvuJq1qfDMKu0tIPfOygAOGeOOKYGwq7TnyifWDLdN3Drr+K
	 rYztZW2ot2BRQq2pzr520CrnGiLYfIBOowwWzk4+BSTtmb+m0ucPk1ZOspX8500nvg
	 DdpRoVxNzdz3G1fVTDBSRhGTrkpslqZwquPr2uSmGdmznUKePxWBEKEDC3qAeaCCOq
	 aoiK5hrEmw6pHNtoXgJUBj5tYbTOjO+GfYD6g3Z+iXjsAWXggI0FogzFcmeeSE0koZ
	 nQwLTKhHv8qYg==
Date: Tue, 9 Apr 2024 15:15:23 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: riscv: add Zimop ISA extension
 description
Message-ID: <20240409-dorsal-bullwhip-d4c59bc4975c@spud>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240404103254.1752834-2-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240404103254.1752834-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_071531_889441_22B752E3 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: multipart/mixed; boundary="===============8523575835686128457=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8523575835686128457==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+LHcW8rxlKd0RZZo"
Content-Disposition: inline


--+LHcW8rxlKd0RZZo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2024 at 12:32:47PM +0200, Cl=E9ment L=E9ger wrote:
> Add description for the Zimop (May-Be-Operations) ISA extension which
> was ratified in commit 58220614a5f of the riscv-isa-manual.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+LHcW8rxlKd0RZZo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhVNewAKCRB4tDGHoIJi
0n8eAP9G5NnKVLgQMb1lC5BZ3jPuQhdNqtENnurmzVKeuoB++wEAq+L+bZ9N0ZB3
+NWu0wLgJxehhQ4lxyYWfVXAcV19WQg=
=pnap
-----END PGP SIGNATURE-----

--+LHcW8rxlKd0RZZo--


--===============8523575835686128457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8523575835686128457==--

