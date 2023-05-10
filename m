Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D3FC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6IlM9hS9z59QHR0zowlRQevWpUAe4GvfsPOPUg7IEM=; b=wF8tSBP8iF7PIFtilqh61qU+Cy
	ZCl/9BsJO8Pb3RDc1NXlCyAQCkKEywmMqHH7dPM9FOWhzKlHUBR1r3XeF0pmwf6ajEJ7IR2OKgyLT
	G7oAoaAUoLS7xL4cfrhG0VGMKc1856QFRddVAx+CV6M8Ufmr/5WmyLgOWKTHTv86780usLwzxtB/R
	SlYE4dNtzY9e4vRLeqYseZ44b8ioPN8fN9ucQ4PsqoblxtbIoH574NH+wTy1yNJ+kra+M+5gz34P1
	Hb0S8RGZ+eiYXDZmTTemT6QVGbtm5rgZHWXK+gCJTZOTp2KyFMPFHx1R3IRelTNFsVLBnB2XB+Mhq
	2O1HdzVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqnY-006zuV-2C;
	Wed, 10 May 2023 20:52:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqnW-006ztj-0v
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 20:52:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D72C264A4F;
	Wed, 10 May 2023 20:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E69C433D2;
	Wed, 10 May 2023 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751949;
	bh=T5k5//N6a7rC9iSVTg6GYEGc1XCVn1HqOBIf6ccTI5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7CJrnguzb+6iHFO193HHRofxB8yGgLwViFd50H9ZDMZGl34e5jM51dWYRPACvixO
	 3PmZkvEM6uxfC7gOHQqSxiVOn8iuCumtJNrSoCs57xXIOXF9NSEFzV3kh+mawsEy+v
	 YgsUF3JZHAHau7M/o+awa91aELWS22KNdqCyNp0bF/UZlbHURmLw60oXVMyg2Gpcvx
	 vPxw9F2fcNwc0SXUrgqlK+3H2IZqwrp2V0v9fjfFn0Z/dED9H2UcomEa/rGrp4Bliq
	 C4zh6avX87gdTEGSM3cuF4sFV47o3Y3oLnmGS34ni/7R/Ne+PRl8VLp2dacv9rvl1y
	 BjY3aBMRWvmlw==
Date: Wed, 10 May 2023 21:52:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Message-ID: <20230510-stingy-kilt-9a682f2c9db1@spud>
References: <20230510204456.57202-1-frank.li@vivo.com>
 <20230510204456.57202-5-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230510204456.57202-5-frank.li@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_135230_367015_D1F463A3 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============5659644474150944221=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5659644474150944221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qH5tGjn1QgjNsUSx"
Content-Disposition: inline


--qH5tGjn1QgjNsUSx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 04:44:56AM +0800, Yangtao Li wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>=20
> Jisheng:
> I would like to temporarily maintain the T-HEAD RISC-V SoC support.
>=20
> Yangtao:
> Wei and me would like to help support and maintain too.

Great, nice to have you :)

I need to point out however, that much of the feedback given to the v1
of this series has yet to be acted on.
This thread on the lore archive should contain the detail:
https://lore.kernel.org/all/20230507182304.2934-1-jszhang@kernel.org/

Thanks,
Conor.

--qH5tGjn1QgjNsUSx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFwECAAKCRB4tDGHoIJi
0hE9AQChaXAGTewRrUHpcsKUxxiNIoXE5KP8RFLqTXz5Y6GM2gD/b7TYBv220hSe
bASncQ2vGype9gVzMq4LUpwQG5JmzAI=
=6TF1
-----END PGP SIGNATURE-----

--qH5tGjn1QgjNsUSx--


--===============5659644474150944221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5659644474150944221==--

