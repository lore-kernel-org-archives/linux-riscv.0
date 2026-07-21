Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63352C44532
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VApq/BofkE35aAtDGuUHyUapmAxfgfFbeiWdsxJONKY=; b=uMd+TB2fK6q2R2volBoqp6mctm
	Uk/VEUpXvh+wN1TVTnIlDQ8FDxw5uD7VDKiDMILWKNZ1V+TMOqARVjXLp4fpN/jcIdWcblHW794dS
	2ByBLTRxQY2GGHMaOBi/5VMtx8BNJ19ul8qMv0oWheDOfSTHr4PW2CMYI5dnkCcZg5Y2vO2XTijvU
	zWbINueFvQAQ0Bp+6p9+uYg4rscjaI+CvRSeM+j+bQw2VrtYuvRvvTE9409o1+JW+E+jYwB16jfgi
	o1O3s2ymJ9mgWV5Mr0YsHhGk2t6EN0jCfhnEZNMBwPO3KDfZNoz6Yzrz3dMKgEMBdBGt6HvCk/jaY
	MYa0vJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCfm-00000009pSF-3VHO;
	Tue, 21 Jul 2026 15:46:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCfl-00000009pS8-3m6E
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 15:46:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26BF660204;
	Tue, 21 Jul 2026 15:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E4B1F000E9;
	Tue, 21 Jul 2026 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648780;
	bh=qyvqI3FKItNNn+NSl40sfGAVdAD6Z9EAaM5p5OjFDvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHjrHUfkgQ3Tch0hggGta8g4ZcwSXL29bYV79h1Vuoh0MJxlZSgv+AzdKZxx6s8rd
	 uMKKO4aLB6/S+WsS+loWRLJw2fB5/OQ9+xYvkCu+8FuBLnn2gwcHOjZhGrgJabdv14
	 +GDesQQjDjZ/EaP+MPFLnZNzFXjmbBn4YOFRm3yfYi1HA7fbrC1FyjmQlJqSohACGM
	 DWd1kUC4EjDA9zDOK7VM11wASduAwUMwxQG088znYu6uS2YKtrgoSouO3XJyMo4nqc
	 f3B7Vfa9t63k9132ohQKSss7uprLUXcM41XYpNtTBrSKVG4mXnB8rP7+yyHd7REypq
	 oXQeHUVmAC7RA==
Date: Tue, 21 Jul 2026 16:46:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <20260721-handbook-dancing-0c6805fbc94e@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
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
Content-Type: multipart/mixed; boundary="===============9131966500826661999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============9131966500826661999==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+s1jSkmJwwBDoYeF"
Content-Disposition: inline

--+s1jSkmJwwBDoYeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 02:48:29AM -0700, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.

Commit message should explain why a fallback compatible is not suitable.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> index 92b0094ff303..4a1ffebfdbef 100644
> --- a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
> @@ -12,7 +12,8 @@ maintainers:
>  description: |
>    The LM63 family provides local and remote temperature monitoring toget=
her
>    with fan speed monitoring and PWM fan control. Supported devices inclu=
de
> -  the National Semiconductor LM63, LM64 and LM96163.
> +  the National Semiconductor LM63, LM64 and LM96163, and the Sensylink
> +  CTF2301.
> =20
>  allOf:
>    - $ref: hwmon-common.yaml#
> @@ -23,6 +24,7 @@ properties:
>        - national,lm63
>        - national,lm64
>        - national,lm96163
> +      - sensylink,ctf2301
> =20
>    reg:
>      maxItems: 1
>=20
> --=20
> 2.55.0
>=20

--+s1jSkmJwwBDoYeF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCal+URwAKCRB4tDGHoIJi
0sguAP4/8GCUUUqjVudh2Yt2jdeHsUNXy8PqWvK/6mq9GnClgAEA10CrvsBJI2OD
37FQBfZ2wKxrlsiR8AoHkpIejBLmPgc=
=WK2c
-----END PGP SIGNATURE-----

--+s1jSkmJwwBDoYeF--


--===============9131966500826661999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9131966500826661999==--

