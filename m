Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7331CFD313
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m06D1dUAgJwP27GKV0K3a1SRnuR/ysjgscTZkeq9k1w=; b=h0DVJo/PxzD+evzUcM4ZYiJ5bb
	rk7948ZX5cTaJu+VXQuO8cb3axJA8b0Imjyp3JzlEUTg1ijGloq0gSba/Pf1hwclBDsQxn1fvrdEj
	IKk2SZW7Zv7ul823fGtdX/Z+G++4xPQtQORKb5aqR6Tfjp8I5WutF45poG5fJ4H7FewmXY7nc1/XT
	OFok8j672lATgKRrIzSiwiZMrVrC8eXlzioj673EQCxZr6XWf1qkBl/rZt2w2x8AhvQ//R5EBLx3g
	Sz5PTtoopLPtE1vYQygwPJ/ioJGy8ky0S7DSmQzXGjfAMAcTq0OJ3AglwVPu3jAkZjFExr+YW6tFJ
	JNq1IheA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWX2-0000000Bj8X-0jSj;
	Mon, 24 Nov 2025 13:23:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWWw-0000000Bj43-0jMU
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 13:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D3E74032F;
	Mon, 24 Nov 2025 13:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91080C19424;
	Mon, 24 Nov 2025 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763990577;
	bh=jWpNfXp2XVxHgoHH9kAd4jxe3FJiOOUu27hLp4URElY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQmOpXtxbsWU5faJtpQ0hkeihHbXBJTfoV05dTjFD+QIZuFk/zZCd+jtlw62w/4Bt
	 whvGR0zvsK0s5MptiZo2NQOKsQyUdg0dJ1wgfaqaRexe8GR+jNZeNIV6/lJ9BW2FFe
	 DYg6BTAElh1VjSV82BhzKMT/O04W1fCpBgsYbf7r8GHPId3fXv4zmQRsE3m5kTsjWK
	 ZrWpCvioPH6pgd937NXVKQCQKO2kkjOpY+kH3pzCAwe6/40UcEir7/2IbTwBNJ+E3g
	 trBYr0JAHBxdSmoiV7d+AulEzRWCulQ+5blffJ1QdzcKi9I6pSXAJfqJdVDSWfpI0F
	 dNsUWufdzkCLA==
Date: Mon, 24 Nov 2025 13:22:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
Message-ID: <20251124-state-campsite-3e7788a495c1@spud>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
MIME-Version: 1.0
In-Reply-To: <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_052258_234084_69D2DCEB 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============4505304929323777327=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4505304929323777327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PqWb7Q6FtE66sFtH"
Content-Disposition: inline


--PqWb7Q6FtE66sFtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 08:28:10AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Nov 23, 2025 at 02:50:44PM -0800, E Shattow wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > Add "xunlong,orangepi-rv" as a StarFive JH7110 SoC-based board.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: E Shattow <e@freeshell.de>
>=20
> <form letter>
> This is a friendly reminder during the review process.
>=20
> It looks like you received a tag and forgot to add it.

It's from me, don't resubmit just to add it since it'll be me applying
anyway.

>=20
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>=20
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/s=
ubmitting-patches.rst#L577
>=20
> If a tag was not added on purpose, please state why and what changed.
> </form letter>

--PqWb7Q6FtE66sFtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSRcLAAKCRB4tDGHoIJi
0sXiAQCsWVQBNOIWvWCWyXo/SsGJLlywVN1pKbt5+v1nN1nc6wD+LpnCIr5T2dkR
c+le9TFmHyCNgNjX5VgDtd5w4IuOEws=
=3FGb
-----END PGP SIGNATURE-----

--PqWb7Q6FtE66sFtH--


--===============4505304929323777327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4505304929323777327==--

