Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3B2C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpQn5HJPTEon0r0VDKyivQudksOSDIIbgmfkmHcmK5E=; b=hLsNaJeUBaEhJB
	EpJ6CFQ7tNiTz08lygkIVy5Ha9ahsbMgQHGOn0rFOZqtB5MlPTFNnfPglitIsYwGwP0/MnVaMlxTg
	iGxsKA8qI80qQ1OYHKopgVvYExa3YVLnDbpVVstBkamYN/sKuZOr3xk/aqIrg70JFniRgffYSGbAA
	Eg/WHK/XuQcOgh8FIHom3py/4aWaOQQCYXOjTMXqo+kUuMdMXrVu/s2c5kAHYlmknEY7z9PocPR1P
	jwKv040Ips9HpKAZJmrl42bvi0tc8kMl/1EyRH6fRQawgDksONrfoXE04gRkqisPVUUnjpWoTW+06
	528okgLv9jFZiptmfx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyq6I-00BbN6-4V; Wed, 08 Jun 2022 07:27:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyq64-00BbHy-Js; Wed, 08 Jun 2022 07:27:23 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LHzKy3CJYzYsQl;
	Wed,  8 Jun 2022 15:26:14 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:27:12 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 15:27:10 +0800
Message-ID: <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com>
Date: Wed, 8 Jun 2022 15:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: <ardb@kernel.org>, <david@redhat.com>
CC: <corbet@lwn.net>, <will@kernel.org>, <catalin.marinas@arm.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<chenzhou10@huawei.com>, <vijayb@linux.microsoft.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-efi@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com>
 <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_002721_074443_E49E91B9 
X-CRM114-Status: GOOD (  20.99  )
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

CgrlnKggMjAyMi82LzcgMjI6NDksIEFyZCBCaWVzaGV1dmVsIOWGmemBkzoKPiBPbiBUdWUsIDcg
SnVuIDIwMjIgYXQgMTQ6MjIsIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4KPj4gT24gMDcuMDYuMjIgMTE6MzgsIFd1cGVuZyBNYSB3cm90ZToKPj4+IEZyb206
IE1hIFd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5jb20+Cj4+Pgo+Pj4gSW5pdHJkIG1lbW9yeSB3
aWxsIGJlIHJlbW92ZWQgYW5kIHRoZW4gYWRkZWQgaW4gYXJtNjRfbWVtYmxvY2tfaW5pdCgpIGFu
ZCB0aGlzCj4+PiB3aWxsIGNhdXNlIGl0IHRvIGxvc2UgYWxsIG9mIGl0cyBtZW1ibG9jayBmbGFn
cy4gVGhlIGxvc3Qgb2YgTUVNQkxPQ0tfTUlSUk9SCj4+PiBmbGFnIHdpbGwgbGVhZCB0byBlcnJv
ciBsb2cgcHJpbnRlZCBieSBmaW5kX3pvbmVfbW92YWJsZV9wZm5zX2Zvcl9ub2RlcyBpZgo+Pj4g
dGhlIGxvd2VyIDRHIHJhbmdlIGhhcyBzb21lIG5vbi1taXJyb3JlZCBtZW1vcnkuCj4+Pgo+Pj4g
SW4gb3JkZXIgdG8gc29sdmUgdGhpcyBwcm9ibGVtLCB0aGUgbG9zdCBNRU1CTE9DS19NSVJST1Ig
ZmxhZyB3aWxsIGJlCj4+PiByZWluc3RhbGxlZCBpZiB0aGUgb3JpZ2luIG1lbWJsb2NrIGhhcyB0
aGlzIGZsYWcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVh
d2VpLmNvbT4KPj4+IC0tLQo+Pj4gICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgfCAgOSArKysr
KysrKysKPj4+ICAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIHwgIDEgKwo+Pj4gICBtbS9tZW1i
bG9jay5jICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+Pj4gICAzIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9tbS9pbml0LmMgYi9hcmNoL2FybTY0L21tL2luaXQuYwo+Pj4gaW5kZXggMzM5ZWU4NGU1YTYx
Li4xMTY0MWY5MjRkMDggMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L21tL2luaXQuYwo+Pj4g
KysrIGIvYXJjaC9hcm02NC9tbS9pbml0LmMKPj4+IEBAIC0zNTAsOSArMzUwLDE4IEBAIHZvaWQg
X19pbml0IGFybTY0X21lbWJsb2NrX2luaXQodm9pZCkKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgImluaXRyZCBub3QgZnVsbHkgYWNjZXNzaWJsZSB2aWEgdGhlIGxpbmVhciBtYXBwaW5nIC0t
IHBsZWFzZSBjaGVjayB5b3VyIGJvb3Rsb2FkZXIgLi4uXG4iKSkgewo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICBwaHlzX2luaXRyZF9zaXplID0gMDsKPj4+ICAgICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgaW50IGZsYWdzLCByZXQ7Cj4+PiArCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gbWVtYmxvY2tfZ2V0X2ZsYWdzKGJhc2UsICZmbGFn
cyk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkKPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZsYWdzID0gMDsKPj4+ICsKPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgbWVtYmxvY2tfcmVtb3ZlKGJhc2UsIHNpemUpOyAvKiBjbGVhciBNRU1CTE9DS18gZmxhZ3Mg
Ki8KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfYWRkKGJhc2UsIHNpemUpOwo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKGJhc2UsIHNpemUpOwo+
Pgo+PiBDYW4geW91IGV4cGxhaW4gd2h5IHdlJ3JlIHJlbW92aW5nK3JlLWFkZGluZyBoZXJlIGV4
YWN0bHk/IElzIGl0IGp1c3QgdG8KPj4gY2xlYXIgZmxhZ3MgYXMgdGhlIGNvbW1lbnQgaW5kaWNh
dGVzPwo+Pgo+IAo+IFRoaXMgc2hvdWxkIG9ubHkgaGFwcGVuIGlmIHRoZSBwbGFjZW1lbnQgb2Yg
dGhlIGluaXRyZCBjb25mbGljdHMgd2l0aAo+IGEgbWVtPSBjb21tYW5kIGxpbmUgcGFyYW1ldGVy
IG9yIGl0IGlzIG5vdCBjb3ZlcmVkIGJ5IG1lbWJsb2NrIGZvcgo+IHNvbWUgb3RoZXIgcmVhc29u
Lgo+IAo+IElPVywgdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLCBhbmQgaWYgcmUtbWVtYmxvY2tf
YWRkJ2luZyB0aGlzIG1lbW9yeQo+IHVuY29uZGl0aW9uYWxseSBpcyBjYXVzaW5nIHByb2JsZW1z
LCB3ZSBzaG91bGQgZml4IHRoYXQgaW5zdGVhZCBvZgo+IHdvcmtpbmcgYXJvdW5kIGl0LgoKVGhp
cyB3aWxsIGhhcHBlbiBpZiB3ZSB1c2UgaW5pdHJkbWVtPTNHLDEwME0gdG8gcmVzZXJ2ZSBpbml0
cmQgbWVtb3J5IGJlbG93CnRoZSA0RyBsaW1pdCB0byB0ZXN0IHRoaXMgc2NlbmFyaW8oanVzdCBm
b3IgdGVzdGluZywgSSBoYXZlIHRyb3VibGUgdG8gYm9vdApxZW11IHdpdGggaW5pdHJkIGVuYWJs
ZWQgYW5kIG1lbW9yeSBiZWxvdyA0RyBhcmUgYWxsIG1pcnJvciBtZW1vcnkpLgoKUmUtbWVtYmxv
Y2tfYWRkJ2luZyB0aGlzIG1lbW9yeSB1bmNvbmRpdGlvbmFsbHkgc2VlbXMgZmluZSBidXQgY2xl
YXIgYWxsCmZsYWdzKGVzcGVjaWFsbHkgTUVNQkxPQ0tfTUlSUk9SKSBtYXkgbGVhZCB0byBzb21l
IGVycm9yIGxvZy4KCj4gCj4+IElmIGl0J3MgcmVhbGx5IGp1c3QgYWJvdXQgY2xlYXJpbmcgZmxh
Z3MsIEkgd29uZGVyIGlmIHdlIHJhdGhlciB3YW50IHRvCj4+IGhhdmUgYW4gaW50ZXJmYWNlIHRo
YXQgZG9lcyBleGFjdGx5IHRoYXQsIGFuZCBoaWRlcyB0aGUgd2F5IHRoaXMgaXMKPj4gYWN0dWFs
bHkgaW1wbGVtZW50ZWQgKG9idGFpbiBmbGFncywgcmVtb3ZlLCByZS1hZGQgLi4uKSwgaW50ZXJu
YWxseS4KPj4KPj4gQnV0IG1vc3QgcHJvYmFibHkgdGhlcmUgaXMgbW9yZSBtYWdpYyBpbiB0aGUg
Y29kZSBhbmQgY2xlYXJpbmcgZmxhZ3MKPj4gaXNuJ3QgYWxsIGl0IGVuZHMgdXAgZG9pbmcuCj4+
Cj4gCj4gSSBkb24ndCByZW1lbWJlciBleGFjdGx5IHdoeSB3ZSBuZWVkZWQgdG8gY2xlYXIgdGhl
IGZsYWdzLCBidXQgSSB0aGluawo+IGl0IGhhZCB0byBkbyB3aXRoIHNvbWUgY29ybmVyIGNhc2Ug
d2UgaGl0IHdoZW4gdGhlIGluaXRyZCB3YXMKPiBwYXJ0aWFsbHkgY292ZXJlZC4KSWYgIm1lbT0i
IGlzIHNldCBpbiBjb21tYW5kIGxpbmUsIG1lbWJsb2NrX21lbV9saW1pdF9yZW1vdmVfbWFwKCkg
d2lsbApyZW1vdmUgYWxsIG1lbW9yeSBibG9jayB3aXRob3V0IE1FTUJMT0NLX05PTUFQLiBNYXli
ZSB0aGlzIHdpbGwgYnJpbmcgdGhlCm1lbW9yeSBiYWNrIGlmIHRoaXMgaW5pdHJkIG1lbSBoYXMg
dGhlIE1FTUJMT0NLX05PTUFQIGZsYWc/CgpUaGUgcmZjIHZlcnNpb24gWzFdIGludHJvZHVjZSBh
bmQgdXNlIG1lbWJsb2NrX2NsZWFyX25vbWFwKCkgdG8gY2xlYXIgdGhlCk1FTUJMT0NLX05PTUFQ
IG9mIHRoaXMgaW5pdHJkIG1lbWJsb2NrLgpTbyBtYXliZSB0aGUgdXNhZ2Ugb2YgbWVtYmxvY2tf
cmVtb3ZlKCkgaXMganVzdCB0byBhdm9pZCBpbnRyb2R1Y2luZyBuZXcKZnVuY3Rpb24obWVtYmxv
Y2tfY2xlYXJfbm9tYXApPwoKU2luY2UgY29tbWl0IDRjNTQ2YjhhMzQ2OSAoIm1lbWJsb2NrOiBh
ZGQgbWVtYmxvY2tfY2xlYXJfbm9tYXAoKSIpIGFscmVhZHkKaW50cm9kdWNlZCBtZW1ibG9ja19j
bGVhcl9ub21hcCgpLiBDYW4gd2UgdXNlIHRoaXMgdG8gcmVtb3ZlIGZsYWcgTUVNQkxPQ0tfTk9N
QVAKdG8gc29sdmUgdGhpcyBwcm9ibGVtIHJhdGhlciB0aGFuIGJyaW5nIGZsYWcgTUVNQkxPQ0tf
TUlSUk9SIGJhY2s/CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5l
bC8yMDE2MDIwMjE4MDYyMi5HUDEwMTY2QGFybS5jb20vVC8jdAo+IC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
