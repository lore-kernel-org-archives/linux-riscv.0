Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFFC61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQMvZoaVfh3KC3p3Shvl+7Pqyr0wqslOys0ABdY4iME=; b=m6fH516lD/owxJ
	7CD+rNA6cVMv4f8J3LcL6l4wQTiG/UMO2nfcLGXqBzRTEa3MYz7Be6mh+8teskt2CGksKQcKGwH9K
	7pz41GpC6ypoXYVJVtQh1MtONqa/rCcD8cikAaf0r6uyZ19pZjtESiaDfAz3AWLVvYo7R+tiIbRsr
	KTv7yI26a7MIRpMB584wiVUzoZ8C6BUk+KEWUrXw1LGWMWrXSdi1qsa+5j5eYUikzewvS+I+4sKyn
	Tcc5aq5Fqk9vXyg6dUggdXY6bP/1zVNGCbxWRvTlf+dLGOuBhagvTFg8yqvcMGT3xSnxi+KcSRv7a
	ZvRUF0wklrIMWVBLULSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Gv-0000000HGiI-157F;
	Thu, 03 Sep 2026 12:10:25 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Gt-0000000HGhe-1Izq;
	Thu, 03 Sep 2026 12:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788437392; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zc6xuJ3xl49VRPhcniB/3ZakchN1aZhf0cfhA9pujCw8BTWIBbuOJNaEZD7FBgBuMmflkIaIj0t/I1Zr5MXrPnXM2ZVpY0kcXn7r1pBHlbdZK9sA3PGFsax4Sg4pYf7q6xx1TV6/7mt0FzHtTziNgdXNZco/t9RBvPg7KKaLJZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788437392; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=udLpqyCAmF5x6NjypD7ZgtL4WKgcLBmXurRxSamaIC8=; 
	b=VX8V98MFSDeLC7wSiSHo3oJo/P3uGJu3G+RCcjOqPG3lTkTQKWcS4997IRLXg5MqrSLEhW1eXMbaSXe+0iCCCRbDi+aJBIckRX9GYBrLTmek3+2RA6Ppo6eLZHtvWTQQCJXs2RSP316zCkNTCtChOYoNduQQdss0ssaYhgd6LX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788437392;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=udLpqyCAmF5x6NjypD7ZgtL4WKgcLBmXurRxSamaIC8=;
	b=hTGjefJujyRPquMYHt1PxDjFJRQiLBSiwixit7f44eOGk/AkBVY7n+YwleID99bG
	SXjZo446kyxFCFYE5T7XX3whUoRj5fh9RteO+romCHm3gMD/o8HfCe8nhTXDAJ+Ss3G
	Cztc9JEW5MTmjIYsLxV2Jfb86fEKSiIc2LtdvEcMRutiARlEeyhQtcf1UYCVQnTHqn2
	1sJ1Pnq5vW46tfI/a9JqouniyOcZDn98v/P0tU8iz/w/Z4YCtm7E00zcIIdJVuSqzgl
	WY/s/rRSl6bZlTxkrFZYdN2EXPX1fiTpaNizRi1NSLxKNV0zNvZ5aPR7GpFJnokQbU9
	Rb8Jd0Klzg==
Received: by mx.zohomail.com with SMTPS id 1788437390405973.4421037897633;
	Thu, 3 Sep 2026 05:09:50 -0700 (PDT)
Message-ID: <576146d4f2752c3c3f6ec6c42812cb9956406383.camel@icenowy.me>
Subject: Re: [PATCH v2 15/17] riscv: dts: spacemit: k3-pico-itx: enable the
 DisplayPort output
From: Icenowy Zheng <uwu@icenowy.me>
To: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan	
 <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Michael
 Turquette	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney	 <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yao Zi
 <me@ziyao.cc>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org
Date: Thu, 03 Sep 2026 20:09:42 +0800
In-Reply-To: <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
	 <20260809-k3-display-v2-15-327d7910bf71@gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_051023_374910_BD3EABC0 
X-CRM114-Status: GOOD (  13.73  )
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

5ZyoIDIwMjYtMDgtMDnml6XnmoQgMjE6MTQgKzA4MDDvvIxDb2R5IEthbmcgdmlhIEI0IFJlbGF5
5YaZ6YGT77yaCj4gRnJvbTogQ29keSBLYW5nIDxjb2R5a2FuZy5oa0BnbWFpbC5jb20+Cj4gCj4g
UGljby1JVFggYnJpbmdzIHRoZSBzZWNvbmQgRFBVJ3Mgb3V0cHV0IHRvIGFuIGV4dGVybmFsIERp
c3BsYXlQb3J0Cj4gY29ubmVjdG9yLiBFbmFibGUgdGhhdCBEUFUgYW5kIHRoZSBEaXNwbGF5UG9y
dCBjb250cm9sbGVyIGl0IGZlZWRzLgoKVGhlIGNvbm5lY3RvciBhdmFpbGFibGUgb24gdGhlIFBp
Y28tSVRYIG1haW5ib2FyZCBpc24ndCBhIERpc3BsYXlQb3J0CnBvcnQgLS0gaXQncyBhIFVTQiBU
eXBlLUMgcG9ydCBpbnN0ZWFkLgoKSSB0aGluayB5b3UgbmVlZCB0byBtb2RlbCB0aGUgVHlwZS1D
IHBvcnQgYW5kIGFsdCBmdW5jdGlvbnMgb2YgaXQuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ29keSBLYW5nIDxjb2R5a2FuZy5oa0BnbWFpbC5jb20+Cj4gCj4gLS0tCj4g
djI6Cj4gLSBubyBjaGFuZ2UKPiAtLS0KPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azMtcGljby1pdHguZHRzIHwgMTEgKysrKysrKysrKysKPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazMtcGluY3RybC5kdHNpIHwgMTEgKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2szLXBpY28taXR4LmR0cwo+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMy1waWNvLWl0eC5kdHMKPiBpbmRleCBiODljMTUyMWU2NjQ5Li42YzMxNDYwOTkwYTc1
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1pdHgu
ZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waWNvLWl0eC5kdHMK
PiBAQCAtNiw2ICs2LDcgQEAKPiDCoCNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4K
PiDCoAo+IMKgI2luY2x1ZGUgImszLmR0c2kiCj4gKyNpbmNsdWRlICJrMy1kaXNwbGF5LmR0c2ki
Cj4gwqAjaW5jbHVkZSAiazMtcGluY3RybC5kdHNpIgo+IMKgCj4gwqAvIHsKPiBAQCAtMjIxLDMg
KzIyMiwxMyBAQCBodWJAMSB7Cj4gwqAmdXNiMl9waHkgewo+IMKgCXN0YXR1cyA9ICJva2F5IjsK
PiDCoH07Cj4gKwo+ICsmZHB1MV9jcnRjMCB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4g
Kwo+ICsmZHAxIHsKPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwlwaW5jdHJsLTAg
PSA8JmRwMV8xX2NmZz47Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGluY3RybC5kdHNpCj4gYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpbmN0cmwuZHRzaQo+IGluZGV4IDNlZTE0NzFmMzc5
ODUuLjJmMzZlYmEyMGYxZWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMy1waW5jdHJsLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0
L2szLXBpbmN0cmwuZHRzaQo+IEBAIC0xMSw2ICsxMSwxNyBAQAo+IMKgI2RlZmluZSBLM19HUElP
KHgpCSh4IC8gMzIpICh4ICUgMzIpCj4gwqAKPiDCoCZwaW5jdHJsIHsKPiArCS9vbWl0LWlmLW5v
LXJlZi8KPiArCWRwMV8xX2NmZzogZHAxLTEtY2ZnIHsKPiArCQlkcDEtcGlucyB7Cj4gKwkJCXBp
bm11eCA9IDxLM19QQURDT05GKDI0LCA2KT47CS8qIGRwMSBocGQKPiAqLwo+ICsKPiArCQkJYmlh
cy1kaXNhYmxlOwo+ICsJCQlkcml2ZS1zdHJlbmd0aCA9IDwyNT47Cj4gKwkJCXBvd2VyLXNvdXJj
ZSA9IDwzMzAwPjsKPiArCQl9Owo+ICsJfTsKPiArCj4gwqAJZ21hYzBfcmdtaWlfMF9jZmc6IGdt
YWMwLXJnbWlpLTAtY2ZnIHsKPiDCoAkJZ21hYzAtcmdtaWktMC1waW5zIHsKPiDCoAkJCXBpbm11
eCA9IDxLM19QQURDT05GKDAsIDEpPiwJLyoKPiBnbWFjMF9yeGR2ICovCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
