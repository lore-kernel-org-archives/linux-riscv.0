Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6887CD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GLlDgIohTZpwbZHbr5+JAElgDdtUNAq+AP57c1Uvvs=; b=Ytgq0GIJoS+W5wQJ2uzyn350l1
	AUSNm+jB2cXXHOwoIPp93sYrd6k0nUqyxAowScHwrp7eD+ACZ4QZigZRlEGgWuelEP72kalYo8ceG
	IdKjjt+TAjseHEwAlSZpY67KMr2Kl8Guernb5U15VBPeZy+PY2XQ07RCgm55pN8t5cszmyBaGDppo
	EywGVv9ubh0w5UGL6IBheV46oiu4ccvO5Rewifj5s0rFDiM4UgBi45ZnNi5FC2m9Cl5HToYSb9+xS
	fV/ArESyPi6J1HfXqAXS9onpNP6xkt6pDzweg9u+UwO7EmQOfavfqmNi2aMAzgJj6F/hkucDsBl2o
	CqkkxMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2UQ-00000004UCs-36hf;
	Thu, 07 May 2026 17:26:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2UO-00000004UBs-3Vws;
	Thu, 07 May 2026 17:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D95E418BD;
	Thu,  7 May 2026 17:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEB6C2BCB2;
	Thu,  7 May 2026 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174780;
	bh=CxvcpXiBTI6/kR/4dGt5iKAcJgtLGpTZNAw6IIDOULc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnVTMWfu3FPehm3F1/CX0IgK4P0BjumaGCE3NVe8In1lyxz22/zos6fAqhl4BAJM0
	 jHlmt5whs4S1P4IWTALrAgMn1rBrXGgtHY+rU6BQMcy9un0imsTYecrzf9dAnjPo29
	 wwFW2SG/NsF1cJY5gsye1rVOLYcrg27JTmLsHRyZ4AIVDXcs2+k93e15eGEqQFGxiE
	 Aq/7BkB9sKzOv9svHe4NAg27LAt8748GqNYEVinIRxhQi+NFat3WWGpDu3kQqRWqDP
	 ChnY/0mdOVmsMMWt3QkCWP4CJfEvQDpgw5H9GhkYLgd5gV+Bm6ivwkQv123NuUg3wh
	 lzlqM5M7ZmKRw==
Date: Thu, 7 May 2026 18:26:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 04/12] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <20260507-that-creation-b6e7d297f924@spud>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-5-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260507081710.4090814-5-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_102620_893129_ED922EC8 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: Drew Fustini <fustini@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>, linux-gpio@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============8573200806876895980=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8573200806876895980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zJEybQaft2oIsmIm"
Content-Disposition: inline


--zJEybQaft2oIsmIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2026 at 04:17:02PM +0800, Icenowy Zheng wrote:
> The TH1520 SoC features a Synopsys USB 3.0 FemtoPHY with some custom
> glue logic configuring PHY parameters.
>=20
> Add a binding for it.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--zJEybQaft2oIsmIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzLNAAKCRB4tDGHoIJi
0pFNAP4piyDsMp91OML/qoSMafgNp3vZmLDMs4hb57FWbv+ARwD7BwJiTYBqEgwL
O4OyVRx7Y7tC6EIkADbPYmok4xSUOgQ=
=Nper
-----END PGP SIGNATURE-----

--zJEybQaft2oIsmIm--


--===============8573200806876895980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8573200806876895980==--

