Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BEFC9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EJ4iIRDGMq9dOdn2jRPlaY8dob2Uui7n3JHBBFhxaE=; b=pkJBEUOXfQ5B+v
	7f4lggH6/YIvlIbEyw3P6LxEgFFHZnymf99iBlpPt9rduZPDi6xNvbd0BQMoRLEHK3OfE5KVHqa2G
	VI6MEnizn/hGaDRZMPFyOdoN8eQHOYKa8wDWsPm4ZJiFhcXm7w5TVf/hel/9h1lL+ks0P22eyNbWw
	SIDCioxq5tUJVJ2y4wZO5BFDRrxXsawpo0Zc8Y2VKM7rHF3WPc4yMrtUlpduY3gPA8fSvUhpfd+Uu
	CurWmGdZnS+A/FStGLo9f49ymkM9TPJkOm6oKrEhlPT3MgMpIR+3wZhXXS5drHqZeowqLVc/QXRgg
	6l16+7IaR4O5nhw6zoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqmV-0000000GW2D-1ZvB;
	Sun, 27 Sep 2026 15:27:11 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqmR-0000000GW1T-0NcL;
	Sun, 27 Sep 2026 15:27:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z;
	Sun, 27 Sep 2026 15:26:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790522818;
	bh=552yr90urBhvBvN6cAihy9SNDNfGhvxsBdcKYn8Bqkg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gjg9eQOWA0CxY3ngNhBHqtz1JM3KKcYnvAXf1eQWIfGbzS+ettayDylBqirZGSDZ0
	 4/LXiCaTIPkLLVpd5a2xD3aFHM5RQsqbdNfRkqEjajd72YE31sUYSbxWhMeTWRmQ+F
	 TWdrCd/edX3NzOp1vM2aOWlWptW3UGr6cosY45Yg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa~ZNwPrSQNF0222902229eucas1p1j;
	Sun, 27 Sep 2026 15:26:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152655eusmtip1c51d14fba318ce4acae93d017ad71be3~ZNwOCLRV_3134331343eusmtip1g;
	Sun, 27 Sep 2026 15:26:55 +0000 (GMT)
Message-ID: <a74ccc09-ed64-4915-ab85-232c6d953c3d@samsung.com>
Date: Sun, 27 Sep 2026 17:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/20] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>, Chaoyi Chen
	<chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
X-CMS-MailID: 20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa
X-Msg-Generator: CA
X-RootMTR: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
X-EPHeader: CA
X-CMS-RootMailID: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
	<1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_082707_746469_4CE1872C 
X-CRM114-Status: GOOD (  14.44  )
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

CgpPbiA5LzE4LzI2IDA3OjU4LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LTA5LTE1
5LqM55qEIDE3OjMyICswMjAw77yMTWljaGFsIFdpbGN6eW5za2nlhpnpgZPvvJoKPj4gVGhlIEpI
NzExMCBlbWJlZHMgYSBEQzgyMDAuIFRoZSBiaW5kaW5nIHJlcXVpcmVzIGFuIFNvQyBzcGVjaWZp
Ywo+PiBjb21wYXRpYmxlIGFoZWFkIG9mIHRoZSBnZW5lcmljIG9uZSwgc28gYWRkIHRoZSBKSDcx
MTAgdG8gdGhlIGVudW0uCj4+Cj4+IFJldmlld2VkLWJ5OiBKb3NodWEgUGVpc2FjaCA8anBlaXNh
Y2hAdWJ1bnR1LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sIHwgMSArCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdAo+PiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLGRjLnlhbWwKPj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1s
Cj4+IGluZGV4Cj4+IDkxOWE5MDAxMjIwMTIwMDU0Y2I2MmQxZDAxYjcyOTMzNjcyNjZmOTUuLjA1
YTIwMjYzM2NkMjczZmVjMzU4YzA5NWM2NAo+PiA1ODRkOTU5ZDk2ZDkwIDEwMDY0NAo+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixk
Yy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3ZlcmlzaWxpY29uLGRjLnlhbWwKPj4gQEAgLTE2LDYgKzE2LDcgQEAgcHJvcGVydGllczoKPj4g
ICAgY29tcGF0aWJsZToKPj4gICAgICBpdGVtczoKPj4gICAgICAgIC0gZW51bToKPj4gKyAgICAg
ICAgICAtIHN0YXJmaXZlLGpoNzExMC1kYzgyMDAKPiAKPiBOb3RlOiB0aGlzIGJpbmRpbmcgaXMg
YmVpbmcgcmVmYWN0b3JlZCBhcyBwYXJ0IG9mIE1BMzVEMSBzdXBwb3J0Cj4gaW50cm9kdWN0aW9u
ICh0aGlzIFNvQyBoYXMgYSBzaW5nbGUtcG9ydCBEQyBsaWtlIGEgREM4MDAwKSwgYWZ0ZXIgdGhl
Cj4gcmVmYWN0b3IgdGhlIGJpbmRpbmcgc3RyaW5nIG1pZ2h0IG5lZWQgdG8gYXBwZWFyIHR3aWNl
Lgo+IAo+IFRoYW5rcywKPiBJY2Vub3d5CgpIaSwKVGhhbmsgeW91IGZvciBsZXR0aW5nIG1lIGtu
b3cuIEkndmUgZm91bmQgdGhlIHBhdGNoc2V0IG9uIHRoZSBtYWlsaW5nCmxpc3QgWzFdLiBXaWxs
IG1ha2Ugc3VyZSB0byByZWJhc2UgKGFuZCBmaXgpIGFmdGVyIGl0IGdldHMgaW4KKHByZXN1bWFi
bHkgYmVmb3JlIHRoaXMgb25lIGFsdGhvdWdoIEknbSBub3QgMTAwJSBzdXJlKS4KClsxXSAtIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkxODAzMDEyNS4zMTU5NzgtMi1hMDk4NzIw
MzA2OUBnbWFpbC5jb20vCgoKPiAKPj4gICAgICAgICAgICAtIHRoZWFkLHRoMTUyMC1kYzgyMDAK
Pj4gICAgICAgIC0gY29uc3Q6IHZlcmlzaWxpY29uLGRjICMgREMgSVBzIGhhdmUgZGlzY292ZXJh
YmxlIElEL3JldmlzaW9uCj4+IHJlZ2lzdGVycwo+PiAgCj4gCj4gCgpCZXN0IHJlZ2FyZHMsCi0t
IApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
