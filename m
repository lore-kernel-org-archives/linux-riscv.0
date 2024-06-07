Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D55C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eNCYS6kOKHUoQwrfiQPEWtSHAZsu9ABhmumf86lNQY=; b=MJtFpXs+4jVuUSwpnz6582iK3k
	wt341PlXVac22K9HSVQ0xemTIdJdlye23HmWj5xGncd0RUiIq3sZUeH/Kq4ZomZihQkLug/Y25Goq
	p+yVMXiYgpcN1b5BlxL3LUSWGa266G9yrJe2nI/06KyLOM6Bo6XS93K/rLYhNI3JHKApLNu2yznMV
	jErLp9CEKSr8IV9aTr6hYETTgp+KIv4pp7c2Xc+cx+l5l5U23QMORDDowYCWUZSpTm4cRUZKoK/F5
	54IpuGAV/rqWkxZjtkb31QpN/seBfT7CEcqT0QyiRNENg9uywDjtVvHL+xU6lccgcbR/r3xeke2oQ
	c6VwPyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaJP-0000000EIN8-0v7O;
	Fri, 07 Jun 2024 14:11:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFaJM-0000000EILQ-0PGf
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 14:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F54661EEA;
	Fri,  7 Jun 2024 14:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACD7C2BBFC;
	Fri,  7 Jun 2024 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717769477;
	bh=suuNusIzkzRsJ1dnHfTnPwZzMdarY3ER9yTq8osWV3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNuikrl0L49lh26A7q6bYFusU2zK/gBbXIAAxc9e3jAgrGu8PBouoIfK58Lv8EzE+
	 8zgwQNEezTP+5QI/lSU0FsxOnHN88MRFR7swLuJhSWZKXBQ02/+kRfPN4vZ82qf7pG
	 qvg6sYyd3XpH3VxmSvkKLtQMq0RGPMuPZ9AIc79rXZ9ROgnxKH4RRXADGQmHIscBid
	 5j8aQ6AajfIxKwFoRv9jQgoAZG/ax5Z9ZgQTlo9K6iJkPVuhy5MP6KeZ8NjYzytYHz
	 toPLdgMJymseoMp+SYasQsAYoK05Us9s1f7XzqqLF9FW5zn00azXXoUv9fuH6+Vwme
	 g3Enrgf+EoaZg==
Date: Fri, 7 Jun 2024 15:11:12 +0100
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
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RESEND v3 2/2] dt-bindings: riscv: cpus: add ref to
 interrupt-controller
Message-ID: <20240607-essay-rink-a74d82d3c56a@spud>
References: <20240523154748.22670-1-kanakshilledar111@protonmail.com>
 <20240523154748.22670-3-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <20240523154748.22670-3-kanakshilledar111@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_071120_270379_B40A2E2D 
X-CRM114-Status: GOOD (  21.50  )
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
Content-Type: multipart/mixed; boundary="===============7970165424295847148=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7970165424295847148==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WO/yTYhFE1ojeZ+A"
Content-Disposition: inline


--WO/yTYhFE1ojeZ+A
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 09:17:50PM +0530, Kanak Shilledar wrote:
> removed the redundant properties for interrupt-controller
> and provide reference to the riscv,cpu-intc.yaml which defines
> the interrupt-controller. making the properties for riscv
> interrupt-controller at a central place.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
> ---
> Changes in v3:
> - No change.
> - Rolling out as RESEND.
> Changes in v2:
> - Fix warning of `type` is a required property during `make
> dt_bindings_check`.
> ---
>  .../interrupt-controller/riscv,cpu-intc.yaml  |  2 +-
>  .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
>  2 files changed, 2 insertions(+), 21 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv=
,cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,cpu-intc.yaml
> index c9c79e0870ff..6c229f3c6735 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-in=
tc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-in=
tc.yaml
> @@ -61,7 +61,7 @@ required:
>    - compatible
>    - '#interrupt-cells'
>    - interrupt-controller
> - =20
> +

I tried to get Palmer to apply this the other day, but the series
somehow conflicts with itself, due to this hunk. When I apply patch 1/2
locally, this whitespace never appears in the file and so patch 2/2 has
a conflict:
	b4 shazam 20240523154748.22670-2-kanakshilledar111@protonmail.com
	Grabbing thread from lore.kernel.org/all/20240523154748.22670-2-kanakshill=
edar111@protonmail.com/t.mbox.gz
	Checking for newer revisions
	Grabbing search results from lore.kernel.org
	Analyzing 3 messages in the thread
	Looking for additional code-review trailers on lore.kernel.org
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=97 [PATCH v3 1/2] dt-bindings: interrupt-controller: riscv,cpu-in=
tc: convert to dtschema
	    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
	  =E2=9C=97 [PATCH v3 2/2] dt-bindings: riscv: cpus: add ref to interrupt-=
controller
	    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
	  ---
	  =E2=9C=97 BADSIG: DKIM/gmail.com
	---
	Total patches: 2
	---
	 Base: using specified base-commit 20cb38a7af88dc40095da7c2c9094da3873fea23
	Applying: dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dt=
schema
	Applying: dt-bindings: riscv: cpus: add ref to interrupt-controller
	Patch failed at 0002 dt-bindings: riscv: cpus: add ref to interrupt-contro=
ller
	When you have resolved this problem, run "git am --continue".
	If you prefer to skip this patch, run "git am --skip" instead.
	To restore the original branch and stop patching, run "git am --abort".
	error: patch failed: Documentation/devicetree/bindings/interrupt-controlle=
r/riscv,cpu-intc.yaml:61
	error: Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-in=
tc.yaml: patch does not apply
	hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch

He also pointed out that there's a from address mismatch in this patch,
given it was sent from gmail but the signoff is proton. Usually git
send-email will sort this out, provided you've set the protonmail
address as the author for the patch. I think usually this sort of issue
comes about when your signoff email isn't the same as user.email in your
gitconfig, but 100% on that.

Thanks,
Conor.

--WO/yTYhFE1ojeZ+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmMVAAAKCRB4tDGHoIJi
0ugyAP4gQBplTF+cj/i8WB1UnZhdAF9LfvVfGT0azEcfiURn/QEA+TUOI0QHbcCD
tZ7GD/a/3/pBOdWW3msepg1B8iHeagQ=
=wl4+
-----END PGP SIGNATURE-----

--WO/yTYhFE1ojeZ+A--


--===============7970165424295847148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7970165424295847148==--

