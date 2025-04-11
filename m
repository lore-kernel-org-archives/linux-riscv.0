Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB53AC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VdHUE9b1+Jcj/FVU6J555O/JR19w4pkcjKQX18i29M=; b=B8n2M0kTeld4wy0tF4W6DCIefR
	+xnmDMPS1Fke/GXwcNjOeIIrxfza1AVRDvmbqVHsnRD2T/QhDZLK1etChI/yR+7cC0kTruuKi3+Nz
	+DUbaIMI2w4z7uO+9tkM5Z7yFbgrc4zCzQvvovh3uBgjm+xKvdWzL1iSUPk9Bj/9FJHGmVQdQt09h
	7LZNf1B+Et04Oq3/mCwHFPSt48fH0huWHhHhSdDILoD2hn0w+eK7sra/q8L7Of3+OYXdMcIwv5me8
	kQ895qjbJqrxQjBYl4bcJp/dq9HjMilkWcLDjfjP4yl3vjZDLqKV3Gd7/LrVa425Do+qdv7lZ0LGs
	HgaQzvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HEI-0000000EMK2-0yvF;
	Fri, 11 Apr 2025 16:27:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HCW-0000000EM0X-07nW
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 16:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 657A168469;
	Fri, 11 Apr 2025 16:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C037FC4CEE2;
	Fri, 11 Apr 2025 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388754;
	bh=IbMPUMiRgDbJN5mpv1wHxB3TJALuK+hzkSmv68laefY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3yuqv8fKUi5nha3YG/pWqLsM2cDkpVSnuQa+L7k2Rux6xvFYPpr2Jph4j2/k+YmF
	 EarVHrIbYbWwvpFYfnEwNkacVuiUq4cUfRCCAufG0lDvJy8siTghBvZ7JqOAkM6nVh
	 XEXt9qX/1RJjKzJM1g87mzpcD9sfw9mo1joWInEcBskl3GDe6hKOWKLzC5CLoOSu2g
	 1t59A5ekBnxygRD7ywtwzhD4clEGePSR8G5tETGv83oxMBUv60FwHP6QkBCSeP8lKI
	 v+IMzqOXnUwg9qaalr9RzWccUFNYFuIc3bREgHYBUgX16jU/+dmSbCudN4H6Io+E5y
	 2Zz5XpTo/cBqQ==
Date: Fri, 11 Apr 2025 17:25:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN
 EIC7700 SoC compatibility
Message-ID: <20250411-backward-mountain-3dd2b913f9f9@spud>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>
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
Content-Type: multipart/mixed; boundary="===============3009165632933092858=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3009165632933092858==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfCbZ/DX2h4jl3k9"
Content-Disposition: inline


--BfCbZ/DX2h4jl3k9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 08:55:14PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> This cache controller is also used on the ESWIN EIC7700 SoC.
> However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
> So add dedicated compatible string for it.
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>

This and the cache driver patch have already been applied.

--BfCbZ/DX2h4jl3k9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lCiwAKCRB4tDGHoIJi
0r0TAP9/Xe91SCCpsd+5pjIflb9aHhJFCLjbG5kJPXINt8lY4QD+JSZmjbgPp37B
aixKMKnrSHweJ/BUODIZMYhcz4HmfQM=
=3dNx
-----END PGP SIGNATURE-----

--BfCbZ/DX2h4jl3k9--


--===============3009165632933092858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3009165632933092858==--

