Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D565D3F09D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZRj0fW0ytJ22QqVOHBZ2IZuU2oTkaFztWvw++FVSRA=; b=0HATxYoBBrLqi1xNX+3aCm3xFK
	9kv25+n+2X5b7PvbG69WdI0vTfZigE//ykfNRn1s1LvEbcG7UmrBDeycZbB9Xtb6Nc0BChJy2BXrW
	8TNYp83VfqhidQORZS+Wex7gKGbNngtpL37k+hLsvlL2LHgCO7QkzCmN9Dkbq5/xEqGqxno8zeMBL
	8KpB6d692hzKhOMm4Hm7s3pNQY1t0h42c1AOXRVLCM7oMs4KgtHPlrOcxqc0HpbU/LpP1x08du8UM
	dzYpdZmj9m3x+Eoc4jb0pOWXg6Q1w0WlHFx1tjVynmwPxKEXJqVOPvJToA73JcRPzfdtkq0JIM/Aa
	42SogqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVEf-00000000N7M-251S;
	Thu, 29 Jan 2026 16:51:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVEa-00000000N71-0JEr
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 16:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31943436AE;
	Thu, 29 Jan 2026 16:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5059C4CEF7;
	Thu, 29 Jan 2026 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705467;
	bh=fbtBH+MvGc4iLl2bUnG0eRJZOrVwYYmBhQhGVyL1U0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRDUNJsQTs/r84+i6XwiQNxAWY1M9JyyXTIOEM/EIDfewK7fYBJC15dkY0W9pSi+n
	 yVzfIROkDrw8bD35G+gi9zZRg/prGxl4UV4QcRAVcmahG5Na5uOPPTv2HepQ5xiUsE
	 q4BLnRtEGdSNamGgwNLhxlCm4jy4Yvu5wtXy+top8Y9JSxuMwnVsNXQ7jbdb7Iblwi
	 cRgSyT1RoCCepxnc9H3InsleEOBGWpEvd1ymy2aqy6gnmUJaX38/G9PBaA5uTTpbNf
	 CnBCrGoXyl3rfeVsn+NhK9S7inG8T43fLnVIlr1D4+k2lfp7FsonuBsdMQWZeyMgzJ
	 JXAc+4xTTnLNw==
Date: Thu, 29 Jan 2026 16:50:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <20260129-riveter-mute-bd981d46d58f@spud>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
 <aXpwED5wSZbnIjae@x1>
 <20260128-smokeless-angular-cff7e16ff8dc@spud>
 <aXp2jfkpQVZ94rjU@x1>
MIME-Version: 1.0
In-Reply-To: <aXp2jfkpQVZ94rjU@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_085111_714869_F2D753BA 
X-CRM114-Status: UNSURE (   7.25  )
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============7329001476231508482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7329001476231508482==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JXm6OImfRPbt1yHG"
Content-Disposition: inline


--JXm6OImfRPbt1yHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 12:50:21PM -0800, Drew Fustini wrote:

> Are you saying it is okay to leave the dts patches in thead-dt-for-next
> even though that means next will have W=1 dtbs_check warning about
> undocumented compatible?


fwiw, I was chatting to Drew on IRC last night after this mail so didn't
reply here.

--JXm6OImfRPbt1yHG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuP8wAKCRB4tDGHoIJi
0vQ7AQCq6j5Mv5P+Lb/4p+HlTgaqjfjZK2j9YyzRsly3mjhoVgD9GnMrkrvTWTTi
Ue7dqQ8duWlQu2bLnDaBD4U8Dy7FXwk=
=1tmr
-----END PGP SIGNATURE-----

--JXm6OImfRPbt1yHG--


--===============7329001476231508482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7329001476231508482==--

