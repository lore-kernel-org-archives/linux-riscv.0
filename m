Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFBBCDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvYg6I/yfoYupLxIT4qoEaITmg67veIw5Twu3ZFg4lY=; b=DhkRL6d8s9jH+jFqTV8XLTvy3X
	VwzE/crSxjmOgSRY79oMpZiR2VaynaHVZQoJPybkk4Y9ztUwPM3+NZ2DMhQgyhuQm6th8LLMcf/wP
	qRJlVbJzoCKZGOj8RAYO1kHExHCy9sOOBRUSjsAPffFW5Lx6fqwkLQMxURwf26JLOS1CKNqOSMfm0
	hIGhGIzXQfomivErunS6imA0usg2lCHX5czd+PlB2ZJ6BxIoU8A5LGZTLxuukmepMAGFsBvoVB3ja
	ZqqpoFyHpA6zMtoHSLmCQ8h50ZvC/4HE9evQPlpf69d+aVHGvvwLYiiqxWgY7BGHq/bN9zq03ljnc
	awNzEBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQCT-00Gw3D-0Q;
	Thu, 19 Oct 2023 10:24:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtQCQ-00Gw2a-0T
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 10:24:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F7AE61BA2;
	Thu, 19 Oct 2023 10:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF24C433C7;
	Thu, 19 Oct 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697711057;
	bh=8w/zkHRa1JdAqlwq/E0kRF19C4ENGGq0dlrO06vTgUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eK1Xp6sFnz1B6gliEaZ+xBeCJf1peb9IMNOhrsL4RWq+dnvbEfuuC2dsJk/JRRkXM
	 J3ZkFfUpKW4V5Vd7PCpdXcGP3ZN0OCHdeGIWhNBkfTBlxN+CFqPazcwS9gJ6H7w2DQ
	 ovFyEaelYdJh9ij0CwFsJXmMpZ2jZVgkvvxfUpyp73ptRTAneUOMqEjsA1ukabD6rd
	 vwhSOg/c5khxXZ24UZ2iXryyq1gWZcZst41KXM57jeVjBWmmfB/iyJZzra+VrN+J1q
	 wo91KM3ZtTml7zOAIxrJ3M9F3zqBX/plEF85/b19XJo/0XoIbvKA/JtA2OEgGPaqBS
	 R3M9RKhLdYPLQ==
Date: Thu, 19 Oct 2023 11:24:11 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231019-smith-purging-627c50cfa3de@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
 <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_032418_234255_C646281C 
X-CRM114-Status: GOOD (  10.59  )
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
Content-Type: multipart/mixed; boundary="===============5084575417083581751=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5084575417083581751==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MSxFgo6sxF0bjJRN"
Content-Disposition: inline


--MSxFgo6sxF0bjJRN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 11:46:51AM +0200, Cl=E9ment L=E9ger wrote:
> Indeed the comment was a bit misleading, is this more clear ?
>=20
> /*
>  * Only use CHECK_ISA_EXT() for extensions which are usable by
>  * userspace with respect to the kernel current configuration.
>  * For instance, ISA extensions that uses float operations

s/that uses/that use/

>  * should not be exposed when CONFIG_FPU is not set.

s/is not set/is not enabled/

But yeah, definitely more clear, thanks.

--MSxFgo6sxF0bjJRN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTEDywAKCRB4tDGHoIJi
0iLiAQCVvbdU9kMXk61P1KCsz7hQbLc/FDPWHPqbM77la819uAEAmKVIMjRr/pbZ
zKR82CM26DAk6y9VBR56NcHWjJucaA4=
=NmdN
-----END PGP SIGNATURE-----

--MSxFgo6sxF0bjJRN--


--===============5084575417083581751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5084575417083581751==--

