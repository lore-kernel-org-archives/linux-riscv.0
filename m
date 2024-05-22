Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57879C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9WXJPShlAxFoHkgF9TRq0cfqOiATRSEGq4SGqTdeaM=; b=vRsW9HOrSUAzQpbDy/pjcRV6hl
	/BArYuNpyv2LQJaVWu+DB/Bp6H0JbKkei9BbgAlRr9d4gvi9Iyylqe1tkm3ivCk/qYOxnRJ0CeyV3
	EWHqbLAxPCJDWFwQkYNk21OJ9OeqJeu8tKPRtp7ejbrJ6u9FutiT7mnf3jZEOWndsK1k3jI8LAzrF
	I84Cz+05kO08J7idIkhLZz2iND/lWtWrm3hHHReG0qBLD7XhwgtjjjCe4D8HlwPxUfs4sX+TZZobu
	tvKqKa5wplGW1PafFhjbHAAr3ZYrqljxhMkOFJSafwhoo/rVFKQZ3nmyw/ZUNeeX+eC8rE9t3p1tU
	Hk/6mVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9oSS-00000003TPH-3HFa;
	Wed, 22 May 2024 16:04:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9oSP-00000003TOM-3N3x
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B981E62A60;
	Wed, 22 May 2024 16:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC34C2BBFC;
	Wed, 22 May 2024 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716393885;
	bh=1vicdVPng3fETAqpS3OYsILf4v6JPsudUhtYWNmeKFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7ZvkPfdyjrKlBm/FTG9TU+EkjklqPbuERB6Y9m9/+Q1jHW4x/d2W2a6TX+FECKfh
	 vJ/92gc2wjm0s0T7DBHTxNoE+byTqlUs5TWIYHv7NtJKe2jlstI8AFhwb/q4sBAIjT
	 xWm2hwH9VU9fSc7lMGttMImlnx+PQZmVTP+5nNY8Gz5K5KMgwQydASFhhEEvzsXvf0
	 Sx4ytR4LzuMmUsSVwAirgrB3/wpaElPJqgNm/FpOJOGivEJa7UJBVgC+t+EjV2AbyP
	 wj4NGmOVQKxIWLsgMMaWHDqGdO+z1CfqUmp9llADlZhHV8GdSHrojF1K/uNOLlzZaX
	 0TUjw1qAG7A8w==
Date: Wed, 22 May 2024 17:04:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Message-ID: <20240522-yoga-blurt-dc5e40a0ae3a@spud>
References: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_090450_001886_9535EFAA 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: multipart/mixed; boundary="===============1854312080490684410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1854312080490684410==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eeg5JD55UAT+KHlg"
Content-Disposition: inline


--eeg5JD55UAT+KHlg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 09:08:34PM +0530, Kanak Shilledar wrote:
> This series of patches converts the RISC-V CPU interrupt controller to
> the newer dt-schema binding.
>=20
> Patch 1:
> This patch is currently at v3 as it has been previously rolled out.
> Contains the bindings for the interrupt controller.
>=20
> Patch 2:
> This patch is currently at v2.
> Contains the reference to the above interrupt controller. Thus, making
> all the RISC-V interrupt controller bindings in a centralized place.o

Don't do this, it breaks tooling:

	b4 shazam 20240522153835.22712-2-kanakshilledar111@protonmail.com
	Grabbing thread from lore.kernel.org/all/20240522153835.22712-2-kanakshill=
edar111@protonmail.com/t.mbox.gz
	Checking for newer revisions
	Grabbing search results from lore.kernel.org
	Analyzing 3 messages in the thread
	Looking for additional code-review trailers on lore.kernel.org
	Will use the latest revision: v3
	You can pick other revisions using the -vN flag
	Checking attestation on all messages, may take a moment...
	Retrieving CI status, may take a moment...
	---
	  =E2=9C=93 [PATCH v3 1/2] dt-bindings: interrupt-controller: riscv,cpu-in=
tc: convert to dtschema
	    =E2=9C=93 Signed: DKIM/gmail.com
	    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
	  ERROR: missing [2/2]!
	---
	Total patches: 1
	---
	WARNING: Thread incomplete!
	 Base: using specified base-commit 20cb38a7af88dc40095da7c2c9094da3873fea23
	Applying: dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dt=
schema

If you change one patch in a series, the whole series gets a new version.
Just let git format-patch do that for you with the "-v N" argument and
you'll not have to worry about breaking people's tooling.

Patches themselves are
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--eeg5JD55UAT+KHlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk4XmAAKCRB4tDGHoIJi
0su4AP9z+Txrf6KWtFYERWILq00267oges3Pu8u242cyzQesKQEA5Yre424wVHVT
o9tzXZgPfqWGP7LkQ5a5BFjbABdJ6wE=
=CDKs
-----END PGP SIGNATURE-----

--eeg5JD55UAT+KHlg--


--===============1854312080490684410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1854312080490684410==--

