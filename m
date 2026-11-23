Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38A606A6A4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VF0Ihu8X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDF5ZjcJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KAC4uRXzyO0LtczN/9u6BDyZufnE5lqfTCfNC7mVlPM=; b=VF0Ihu8XyOf0J/hyxejKCVedVA
	rQHd/XzP23SqJ00PpLOjtqdFZPO6teZp7cqvyiNql99VULvueY9qBgUUYIYhms9hbGlqGPnvi8YA/
	EHs3Xvj+mhh+XOiuwKcj61wbDfH9krXDq088vSJzc/RuHBBR/MryrMF0qLlWj5xvgbSiE8RmXNGoF
	odI2MRRq/jojXW+j5JNZoDXlZBjp0Y/Fgubs4wSUE0bxYc8PMJ2wqyKs7hzfVpYEiFBDq9bIZTgkP
	/O0Snmz++kLuEWVYd624XceoQRG5coFvuANCcDed3xM+vH41Yz0zji88wnZvV5uCa1vzr8LnJQDaY
	UBmcJCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXDl-00000004FGU-04pe;
	Mon, 23 Nov 2026 16:48:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXDi-00000004FFz-2WF3;
	Mon, 23 Nov 2026 16:48:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EA016112D;
	Mon, 23 Nov 2026 16:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BEA1F000CF;
	Mon, 23 Nov 2026 16:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452524;
	bh=msw4FIKrAUyInphRYrqr8Ra5cv1R+7cgbS2Ass40zs0=;
	h=From:To:Cc:Subject:Date;
	b=FDF5ZjcJciDoEpkil1kpfCRri+Jge5eOMAixKUEN0r6++t8yVnG6E1DCNhHu5gYgB
	 S22zyhbQ5N7Uy8+2qGcKoaS2aHnbKKLSk8Wo6cdmfkRhGUc04L+BmIKpToi5ul/RIZ
	 BmItkIWXUGcu8LLQ1aJfSizqqFlgNLmcQaoXcfZ5/YSg1cf3HT7mRNVm+SxlksuMK0
	 ENWLPUcAPLz3GXQCcSCzkD9ecq1WlRx/xjhOcTlUxz4l6XaXFMWzObMkYH6yLp26hx
	 5z9wvUkJh/Xqv70vJNQrHjTAbU6iPKk8Xjja9FBbupMa9UaGjpJPMR1fG6HlnDyjT/
	 7had/M0yF6Olw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Zhao, Linaro" <richard.zhao@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Amit Daniel Kachhap <amit.daniel@samsung.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chander Kashyap <k.chander@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Drew Fustini <fustini@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Heiko Stuebner <heiko@sntech.de>,
	imx@lists.linux.dev,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jsarha@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Beguin <lvb@xiphos.com>,
	Linaro Ltd <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Marian Mihailescu <mihailescu2m@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Peng Fan <peng.fan@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Rosen Penev <rosenp@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sergej Sawazki <ce3a@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 00/10] clk: Assorted bug fixes across clock core and drivers
Date: Mon, 23 Nov 2026 16:47:33 +0000
Message-ID: <20261123164834.3330320-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlc2UgaXNzdWVzIHdlcmUgcmVwb3J0ZWQgYnkgU2FzaGlrby4KCk5vbmUgb2YgdGhlc2UgY2hh
bmdlcyBoYXZlIGJlZW4gdGVzdGVkIG9uIHBoeXNpY2FsIGhhcmR3YXJlLgoKQ2M6ICJVd2UgS2xl
aW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6ICJaaGFvLCBM
aW5hcm8iIDxyaWNoYXJkLnpoYW9AbGluYXJvLm9yZz4KQ2M6IEFiZWwgVmVzYSA8YWJlbHZlc2FA
a2VybmVsLm9yZz4KQ2M6IEFsaW0gQWtodGFyIDxhbGltLmFraHRhckBzYW1zdW5nLmNvbT4KQ2M6
IEFtaXQgRGFuaWVsIEthY2hoYXAgPGFtaXQuZGFuaWVsQHNhbXN1bmcuY29tPgpDYzogQW5pcnVk
aCBTcmluaXZhc2FuIDxhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPgpDYzogQnJpYW4g
TWFzbmV5IDxibWFzbmV5K2Nsa0ByZWRoYXQuY29tPgpDYzogQ2hhbmRlciBLYXNoeWFwIDxrLmNo
YW5kZXJAc2Ftc3VuZy5jb20+CkNjOiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNv
bT4KQ2M6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+CkNjOiBEcmV3IEZ1c3Rp
bmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4KQ2M6IEZyYW5jZXNjbyBEb2xjaW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNv
bT4KQ2M6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgpDYzogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvQHNudGVjaC5kZT4KQ2M6IGlteEBsaXN0cy5saW51eC5kZXYKQ2M6IEplcm9tZSBCcnVuZXQg
PGpicnVuZXQrY2xrQGJheWxpYnJlLmNvbT4KQ2M6IEpvZWwgU3RhbmxleSA8am1zQG9zcy50ZW5z
dG9ycmVudC5jb20+CkNjOiBKb25hdGhhbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPgpD
YzogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4KQ2M6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KQ2M6IExpYW0gQmVndWluIDxsdmJAeGlwaG9zLmNvbT4KQ2M6IExp
bmFybyBMdGQgPG10dXJxdWV0dGVAbGluYXJvLm9yZz4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJu
ZWwub3JnCkNjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEx1Ym9taXIgUmludGVs
IDxsa3VuZHJha0B2My5zaz4KQ2M6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBhcm0uY29tPgpD
YzogTWFyaWFuIE1paGFpbGVzY3UgPG1paGFpbGVzY3UybUBnbWFpbC5jb20+CkNjOiBNYXhpbWUg
Q29xdWVsaW4gPG1heGltZS5jb3F1ZWxpbkBzdC5jb20+CkNjOiBNaWtlIExvb2lqbWFucyA8bWlr
ZS5sb29pam1hbnNAdG9waWMubmw+CkNjOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KQ2M6
IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+CkNjOiBQZW5ndXRyb25peCBLZXJu
ZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgpDYzogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIu
Z3JpZmZpbkBsaW5hcm8ub3JnPgpDYzogUHJhc2hhbnQgR2Fpa3dhZCA8cGdhaWt3YWRAbnZpZGlh
LmNvbT4KQ2M6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwuY29tPgpDYzogU2FzY2hhIEhhdWVy
IDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDYzogU2VyZ2VqIFNhd2F6a2kgPGNlM2FAZ214LmRl
PgpDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpDYzogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPgpDYzogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1
bmcuY29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGtlcm5lbC5vcmc+CkNj
OiBUaG9tYXMgQWJyYWhhbSA8dGhvbWFzLmFiQHNhbXN1bmcuY29tPgpDYzogVG9tYXN6IEZpZ2Eg
PHQuZmlnYUBzYW1zdW5nLmNvbT4KCkxlZSBKb25lcyAoMTApOgogIGNsazogaW14OiBpbXg4cXhw
LWxwY2c6IFByZXZlbnQgc3RhY2sgb3ZlcmZsb3cgd2hlbiBwYXJzaW5nIGNsb2NrcwogIGNsazog
bG1rMDQ4MzI6IFZhbGlkYXRlIGNoaWxkIHJlZyBpbmRleCBpbiBsbWswNDgzMl9wcm9iZSgpCiAg
Y2xrOiB0ZWdyYTogYnBtcDogQm91bmQgbnVtX3BhcmVudHMgYnkgTVJRX0NMS19NQVhfUEFSRU5U
UwogIGNsazogY29tcG9zaXRlOiBJbml0aWFsaXNlIHN1Yi1odyBwb2ludGVycyBpbiBkZXRlcm1p
bmVfcmF0ZSgpCiAgY2xrOiBkaXZpZGVyOiBBdm9pZCBkaXZpc2lvbiBieSB6ZXJvIGluIF9kaXZf
cm91bmRfY2xvc2VzdCgpCiAgY2xrOiBncGlvOiBSZWplY3QgZ2F0ZSBjbG9ja3Mgd2l0aCBtdWx0
aXBsZSBwYXJlbnRzCiAgY2xrOiBzYW1zdW5nOiBleHlub3M1NDIwOiBUZXJtaW5hdGUgUExMIHJh
dGUgdGFibGVzIHdpdGggc2VudGluZWxzCiAgY2xrOiB0ZW5zdG9ycmVudDogUG9sbCBhdG9taWNh
bGx5IGluIGF0bGFudGlzX2Nsa19wbGxfZW5hYmxlKCkKICBjbGs6IGNkY2U5MjU6IFVzZSBkZXZt
X29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoKSB0byBhdm9pZCBVQUYgb24gdW5iaW5kCiAgY2xrOiBt
bXA6IGF1ZGlvOiBVc2UgZGV2bV9vZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKCkgdG8gcHJldmVudCBV
QUYKCiBkcml2ZXJzL2Nsay9jbGstY2RjZTkyNS5jICAgICAgICAgICAgICAgfCAgNCArKy0tCiBk
cml2ZXJzL2Nsay9jbGstY29tcG9zaXRlLmMgICAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9j
bGsvY2xrLWRpdmlkZXIuYyAgICAgICAgICAgICAgIHwgIDMgKysrCiBkcml2ZXJzL2Nsay9jbGst
Z3Bpby5jICAgICAgICAgICAgICAgICAgfCAgMyArKysKIGRyaXZlcnMvY2xrL2Nsay1sbWswNDgz
Mi5jICAgICAgICAgICAgICB8IDEwICsrKysrKysrLS0KIGRyaXZlcnMvY2xrL2lteC9jbGstaW14
OHF4cC1scGNnLmMgICAgICB8ICA0ICsrKysKIGRyaXZlcnMvY2xrL21tcC9jbGstYXVkaW8uYyAg
ICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLWV4eW5vczU0MjAu
YyAgICB8ICA0ICsrKysKIGRyaXZlcnMvY2xrL3RlZ3JhL2Nsay1icG1wLmMgICAgICAgICAgICB8
IDE0ICsrKysrKystLS0tLS0tCiBkcml2ZXJzL2Nsay90ZW5zdG9ycmVudC9hdGxhbnRpcy1wcmNt
LmMgfCAgOSArKysrKy0tLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQoKLS0gCjIuNTYuMS43NTAuZ2Y3MGRjNjgyY2YtZ29vZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
