Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2135C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E04x+EIz11+a8GUHgAhwy5R3dkpyfViUvZLBRS53SzA=; b=f8hLC5QCmCvM48UOKIbD5Kthn8
	sznl3IwZBYPA8eqBx/YTaKS/ie/sW7hQucRZTnIlfQmtUxmL3e3wJj9Jj2xtg9oxfOrN0TI6UFmFD
	tBPyvXG87EK+D0CjXoKraDX6j0EjYJ1asPVkejsMV8PrMPxrhTCeMokjOH33Q03cs1M+RTN+kG8ig
	RD8VU5HZauO0pa7MVS7Pt8gBYSboRcv8l37oOn/l01npJeWRxo35zKoqBRH+xsj5qe7qQog4zxITC
	g+mZ0zl/ewqNUhDvi2tigCxcSSIY8sbjndvQEdzynJi+MjYi+O5UXoNJ4H+Rcvtp6tx5IZYoEtLD7
	Ac2Le9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpX2-002N4v-0s;
	Fri, 20 Oct 2023 13:27:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpWz-002N4M-1A
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3D5462000;
	Fri, 20 Oct 2023 13:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE31C433C7;
	Fri, 20 Oct 2023 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697808432;
	bh=C0wRcr20vOca9XKyfLnWXHQ7cE/Z3Cwyy8lKb2XurTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aah7lQ1arpvjDlKW2ziqvAo7KzC+z5O4YazbmPvdkBMU18AHHWOipr1P9EHxd2XDD
	 AjnadWWauimJ/ChFggBg25vZLfIxljx90xL3Z64spipWEJ7fFK3SNvrZ78erV3qdO8
	 P5dz8NtXzkxnaMziI2aZax8BYBFSDu4mqMuJ0PRgPGrrXzRw1mFwggmnzYb1Bzb/i5
	 1gxNngyJiCpSZglO+cHGDwZ0GrHBZoKdNzES0nmdV6p9EaMZSEbKvNcTrU0sc42lZ+
	 szv+dLsRKnP6LzLezWMjQ/AVscSOMMSqn/vjQ6FieDM9nNd5wauWTinPgSzsL7K9u3
	 th1O8jsBghsPw==
Date: Fri, 20 Oct 2023 14:27:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com,
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v2 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231020-sterling-habitable-a7caf5dcf479@spud>
References: <20231020130515.424577-8-ajones@ventanamicro.com>
 <20231020130515.424577-10-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20231020130515.424577-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_062713_464499_499FAB0D 
X-CRM114-Status: UNSURE (   7.45  )
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
Content-Type: multipart/mixed; boundary="===============4119165548082391544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4119165548082391544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9YWR20a//wIZ1bWO"
Content-Disposition: inline


--9YWR20a//wIZ1bWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 03:05:18PM +0200, Andrew Jones wrote:
> As Palmer says, hwprobe is "sort of its own thing now, and it's only
> going to get bigger..."
>=20
> Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--9YWR20a//wIZ1bWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTKALAAKCRB4tDGHoIJi
0htiAQDP4fSlejXi4tBDJfPLXMwtLtLDGzMXLMQnCBJLEXamuAD+Jxa8IhMphFmB
hYGHbRzbyvDEctP6JWG3VRB3IIdBNAg=
=QxmD
-----END PGP SIGNATURE-----

--9YWR20a//wIZ1bWO--


--===============4119165548082391544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4119165548082391544==--

