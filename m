Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6595D30CDB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HIVvWyWCNMD+lvLHJrgBSLwhXUy/S/P9mrxK/xfZTc=; b=0d4S8LvYiwQT5/
	c8YBjcAyclywhorjcO02DTzo5IP5naN0pqGXOOGFd3bdINOy80YnJZVFdTM7ESjq+H9Z8POT2sD0p
	LVaWU7fetqqhOTQwz+7FICe1XSKhME0NBLJVz/xlt5TOqS9CL6yMq4C99bxA2ufyzSTGy/zvw2i02
	pvl0R/zeGFpqrfchPK8ieY1E/fyHGotdUIhwlSy9WWAnqvBWT/8rJi68JCZoyilsiDvfSpTgWOR2f
	+sC89HgntCZ/dzQSlwaG3T9ylDAZdVtQrSYuwwVokSwf+qXW+KkU1sKVkD7rfXVsg6lxZZL5GUUYt
	uphWnHdfeCbW1RwhENwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmXE-00000007nWm-14lT;
	Tue, 13 Jan 2026 22:06:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmXB-00000007nWD-0G9I;
	Tue, 13 Jan 2026 22:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=oBM2ZoOF22ddiLW29uUZvDBCanemUcQlDXTvmAcjlq4=; b=kI
	Y8zUy97+/X5jNowUufRNGBEkL5lckHnRZAeGH2ky7o8DY2gnk+V1zKaO95hqWEgDAg40w523H3J+c
	+cBn8rp7OJQD/Z+CBIQkEsT1pZZgZ0TM2oaYWUL7T5O8Q6hif/olvCQyS1uUtoDXmW//efHVd6A5l
	wb+967zbnQezKGU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfmWA-002hQ8-MR; Tue, 13 Jan 2026 23:05:38 +0100
Date: Tue, 13 Jan 2026 23:05:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Romain Gantois <romain.gantois@bootlin.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Shuang Liang <liangshuang@eswincomputing.com>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
Message-ID: <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
 <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_140641_121627_C0B3219D 
X-CRM114-Status: GOOD (  12.40  )
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMDE6MzY6NTNQTSArMDEwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAyOjQ14oCvUE0gQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEphbiAxMiwgMjAyNiBh
dCAxMToxNTo0MUFNICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBGcm9t
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IEluIG9y
ZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZp
Y2UgcHJvcGVydHkKPiA+ID4gZ2V0dGVycyBmcm9tIE9GLXNwZWNpZmljIHRvIGdlbmVyaWMgZGV2
aWNlIHByb3BlcnRpZXMgYW5kIHN0b3AgcHVsbGluZwo+ID4gPiBpbiBhbnkgbGludXgvb2YuaCBz
eW1ib2xzLgo+ID4KPiA+IElzIHRoZSBpbnRlbnRpb24gdG8gcmVhZCB0aGVzZSBwcm9wZXJ0aWVz
IGZyb20gQUNQSSB0YWJsZXM/Cj4gPgo+IAo+IE5vLiBPdGhlciB0aGFuIGEgY291cGxlIHByb3Bl
cnR5IGdldHRlcnMgd2hpY2ggY2FuIHVzZSB0aGUgZndub2RlCj4gYWJzdHJhY3Rpb24sIHRoZXJl
J3Mgbm90aGluZyBoZXJlIHRoYXQgcmVxdWlyZXMgdGhlIE9GIGRlcGVuZGVuY2UuCgpTbyB3aGF0
IGlzIHRoZSBuZWVkIGZvciBub3QgdXNpbmcgT0Y/IFdoeSBkbyB5b3Ugd2FudCB0aGlzIHBhdGNo
PwoKICAgIEFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
