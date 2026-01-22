Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B65D6CFA1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvDkoeQ+XQq9Bq/bpiGUcKLgJpTaU2kXpbsIYGfBVVk=; b=T17CjlfIn3hW2vXncXSRQWceL+
	SeSnfKarI5FrCs232KBsgaCjAUfFTLeOiIPGrnNskddNJS4qShTnXM0EzlxJMwYJOAhHi1ieqoVov
	gkRiipIi3WVqX5+I/lGpGQIMDXjCsxvu/Uz1xvjbxwXfXG8kLEmGDfe4vJyK+z7c011nX0BDaH+qJ
	jTmK5Gpdrinmo/Q4kgrsyycrPOwHplDK8ePhO+YFEgwLUQljUGNvNqL90K8kXMMt1BDVGv71J9krE
	MUzhqEBitlf0KHu9taAq2W4E0MulplP89a2PpQp+a/PFZU+08C6y+6wYrtfjULcE6m2/jNkogVqdm
	0oE/jzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizoE-00000007fT7-1LBr;
	Thu, 22 Jan 2026 18:53:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizoC-00000007fSU-1TlM
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 18:53:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88D6A44408;
	Thu, 22 Jan 2026 18:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513D2C116D0;
	Thu, 22 Jan 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769108011;
	bh=VmJ9sqj17xV5Zbk4rgoIv/RmlLU7TZGxf6/Oa0sRVn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rC3oc/BcatVYpQtoUSMa8C0YHABf6BP7726gpuhvH4K4BvNbwsaBtaXstFce8inCj
	 yI7hscCYhaMQga9ow1edE1N7Hi0Ln75zY5OGbhU60Gu85y/+yGk6WGRMzehDqV8djD
	 hppMJu9mRS73SgHzAcv7PmzSMK480oSHLXXeOpaw+MQ7njKs6yqgA9DGDTm0dO3V9L
	 iF0jtVVwk7zk9vjX+GNicOrBR/+2TGUZWCOFfmxXFK8UWFp3Db9SdUHWgRd0Q0W8iR
	 dfRALyfBu33qjqoR8c4izAbydHzftG+95Xooe2o2jaZSysJK2R/A9MuXQOb4mpoH96
	 SUKbEavvA4rbA==
Date: Thu, 22 Jan 2026 18:53:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: cpufeature: Add ISA extension parsing for Supm
Message-ID: <20260122-brethren-overeager-fa3d3b6fb0cf@spud>
References: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
 <20260116-supm-ext-id-v1-2-5fcf778ba4a6@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20260116-supm-ext-id-v1-2-5fcf778ba4a6@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_105332_409277_5002411E 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: multipart/mixed; boundary="===============9148668432272221352=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9148668432272221352==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFzC1n/eaWCMm4yj"
Content-Disposition: inline


--nFzC1n/eaWCMm4yj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:10:32AM +0800, Guodong Xu wrote:
> Supm has been ratified in the RISC-V Pointer Masking specification
> (Version 1.0, 10/2024) and is mandated in RVA23 Profiles (Version 1.0,
> 2024-10-17) for RVA23U64. Supm indicates userspace pointer masking
> support.
>=20
> Remove the previous macro aliasing of Supm to Ssnpm/Smnpm in hwcap.h,
> treating Supm as a distinct RISC-V ISA extension ID.
>=20
> Add ISA parsing logic for Supm, and implement a validator to ensure
> that Supm is only reported as available if Kconfig allows it and the
> underlying Ssnpm (for supervisor mode) or Smnpm (for machine mode)
> extension is present. Supm relies on Ssnpm or Smnpm to provide the
> underlying hardware implementation.
>=20
> With this change, "supm" will be reported (when available) in
> /proc/cpuinfo as part of the "isa" and "hart isa" string.
>=20
> Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@=
spud/#r [1]
> Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@si=
five.com/#r [2]
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--nFzC1n/eaWCMm4yj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXJyJQAKCRB4tDGHoIJi
0vxhAP98emYlV/YPlTwFITYQlict8vtx331zGKNy8TAOE/EJ6AD/SHI7LdDv0iri
frFLLIWZ2Fxk/eX/8IRmBqeBsryTtAs=
=ZsAJ
-----END PGP SIGNATURE-----

--nFzC1n/eaWCMm4yj--


--===============9148668432272221352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9148668432272221352==--

