Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719E5C636D4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 21:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+pHY9XfgMN8lxp1xf49Y8+4pqrpLkcQUZe2ran4Xmo=; b=dUxXq8uiAY80aVhyEfdgSmIc4D
	HcLVRYrHNxgOiBQDCRHMwTTtxPf2YYqC9q1SFVmz40jzf7frMd/1C1Tl5hThUIl09NJzulAmscdZq
	qtp7PJ2hTonT70ug5kzo/qoORMBCMY1CL6WI+HCOoVMMM44oAqpyYIgeQ+aB0A3c/+ZjBjH0Ap9rl
	k4eqTQFLTtgJJyDTHrReCMD4svqGtqb0gig/6Wop0Q8u2nMYRga1HGJ7QSlv8CxdIaeBZEndaS1yS
	Kzr7qqfOeJOUS7RDZWLQwU243Goyy9ZjgNDFEuxPlw+nUg/oqcvJYUUdAbqVxJtw3p6IvfdJwGRK2
	TgaPTsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQadu-007ZbQ-6k; Fri, 10 Feb 2023 21:09:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQaKc-007U0a-3H
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 20:49:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7AACDB825AF;
	Fri, 10 Feb 2023 20:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA98EC433D2;
	Fri, 10 Feb 2023 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676062155;
	bh=lRiMPFXGCxxHfvEprvD7rl8Ge72em7F8Silvbxh3Zv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzPkzMREpwNdBFq6kjDjFbb/rpVzMqi01fZdzhrOMcpeIWtqKEOTzqFjO2SSua1Fj
	 JlzCXKq4DhyjgllHuPK/9F6vIv2t47Llpr34IVVHTmehmMQYzfs3j4G8wRJgUIZKqQ
	 cxCN+Jvc0QYG2mJ9CMRi6W1yztLkPAh+deNmb6a5kzSb5DWM20qJPTvwIFmBK0wyez
	 vICSXceKjBBVF3LioKttBprAxCZjvJqMbkf3vR1WSlKUEACNsP8YfOFiWMzA8dR+KT
	 w1nrO8TA+ps0N6SC7dMJejiyu4DxK9TYUSC4MrYfAmvzdrv9SEWmaDd5at3cN61lHd
	 s0eY4XEuneBkA==
Date: Fri, 10 Feb 2023 20:49:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@rivosinc.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	ajones@ventanamicro.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 0/2] Small fixups for the Zbb string functions
Message-ID: <Y+atx6E2k8Ao33Zz@spud>
References: <20230208225328.1636017-1-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230208225328.1636017-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_124918_370716_4DCF813D 
X-CRM114-Status: GOOD (  11.86  )
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
Content-Type: multipart/mixed; boundary="===============0794409246059524174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0794409246059524174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32ZMuNoFzgWULh6N"
Content-Disposition: inline


--32ZMuNoFzgWULh6N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 11:53:26PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> I didn't manage to address Andrews comments on v5 [0] in time
> before the series got applied, so here are two addon comments
> that hopefully do his comments justice now.

Running this on my jh7110 at the moment, so I suppose this is:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

;)

--32ZMuNoFzgWULh6N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+atxwAKCRB4tDGHoIJi
0p99AQCHEYZigKbW/tlGmuhFQJtP+9mZoMq49445+eapSuNZQQD/cKQlmFN4/fW/
eIcZy4RDLs4zCzGX2knUyYT5QYRhJg4=
=F6lY
-----END PGP SIGNATURE-----

--32ZMuNoFzgWULh6N--


--===============0794409246059524174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0794409246059524174==--

