Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EEDCA100C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfke6hRmiDYsj+ROouCCb6S2SVudBFIm0UAPW1X+k/M=; b=epfj0zlPgqJ005//6va96kLiKy
	Er8G/tLJJv1BtGwiVrkZwGHh6KZ4Thxz0I8VMPU9xqfPXMVgDU8socWyXexawxQziBVhyNbilh7mw
	+zb7h7IfpyM2lW5P9Y1DFQjIt3wf/hn1ILE8gPUi+XAWptNPQKMsTTdMrChOEHWHAQsyRJyV0WNm9
	KF50NvobiUTuck4F0uLGfE74q/m2edScM9Sg3iXmGoHwQHzbwq9d6+WlxaNliwfH3WCqva5u8+AjQ
	HJkPGmR22dyqfcjZLQ0MGgSu9JEQ04MjBkTdYusxcXkG3MLcKmfzt7OALg87wcMnizl0ZwRWCTOuy
	nP04h4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDn9-0000000EI1U-3wSg;
	Mon, 01 Sep 2025 23:18:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut9Wb-0000000DbFn-2sO1
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 18:45:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B190600BB;
	Mon,  1 Sep 2025 18:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAB8C4CEF1;
	Mon,  1 Sep 2025 18:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756752304;
	bh=1YzNMjZhCaQIrNSILETW5/3BwbAqQWDiIS97qg9unZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL/2IfJjMvOf9hTAxls37Ft8Y2ur6mM+BzZoaakI2vPs3ciMLlU3/jRe//wfy07C9
	 6s3TO1SxB6u6Gi63CHjkFbRoVd+Evo/VxFqPRAIj3XF8aMhww+cbyn+GHJVsZt0DsA
	 ToPS1G147E+4WKaURLiy2th8hnZtAF7zMm/8/43Fw88P5npLandSfw3+xLiuiJQ3Xs
	 ZJBRp5Pjy9/4yJKkCFm1iJJ+FaMkAB2Q0Xe86moJ/0DvuIsSBJxflBK1EHSahw+dM+
	 acRVjW17njVaRjM6i402t0bMIbbY95A8ecV4vBHpStnAS65n4NdxOTqssMoYokVjXV
	 tnHHGTWt88peg==
Date: Mon, 1 Sep 2025 19:44:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [PATCH 2/4] dt-bindings: riscv: Add Zalasr ISA extension
 description
Message-ID: <20250901-caravan-traps-9fb18046b458@spud>
References: <20250901113022.3812-1-luxu.kernel@bytedance.com>
 <20250901113022.3812-3-luxu.kernel@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20250901113022.3812-3-luxu.kernel@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============8698758972910098748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8698758972910098748==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AL80nCar+VMsEAi6"
Content-Disposition: inline


--AL80nCar+VMsEAi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2025 at 07:30:20PM +0800, Xu Lu wrote:
> Add description for the Zalasr ISA extension
>=20
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf534..6b8c21807a2da 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -248,6 +248,11 @@ properties:
>              ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc=
 text
>              (#1304)") of the unprivileged ISA specification.
> =20
> +        - const: zalasr

This is out of order, no? zalrsc would come after zalasr.

> +          description: |
> +            The standard Zalasr extension for load-acquire/store-release=
 as frozen
> +            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalas=
r.
> +
>          - const: zawrs
>            description: |
>              The Zawrs extension for entering a low-power state or for tr=
apping
> --=20
> 2.20.1
>=20

--AL80nCar+VMsEAi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXpqwAKCRB4tDGHoIJi
0q1rAQDS6x9A+kKZpKJrIw66WhCpCrIK6vSliB+s3BMy2XB/bQEA+HyP69er2SfV
sZscX5NUIunelfCqwxnNr3TQUCvIFwc=
=w3HQ
-----END PGP SIGNATURE-----

--AL80nCar+VMsEAi6--


--===============8698758972910098748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8698758972910098748==--

