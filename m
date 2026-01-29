Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564AAD73E87
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOmWV0Vk4N+EsL9PaCyjVpe5efnKwKsisL8Wa6GMUsw=; b=LIH233tyD+uQPJCrYS61uug6DE
	a312lf1mdogJ7J1O7DGtkd3tFKQ9yiwBDESm213/r35uNoqCqnRUkCAECpHKf8Tqjv4SPrwhd6YFX
	5Xj8D0YaWkZwdYC0BLsh5+zeRYJ4NlcbMPQJM7vPqytzNAIyZUXZcfu4nQn23OLyz2zdCfdPkbGpc
	AqD0/8cTy+YUGguAWFbfw27E3tpDvsPSzkRDMSTD/1VY6+uj1KVN1ikIj5TRCa5zbE4rvqgw4zQfP
	ejCsWtIL+DWGyHuNkAJXoNTkaVYeKnqf9LydM5vSnmNk1BuWTqFbfXbObM70AFJRCwHGdys1e57B0
	oxkMY7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYsU-00000000dHI-2ikw;
	Thu, 29 Jan 2026 20:44:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYsS-00000000dGj-3zU9
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 20:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47E3843904;
	Thu, 29 Jan 2026 20:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7883C4CEF7;
	Thu, 29 Jan 2026 20:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769719472;
	bh=GdsVRlXM1k21xELKCI7V+gXC1aV8IjxKYFA9ELYBG0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf/NQ5R6LhBdJyC4Tj+pWrF0EgpeZDK7GQ1YIe23OiJeRbPFOawP2hDi8e1uUB2B0
	 tZqhuGu8mmp3Uw9UGD5rsQirNya+CFAiowoEf4WEDHhFMtSJY9rBE7maTlCwVHQJKN
	 8K25/UjlnDU3w9wZD2F79qC+oj6W0Rw1JhD+mdcti23J6WwI/C4zlUG8RezLwSE7b+
	 /aFVnIsSONqAx9Zt8Re91XjwxPXXLUiKwYlW0QbwxK/LWGfIC1jHnzSH+PrAfZLEpx
	 hdNPDK3Nd1mGKjTAKVFfqCjpiYBzj1jtvhv7GO1IFzuk01o7EJ21dFrPfCy5K+dl5T
	 NSnIMnCEcQXjg==
Date: Thu, 29 Jan 2026 12:44:30 -0800
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <aXvGrqEs7b2e8zy4@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
 <aXpwED5wSZbnIjae@x1>
 <20260128-smokeless-angular-cff7e16ff8dc@spud>
 <aXp2jfkpQVZ94rjU@x1>
 <20260129-riveter-mute-bd981d46d58f@spud>
MIME-Version: 1.0
In-Reply-To: <20260129-riveter-mute-bd981d46d58f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_124433_010283_8224F194 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Type: multipart/mixed; boundary="===============0141624697685127293=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0141624697685127293==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FwYy0f0XsLkZYND0"
Content-Disposition: inline


--FwYy0f0XsLkZYND0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 04:50:59PM +0000, Conor Dooley wrote:
> On Wed, Jan 28, 2026 at 12:50:21PM -0800, Drew Fustini wrote:
>=20
> > Are you saying it is okay to leave the dts patches in thead-dt-for-next
> > even though that means next will have W=3D1 dtbs_check warning about
> > undocumented compatible?
>=20
>=20
> fwiw, I was chatting to Drew on IRC last night after this mail so didn't
> reply here.

Thanks for your guidance, Conor! I will wait for Thomas to confirm
regarding the yaml and driver patches before I create a pull request
for the 2 dts patches.

Drew

--FwYy0f0XsLkZYND0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaXvGZQAKCRDb7CzD2Six
DFrnAQDs/4vRK87uN9IOfqxG2KDOzqlXmIEHF9u+1nkktHTUqgEA/5WiVfJCKVCR
dEkdBRJBP1OexTklm9WUzCVeXs5pxA4=
=nJEw
-----END PGP SIGNATURE-----

--FwYy0f0XsLkZYND0--


--===============0141624697685127293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0141624697685127293==--

