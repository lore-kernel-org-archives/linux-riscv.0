Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC82E77171
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQXmPJw2hTOkXlqE2jt68++PnH0PWnUTDL2K3cshL70=; b=jV91bEWbdLZHR3
	a5Lt/hgpZiq24caIE+FfXGPtIVFOts6peqrwdJxh/Vv4qOJcxtw0LkhzHTCfK3Tqlv1Jkjos984xK
	ur7UBGr7NB7VCTVLQYSl3rHb3z0JvluxS2bqpUHZmLwwuWVCOCH7FvB6k1d4NIukCGe/zGplWb1Vq
	EVL0l+K4n1/yv2jl9bZlLEXX5WEDNjW0ayRjr949Ljagaj3Mnqbebp9QgbQWD/F6XN/OpDlbF0k8h
	MOdPSiTNrDu42ny3RfBTLFPc4OZVQAGYZdNSYFT82I75/tEKOg3HHZqWdQfn0cwF/bpjxvc4UqiV3
	ZSS4SoqYWO+H9NXrYH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Ki-0000000F15e-3C8l;
	Thu, 05 Dec 2024 07:31:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6Kf-0000000F14N-2VDc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 07:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3347B5C563A;
	Thu,  5 Dec 2024 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC662C4CED1;
	Thu,  5 Dec 2024 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733383888;
	bh=tl7z5khqHwgfmMC1yiN0DCsWW590Zda7OF1raNXX9wo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e4S6usSuH5khmzNH0uwBG77QC78odPh/2kq0qMDeGd/ANo+7o2nuziV3Jq2mSUKpf
	 dYh0PvwQehqhnJyfTH3JzGBmNODJ3u2eAe148ta1ZpfjuBKmVMLPV4NocVHUKWoVjq
	 47LRw2chq/03glgPtpgZXYl56+3EnT6q6xyJn9sTqzfZ48rgWzZmnLyyw4+uiPb8Z3
	 8bee0JOBwaP+qne5ecQ3OM4X//OzcNyaQoh8nCp1Qan5gXLNjtt4b1rpc52tBzQ9OD
	 5o1V2PKEQhmjkiZvIZH3ExgEzAXYvfmGOHDhvJiqDnUjXCX2xfcJdJyJ+DQQSyx7c2
	 QzyjbZrPQP62g==
Message-ID: <5206c6a1-0473-40c2-b651-5dbca1204729@kernel.org>
Date: Thu, 5 Dec 2024 08:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/14] clk: thead: Refactor TH1520 clock driver to
 share common code
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, airlied@gmail.com, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, drew@pdp7.com, frank.binns@imgtec.com,
 guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org,
 krzk+dt@kernel.org, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com,
 mripard@kernel.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134150eucas1p24ba8d2fbf2af5b8f9abe503b4334127d@eucas1p2.samsung.com>
 <20241203134137.2114847-2-m.wilczynski@samsung.com>
 <94a57c718a09a20d148101884bf2e5f2.sboyd@kernel.org>
 <94356242-7c94-4da5-a9ad-684d03ddedd6@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <94356242-7c94-4da5-a9ad-684d03ddedd6@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_233129_721098_2B214BF7 
X-CRM114-Status: GOOD (  16.12  )
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

T24gMDQvMTIvMjAyNCAxNDo1NCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
MTIvMy8yNCAyMDo1NiwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+PiBRdW90aW5nIE1pY2hhbCBXaWxj
enluc2tpICgyMDI0LTEyLTAzIDA1OjQxOjI0KQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3RoZWFkL01ha2VmaWxlIGIvZHJpdmVycy9jbGsvdGhlYWQvTWFrZWZpbGUKPj4+IGluZGV4IDdl
ZTBiZWMxZjI1MS4uZDdjZjg4MzkwYjY5IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvdGhl
YWQvTWFrZWZpbGUKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL3RoZWFkL01ha2VmaWxlCj4+PiBAQCAt
MSwyICsxLDIgQEAKPj4+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+PiAt
b2JqLSQoQ09ORklHX0NMS19USEVBRF9USDE1MjBfQVApICs9IGNsay10aDE1MjAtYXAubwo+Pj4g
K29iai0kKENPTkZJR19DTEtfVEhFQURfVEgxNTIwX0FQKSArPSBjbGstdGgxNTIwLm8gY2xrLXRo
MTUyMC1hcC5vCj4+Cj4+IENhbiB0aGUgLWFwIGRyaXZlciBiZSBleHRlbmRlZCBpbnN0ZWFkPyBP
ciBhcmUgdGhlIGNsa3MgaW4gYSBkaWZmZXJlbnQKPj4gSU8gcmVnaW9uPwo+IAo+IFRoZSBWaWRl
byBPdXRwdXQgKFZPKSBjbG9ja3MgcmVzaWRlIGluIGEgZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2Ug
YXMKPiBkZWZpbmVkIGluIHRoZSBULUhFQUQgbWFudWFsIDQuNC4xIFsxXS4gVGhlcmVmb3JlLCBj
cmVhdGluZyBhIHNlcGFyYXRlCj4gZHJpdmVyIG1hZGUgc2Vuc2UgdG8gbWFpbnRhaW4gY2xhcml0
eSBhbmQgYWRoZXJlIHRvIHRoZSBleGlzdGluZwoKVGhlcmUgaXMgbm8gc3VjaCBydWxlLCBubyBj
b252ZW50aW9uIGV2ZW4uIEJ1dCB0aGVyZSBpcyBhIHJ1bGUgYW5kCmNvbnZlbnRpb24gb2YgcmUt
dXNpbmcgZHJpdmVycy4KCj4gY29udmVudGlvbiBvZiBoYXZpbmcgb25lIGRyaXZlciBwZXIgc3Vi
c3lzdGVtLCBzaW1pbGFyIHRvIHRoZQoKWW91IGhhdmUgaGVyZSB0d28gZHJpdmVycyBwZXIgc3Vi
c3lzdGVtLCBzbyBldmVuIGlmIHRoZXJlIHdhcyBzdWNoIGEKcnVsZSwgeW91IGp1c3QgYnJva2Ug
aXQuCgo+IEFQLXNwZWNpZmljIGRyaXZlci4KPiAKPiBbMV0gLSBodHRwczovL29wZW5iZWFnbGUu
b3JnL2JlYWdsZXYtYWhlYWQvYmVhZ2xldi1haGVhZC8tL2Jsb2IvbWFpbi9kb2NzL1RIMTUyMCUy
MFN5c3RlbSUyMFVzZXIlMjBNYW51YWwucGRmCj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jIGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1h
cC5jCj4+PiBpbmRleCAxN2UzMmFlMDg3MjAuLmE2MDE1ODA1Yjg1OSAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+Pj4gKysrIGIvZHJpdmVycy9jbGsv
dGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4+PiBAQCAtNSwyOTcgKzUsOSBAQAo+Pj4gICAqICBBdXRo
b3JzOiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KPj4+ICAgKi8KPj4+ICAKPj4+IC0j
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svdGhlYWQsdGgxNTIwLWNsay1hcC5oPgo+Pgo+PiBQ
cmVzdW1hYmx5IHRoaXMgc2hvdWxkIHN0YXkgaGVyZS4KPj4KPj4+IC0jaW5jbHVkZSA8bGludXgv
Yml0ZmllbGQuaD4KPj4+IC0jaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Cj4+PiAtI2lu
Y2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+Pj4gLSNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4+
IC0jaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+PiAtI2luY2x1ZGUgPGxpbnV4
L3JlZ21hcC5oPgo+PgoKLi4uCgo+Pj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGNjdV9jb21tb24g
Kmh3X3RvX2NjdV9jb21tb24oc3RydWN0IGNsa19odyAqaHcpCj4+PiArewo+Pj4gKyAgICAgICBy
ZXR1cm4gY29udGFpbmVyX29mKGh3LCBzdHJ1Y3QgY2N1X2NvbW1vbiwgaHcpOwo+Pj4gK30KPj4+
ICsKPj4+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBjY3VfbXV4ICpod190b19jY3VfbXV4KHN0cnVj
dCBjbGtfaHcgKmh3KQo+Pj4gK3sKPj4+ICsgICAgICAgc3RydWN0IGNjdV9jb21tb24gKmNvbW1v
biA9IGh3X3RvX2NjdV9jb21tb24oaHcpOwo+Pj4gKwo+Pj4gKyAgICAgICByZXR1cm4gY29udGFp
bmVyX29mKGNvbW1vbiwgc3RydWN0IGNjdV9tdXgsIGNvbW1vbik7Cj4+PiArfQo+Pj4gKwo+Pj4g
K3N0YXRpYyBpbmxpbmUgc3RydWN0IGNjdV9wbGwgKmh3X3RvX2NjdV9wbGwoc3RydWN0IGNsa19o
dyAqaHcpCj4+PiArewo+Pj4gKyAgICAgICBzdHJ1Y3QgY2N1X2NvbW1vbiAqY29tbW9uID0gaHdf
dG9fY2N1X2NvbW1vbihodyk7Cj4+PiArCj4+PiArICAgICAgIHJldHVybiBjb250YWluZXJfb2Yo
Y29tbW9uLCBzdHJ1Y3QgY2N1X3BsbCwgY29tbW9uKTsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgY2N1X2RpdiAqaHdfdG9fY2N1X2RpdihzdHJ1Y3QgY2xrX2h3ICpodykK
Pj4+ICt7Cj4+PiArICAgICAgIHN0cnVjdCBjY3VfY29tbW9uICpjb21tb24gPSBod190b19jY3Vf
Y29tbW9uKGh3KTsKPj4+ICsKPj4+ICsgICAgICAgcmV0dXJuIGNvbnRhaW5lcl9vZihjb21tb24s
IHN0cnVjdCBjY3VfZGl2LCBjb21tb24pOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW5saW5l
IHN0cnVjdCBjY3VfZ2F0ZSAqaHdfdG9fY2N1X2dhdGUoc3RydWN0IGNsa19odyAqaHcpCj4+PiAr
ewo+Pj4gKyAgICAgICBzdHJ1Y3QgY2N1X2NvbW1vbiAqY29tbW9uID0gaHdfdG9fY2N1X2NvbW1v
bihodyk7Cj4+PiArCj4+PiArICAgICAgIHJldHVybiBjb250YWluZXJfb2YoY29tbW9uLCBzdHJ1
Y3QgY2N1X2dhdGUsIGNvbW1vbik7Cj4+PiArfQo+Pj4gKwo+Pj4gK2V4dGVybiBjb25zdCBzdHJ1
Y3QgY2xrX29wcyBjY3VfZGl2X29wczsKPj4+ICtleHRlcm4gY29uc3Qgc3RydWN0IGNsa19vcHMg
Y2xrX3BsbF9vcHM7Cj4+PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHRoMTUy
MF9jbGtfcmVnbWFwX2NvbmZpZzsKPj4KPj4gV2h5IGlzIHRoZSByZWdtYXAgY29uZmlnIGV4cG9y
dGVkPwo+IAo+IFRoZSByZWdtYXBfY29uZmlnIGlzIGV4cG9ydGVkIHRvIGFsbG93IHJldXNlIGFj
cm9zcyBtdWx0aXBsZSBkcml2ZXJzLgo+IEluaXRpYWxseSwgSSBwYXNzZWQgdGhlIGNsb2NrIFZP
U1lTIGFkZHJlc3Mgc3BhY2UgdXNpbmcgdGhlIHJlZyBwcm9wZXJ0eQo+IGFuZCBjcmVhdGVkIHRo
ZSByZWdtYXAgZnJvbSBpdCwgZW5hYmxpbmcgb3RoZXIgZHJpdmVycyB0byB1dGlsaXplIHRoZQo+
IHNhbWUgY29uZmlndXJhdGlvbi4gTGF0ZXIsIEkgc3dpdGNoZWQgdG8gYSByZWdtYXAtYmFzZWQg
c3lzY29uIGFwcHJvYWNoCj4gYnV0IGhhdmVu4oCZdCBtb3ZlZCB0aGUgcmVnbWFwX2NvbmZpZyBi
YWNrIHRvIHRoZSBBUCBkcml2ZXIuCgoKSXQgYW55d2F5IGluIHlvdXIgb3JpZ2luYWwgY29kZSBj
YW5ub3QgYmUgZXhwb3J0ZWQuIElmIHlvdSB3YW50IHRvIHVzZQpzeXNjb24sIHRoZW4gdXNlIHN5
c2Nvbiwgbm90IGV4cG9ydGluZyByZWdtYXBzIG1hbnVhbGx5LgoKCgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
