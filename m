Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A1C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y61lwpguEWV8P68IEU3Bwb5pvKX3o5hokxkfYglinSs=; b=inQ51zU17H54cTfEtOWsEzvD1f
	dBm9b/LYs1XBgappIVKZCzzGRz8KxvTWrIsxvZEi9c4IzVTYjOo+YQIwUsVT65xScEWOYrLVZ051j
	zLEsvrwduxHt8mfno92s+i2YsAMAcCK85VD6t6D5h6CTJ4V0zCg3zcXXdvbJqueifvcdzRD9Ogaef
	Tw+OO7f38xzX19KpCcHiJ4j4vszHrFHfW/DAHtgIO14rOmDydybLacjyKJN9y/Hb+mH0E+4Dc7lXD
	rqesue9rl9eDTSlJUmBLGES57HAZpxQBCx9FAbJc+9+G8TIepZpR0SkMKqDN4QG6f7Wy39vKWdBCF
	KjpjbGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYd-0000000B4aJ-0UCK;
	Wed, 11 Jun 2025 19:56:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO6b-0000000AZwt-0BoV
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 16:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O9MOBWHvWZ5MN0ix5avPsdQVSs2Pd615xfzCnOn1X34=; b=XQbWKJgvnLqd3l1HseE6I8rZDP
	ml+PDvk/UlF7U0Ug7QjlXIAfhJeXrFNVZ0Y0gkIIo5mOuvkFv+xpxcokLIU1bsP82L+A+HYHW2+k6
	UlGBobybC9Y6leRwKCWDhpfAndEQxFv60ad9p9vzpxA5Nz0w0lyqHO1JgtuUL28nMzatXDPp5JtcK
	ZQq4ocvdiGD/XKfm3HJNvm/Vrzsi7nNHP0sjD5KWxEh3GTc9JvYPWZp7xCDav6yUjqY+/kreTwEp6
	Z6TCe+MYJ1yd1CfhOZHWcg4XGLSwpQjJqUYJm7WAfSfoCjpw4Hhig52kScGQOInPcHE2r/sbkg1TR
	g9oVDvqA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO6X-00000002R9D-3evX
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 16:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1063FA51949;
	Wed, 11 Jun 2025 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B25C4CEE3;
	Wed, 11 Jun 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658505;
	bh=O9MOBWHvWZ5MN0ix5avPsdQVSs2Pd615xfzCnOn1X34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCUZmOVOhAomOZhebCoHlJAVMUeSTmncz16T0PwafTIuwYEXqioMK49DZFFjThD19
	 D7kjcJ/VF4nLxxCid4Id3aQC5LQhit7BSZsTY0xTNeccjhEnc5d72DTpLuoRsj2jQm
	 /fZcSjgP94qDmWt1OR5FzNyNTNMF+Cr8q0qBrt9TWzuykR4dPZGgFRzh5wa/pdLsT8
	 oyWjbH0WBVIqoFS00TyVfnI6UtOzBf+KQj4h7DUT9rZl6kKqp7qak5Ax8vtgCqbJQa
	 U1g+ZxJ96HsoirQNOrIKfq/UCwkhOWc+jf/L6gA1Vwcmwp1knTPmELuifkyDyo7I9f
	 InHgJCZJmVcOA==
Date: Wed, 11 Jun 2025 17:14:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <20250611-doodle-storage-f1f23230adee@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_171510_100873_5DF97851 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: multipart/mixed; boundary="===============2881722556466529034=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2881722556466529034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l4ajHlLW4CTqOoSC"
Content-Disposition: inline


--l4ajHlLW4CTqOoSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> Add top syscon device bindings related DTS change for CV1800.
>=20
> The patch required the following 3 patch series.
> 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.c=
om
> 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.c=
om
> 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.c=
om

What is RFC about this?

--l4ajHlLW4CTqOoSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEmrgwAKCRB4tDGHoIJi
0oEGAP9CowrUU72dQHLlJwso523NN6agE/wQrGVa7TAkoMkGHAEArgoSYWu2Xe+n
LLB9vYJIT+FexWc/jyDGiCGXj/Dn/A8=
=3V/H
-----END PGP SIGNATURE-----

--l4ajHlLW4CTqOoSC--


--===============2881722556466529034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2881722556466529034==--

