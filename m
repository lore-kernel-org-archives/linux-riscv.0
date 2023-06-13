Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7313EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 16:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGE833TTr0BoW42CN2+JTsM7Wj2PZEyUx0cS1NraW48=; b=qQ3O1/a70MVRu14OddAtFM1ece
	ZaK2A5bv//R3/TLkdxIpR/r1jeF9ZiV6I9y0RTxdvZ0+Z1NN3iXzwu48zL6FsbM5teW9dSfjHAEJ/
	FM2Ty+Kf5z5e2jXAllpLEm5SPm/TD2MrJVLJQZtt0PfHTBXd3N5ZuvvQBhZP/IsmPtQQQ7K7d/2Qw
	ajEW2MNfrby2kmCWotRl2EYCwEp/3B1YBd3Mae80WWoy8hQLt45h1Df+a+Hr/dvVb9tD06S8iVqL7
	eKJ10Jn/Obr4WqeEMrWBnHCAAEdQKvmccBoGKDPPTPJUhEO4xxCqZGsHqR340qwILFQnmO4DGJ8kR
	eNcfVdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q97IN-008e5s-1O;
	Tue, 13 Jun 2023 16:55:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q97IH-008e4P-3B
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 16:55:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E329462D8C;
	Tue, 13 Jun 2023 16:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DDEC433D9;
	Tue, 13 Jun 2023 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686675296;
	bh=/WwbLC4AYxFlsMo/0xwNj7aKWItsTMJMTTrgt7suMLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiDZIQ9DvrTSHXBmlvlE3hmk08fcHHeb5fntXdJ2f/c7ZnPOdQO/cQRioloCJtqxp
	 masgstRdkhyb21iyTv17RA13o9TVNYDTfZa8asW9g3/dnpp+PLiDBD7sAUR2LJbxIA
	 lpZqNW8a6eCNYwM4s1gj+aoNM99MXc5rfDc0xRbWFnuSpX1RovPc9MQyPg37bF1xst
	 RwGGR5lSRUMWyJPqD1rpvqVTnfYyUQ8sUjFWYEAzfHyFIazYPzFFgRAecm/0TfB5eC
	 EMbMej55yC8eGLUVWxr5Gm7NuER+zKAUXa9nIsnSImx/xjK21ZjXFmf3nl+UnzO3H7
	 9jooWAaWxBJCw==
Date: Tue, 13 Jun 2023 17:54:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 3/4] RISC-V: hook new crypto subdir into build-system
Message-ID: <20230613-wasp-energy-20e2cd8618b4@spud>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-4-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
In-Reply-To: <20230612210442.1805962-4-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_095458_129802_4D754EA8 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============1388555793658902084=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1388555793658902084==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1pvydtWQC18RdlEG"
Content-Disposition: inline


--1pvydtWQC18RdlEG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2023 at 11:04:41PM +0200, Heiko Stuebner wrote:
> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> new file mode 100644
> index 000000000000..b3b6332c9f6d
> --- /dev/null
> +++ b/arch/riscv/crypto/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# linux/arch/riscv/crypto/Makefile

This comment looks weird, why is the filename here w/ a "linux/" prefix?

> +#


--1pvydtWQC18RdlEG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIifWwAKCRB4tDGHoIJi
0k6XAP433CxHzezw6/n4IfsT2X7Tbsyw+MwsKbUyuc2LIAc9GAEAhu/lSLKbiPyM
AUAtE5YU+LKaAdvAEttlqL/eAj4tyw0=
=g3s1
-----END PGP SIGNATURE-----

--1pvydtWQC18RdlEG--


--===============1388555793658902084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1388555793658902084==--

