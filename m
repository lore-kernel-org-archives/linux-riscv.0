Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6914AD37E59
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frP49uiSuCM7PKeUUNjTc+KpBRZGE+Ov91Pa4dsLk5w=; b=QT1qlNKTNFBN22
	UkrS9+LZsH/L44j2ocIadBfvn33YJldhL4JYRB5Wje1ETiYa3nKmJPawfw45+4ZvrjQvf12p1Zwos
	dDOESaKWkP9iXG7qect84VsRlgd78vysPDkwl+Qur08ctd/l8YStm58x72qT6Mlr0nH6dycmvXXAa
	ewS2lE6se6nJQyUN+qRAkZTA/vWB1led8vwKaTE7ZPQYns0L38q+XWC4TVhDYdJxan9OJSME1svXl
	OW0mx3F8BQ43UvqhB6o0S1vYYEMPgXsnrfQuD4ig1qdET+4+OACExnaQFC2W+FpN7N26zZHqcQGiJ
	fBJUJqbvUIJlfgnz4Piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg39k-00000009miH-2gej;
	Wed, 14 Jan 2026 15:51:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg39h-00000009mgm-2a1a
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Jan 2026 15:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=o+OEjagxl3Dsp9tfzVfdkpH30i7BI82gz0LPNnSdpig=; b=behb7z9oLDCBeAeU3Dhsv+EWKs
	a3fS9FRY0MU8VEFJc0hGQ4D/unDhpWO8FT3YFNdOEtrrNW8LQSSrIcG/QcsYpOZpU8e1VtsdWrDXt
	L/DeOXxExhqB9u3niIGXzEnh+rwq8pzj6tMvKq/JG+NeVIbIWF5BiY5WJaosSMzuHD4eCr1pgyqil
	R2HbkaouSFfkZKGho9I9/weMki23LmN7RKJM/caj0yHBXLw0+QaUsuvgP+rXBkDD2fE01tV4z6BmZ
	yi8FgmEx50ypMNR1SJmbVtHX1IZ6mx9ED60jw3qWvQw7SEFZMvxDum8ugO65TVKybkUIM8lnV1q9C
	L+/mIe/g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg39d-00000005AWM-3cSb
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 15:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 645B64443B
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BECC2BCB2
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405885;
	bh=o+OEjagxl3Dsp9tfzVfdkpH30i7BI82gz0LPNnSdpig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FY1rCh7BTXtSgy430K1ImGXJbRWQzGMOIBH1z9f+jJLEcsC6lEv7EHrApo9FSgliZ
	 y0vYkLCGAkjw4diqSoI/z84wIWno1qymsG+z8s8CZ6aSqUZ0RnZelrZf1g+YX7mLLh
	 qSWBQht+cKzp68EJB5t86KporBJBJ9GcgcbofoXC29jfh+aE38gIMQRAmoTLZ8csqL
	 8CiGMfRZ1AThkmhU05KnfGCf7/WLdpvIhIRUDlq1p2+Vt99cFPyGWWI0cRZ5k49u3b
	 5UN6n7pRVDOGM0VuPvT8IyO5aPhYhSk4RCI6Pkkop+R+uEJMM/8YQut2l3/OrjM2ix
	 G2m18gRBN2lZw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b7882e605so8818851e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 07:51:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKppp5nnqxu5Py5ZTkcOHEchE3YN6RM84Yr7BrB3lOw7sL2vKzbS2VMANpnhPuNu8coZtnrgKtLNyalQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkORyCjG6SLhHRp3Mw5jQRhy7YFPLoeU02Ttyz/SvuFANVGEGT
	eNMVn7n/lqIb0eBqBe3wKbPG84LOk53sRD7atimgLBChNUZurxOCvCSs9HM9tx3C8gzr3IQPS4l
	s6lK2wSANKqHJJ8k3KQBz216IBupJiQ/rjbuOYTCbdA==
X-Received: by 2002:a05:6512:2316:b0:59b:8472:48ca with SMTP id
 2adb3069b0e04-59ba0f63088mr1131918e87.12.1768405882412; Wed, 14 Jan 2026
 07:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch> <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
 <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
In-Reply-To: <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 16:51:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
X-Gm-Features: AZwV_QiTx85beob9IcsRkXcH-FzLKf11MkfoXrcsCiRgQ4kLBhgc1kcRpkaBWZY
Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_155130_820479_89E50DE0 
X-CRM114-Status: GOOD (  16.13  )
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTE6MDbigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1
bm4uY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMDE6MzY6NTNQTSArMDEw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDEyLCAyMDI2IGF0
IDI6NDXigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0MUFNICswMTAwLCBCYXJ0b3N6IEdvbGFz
emV3c2tpIHdyb3RlOgo+ID4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2Vy
bmVsLm9yZz4KPiA+ID4gPgo+ID4gPiA+IEluIG9yZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVuY3kg
b24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPiA+ID4gPiBnZXR0ZXJz
IGZyb20gT0Ytc3BlY2lmaWMgdG8gZ2VuZXJpYyBkZXZpY2UgcHJvcGVydGllcyBhbmQgc3RvcCBw
dWxsaW5nCj4gPiA+ID4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPiA+ID4KPiA+ID4gSXMg
dGhlIGludGVudGlvbiB0byByZWFkIHRoZXNlIHByb3BlcnRpZXMgZnJvbSBBQ1BJIHRhYmxlcz8K
PiA+ID4KPiA+Cj4gPiBOby4gT3RoZXIgdGhhbiBhIGNvdXBsZSBwcm9wZXJ0eSBnZXR0ZXJzIHdo
aWNoIGNhbiB1c2UgdGhlIGZ3bm9kZQo+ID4gYWJzdHJhY3Rpb24sIHRoZXJlJ3Mgbm90aGluZyBo
ZXJlIHRoYXQgcmVxdWlyZXMgdGhlIE9GIGRlcGVuZGVuY2UuCj4KPiBTbyB3aGF0IGlzIHRoZSBu
ZWVkIGZvciBub3QgdXNpbmcgT0Y/IFdoeSBkbyB5b3Ugd2FudCB0aGlzIHBhdGNoPwo+CgpXZSd2
ZSBoYWQgYSBoaWdoZXItbGV2ZWwgYWJzdHJhY3Rpb24gZm9yIE9GIG5vZGVzIGZvciB5ZWFycyBu
b3cuIFNpbmNlCkknbSBhbHJlYWR5IHRvdWNoaW5nIHRoZSBkcml2ZXIsIGl0IG1ha2VzIHNlbnNl
IHRvIHN3aXRjaCB0byB1c2luZyBpdCwKYXMgT0YtY2VudHJpYyBBUElzIGFyZSBub3QgcmVjb21t
ZW5kZWQgaW4gbmV3IGNvZGUgZXZlbiBpZiBpdCdzIGFuCk9GLW9ubHkgZHJpdmVyLgoKQmFydG9z
egoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
