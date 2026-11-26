Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B92606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=43c1VV5A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nx1Y6HzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tS13bF8Gt08sapzAbBQZJfIy4BhyQ5VZEARNtPBsGTs=; b=43c1VV5Aw7wdm0vNapprGZ4PWu
	4caivTdkQDo8GLkHSBfhpZqlCANnTT/IFqhkS72fAy+KF8Jqb5RiJu9xR3GNTskbrajA8u1VZBgdb
	ftOMn4waA4Hg5rxvsxcqEndBz2dd/4l8PXCp/jNChDqQkf0Aoa9jkebGTytLkvQIY3cRi0mLJTQEc
	HNL2fVF754+M5riYiKpq3HYWID4Lunumhqidja/El3NoyJ9FZNZsXuxkUdK6tqPrKpeWm1N/vFVN5
	onfheKebYvKImTXYYgXxnxl/OHpEuiD/bAdehmQqG3DSGx2W6Owj4q5a+tSlEC9pFLqX+pWf9JAZB
	z7LxdtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTgm-0000000CGs9-3chF;
	Thu, 26 Nov 2026 07:14:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTgk-0000000CGrL-3ECI;
	Thu, 26 Nov 2026 07:14:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF71B6132D;
	Thu, 26 Nov 2026 07:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9EA1F000C6;
	Thu, 26 Nov 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677277;
	bh=53x66dpOysE700lhiF+v1Ti3qORDyr+UbN9kd+D3Gh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Nx1Y6HzP6YmxBYDOcJWxCaz8aslRqwn3YbimRiB0dOW5tsFZkgAZVhYAcMt2cMY94
	 fw6Fk8Qiks7viNmu2NwepgpOnIYubHvDpVIfkf+TC+bqZivNzTGzKK+wCa6wsn0HyG
	 2Oel27nbR9E/ubhu4qWAzXiN1a58IKzKUDckNABhBiuA9AuE2qgl94pDmZDO9yXCp+
	 YfXaTY+SlRPmHvH8pbXP16/zWWPDHi7JOAoklCdn7eID6wnrE+1km+JUcikjgf/ckp
	 gJeIHXNKmFxlsyKZTk/AFmcg6c5xew7eMf206ku52vksInSAl6J+C70lkMbJH/Kmva
	 /vqGUNvj2PvPA==
From: Krzysztof Kozlowski <krzk@kernel.org>
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
 Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>
In-Reply-To: <20261123164834.3330320-1-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 00/10] clk: Assorted bug fixes across clock
 core and drivers
Message-Id: <179567727106.9086.4007919152692495322.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:14:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
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
c3VuZy5jb20+Cj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClswNy8xMF0gY2xrOiBzYW1z
dW5nOiBleHlub3M1NDIwOiBUZXJtaW5hdGUgUExMIHJhdGUgdGFibGVzIHdpdGggc2VudGluZWxz
CiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4L2MvMTZlZmM1ZjViMzk2
Mzc3OWRkOWFhNzE0ZmRjYjU1YTZiZDg0NjlkNQoKQmVzdCByZWdhcmRzLAotLSAKS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
