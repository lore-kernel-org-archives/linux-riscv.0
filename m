Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B9CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTEdgOJIGnoyI935TbvyU2rVCbovDYyzTx16IAHBCxs=; b=jllCTUTjcOoTt7
	n+m3rzTubA4sFP0ilp9uNIRNEU/4hEnyfGZh94ecy35hPMdonUtWjLXSWTJP5NpDyqF+32XemALXC
	oS9TobK10kFpPNuAHhdepPuisWC/wkzwvgqh1H7t9rvWKjjOojpmlEu4sM+U5zEMHYclr1jRsWJ3x
	x26l5h5rExk80SasC0kahmeQZg2thIF0yZSA5RbTHcwKDDfq9DP+/xwnHBNAQ0wElxkFT5+NC45VI
	RuIDNhzKW+SwkaY4HKfMD8xWm6uX7v9Ic9hHl3+nMvfEr13zaaD41n9W12p373p78N02nlbylQrus
	Ba87TSBVZBgJRm8m93Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVMa-0000000BbdB-0SRr;
	Mon, 24 Nov 2025 12:08:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVMX-0000000Bbcf-2lF9
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 12:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259B143607;
	Mon, 24 Nov 2025 12:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26116C4CEF1;
	Mon, 24 Nov 2025 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763986088;
	bh=BK36MAEJuDGA8xCUbi5uV6SdGxtBTUEwgV9d+J8J3ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nwGIdvW8IyvEp8mfQnfURWSU31gP0V3FdpnOyBtBrI5wzx3/RN4TL+h9iBHkpFFX4
	 DNJW3yM5IGpH9vzUGuwxFJEPs6CpU6Hg1hVckJFOwVg7WmdWZgpM7Qp1bELq0GEB5s
	 egfboSQSGHjGq0nysqL4sEPuPV52+0gzVykKg5UJyxfBiPYDeh0CshfksuQUAHgdL+
	 HVTBiFd2iPr+K1nX+W7NWX3QJIDVr7TZHOKAu0EdrGs4Qr6tYRcjJLoO1pbM8aN+Ca
	 VBpnvQw4RhqkXpyXorBnOKFrOZNxHn71DuGYxWUWFMxobON4DyTQKbVy2y2YcTN55y
	 AzANfBkmUt2Vg==
Message-ID: <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
Date: Mon, 24 Nov 2025 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
To: Conor Dooley <conor@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
 <20251124-said-overvalue-8a8f49d6c99d@spud>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251124-said-overvalue-8a8f49d6c99d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_040809_738713_B60A4B12 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjQvMTEvMjAyNSAxMzowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIE1vbiwgTm92IDI0
LCAyMDI1IGF0IDEyOjI3OjA5UE0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+
IE9uIDI0LzExLzIwMjUgMTI6MTMsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+PiDlnKggMjAyNS0x
MS0yNOaYn+acn+S4gOeahCAxMjowOSArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPv
vJoKPj4+PiBPbiAyNC8xMS8yMDI1IDEyOjA0LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+Pj4+PiDl
nKggMjAyNS0xMS0yNOaYn+acn+S4gOeahCAxMjowMSArMDEwMO+8jEtyenlzenRvZiBLb3psb3dz
a2nlhpnpgZPvvJoKPj4+Pj4+IE9uIDI0LzExLzIwMjUgMTE6NTIsIEljZW5vd3kgWmhlbmcgd3Jv
dGU6Cj4+Pj4+Pj4gVmVyaXNpbGljb24gaGFzIGEgc2VyaWVzIG9mIGRpc3BsYXkgY29udHJvbGxl
cnMgcHJlZml4ZWQgd2l0aAo+Pj4+Pj4+IERDCj4+Pj4+Pj4gYW5kCj4+Pj4+Pj4gd2l0aCBzZWxm
LWlkZW50aWZpY2F0aW9uIGZhY2lsaXR5IGxpa2UgdGhlaXIgR0Mgc2VyaWVzIEdQVXMuCj4+Pj4+
Pj4KPj4+Pj4+PiBBZGQgYSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciBpdC4KPj4+Pj4+Pgo+Pj4+
Pj4+IERlcGVuZHMgb24gdGhlIHNwZWNpZmljIERDIG1vZGVsLCBpdCBjYW4gaGF2ZSBlaXRoZXIg
b25lIG9yIHR3bwo+Pj4+Pj4+IGRpc3BsYXkKPj4+Pj4+PiBvdXRwdXRzLCBhbmQgZWFjaCBkaXNw
bGF5IG91dHB1dCBjb3VsZCBiZSBzZXQgdG8gRFBJIHNpZ25hbCBvcgo+Pj4+Pj4+ICJEUCIKPj4+
Pj4+PiBzaWduYWwgKHdoaWNoIHNlZW1zIHRvIGJlIHNvbWUgcGxhaW4gcGFyYWxsZWwgYnVzIHRv
IEhETUkKPj4+Pj4+PiBjb250cm9sbGVycykuCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+Pj4+Pj4KPj4+Pj4+IFdyb25nIERDTyBj
aGFpbiBvcmRlci4gWW91IHNlbmQgaXQgYXMgaWNlbm93eS5tZSwgc28gdGhpcyBtdXN0IGJlCj4+
Pj4+PiBsYXN0Cj4+Pj4+PiBTb0IuIFRoaXMgaWRlbnRpdHkgaXMgdGhlIGxhc3Qgb25lIGNlcnRp
ZnlpbmcgRENPLiBQbGVhc2Uga2luZGx5Cj4+Pj4+PiByZWFkCj4+Pj4+PiBzdWJtaXR0aW5nIHBh
dGNoZXMsIHNvIHlvdSBrbm93IHdoYXQgeW91IGFyZSBjZXJ0aWZ5aW5nIGhlcmUuCj4+Pj4+Cj4+
Pj4+IFdlbGwgSSBtYXBwZWQgdGhlIEBpc2Nhcy5hYy5jbiBtYWlsIHRvIHRoZSBAaWNlbm93eS5t
ZSBvbmUgaW4gdGhlCj4+Pj4+IGxhc3QKPj4+Pj4gcGF0Y2guCj4+Pj4+Cj4+Pj4+IE9yIG1heWJl
IEkgc2hvdWxkIG1ha2UgaXQgdGhlIGZpcnN0IHBhdGNoPwo+Pj4+Cj4+Pj4gLm1haWxtYXAgaGFz
IGVmZmVjdCBvbiBiNCBhbmQgZ2l0IHNlbmQtZW1haWwsIHNvIG1heWJlIHRoYXQncyB0aGUKPj4+
PiBhbnN3ZXIuIFRoZSBwcm9ibGVtIGlzIHRoYXQ6Cj4+Pj4gMS4gVGhpcyBlbWFpbCBoYXMgc2Vu
ZGVyIGFkZHJlc3MgQGljZW5vd3kubWUKPj4+PiAyLiBJdCdzIFNvQiBpcyBub3QgdGhlIGxhc3Qg
b25lLgo+Pj4KPj4+IFdlbGwsIEkgdGhpbmsgYSBwYXRjaCB0aGF0IGlzIGFscmVhZHkgc2VudCBz
aG91bGRuJ3QgaGF2ZSB0aGUgRnJvbQo+Pj4gZmllbGQgY2hhbmdpbmcgd2hlbiBidW1waW5nIHJl
dmlzaW9uLCBhbmQgYSBwYXRjaCBtb2RpZmllZCBieSBvbmUKPj4+IGlkZW50aXR5IHNob3VsZCBo
YXZlIHRoZSBtb2RpZnlpbmcgb25lJ3MgU29CIGFkZGVkLgo+Pj4KPj4+IFNvIGhlcmUgSSBhbSB1
c2luZyB0aGUgQGljZW5vd3kubWUgbWFpbCAod2hpY2ggY2FuIHJlcHJlc2VudCB0aGUKPj4+IEBp
c2Nhcy5hYy5jbiBtYWlsIGFjY29yZGluZyB0byB0aGUgbWFpbG1hcCkgdG8gc2VuZCB0aGUgcGF0
Y2ggdGhhdCBpcwo+Pj4gcHJvY2Vzc2VkIGJ5IEBpc2Nhcy5hYy5jbiBtYWlsLgo+Pj4KPj4+IFNl
bmRpbmcgdGhlIHBhdGNoIHdpdGggQGlzY2FzLmFjLmNuIG1haWwgbmVlZHMgc29tZSBleHRyYSBz
ZXR1cAo+Pj4gKGJlY2F1c2Ugb2Ygc29tZSB3ZWlyZCBzZWN1cml0eSByZXF1aXJlbWVudCkuCj4+
Cj4+IEkgZGlkIG5vdCBhc2sgeW91IHRvIGNoYW5nZSBmcm9tLiBQbGVhc2UgcmVhZCBjYXJlZnVs
bHkgIllvdSBzZW5kIGl0IGFzCj4+IGljZW5vd3kubWUsIHNvIHRoaXMgbXVzdCBiZSBsYXN0IHNv
YiIKPj4KPj4gYW5kIGxhdGVyIEkgcmUtaXRlcmF0ZWQuCj4+Cj4+IElmIHlvdSBpbnNpc3Qgb24g
bm90IGZpeGluZyB0aGUgY2hhaW4sIHRoYXQncyBhIE5BSyBmcm9tIG1lIGJlY2F1c2UgeW91Cj4+
IG11c3QgZm9sbG93IHRoZSBEQ08gcHJvY2Vzcy4KPiAKPiBJIGRvbid0IHJlYWxseSBnZXQgd2hh
dCB0aGUgZnVzcyBpcyB3aXRoIHRoZSBkdWFsIHNpZ25vZmYsIHdoYXQncyB0aGUKPiBwb2ludCBo
YXZpbmcgYm90aCB3aGVuIHRoZXkgcmVwcmVzZW50IHRoZSBzYW1lIHBlcnNvbj8gUHJldHR5IHN1
cmUgaXQKPiB3YXMgeW91IChLcnp5c3p0b2YpIGFuZCBBcm5kIHRoYXQgdG9sZCBtZSBub3QgdG8g
Ym90aCBkb2luZyB0aGUgZG91YmxlCj4gc2lnbm9mZi4KCkkgZG8gbm90IG9iamVjdCBoYXZpbmcg
b3Igbm90IGhhdmluZyBkdWFsIHNpZ25lZCBvZmYgSEVSRS4KCkkgbmV2ZXIgc2FpZCB0aGF0LiBK
dXN0IGxpa2UgSSBuZXZlciBzYWlkICJGcm9tIiBoYXMgdG8gYmUgY2hhbmdlZC4KClNvIHJlcGVh
dGluZyBUSElSRCB0aW1lOiBzZW5kZXIncyBTb0IgY2Fubm90IGJlIHNvbWV3aGVyZSBlbHNlIHRo
YW4gdGhlCmxhc3Qgb25lLgoKLi4uIGFuZCBiZWZvcmUgeW91IGF0dHJpYnV0ZSBtZSBhbm90aGVy
IHRoaW5nIEkgZGlkIG5vdCBzYXkgLSBpZiB5b3UKY2hhbmdlIHRoZSAiRnJvbSIgZmllbGQsIHJ1
bGVzIHdpbGwgYmUgZGlmZmVyZW50IGEgYml0Li4uCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
