Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95349C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJzWlIurTVMlJ9vhg3gH6AzPe5uN/SSy3cgVZlwZx1Q=; b=r7z+jI2ZYc79H+Qh0bI4m5L7Ge
	KmL4oipZPTu+KMbrYcepIt5QQrpgbnjp2DH/PH2+S3ntl2ib/kQzuTxIuMGP7e5bcb3/wT01dHl+p
	sc9KZZJZ2A7tHtBgbA4LEE6Yg2htXpMIopIrGB96jDqL6u/3dDfe3ZjXgrhM3wbu9fQeetcfOVrhT
	ToQuexN4JljcvR84rgM7c2mHqmGZLiXucuLnUMjOEzDI+1KRzUFrI+U2yf7mjG/nyFBld8O0aUJjD
	dn4LLyo4dr6SUt5LPPlWpzbv3qOAS7vDvUylnHNufMI20DJuu5cwkPT+F8lY1aqpR4aFkhh73Sh3v
	Ba3/mV4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZX2u-00000005itb-0KXc;
	Thu, 01 Aug 2024 14:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZX2r-00000005isD-3BGz
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 14:44:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92DD060E73;
	Thu,  1 Aug 2024 14:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D7FC32786;
	Thu,  1 Aug 2024 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722523484;
	bh=yWRzKkA1fAc3LTDx/IyWXZIrXafQjDv+7BkIxVifL8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD3Ln2OspqdH0jh7sCea6e/o0uZY/OzY9jp78ALJQwbP84f1/NaLa8esqwJWL8lPz
	 p0SpQUSsJnLGtodaKWOMKq4uRkz6cchJWzOfGBqSXeAN6ckRPfDuqDIdROks4VPJmr
	 ysXKdt50ietfHWLnyKypfra6Eui+eDtEd0DrcdSKv0bFhBsT4UfKRYp7mWMB2YiReQ
	 ujD8dBFCvf+SB5+KRaoYtj3sbOAhWdDYj5fubIuh65bUTVRgkHRy9hhb4kK/Sp24yg
	 kT/N00viDth3MmwoqeqhF/83Osa9GWEySwu6v0kPRqMwvRzC8RhUwSLwTOkGKF4cVW
	 BhKqczRi3uOzQ==
Date: Thu, 1 Aug 2024 15:44:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 12/13] dt-bindings: riscv: Add Ziccrse ISA extension
 description
Message-ID: <20240801-unlighted-senator-cc60d021fe28@spud>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-13-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240731072405.197046-13-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_074445_965553_5B507C5E 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: multipart/mixed; boundary="===============0329505900726807162=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0329505900726807162==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vk7KX8IGXHik2sFq"
Content-Disposition: inline


--vk7KX8IGXHik2sFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 09:24:04AM +0200, Alexandre Ghiti wrote:
> Add description for the Ziccrse ISA extension which was introduced in
> the riscv profiles specification v0.9.2.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index a63578b95c4a..22824dd30175 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -289,6 +289,12 @@ properties:
>              in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>              riscv-isa-manual.
> =20
> +        - const: ziccrse
> +          description:
> +            The standard Ziccrse extension which provides forward progre=
ss
> +            guarantee on LR/SC sequences, as introduced in the riscv pro=
files
> +            specification v0.9.2.

Do we have a commit hash for this? Also v0.9.2? The profiles spec is a
crock and the version depends on the specific profile - for example
there's new tags as of last week with 0.5 in them... The original profiles
are ratified, so if this definition is in there, please cite that
instead of a "random" version.

Cheers,
Conor.

> +
>          - const: zk
>            description:
>              The standard Zk Standard Scalar cryptography extension as ra=
tified
> --=20
> 2.39.2
>=20

--vk7KX8IGXHik2sFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqufVgAKCRB4tDGHoIJi
0jq/AQDKme9i0ZnDLmCj43Cb8IW/tVrItu1FVtB7WbJMTpoGBwEA+TebmkDz/Bu9
wFToOnjAf5wH7WupVoZ1Lv3Qh6WEHgs=
=bzCq
-----END PGP SIGNATURE-----

--vk7KX8IGXHik2sFq--


--===============0329505900726807162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0329505900726807162==--

