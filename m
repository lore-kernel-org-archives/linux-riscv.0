Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877FCCD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LcfRJZ+PWR4K5yRUFFHTGn1tJSxnzUHnFYIPeoVmK0=; b=TR0TaX/74Bzuwe7pO34ufZUIv+
	rTwmI8mmEp0bif5eSoxPFCC46OBQhr3eg9GWVC/DXD29kf00o8G7Q2tEpoDJIUOgDibSktDyYJjfH
	wINiK8yi+iLJ9Bcrax5REBZWk/YLL8uCxsOkcS7oQ3c8MZ6JSf/le8ru3fvvLhX4hgTNYjBFXQNV1
	aQo3n60sDr/ghS1Q6gqQe8f3ox05dCkU7SVPmjPbD5MKyzgbLsNwSL1TZvO+QXnnBnFp4uidPDdSJ
	KT++HXjYOU27NLxvquSvAclDuQ0oRJYFzGKRqCQGg+2lMGrsP+xiMg2a8SlNtFrsXzQ0hFjCYkvMB
	ahHw+pzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQF-0000000HSMr-1U1V;
	Tue, 12 May 2026 16:57:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQD-0000000HSLp-3qxq
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 16:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF6C40256;
	Tue, 12 May 2026 16:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C88EC2BCB0;
	Tue, 12 May 2026 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605048;
	bh=zQgnsAnbOUnV0Z18dbHGn7S65VpWXuaQb4J/vp+qMTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXGjvPJ85nYR64f3RYSlct3Z8PEyqwIBsLDolAjbgYm77ty69cYgpnKjOnSYHTXuB
	 u72AlRHulJ+XFi5QR5ya/znUH8NHqzFDZ739DT2Vs6rZCCPpUP6HGDti0XmScQmvkr
	 0z74l3rNyk5lroHdIPldtLHqoNILGk1n3tHt+wV09IvkeJrPU2DVFcSuQi8CGMbcJL
	 79Q/0DXTclNL/sBBNkiIdM4/QDSHbsh/0v5lbYfu3FT+pT0PZg+WyZQoo/5k1i1mO8
	 h0TjVAhbuNihHqdisYm9cGRIZUzUMAKcvKvXFqc9Hugeqx2KWAaVY6HhOxVft5cbDH
	 rCJgsHwUD+y9g==
Date: Tue, 12 May 2026 17:57:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <20260512-shudder-repressed-204473e32978@spud>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
 <20260511-crave-sworn-3b43371ce11a@spud>
 <agJSPkA88GcTYS86@inochi.infowork>
MIME-Version: 1.0
In-Reply-To: <agJSPkA88GcTYS86@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_095729_980512_E5DD641C 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: multipart/mixed; boundary="===============2824657786136744664=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2824657786136744664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TsyhsMpKyZFWvNGP"
Content-Disposition: inline


--TsyhsMpKyZFWvNGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 06:04:36AM +0800, Inochi Amaoto wrote:
> On Mon, May 11, 2026 at 05:01:01PM +0100, Conor Dooley wrote:
> > On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> > > The previous version of the binding change only add compatible
> > > string without adding the fallback compatible, this breaks
> > > backward compatibility. Add the needed fallback compatible to
> > > fix this.
> >=20
> > I don't understand how adding a specific comaptible affected backwards
> > compatibility. Did the dts originally use the snps compatible before the
> > device specific one was added?
> >=20
>=20
> Yes, the device is already in DTS, and since I find an quirk for
> it. A new compatible with fallback is necessary.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TsyhsMpKyZFWvNGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNb8QAKCRB4tDGHoIJi
0m2jAQCCqdHTz8+DIxjGnMEK5qAR/BRwBOVIK/8wBLWhokLAUQD/YpQVzxp7MkA/
PQAEfkisMNOAv29mXwapa7xQ+VTiUQw=
=LsvR
-----END PGP SIGNATURE-----

--TsyhsMpKyZFWvNGP--


--===============2824657786136744664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2824657786136744664==--

