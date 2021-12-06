Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2EAC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiCgmorFqakRP0pxRnUcq6xxeugxa4zRK8Ig4goU/7s=; b=JCThJ8wnw9SlY40W7T938HXa5I
	VU9+FHuowFq5Cq4dcNZphijY0t7FiT3zMYaCbjNKJiPJjalwtgDF3XzWfk1UWaUs5+VnzJj2CiH+A
	1YE2/fCyElJL07R38ky1yZ0ax8NdPY4ONM1ZhG2ek8S5V10bttpHb1Nlt5TYNPA+7stmcfGkADpFc
	ZT/01tOC32cJXjyeB4cPEr7BkH4Z1GKO+ecnEBSOVt2PbeSoTLIgOm/V1ViRL0aqQfgSu+ng7iiE7
	+luXG7cVYEE9yXwBC+bETopcCSbrZsXgXM95VHz8h5/lUf/EP+WxqmNwv55HfQ3iRNSPnM6OlNuk+
	6V905h/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBZV-003PrD-7y; Mon, 06 Dec 2021 10:50:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBZP-003Pmg-9n
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:50:10 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B1A846000F;
 Mon,  6 Dec 2021 10:49:55 +0000 (UTC)
Message-ID: <3283761f-0506-464b-d351-af8ddecafa9b@ghiti.fr>
Date: Mon, 6 Dec 2021 11:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 00/10] Introduce sv48 support without relocatable kernel
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org, Alexandre Ghiti <alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
 <2700575.YIZvDWadBg@diego>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <2700575.YIZvDWadBg@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025007_659451_2AB51853 
X-CRM114-Status: GOOD (  19.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMjUvMjEgMDA6MjksIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+IEFtIE1pdHR3b2NoLCAy
OS4gU2VwdGVtYmVyIDIwMjEsIDE2OjUxOjAzIENFVCBzY2hyaWViIEFsZXhhbmRyZSBHaGl0aToK
Pj4gVGhpcyBwYXRjaHNldCBhbGxvd3MgdG8gaGF2ZSBhIHNpbmdsZSBrZXJuZWwgZm9yIHN2Mzkg
YW5kIHN2NDggd2l0aG91dAo+PiBiZWluZyByZWxvY2F0YWJsZS4KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAo+PiBUaGUgaWRlYSBjb21lcyBmcm9tIEFybmQgQmVyZ21hbm4gd2hvIHN1Z2dl
c3RlZCB0byBkbyB0aGUgc2FtZSBhcyB4ODYsCj4+IHRoYXQgaXMgbWFwcGluZyB0aGUga2VybmVs
IHRvIHRoZSBlbmQgb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIHdoaWNoIGFsbG93cwo+PiB0aGUga2Vy
bmVsIHRvIGJlIGxpbmtlZCBhdCB0aGUgc2FtZSBhZGRyZXNzIGZvciBib3RoIHN2MzkgYW5kIHN2
NDggYW5kCj4+IHRoZW4gZG9lcyBub3QgcmVxdWlyZSB0byBiZSByZWxvY2F0ZWQgYXQgcnVudGlt
ZS4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiBUaGlzIGltcGxlbWVudHMgc3Y0OCBz
dXBwb3J0IGF0IHJ1bnRpbWUuIFRoZSBrZXJuZWwgd2lsbCB0cnkgdG8KPj4gYm9vdCB3aXRoIDQt
bGV2ZWwgcGFnZSB0YWJsZSBhbmQgd2lsbCBmYWxsYmFjayB0byAzLWxldmVsIGlmIHRoZSBIVyBk
b2VzIG5vdAo+PiBzdXBwb3J0IGl0LiBGb2xkaW5nIHRoZSA0dGggbGV2ZWwgaW50byBhIDMtbGV2
ZWwgcGFnZSB0YWJsZSBoYXMgYWxtb3N0IG5vCj4+IGNvc3QgYXQgcnVudGltZS4KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAo+PiBUZXN0ZWQgb246Cj4+ICAgIC0gcWVtdSBydjY0IHN2Mzk6
IE9LCj4+ICAgIC0gcWVtdSBydjY0IHN2NDg6IE9LCj4+ICAgIC0gcWVtdSBydjY0IHN2MzkgKyBr
YXNhbjogT0sKPj4gICAgLSBxZW11IHJ2NjQgc3Y0OCArIGthc2FuOiBPSwo+PiAgICAtIHFlbXUg
cnYzMjogT0sKPj4gICAgLSBVbm1hdGNoZWQ6IE9LCj4gT24gYSBiZWFnbGVWICh3aGljaCBzdXBw
b3J0cyBvbmx5IHN2MzkpIEkndmUgdGVzdGVkIGJvdGggdGhlIGxpbWl0IHZpYQo+IHRoZSBtbXUt
dHlwZSBpbiB0aGUgZGV2aWNldHJlZSBhbmQgYWxzbyB0aGF0IHRoZSBmYWxsYmFjayB3b3JrcyB3
aGVuCj4gSSBkaXNhYmxlIHRoZSBtbXUtdHlwZSBpbiB0aGUgZHQsIHNvCj4KPiBUZXN0ZWQtYnk6
IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4KClRoYW5rcyBIZWlrbyBmb3IgdGVz
dGluZyB0aGlzLCB1bmZvcnR1bmF0ZWx5IEkgY291bGQgbm90IGFkZCB0aGlzIHRhZyB0byAKdGhl
IGxhdGVzdCB2ZXJzaW9uIGFzIHNpZ25pZmljYW50IGNoYW5nZXMgY2FtZSB1cC4KClRoYW5rcyBh
Z2FpbiBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHRlc3QgdGhpcywKCkFsZXgKCgo+PiAgICAKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAo+PiBDaGFuZ2VzIGluIHYyOgo+PiAgICAtIFJlYmFz
ZSBvbnRvIGZvci1uZXh0Cj4+ICAgIC0gRml4IEtBU0FOCj4+ICAgIC0gRml4IHN0YWNrIGNhbmFy
eQo+PiAgICAtIEdldCBjb21wbGV0ZWx5IHJpZCBvZiBNQVhQSFlTTUVNIGNvbmZpZ3MKPj4gICAg
LSBBZGQgZG9jdW1lbnRhdGlvbgo+Pgo+PiBBbGV4YW5kcmUgR2hpdGkgKDEwKToKPj4gICAgcmlz
Y3Y6IEFsbG93IHRvIGR5bmFtaWNhbGx5IGRlZmluZSBWQV9CSVRTCj4+ICAgIHJpc2N2OiBHZXQg
cmlkIG9mIE1BWFBIWVNNRU0gY29uZmlncwo+PiAgICBhc20tZ2VuZXJpYzogUHJlcGFyZSBmb3Ig
cmlzY3YgdXNlIG9mIHB1ZF9hbGxvY19vbmUgYW5kIHB1ZF9mcmVlCj4+ICAgIHJpc2N2OiBJbXBs
ZW1lbnQgc3Y0OCBzdXBwb3J0Cj4+ICAgIHJpc2N2OiBVc2UgcGd0YWJsZV9sNF9lbmFibGVkIHRv
IG91dHB1dCBtbXVfdHlwZSBpbiBjcHVpbmZvCj4+ICAgIHJpc2N2OiBFeHBsaWNpdCBjb21tZW50
IGFib3V0IHVzZXIgdmlydHVhbCBhZGRyZXNzIHNwYWNlIHNpemUKPj4gICAgcmlzY3Y6IEltcHJv
dmUgdmlydHVhbCBrZXJuZWwgbWVtb3J5IGxheW91dCBkdW1wCj4+ICAgIERvY3VtZW50YXRpb246
IHJpc2N2OiBBZGQgc3Y0OCBkZXNjcmlwdGlvbiB0byBWTSBsYXlvdXQKPj4gICAgcmlzY3Y6IElu
aXRpYWxpemUgdGhyZWFkIHBvaW50ZXIgYmVmb3JlIGNhbGxpbmcgQyBmdW5jdGlvbnMKPj4gICAg
cmlzY3Y6IEFsbG93IHVzZXIgdG8gZG93bmdyYWRlIHRvIHN2Mzkgd2hlbiBodyBzdXBwb3J0cyBz
djQ4Cj4+Cj4+ICAgRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0ICAgICAgICAgICAg
IHwgIDM2ICsrCj4+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDM1ICstCj4+ICAgYXJjaC9yaXNjdi9jb25maWdzL25vbW11X2syMTBfZGVmY29uZmln
ICAgICAgIHwgICAxIC0KPj4gICAuLi4vcmlzY3YvY29uZmlncy9ub21tdV9rMjEwX3NkY2FyZF9k
ZWZjb25maWcgfCAgIDEgLQo+PiAgIGFyY2gvcmlzY3YvY29uZmlncy9ub21tdV92aXJ0X2RlZmNv
bmZpZyAgICAgICB8ICAgMSAtCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAg
ICAgICAgICAgICAgIHwgICAzICstCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAu
aCAgICAgICAgICAgICAgIHwgICAxICsKPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2Fu
LmggICAgICAgICAgICAgICAgfCAgIDIgKy0KPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bh
Z2UuaCAgICAgICAgICAgICAgICAgfCAgMTAgKwo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGdhbGxvYy5oICAgICAgICAgICAgICB8ICA0MCArKysKPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUtNjQuaCAgICAgICAgICAgfCAxMDggKysrKystCj4+ICAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgICAgIHwgIDMwICstCj4+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zcGFyc2VtZW0uaCAgICAgICAgICAgIHwgICA2ICstCj4+ICAgYXJjaC9y
aXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDIzICstCj4+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvaGVhZC5TICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4+ICAg
YXJjaC9yaXNjdi9tbS9jb250ZXh0LmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstCj4+
ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzIzICsr
KysrKysrKysrKysrKy0tLQo+PiAgIGFyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jICAgICAgICAg
ICAgICAgICAgICB8ICA5MSArKystLQo+PiAgIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIv
ZWZpLXN0dWIuYyAgICAgICB8ICAgMiArCj4+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ2FsbG9j
LmggICAgICAgICAgICAgICAgIHwgIDI0ICstCj4+ICAgaW5jbHVkZS9saW51eC9zaXplcy5oICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4gICAyMSBmaWxlcyBjaGFuZ2VkLCA2MTUg
aW5zZXJ0aW9ucygrKSwgMTMxIGRlbGV0aW9ucygtKQo+Pgo+Pgo+Cj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
