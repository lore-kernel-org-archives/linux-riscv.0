Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB749C61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TKEeX/9W9P6tP+hwXQZVvB8mIU4uFK/kD7smIWRjLw=; b=IbCjlYOc6cseGp+tH5ebgjKUYZ
	3iF3sr8I16zKoLHdCeaV1zg8ZeXPlkosU8XVlTEuc2WG1P5OKcZwDFV/caqsYaqE1qgtqGNJKXMQT
	UbPg0Hg52QpoYYdBd9hc+sThMATg33hq263xpF7HYbZGQVc1caMpVmnvwkNp2reDsLtd/VNszxDkV
	N60oovPXPiUUFE+OPjrsVq7j0OGHGAus76ozoKCpwKuVh7zsSqKbUf573f58q+EezsZrYlDFAAGgK
	JSDUGyGahLXbdFrDaEOP4VWrrDaFB2EW20ABmB9cweTAIGE7s+p5qw/NmtcwOrhG1GSXwz/ISExXJ
	hN3vzGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5prP-002Oye-0B;
	Wed, 22 Nov 2023 16:13:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5prO-002Oxk-0v
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 Nov 2023 16:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b2nTl96C3C5sv3UzKTb650wEGPo53mm3yZpl9sYxoS0=; b=RxERtr24qvCCKxEQc+Tg4+RjX9
	WNmYj7j4OuHK/lqC5bMP1EMpbHiqEyxbPvX4PXAf5ih26/Ji6DZ7Okq9D5u4PONjs4+52sHh1RozF
	zyuTe75XbBSsswsAnUOES1IwyE48rrQc5hTe8BJ4chEJaAVdYYRBlYf5oauPQ7QCqc4BakAwTcp/t
	O6qgdZGe1DFJGJF+XRY3TatmpGmhY0ppMfYPJudq42LUiHcF1Fx/ChD/r5pprKHeyK64yCk5qMSnH
	Vs2rlwzlPghb2fdsoyBvInBqsJxu8xnJoNbFQniM/hkwN41SBi30VnOFZf5gM+Bpxt73BhDnZ11Rl
	VLqrc0oA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5prJ-00CMbr-0T
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40633CE1F39;
	Wed, 22 Nov 2023 16:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0371BC433C7;
	Wed, 22 Nov 2023 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700669620;
	bh=b2nTl96C3C5sv3UzKTb650wEGPo53mm3yZpl9sYxoS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lG8Qpst2HZvWgqf6mkTFaP5fkgbWBooDCM0ZTYirNIL4XbSPyXfwY6ljuL8tIA5tN
	 oQTE+0RV8RgBeRZjD15Mm8Jghm38A0FhbdjMsiPcptC4dgZDSmm8HvANrTCe0+ZAp2
	 RC9ygzbxtd57rFqegIFmwfomhENk/d/GH0RhIKZb76I/0bAwSjCOVIW79OxfXu7WLz
	 gV3lCOgnLVeZfKOg49NoogyFidRBYzPkKFWcoiHHDk8hdhqU4cD2jd5bbZN7lf0fK1
	 hxka9hhTad960OppnDBTusNoe2odAKl6D42Fj/XeWOcHCDp85Nb0cX0lX+2ppZY/bS
	 XvsQpYOmOf8FA==
Date: Wed, 22 Nov 2023 16:13:35 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: riscv: add scalar crypto ISA
 extensions description
Message-ID: <20231122-bulginess-rash-08f811f54f0a@spud>
References: <20231114141256.126749-1-cleger@rivosinc.com>
 <20231114141256.126749-6-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231114141256.126749-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_161349_555923_5D6DEF52 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6795039741477250521=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6795039741477250521==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MwP0K8Sf91YW7Tpk"
Content-Disposition: inline


--MwP0K8Sf91YW7Tpk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:12:41AM -0500, Cl=E9ment L=E9ger wrote:
> Add description for scalar crypto ISA extensions:
>=20
> - Zbkb
> - Zbkc
> - Zbkx
> - Zknd
> - Zkne
> - Zknh
> - Zkr
> - Zksed
> - Zksh
> - Zkt
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--MwP0K8Sf91YW7Tpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV4orwAKCRB4tDGHoIJi
0t+FAPwJWXny8MqLPpIpmQrQtwO3Qntn+WM4+IITgS5uuTwgDgEAk2BRuEGqBZid
AeYQalnd3+AvWO7eHvWwQPyGs3dTUwY=
=2+fF
-----END PGP SIGNATURE-----

--MwP0K8Sf91YW7Tpk--


--===============6795039741477250521==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6795039741477250521==--

