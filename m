Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCE4C5DF80
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDzosN66FG195q/M8ZOph04ebdRbSCuo8bM49cGwioI=; b=a+iqJaH4se9823Z8aRlpoAEHR6
	42Nk6+o0mvB8Ntq3AW3MwJevNsdEWu4GOKwr88GhkX7tezHAjLoU0cFGLqQJtMNgXmVPF9tHGM/J4
	KL2BnmGpOJQMmE78OBVh7z9EqDV+9AMOmooVFSODN6llgZnOzm2h6V0eTSsMjjpbDnMfwj/0mQWHq
	rr/bf+/bkemjTmKrYoLj2OIiprRPA/1RQBZR5/bztmU0P0sAbftTWDWYtTc5RNSv9ByHO+yUSLTKG
	eEzKuUVSEzXPH01DFFCX/6K4uerpJ1GFYC102INR3hbnwMpl/scy6ltQeIsU+tXo/Jh6plQrrgzeq
	zDaf4org==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGEh-00000007dp0-2e2D;
	Tue, 18 Aug 2026 09:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGEf-00000007dos-3Lhj
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 09:35:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2085840199;
	Tue, 18 Aug 2026 09:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0CF1F000E9;
	Tue, 18 Aug 2026 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787045757;
	bh=b4BmVR02USpUiuj8iihPmQKITu4yz0lHFUqx56OCGT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+fUd7nAvVseq7h4yoAtcdRhbaGsDiBvieu3cmO2oQxkcFjSmhfVeVJQIEZ/DU/Gf
	 NB7H3MIpu2jWTh8KNFY/llgzMmJT0WXEQ4erZMS1rUDOnj5CgAwu9FsBREMuznygSF
	 D364dDAuEUpPsyXNJY19GEt3YuWjiv/t83Ca4Iomgk6XW+ppm6TGjnZaymeYB+aMoe
	 94Q0Af9N4bY+Q2GISnBg4DnwtJJbIZ5aWbqcihEybD5jKrhuluOrImnTq1p2u1XPpx
	 m9CCgpFPea4Nx2OUwDjxSAEytJYG8CFbHnoEQ1iVGfyBVX1D1ETsf38E+HzBYDtewu
	 dKvX+LOXaiMnA==
Date: Tue, 18 Aug 2026 10:35:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi
 extensions
Message-ID: <20260818-hunger-module-a44d9716010d@spud>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
 <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============5550601682830432980=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5550601682830432980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NXk010FMsqIWIm0u"
Content-Disposition: inline

--NXk010FMsqIWIm0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 09:32:17PM +0530, Mayuresh Chitale wrote:
> Document the RISC-V Performance Event Sampling extensions Sspesa
> (Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
> Overflow Interrupt) in the ISA extensions binding.
>=20
> Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
> is present.
>=20
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Why is this series RFC?

Cheers,
Conor.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 5ffc40d599c0..f316b93754ff 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -232,6 +232,18 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: sspesa
> +          description: |
> +            The standard Sspesa supervisor-level extension for precise e=
vent
> +            sample attribution, as defined in the RISC-V Performance Eve=
nt
> +            Sampling specification.
> +
> +        - const: ssplcofi
> +          description: |
> +            The standard Ssplcofi supervisor-level extension for precise=
 local
> +            counter overflow interrupts, as defined in the RISC-V Perfor=
mance
> +            Event Sampling specification. Ssplcofi depends on Sspesa.
> +
>          - const: ssstateen
>            description: |
>              The standard Ssstateen extension for supervisor-mode view of=
 the
> @@ -934,6 +946,13 @@ properties:
>                  const: smnpm
>              - contains:
>                  const: ssnpm
> +      # Ssplcofi depends on Sspesa
> +      - if:
> +          contains:
> +            const: ssplcofi
> +        then:
> +          contains:
> +            const: sspesa
>        # Za64rs and Ziccrse depend on Zalrsc or A
>        - if:
>            contains:
> --=20
> 2.43.0
>=20

--NXk010FMsqIWIm0u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoQndwAKCRB4tDGHoIJi
0tlJAP4w5GCA8+uqOuxxYbSrz/hjl8CHq4Te4t/0YaZ8pFJq0gD+Oi6+k8Ou20f5
YXvedETW9VAPBH9qq7MK++nt5cYEsgc=
=QFPg
-----END PGP SIGNATURE-----

--NXk010FMsqIWIm0u--


--===============5550601682830432980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5550601682830432980==--

