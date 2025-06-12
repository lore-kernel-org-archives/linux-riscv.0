Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D510C71149
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r0aFafyISVnVQ9OVnO0VkkasuWm5zgT8shdoPHPuoA=; b=e4Rv+DRebDtUgGQfzjACqQDiOL
	oOEaA6edwVPb0zFI3H1VWRCPYU3Ydn8QiJQz7srRZ6GhXZvSpaNe/+4irQfc8Aua2HjhI1fM2EHAt
	FO7hxLvCYodY9EhdJ9TUwgqNWFjQ/xzLlsnQuKe+W8vaU7U6mau+wj9KqZDtX4OHkkbr+Ni5vYyqV
	4eq+PgByoBD5CJOyN+Gi8uL6LKAyoiQ4UUcXtWa3qjyH/y+48Ak5aG2VV8pcayvAn5IR+qVk0WMsP
	3F5Bgizg8QSdETRa/CPS8EyGA1U1Z4E44k3v2ZadqVJ4qrWt/NosoavaPvh5CYqSjWj6Fsw46dv5O
	skeyDFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsF-0000000EM5N-3UvH;
	Thu, 12 Jun 2025 19:46:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkTj-0000000DuE8-16U3
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 16:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86DD5A51E83;
	Thu, 12 Jun 2025 16:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EB2C4CEEA;
	Thu, 12 Jun 2025 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749744514;
	bh=B03z8gxJK+nx661YS+WD6BW1buv5G9KGZfmtmKssNPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcZaMQWYYfcHZvJtoDAV5b9/0sFDY52tAweeM6mjMw3BnjKC6EQvBGMhvxRO5s7T+
	 ydFT6HVpInq0VQTLJQ3I7CnhHZwRYtAN9RStGLb0lmmrloAyYdU6WSCRmmEtV3L13F
	 gRRlW5dixUdTTMze1ujaTXh6TRGaLE0bXoesygVCne0TUXajO8aYJvuCIJlTif0uwa
	 nwOems3Jcsfa0XUfRSuUDYVqKUeYLehRdq7Y+arH+y+6ORaHG7Pzzr2jfU25Yka2HL
	 MXdfVoMwt7FBL5/wEFOS4B+nwXyhcfYR9RycsPhcpRgemPFfI7zlaomLXp3LETADE7
	 iWRI7dK/Bh+Ag==
Date: Thu, 12 Jun 2025 17:08:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 1/3] dt-bindings: net: Add support for
 Sophgo CV1800 dwmac
Message-ID: <20250612-maturely-pony-a6fb8f9cb163@spud>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <20250611080709.1182183-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250611080709.1182183-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_090835_364702_C1FC163B 
X-CRM114-Status: UNSURE (   9.42  )
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
Content-Type: multipart/mixed; boundary="===============4115585703499971916=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4115585703499971916==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zSWjS4FDrlJ7AUsz"
Content-Disposition: inline


--zSWjS4FDrlJ7AUsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 04:07:06PM +0800, Inochi Amaoto wrote:
> The GMAC IP on CV1800 series SoC is a standard Synopsys
> DesignWare MAC (version 3.70a).
>=20
> Add necessary compatible string for this device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zSWjS4FDrlJ7AUsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr7ewAKCRB4tDGHoIJi
0geVAQDLc3KgdxScF0+JMYwJ7R+YQeW94eK+OREQoU5WmclyjgEArisbfSvY76Q6
pihw3ebbOH5q91hjm5goo6nl6L6UhwI=
=1G8F
-----END PGP SIGNATURE-----

--zSWjS4FDrlJ7AUsz--


--===============4115585703499971916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4115585703499971916==--

