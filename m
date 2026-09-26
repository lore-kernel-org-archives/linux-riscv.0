Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F98C98318
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 03:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEVKI60PaHL1IjRP9M79HycIQ0Ejaw6ws6aemrFWipY=; b=I2kQsuOqsRAhR0
	Liu/0Jty/Mrzj22eaW1UQyD0QmKLOiwsqh9ifO7M2LjALO5NypQe1xaELuVE3W/REBNZQSNjEuOPd
	bjSTtvhSTpgY/b+mFy/6CHq9m0y1vQ7+ltFFs/tKe4TEs2HjnJsF9o3Gilz0hQIFyPpvlKZZR2w0C
	ORD/uaPriigzwUyVjhPN5X2mt/7wMngBRvs+FxhswfeRr9x31EOGip/ynWVhjH8TLzhwWT3TyJSr1
	WlPITguBwzALvjnVOkfqZ6Zr4OMTvpYNEP6Lqj0HK2Wc3GjRPUE73O5L9I/QaNK/s3yJ2qF6jSJgi
	egokwaFV1RZwFm9+V1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ9A-0000000EuKf-2PUd;
	Sat, 26 Sep 2026 03:32:20 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ97-0000000EuJa-35FS
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 03:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=AQLmCm/9B4mrJDzPpo+c4kOsaksdj2bsxYt/mOLsFQ8=; b=jo9wQQ7mm1/ITjk+ho4Jqb3VQ4
	pZIm1U2kqU9EuqV46lVDXBxtDVqh6mbj/xZCVgKxADk0e2A+hQc6WwZfju0uf/V9QQDHCcacY0TFO
	kvEYBfRRfI7hAG62lVNBjhLw3NdbPvg/A/lUr8mu8Z/uP1+PInYzLX2mvLZidv8ajyiaLyE9N/WXN
	DiWG1A+Y4rYjXLv7HkZsYQ9Fu1lUSzYgN0eO9ym8loXE/rzLtByS5fEFW7wwesxFNYSNy/NVqgAlC
	p5RVlYBoeEHqVbXfwr/vSn+oAcQhe7y0NVmH4v6jfafS+/SH1x4gI3ntSvqjYJyPDFRi/2TfNfFv2
	ozuxqb4A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xAJ91-005nOV-2W
	for linux-riscv@lists.infradead.org;
	Sat, 26 Sep 2026 03:32:12 +0000
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-8814e797a5bso120964b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 20:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBynXGE1MKR9JmRWcHvZztAVL7OXv1+A12dr70bDlKhdjr2Bn/0mPPKB4GhE/JdqzmJQSu+u9EfVscbL6w==@lists.infradead.org
X-Gm-Message-State: AFuF++nlxGiY9gu4jR2QHdePFGFuPsXNlh9kGDgNpM1FrmZs0woSI3yf
	KdqIaZECbTtu+ROlA883nme6czrsqqyzcIRZnNNot48eZWbDGdB5rfSqdWG8IBwQuwNafM8XpZz
	DVQjB2+4lDa0HGxxeC5OFp+Ikt70vM/M=
X-Received: by 2002:aa7:888b:0:b0:880:7e9a:6e56 with SMTP id
 d2e1a72fcca58-8807e9a73a8mr2177107b3a.13.1790393525763; Fri, 25 Sep 2026
 20:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260915153246eucas1p289987fd8757c89ff865c99b6465708a8@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com> <20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
From: Dominique Belhachemi <domibel@debian.org>
Date: Fri, 25 Sep 2026 23:31:54 -0400
X-Gmail-Original-Message-ID: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
X-Gm-Features: AclHuK8_8y3EcFqb3OgZBY9WaeDxyzPMPd1_yK_ekhMIXfr7tAphtd8D7H_5xEI
Message-ID: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Debian-User: domibel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_203217_768398_0D46ECBD 
X-CRM114-Status: GOOD (  10.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTE6MzLigK9BTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+ICtzdGF0aWMgaW50IHN0YXJmaXZlX2hk
bWlfcGh5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArICAgICAg
IHJldCA9IGNsa19zZXRfcmF0ZShpbm5vLT5waHljbGssIDI5NzAwMDAwMCk7Cj4gKyAgICAgICBp
ZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHNldCBk
ZWZhdWx0IHJhdGU6ICVkXG4iLCByZXQpOwo+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9kZWxf
Y2xrX3Byb3ZpZGVyOwo+ICsgICAgICAgfQoKSGkgTWljaGFsLAoKQ2FuIHdlIGRyb3AgdGhlc2Ug
NSBsaW5lcz8KV2hlbiBteSA0SyBtb25pdG9yIGNvbWVzIHVwIGluIG1vZGUgKDM4NDB4MjE2MEAz
MCwgMjk3IE1IeikgdGhlIHNjcmVlbgpzdGF5cyBibGFuay4KCldoZW4gdGhlIGZpcnN0IHJlYWwg
bW9kZXNldCByZXF1ZXN0cyBhIG1vZGUgd2hvc2UgcGl4ZWwgY2xvY2sgaXMgYWxzbyAyOTcgTUh6
LApjbGtfc2V0X3JhdGUoaGRtaV9wY2xrLCAyOTcwMDAwMDApIHRoZW4gc2VlcyBjdXIgPT0gd2Fu
dCBhbmQgZG9lcyBub3RoaW5nLgpTbyB0aGUgcHJlLVBMTCBpcyBuZXZlciBhY3R1YWxseSBwcm9n
cmFtbWVkLgoKV2l0aG91dCB0aGVzZSA1IGxpbmVzIGlubm8tPnBpeGNsb2NrIHN0YXlzIDAsCnNv
IHRoZSBmaXJzdCBtb2Rlc2V0J3MgY2xrX3NldF9yYXRlKCkgYWx3YXlzIHJ1bnMgLnNldF9yYXRl
KCkgZm9yIHJlYWwuCgpUb2dldGhlciB3aXRoIG15IGZvcmdvdHRlbiBmaXggZnJvbSBNYXkgd2Ug
Y2FuIGhhdmUgd29ya2luZyA0S0AzMCBvbiB0aGUgVkYyLgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjA1MjgxODQxNDUuMzg0MTE0LTEtZG9taWJlbEBkZWJpYW4ub3JnLwoKQmVzdAot
RG9taW5pcXVlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
