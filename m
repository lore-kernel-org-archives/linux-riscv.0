Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB53C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOsjHwQ+6lyYOO314jlzyzBVbrwHzd9S+bH2lQ6masg=; b=at0iHkOWZOzRGD
	ofDig08QHWd0+lpVdFMG+s1nj8o/Jw9O473qzDfEJyQym6OsQ9sTuIC8KkhDQyiTtNR+hzLQURITy
	vvp40h8yCwP5TSQOw2ojH6xnt1kTIYUhvoIbrYlUe4KV1diUUb+jQSF8owq+cXawWXWfNKsDGCag9
	88w0TSDvc/IwZfT+Ejd2x+/dA6WfL2k9vMML/cH+c3g4DtZrFsxjk3cn/uXTmyp0NePc1AwQJzai2
	4DVNkg6eA0KPBBHegtZVs48hIsjN7gTF53AwaSP6vWpRzxvT3pvqcWz3PuCGSfZXx8YzdSvCnVqTn
	+uDtvPnrzBG0pLWaK/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quriF-006yeh-1G;
	Mon, 23 Oct 2023 09:59:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quriC-006ydG-1D;
	Mon, 23 Oct 2023 09:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62E6861ADA;
	Mon, 23 Oct 2023 09:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFCEC433C8;
	Mon, 23 Oct 2023 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698055143;
	bh=U22arOYqMfIQqu6jCSRcueYe91nxdoBeypcQss0QoDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3YJbI7pZYVTAe06UbkqxujhKtqaah2NL9tfHTwTQEZMsSPe5agQXXuqrBJo5BoX/
	 uc4A5nbeARkimGw16qLKxy9+LevqaI85NTl0oCwZYwYXgviKEWw3wrqHYG4KXfzK9y
	 qRQkd8l20uO3aO+aEktE9dQDPhgRu/g3cGgO+di7Nt5rgJm4l7PBpVvgZDvGr439S9
	 GZuLVcUkYP1IYHw8ooUZbxWzJdKAWzJi71e3Pxhzt4yjk3UkDTMFhI0s6RrtgR+EgO
	 a8imxQ5Df23y/y57yeG3A64DslPZs8vrayt3jWFCYGXKBWw5ojm+rbCDDN0vtU6FZQ
	 PM9SETXIWJ+iw==
Date: Mon, 23 Oct 2023 10:58:55 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Samuel Holland <samuel@sholland.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 2/5] leds: sun50i-a100: New driver for the A100
 LED controller
Message-ID: <20231023095855.GH8909@google.com>
References: <20221231235541.13568-1-samuel@sholland.org>
 <20221231235541.13568-3-samuel@sholland.org>
 <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025904_477932_8791F691 
X-CRM114-Status: GOOD (  14.99  )
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

PiBIaSBTYW11ZWwsCj4gCj4gdGhlcmUgYXJlIHR3byBtb3JlIHRoaW5ncyB0byBjaGFuZ2UsIHdo
aWNoIGNhbWUgdXAgcmVjZW50bHkuIFNlZSBiZWxvdy4KPiAKPiBSZWdhcmRzLAo+IEFuZHLDqQo+
IAo+IEFtIFNhbXN0YWcsIGRlbSAzMS4xMi4yMDIyIHVtIDE3OjU1IC0wNjAwIHNjaHJpZWIgU2Ft
dWVsIEhvbGxhbmQ6Cj4gPiBTb21lIEFsbHdpbm5lciBzdW54aSBTb0NzLCBzdGFydGluZyB3aXRo
IHRoZSBBMTAwLCBjb250YWluIGFuIExFRAo+ID4gY29udHJvbGxlciBkZXNpZ25lZCB0byBkcml2
ZSBSR0IgTEVEIHBpeGVscy4gQWRkIGEgZHJpdmVyIGZvciBpdAo+ID4gdXNpbmcKPiA+IHRoZSBt
dWx0aWNvbG9yIExFRCBmcmFtZXdvcmssIGFuZCB3aXRoIExFRHMgZGVmaW5lZCBpbiB0aGUgZGV2
aWNlCj4gPiB0cmVlLgo+ID4gCj4gPiBBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWxAc2hvbGxhbmQub3JnPgo+ID4gLS0tCj4gPiBbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbGVkcy9sZWRzLXN1bjUwaS1hMTAwLmMgYi9kcml2ZXJzL2xlZHMvbGVkcy0KPiA+IHN1bjUw
aS1hMTAwLmMKClsuLi5dCgo+ID4gK3N0cnVjdCBzdW41MGlfYTEwMF9sZWRjIHsKPiA+ICsJc3Ry
dWN0IGRldmljZSAqZGV2Owo+ID4gKwl2b2lkIF9faW9tZW0gKmJhc2U7Cj4gPiArCXN0cnVjdCBj
bGsgKmJ1c19jbGs7Cj4gPiArCXN0cnVjdCBjbGsgKm1vZF9jbGs7Cj4gPiArCXN0cnVjdCByZXNl
dF9jb250cm9sICpyZXNldDsKPiA+ICsKPiA+ICsJdTMyICpidWZmZXI7Cj4gPiArCXN0cnVjdCBk
bWFfY2hhbiAqZG1hX2NoYW47Cj4gPiArCWRtYV9hZGRyX3QgZG1hX2hhbmRsZTsKPiA+ICsJaW50
IHBpb19sZW5ndGg7Cj4gPiArCWludCBwaW9fb2Zmc2V0Owo+ID4gKwo+ID4gKwlzcGlubG9ja190
IGxvY2s7Cj4gPiArCWludCBuZXh0X2xlbmd0aDsKPiA+ICsJYm9vbCB4ZmVyX2FjdGl2ZTsKPiA+
ICsKPiA+ICsJdTMyIGZvcm1hdDsKPiA+ICsJc3RydWN0IHN1bjUwaV9hMTAwX2xlZGNfdGltaW5n
IHRpbWluZzsKPiA+ICsKPiA+ICsJaW50IG51bV9sZWRzOwo+ID4gKwlzdHJ1Y3Qgc3VuNTBpX2Ex
MDBfbGVkY19sZWQgbGVkc1tdOwo+IAo+IEFubm90YXRlIHN0cnVjdCB3aXRoICBfX2NvdW50ZWRf
YnkobnVtX2xlZHMpLgoKQW5kcsOpLCBwbGVhc2UgcmVtZW1iZXIgdG8gc25pcCB5b3VyIHJlcGxp
ZXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
