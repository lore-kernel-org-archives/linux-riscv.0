Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BCD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPzkozjLleJJ8p81kxguUSfkXh6q2kXYoBGycRcKTwE=; b=MjpBpEfrJpqJXH
	cfLkWgAxTIhQaWBO9SbEAJ0hPJYzja2VxBsvxCk1gZRpX66o8fihpe5GbFEulRIMNLe1kEHBiNicN
	Aocm5qdsj3SzdNuEbt4vWju3gaZUWs0yPFLfG1pceeTmie/8VSYMQ7Xo8JuRxRhMiWnhBQhoJVBHY
	UF2eBQior9oU7T5V4VQGoS8bQoxW9QR734/6TTqR1+uQhGapDgDvAABNEQ+Zw+d7YLX2bThgxWAzV
	1hpF7EBqhpxSWBmuCtIKgCXGWlsUW8QCNC1YOtdedO0t0f2e0dy7BrK13o1IPIeP4vSbIzf+DFfGr
	wAdPyWNuQBXSM14QPj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcWW-0000000Giop-15bY;
	Thu, 27 Nov 2025 13:59:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcWV-0000000Giod-1sXg
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 13:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B676601F9;
	Thu, 27 Nov 2025 13:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3B6C113D0;
	Thu, 27 Nov 2025 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764251942;
	bh=RAb5JyI+7Eg8dSIG0pq4NFV6UoD+9rhPIqCdXRp9X6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFQbwjzzwCzmXwWVUfJOe/gvAu/FRjplhO1QM6whjf63EgQ3+FLPH1x3r1W2MZ3+n
	 PfsuBN2TLU11T0HjnkA0gEaBlw4QgDHn02J7gHRir+GDRaR5J6IsqBlsuDpHL/CHKy
	 JYhV6vo9Qzt+F5Av5A/Q7nVfsz27CuJUsZk2bbUKnizoGN0MpVN4tgn/2W0HGS7EOn
	 qH4Bm/A0peR5Q67iT3PT1HxBPDseD+hDsYZohT4xyL/czWq4MUXI6uhGewEwdF09Oo
	 qU1klZ8k4EW/acpCXfRW3Tjjn2q53lexpk0Jj4S5ofFp8qDtCzg7DvZZOTdxizvOpI
	 KkFXXn9Qz1yKg==
Message-ID: <b68f333c-ccf5-4ecb-9d99-05d0f6e36391@kernel.org>
Date: Thu, 27 Nov 2025 14:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
To: Icenowy Zheng <uwu@icenowy.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
 <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
 <b7b9396950cb92c227acef5461941020a282e551.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b7b9396950cb92c227acef5461941020a282e551.camel@icenowy.me>
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

T24gMjcvMTEvMjAyNSAxNDo0NywgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0xMS0y
NuaYn+acn+S4ieeahCAxMToyMiArMDEwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gMjYvMTEvMjAyNSAxMDo1MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4+Pj4gK21haW50
YWluZXJzOgo+Pj4+PiArwqAgLSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPj4+Pj4g
Kwo+Pj4+PiArcHJvcGVydGllczoKPj4+Pj4gK8KgICRub2RlbmFtZToKPj4+Pj4gK8KgwqDCoCBw
YXR0ZXJuOiAiXmRpc3BsYXlAWzAtOWEtZl0rJCIKPj4+Pj4gKwo+Pj4+PiArwqAgY29tcGF0aWJs
ZToKPj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+Pj4gK8KgwqDCoMKgwqAgLSBlbnVtOgo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgIC0gdGhlYWQsdGgxNTIwLWRjODIwMAo+Pj4+PiArwqDCoMKgwqDC
oCAtIGNvbnN0OiB2ZXJpc2lsaWNvbixkYwo+Pj4+Cj4+Pj4gSSBkbyBub3Qgc2VlIGFueSBleHBs
YW5hdGlvbiBvZiBleGNlcHRpb24gZm9yIGdlbmVyaWMKPj4+PiBjb21wYXRpYmxlcywKPj4+PiBt
YXliZQo+Pj4+IGV4Y2VwdCAic2VsZi1pZGVudGlmaWNhdGlvbiIgcmVtYXJrLiBSb2IgYWxyZWFk
eSBwb2ludGVkIHRoaXMKPj4+PiBvdXQsIHNvCj4+Pj4gYmUKPj4+PiBleHBsaWNpdCBpbiBjb21t
aXQgbXNnIHdoeSB5b3UgYXJlIHVzaW5nIGEgZ2VuZXJpYyBjb21wYXRpYmxlLgo+Pj4KPj4+IFdl
bGwgSSBvbmx5IGdldCB0aGUgbWVhbmluZyBvZiAiYSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSBp
cwo+Pj4gcmVxdWlyZWQiCj4+PiBpbiBoaXMgcmV2aWV3IG1lc3NhZ2UuCj4+Pgo+Pj4gSSB0aGlu
ayBteSBiaW5kaW5nIG5vdyByZXF1aXJlcyBib3RoIGEgU29DLXNwZWNpZmljIGNvbXBhdGlibGUg
YW5kCj4+PiBhCj4+PiBnZW5lcmljIGNvbXBhdGlibGUsIHdoaWNoIHNob3VsZCBiZSBva2F5IHRv
IHNhdGlzZnkgUm9iJ3Mgb3JpZ2luYWwKPj4+IHJldmlldy4KPj4KPj4gWW91IHdpbGwgZ2V0IHRo
ZW4gdGhlIHNhbWUgcXVlc3Rpb25zIGZvciBtZSAtIHdoYXQganVzdGlmaWVzIGdlbmVyaWMKPj4g
Y29tcGF0aWJsZS4gWW91IHNob3VsZCBiZSBvbiB0aGlzIGV4cGxpY2l0LCBiZWNhdXNlIG90aGVy
d2lzZSBwZW9wbGUKPj4gbWlzaW50ZXJwcmV0IHNvbWUgY29tbWl0cyBhbmQgcGF0Y2hlcywgYW5k
IHRoZXkgdGhpbmsgdGhlIGdlbmVyaWMKPj4gY29tcGF0aWJsZSBpcyBhbGxvd2VkIGZvciB0aGVt
IGFzIHdlbGwuCj4gCj4gSSBjYW1lIGFjcm9zcyBhIGNvbW1lbnQgb24gTWFsaSBWYWxoYWxsIGJp
bmRpbmdzIHRoYXQgc2F5cyBgTWFsaQo+IFZhbGhhbGwgR1BVIG1vZGVsL3JldmlzaW9uIGlzIGZ1
bGx5IGRpc2NvdmVyYWJsZWAsIGp1c3QgYWZ0ZXIgdGhlCj4gY29tcGF0aWJsZSBzdHJpbmcuCj4g
Cj4gU2hvdWxkIEkgYWRkIGEgY29tbWVudCBsaWtlIHRoaXMsIG9yIHNob3VsZCBJIG1ha2UgdGhp
bmdzIG1vcmUgY2xlYXIgaW4KPiB0aGUgY29tbWl0IG1lc3NhZ2U/CgpKdXN0IHNheSBpbiB0aGUg
Y29tbWl0IG1zZyBpbiB0aGUgc2VudGVuY2UgYWJvdXQgInNlbGYtaWRlbnRpZmljYXRpb24KZmFj
aWxpdHkiIHRoYXQgdGhlcmVmb3JlIHlvdSB1c2UgZ2VuZXJpYyBjb21wYXRpYmxlIChvciAiZ2Vu
ZXJpYwpjb21wYXRpYmxlIGlzIHN1aXRhYmxlIikuCgpQbGVhc2UgdHJpbSB0aGUgY29udGV4dCB3
aGVuIHJlcGx5aW5nLiBMb29rIGJlbG93OgoKPiAKPj4KPj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiAr
wqAgcmVnOgo+Pj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4+ICsKPj4+Pj4gK8KgIGludGVy
cnVwdHM6Cj4+Pj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+Pj4gKwo+Pj4+PiArwqAgY2xvY2tz
Ogo+Pj4+PiArwqDCoMKgIG1pbkl0ZW1zOiA0Cj4+Pj4KPj4+PiBUaGlzIGlzIG5vdCBmbGV4aWJs
ZS4gRGV2aWNlIGVpdGhlciBoYXMgb3IgaGFzIG5vdCB0aGVzZSBjbG9ja3MuCj4+Pgo+Pj4gVGhl
IGV4aXN0ZW5jZSBvZiBhbGwgdGhlc2UgY2xvY2tzIGFyZSB2ZXJpZmllZCBieSBkaWFncmFtcyBp
bgo+Pj4gbWFudWFscwo+Pgo+PiBTbyBub3QgZmxleGlibGUsIHRoZW46Cj4+Cj4+PiBvZiB0d28g
ZGlmZmVyZW50IFNvQ3Mgd2l0aCBEQzgyMDAgKFQtSGVhZCBUSDE1MjAgYW5kIFN0YXJGaXZlCj4+
PiBKSDcxMTApLgo+Pj4KPj4+IE1heWJlIGEgZXhwbGljaXQgYG1heEl0ZW1zOiA1YCBpcyBuZWVk
ZWQgaGVyZSwgYnV0IGFzIG15IERUIHBhc3Nlcwo+Pj4gZHRic19jaGVjaywgSSBkb24ndCB0aGlu
ayBpdCdzIG5lY2Vzc2FyeT8KPj4KPj4gTm8sIGRyb3AgbWluSXRlbXMgb25seS4KPj4KPj4+Cj4+
PiBPciBtYXliZSBJIHNob3VsZCBkcm9wIHRoZSBmbGV4aWJpbGl0eSBub3cgYW5kIHVzZSBhIGBt
aW5JdGVtczogNWAKPj4+IGhlcmUKPj4+IChhbmQgbGVhdmUgREM4MDAwIHN1cHBvcnQgYXMgYW5v
dGhlciBzdG9yeSk/IChUaGUgRXN3aW4gRUlDNzcwMAo+Pj4gbWFudWFsCj4+PiBkb2VzIG5vdCBo
YXZlIGEgZGlhZ3JhbSBzaG93aW5nIGV4dGVybmFsIGNvbm5lY3Rpb25zIG9mIHRoZSBEQywKPj4+
IGxpa2UKPj4+IHRoZSB0d28gU29DcyBJIG1lbnRpb25lZCBhYm92ZSkuCj4+Cj4+IFlvdSBkb2N1
bWVudCBoZXJlIG9ubHkgdGhlIGRldmljZXMgZXhwbGljaXRseSBtZW50aW9uZWQgaW4gdGhlCj4+
IGJpbmRpbmcuCj4+IFlvdSBjYW5ub3QgYWRkIGhlcmUgY29uc3RyYWludHMgb3IgY2xvY2tzIGZv
ciBzb21lIGRldmljZSB3aGljaCBpcwo+PiBub3QKPj4gaW4gdGhlIGJpbmRpbmcgYW5kIEkgc2Vl
IG9ubHkgdGgxNTIwIGluIHRoZSBiaW5kaW5nLgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlz
enRvZgo+IAoKSXMgYWxsIHRoaXMgbmVlZGVkIGZvciBtZT8gSWYgaXQgaXMgdGhlcmUgSSB3aWxs
IHdhc3RlIHRpbWUgc2Nyb2xsaW5nCnRocm91Z2ggaXQgbG9va2luZyBmb3IgeW91ciBxdWVzdGlv
bnMuCgpUaGluayBob3cgeW91ciBwYXRjaHNldCBhbmQgcmVwbGllcyBhcmUgcmVjZWl2ZWQgYnkg
cmV2aWV3ZXIuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
