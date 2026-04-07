Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F562FF5126
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=es2fWbUrj6OBLIdWSqGyQI13hH0h6zpRzyvTi7+J3yo=; b=C+HsJbHwt+FMdU/MuYOT1ncGbK
	GPEJqTOAQAY1HENpH3txaOuRBAblnTOFkW4v4/UzNax+MxLXui1f7u3I/m4b4oOTEuwDTm4QTcfUQ
	uKPlX61f3EC3fsbbRTdq95KxWWtYwB+ME+81wDItcnpdMbp8GcSxLB4uYst2g3xlMs38Ad0/Rzsu3
	g6azPPpZQxPuxxU+TFAGR4r30jpo4qYH35AUXfHRfY0weJZ3knYf3J2TeGLjNBOPf+TIW0S2d1sea
	HwRh5qHXs2eUjmQlUQTYjOVC9lczR4G5T+aAuiftQe2Hg1FYGfvbajcBbwH+EqLCJReY2gjDareYn
	BXj0csRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Kh-00000006nmZ-2qK6;
	Tue, 07 Apr 2026 16:31:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA9Kf-00000006nlq-41cu
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 16:31:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EE6E4429A;
	Tue,  7 Apr 2026 16:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC821C116C6;
	Tue,  7 Apr 2026 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775579477;
	bh=G2MiPboFG46RndYOGANWaYMGw9V2r1sIVseGNfWf7K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k431tsz3kY0MZ2I8gQAXrhxLGDcuwVqRCjo69LTQxtbKr4sp0EBiD3lmKe2yAorif
	 1UvUSvba3pfX9xf4McPDbK5Bnr0QFL0r7EumXNWtERJPbhYcMldZ91McbkugyqCmII
	 RD9uyMzGQHvxSsYZWUWQCQBSNSZhCNdotG4+TAJ5J5Fp7P+jgX1iZRAflFdJ39Fe42
	 jiRNDIzFRIsY289+kvB4vOdirbJ5m/wmp0exOasV8y4QqBakrLvfcLB48SeZeAjTFp
	 ALDGAPQIyu2MF+/0Aupe60NeayHQcLrqZ034iljzVmcqNSPKCpFGRhG8nrlTgevz/8
	 xG7VnKsCqg4/g==
Date: Tue, 7 Apr 2026 17:31:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Guodong Xu <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
Message-ID: <20260407-shine-distrust-0546884c2535@spud>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260406232655.144043-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_093118_015986_3F487F74 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: multipart/mixed; boundary="===============9194587339551136470=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9194587339551136470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kL4vNa0dNHftN6QI"
Content-Disposition: inline


--kL4vNa0dNHftN6QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026 at 07:26:55AM +0800, Inochi Amaoto wrote:
> Previous the CPU unit address cpu of sg2042 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>=20
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.

I don't think node names are abi anyway.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kL4vNa0dNHftN6QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUxTwAKCRB4tDGHoIJi
0mnXAP4p4InN8dLHh+QucYIvwi/E45p5xHJJmMUsXLdUAW647wD/Uclt3M0D4j9S
6kGsoO6Dy+s6jyv7qUmuspi85sTUPQk=
=hnz/
-----END PGP SIGNATURE-----

--kL4vNa0dNHftN6QI--


--===============9194587339551136470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9194587339551136470==--

