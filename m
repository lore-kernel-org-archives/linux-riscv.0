Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C17CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ej9eKToShemPiCq6J1/nubYhIji8nW5e2Ga6v2PFRBI=; b=ACKyZAhEUCQQRkp3vjEu1CLGAK
	Q5dkmMcHyRQ2fOEdBHpmUEYGdt/MUr+xdqpO9C4sCuGLYcyR12Ct60YUkyisKaVafE69TTOgYR7CH
	yuaep/Ci92rsPpXp0fO48gV7ELNt19b+taY5UGsHm63J6sweDzf7KgHEbUQV7GYiLdL/Owx+K9BDs
	OztNw1ty3VYtTPKC5QqyIen9wuoEpSyBf/+quNc7omGdbQ3ILp3laOWTVSADVj2My5Cx16trZHOy9
	cFrIxDnIAjy+ptnnDNWv2dHQ476BFaKZRgePONa2VpxTu44iTnDhE5b0u0S9eEPnXEqkL5DOA17Tw
	SSg3O2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFrM-0000000EefJ-3r8K;
	Wed, 13 Aug 2025 18:06:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEqU-0000000EVB2-235e
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 17:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7C155C6DFB;
	Wed, 13 Aug 2025 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72301C4CEEF;
	Wed, 13 Aug 2025 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755104461;
	bh=hPgVOTOzVezoA5w3n5VtqQYo2mxCUXrIIYMmOg4FXV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMas8frntNXMrlTT99REIn0+lRenQk6+eTBfytsfAAY80CZSbPag8bJKBuyCTgldc
	 Q1N8eY4ndQ2hQ5GzTkCDGruW8ajBO4TRHU9qMN1BliATenKBTYM+kGxuBOo5ZyTa1X
	 VllOqWMpxzdgTBwuuVV3ijYARoxWHiuaIMLxQHHG2H7XcQoKYL9OugfZLKbCF9qast
	 Dsfu3ss55MUvIqhEiDZSz4ShdxnA8bKfSyNGbEACqOU7QHk+3FOY2MIRg0m94kHq5I
	 /yvtl7yAOdVwgivDRIpLD4RDP8kXamkAtyzX9IlXSPQvPmycoPz2f+ZtSCWsK84VoQ
	 H/qFCQ91dCzWA==
Date: Wed, 13 Aug 2025 18:00:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: reset: thead,th1520-reset: add more
 VOSYS resets
Message-ID: <20250813-upstage-identify-683582a03f7e@spud>
References: <20250813081716.2181843-1-uwu@icenowy.me>
 <20250813081716.2181843-2-uwu@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <20250813081716.2181843-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100102_566136_365FDF5C 
X-CRM114-Status: UNSURE (   9.24  )
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
Content-Type: multipart/mixed; boundary="===============8999723903571695116=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8999723903571695116==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLx+xFUkqdnSsKIv"
Content-Disposition: inline


--zLx+xFUkqdnSsKIv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 04:17:15PM +0800, Icenowy Zheng wrote:
> VOSYS contains more resets for a display pipeline, includes ones for the
> display controller (called DPU in the manual), the HDMI controller and 2
> MIPI DSI controllers.
>=20
> Allocate IDs for these resets in the dt binding header file.
>=20
> Now all peripheral related VOSYS reset controls are here, only the bus
> matrix / IOPMP ones are missing, which shouldn't be messed with.
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zLx+xFUkqdnSsKIv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJzEyAAKCRB4tDGHoIJi
0gxpAP0YBFmEYd0HAqrdEYHu+BQ+mClU/GfxdUwkKpFg61rWXAEAmjNCfBLWG/dz
s0ZdN1Q34+01iYJuldDj2Vwt5ry8MgE=
=VRmL
-----END PGP SIGNATURE-----

--zLx+xFUkqdnSsKIv--


--===============8999723903571695116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8999723903571695116==--

