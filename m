Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE55C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELACEyaBlqdXVPFEbCfQnITNSxx/p88LZHHj9TQfP3A=; b=2wMzFbvoZoS4Nttc6h2aFrMfNn
	vp6FDYK6upJOvk9f3YdRJ8Z/8e3pSi/96mQfUs4vuOXSGZ3MxWE7f4g4qSAgOqqWYMJiuYuZWB6vh
	dp5278pNARwRvVSSfohaUyHfz2pV3er8BmOFIrZqlZqkdsoPnqvv6HHtb5eDWUtOtk74JEnC5jAtZ
	q8vkBOkS6iQcoA6HS/PdAEFHDAGzkm11o7A5Jg8rWk2nbUWj4jFlm9GwoqhSX/A3lVhaEwfTO+mIf
	9SRKnfGlYMNhn9HEb3oF4TOBJG4F4kEcf9r6WDOryHeGsHprwMUB4iu1GJ9vaqUBLUYa38lA1+CEw
	DVbU0Lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjQq-00Dz5g-2i;
	Thu, 18 May 2023 19:37:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjQo-00Dz4Z-23
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:36:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 381E0651D5;
	Thu, 18 May 2023 19:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59833C4339E;
	Thu, 18 May 2023 19:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684438617;
	bh=HmmA947lbPkI5VPGJi4CvyBYO/PqjO5ZEsI8MkVFGBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPqjlzN2XirTFxtn/nWN5Za0q3U5VcJAK7dOFneoRhCV+aLYQVqj8r4q0hXWA6tNq
	 7QOtTyd/1IPMyaJe03VAu94KRi3k2Mr4JWQoXqpfylWDPyYczlw7feYRoJ143yK7JK
	 8MfcqLbpIEesqyxJkExVZsbMz+H5m91L3M7RiFS6x7KDe3b5GXoPxbkd1TFz4M5Vk7
	 WnBioFqQpnthNj0U4mUJG0ZlLHGBqFBZZB9o/3oZfujtnfZnZ0poVhgH81XlHVGi7H
	 AXsM0jJhikbssNmi/kLzyhUdJ0X90Bz/Mz/A9/K60SOLFUUF9MXFkUAp03eH87pRmI
	 AhAXDgrQCjxbA==
Date: Thu, 18 May 2023 20:36:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: interrupt-controller: Add T-HEAD's
 TH1520 PLIC
Message-ID: <20230518-fetch-essential-94a36fa3ca28@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_123658_716186_DF5A0225 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============1184438432713383168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1184438432713383168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="63Cg3z6uikryQhIS"
Content-Disposition: inline


--63Cg3z6uikryQhIS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:33AM +0800, Jisheng Zhang wrote:
> Add compatible string for T-HEAD TH1520 plic.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--63Cg3z6uikryQhIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ+UwAKCRB4tDGHoIJi
0mM+AQDknQzLLt2ANvZGKCCzkHR/sCTD7Eemb4V3ZeNQwJkOSAEAif5MkwEXv4VG
KKyb8rPNwnhyIWet0QV/Fu2DZB9AUQk=
=g/0j
-----END PGP SIGNATURE-----

--63Cg3z6uikryQhIS--


--===============1184438432713383168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1184438432713383168==--

