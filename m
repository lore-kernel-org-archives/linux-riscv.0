Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42545C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGac+M5pX/T9ViL8VUb7S1qh4AXR+8lfAfyIBQaGdfg=; b=fcnBW7lkzKZUOfMXAskRC1EM7K
	aLd31CcL4lf8QxwUE9RTMYemZG8YT75HKq9IiIs0Mo9fWHWF3ANTud3JURxelwBw2MLrJq4p0BmvP
	W+ntzEdDO2Xprme0DaWoOcaNyi2wDKy4Nf4iEnEOkgasswqhyG/j+OM3YW94qjwURdryNk9W//GXZ
	iJ2Uglou5SK8roDfuB6WmQo2yKb0VvGZ1Af877T7foi0omYcqqx8drUH3I83gJzcqus6fZ3wp5R3F
	6afAdn6HExYeLBQzX53sJJ0e/HXc0B+zqzpG4KbEtJtInm8R08IhkAosSA2y8up+llQXhxXMRq/Pc
	8bLOr7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSoR-0000000CNjX-2Ysx;
	Mon, 10 Aug 2026 16:25:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSoQ-0000000CNj2-1iyp
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 16:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2334A60052;
	Mon, 10 Aug 2026 16:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382A01F000E9;
	Mon, 10 Aug 2026 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379115;
	bh=pAh3v8DSOricP8c8IdomHmGR384D8GLRdHwe8ZhhfrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nq+01urfpOf3tSS6UIVs7/4WXxunBYnb+DDgCzWxsKV8RSxnWCAdzqcSlygfU7GuL
	 vmsJIuLfdzPHWglGKyY8r4xSb8a4RSQ1tyM5m6IGCU0KZ9h6HG5qsEWl6Aaobl7O3D
	 Yby4KfuiW+2rjjFbak/6Ejs+EX6N/UkYltRbyanztdNPQYOmsPj/FyZj9oaNwIRliy
	 pQd8tzXsl+1sk0cmr4m4fcqqKj7LCHuYPXjyum8y5jW7M1lcIgLTUe6xAgMF6P5GJ8
	 lCAUhECwi3svbQ1IJvUc6nLN2WCsFt5A0hYbFABvtY4CFvJTuoaMCkSc/9i85bZnOI
	 VK0o+Lh9L0e1g==
Date: Mon, 10 Aug 2026 17:25:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add Worlds ISA extensions
Message-ID: <20260810-penpal-aluminum-772319e5fc10@spud>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-2-peter.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260729163908.249838-2-peter.lin@sifive.com>
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
Content-Type: multipart/mixed; boundary="===============3293830821955227295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3293830821955227295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LORA+nUn+PLrFGWG"
Content-Disposition: inline

--LORA+nUn+PLrFGWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:39:06AM +0800, Yu-Chien Peter Lin wrote:
> Add DT bindings for five RISC-V Worlds ISA extensions
> that implement World ID tagging for hardware-enforced
> context isolation. Also, add checks for extension
> dependency requirements.
>=20
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb21..7a57191a0293 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -193,12 +193,35 @@ properties:
>              ratified at commit d70011dde6c2 ("Update to ratified state")
>              of riscv-j-extension.
> =20
> +        - const: smlwid
> +          description: |
> +            The standard Smlwid extension for M-mode control of lower
> +            privilege World ID via the mlwid CSR as ratified at commit
> +            TBD ("TBD") of riscv-worlds.


btw, when you send a v3 of this please mark it RFC, since you're using
placeholders here for the commit hashes of the extension being frozen.

Cheers,
Conor.

--LORA+nUn+PLrFGWG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann7ZAAKCRB4tDGHoIJi
0vC+AQDjP2ByBSbSrh+lcSWq4XN0Z9/ci23W+K7QuvES9ZjwbwEAlxtv2WRXDNPa
W5wysXy5T+CWHJdCnJFL6PUn9c4UMAs=
=KR6P
-----END PGP SIGNATURE-----

--LORA+nUn+PLrFGWG--


--===============3293830821955227295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3293830821955227295==--

