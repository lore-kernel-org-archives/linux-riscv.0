Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFCECCA473
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpBRQGULF7dS49bKXV/cpWFBzsnIwI0Pd4wx0Vun8lk=; b=J0Gg2xfBMfsgXN
	6BTEZnRoN/wSKp+tsraclzytaBhnu52Dd4mPfL41ORx0EVl7SCmC6+jP5o+ydCurHgnsZiyf6lpp5
	F/KgX4Qc2YwBHhnC9IcQvnBYXJMktZVKxAhoq8lRVA9BdMjA07MxLJgv4jB+dackQE5bFuzKaPbK7
	aky9QGPBNQ18Pnaut5/anBezHWB/ElHGq+p9LFoJxMFurDXpUMAG7iTM0MGa3LGQOKw/4jWflhs5/
	KqaodoHrNuNycm8o+rR+zK7C2o7gMvqNfcSgLl8ByAbMkSRmkvBZiFd92nl/ZNkXIMjA+3vgrkScQ
	FMMaZYTlqM7NgNB1wYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDKx-000A3p-8n; Thu, 09 Jun 2022 08:16:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDKj-0009wt-RN; Thu, 09 Jun 2022 08:16:03 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LJcLl2xRHz1K9H5;
	Thu,  9 Jun 2022 16:14:07 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 9 Jun 2022 16:15:57 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 9 Jun 2022 16:15:55 +0800
Message-ID: <1e7df7bc-5a18-f76a-4408-0579a60c91e3@huawei.com>
Date: Thu, 9 Jun 2022 16:15:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: mawupeng <mawupeng1@huawei.com>
Subject: Re: [PATCH v3 5/6] mm: Add mirror flag back on initrd memory
To: <ardb@kernel.org>, <david@redhat.com>
CC: <rppt@kernel.org>, <corbet@lwn.net>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <dvhart@infradead.org>, <andy@infradead.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-6-mawupeng1@huawei.com>
 <99900b31-2605-2c85-a1b7-9ef2666b58da@redhat.com>
 <CAMj1kXGkzjq3koW_sgO4uzrdtwqSqzsJfT5ABYyvodf+ggXT2w@mail.gmail.com>
 <29900b05-ec44-76a2-645a-22a13399d7fd@huawei.com>
 <YqBzwgTgWEAx8J/C@kernel.org>
 <cd0e727d-8ad6-2d74-55f5-498394aae297@redhat.com>
 <CAMj1kXEKKcnPE5crMYbuFpDJBqmgjFwna84MzAZkfp-mM3B7vA@mail.gmail.com>
In-Reply-To: <CAMj1kXEKKcnPE5crMYbuFpDJBqmgjFwna84MzAZkfp-mM3B7vA@mail.gmail.com>
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_011602_253353_B20D30EB 
X-CRM114-Status: GOOD (  29.50  )
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

CgrlnKggMjAyMi82LzggMTg6MTIsIEFyZCBCaWVzaGV1dmVsIOWGmemBkzoKPiBPbiBXZWQsIDgg
SnVuIDIwMjIgYXQgMTI6MDgsIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4KPj4gT24gMDguMDYuMjIgMTI6MDIsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+PiBP
biBXZWQsIEp1biAwOCwgMjAyMiBhdCAwMzoyNzowOVBNICswODAwLCBtYXd1cGVuZyB3cm90ZToK
Pj4+Pgo+Pj4+IOWcqCAyMDIyLzYvNyAyMjo0OSwgQXJkIEJpZXNoZXV2ZWwg5YaZ6YGTOgo+Pj4+
PiBPbiBUdWUsIDcgSnVuIDIwMjIgYXQgMTQ6MjIsIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiAwNy4wNi4yMiAxMTozOCwgV3VwZW5n
IE1hIHdyb3RlOgo+Pj4+Pj4+IEZyb206IE1hIFd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5jb20+
Cj4+Pj4+Pj4KPj4+Pj4+PiBJbml0cmQgbWVtb3J5IHdpbGwgYmUgcmVtb3ZlZCBhbmQgdGhlbiBh
ZGRlZCBpbiBhcm02NF9tZW1ibG9ja19pbml0KCkgYW5kIHRoaXMKPj4+Pj4+PiB3aWxsIGNhdXNl
IGl0IHRvIGxvc2UgYWxsIG9mIGl0cyBtZW1ibG9jayBmbGFncy4gVGhlIGxvc3Qgb2YgTUVNQkxP
Q0tfTUlSUk9SCj4+Pj4+Pj4gZmxhZyB3aWxsIGxlYWQgdG8gZXJyb3IgbG9nIHByaW50ZWQgYnkg
ZmluZF96b25lX21vdmFibGVfcGZuc19mb3Jfbm9kZXMgaWYKPj4+Pj4+PiB0aGUgbG93ZXIgNEcg
cmFuZ2UgaGFzIHNvbWUgbm9uLW1pcnJvcmVkIG1lbW9yeS4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIG9y
ZGVyIHRvIHNvbHZlIHRoaXMgcHJvYmxlbSwgdGhlIGxvc3QgTUVNQkxPQ0tfTUlSUk9SIGZsYWcg
d2lsbCBiZQo+Pj4+Pj4+IHJlaW5zdGFsbGVkIGlmIHRoZSBvcmlnaW4gbWVtYmxvY2sgaGFzIHRo
aXMgZmxhZy4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hIFd1cGVuZyA8bWF3dXBl
bmcxQGh1YXdlaS5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gICAgYXJjaC9hcm02NC9tbS9pbml0
LmMgICAgIHwgIDkgKysrKysrKysrCj4+Pj4+Pj4gICAgaW5jbHVkZS9saW51eC9tZW1ibG9jay5o
IHwgIDEgKwo+Pj4+Pj4+ICAgIG1tL21lbWJsb2NrLmMgICAgICAgICAgICB8IDIwICsrKysrKysr
KysrKysrKysrKysrCj4+Pj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCsp
Cj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9pbml0LmMgYi9hcmNo
L2FybTY0L21tL2luaXQuYwo+Pj4+Pj4+IGluZGV4IDMzOWVlODRlNWE2MS4uMTE2NDFmOTI0ZDA4
IDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vaW5pdC5jCj4+Pj4+Pj4gKysrIGIv
YXJjaC9hcm02NC9tbS9pbml0LmMKPj4+Pj4+PiBAQCAtMzUwLDkgKzM1MCwxOCBAQCB2b2lkIF9f
aW5pdCBhcm02NF9tZW1ibG9ja19pbml0KHZvaWQpCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgImluaXRyZCBub3QgZnVsbHkgYWNjZXNzaWJsZSB2aWEgdGhlIGxpbmVhciBtYXBwaW5n
IC0tIHBsZWFzZSBjaGVjayB5b3VyIGJvb3Rsb2FkZXIgLi4uXG4iKSkgewo+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHBoeXNfaW5pdHJkX3NpemUgPSAwOwo+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICB9IGVsc2Ugewo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnQgZmxhZ3Ms
IHJldDsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IG1lbWJs
b2NrX2dldF9mbGFncyhiYXNlLCAmZmxhZ3MpOwo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAocmV0KQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzID0g
MDsKPj4+Pj4+PiArCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVt
b3ZlKGJhc2UsIHNpemUpOyAvKiBjbGVhciBNRU1CTE9DS18gZmxhZ3MgKi8KPj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19hZGQoYmFzZSwgc2l6ZSk7Cj4+Pj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShiYXNlLCBzaXplKTsKPj4+Pj4+
Cj4+Pj4+PiBDYW4geW91IGV4cGxhaW4gd2h5IHdlJ3JlIHJlbW92aW5nK3JlLWFkZGluZyBoZXJl
IGV4YWN0bHk/IElzIGl0IGp1c3QgdG8KPj4+Pj4+IGNsZWFyIGZsYWdzIGFzIHRoZSBjb21tZW50
IGluZGljYXRlcz8KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoaXMgc2hvdWxkIG9ubHkgaGFwcGVuIGlm
IHRoZSBwbGFjZW1lbnQgb2YgdGhlIGluaXRyZCBjb25mbGljdHMgd2l0aAo+Pj4+PiBhIG1lbT0g
Y29tbWFuZCBsaW5lIHBhcmFtZXRlciBvciBpdCBpcyBub3QgY292ZXJlZCBieSBtZW1ibG9jayBm
b3IKPj4+Pj4gc29tZSBvdGhlciByZWFzb24uCj4+Pj4+Cj4+Pj4+IElPVywgdGhpcyBzaG91bGQg
bmV2ZXIgaGFwcGVuLCBhbmQgaWYgcmUtbWVtYmxvY2tfYWRkJ2luZyB0aGlzIG1lbW9yeQo+Pj4+
PiB1bmNvbmRpdGlvbmFsbHkgaXMgY2F1c2luZyBwcm9ibGVtcywgd2Ugc2hvdWxkIGZpeCB0aGF0
IGluc3RlYWQgb2YKPj4+Pj4gd29ya2luZyBhcm91bmQgaXQuCj4+Pj4KPj4+PiBUaGlzIHdpbGwg
aGFwcGVuIGlmIHdlIHVzZSBpbml0cmRtZW09M0csMTAwTSB0byByZXNlcnZlIGluaXRyZCBtZW1v
cnkgYmVsb3cKPj4+PiB0aGUgNEcgbGltaXQgdG8gdGVzdCB0aGlzIHNjZW5hcmlvKGp1c3QgZm9y
IHRlc3RpbmcsIEkgaGF2ZSB0cm91YmxlIHRvIGJvb3QKPj4+PiBxZW11IHdpdGggaW5pdHJkIGVu
YWJsZWQgYW5kIG1lbW9yeSBiZWxvdyA0RyBhcmUgYWxsIG1pcnJvciBtZW1vcnkpLgo+Pj4+Cj4+
Pj4gUmUtbWVtYmxvY2tfYWRkJ2luZyB0aGlzIG1lbW9yeSB1bmNvbmRpdGlvbmFsbHkgc2VlbXMg
ZmluZSBidXQgY2xlYXIgYWxsCj4+Pj4gZmxhZ3MoZXNwZWNpYWxseSBNRU1CTE9DS19NSVJST1Ip
IG1heSBsZWFkIHRvIHNvbWUgZXJyb3IgbG9nLgo+Pj4+Cj4+Pj4+Cj4+Pj4+PiBJZiBpdCdzIHJl
YWxseSBqdXN0IGFib3V0IGNsZWFyaW5nIGZsYWdzLCBJIHdvbmRlciBpZiB3ZSByYXRoZXIgd2Fu
dCB0bwo+Pj4+Pj4gaGF2ZSBhbiBpbnRlcmZhY2UgdGhhdCBkb2VzIGV4YWN0bHkgdGhhdCwgYW5k
IGhpZGVzIHRoZSB3YXkgdGhpcyBpcwo+Pj4+Pj4gYWN0dWFsbHkgaW1wbGVtZW50ZWQgKG9idGFp
biBmbGFncywgcmVtb3ZlLCByZS1hZGQgLi4uKSwgaW50ZXJuYWxseS4KPj4+Pj4+Cj4+Pj4+PiBC
dXQgbW9zdCBwcm9iYWJseSB0aGVyZSBpcyBtb3JlIG1hZ2ljIGluIHRoZSBjb2RlIGFuZCBjbGVh
cmluZyBmbGFncwo+Pj4+Pj4gaXNuJ3QgYWxsIGl0IGVuZHMgdXAgZG9pbmcuCj4+Pj4+Pgo+Pj4+
Pgo+Pj4+PiBJIGRvbid0IHJlbWVtYmVyIGV4YWN0bHkgd2h5IHdlIG5lZWRlZCB0byBjbGVhciB0
aGUgZmxhZ3MsIGJ1dCBJIHRoaW5rCj4+Pj4+IGl0IGhhZCB0byBkbyB3aXRoIHNvbWUgY29ybmVy
IGNhc2Ugd2UgaGl0IHdoZW4gdGhlIGluaXRyZCB3YXMKPj4+Pj4gcGFydGlhbGx5IGNvdmVyZWQu
Cj4+Pj4gSWYgIm1lbT0iIGlzIHNldCBpbiBjb21tYW5kIGxpbmUsIG1lbWJsb2NrX21lbV9saW1p
dF9yZW1vdmVfbWFwKCkgd2lsbAo+Pj4+IHJlbW92ZSBhbGwgbWVtb3J5IGJsb2NrIHdpdGhvdXQg
TUVNQkxPQ0tfTk9NQVAuIE1heWJlIHRoaXMgd2lsbCBicmluZyB0aGUKPj4+PiBtZW1vcnkgYmFj
ayBpZiB0aGlzIGluaXRyZCBtZW0gaGFzIHRoZSBNRU1CTE9DS19OT01BUCBmbGFnPwo+Pj4+Cj4+
Pj4gVGhlIHJmYyB2ZXJzaW9uIFsxXSBpbnRyb2R1Y2UgYW5kIHVzZSBtZW1ibG9ja19jbGVhcl9u
b21hcCgpIHRvIGNsZWFyIHRoZQo+Pj4+IE1FTUJMT0NLX05PTUFQIG9mIHRoaXMgaW5pdHJkIG1l
bWJsb2NrLgo+Pj4+IFNvIG1heWJlIHRoZSB1c2FnZSBvZiBtZW1ibG9ja19yZW1vdmUoKSBpcyBq
dXN0IHRvIGF2b2lkIGludHJvZHVjaW5nIG5ldwo+Pj4+IGZ1bmN0aW9uKG1lbWJsb2NrX2NsZWFy
X25vbWFwKT8KPj4+Pgo+Pj4+IFNpbmNlIGNvbW1pdCA0YzU0NmI4YTM0NjkgKCJtZW1ibG9jazog
YWRkIG1lbWJsb2NrX2NsZWFyX25vbWFwKCkiKSBhbHJlYWR5Cj4+Pj4gaW50cm9kdWNlZCBtZW1i
bG9ja19jbGVhcl9ub21hcCgpLiBDYW4gd2UgdXNlIHRoaXMgdG8gcmVtb3ZlIGZsYWcgTUVNQkxP
Q0tfTk9NQVAKPj4+PiB0byBzb2x2ZSB0aGlzIHByb2JsZW0gcmF0aGVyIHRoYW4gYnJpbmcgZmxh
ZyBNRU1CTE9DS19NSVJST1IgYmFjaz8KPj4+Cj4+PiBBRkFJQ1QsIHRoZXJlIGFyZSB0d28gY29y
bmVyIGNhc2VzIHRoYXQgcmUtYWRkaW5nIGluaXRyZCBtZW1vcnkgY292ZXJzOgo+Pj4gKiBpbml0
cmQgbWVtb3J5IGlzIG5vdCBhIHBhcnQgb2YgdGhlIG1lbW9yeSByZXBvcnRlZCB0byBtZW1ibG9j
aywgZWl0aGVyCj4+PiBiZWNhdXNlIG9mIGZpcm13YXJlIHdlaXJkbmVzcyBvciBiZWNhdXNlIGl0
IHdhcyBjdXQgb3V0IHdpdGggbWVtPQo+Pj4gKiBpbml0cmQgbWVtb3J5IG92ZXJsYXBzIGEgTk9N
QVAgcmVnaW9uCj4+Pgo+Pj4gU28gdG8gbWFrZSBzdXJlIGluaXRyZCBtZW1vcnkgaXMgbWFwcGVk
IHByb3Blcmx5IGFuZCByZXRhaW5zCj4+PiBNRU1CTE9DS19NSVJST1IgSSB0aGluayB0aGUgYmVz
dCB3ZSBjYW4gZG8gaXMKPj4+Cj4+PiAgICAgICAgbWVtYmxvY2tfYWRkKCk7Cj4+PiAgICAgICAg
bWVtYmxvY2tfY2xlYXJfbm9tYXAoKTsKPj4+ICAgICAgICBtZW1ibG9ja19yZXNlcnZlKCk7Cj4+
Cj4+IFdvdWxkIHNpbXBseSBkZXRlY3QrcmVqZWN0aW5nIHRvIGJvb3Qgb24gc3VjaCBzZXR1cHMg
YmUgYW4gb3B0aW9uPyBUaGUKPj4gcmVwbGllcyBzbyBmYXIgaW5kaWNhdGUgdG8gbWUgdGhhdCB0
aGlzIGlzIHJhdGhlciBhIGNvcm5lciBjYXNlIHRoYW4gYQo+PiByZWFzb25hYmxlIHVzZSBjYXNl
Lgo+Pgo+IAo+IFRoZSBzYWQgcmVhbGl0eSBpcyB0aGF0IG1lbT0gaXMga25vd24gdG8gYmUgdXNl
ZCBpbiBwcm9kdWN0aW9uIGZvcgo+IGxpbWl0aW5nIHRoZSBhbW91bnQgb2YgbWVtb3J5IHRoYXQg
dGhlIGtlcm5lbCB0YWtlcyBjb250cm9sIG9mLCBpbgo+IG9yZGVyIHRvIGFsbG93IHRoZSByZW1h
aW5kZXIgdG8gYmUgdXNlZCBpbiBwbGF0Zm9ybSBzcGVjaWZpYyB3YXlzLgo+IAo+IE9mIGNvdXJz
ZSwgdGhlcmUgYXJlIG11Y2ggYmV0dGVyIHdheXMgdG8gYWNoaWV2ZSB0aGF0LCBidXQgZ2l2ZW4g
dGhhdAo+IHdlIGN1cnJlbnRseSBzdXBwb3J0IGl0LCBJIGRvbid0IHRoaW5rIHdlIGNhbiBlYXNp
bHkgYmFjayB0aGF0IG91dC4KPiAKPiBJIGRvIHRoaW5rIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0
byBnbyBvdXQgb2Ygb3VyIHdheSB0byBtYWtlIHRoaXMKPiBjYXNlIHdvcmsgc2VhbWxlc3NseSB3
aXRoIG1pcnJvcmVkIG1lbW9yeSwgdGhvdWdoLiBTbyBJJ2QgcHJlZmVyIHRvCj4gbWFrZSB0aGUg
cmVtb3ZlK3JlLWFkZCBjb25kaXRpb25hbCBvbiB0aGVyZSBhY3R1YWxseSBiZWluZyBhIG5lZWQg
dG8KPiBkbyBzby4gVGhhdCB3YXksIHdlIGRvbid0IGJyZWFrIHRoZSBvbGQgdXNlIGNhc2Ugb3Ig
bWlycm9yZWQgbWVtb3J5LAo+IGFuZCB3aGF0ZXZlciBoYXBwZW5zIHdoZW4gdGhlIHR3byBhcmUg
Y29tYmluZWQgaXMgRE9OVENBUkUuCgpEb2VzIHRoYXQgbWVhbiB0aGF0IHdlIGRvbid0IG5lZWQg
dG8gY2FyZSBhYm91dCB0aGlzIHNjZW5hcmlvIHdpdGgKbWlycm9yIG1lbW9yeT8KClRoYW5rcyBm
b3IgcmV2aWV3aW5nLgoKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
