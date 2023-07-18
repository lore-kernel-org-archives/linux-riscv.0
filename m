Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DF3C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IK/nWP5/zprZU4RLGNSzAU0eYHLfaINbDMTurFhifhc=; b=z29V1i4XigW/gf
	tVyV20NNGIyUExD+qBGRqv5lnhzJL4Hx/rKYfX38W50Z2yBe95IJ653021J/6zCrui8uW8JTibR2N
	sSnqsZdREL32enLy7CkiOIS1sUKLeV/sVwGtduVqgE/nV+gc8UOt491eed1ADnFGBy02vNVYOgP5u
	/MOFL9LHVzuJVwQC8bb3CtXysWYAZZmKDBHCb2JnfpqxpfmWpr4upoKalrFAzOfLZlukZa2TN5w+Y
	3qNv/9Xk8dRxi8ZbcUNM9uioAwW/ClW/4g3X7WwmahwAF7OgTGJ2sr7jWu5uaTKYk8CVtVxyLSOuZ
	Vwg59G/auwpo47XgNTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17c-005zqI-1F;
	Wed, 19 Jul 2023 06:57:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM17C-005zSU-2o;
	Wed, 19 Jul 2023 06:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RpKAtUiUinq9Lhw+v54h3QcTHPMMcdg2W9j58F9msCI=; b=F3Ce31FjCpD97H49ycWH/uON4l
	G7DbGdmmsnGTJvVBZ+SXSf4Ns5xQUivWbsUdFnnzRR2ZMrbGvnaHrxZ6/hZ4pV4N43Zqyj4a3+3CX
	ayoTunY9wR9hj9mOf5VlwlZJYXSSgCwSE51fxhBUoXR6DeY1qasb55mw26rnmhx+kXK+Mzj2R2pOz
	Vc+tZd8sT/dFpD4YVIZ2iCo1TMrjyrt2+er1/NQrqLhxaWYJFOpVSaMJIyAboleRTW26XSTTV/7Ni
	T2xMqnL0BV4MVg0Osb2n7Qg6AFdgnbI4uX8ZzB5/dGR+hvtSzdzNpuxXnXj1AOQpAYUKr+mzQpeck
	cYs/Vkdw==;
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLeG3-00BDZ1-2L;
	Tue, 18 Jul 2023 06:32:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E080220008;
	Tue, 18 Jul 2023 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689661919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpKAtUiUinq9Lhw+v54h3QcTHPMMcdg2W9j58F9msCI=;
	b=lVsAfqer8xWiySiEq4z7Whp9otUwyCQXKtPI1tRr5f7imi5WmvidsvbXpCUGXwxk1c+lvE
	oUHmSljh698Kg7YXWz38yD7YKynczdgakNvh9W31vXeG3ASFtYmUbHMMJvu2jAXs6WXMFe
	qDOvnq5fNCwuhkU5Pv9JkSJ8uAbs1yjvZIjT+WnxMiQeDJLtUHfZO7aM8YIAG7auX7E6KB
	neoUdUzoHRJnTzkhM6WLVgYwYyzcHYvDk8cc5I9mppjSrEmHREOSYJaDUdNw61xuiMD/34
	m7I4N+6JbCgr4Op1Mxo+kriyEeSldJsgWRrKtcIj3mGk+C0lffE+F3dHz9dysw==
Date: Tue, 18 Jul 2023 08:31:49 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Minas
 Harutyunyan <hminas@synopsys.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Li Yang <leoyang.li@nxp.com>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Michal Simek <michal.simek@amd.com>, Alan
 Stern <stern@rowland.harvard.edu>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Richard Leitner <richard.leitner@linux.dev>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Paul Cercueil <paul@crapouillou.net>, Bin Liu
 <b-liu@ti.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno     
    <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: Explicitly include correct DT includes
Message-ID: <20230718083149.77fa57ef@bootlin.com>
In-Reply-To: <20230714175027.4065135-1-robh@kernel.org>
References: <20230714175027.4065135-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_073227_949982_32A71018 
X-CRM114-Status: GOOD (  12.58  )
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

SGkgUm9iLAoKT24gRnJpLCAxNCBKdWwgMjAyMyAxMTo1MDoyMyAtMDYwMApSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKCj4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0
Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUgc2VwYXJhdGUKPiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBi
ZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3VsYXIgcGxhdGZvcm0gYnVzLgo+IEFzIHBh
cnQgb2YgdGhhdCBtZXJnZSBwcmVwcGluZyBBcm0gRFQgc3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRo
ZXkKPiAidGVtcG9yYXJpbHkiIGluY2x1ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUg
cGxhdGZvcm1fZGV2aWNlLmgKPiBhbmQgb2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0
dHkgbXVjaCByYW5kb20gbWl4IG9mIHRob3NlIGluY2x1ZGUKPiBmaWxlcyB1c2VkIHRocm91Z2hv
dXQgdGhlIHRyZWUuIEluIG9yZGVyIHRvIGRldGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kCj4gcmVw
bGFjZSB0aGUgaW1wbGljaXQgaW5jbHVkZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1c2Vy
cyBuZWVkIHRvCj4gZXhwbGljaXRseSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCgpbLi4u
XQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYmYuYyBi
L2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2JmLmMKPiBpbmRleCA2Y2QwYWY4M2U5
MWUuLjM0ODJiNDFkMDY0NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3Jl
bmVzYXNfdXNiZi5jCj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYmYu
Ywo+IEBAIC0xMiwxMCArMTIsOSBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tmaWZvLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+IC0jaW5jbHVkZSA8bGludXgv
b2ZfaXJxLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvdXNiL2NvbXBv
c2l0ZS5oPgoKQWNrZWQtYnk6IEhlcnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29t
PgoKQmVzdCByZWdhcmRzLApIZXJ2w6kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
