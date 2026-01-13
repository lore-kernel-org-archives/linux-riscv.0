Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2B7D2D0E7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1xi8/DuPURNlPRuhPaycWPzXSDyZxQbBWzBu9obkQU=; b=In8rvV7aTyHAmC
	kMH17qfjPejyfkwllalYwUZtIJgLKdsDSKv6A+O7FFa1RrTc+1udx4d41IL10x2/tk/xYMdtMUJPE
	uUCNFavdBQ6o0Z1WVwTU7IAoedfm5Ld6KXojbvKPewTjIcFt44UxDZ9p4kQ7Hv0FxdEQN0nAwmZBi
	5Fk4FQ0DNNY718aQ0zqVRfFEqCechOGDplgSMrprRGY25wIlTPoOM7YGvXiY5qv+N/oxsUPSUsl2n
	l1UDVaICju9uDMLbWvWow8ALIn4Gmazwy8b+vrCpm25W7718LwB9KHysZ7zFpOB2Cth+aEKz2MEox
	KCOGJFBaWlsrS5bQythg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdfE-000000075bm-46Lu;
	Tue, 13 Jan 2026 12:38:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdfB-000000075ZY-2TlS
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C81044386
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 12:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F388AC2BCB8
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768307901;
	bh=qXScHYuCzd215t8hnmVMyfAJzYu9LaTDkfUenYtogos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DMKO3wDOQyqAMkRsF3KjP1QgKWLmG/bIgkwkqikQWX7/JxeRnNe7RTYQnbhOkMfPE
	 G+G+GVnK7BcA67OKp/w9uYGtoDKb6gYsPJFta0W9o3WbrjYSxf+gdK+PIoWXEDVRpB
	 Q5EBZu76fgMusQwSmXX/liK7piEEVzbTmPGCiEh5Np1ueLICoCxv+JeymLWcnk+8zE
	 HJZlIdI9MFRGAndmHTk7bTK8js1iFU5lIaAW8gyi5nhPAB7QNOe9kboOVP1zt4i3+k
	 wUKGh42sKh+F35XHH38iMuMWdGE+RTZk9+LCDvYE3jVMx6N3ZypoG2kBxgAbxjzKHh
	 WESRwPJzz6AdA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382fb535b73so59720371fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 04:38:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+q/mZMd4nsVfmvsnZVAO/dXNixQBxUnd1HKkkuNknx/frlbOt2PAbgGehJW1QSNCFuybLkBHoGOuyKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7UrIGA4k83N4x8/GhIpfdHMltO0c41mzhKXkjpRUXJvFlq5mQ
	Hq1q0tgJ7DDuONlVyMZPFmvOwdqaMPz1njSQf32MXjYX09708042Mt3EkgYU7ueDqPzIbXLbJFB
	RsNS7hbl4bxhGe7+n27BjRw6WxesZKw7/HELnE4B81g==
X-Google-Smtp-Source: AGHT+IHqazDCuLxwH7Iu/G2PkGJgVTJ7/k1UTcZwajhZd9YF9n/CenHYLasZcuGAB0SV4lL43Mgtox5RINYhxwkIRxc=
X-Received: by 2002:a05:651c:30c9:b0:37b:967e:d73 with SMTP id
 38308e7fff4ca-382ff8115efmr73607701fa.29.1768307899461; Tue, 13 Jan 2026
 04:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com> <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
In-Reply-To: <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
X-Gm-Features: AZwV_QhJCTDCGsC5t4RHVGQlo_Vyd1Okk9vVsia2jA5DJVHGvVefyoWQdJ752O4
Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v6 7/7] net: stmmac: qcom-ethqos: add
 support for sa8255p
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
X-CRM114-CacheID: sfid-20260113_043821_670491_356D9EC4 
X-CRM114-Status: GOOD (  14.48  )
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo1NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0NkFNICswMTAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPgo+ID4KPiA+IEV4dGVuZCB0aGUgZHJpdmVyIHRvIHN1cHBvcnQg
YSBuZXcgbW9kZWwgLSBzYTgyNTVwLiBVbmxpa2UgdGhlCj4gPiBwcmV2aW91c2x5IHN1cHBvcnRl
ZCB2YXJpYW50cywgdGhpcyBvbmUncyBwb3dlciBtYW5hZ2VtZW50IGlzIGRvbmUgaW4KPiA+IHRo
ZSBmaXJtd2FyZSB1c2luZyBTQ01JLiBUaGlzIGlzIG1vZGVsZWQgaW4gbGludXggdXNpbmcgcG93
ZXIgZG9tYWlucyBzbwo+ID4gYWRkIHN1cHBvcnQgZm9yIHRoZW0uCj4KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBxY29tX2V0aHFvc19tYXRjaFtdID0gewo+ID4gICAgICAg
eyAuY29tcGF0aWJsZSA9ICJxY29tLHFjczQwNC1ldGhxb3MiLCAuZGF0YSA9ICZlbWFjX3FjczQw
NF9kYXRhfSwKPiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAicWNvbSxzYTgyNTVwLWV0aHFvcyIs
IC5kYXRhID0gJmVtYWNfc2E4MjU1cF9kYXRhfSwKPgo+IElzIHRoaXMgZGV2aWNlIGJlaW5nIHBy
b2JlZCB2aWEgRFQgb3IgQUNQST8KPgoKT24gdGhlIHNhODI1NXAgaXQncyBwcm9iZWQgdmlhIERU
IGJ1dCBhbGwgaXRzIHJlc291cmNlcyBhcmUgbWFuYWdlZCBpbgpmaXJtd2FyZSBvdmVyIFNDTUku
CgpCYXJ0b3N6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
