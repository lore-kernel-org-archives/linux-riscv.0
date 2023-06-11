Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F71C77B7A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ru1FJhihDuxLfPwGZXQe15D/zcy6MaGPcmkgrNDn9U=; b=Y0e7l3JX4c13mZYNNCGKmlHa6N
	LauQf20yT9GmYDxKR7hOMVKCEI3kktDzJWmCPDoPih6Qyweq6pkDircXWdEz7lZZk060fnxYteDg0
	7rxNJCtu7C0fRPP7G89IZFLrEcm7AEjsnBZcBaP/Nyo7cgxkTRAvpEIsJhT7M9rj+n15/8xsAfgQd
	Z2Oe3ziyq959mdk3WlCGzqUr3QTyM5TJlIM8M0L2OXDyd65sbC7xF5a2uJwXLsVG11D3zHaCSaYuj
	R/hGs7/iy5AlaZ0vsV2PWX0qVKxRdAYTvFSKbTBFfc9yiWPzd7mFJeViQqYQvFSTkPK+aycc2/gB9
	4ZF/wNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ICv-000XhB-2B;
	Sun, 11 Jun 2023 10:22:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ICq-000Xg1-0e;
	Sun, 11 Jun 2023 10:21:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5977E60C90;
	Sun, 11 Jun 2023 10:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E8C433EF;
	Sun, 11 Jun 2023 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686478914;
	bh=eDy1DNnFmuqct2VM5FZyW/QF4ZpT++8h8SfJtyuKwWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crix+RAzPczBIvCUNOTOtGmr51kjEkLyMRIif2FGs/Wj63GML/XRx8wbbffMRURWj
	 Xdj8FDVuZxtQi5SZgQ4vtvL4njVRIriONzPtWlwVniFzlpAfLDlw8ArZ83VRG7Hfmj
	 c2poavuA7dKGhcxMmppwXl8AYbL6sGbBGKXiqoTZXhnSC+tL9xqXM1EC9xt554hqWJ
	 Gehbnw3u0PM/xsWc5CYFADJe+UYKvI1x2ce4lGeN7kmEakEi4J/0iB8676wn8zWHRq
	 d8sTF0VYbFCkiWl4nzsSn2ziMGTjfndy4eeLoJ58iTrJG1nwtMdchrj+epLrgdC/62
	 m08HeCfqu0nfQ==
Date: Sun, 11 Jun 2023 11:21:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Message-ID: <20230611-lilly-lilly-fba1c6fe8c5d@spud>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
 <20230610204225.1133473-2-bigunclemax@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230610204225.1133473-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_032156_303997_ECC02A8A 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: multipart/mixed; boundary="===============3246880720831447748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3246880720831447748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pp3DI5TDdJDuqtL4"
Content-Disposition: inline


--pp3DI5TDdJDuqtL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2023 at 11:42:18PM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> Add a binding for D1/T113s thermal sensor controller.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

Since the calibration stuff now makes sense to me (and thanks for that),
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--pp3DI5TDdJDuqtL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIWgOwAKCRB4tDGHoIJi
0udzAQDzhi9sIZfLH+m04LetoCOBs1Pmxigngt06hVp/ljyoNAD/abfWCWC5ETGg
5j257iZ4rNVAc0LpMOZfitAsJZ3c3Q8=
=bfL2
-----END PGP SIGNATURE-----

--pp3DI5TDdJDuqtL4--


--===============3246880720831447748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3246880720831447748==--

