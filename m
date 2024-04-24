Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA62C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvOJA4t388twJkF/ttlEL2FV4hx+INSF8jJ2Ch6wmjc=; b=b24dTXOMRIdqxoVOKydJj1Klop
	okk3getPCF+GzjO+xKPpVdGlgrlQL6YLajTNpFiwXDjRD435c78RZdDLje1WMZsGk8NH1+M78Ja+8
	pBLgBuNHx/69hjDdAW7o7sdG9V4NadRpC9lnFHnG1pQOwf7bAYgA+afBfNwjsDSG8/k+UsnCVtxOx
	QmLi79Uioyvg+tKiEARi7czlyvQh1+puGGMJID7b0vkGpL1/BUcFFL8B3z0Ev0fiQ/7MVgZ/05RGV
	Ddu1YPLcG1eELdwKCmKn2azp8BaVxhi5/K3FtCO1a43lhqo+eZLmbhWiP1zV3JOBZNLRS9JXl66hQ
	6TYlPzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZ7t-00000003XMw-24CE;
	Wed, 24 Apr 2024 09:41:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZ7q-00000003XL9-2Ldq
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 09:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E06B360B98;
	Wed, 24 Apr 2024 09:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3AAC113CE;
	Wed, 24 Apr 2024 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713951673;
	bh=DmgqfuW44VdywBrGJvtHJENdC13JrD07Jh0IIe9cOIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7VZKE9XevgBGR7Y8GVvQ0v8wJhLSCOYBFe+Esm8f0yVpvKCzYLRGagnlmByXYxu6
	 BeXA07s5GYb1A0lRVZKjgAKHs4oll2yOOPL/uQiE5WZ4iDYe6vLYnhrM+LM0+6iqFe
	 wkXHdr/OcL6HKqI67B2gTEaaaerNgvwe8oKWotx9XsJJJV0p9KdNq4b2hes/Pu6o+F
	 6D3vdVFwKTTc904UF2uCfiucl7eSswA6/yT8fTLQCfjOTMFsxkuNo+xoyGThiVHu5n
	 OQOUACj7plMyB1TlogjMFOj872TCFu/uvVsjUXdgxH31MFfMSkz34oQUXSaiEAP3Lf
	 fYHrTfhIjkxqA==
Date: Wed, 24 Apr 2024 10:41:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com,
	woodrow.shen@sifive.com
Subject: Re: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match
 constraints, take 2
Message-ID: <20240424-familiar-subdued-74d8922444df@spud>
References: <20240322134728.151255-2-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20240322134728.151255-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_024114_784899_95D8CDA9 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: multipart/mixed; boundary="===============8368651613996351632=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8368651613996351632==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hoYGniCRGW0L/d+Q"
Content-Disposition: inline


--hoYGniCRGW0L/d+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 02:47:28PM +0100, Andrew Jones wrote:
> Commit 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands
> match constraints") attempted to ensure MK_CBO() would always
> provide to a compile-time constant when given a constant, but
> cpu_to_le32() isn't necessarily going to do that. Switch to manually
> shifting the bytes, when needed, to finally get this right.
>=20
> Reported-by: Woodrow Shen <woodrow.shen@sifive.com>
> Closes: https://lore.kernel.org/all/CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk=
+TWSpyO5xvpXpg@mail.gmail.com/
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Fixes: 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands match c=
onstraints")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

This has been sitting in patchwork for a while and I don't see a message
=66rom either the reporter saying this was a good fix or from the selftests
maintainer that it has been picked up. I was gonna mark it "handled
elsewhere" but I noticed that this was only sent to the riscv
maintainers so we should probably harass Palmer today to pick this up?


--hoYGniCRGW0L/d+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijTtQAKCRB4tDGHoIJi
0s+gAQC2OMK7jO84IcrAmmyEOsduVDzS5yQSH2E7F2Wg60qXqgEAzINRySefoT3O
10KKgUerzVVsySf4ziYhywWUmtNxoQU=
=Cxc5
-----END PGP SIGNATURE-----

--hoYGniCRGW0L/d+Q--


--===============8368651613996351632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8368651613996351632==--

