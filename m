Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B877C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vvin0KyibO47i8aYNMcvyQXu/z+p8yCln3El6slUpnA=; b=IYI1L1nfE2GAnbZwRUJEXx1ycU
	B0zaAQ4sDeZxzGibuDSKqshrjjYdwbn86sD0Qi37tMk74mOHnXuYCFKc+zfjfYgncGelnisKoSdJ4
	k8DvHPuzu1d8vv5zYpIfejtOCB57P2AEWFosJwBbmNomtQSSxW9JDRyksGnJpzTNHUR2HzzhhwXfE
	hrdR1aOS/3dAzg/MXGJE3UONHrTLPUhovB/nqzSrsSORKEuJ12MUJdk8O9gnv28JQNBz0mbT1MMzq
	vBoLAoVUsO/gcxYcCtft2SnYdUCzSRRAfjiJO6SejX8S2GVT43sqZ51I7lviRGy8Wry6cZPB7wzi7
	99fof0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roplo-00000001XQx-19zT;
	Mon, 25 Mar 2024 19:14:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropll-00000001XPy-1bCS
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B655E61155;
	Mon, 25 Mar 2024 19:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1480C433C7;
	Mon, 25 Mar 2024 19:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711394044;
	bh=KaelNukxvsrPYK1N9laMx7thR69JrP770I56DlMagPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVYNrg3WKdCpPNBxw3NW7oSfmLHnG2J867bDPvbVmaHTVBEG3natH3tRmPBqfk+/R
	 rpqe3W1RL7gIGz/pHRwPAmSqh4JLbeEtHbqRd7+A6G1JM/sEuYsvBEEqLGDb20EAJi
	 xaeLhSXkXwZHFa+4YeoVETqpgToYV7OftQwF7LQuVuPvOBEOHNODiiLk+yhwaoczVA
	 p1NDiSwMwOq6Jud0GyFTSSRXpXRBaEbj7qlDYG6vjlfnCG9oSzKvV4d62adr2vJjDu
	 YCOxPmDSg7l1IDAn7xdfKRtrpZiJV8TWYBKKQm9AAPRJklKa45yb9h9xDlQMp7tDFQ
	 qHYOnDRG9yxCg==
Date: Mon, 25 Mar 2024 19:14:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 34/64] i2c: microchip-corei2c: reword according to newest
 specification
Message-ID: <20240325-casually-hamster-cbf0f2430e07@spud>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-35-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20240322132619.6389-35-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121405_489132_425FDA42 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: multipart/mixed; boundary="===============0911611653995137733=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0911611653995137733==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TAGf2dJhgOpKDYF6"
Content-Disposition: inline


--TAGf2dJhgOpKDYF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 02:25:27PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--TAGf2dJhgOpKDYF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgHM+AAKCRB4tDGHoIJi
0uLgAQCteeRRnZgvo9uGusSLdJIVBw7pXxV2EGKWnke4r22nDgD/TTDLIuSbaKfA
cOO7slZ3qZsgTl/Z/p+wwJ2HUIVrrQ4=
=jJNU
-----END PGP SIGNATURE-----

--TAGf2dJhgOpKDYF6--


--===============0911611653995137733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0911611653995137733==--

