Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641CEC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkEURxtkexKOGrD4lpc5lWsM6OovyLgMvujMMaSNfpw=; b=Xn8oxVAPWuuLvW
	p6AeYFNZ0fgc3yxJ2arxHZ0mtCIxFn5Mpa3NGDeJ0zfJ+bSTvmNKgPEHIHnwtzPJ57oFJtK9R8yok
	fduneFUBSXYOCNCzqO8uG0/NU1DWMXNm+OIBh3QHPX2DDc0QAIx9abT95RA60bHVjMBKh214gzJnM
	oK2TuJYiP8qkT2h4bm3Dv0RrW/DzAHIdj7p2cFNDEDucJoj4MJ1X8zdYtU1fl3JeP5hqqloXL6YXM
	knJbAGHU1WHhnaZDQReBcYEzX6MyLDJKLllptHQh5dv6o0nyFUEyG9oux8qG/XwJ+lxxDiLS5fDYZ
	i/vRZBjg/IAVxNMk3euA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viomg-00000006WVe-22SN;
	Thu, 22 Jan 2026 07:07:14 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viome-00000006WVI-2zXy
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769065589; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D61q3dsYQwezCD6edk+ndSn3iwSn5gdWuJjY8DAy/4phJTk8YebrJA+yUQjyM4ZBabUwtMTlrC0Cs74bZ2wu0IqKZkKj4BZWw9Xr8L3QYLW/mKie2+O6fq8fmM1+GpMG8HSN3YRcB7AsPfDxs6AKkiV7e4DZ4vCg4OnnwqQCDMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769065589; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RZug1mfLC3nxslvF30V6GeULbXoaXErlTBlHkWNlrgs=; 
	b=WzBvf39bJTDAmX1CIEbZNDEJXLf9Ff7+mCHvllfyE0xWybKeli234KOXobwnjW3wvtjBCnfbPEZXf8w54XWMNFs5Oce4kWH29Bdz9kdtS//7T13nx6VXRA77S2+S/zWqjP9vS8WcQsBjynDl4lMBW9LyhuypXnPu8Q/j4E0JeNM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769065589;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=RZug1mfLC3nxslvF30V6GeULbXoaXErlTBlHkWNlrgs=;
	b=gYxR8J3ZwNLgUgfiV5YtWfHLUog2Stjlmugzb9AvQ4suVKxUD9yfnndRdXKTECyQ
	a3Pi0VVZ7iXErEUAuSO10v2iBuZlK3xjaBHl2E58fLe7tTx5u0HT0RxIq5rm3an5F0h
	xae+AeON3o0UmWAMR/WoI92ozOy7hLGRCLUN4lYpYpy+C9jXCeBzw1q5dER6MCbktBg
	TU3aVfepJ7spwi7iK2aYeLA9CA3Nv60/2TuKQgWN49HGFpyI/pjJ7d0quWf7MODH2oN
	F4JeqCQzJLv1hQbzBmmRouwJX5vDBJSf9tNeU9JCtH/RO33Wh7bzMPPKiQXbU33iM4R
	rc5+MguZKQ==
Received: by mx.zohomail.com with SMTPS id 1769065587973762.0478077895314;
	Wed, 21 Jan 2026 23:06:27 -0800 (PST)
Message-ID: <4afa6f3110790c701c5e24901e9e66560cf21ad0.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 15:06:14 +0800
In-Reply-To: <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_230712_808711_D957BE7F 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgoKPT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09Cj4gPiArCj4g
PiArwqDCoMKgwqDCoMKgwqBpZiAoaXJxcykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwcl93YXJuKCJVbmtub3duIFZlcmlzaWxpY29uIERDIGludGVycnVwdCAweCV4Cj4gPiBm
aXJlZCFcbiIsIGlycXMpOwo+IAo+IEknZCBhdm9pZCBwcl93YXJuKCkgaGVyZS4gVGhpcyBjYW4g
ZmlsbCB5b3VyIGxvZ3MgcXVpY2tseS4KClRoZW4gaXMgcHJfd2Fybl9vbmNlKCkgb2theT8KCj4g
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiArfQoKPT09
PT09PT09PT09PT09IDg8ID09PT09PT09PT09PT09PT09Cgo+ID4gCj4gPiArwqDCoMKgwqDCoMKg
wqAvKiBGaXh1cCBmcmFtZWJ1ZmZlciBhZGRyZXNzIGZvciBzcmMgY29vcmRpbmF0ZXMgKi8KPiA+
ICvCoMKgwqDCoMKgwqDCoGRtYV9hZGRyICs9IChzdGF0ZS0+c3JjLngxID4+IDE2KSAqIGJwcDsK
PiAKPiBicHAgaXMgZGVwcmVjYXRlZCBhbmQgc2hvdWxkIGJlIGF2b2lkZWQgaW4gbmV3IGNvZGUu
IFlvdSBjYW4gY29tcHV0ZQo+IHRoZSAKPiBvZmZzZXQgd2l0aCBkcm1fZm9ybWF0X21pbl9waXRj
aCgpOgo+IAo+IGRybV9mb3JtYXRfbWluX3BpdGNoKGZiLT5mb3JtYXQsIDAsIHN0YXRlLT5zcmMu
eDEgPj4gMTYgKQoKV2VsbCBpdCBzZWVtcyBxdWl0ZSBkaWZmaWN1bHQgdG8gdHJhY2sgd2hhdCdz
IGRlcHJlY2F0ZWQgaW4gdGhlIERSTQpzdWJzeXN0ZW0sIGlzIHRoZXJlIGFueXRoaW5nIGxpa2Ug
YSBidWxsZXRpbj8KCgpUaGFua3MsCkljZW5vd3kKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
