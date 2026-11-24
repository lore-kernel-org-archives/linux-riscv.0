Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2E606A686
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x2VGF741;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncKK1whx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ELrTPUl5XYU/5XqHHi+MusU2kWmAO8PS+zJevWXX8sk=; b=x2VGF741wbg9aufb1yKtp4WlEy
	vgjyVcteFlfLn6fuXvtWXkmebLmDkg+M94Hde4TO+hRrDLrSd2Z24T5u33t8GDy8wLeOxwJm+egjs
	FgCH5mKOCkTnifjQ7sEFKxprp6AR3ZfaUpCx9qmUICZ47X2bB5/4ifqNd9UD22iU0I2mtSAjqLPqq
	P+i1TUfz9W8RARrhIaUCGeJzeypbVoSyHed7Weo7tCjSQh8mj/YjrGM1wHfcPWSAIn1Un8ElXwYTO
	EwiFi7Y5bOOH4UR1WViBJJ8XK3oiPZoThltlPdgy1Ue8y3EWHV3HeMT/qAnuyhz/fSJD1+pDUD6PT
	suYVCdbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvkb-00000007Yho-2UcX;
	Tue, 24 Nov 2026 19:00:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvkZ-00000007YhS-1GXF;
	Tue, 24 Nov 2026 19:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD808442C4;
	Tue, 24 Nov 2026 19:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA771F000C4;
	Tue, 24 Nov 2026 19:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546818;
	bh=OfIXQRWoYznMpr75Y1t1EKHjE7dfreJB7BbbTEkR9WU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ncKK1whxIxltl9w3NrjL8l4PDTlrCE/FzSAxmSG7NSaUmYQuWeH6L8sIqoWaoNvrw
	 0/PeRp9VmjzBxclu9NKYtU+u3TYgQCHsL257kJ+cNY52LeOxS5SWVfKfP0WmIdoFVp
	 yASCbkBMPQqX5sAXqFJbm02JZFNTVe/3d1gLzMTO27O5CVmnblzubVOthX6sna3aPp
	 I+z99cPKoFG3wKJuOJ97BRWkLcmWMDKZV/jb9LgavqbrxZzgJNVi5uG1FDZ0eZxt2J
	 DdD+dIyU28gy++Kug8HSdUdHyu1wQVI9BUVUj4mRBFPJ1ysICP9aOag+8SjMkiMWkj
	 l1n8fJ1H4G3+w==
From: Brian Masney <masneyb@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 "Zhao, Linaro" <richard.zhao@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Amit Daniel Kachhap <amit.daniel@samsung.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Chander Kashyap <k.chander@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Drew Fustini <fustini@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>, Heiko Stuebner <heiko@sntech.de>, 
 imx@lists.linux.dev, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jsarha@ti.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Liam Beguin <lvb@xiphos.com>, Linaro Ltd <mturquette@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Lubomir Rintel <lkundrak@v3.sk>, Lukasz Luba <lukasz.luba@arm.com>, 
 Marian Mihailescu <mihailescu2m@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 Mike Looijmans <mike.looijmans@topic.nl>, Peng Fan <peng.fan@nxp.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Rosen Penev <rosenp@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sergej Sawazki <ce3a@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 00/10] clk: Assorted bug fixes across clock
 core and drivers
Message-Id: <179554678508.352639.3508427370180732943.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:59:45 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=Ag2AinISm4aFoF5s9EyCfBnaRyNhL06vGNk10A6iLlI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZ720tnJcTOVN5EVPBweUqLjvWLfm7rev3YcVz7FO6y
 hcuWLU7uKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/D/D8N9rsoXElmlecoVx
 h3xSf/5sSY/XeCnxXCfY81/BklWy+usZ/teydF76fdXpYmPdscuXihu2CR2aIzFx3erNj5okavd
 w7GUHAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ck9uIE1vbiwgMjMgTm92IDIwMjYgMTY6NDc6MzMgKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiBj
bGs6IEFzc29ydGVkIGJ1ZyBmaXhlcyBhY3Jvc3MgY2xvY2sgY29yZSBhbmQgZHJpdmVycwo+IAo+
IFRoZXNlIGlzc3VlcyB3ZXJlIHJlcG9ydGVkIGJ5IFNhc2hpa28uCj4gCj4gTm9uZSBvZiB0aGVz
ZSBjaGFuZ2VzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gcGh5c2ljYWwgaGFyZHdhcmUuCj4gCj4gQ2M6
ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiBD
YzogIlpoYW8sIExpbmFybyIgPHJpY2hhcmQuemhhb0BsaW5hcm8ub3JnPgo+IENjOiBBYmVsIFZl
c2EgPGFiZWx2ZXNhQGtlcm5lbC5vcmc+Cj4gQ2M6IEFsaW0gQWtodGFyIDxhbGltLmFraHRhckBz
YW1zdW5nLmNvbT4KPiBDYzogQW1pdCBEYW5pZWwgS2FjaGhhcCA8YW1pdC5kYW5pZWxAc2Ftc3Vu
Zy5jb20+Cj4gQ2M6IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3Jy
ZW50LmNvbT4KPiBDYzogQnJpYW4gTWFzbmV5IDxibWFzbmV5K2Nsa0ByZWRoYXQuY29tPgo+IENj
OiBDaGFuZGVyIEthc2h5YXAgPGsuY2hhbmRlckBzYW1zdW5nLmNvbT4KPiBDYzogQ2hhbndvbyBD
aG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+Cj4gQ2M6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+Cj4gQ2M6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IENj
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gQ2M6IEZyYW5jZXNjbyBEb2xj
aW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT4KPiBDYzogRnJhbmsgTGkgPEZyYW5r
LkxpQG54cC5jb20+Cj4gQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6
IGlteEBsaXN0cy5saW51eC5kZXYKPiBDYzogSmVyb21lIEJydW5ldCA8amJydW5ldCtjbGtAYmF5
bGlicmUuY29tPgo+IENjOiBKb2VsIFN0YW5sZXkgPGptc0Bvc3MudGVuc3RvcnJlbnQuY29tPgo+
IENjOiBKb25hdGhhbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgo+IENjOiBKeXJpIFNh
cmhhIDxqc2FyaGFAdGkuY29tPgo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+Cj4gQ2M6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiBDYzogTGlhbSBCZWd1aW4gPGx2YkB4aXBob3MuY29tPgo+IENjOiBMaW5h
cm8gTHRkIDxtdHVycXVldHRlQGxpbmFyby5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdl
ci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZwo+IENjOiBMdWJv
bWlyIFJpbnRlbCA8bGt1bmRyYWtAdjMuc2s+Cj4gQ2M6IEx1a2FzeiBMdWJhIDxsdWthc3oubHVi
YUBhcm0uY29tPgo+IENjOiBNYXJpYW4gTWloYWlsZXNjdSA8bWloYWlsZXNjdTJtQGdtYWlsLmNv
bT4KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtYXhpbWUuY29xdWVsaW5Ac3QuY29tPgo+IENjOiBN
aWtlIExvb2lqbWFucyA8bWlrZS5sb29pam1hbnNAdG9waWMubmw+Cj4gQ2M6IFBlbmcgRmFuIDxw
ZW5nLmZhbkBueHAuY29tPgo+IENjOiBQZW5ncGVuZyBIb3UgPHBlbmdwZW5nQGlzY2FzLmFjLmNu
Pgo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+
IENjOiBQZXRlciBHcmlmZmluIDxwZXRlci5ncmlmZmluQGxpbmFyby5vcmc+Cj4gQ2M6IFByYXNo
YW50IEdhaWt3YWQgPHBnYWlrd2FkQG52aWRpYS5jb20+Cj4gQ2M6IFJvc2VuIFBlbmV2IDxyb3Nl
bnBAZ21haWwuY29tPgo+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
Cj4gQ2M6IFNlcmdlaiBTYXdhemtpIDxjZTNhQGdteC5kZT4KPiBDYzogU2hhd24gR3VvIDxzaGF3
bmd1b0BrZXJuZWwub3JnPgo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4g
Q2M6IFN5bHdlc3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNvbT4KPiBDYzogVGhp
ZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBBYnJh
aGFtIDx0aG9tYXMuYWJAc2Ftc3VuZy5jb20+Cj4gQ2M6IFRvbWFzeiBGaWdhIDx0LmZpZ2FAc2Ft
c3VuZy5jb20+Cj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClswMi8xMF0gY2xrOiBsbWsw
NDgzMjogVmFsaWRhdGUgY2hpbGQgcmVnIGluZGV4IGluIGxtazA0ODMyX3Byb2JlKCkKICAgICAg
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nsay9saW51eC9jLzUwM2ZlMzJlNDZiNQpbMDMvMTBd
IGNsazogdGVncmE6IGJwbXA6IEJvdW5kIG51bV9wYXJlbnRzIGJ5IE1SUV9DTEtfTUFYX1BBUkVO
VFMKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nsay9saW51eC9jLzg3NWU2MjQxNjE0
NQpbMDQvMTBdIGNsazogY29tcG9zaXRlOiBJbml0aWFsaXNlIHN1Yi1odyBwb2ludGVycyBpbiBk
ZXRlcm1pbmVfcmF0ZSgpCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jbGsvbGludXgv
Yy9lZmE3NjAzMDM2YjgKWzA2LzEwXSBjbGs6IGdwaW86IFJlamVjdCBnYXRlIGNsb2NrcyB3aXRo
IG11bHRpcGxlIHBhcmVudHMKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nsay9saW51
eC9jL2FjN2ZiMWU4ZmZlYQpbMDkvMTBdIGNsazogY2RjZTkyNTogVXNlIGRldm1fb2ZfY2xrX2Fk
ZF9od19wcm92aWRlcigpIHRvIGF2b2lkIFVBRiBvbiB1bmJpbmQKICAgICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2Nsay9saW51eC9jL2IwYzIyYTQ5NjY2MApbMTAvMTBdIGNsazogbW1wOiBh
dWRpbzogVXNlIGRldm1fb2ZfY2xrX2FkZF9od19wcm92aWRlcigpIHRvIHByZXZlbnQgVUFGCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jbGsvbGludXgvYy84YjAxYmRiY2Q2YWUKCkJl
c3QgcmVnYXJkcywKLS0gCkJyaWFuIE1hc25leSA8bWFzbmV5YkBrZXJuZWwub3JnPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
