Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F06FC79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izzG7aAY8eV0XLDgRJt5Gqb6I2gxoQm2PjYvV2EX/H8=; b=A/CXg4pYpF59QkucTWfP8HjPtW
	VP8NRvbWj63Fj4hyO+XwY02vXuMLf+KrsMwxnjjdDicGhcdGLIXCBcGkNEigDIqaGITTev8AtQllx
	Zby4cp6ivF8GaEjM5TR4k1QV8eOEN7zfnlpZN0hiaHoHYePt98kaarSsNy4Iv90LhXV36oHtQ/mlU
	cKYUpbWKw3t5js1YFpc4TQHhScn6/0qREKeWSLltEfrBa5iYhILVMdch3VMh0RA7MOrYrMJHqIkg1
	PMssdcQMZDBpSsn2NvDe08Cpu1ZUZwD16KX2gk63PpkzsIgJCDMdK8tuKxwLUDCoHgYeTfwhjHWjT
	Af6QgdOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zxb-00000009tcN-03pm;
	Tue, 08 Sep 2026 17:50:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zxY-00000009tbX-1weW
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:50:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC11C409B9;
	Tue,  8 Sep 2026 17:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144F31F00A3A;
	Tue,  8 Sep 2026 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788889815;
	bh=//uuhykbHITGZZ7vXNYzwKmowhpT9TF5NuDZncqVLqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mS7Iv8JBf5eOu0WPKJCvDjM76ISD9Rg/d0fjtyT8KmvvKCsFRuhsS2Z4NM30UzL02
	 nIYHVWBCas9cT91zewU1aJL56kkbDd6WlV476TcKb5uLvXhFi9lPuxjE1ldATt1XOV
	 AOO1wKGNEFbTJM5cXtsispzFsQ1SrSL7Awqhj4TJsP1WgylrIsDcWeUmOeXzy0F9/o
	 LFUhr+jSlQbzqgKxvgM2ADEJza7/lHBwVwpSvnG5oopyTS0S0TfXP7LzZiWoMK9+g0
	 PCUM0dqpAN4IOcVs5BxZY6oRQWQO3UFCHrZMuRgMh0oRz1NijwcgDTY55iBzvK/if+
	 jder6keVg9ovg==
Date: Tue, 8 Sep 2026 18:50:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v2 2/9] dt-bindings: usb: ci-hdrc-usb2: require clocks
 and resets for spacemit,k1-usb2
Message-ID: <20260908-tapering-panic-e76cb4114d92@spud>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
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
Content-Type: multipart/mixed; boundary="===============5190032695874697622=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5190032695874697622==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cx6n4VJrT74vmFyW"
Content-Disposition: inline

--cx6n4VJrT74vmFyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 05:48:39PM +0800, Junzhong Pan wrote:
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
>=20
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Squash this into patch 1.

> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 14 +++++++++++=
+++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 6f8d88a0681d..5c2b7eb1a6ff 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -114,6 +114,20 @@ allOf:
>            maxItems: 2
>          clock-names:
>            maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-usb2
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        resets:
> +          minItems: 1
> +      required:
> +        - clocks
> +        - resets
> =20
>  unevaluatedProperties: false
> =20
>=20
> --=20
> 2.34.1
>=20

--cx6n4VJrT74vmFyW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBK0gAKCRB4tDGHoIJi
0jgEAPoD/utP2/Sy4njxEBqRq7ll+X3uQeDuZxxMuHskHm1s0AD/ai7Bo6A4fBgd
EDgNhPtdvP05rnHU3zmJnLTWJW1DiAw=
=StnG
-----END PGP SIGNATURE-----

--cx6n4VJrT74vmFyW--


--===============5190032695874697622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5190032695874697622==--

