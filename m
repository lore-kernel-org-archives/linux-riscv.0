Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8879BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0BmkAMS0SKT4Pso/hFmo7uBAaCelM6OAefZh5iT/Y0=; b=BcI9XvLytUTdV+CQ4b8N0AO3zl
	XDyaLhHGZmT+xUXp+CzVYDExERQLLIp6cetIdejvi8yzR2KgCCifW8EgerBbTaxs/Tkn1T6zKGUaI
	0hRDd6u1OjBfN0FCc/0TVPajS0Ptcb7LbrRD5gtsfzIgPadD4j4nigsKJUbaFclkHOQl7GErM9WUx
	q+mCltdJpdMadXG1p4KONsquRHbp9rp8aMacUQEIuugj0ZGNRqByTYS1nKxnKr2uGznTF5IjmKTCZ
	saQgrTeRDv66YO9iU5aZm9lwmK7tbarOJ+q/vA8Wo8ZdgCnWBFF5d7xhrgZRN1BMBrhVu86VS93k0
	RD4nk5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpV5-0000000612k-2qvV;
	Fri, 19 Apr 2024 14:46:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpV1-0000000611c-2WpP;
	Fri, 19 Apr 2024 14:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9F5C61935;
	Fri, 19 Apr 2024 14:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07C9C072AA;
	Fri, 19 Apr 2024 14:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713537958;
	bh=IbMuf6RtD8S+NgEks0arYU+taglxFQZdg/xWQtc4Hp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9lnCVQtVuS6xv7XDhACZfxS2wk9z2JSrYp2yb6cmTvW1iv/kI+XLGTtwk7XrbdaA
	 D5slUkl1Lmbss4pJXB89SVWKGNnIc/bbSRPjCiBabn5VMfmIUTqarF/+pJPXE3DDve
	 tMRfw2Wr0+ljxp82dy/Rws2fIdHwNGWwmnNQRdb+bNKTIhPXa6Zi/hNfvR78sKp4PU
	 ha9U3WT3AKRIzKIyxM2j4uquHiW4ytBE9/knza1FRHelKtM0eHomRr9qF93okHMkk+
	 m7GmwQWaFACFcrDs78Ji29+8HvsgrRbgLRwreNq3mihbFZhVJwCOruEh/xOhcykxMy
	 48Lm6xuVctydQ==
Date: Fri, 19 Apr 2024 15:45:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240419-chafe-leotard-e5daee19b1c8@spud>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20240419135321.70781-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_074559_769485_FFC099BA 
X-CRM114-Status: GOOD (  20.17  )
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
Content-Type: multipart/mixed; boundary="===============8666333111782235602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8666333111782235602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QfhU+XUBAB3cbLSe"
Content-Disposition: inline


--QfhU+XUBAB3cbLSe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> which was ratified in commit 98918c844281 of riscv-isa-manual.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 468c646247aa..584da2f539e5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -177,6 +177,18 @@ properties:
>              is supported as ratified at commit 5059e0ca641c ("update to
>              ratified") of the riscv-zacas.
> =20
> +        - const: zawrs
> +          description: |
> +            The Zawrs extension for entering a low-power state or for tr=
apping
> +            to a hypervisor while waiting on a store to a memory locatio=
n, as
> +            ratified in commit 98918c844281 ("Merge pull request #1217 f=
rom
> +            riscv/zawrs") of riscv-isa-manual.

This part is fine...


> Linux assumes that WRS.NTO will
> +            either always eventually terminate the stall due to the rese=
rvation
> +            set becoming invalid, implementation-specific other reasons,=
 or
> +            because a higher privilege level has configured it to cause =
an
> +            illegal instruction exception after an implementation-specif=
ic
> +            bounded time limit.

=2E..but I don't like this bit. The binding should just describe what the
property means for the hardware, not discuss specifics about a
particular OS.

And with my dt-bindings hat off and my kernel hat on, I think that if we
want to have more specific requirements than the extension provides we
either need to a) document that zawrs means that it will always
terminate or b) additionally document a "zawrs-always-terminates" that
has that meaning and look for it to enable the behaviour.

Documenting something and immediately turning around and saying "this
isn't sufficient, let's assume it means more than it does" just seems
like we should make firmware tell us exactly what we want.

Cheers,
Conor.

--QfhU+XUBAB3cbLSe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKDmgAKCRB4tDGHoIJi
0jOSAP9IqK4PvY8JeZDma5rT1sWNFuEdFbrapMauGdGGPvAdSgEA+z96eLuQkw2x
uEfFX14BejcPofZs+eTpz/QcR0u9/wQ=
=dstU
-----END PGP SIGNATURE-----

--QfhU+XUBAB3cbLSe--


--===============8666333111782235602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8666333111782235602==--

