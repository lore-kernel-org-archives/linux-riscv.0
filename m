Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EBECD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6y9buKYFJVNQlpFeOOXDiB1BNqQ9CjipOkqeovXFE2s=; b=M2tY+u6FRrQn/E
	sXt1JqU7w0C9sIwzVO1LO8YCpeW/IrSAZxQCMzt8Q/fxEJHGpVNrsFQvbXOqMG9xx6sfjd5CiDP6e
	le5N4xa2h5WIUjlHlcwr6POyCK5vXjsRoE8hNrC+2MwNn8Kj7s0wUitdgLmSjpW8jnVysaLRqqCFY
	UYcC7swyXGz30c1hWghtqmiR/GYz7o6vbIN2IoX46OVfxveLWhLcWrhD3ZZHRa+JuvWpWZ9VvHTu7
	p6saP/F5JPqTmZkRo6syG2DxD5e5mO/tain8e3hPQpDonA1GCwWBKdn7gq4EXPQ0KHDcpYwWhVix5
	QQ771lmUIFaCqpzjUrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdva-0000000BHju-09fc;
	Tue, 02 Apr 2024 13:11:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdvJ-0000000BHWB-0Imp;
	Tue, 02 Apr 2024 13:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16DE360FE3;
	Tue,  2 Apr 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE50C433F1;
	Tue,  2 Apr 2024 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712063486;
	bh=9zAsnZKUtdaB+0oUBoSFWoiBkfOWRDSb/L5GPa9FOno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLBmLWbFq8b7R4iZ1CSvRnROpQc318dtdynLw3zTplx/2SSnxsPhnBaGB0KWLxJLw
	 gtTVGsvy4tfXtBGJpBXwq9+p3MCPwkvK/hDkMvCwjFUh5usnZu6XFTibfhvcKn+2H6
	 bNq+gdNLc+F4UpxqMWgGKmEwi+KPVyCSJwAIqsT2U4GGmN/LnMTaAplp/AjMnXlBu3
	 Ft/ordeAQQOyjQYy8NAB2+7Nq/5pKWCsboYnCGnNR1VKTyBFWEf/lcch7254rsWnWE
	 MLVvNT3x0cyP38rdvhtkwlombEcbUi6JLHcn3CjFq0MSnQTG+8Cf+UPPNEYFD7jwHP
	 CjyG1mwKRgoUQ==
Date: Tue, 2 Apr 2024 18:41:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, marcan@marcan.st,
	sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, wens@csie.org,
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgwD-iScEb9zzB8H@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
 <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_061136_004961_9C8FDAE9 
X-CRM114-Status: GOOD (  17.64  )
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

T24gMDItMDQtMjQsIDE0OjI1LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIEFsbGVuLAo+IAo+
IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCA1OjAz
4oCvUE0gQWxsZW4gUGFpcyA8YXBhaXNAbGludXgubWljcm9zb2Z0LmNvbT4gd3JvdGU6Cj4gCj4g
PiBUaGUgb25seSBnZW5lcmljIGludGVyZmFjZSB0byBleGVjdXRlIGFzeW5jaHJvbm91c2x5IGlu
IHRoZSBCSCBjb250ZXh0IGlzCj4gPiB0YXNrbGV0OyBob3dldmVyLCBpdCdzIG1hcmtlZCBkZXBy
ZWNhdGVkIGFuZCBoYXMgc29tZSBkZXNpZ24gZmxhd3MuIFRvCj4gPiByZXBsYWNlIHRhc2tsZXRz
LCBCSCB3b3JrcXVldWUgc3VwcG9ydCB3YXMgcmVjZW50bHkgYWRkZWQuIEEgQkggd29ya3F1ZXVl
Cj4gPiBiZWhhdmVzIHNpbWlsYXJseSB0byByZWd1bGFyIHdvcmtxdWV1ZXMgZXhjZXB0IHRoYXQg
dGhlIHF1ZXVlZCB3b3JrIGl0ZW1zCj4gPiBhcmUgZXhlY3V0ZWQgaW4gdGhlIEJIIGNvbnRleHQu
Cj4gPgo+ID4gVGhpcyBwYXRjaCBjb252ZXJ0cyBkcml2ZXJzL2RtYS8qIGZyb20gdGFza2xldCB0
byBCSCB3b3JrcXVldWUuCj4gPgo+ID4gQmFzZWQgb24gdGhlIHdvcmsgZG9uZSBieSBUZWp1biBI
ZW8gPHRqQGtlcm5lbC5vcmc+Cj4gPiBCcmFuY2g6IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90ai93cS5naXQgZm9yLTYuMTAKPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGxlbiBQYWlzIDxhbGxlbi5sa21sQGdtYWlsLmNvbT4KPiAoLi4uKQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hL3N0ZV9kbWE0MC5jIGIvZHJpdmVycy9kbWEvc3RlX2RtYTQwLmMK
PiAoLi4uKQo+ID4gICAgICAgICBpZiAoZDQwYy0+cGVuZGluZ190eCkKPiA+IC0gICAgICAgICAg
ICAgICB0YXNrbGV0X3NjaGVkdWxlKCZkNDBjLT50YXNrbGV0KTsKPiA+ICsgICAgICAgICAgICAg
ICBxdWV1ZV93b3JrKHN5c3RlbV9iaF93cSwgJmQ0MGMtPndvcmspOwo+IAo+IFdoeSBpcyAibXki
IGRyaXZlciBub3QgYWxsb3dlZCB0byB1c2Ugc3lzdGVtX2JoX2hpZ2hwcmlfd3E/Cj4gCj4gSSBj
YW4ndCBzZWUgdGhlIHJlYXNvbmluZyBiZXR3ZWVuIHNvbWUgZHJpdmVycyB1c2luZyBzeXN0ZW1f
Ymhfd3EKPiBhbmQgb3RoZXJzIGJlaW5nIGhpZ2hwcmk/Cj4gCj4gR2l2ZW4gdGhlIERNQSB1c2Vj
YXNlIEkgd291bGQgZXhwZWN0IHRoZW0gYWxsIHRvIGJlIGhpZ2ggcHJpby4KCkl0IGRpZG50IHVz
ZSB0YXNrbGV0X2hpX3NjaGVkdWxlKCksIEkgZ3Vlc3MgQWxsZW4gaGFzIGRvbmUgdGhlCmNvbnZl
cnNpb24gb2YgdGFza2xldF9zY2hlZHVsZSAtPiBzeXN0ZW1fYmhfd3EgYW5kIHRhc2tsZXRfaGlf
c2NoZWR1bGUKLT4gc3lzdGVtX2JoX2hpZ2hwcmlfd3EKCkFueXdheSwgd2UgYXJlIGdvaW5nIHRv
IHVzZSBhIGRtYSBxdWV1ZSBzbyBzaG91bGQgYmUgYmV0dGVyIHBlcmZvcm1hbmNlCgotLSAKflZp
bm9kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
