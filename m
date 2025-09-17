Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86308CA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5GA82xoBWpKwVdKVsPM8KtQ0r35SKQ1YEBxxnl0pqo=; b=SOycym+rnGfW+e
	mGSesi4bnHxWQZQQ0xBHqg0CpGdK4oi6pINi7ryWPQyeMXfR8P3AkU9GleiW86HuUqc4TzS0BW3GI
	SVzyBSdEis9m/uIn6vcaiDAM1qQS/5LRr7Ekuz8uhF0Z2Bs7Au3Q6LaL+/8+TIdG0zplHUmTqgitb
	pvsO5tqclppODBfcG92/+p10z+y8hygXUmbwNYAPEvgC8Qr7LTS2qC8lOf2n7BF/lnJxt7ijKvMyo
	rsKusWbeKRccw6aOYLcMpRAosgaqGZs4/PCo5nFm0yDMNmVsVI39hjcAn9BkfKIBTNc9Bdflu84pG
	ZwV0FvUk0WfHrNAjLg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynm3-0000000AgMg-3DRH;
	Wed, 17 Sep 2025 08:44:23 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynm0-0000000AgHr-2zFw
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 08:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758098581;
	bh=eAKrV9C0nPNTZBS+NWN0knY6QZpHJEt8UIc7f2QSHUk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=GWr1NQsvRsQq2e/4fS4bz3stAyBCFHEZ+se31TJJArUbThPX67FPAKWsR0tlxC191
	 JYLmIUT8k9gG2Ka2iXuWkVXAW1HtD0KRBHItm3THadZ5t6uRzB4qQhLctwPRChx5Es
	 nybcPiSspKHA5lIZW8bJrSK91nRg78sV9Piu3iwM=
X-QQ-mid: esmtpsz16t1758098579ta10142e2
X-QQ-Originating-IP: Ha3YOvxStlM2nRz61S7NoShja4uIqXt3oB2AhlNNz8s=
Received: from = ( [14.123.253.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Sep 2025 16:42:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 211403169003842107
EX-QQ-RecipientCnt: 16
Date: Wed, 17 Sep 2025 16:42:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <A00BFAFA3FC941AF+aMp0kSc6UkR4QUn4@LT-Guozexi>
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
 <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
 <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MbSuBwOrED9veXQmnD6QUkqCeUHr71NBU4uPKkwnxNq0CJxnVIf68hBg
	CLwCYhsDv/JmVwACzrgiBGRx1FVEmv0Z73cuYsCx1AYvUsvxCj3L3Zoofb22wGjYch+u0OK
	1hFnmSbCoLTEfV1Pj6BrG/dn0SLYkoM0HLZV2Hl8oH+u+rThN9tnQ3ylAHzHfWvbYjSTAje
	pnEJePj75A1I08nTmc8GGxG7B1mRDtAn9zsK0LhNDk/zco2DRJpSsdVHIc1TuCRG1OGoNS4
	+yRq3gewGP5nVQv9VpD+QiWcereJQWubNQb3d427z0ggKM3qjLCVCfZgmOkj9PX85Dwz7jZ
	UFeERejfPn2jy6HZqBCBJaox3qBK8l530Fvv8rJdS+vym9RBvdYfPpBuidneMAy/X2MyRTo
	qsaXe+sj1e+LnjKSV3vG3QhDOX36CN5jloDyKy0gNj/QMYmV8X9NfxMAjgNAdIsvNVo7spG
	pWVL9QcvzlsMgp2RGX9E8bj/QjFfmED5RjhwGYHPjysdQgtyf42n+sTZ87qjG18td7IRIWF
	JmAcd2a/1h4KnaZ12bq9RderqPGxnShq3lZGjB64ll+J1xFrf6/SZ3yvp44nBsQPYCuIto4
	nVl5o1HIj/6G4ZDpAUcK/iGvkFDXbKQpmyYFX7i9QdgO7iLGu9m5Pr+0qrp5JLWK6ALIy7m
	9KVSi1FDam0Jh0xcXuYhLLO8i9yMcFRpnwR/aKVxdjT20HiJGFmA7mALO3RYCTg844Q0IF3
	NevSwwfOVYgbFDOHXbi8e+FDJnZByxWApa9nQltXJaj4DBKvqHjQ29Yp8uWphqsgvIdQ+TI
	0SyDLWJKCQPGO0wqEoUSIulsL1JSW9soUMx+AWfGzQxrP0lqTGRvVzCzWES1Sj0CLOv+QWB
	Xtf29InLg5m+KmtJ0xzD5dxm3+EMZCCurSiyakrAyIqRfFVm45lM1tiFbFk144DWHBB0r3p
	Jb0QA14DJPyS4DEguaT0ek4tzg7iriEPyLqkSZBUYuMWudByALjbDkDIFPJXIofP+a1g9Zp
	HzkpwhdWcs3O7sjUJHvCIrdDKhotukn2rVfT4//VqVNW4lrp64sKH29D4BjPy0s+g4MXNpc
	YN7xQWx0tJ+
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_014421_259491_3DE7C1F2 
X-CRM114-Status: GOOD (  30.11  )
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

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTA6MTc6MTZBTSArMDIwMCwgSGVuZHJpayBIYW1lcmxp
bmNrIHdyb3RlOgo+IEhlbGxvIFRyb3ksCj4gCj4gVGhhbmsgeW91IGZvciByZXZpZXdpbmcuCj4g
Cj4gT24gOS8xNy8yNSAwOTo0NiwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+IEhpIEhlbmRyaWss
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+Cj4gPiBPbiBXZWQsIFNlcCAxNywgMjAyNSBhdCAw
ODo1OTowN0FNICswMjAwLCBIZW5kcmlrIEhhbWVybGluY2sgd3JvdGU6Cj4gPj4gQWRkIFVBUlQg
cGluY3RybCBjb25maWd1cmF0aW9ucyBiYXNlZCBvbiB0aGUgU29DIGRhdGFzaGVldCBhbmQgdGhl
Cj4gPj4gZG93bnN0cmVhbSBCaWFuYnUgTGludXggdHJlZS4gVGhlIGRyaXZlIHN0cmVuZ3RoIHZh
bHVlcyB3ZXJlIHRha2VuIGZyb20KPiA+PiB0aGUgZG93bnN0cmVhbSBpbXBsZW1lbnRhdGlvbiwg
d2hpY2ggdXNlcyBtZWRpdW0gZHJpdmUgc3RyZW5ndGguCj4gPj4gQ1RTL1JUUyBhcmUgbW92ZWQg
dG8gc2VwYXJhdGUgKi1jdHMtcnRzLWNmZyBzdGF0ZXMgc28gYm9hcmRzIGNhbiBlbmFibGUKPiA+
PiBoYXJkd2FyZSBmbG93IGNvbnRyb2wgY29uZGl0aW9uYWxseS4KPiA+Pgo+ID4+IFNpZ25lZC1v
ZmYtYnk6IEhlbmRyaWsgSGFtZXJsaW5jayA8aGVuZHJpay5oYW1lcmxpbmNrQGhhbW1lcm5ldC5i
ZT4KPiA+PiBSZXZpZXdlZC1ieTogWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+Cj4gPj4gLS0t
Cj4gPj4gQ2hhbmdlcyBpbiB2NDoKPiA+PiAtIEV4cGxpY2l0bHkgdXNlIDAgYXMgYmlhcy1wdWxs
LXVwIHZhbHVlCj4gPj4KPiA+PiBDaGFuZ2VzIGluIHYzOgo+ID4+IC0gQWRkZWQgL29taXQtaWYt
bm8tcmVmLyB0byBwaW5jdHJsIHN0YXRlcyB0byByZWR1Y2UgRFQgc2l6ZQo+ID4+Cj4gPj4gQ2hh
bmdlcyBpbiB2MjoKPiA+PiAtIFNwbGl0IGN0cy9ydHMgaW50byBzZXBhcmF0ZSBwaW5jdHJsIGNv
bmZpZ3MgYXMgc3VnZ2VzdGVkCj4gPj4gLSBSZW1vdmVkIG9wdGlvbnMgZnJvbSBib2FyZCBEVFMg
ZmlsZXMgdG8ga2VlcCB0aGVtIGNsZWFuZXIKPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kgfCA0MzAgKysrKysrKysrKysrKysrKysrLQo+
ID4+ICAxIGZpbGUgY2hhbmdlZCwgNDI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5j
dHJsLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+
ID4+ICsJL29taXQtaWYtbm8tcmVmLwo+ID4+ICsJdWFydDJfMF9jdHNfcnRzX2NmZzogdWFydDIt
MC1jdHMtcnRzLWNmZyB7Cj4gPj4gKwkJdWFydDItMC1waW5zIHsKPiA+PiArCQkJcGlubXV4ID0g
PEsxX1BBRENPTkYoMjMsIDEpPiwJLyogdWFydDJfY3RzICovCj4gPj4gKwkJCQkgPEsxX1BBRENP
TkYoMjQsIDEpPjsJLyogdWFydDJfcnRzICovCj4gPj4gKwkJCWJpYXMtcHVsbC11cCA9IDwwPjsK
PiA+PiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MzI+Owo+ID4+ICsJCX07Cj4gPj4gKwl9Owo+ID4g
V2UgYXJlIGN1cnJlbnRseSB1c2luZyB0aGUgODI1MCBVQVJUIGRyaXZlciwgYnV0IGhhcmR3YXJl
IGZsb3cgY29udHJvbCBkb2VzIG5vdAo+ID4gd29yayBwcm9wZXJseSBvbiBLMS4gV2UgYXJlIGNv
bnNpZGVyaW5nIGZpeGluZyB0aGlzIHdoZW4gdGltZSBwZXJtaXRzLgo+ID4KPiA+IFNob3VsZCB3
ZSBhZGQgYSBjb21tZW50IGhlcmUgdG8gYXZvaWQgY29uZnVzaW5nIG90aGVycyB3aG8gbWF5IHJ1
biBpbnRvIHRoaXM/Cj4gPiBJZiBzbywgSSB3aWxsIHJlbW92ZSB0aGUgY29tbWVudCBvbmNlIHRo
ZSBpc3N1ZSBoYXMgYmVlbiBmaXhlZC4KPiBOb3Qgc3VyZSBpZiBJ4oCZbSBtaXNzaW5nIHNvbWV0
aGluZywgYnV0IGhhcmR3YXJlIGZsb3cgY29udHJvbCBzZWVtcyB0byB3b3JrCj4gd2l0aCB0aGUg
YDgyNTBfb2ZgIGRyaXZlcj8KPiAKPiBPbiBib3RoIGVuZHMgSSBjb25maWd1cmVkIHRoZSBwb3J0
cyB3aXRoOgo+IGBzdHR5IC1GIC9kZXYvdHR5UzEgMTE1MjAwIGNydHNjdHMgLWl4b24gLWl4b2Zm
IHJhdyAtZWNob2AKPiAKPiBXaXRoIHRoaXMgc2V0dXAsIGRhdGEgc2VudCB3aXRoIGVjaG8gb25s
eSBnb2VzIHRocm91Z2ggd2hlbiB0aGUgcGVlciBpcwo+IGFjdHVhbGx5IHJlYWRpbmcgb24gdGhl
IG90aGVyIHNpZGUsIHdoaWNoIGxvb2tzIGxpa2UgUlRTL0NUUyBpcwo+IGZ1bmN0aW9uaW5nIGNv
cnJlY3RseS4KTGV0IG1lIGNsYXJpZnkgbXkgZWFybGllciByZXBseShJIGhhdmUgZG91YmxlIGNo
ZWNrZWQpOgpJdCBpcyBub3QgdGhhdCBoYXJkd2FyZSBmbG93IGNvbnRyb2wgZG9lcyBub3Qgd29y
ayBhdCBhbGwsCmJ1dCByYXRoZXIgdGhhdCBpdCBmYWlscyBpbnRlcm1pdHRlbnRseS4KVGhlIGhp
Z2hlciB0aGUgYmF1ZCByYXRlLCB0aGUgc29vbmVyIHRoZSBwcm9ibGVtIHRlbmRzIHRvIHNob3cg
dXAuCgpGcm9tIHlvdXIgbG9nIEkgbm90aWNlZCB0aGUgYmF1ZCByYXRlIGlzIDExNTIwMC4KQXQg
dGhpcyByYXRlLCBpdCBtaWdodCB0YWtlIGEgZnVsbCBkYXkgb2YgY29udGludW91cyB0ZXN0aW5n
IGJlZm9yZQp0aGUgaXNzdWUgYXBwZWFycyAodGhvdWdoIG9mIGNvdXJzZSBpdCBjb3VsZCBhbHNv
IGZhaWwgbXVjaCBzb29uZXIsIHNpbmNlIGl0IGlzIHByb2JhYmlsaXN0aWMpLgoKU28gSSBhbSB3
b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCBoZXJlLApvciBpbnN0ZWFk
IHB1dCB0aGUgbm90ZSBpbiB0aGUgVUFSVCBub2RlLgoKICAgICAgICAgICAgICAgICAgICAtIFRy
b3kKPiAKPiA+Cj4gPiBBbnl3YXksCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4+ICsKPiA+PiArCS9vbWl0LWlm
LW5vLXJlZi8KPiA+PiArCXVhcnQzXzBfY2ZnOiB1YXJ0My0wLWNmZyB7Cj4gPj4gKwkJdWFydDMt
MC1waW5zIHsKPiA+PiArCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoODEsIDIpPiwJLyogdWFydDNf
dHhkICovCj4gPj4gKwkJCQkgPEsxX1BBRENPTkYoODIsIDIpPjsJLyogdWFydDNfcnhkICovCj4g
Pj4gKwkJCWJpYXMtcHVsbC11cCA9IDwwPjsKPiA+PiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MzI+
Owo+ID4+ICsJCX07Cj4gPj4gKwl9Owo+ID4+ICsKPiAuLi4KPiA+PiAtLSAKPiA+PiAyLjQzLjAK
PiA+Pgo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+PiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo+IEtpbmQgcmVnYXJkcywKPiBIZW5kcmlrCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
