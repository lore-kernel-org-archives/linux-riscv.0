Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B424CC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sn4yD6k7UNq/M//2VMeclkwdDqfm5GRv2MAMtPm9cFM=; b=vuUcz9z9JZrShY
	6OsVMRLIOlg7wS1oBLnoHahj9kADkKQTyCzYfcmg3WMHc1zUzTNDdWYPINZmftbinPdTIngmOimAH
	7yMyPu6VrxEBVaWpTyRgh+eFETp/S2uX0gIVcXKo4TJ6HOLW82H1AlVJDlxKbssXD3w5m8a4bfTfg
	MYdHdip531StXEHuhrHReoj88fm7XAWynnMiYoL45u9ULUSNESRqUt/O8tB4Irdw6pHK1e/7bUqCd
	XyGrrj1hkMrpjqckT1hFy1hAyn3uJXNHKH8pFrKTZMhv3goQyKgkAKPyXozKfCE5VuJNgLq5IOQ35
	mLF3I86aN4hZJMFIMmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronHR-00000000myN-0lEW;
	Mon, 25 Mar 2024 16:34:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roZpm-0000000EbBI-2Rgk;
	Mon, 25 Mar 2024 02:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9561FCE0F95;
	Mon, 25 Mar 2024 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76189C43394;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUL61oDb/M+5KYmdH9GZAQdZT3PYKaJ010SbGP/0QAETJ2gY+Rxd19+hfItokn4fc
	 qXm+5UshaVvnLaKO+h8US6GsQq7XoxEkTJDEVJIEaNCFv8M2uUBhoQrMAu3fisTCQo
	 B4fRFMNeMscSki123E/z54cBRXf+v5p5HhYpLJ3jJtc1OvR7VQslOwZ36RRz8NHOez
	 HFUH5lzzeG0rrZGBHCyr2OTeNZB2H2sILwj6OEqE53Bfd2qCAI/Z34pAg9I1JWd2Cn
	 dq/bNtJWoCPVpzv9DjBiOxvAIfXazxrFfLBNOkzXYWWq5P+zSQavVa4Lgiia++T7N2
	 7rjlBqvf/ljRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AFA0D2D0E0;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <171133278736.9916.5526869645378949035.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
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
X-CRM114-CacheID: sfid-20240324_191311_090999_62E107AD 
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
Z2l0IChmb3ItbmV4dCkKYnkgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT46CgpPbiBXZWQsIDE0IEZlYiAyMDI0IDEwOjMwOjQ3ICswMTAwIHlvdSB3cm90
ZToKPiBIZWxsbywKPiAKPiB0aGlzIGlzIHY2IG9mIHRoZSBzZXJpZXMgaW50cm9kdWNpbmcgYmV0
dGVyIGxpZmV0aW1lIHRyYWNraW5nIGZvcgo+IHB3bWNoaXBzIHRoYXQgYWRkcmVzc2VzIChmb3Ig
bm93IHRoZW9yZXRpYykgbGlmZXRpbWUgaXNzdWVzIG9mIHB3bQo+IGNoaXBzLiBBZGRyZXNzaW5n
IHRoZXNlIGlzIGEgbmVjZXNzYXJ5IHByZWNvbmRpdGlvbiB0byBpbnRyb2R1Y2UgY2hhcmRldgo+
IHN1cHBvcnQgZm9yIFBXTXMuCj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKICAtIFt2NiwwMDEvMTY0XSBwd206IFByb3ZpZGUgYW4gaW5saW5lIGZ1bmN0aW9uIHRv
IGdldCB0aGUgcGFyZW50IGRldmljZSBvZiBhIGdpdmVuIGNoaXAKICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNGU1OTI2N2M3YTIwCiAgLSBbdjYsMDAzLzE2NF0g
cHdtOiBQcm92aWRlIHB3bWNoaXBfYWxsb2MoKSBmdW5jdGlvbiBhbmQgYSBkZXZtIHZhcmlhbnQg
b2YgaXQKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvMDI0OTEz
ZGJmOTlmCiAgLSBbdjYsMDI5LzE2NF0gcHdtOiBjcm9zLWVjOiBDaGFuZ2UgcHJvdG90eXBlIG9m
IGhlbHBlcnMgdG8gcHJlcGFyZSBmdXJ0aGVyIGNoYW5nZXMKICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNzI1NmMyZTc5YjhlCiAgLSBbdjYsMDMwLzE2NF0gcHdt
OiBjcm9zLWVjOiBNYWtlIHVzZSBvZiBwd21jaGlwX3BhcmVudCgpIGFjY2Vzc29yCiAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzE5YTU2OGE4ZDNjNAogIC0gW3Y2
LDAzMS8xNjRdIHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ugb2YgZGV2bV9wd21jaGlwX2FsbG9jKCkg
ZnVuY3Rpb24KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNDUy
YmU5NDIxZWRhCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQtZG9vdC1kb3Qs
IEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90
Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
