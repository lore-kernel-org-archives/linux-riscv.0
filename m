Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB073C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 12:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIT4m53P4dpmqKhK3wjsL9zh8GYn+6/SoOU+IpnT8us=; b=JFgDnA1kKJWxAWfoPd5gqb6V0u
	//dnOEyqB0t5ydiYilb80C8N45fw0DeXlGdAZdVzcRcRgnbveXkwmjZ8E+tVvIjPQ5nv59ryeC74F
	wJkSwgi140ZjH+fNgW2SGXqB3tOgEHdMB64Go6h9Zgrg7PaK9iX6c7DbHa1+pJvq4+9W8AIn/+aXp
	Ueo8zFIXFZitUoYxWMtm5uMHrwRKZjNlKOkWuPAfYixQr+gIDgIrI8Avz39cM+2n8iVFOCz87JUkW
	gH32TdRPzwAIvO3DKNTyKBhycYq/F1AgpWzRN5vQwXJGEVsi9UVmeWa84AOrmwqu7BxTTHIwucqYl
	2++dXmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEq7-0081bD-1y;
	Sun, 27 Aug 2023 12:25:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaEq4-0081aX-1a;
	Sun, 27 Aug 2023 12:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 592B6611A9;
	Sun, 27 Aug 2023 12:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03124C433C8;
	Sun, 27 Aug 2023 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693139154;
	bh=jvTptT0rkJ9XzewXN+Ilc6vx+jgmt3KNLGijCVtCL5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvnT0kXiTyaIeD95H55YeT7Yv3yzR/hf7mOgX0yqLMkuFSMiL6LJgCzJX5Wf5RZMH
	 OIYBXU+BYC0Khqeaun68JFwqpiFHvy6OXesHy9T7GlJ4dedbmmfYNLXkx1dxJxlTP1
	 1lL4FTP6KUp9ew6Bsko7LXVDBNIbVBxiRevxguaLNkppPTKwWfg8PUT9LHCvyUfH0+
	 TYiJxUqHGCbe32Dd4ofKN2k1Dx30DCiOx9YmU3w9s0VvlsHfsPSHvrIQLLUCkG2u2M
	 tIUJ91CX71VC0SU1L3CbZl8ibelQ0ZJKt17JOBwu6047taxjbZ5z5uUItlqVAH+1at
	 YOtybIUwFGYbQ==
Date: Sun, 27 Aug 2023 13:25:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>,
	Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>,
	Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add PMU event node
Message-ID: <20230827-frighten-casket-561437347911@spud>
References: <IA1PR20MB49531D5F6612A5FFED734754BBE1A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49531D5F6612A5FFED734754BBE1A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_052556_575297_0A7CB2ED 
X-CRM114-Status: GOOD (  14.42  )
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
Content-Type: multipart/mixed; boundary="===============3394796245532787644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3394796245532787644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9O421g421KqLv44b"
Content-Disposition: inline


--9O421g421KqLv44b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 27, 2023 at 02:45:01PM +0800, Inochi Amaoto wrote:
> D1 has several pmu events supported by opensbi.
> These events can be used by perf for profiling.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Link: https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> ---
> changed from v2:
> 1. move pmu node from /soc to / to avoid warnings when cheching.
>=20
> The meaning of T-HEAD events can be found in this pending patch:
> https://lore.kernel.org/linux-perf-users/IA1PR20MB4953DD82D0116EC291C2177=
7BBE2A@IA1PR20MB4953.namprd20.prod.outlook.com
>=20
> The patch above also provides a example that shows how to setup
> environment and use perf with T-HEAD events.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--9O421g421KqLv44b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOtAzAAKCRB4tDGHoIJi
0j5BAP91rXPhdIdPwVcemV7Mclmbtusox4Z+awvYVVbHlFkLQgD+OfL9j8jiRM53
NprniGrPxfyWibOeShToODprEvZfAAM=
=0gzT
-----END PGP SIGNATURE-----

--9O421g421KqLv44b--


--===============3394796245532787644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3394796245532787644==--

