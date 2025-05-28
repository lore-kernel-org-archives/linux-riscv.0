Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5731C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fykS8DbhR7jvJ/LjZruzgapbVOkZvSpulIAiaM3uwhY=; b=n0YTJA7h16aXR39+Y+9PUrH8mu
	XQKHHu4htcIOcjPTmbIyIm614kyyMG/jIiUf/96rjWIarOvdInJe6irjniw43SekFheYRvsd9ZKKB
	8WR5BvfBiYCheAxxFyqL0x4PAnDbR6Sdz/YBM6N2uSAnccLgx+4WqwZKYyKxnzz0tCwV6bZGQwTVw
	p5VutFuv2YZiue9DgoSX3SW147CJTmBU/+uBRRA03HZaKpN+xLojw2mlllvsGen/fhymF9AiDSkU7
	tdTX1OyrTKElodmNvzFhU925HWDtiuhc0PNbEJocyfH0Vm2TBAae+7TJZDUn9mFduiYDtCVQ7r2XA
	8PDCYMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEuJ-0000000CyVy-00Hu;
	Wed, 28 May 2025 11:25:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEuH-0000000CyUv-3ZQE
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 11:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 167DE614B6;
	Wed, 28 May 2025 11:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E887C4CEE7;
	Wed, 28 May 2025 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748431512;
	bh=K4InY6t48H5O8zLU+hNLlWosd5sv42G9OLlcDO3H+MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwoKX6a1HAKgzaBvCoyOhIO1pbBz2pF8HqQ6xzKdeassjWxQp/uPE2yINhGaXIjfr
	 i1BTW4VEIqJDTrxbg1TcM02zEBwplZQsnflyhFFmQ6rcjkq/Fy+K3ucy9antZBM7Zg
	 4g4d/3F3/o1AMvGRKdJmVZ9WX9hDCeOVS+OBXMxuoyiitH+GopNhwLOXn96RVuKzpL
	 mt/MBXKlat/QdW+wXlVAjh0NzmwVtlPpl+w+Om/e+RlG07WeHDamx4VTiQ2hm9T4cn
	 /eVm2oE9s8eXY7zg7krfYb0jKUnvQQt+8NtyJin6kJ8/e1hWedaIf98Hq44+UidJfT
	 wO6C59/hn4iIg==
Date: Wed, 28 May 2025 12:25:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Nylon Chen <nylon.chen@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	paul.walmsley@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v14 0/5] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <20250528-obedience-staff-8c7115a1e72c@spud>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
 <crcfskukqifse6gqrydx2iezargv5frv6dguj3iqdkfm7xxbqh@4v2dvo4zcmbz>
MIME-Version: 1.0
In-Reply-To: <crcfskukqifse6gqrydx2iezargv5frv6dguj3iqdkfm7xxbqh@4v2dvo4zcmbz>
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
Content-Type: multipart/mixed; boundary="===============4896125050403290498=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4896125050403290498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g+WxYtHMM8gBZU/7"
Content-Disposition: inline


--g+WxYtHMM8gBZU/7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:21:45PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> patches 1 and 2 ideally go in together, right? @Conor, does your Ack
> mean that you're OK with me taking the dts change via my pwm tree?

That's exactly what an ack from me means, yes.

--g+WxYtHMM8gBZU/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDbylAAKCRB4tDGHoIJi
0o5UAP9VjzL/ZyLA/i/SUt2+q4K+R5tvVDuyf86ESthCZ26OnwEA5B0jDEtRBnoF
IdZ9OaRAigLh373m9zVKDnSsP1nKCQA=
=B2ga
-----END PGP SIGNATURE-----

--g+WxYtHMM8gBZU/7--


--===============4896125050403290498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4896125050403290498==--

