Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2E8C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv2/J1xxGLz2EE5rlrbaCoWqvRaJXu2X5iBxFUNYcdY=; b=1fIKemV+s9WlFZcBk6JxyYTchk
	2TeyudQc9O/p6qz/O1gRlvwvT1mFQFatCU7eFoUsFHAFe5jT2LEpDQ7195uXeQaXKVtZAlogNJONJ
	bmt14+/CHBKm2pofiA8F/pdfusMKKc8Dlnm1L4QUC6kW3PSP0CbinIEmhz9T48ZUNheBFZ39CT9Ha
	9ry41dbtpLK1n2e06zAB15oZU/PmXa9L+mlj05s6zU5xHifDChYj+jQkUP2hIlwA6BmOHZLxbksgX
	wcIjhqhnGkNq6+25uQ4IDYPmwQGf8Z4Qdv1DXuMRQNDvm3i3R3QrtP5lTl40L0vWszD4myVR2qpox
	n0ufwakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb0P-0000000FfO3-3Du1;
	Tue, 18 Jun 2024 15:44:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJb0M-0000000FfND-3gJo
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4352E618BC;
	Tue, 18 Jun 2024 15:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B16C4AF1D;
	Tue, 18 Jun 2024 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725458;
	bh=Nz74RKopuS+B4T23S582RCPI8vsJnBsk3FTpx1fP5ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4LRG5bbjkpvMDqJzi5M706m3FpBdIAYHszpbVxRMpYPlhxMQ/4w+uFTHwq5gdMHH
	 gZyNShx1ciZm22/pWrg5s7Dg75UtNJNLyrXRtcYNktarm8wTSjwiBIeb9UXfUuS6oN
	 +9e/b4M0XpRPZo3gAQlWOZKbljOJ6w2a31lz4ramRvJDgOV8gCM/7sw5H+tgKSDBWR
	 sZfD+JSpofVr7n0cm3czDSILbcBwc59ZZ/oXrcBNsElVvtDOXrsBL9R3HMFmEOat1M
	 7MFo3OZl8XTtkv1sv89gl/Mw1YZaY5/JDU3AGeXJfhPvg91fOtE22g9EptjePdK+5I
	 VCVbrhRMMihcg==
Date: Tue, 18 Jun 2024 16:44:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/9] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
Message-ID: <20240618-dumping-channel-9d44a0a099f0@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_417C31822BDAD48EF8B84B312521318DBA08@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_417C31822BDAD48EF8B84B312521318DBA08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_084418_986797_F0C929F7 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: multipart/mixed; boundary="===============5238334504627952127=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5238334504627952127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FSkqdc+KknUFXXWK"
Content-Disposition: inline


--FSkqdc+KknUFXXWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 01:20:50AM +0800, Yangyu Chen wrote:
> Add compatible string for SpacemiT K1 PLIC.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index 709b2211276b..3d0426b56904 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -59,6 +59,7 @@ properties:
>            - enum:
>                - canaan,k210-plic
>                - sifive,fu540-c000-plic
> +              - spacemit,k1-plic
>                - starfive,jh7100-plic
>                - starfive,jh7110-plic
>            - const: sifive,plic-1.0.0
> @@ -71,7 +72,9 @@ properties:
>                - thead,th1520-plic
>            - const: thead,c900-plic
>        - items:
> -          - const: sifive,plic-1.0.0
> +          - enum:
> +              - sifive,plic-1.0.0
> +              - spacemit,k1-plic

Why in two places? This isn't sifive IP, so I think we should go with
this one here.

>            - const: riscv,plic0
>          deprecated: true
>          description: For the QEMU virt machine only
> --=20
> 2.45.1
>=20

--FSkqdc+KknUFXXWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGrTQAKCRB4tDGHoIJi
0jq0AP4lxPgHkGay5JhNSJiMctW7CtSJbceARlA+wrgDdJXQPwEAkxZyXmL0TNEH
HEYlHWkxs4e4X0We91j0Af49H7k/Kgk=
=Wk3x
-----END PGP SIGNATURE-----

--FSkqdc+KknUFXXWK--


--===============5238334504627952127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5238334504627952127==--

