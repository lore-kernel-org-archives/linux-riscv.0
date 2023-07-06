Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF593EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Co/FwIJJd7FMOi1m5KT1UKh4/uK4qMsIz8HNDcCqdWs=; b=UGimZbX8geOHLZ
	dkz0pkwv2sYb1jCwZg513fRrmgUEAAY3HXNjF2BG/jdvhxrpc+yfaJgoAu7kqhFsFR/u6ww8/VJyq
	c1cMBo0Gp8b2VIdxQcWAC3YgCY+WByP9wggKms7AXwX3Asi9zOWALsJ1bBizBfji3v60kEbDRFRac
	85DgimMX8AeYDGPFVM0v9F+Y8J0Oy5tr7KintS3/Ak5tvHyfrB6mbTs56NaySSOKOfdD+K04wkvUo
	WJM3MRX9wfUBxdspnH9AMcX3k6ibpjauxVBdT4YyVbegcLZwR/V6a3QJNgMg7M4l9rdKzvTVC7KEr
	Fx3jGYuyBHwSN16ves7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHYaN-002yqO-0N;
	Thu, 06 Jul 2023 23:40:31 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qHYaL-002ypQ-03;
	Thu, 06 Jul 2023 23:40:29 +0000
Message-ID: <278886bf-f469-a8cc-130a-f3e4614e7e1f@infradead.org>
Date: Thu, 6 Jul 2023 16:40:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: Tree for Jul 6 (arch/riscv/)
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Conor Dooley <conor@kernel.org>
References: <mhng-6e5d4a84-8aef-406d-b0cd-8f195f531354@palmer-ri-x1c9a>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <mhng-6e5d4a84-8aef-406d-b0cd-8f195f531354@palmer-ri-x1c9a>
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

SGkgUGFsbWVyLAoKT24gNy82LzIzIDE0OjQ2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBU
aHUsIDA2IEp1bCAyMDIzIDE0OjM2OjA1IFBEVCAoLTA3MDApLCByZHVubGFwQGluZnJhZGVhZC5v
cmcgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDcvNi8yMyAxNDozMiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6
Cj4+PiBPbiBUaHUsIDA2IEp1bCAyMDIzIDE0OjI3OjUzIFBEVCAoLTA3MDApLCByZHVubGFwQGlu
ZnJhZGVhZC5vcmcgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDcvNS8yMyAxODo1NywgU3RlcGhl
biBSb3Rod2VsbCB3cm90ZToKPj4+Pj4gSGkgYWxsLAo+Pj4+Pgo+Pj4+PiBQbGVhc2UgZG8gKm5v
dCogYWRkIGFueSB2Ni42IHJlbGF0ZWQgc3R1ZmYgdG8geW91ciBsaW51eC1uZXh0IGluY2x1ZGVk
Cj4+Pj4+IGJyYW5jaGVzIHVudGlsIGFmdGVyIHY2LjUtcmMxIGhhcyBiZWVuIHJlbGVhc2VkLgo+
Pj4+Pgo+Pj4+PiBDaGFuZ2VzIHNpbmNlIDIwMjMwNzA1Ogo+Pj4+Pgo+Pj4+Cj4+Pj4gb24gcmlz
Y3Y2NDoKPj4+Pgo+Pj4+IFdBUk5JTkc6IG1vZHBvc3Q6IHZtbGludXg6IHNlY3Rpb24gbWlzbWF0
Y2ggaW4gcmVmZXJlbmNlOiAkeHJ2NjRpMnAxX20ycDBfYTJwMV96aWNzcjJwMF96aWZlbmNlaTJw
MF96aWhpbnRwYXVzZTJwMF96bW11bDFwMCsweDE0IChzZWN0aW9uOiAudGV4dC51bmxpa2VseS5z
ZXRfYml0LmNvbnN0cHJvcC4wKSAtPiBudW1hX25vZGVzX3BhcnNlZCAoc2VjdGlvbjogLmluaXQu
ZGF0YSkKPj4+Pgo+Pj4+Cj4+Pj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuCj4+
Pgo+Pj4gVGhhbmtzLCBJJ20gZ2l2aW5nIGl0IGEgbG9vay7CoCBEbyB5b3UgaGFwcGVuIHRvIGFs
c28gaGF2ZSB5b3VyIHRvb2xjaGFpbiB2ZXJzaW9uIGVhc2lseSBhdmFpbGlhYmxlP8KgIFRoZSBt
YXBwaW5nIHN5bWJvbHMgYXJlIG5ldyBhbmQgd2UndmUgc2VlbiBzb21lIG9kZCBzdHVmZiBoYXBw
ZW4sIHNvbWV0aGluZyBpcyBsaWtlbHkgYnJva2VuIHNvbWV3aGVyZS4uLgo+Pgo+PiBJJ20gdXNp
bmcgZ2NjLTEzLjEuMCBmcm9twqAgaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIv
dG9vbHMvY3Jvc3N0b29sLwo+IAo+IENvb2wsIHRob3NlIGFyZSBwcmV0dHkgZWFzeSB0byBydW4u
wqAgSSd2ZSB5ZXQgdG8gYWN0dWFsbHkgcmVwcm9kdWNlIHRoZQo+IGZhaWx1cmVzLCBidXQgSSdk
IGd1ZXNzIHdlIGp1c3Qgd2FudCB0byBpZ25vcmUgdGhlIG1hcHBpbmcgc3ltYm9scyB3aXRoCj4g
c29tZXRoaW5nIGxpa2UKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9tb2QvbW9kcG9zdC5jIGIv
c2NyaXB0cy9tb2QvbW9kcG9zdC5jCj4gaW5kZXggYjI5YjI5NzA3ZjEwLi4yZjgwMTQ2OTMwMWQg
MTAwNjQ0Cj4gLS0tIGEvc2NyaXB0cy9tb2QvbW9kcG9zdC5jCj4gKysrIGIvc2NyaXB0cy9tb2Qv
bW9kcG9zdC5jCj4gQEAgLTYxNCw2ICs2MTQsMTggQEAgc3RhdGljIGludCBpZ25vcmVfdW5kZWZf
c3ltYm9sKHN0cnVjdCBlbGZfaW5mbyAqaW5mbywgY29uc3QgY2hhciAqc3ltbmFtZSkKPiDCoMKg
wqDCoMKgwqDCoCAvKiBFeHBvbGluZSB0aHVua3MgYXJlIGxpbmtlZCBvbiBhbGwga2VybmVsIG1v
ZHVsZXMgZHVyaW5nIGZpbmFsIGxpbmsgb2YgLmtvICovCj4gwqDCoMKgwqDCoMKgwqAgaWYgKHN0
cnN0YXJ0cyhzeW1uYW1lLCAiX19zMzkwX2luZGlyZWN0X2p1bXBfciIpKQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4gKwo+ICvCoMKgwqAgLyoKPiArwqDCoMKgwqAgKiBSSVND
LVYgZGVmaW5lcyB2YXJpb3VzIHNwZWNpYWwgc3ltYm9scyB0aGF0IHN0YXJ0IHdpdGggIiQiLsKg
IFRoZQo+ICvCoMKgwqDCoCAqIG1hcHBpbmcgc3ltYm9scywgd2hpY2ggZXhpc3QgdG8gZGlmZmVy
ZW50aWF0ZSBiZXR3ZWVuIGluY29tcGF0aWJsZQo+ICvCoMKgwqDCoCAqIGluc3RydWN0aW9uIGVu
Y29kaW5ncyB3aGVuIGRpc2Fzc2VtYmxpbmcsIHNob3cgdXAgYWxsIG92ZXIgdGhlIHBsYWNlCj4g
K8KgwqDCoMKgICogYW5kIGFyZSBnZW5lcmFsbHkgbm90IG1lYW50IHRvIGJlIHRyZWF0ZWQgbGlr
ZSBvdGhlciBzeW1ib2xzLsKgIFNvCj4gK8KgwqDCoMKgICoganVzdCBpZ25vcmUgYW55IG9mIHRo
ZSBzcGVjaWFsIHN5bWJvbHMuCj4gK8KgwqDCoMKgICovCj4gK8KgwqDCoCBpZiAoaW5mby0+aGRy
LT5lX21hY2hpbmUgPT0gRU1fUklTQ1YpCj4gK8KgwqDCoMKgwqDCoMKgIGlmIChzeW1uYW1lWzBd
ID09ICckJykKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsKPiArCj4gwqDCoMKg
wqAvKiBEbyBub3QgaWdub3JlIHRoaXMgc3ltYm9sICovCj4gwqDCoMKgwqByZXR1cm4gMDsKPiB9
Cj4gCj4gSSBoYXZlbid0IGV2ZW4gYnVpbHQgdGhhdCwgdGhvdWdoLi4uCgpUaGF0IGJ1aWxkcyB3
aXRob3V0IGFueSBlcnJvcnMgb3Igd2FybmluZ3MsIGJ1dCBpdCBkb2Vzbid0IGZpeCB0aGUgc2Vj
dGlvbiBtaXNtYXRjaAp3YXJuaW5nLgoKPiBUaGVzZSBhbHNvIHRyaXAgdXAgYmFja3RyYWNlcywg
c28gd2UgcHJvYmFibHkgbmVlZCBzb21ldGhpbmcgb3ZlciB0aGVyZSBhcwo+IHdlbGwuCgotLSAK
flJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
