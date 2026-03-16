Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFBF506DA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJvZWVGpkU5H60RXyfiF106/qf/Fkfq/EUb2bEGWHvo=; b=2AxFt9drDS22DCGwFHMK+w0396
	PQwvTuyVKYMql79Fn+vcXeX8cKtRr5ynh5xzpkuQQ7U2g0uLosTAYOdpvUu46sH3XWfGZ28ZlU82F
	rAGVRqBy1+T279PTBjeNR+nHE+n3cfwgr3gudrC6Sw5qobg6olduylqBBVOgYFq0TfSAzIE+VTk5v
	X+5aybTo0U0H3tO7FPKEZHY3lrb3a+HuiUNHqr+ORqDW64lTiTgtvednoST8HNLOkL3b1a2o1x25X
	te0FzcT1oB3F7swVDc1KOdYmUkMctOOtdd21nY3lb5eb5tvgVJwDHexKXLKgx/+meYCXPHX2/9pwM
	VrvObymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w291c-00000004Byv-3fVc;
	Mon, 16 Mar 2026 14:34:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w291b-00000004ByZ-0tRy
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38DD240457;
	Mon, 16 Mar 2026 14:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F9CC2BC87;
	Mon, 16 Mar 2026 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671670;
	bh=PeJNgY4coc1jftz+tWfZK5DVqDvKvneWw1iXK8IlmxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEFUaIIUFXXLHmJ2tE/wnSEeQ+6mBZ4TDvzR6sGV6Mm2N/W2IMdQgC5VMvuYQYml0
	 s7OGxtpO3kODthcxxNCV6uoHT63+iB/bfx5lqS7HuB2jgaI1IFGB8v8+msqMcIy7oQ
	 cu5yGAMPb58czWbYsAEBdWHgM14yEeVmlsVtB0MbJzYJMff7rlEFhpgpFlW2uox76x
	 R6rKptaaQ5LEHZQDzvrFY4+12tnLARwRKVLo2ZDYhLje3wpUagtrl28lusXDS2z1GX
	 R2UMXxJhdZCNdmuzWVGYCjyepUOgHEpi/y1cIhP+mUyUq30qd3bTQtJ8tpgJtKFBb+
	 LHETa75Md0cBQ==
Date: Mon, 16 Mar 2026 14:34:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260316-trusting-moving-1a37dbb94242@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_073431_311538_272FACCD 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rahul Tanwar <rtanwar@maxlinear.com>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============5221518320063535222=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5221518320063535222==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/bIZjy/TXeMd0h4B"
Content-Disposition: inline


--/bIZjy/TXeMd0h4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
>=20
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/bIZjy/TXeMd0h4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabgU7AAKCRB4tDGHoIJi
0homAQDkf1eqMgJ/+IbCqDYOM+BEbR1o59LkqXqdiYt9YWbZ/wEArBuFNE3IjZ13
2aCGEYb1dnAW5jxk1LeIbmR5q17WCQ8=
=LVWl
-----END PGP SIGNATURE-----

--/bIZjy/TXeMd0h4B--


--===============5221518320063535222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5221518320063535222==--

