Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8A8C3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLzfOogwEbF1el/mluK+tLVB6jW9hZ+nhWvpQDydW7o=; b=Kj1ntnNlLIgeK4YRNz/KW5MgYW
	Z/Bax5fNmftfw8mBVYEEVF4edhQcRXvaWFamrfBdoeKJXUwm9ZjZfDsNZRMAHNm+5Erj4OUsMihhW
	GOi6tB84+aIFgJ+TlN0KJo8/2TYwFXVqZ6a+FKu2DKC/H/adcE4gHP4BAgKJdVcMlubwaOBvF6o19
	v2nfDnUsb8PbQZp/xXRbwFbzn6iwpK3FQwvFIucmOuISvJN8phVmFExAU1doQ6+SiOww32Y6tzF5S
	JSWpRWI03ePee6SziUzMeSvZVbPP/k3XzFjT7gv61pQQTsz4SCjBiyGd3wg0SCj+jkdFcrOr4eSJ5
	1ZvE42Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOh5-0000000DLUf-1Yvo;
	Tue, 06 May 2025 20:15:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL8z-0000000CfcL-10mM
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6C5043B11;
	Tue,  6 May 2025 16:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61D5C4CEE4;
	Tue,  6 May 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548864;
	bh=wJl9fXyLBlj/alvhQ5nvzBTo2DX+kfoN+jfRteXdm2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rhuo3y9TxDpq5ldZKL2HKkbwDu2AeBTHP5+/g7FPz5CgzrP4Ax9Es9tm6+hELS3AF
	 rH2Y6Ri9dyMKWLknUeYV5tzJZTv1zEjS5Dec1xZGAV7YPKFymJ04FcZYbZif7mRtZ1
	 5CVnTtkMyZa3b3yYtQc/339Uif3VQlInWZ/cktPdrwwWGo9jSYn5iIFCJ4QDNNQPQ8
	 c+5kNG2AmUWIk1LIpU9X23aswuxg8V6RkMRPcNCeZgO2ehWHHsIcDE9jAvC+L1xnS7
	 KVtf6jzmfVrP4LyO2/mKsI6gFJic2hF9X4zg/yhXFXprzsnXnhGK9QEzpUOU1b2nkG
	 RTs+bx3Ltd9Ew==
Date: Tue, 6 May 2025 17:27:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <20250506-bonehead-security-fdd71309a721@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-6-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250503151829.605006-6-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092745_304212_5E1634E5 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: multipart/mixed; boundary="===============7176197401593392687=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7176197401593392687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cHkgK4xVUxJ740D6"
Content-Disposition: inline


--cHkgK4xVUxJ740D6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:25PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
>=20
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--cHkgK4xVUxJ740D6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo4ewAKCRB4tDGHoIJi
0hwNAQDM2atqbPzuEVmNCgCayxvl4ixzEpqJu6dqfw41f5RJ5AD/fTboHXFJsmwG
tNcawZ/ktKYZjQUmN3Q2fvk7oKf8DQo=
=YvVt
-----END PGP SIGNATURE-----

--cHkgK4xVUxJ740D6--


--===============7176197401593392687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7176197401593392687==--

