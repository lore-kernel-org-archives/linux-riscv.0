Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACFBCF9C5B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Sep 2024 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc9bw4T6BQL6Vj8FIOMYaPYEBUV0+FEFqNV8AvyX678=; b=Hb1gVPACK/SEXY2qWcm5CoPG3r
	L+ltv14tUm/O9V2iMmNv5OwjPBvOcKyp09pGLCuyAEKjMnKCA23G42WnMeDiFFpf5XzgyT6PesGI+
	LjJw7i6t6cxsrIkvHqSAr3lG9JQdRngtN1afd37UHM9H0GS7zgzshCGy4KwE22dWMbP12YWwOiUZ2
	CNk4iIuOetFiuvliy6bOo7HBcMvpWeA5i8SzrW7bqJ+nQFWJQdWa9IWrmrNh6Qf1qldLt/gPXp2zZ
	NCOKto/rlIPLQZaSsVQxBDBOozVsT4CNo59lAQO+cg8dxq9YkmZp9l/LTXAkIGx/ci8uY+W28UL1l
	CnOx9AqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ss8Eu-0000000EKZC-0mQk;
	Sat, 21 Sep 2024 22:06:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ss8Eq-0000000EKYa-2gOq;
	Sat, 21 Sep 2024 22:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C1A55C0533;
	Sat, 21 Sep 2024 22:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEE8C4CEC2;
	Sat, 21 Sep 2024 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726956358;
	bh=/X57ncqkKV685Tc73lC69jepq5DQEY1k/4jxl0qDY1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaFW6f6H4UbmenZx+RBfLxcjVcGtlv6PLhDt7CBFjY7+rsSkXYal+pGf8Y9K0/ApG
	 aP+3br8KzKBaSNGIWK73F1GLmQa06AlB3jQ2yTUJNQJW50Z3KwCB8gjCNU8AbuzxhL
	 n+d+6QS5euVbHibGXG80FHn2iGlM9DIPLErFhBioSqAUxwRCfSHRkDa1fmiAWRnONE
	 euQiKvpVXbdfRRv0QRhsr1t+iq02bSsK/xnZB5lNBTlIb4cvMz4gT4OynYkSATAXhT
	 7R6wthhKyj7+sgApV1KTWMw3oHPPLX/LyKH3mFbPfvDLTplyCVzs88G3VKW2IjGgwC
	 iENCPkcAOpbdg==
Date: Sat, 21 Sep 2024 23:05:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Max Hsu <max.hsu@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: riscv: Add Svukte entry
Message-ID: <20240921-shock-purge-d91482d191a1@spud>
References: <20240920-dev-maxh-svukte-rebase-v1-0-7864a88a62bd@sifive.com>
 <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240920-dev-maxh-svukte-rebase-v1-1-7864a88a62bd@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240921_150600_793314_0418A2BE 
X-CRM114-Status: GOOD (  17.47  )
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
Content-Type: multipart/mixed; boundary="===============3539319485526907487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3539319485526907487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e1yUmKuhmIxAjSpf"
Content-Disposition: inline


--e1yUmKuhmIxAjSpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 03:39:03PM +0800, Max Hsu wrote:
> Add an entry for the Svukte extension to the riscv,isa-extensions
> property.
>=20
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928958704855c8993291b036e3d1a63..df96aea5e53a70b0cb8905332=
464a42a264e56e6 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,13 @@ properties:
>              memory types as ratified in the 20191213 version of the priv=
ileged
>              ISA specification.
> =20
> +        - const: svukte
> +          description:
> +            The standard Svukte supervisor-level extensions for making u=
ser-mode
> +            accesses to supervisor memory raise page faults in constant =
time,
> +            mitigating attacks that attempt to discover the supervisor
> +            software's address-space layout, as PR#1564 of riscv-isa-man=
ual.

I'm surprised this doesn't fail dt_binding_check, with the # in it. I'd
like to see a commit hash here though, in the same format as the other
extensions using them.

> +
>          - const: zacas
>            description: |
>              The Zacas extension for Atomic Compare-and-Swap (CAS) instru=
ctions
>=20
> --=20
> 2.43.2
>=20

--e1yUmKuhmIxAjSpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZu9DQQAKCRB4tDGHoIJi
0vpuAP92NYEC9FM8e8Y7BhVJDJvf069DI4tcoz+kx+BoYjEtzQD9Fp1Wj8hFfHNh
s70/gx+0/zuAYgjxNfQ7GnUDfjIW7A8=
=lQCo
-----END PGP SIGNATURE-----

--e1yUmKuhmIxAjSpf--


--===============3539319485526907487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3539319485526907487==--

