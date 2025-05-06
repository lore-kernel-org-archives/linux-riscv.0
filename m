Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F82C3ABBE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 20:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9l5EpdsTNAPg4VE6ShAiZu9lXTQpNM+zFtFhlIJvW8=; b=ut37rxMUpaJ1sKL4u5eFE6ZmPZ
	D3yZW/L1fp1KTSlqJQZWlY+qZl9rhW3MTnUMKADdJRAV5VGRj3utjKztj5v0c7sDNSF3dl4VgJw/c
	6zdaVRMMRwCUQx4cjpkUUigXloxkBVR6BaVVTKvo6I6LAS7UVlJVnX9rfdCzxNqtT2Lam+qN06uKI
	DGcNzMTNu1hbpblvMaHcwARhs9VKcnoKGF8XwZWrkt9xd1pHx1lH5oCeFNoyUOJhkEuQ3zkqNv2QC
	xhRZQp8OFsCCbs/nwWP9NOb39vAkdv/PWwkflns/lfiUozVwDOJqlB3K5ozU9g8JbejR8BtYzEZiz
	G0+1onIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOf9-0000000DL0k-04V6;
	Tue, 06 May 2025 20:13:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL5z-0000000Cf34-38Yi
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 16:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00984A4D6A1;
	Tue,  6 May 2025 16:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E5DC4CEE4;
	Tue,  6 May 2025 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548678;
	bh=6+AzYXO0+ZpuHKJPEjy4CD2Mhi6+e9atkIbMEDc7uPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxV3Vry2aNCG/2NFKmWiKWDWiA8hz7CA/FrBuvTyTK47Qkk0Sc3JfTba6MswVoTkc
	 fPGfD+kCi3ywCx/sEVKzCCRW4Bg/hikHoEZ2A1mDWIsW5O1555t6y/PFhas9ptd9/e
	 87Okr2xqzFKzczpU105GCgilbleGfvTGUxyBAfo96MifiGk5nQx7ml8qphHdzewWjq
	 1biE73DYbbC52Cr5v5PO4y7hnjE4swcj703c5NwYVnJ5NRghatc6CC7YC/+LH66W1R
	 2d9do0ma+M10fKBG1Wkd86hzGNuSN80uBb7tht0jTw27GDZ8Q0rr4+hJzwgWcx2TRA
	 AH6kPqYKje67w==
Date: Tue, 6 May 2025 17:24:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250506-vocation-herbs-a2c84688ce03@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-5-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250503151829.605006-5-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092439_852121_7A86C3C5 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: multipart/mixed; boundary="===============2726605072130152026=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2726605072130152026==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0bdWrlMUgMOcOWqv"
Content-Disposition: inline


--0bdWrlMUgMOcOWqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:24PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
>=20
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0bdWrlMUgMOcOWqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3wQAKCRB4tDGHoIJi
0o8zAP92lbwWkHAN8n5L5vt7gwGbaVT5MfKv0s0yWfVwM3ObhwEApTIMtPUnOpOJ
IatmZoOtytwSw9dPTa/GXpGpJ02+CA4=
=JFu/
-----END PGP SIGNATURE-----

--0bdWrlMUgMOcOWqv--


--===============2726605072130152026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2726605072130152026==--

