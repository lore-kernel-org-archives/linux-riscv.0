Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD1C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ixnKqOaWGpepLPm0Ge97hR4RM3Jwd3T/RaNHyGX9JA=; b=OfRknp6n8Xqh66V5QoPxDJnwV0
	uZ0MEvudaZx/ahWwkX2MolQkRecnibcXX+s1z/igCvMccFPEWCElyqAZXTow70qYfNFdEs7mZdS08
	l4OFNB7yA/mRqs16pEen9+IIfMtoZ72rqx52tW3ILkAYrIbl1wITErEqlkma6SjWzfHwFQK3spsrH
	MW7PTAbvwFnuQ8AoXddKO2d9DAZKALFBWuo6LY+DZGbOlElaU6FL8X5KviIL9I0R24fryRaltNEwv
	OL9KpnUSeoe+M7/14ECeKZlbTieSH0d1adgDh2KeY8ug3bZW9zUPNVcsdPAtimMTPaHuH2pI+M8X+
	62Qj8Grg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkSm-00000008vMU-0cal;
	Wed, 21 Aug 2024 12:29:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkS3-00000008vDj-0idB;
	Wed, 21 Aug 2024 12:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34FF560DED;
	Wed, 21 Aug 2024 12:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDE6C32782;
	Wed, 21 Aug 2024 12:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724243313;
	bh=NnoJ4qFOrxmlo0aB7R44FT9bZ5SZQaWEJ6peEjE3zZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3D9gUb4B/GUKB3QWBW1JB559Sq93PNeppTYu3VmOASkkCKChnf6IPAfkMLkSiiyy
	 f9ylMtMjtQqmzjIUffkPJHWLC1zhXrtGoAZRDmCuGWDqIyoNAAwmc4gpCL+K++jA4N
	 Zw1oGxNmXsN4NP049XdRR5hN0r0heueyPOpbxHk9bRdxxPnnT8ZJBCnMQQU+tH3g0E
	 Xob5sf7o5JrAqRfg34C+PxKtN1GSsGFNP3a2jFLYekuAMXvmPv2C1IReuf8a5I7uKK
	 GJoCI/bHY9haMVIReHdKh0fDR8DfzHjYLrEBs72sHQ2qew4ntWiPTGg+rD/jMFGJOd
	 AUEqp1CEvkvzg==
Date: Wed, 21 Aug 2024 13:28:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH 4/5] usb: mpfs: Use devm_clk_get_enabled() helpers
Message-ID: <20240821-velocity-tribune-726bb3546ba8@spud>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
 <20240821121048.31566-5-liulei.rjpt@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20240821121048.31566-5-liulei.rjpt@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_052835_283345_8526E9A2 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Type: multipart/mixed; boundary="===============4354248560058157765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4354248560058157765==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcJo4N/CZuvGrFHi"
Content-Disposition: inline


--bcJo4N/CZuvGrFHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 08:10:42PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>=20
> This simplifies the code and avoids calls to clk_disable_unprepare().
>=20
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--bcJo4N/CZuvGrFHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsXdbAAKCRB4tDGHoIJi
0vQXAPsFPWs5/bU//KkusZ+fex1LjVZZPj1iKD46J4gSjA3/IgEAmb8f82SYq0M7
5hCZmy+8jLkn5UKZOkLGj2pA+UNHXw0=
=TKQo
-----END PGP SIGNATURE-----

--bcJo4N/CZuvGrFHi--


--===============4354248560058157765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4354248560058157765==--

