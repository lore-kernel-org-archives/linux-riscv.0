Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F263C54E41
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNWYDtqq8oGqDWvAeivpgZtFh6aTjy84kwCM6YSQR5I=; b=gk5HpkFq9NHv4VLYdDQN19McX2
	Wti/jjWr9BmfF4/PIUOw3k89eUcfCa4KjJ1NF5/aaXTrkbOY9OKybzQGqJlUtXVc2brI+bOrDvcq6
	pbS5P4iaLHT8hlOUUZXxkpRh+Juy95mbEa4RsT7de7KATnghx8XHKjcO28GBS85n9rFX/an8IQdp7
	6hz11mON+SAawH6MTHqYgNIVCgO1d3S+0FNp1YCRfHjBUgwOAE3d1KOrKVSDQWrLFgi2kwZdQfik/
	mRQBnQ97YO5OYiseckSXR8ds5kAaIMgLs9AjC5zdn24Pyfpw0wmXYW+kXmYcOfgY4O50VvDWfKEGW
	EpjeU4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGxS-00000008nd4-0dTw;
	Wed, 28 Feb 2024 10:14:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGxP-00000008nca-0Z4g
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 10:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64C2E61778;
	Wed, 28 Feb 2024 10:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63737C433F1;
	Wed, 28 Feb 2024 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709115274;
	bh=LlpIsPA3s5JjEM2+9kxgL/praNsrMawFqUk7o7+/NC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpBkus9WxLeKhaE00DYuxkdmEei5yuSfeL/vxQLSjUEn+6DIxN+B43J2E6fIXKE5s
	 WRC7wO5ureHOEm0e/AAxdRXMJSXiTCxhY6Pi2mfvSHj5QYSjkMBcznvx2ItcwNHEom
	 2wOYtKwluzAMEuASXHbs8//Dl4nEF6QWYtaUQ1m0HxioDx9JKTQW0KZnocp8rq1wSw
	 VTU/204MmfG0LXiy/RgmnNmYnhkCxGI+tBsICIhD4CgqmrN7uW/FPIAUrKxmcdVo7i
	 pi59kp74fst/qX240lSCzDyyZTrDhZz9YST2HmzuZjjwCFwX9PJb+x6AWI+7ifjBAs
	 SXtA9asVcQ2BQ==
Date: Wed, 28 Feb 2024 10:14:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v4 3/3] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240228-persuader-dehydrate-549097aafac1@spud>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
 <20240228065559.3434837-4-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240228065559.3434837-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_021435_238555_0441F1E9 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Type: multipart/mixed; boundary="===============3993643076155920791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3993643076155920791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oQj8PrQtimAkDfFE"
Content-Disposition: inline


--oQj8PrQtimAkDfFE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:55:35PM -0800, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
>=20
> Cc: <stable@vger.kernel.org> # v6.7+
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--oQj8PrQtimAkDfFE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd8HhgAKCRB4tDGHoIJi
0oltAQCyAW4xl4lPxjiVe7khhMrXdeuIuR7yGDqAKXKQJo1wkQEAuUcPMOTpBetT
Cp57UO+aOEO8qN+j2x5dwcZuPd9BSw0=
=nH9F
-----END PGP SIGNATURE-----

--oQj8PrQtimAkDfFE--


--===============3993643076155920791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3993643076155920791==--

