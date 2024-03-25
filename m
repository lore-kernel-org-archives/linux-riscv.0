Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517D3C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzJYTQ64p1fvDN6sQTA4ryYDoXNTi6AeFq5NHjMvngk=; b=Jf0RlwToecIqVh
	HQFOuFsEEqd9qiSclPb84EOxv14JQHc6EEdw0UWGKpMtIl+A87+FPMPGv54yMu/MFc11ex/xxE6bO
	kedIv548/joZYw3vhF2S8kvk5UfpVuDjnHE10bvbu40YGvB3aP280ceqDdu1IFRWe6ekXttrv4jEw
	JOfwxYRDgdqjnJZmMkl2RVEwsk2HmOIu/90VPcpQ3gCsq614FV1sqwLLIARIkY1P0c9C82rEa6P1v
	AYVvBI0irjzj6SphOFVzVRilmguMKlltamwbufBW5LpO2aLaUq05eSO9XCTDVjB9wVQXLcK+U1KNJ
	p70Pm7WuTT0KEYZwYM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronHQ-00000000my3-24b8;
	Mon, 25 Mar 2024 16:34:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZXd-0000000EVpR-2OmA;
	Mon, 25 Mar 2024 01:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1BC060DC6;
	Mon, 25 Mar 2024 01:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C87C433F1;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711331662;
	bh=x6gbNWDUC3393woiAhRGtrXvkbgxFEKnVO43IWMARsU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jrPZZfZ03PsaQD3fMGm9nq2UPpPmNCR2UhRG5lEG5sj1PDjplq8FZ75Zbzq4M++fX
	 Q6TVSgOVQbUvhZzKhKOQNbQwhQhy2BZ8MRkhAIEF+3w0ilwV/nWxm1rjxE/qfP/Mr+
	 E3yc5dSuBNp0Bm1L/KI5QDwiA8kFCuNjxzWIU7cCRVNPOgSNBZV+qUtQOY4O/YoTDT
	 PFwCgNm3HEFcmI1zG6v/j47VLsywRsjUKgaIEweM6/K8U5bK1qRIu9RKHx/KjIcwnX
	 cAPddvxMuoVuFBd1hKdjXjkxNm2QAvn+OmyKHTZvNymrjm/TZ8YaQVQ3vy0XdpqBcO
	 88LTlEfD/nBQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59B24D2D0E0;
	Mon, 25 Mar 2024 01:54:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133166235.9916.5159550524752322105.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 01:54:22 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: linux-pwm@vger.kernel.org, corbet@lwn.net, Jonathan.Cameron@huawei.com,
 james.clark@arm.com, andriy.shevchenko@linux.intel.com, broonie@kernel.org,
 marcan@marcan.st, sven@svenpeter.dev, claudiu.beznea@tuxon.dev,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 shc_work@mail.ru, bleung@chromium.org, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, paul@crapouillou.net,
 vz@mleia.com, mika.westerberg@linux.intel.com, andy@kernel.org,
 linus.walleij@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, conor.dooley@microchip.com,
 daire.mcnamara@microchip.com, j.neuschaefer@gmx.net, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 mwalle@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 zhang.lyra@gmail.com, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, hammerh0314@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 sean.anderson@seco.com, michal.simek@amd.com, brgl@bgdev.pl,
 andrzej.hajda@intel.com, rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 pavel@ucw.cz, lee@kernel.org, quic_amelende@quicinc.com,
 quic_bjorande@quicinc.com, keescook@chromium.org, robh@kernel.org,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 kernel@pengutronix.de, linux-doc@vger.kernel.org, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, festevam@gmail.com,
 linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 dianders@chromium.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 gustavoars@kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_185425_925128_3D2B3FEB 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 25 Mar 2024 09:34:35 -0700
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBjaHJvbWUtcGxhdGZvcm0vbGludXgu
Z2l0IChmb3Ita2VybmVsY2kpCmJ5IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+OgoKT24gV2VkLCAxNCBGZWIgMjAyNCAxMDozMDo0NyArMDEwMCB5b3Ug
d3JvdGU6Cj4gSGVsbG8sCj4gCj4gdGhpcyBpcyB2NiBvZiB0aGUgc2VyaWVzIGludHJvZHVjaW5n
IGJldHRlciBsaWZldGltZSB0cmFja2luZyBmb3IKPiBwd21jaGlwcyB0aGF0IGFkZHJlc3NlcyAo
Zm9yIG5vdyB0aGVvcmV0aWMpIGxpZmV0aW1lIGlzc3VlcyBvZiBwd20KPiBjaGlwcy4gQWRkcmVz
c2luZyB0aGVzZSBpcyBhIG5lY2Vzc2FyeSBwcmVjb25kaXRpb24gdG8gaW50cm9kdWNlIGNoYXJk
ZXYKPiBzdXBwb3J0IGZvciBQV01zLgo+IAo+IFsuLi5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdp
dGggbGlua3M6CiAgLSBbdjYsMDAxLzE2NF0gcHdtOiBQcm92aWRlIGFuIGlubGluZSBmdW5jdGlv
biB0byBnZXQgdGhlIHBhcmVudCBkZXZpY2Ugb2YgYSBnaXZlbiBjaGlwCiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzRlNTkyNjdjN2EyMAogIC0gW3Y2LDAwMy8x
NjRdIHB3bTogUHJvdmlkZSBwd21jaGlwX2FsbG9jKCkgZnVuY3Rpb24gYW5kIGEgZGV2bSB2YXJp
YW50IG9mIGl0CiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzAy
NDkxM2RiZjk5ZgogIC0gW3Y2LDAyOS8xNjRdIHB3bTogY3Jvcy1lYzogQ2hhbmdlIHByb3RvdHlw
ZSBvZiBoZWxwZXJzIHRvIHByZXBhcmUgZnVydGhlciBjaGFuZ2VzCiAgICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzcyNTZjMmU3OWI4ZQogIC0gW3Y2LDAzMC8xNjRd
IHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ugb2YgcHdtY2hpcF9wYXJlbnQoKSBhY2Nlc3NvcgogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9jaHJvbWUtcGxhdGZvcm0vYy8xOWE1NjhhOGQzYzQKICAt
IFt2NiwwMzEvMTY0XSBwd206IGNyb3MtZWM6IE1ha2UgdXNlIG9mIGRldm1fcHdtY2hpcF9hbGxv
YygpIGZ1bmN0aW9uCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9j
LzQ1MmJlOTQyMWVkYQoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3Qt
ZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9w
d2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
