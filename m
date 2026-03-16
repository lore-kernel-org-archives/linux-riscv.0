Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD8FF46452
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyGbbkF0bSe1MYjL5K0No7LsBGlp+6cBWVO11uoarqw=; b=jVF8AANt7MTFGJT9M1kPnUNaJg
	HX4h8Vr39vTQM/VIFNP6OET8+N3IFA6SFw/V1rLtv6LgWrKHh8OvDX0vOUM1LAUqvOWgQ28QEw8KF
	GcbwCIes8p4nAwyoGRyz6ypVrDd6UEvqafk1coizVsAobQfOd/ARTBZhXktVOVpT53A1vWsfbOpDe
	DCvkLIjpmq9x2ZpQ6aV6k64VLQWFYQdg1TicKoOGupYvJ2NBf46hDDOxQmOQfbLo88B6GQ6i3vDE/
	oQWwKFg9medaYg80Gs3lwXw1y20XnrMhDbcFTRZGCND6b9R2L5hxmImu3llPRRxW3M33umUDfOUg+
	8K5ubi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25zq-00000003oQp-2QYZ;
	Mon, 16 Mar 2026 11:20:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25zo-00000003oQe-2ieY
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 11:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1A26013A;
	Mon, 16 Mar 2026 11:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A34C19425;
	Mon, 16 Mar 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773660027;
	bh=dVJUwMYfXrWl+hL9SCPmas+DDb5aN/lmBHb0o8Zc6jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VkqMEwZlCJcDEb1xxK7FugSdj93w6hg2H0ZN+yuW4vy/upw9kOs4g7WL7aIWNMg04
	 q/3UXV63GjQbZab1BpB+cIaVvqFj2FE4acIZ6YQEDkHPV8lps52oPUvU3PsXTNBbl9
	 6G6NPsWkhe5lrsJPxDVWOZdWLLEpRmRuLQbozaQbDYuYj9coPI7tfk66d6yx1EnOrN
	 AlnCSCqd+ewdIN1v00xmBCYzTCXuRudXHcYG3nb6pskoh5FXVdUlbydUan4xXPdf1S
	 HUsEu9ktebdjF6I/0xa9XSHk4Btpv3O0t/4T9PvJ6Iwt4N2yp4d5++4lB5Jg8XqAIf
	 Yg9BDgDZ/mYHw==
Date: Mon, 16 Mar 2026 11:20:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: serial: update bindings of ultrarisc
 dp1000 uart
Message-ID: <20260316-emit-garter-292687076ee3@spud>
References: <20260316-ultrarisc-serial-v1-0-c464f3e933a5@ultrarisc.com>
 <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
MIME-Version: 1.0
In-Reply-To: <20260316-ultrarisc-serial-v1-2-c464f3e933a5@ultrarisc.com>
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
Content-Type: multipart/mixed; boundary="===============6228608430991995392=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6228608430991995392==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wdBWOCsNzigriQdV"
Content-Disposition: inline


--wdBWOCsNzigriQdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 09:36:19AM +0800, Jia Wang wrote:
> Add UltraRISC vendor-prefix information
> Add DP1000 UART compatible information

$subject: update bindings of ultrarisc dp1000 uart

You're not updating, you're adding it.

>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.ya=
ml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> index 6efe43089a74..0040ed28e35b 100644
> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> @@ -78,6 +78,8 @@ properties:
>                - starfive,jh7100-uart
>                - starfive,jh7110-uart
>            - const: snps,dw-apb-uart
> +      - items:
> +          - const: ultrarisc,dp1000-uart
>        - const: snps,dw-apb-uart


This doesn't look right to me. An items list with one const is just the
same as having "const", like the snps,dw-apb-uart entry below it.

--wdBWOCsNzigriQdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfndgAKCRB4tDGHoIJi
0qccAQD6zlH0epUiaLIDo8zyA3e+UoE4noDoNHVS35rkUmynkgD+IicJiFQ3eOUm
4bBJEucTGH6R8VgSxm3CAkkSqP7SNwA=
=dVh4
-----END PGP SIGNATURE-----

--wdBWOCsNzigriQdV--


--===============6228608430991995392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6228608430991995392==--

