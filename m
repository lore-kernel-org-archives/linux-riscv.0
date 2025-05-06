Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B26C3ABBC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5Q2zhOPv048zdbyHVfsy8+xGrrM6ZbeU22XcZymxcc=; b=OyynXZf5p4ITNoqErdbVKdQVW4
	/H5jvmfXqz65pmXJZOibw+RWGXyuZMJ9V2roLC/wqLPmJFRO8pF6XAbFBK7BmEigm7rpTj73W7o9A
	67AfGe2+5mVrUGu7fpSZoDMQcynhGW/TFRmKL4oEvD6r5FQb+rHRaCHv0Wsf50IFOWGTuJs6ZIhuz
	hpPQwN5it1olqME3co0RcnUP1YE5s3nFDQ2GpNdPBUYdjcFECHO4WkvmTxzui5LpdbA4dfA46TzMV
	0nJ5iKvoZoYZvDGfFKVkzN5Kk5nufshKEatsB5Us9lUONtK5TO54IMHJecZs+24d2hscLfsrVaSID
	xZ9MDGhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOh4-0000000DLUA-3GeL;
	Tue, 06 May 2025 20:15:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL87-0000000CfPy-0jsB
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:26:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD71D43C4B;
	Tue,  6 May 2025 16:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB54EC4CEE4;
	Tue,  6 May 2025 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548810;
	bh=qqnaCN+QUPYHPuDmxiApoJhIGYIBjx2h4vMiQAZJhHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFHuWwt8KEmzfbjluK08PXJ75odEuQdIzn1DQ34fKIIrWPAFJ6UM8PkQlbT/P2Zzx
	 Ln+8bbdrBzXviTn/DhBbupzYUJA5F3aGeIQBmMZCTkLEj5STbZGp+Ay3vWps/iopps
	 qeiavphfsQGCL+VEYBQ760Fcd/c6fHw3Gx0kAZFgoKE01TsKfhK+IHBh8tHQtmPL3z
	 YCJp6hAQDiIrQJHoL5MRNnvkoDiLdXR1vnojmdG6KpdZqyzqRAXVCuzz8Ghq4p3Nfi
	 /45IAq1a47qN0hMB8P0+wntcUHzGd64/IEiEstVR8GUN66NV+E0srIF8KRaKru4Kx2
	 NdE91e8vXaakg==
Date: Tue, 6 May 2025 17:26:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable Andes SoC
Message-ID: <20250506-gargle-lustrous-4fbf8c7d28e8@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-10-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250503151829.605006-10-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092651_233305_7A3179DC 
X-CRM114-Status: UNSURE (   8.36  )
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
Content-Type: multipart/mixed; boundary="===============1049474114467221089=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1049474114467221089==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jKXAgiWgHNZ7yjmY"
Content-Disposition: inline


--jKXAgiWgHNZ7yjmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:29PM +0800, Ben Zong-You Xie wrote:
> Enable Andes SoC config in defconfig to allow the default
> upstream kernel to boot on Voyager board.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jKXAgiWgHNZ7yjmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo4RQAKCRB4tDGHoIJi
0uAUAP92hrP7s3WaVFynMqKTElxT3ELtr+tufOcVF07+D/ugAgD/SdMXiT8FhPv8
+Z0WDTWilrlPNUYIGLIDgiYcsrxsFwo=
=Vig7
-----END PGP SIGNATURE-----

--jKXAgiWgHNZ7yjmY--


--===============1049474114467221089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1049474114467221089==--

