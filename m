Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A8CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJspKKp8keGVSYdf9+dUyh6xXn9gXPJaOFKDFwmcGw4=; b=g0fpRmaHOSuza/
	ZbmExI6bMRzRUEEP1P2JGWCKm60xsax5xVqo8Qx9ZzNgnvevTcy70yhFakOKLhFB5n1Apmjo9mqdF
	JmoR7OqJ+9Bu718JqwYsBLk1EDWA2JyePp19qFSNltUtyptxEc6dOM+I+nDG+2slhoBcJ5bSwhhAb
	vWmEu2uw33AMtuId3liYW5rJtusY6HQQA31/8z5LgtOOeL2x71trchGDs0anFKfv5Rkz7NCPhNxbm
	r51MXknIB8N0edM23T2zZDa8Ftq9Z8kv0KoRIyb09hhnIptGyxrcOcj3Ies6NwY6aE2u8aK/mAoJw
	n3U6y8DlvrKAk6J7aypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvW5-0000000Egbv-3nY0;
	Wed, 03 Apr 2024 07:58:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvW1-0000000EgXg-1tVF;
	Wed, 03 Apr 2024 07:58:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8cVx6sv3z29lcf;
	Wed,  3 Apr 2024 15:55:37 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 9387D180063;
	Wed,  3 Apr 2024 15:58:23 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 15:58:22 +0800
Message-ID: <d5177b0f-db4e-4c78-81f1-5761f08f076d@huawei.com>
Date: Wed, 3 Apr 2024 15:58:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
CC: <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-8-wangkefeng.wang@huawei.com>
 <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_005837_863859_0A69A902 
X-CRM114-Status: GOOD (  16.20  )
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

CgpPbiAyMDI0LzQvMyAxMzo1OSwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+IE9uIFR1ZSwg
QXByIDIsIDIwMjQgYXQgMTI6NTPigK9BTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkgY2hlY2tl
ZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPj4gYmFkIGFjY2VzcywgZGlyZWN0bHkg
aGFuZGxlIGVycm9yIGFuZCByZXR1cm4sIHRoZXJlIGlzIG5vIG5lZWQgdG8KPj4gbG9ja19tbV9h
bmRfZmluZF92bWEoKSBhbmQgY2hlY2sgdm1fZmxhZ3MgYWdhaW4uCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAKPiBMb29rcyBz
YWZlIHRvIG1lLgo+IFVzaW5nIChtbSAhPSBOVUxMKSB0byBpbmRpY2F0ZSB0aGF0IHdlIGFyZSBo
b2xkaW5nIG1tYXBfbG9jayBpcyBub3QKPiBpZGVhbCBidXQgSSBndWVzcyB0aGF0IHdvcmtzLgo+
IAoKWWVzLCBJIHdpbGwgYWRkIHRoaXMgcGFydCBpdCBpbnRvIGNoYW5nZSB0b28sCgpUaGUgYWNj
ZXNzX2Vycm9yKCkgb2Ygdm1hIGFscmVhZHkgY2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlm
IGl0CmlzIGEgYmFkIGFjY2VzcywgZGlyZWN0bHkgaGFuZGxlIGVycm9yLCBubyBuZWVkIHRvIHJl
dHJ5IHdpdGggbW1hcF9sb2NrCmFnYWluLiBJbiBvcmRlciB0byByZWxlYXNlIHRoZSBjb3JyZWN0
IGxvY2ssIHBhc3MgdGhlIG1tX3N0cnVjdCBpbnRvCmJhZF9hcmVhX2FjY2Vzc19lcnJvcigpLCBp
ZiBtbSBpcyBOVUxMLCByZWxlYXNlIHZtYSBsb2NrLCBvciByZWxlYXNlCm1tYXBfbG9jay4gU2lu
Y2UgdGhlIHBhZ2UgZmF1dCBpcyBoYW5kbGVkIHVuZGVyIHBlci1WTUEgbG9jaywgY291bnQgaXQK
YXMgYSB2bWEgbG9jayBldmVudCB3aXRoIFZNQV9MT0NLX1NVQ0NFU1MuCgpUaGFua3MuCgoKPiBS
ZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPiAKPj4g
LS0tCj4+ICAgYXJjaC94ODYvbW0vZmF1bHQuYyB8IDIzICsrKysrKysrKysrKysrLS0tLS0tLS0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9mYXVsdC5jIGIvYXJjaC94ODYvbW0vZmF1bHQu
Ywo+PiBpbmRleCBhNGNjMjBkMDAzNmQuLjY3YjE4YWRjNzVkZCAxMDA2NDQKPj4gLS0tIGEvYXJj
aC94ODYvbW0vZmF1bHQuYwo+PiArKysgYi9hcmNoL3g4Ni9tbS9mYXVsdC5jCj4+IEBAIC04NjYs
MTQgKzg2NiwxNyBAQCBiYWRfYXJlYV9ub3NlbWFwaG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncywg
dW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+Pgo+PiAgIHN0YXRpYyB2b2lkCj4+ICAgX19iYWRf
YXJlYShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+PiAt
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgdTMyIHBrZXksIGludCBzaV9jb2RlKQo+
PiArICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgc3RydWN0IG1tX3N0cnVjdCAqbW0s
Cj4+ICsgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHUzMiBwa2V5LCBpbnQg
c2lfY29kZSkKPj4gICB7Cj4+IC0gICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50
LT5tbTsKPj4gICAgICAgICAgLyoKPj4gICAgICAgICAgICogU29tZXRoaW5nIHRyaWVkIHRvIGFj
Y2VzcyBtZW1vcnkgdGhhdCBpc24ndCBpbiBvdXIgbWVtb3J5IG1hcC4uCj4+ICAgICAgICAgICAq
IEZpeCBpdCwgYnV0IGNoZWNrIGlmIGl0J3Mga2VybmVsIG9yIHVzZXIgZmlyc3QuLgo+PiAgICAg
ICAgICAgKi8KPj4gLSAgICAgICBtbWFwX3JlYWRfdW5sb2NrKG1tKTsKPj4gKyAgICAgICBpZiAo
bW0pCj4+ICsgICAgICAgICAgICAgICBtbWFwX3JlYWRfdW5sb2NrKG1tKTsKPj4gKyAgICAgICBl
bHNlCj4+ICsgICAgICAgICAgICAgICB2bWFfZW5kX3JlYWQodm1hKTsKPj4KPj4gICAgICAgICAg
X19iYWRfYXJlYV9ub3NlbWFwaG9yZShyZWdzLCBlcnJvcl9jb2RlLCBhZGRyZXNzLCBwa2V5LCBz
aV9jb2RlKTsKPj4gICB9Cj4+IEBAIC04OTcsNyArOTAwLDggQEAgc3RhdGljIGlubGluZSBib29s
IGJhZF9hcmVhX2FjY2Vzc19mcm9tX3BrZXlzKHVuc2lnbmVkIGxvbmcgZXJyb3JfY29kZSwKPj4K
Pj4gICBzdGF0aWMgbm9pbmxpbmUgdm9pZAo+PiAgIGJhZF9hcmVhX2FjY2Vzc19lcnJvcihzdHJ1
Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+PiAtICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKPj4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCj4+ICsgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKPj4gICB7Cj4+ICAgICAgICAgIC8qCj4+ICAgICAgICAgICAqIFRoaXMg
T1NQS0UgY2hlY2sgaXMgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSBhdCBydW50aW1lLgo+PiBAQCAt
OTI3LDkgKzkzMSw5IEBAIGJhZF9hcmVhX2FjY2Vzc19lcnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVn
cywgdW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+PiAgICAgICAgICAgICAgICAgICAqLwo+PiAg
ICAgICAgICAgICAgICAgIHUzMiBwa2V5ID0gdm1hX3BrZXkodm1hKTsKPj4KPj4gLSAgICAgICAg
ICAgICAgIF9fYmFkX2FyZWEocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgcGtleSwgU0VHVl9Q
S1VFUlIpOwo+PiArICAgICAgICAgICAgICAgX19iYWRfYXJlYShyZWdzLCBlcnJvcl9jb2RlLCBh
ZGRyZXNzLCBtbSwgdm1hLCBwa2V5LCBTRUdWX1BLVUVSUik7Cj4+ICAgICAgICAgIH0gZWxzZSB7
Cj4+IC0gICAgICAgICAgICAgICBfX2JhZF9hcmVhKHJlZ3MsIGVycm9yX2NvZGUsIGFkZHJlc3Ms
IDAsIFNFR1ZfQUNDRVJSKTsKPj4gKyAgICAgICAgICAgICAgIF9fYmFkX2FyZWEocmVncywgZXJy
b3JfY29kZSwgYWRkcmVzcywgbW0sIHZtYSwgMCwgU0VHVl9BQ0NFUlIpOwo+PiAgICAgICAgICB9
Cj4+ICAgfQo+Pgo+PiBAQCAtMTM1Nyw4ICsxMzYxLDkgQEAgdm9pZCBkb191c2VyX2FkZHJfZmF1
bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4+ICAgICAgICAgICAgICAgICAgZ290byBsb2NrX21t
YXA7Cj4+Cj4+ICAgICAgICAgIGlmICh1bmxpa2VseShhY2Nlc3NfZXJyb3IoZXJyb3JfY29kZSwg
dm1hKSkpIHsKPj4gLSAgICAgICAgICAgICAgIHZtYV9lbmRfcmVhZCh2bWEpOwo+PiAtICAgICAg
ICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4+ICsgICAgICAgICAgICAgICBiYWRfYXJlYV9hY2Nl
c3NfZXJyb3IocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgTlVMTCwgdm1hKTsKPj4gKyAgICAg
ICAgICAgICAgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+PiAr
ICAgICAgICAgICAgICAgcmV0dXJuOwo+PiAgICAgICAgICB9Cj4+ICAgICAgICAgIGZhdWx0ID0g
aGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkcmVzcywgZmxhZ3MgfCBGQVVMVF9GTEFHX1ZNQV9MT0NL
LCByZWdzKTsKPj4gICAgICAgICAgaWYgKCEoZmF1bHQgJiAoVk1fRkFVTFRfUkVUUlkgfCBWTV9G
QVVMVF9DT01QTEVURUQpKSkKPj4gQEAgLTEzOTQsNyArMTM5OSw3IEBAIHZvaWQgZG9fdXNlcl9h
ZGRyX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+PiAgICAgICAgICAgKiB3ZSBjYW4gaGFu
ZGxlIGl0Li4KPj4gICAgICAgICAgICovCj4+ICAgICAgICAgIGlmICh1bmxpa2VseShhY2Nlc3Nf
ZXJyb3IoZXJyb3JfY29kZSwgdm1hKSkpIHsKPj4gLSAgICAgICAgICAgICAgIGJhZF9hcmVhX2Fj
Y2Vzc19lcnJvcihyZWdzLCBlcnJvcl9jb2RlLCBhZGRyZXNzLCB2bWEpOwo+PiArICAgICAgICAg
ICAgICAgYmFkX2FyZWFfYWNjZXNzX2Vycm9yKHJlZ3MsIGVycm9yX2NvZGUsIGFkZHJlc3MsIG1t
LCB2bWEpOwo+PiAgICAgICAgICAgICAgICAgIHJldHVybjsKPj4gICAgICAgICAgfQo+Pgo+PiAt
LQo+PiAyLjI3LjAKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
