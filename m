Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E367C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 19:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17E06109F
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17E06109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6DmEdjsRYisqYMtocHZi4Orl+UIWWE86y/MiBNsEi08=; b=cMKUfYCOxN0PXfeHtukp2Npg50
	IAF5fl347OmXZVtS11LwRfxTGvbWXnLgr5mMotc8cwqbAS7H8SrDGlndW5p15bac+bx48z3oinQie
	VUKwUwheT0wrLVjEWAawr2Vd4sATMZG8O7em3RvRQ8sJXHkZSZmiGqa7B62BxpX0XuLfNl9iDLohG
	MvYkT+ggIMdaB9H8myMA2A5VhNQDGeiP7VSeGHqgrjOSuaR+zZQnvyVJOdwYkweXbIuaudSrigogV
	cR0fEoE2hMcQZ6IHnm/E6zJ1JXYmXnbBc51xsgxjggOxkmH9NEqN03iRWWFUkDqkD/J93516LF5UO
	jDSxzDVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llGNh-001haI-NE; Mon, 24 May 2021 19:36:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkzpe-000e4R-GU
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 01:56:40 +0000
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpKwg3wLFzncSx;
 Mon, 24 May 2021 09:52:51 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 09:56:26 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 09:56:25 +0800
Subject: Re: [PATCH RFC v2] riscv: Enable KFENCE for riscv64
To: Palmer Dabbelt <palmer@dabbelt.com>, <elver@google.com>
References: <mhng-f2825fd1-15e0-403d-b972-d327494525e6@palmerdabbelt-glaptop>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
 <glider@google.com>, <dvyukov@google.com>, <linux-riscv@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <0b584a85-79e2-fcdd-2adf-5b63f56cc591@huawei.com>
Date: Mon, 24 May 2021 09:56:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <mhng-f2825fd1-15e0-403d-b972-d327494525e6@palmerdabbelt-glaptop>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_185638_901599_48C922E1 
X-CRM114-Status: GOOD (  21.81  )
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

CgpPbiAyMDIxLzUvMjMgMTA6MzgsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIEZyaSwgMTQg
TWF5IDIwMjEgMDg6MjA6MTAgUERUICgtMDcwMCksIGVsdmVyQGdvb2dsZS5jb20gd3JvdGU6Cj4+
IE9uIEZyaSwgMTQgTWF5IDIwMjEgYXQgMDU6MTEsIExpdSBTaGl4aW4gPGxpdXNoaXhpbjJAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4+PiBBZGQgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGltcGxlbWVudGF0
aW9uIGRldGFpbHMgZm9yIEtGRU5DRSBhbmQgZW5hYmxlCj4+PiBLRkVOQ0UgZm9yIHRoZSByaXNj
djY0IGFyY2hpdGVjdHVyZS4gSW4gcGFydGljdWxhciwgdGhpcyBpbXBsZW1lbnRzIHRoZQo+Pj4g
cmVxdWlyZWQgaW50ZXJmYWNlIGluIDxhc20va2ZlbmNlLmg+Lgo+Pj4KPj4+IEtGRU5DRSByZXF1
aXJlcyB0aGF0IGF0dHJpYnV0ZXMgZm9yIHBhZ2VzIGZyb20gaXRzIG1lbW9yeSBwb29sIGNhbgo+
Pj4gaW5kaXZpZHVhbGx5IGJlIHNldC4gVGhlcmVmb3JlLCBmb3JjZSB0aGUga2ZlbmNlIHBvb2wg
dG8gYmUgbWFwcGVkIGF0Cj4+PiBwYWdlIGdyYW51bGFyaXR5Lgo+Pj4KPj4+IEkgdGVzdGVkIHRo
aXMgcGF0Y2ggdXNpbmcgdGhlIHRlc3RjYXNlcyBpbiBrZmVuY2VfdGVzdC5jIGFuZCBhbGwgcGFz
c2VkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IExpdSBTaGl4aW4gPGxpdXNoaXhpbjJAaHVhd2Vp
LmNvbT4KPj4KPj4gQWNrZWQtYnk6IE1hcmNvIEVsdmVyIDxlbHZlckBnb29nbGUuY29tPgo+Pgo+
Pgo+Pj4gLS0tCj4+PiB2MS0+djI6IENoYW5nZSBrbWFsbG9jKCkgdG8gcHRlX2FsbG9jX29uZV9r
ZXJuZWwoKSBmb3IgYWxsb2NhdGluZyBwdGUuCj4+Pgo+Pj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgfCAgMSArCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZmVuY2UuaCB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gIGFyY2gvcmlzY3YvbW0v
ZmF1bHQuYyAgICAgICAgICAgfCAxMSArKysrKystCj4+PiAgMyBmaWxlcyBjaGFuZ2VkLCA2MiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va2ZlbmNlLmgKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBpbmRleCBjNDI2ZTdkMjA5MDcuLjAw
MGQ4YWJhMTAzMCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4+PiBAQCAtNjQsNiArNjQsNyBAQCBjb25maWcgUklTQ1YKPj4+
ICAgICAgICAgc2VsZWN0IEhBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFCj4+PiAgICAgICAg
IHNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4gaWYgTU1VICYmIDY0QklUCj4+PiAgICAgICAgIHNlbGVj
dCBIQVZFX0FSQ0hfS0FTQU5fVk1BTExPQyBpZiBNTVUgJiYgNjRCSVQKPj4+ICsgICAgICAgc2Vs
ZWN0IEhBVkVfQVJDSF9LRkVOQ0UgaWYgTU1VICYmIDY0QklUCj4+PiAgICAgICAgIHNlbGVjdCBI
QVZFX0FSQ0hfS0dEQgo+Pj4gICAgICAgICBzZWxlY3QgSEFWRV9BUkNIX0tHREJfUVhGRVJfUEtU
Cj4+PiAgICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfTU1BUF9STkRfQklUUyBpZiBNTVUKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tmZW5jZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rZmVuY2UuaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYzI1ZDY3ZTBiOGJhCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2tmZW5jZS5oCj4+PiBAQCAtMCwwICsxLDUxIEBACj4+PiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4+ICsKPj4+ICsjaWZuZGVmIF9B
U01fUklTQ1ZfS0ZFTkNFX0gKPj4+ICsjZGVmaW5lIF9BU01fUklTQ1ZfS0ZFTkNFX0gKPj4+ICsK
Pj4+ICsjaW5jbHVkZSA8bGludXgva2ZlbmNlLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3Bmbi5o
Pgo+Pj4gKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZ2FsbG9jLmg+Cj4+PiArI2luY2x1ZGUgPGFz
bS9wZ3RhYmxlLmg+Cj4+PiArCj4+PiArc3RhdGljIGlubGluZSBib29sIGFyY2hfa2ZlbmNlX2lu
aXRfcG9vbCh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgICAgaW50IGk7Cj4+PiArICAgICAgIHVuc2ln
bmVkIGxvbmcgYWRkcjsKPj4+ICsgICAgICAgcHRlX3QgKnB0ZTsKPj4+ICsgICAgICAgcG1kX3Qg
KnBtZDsKPj4+ICsKPj4+ICsgICAgICAgZm9yIChhZGRyID0gKHVuc2lnbmVkIGxvbmcpX19rZmVu
Y2VfcG9vbDsgaXNfa2ZlbmNlX2FkZHJlc3MoKHZvaWQgKilhZGRyKTsKPj4+ICsgICAgICAgICAg
ICBhZGRyICs9IFBBR0VfU0laRSkgewo+Pj4gKyAgICAgICAgICAgICAgIHB0ZSA9IHZpcnRfdG9f
a3B0ZShhZGRyKTsKPj4+ICsgICAgICAgICAgICAgICBwbWQgPSBwbWRfb2ZmX2soYWRkcik7Cj4+
PiArCj4+PiArICAgICAgICAgICAgICAgaWYgKCFwbWRfbGVhZigqcG1kKSAmJiBwdGVfcHJlc2Vu
dCgqcHRlKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4gKwo+Pj4g
KyAgICAgICAgICAgICAgIHB0ZSA9IHB0ZV9hbGxvY19vbmVfa2VybmVsKCZpbml0X21tKTsKPj4+
ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgUFRSU19QRVJfUFRFOyBpKyspCj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBzZXRfcHRlKHB0ZSArIGksIHBmbl9wdGUoUEZOX0RPV04o
X19wYSgoYWRkciAmIFBNRF9NQVNLKSArIGkgKiBQQUdFX1NJWkUpKSwgUEFHRV9LRVJORUwpKTsK
Pj4+ICsKPj4+ICsgICAgICAgICAgICAgICBzZXRfcG1kKHBtZCwgcGZuX3BtZChQRk5fRE9XTihf
X3BhKHB0ZSkpLCBQQUdFX1RBQkxFKSk7Cj4+PiArICAgICAgICAgICAgICAgZmx1c2hfdGxiX2tl
cm5lbF9yYW5nZShhZGRyLCBhZGRyICsgUE1EX1NJWkUpOwo+Pj4gKyAgICAgICB9Cj4+PiArCj4+
PiArICAgICAgIHJldHVybiB0cnVlOwo+Pj4gK30KPgo+IEknbSBub3QgZnVuZGFtZW50YWxseSBv
cHBvc2VkIHRvIHRoaXMsIGJ1dCB0aGUgYXJtNjQgYXBwcm9hY2ggd2hlcmUgcGFnZXMgYXJlIHNw
bGl0IGF0IHJ1bnRpbWUgd2hlbiB0aGV5IGhhdmUgbWlzLW1hdGNoZWQgcGVybWlzc2lvbnMgc2Vl
bXMgY2xlYW5lciB0byBtZS4gIEknbSBub3Qgc3VyZSB3aHkgeDg2IGlzIGRvaW5nIGl0IGR1cmlu
ZyBpbml0LCB0aG91Z2gsIGFzIElJVUMgc2V0X21lbW9yeV80aygpIHdpbGwgd29yayBmb3IgYm90
aC4KPgo+IFVwZ3JhZGluZyBvdXIgX19zZXRfbWVtb3J5KCkgd2l0aCB0aGUgYWJpbGl0eSB0byBz
cGxpdCBwYWdlcyAobGlrZSBhcm02NCBoYXMpIHNlZW1zIGdlbmVyYWxseSB1c2VmdWwsIGFuZCB3
b3VsZCBsZXQgdXMgdHJpdmlhbGx5IGltcGxlbWVudCB0aGUgZHluYW1pYyB2ZXJzaW9uIG9mIHRo
aXMuICBXZSdsbCBwcm9iYWJseSBlbmQgdXAgd2l0aCB0aGUgYWJpbGl0eSB0byBzcGxpdCBwYWdl
cyBhbnl3YXksIHNvIHRoYXQgd291bGQgYmUgdGhlIGxlYXN0IGNvZGUgaW4gdGhlIGxvbmcgcnVu
Lgo+Cj4gSWYgdGhlcmUncyBzb21lIHJlYXNvbiB0byBwcmVmZXIgc3RhdGljYWxseSBhbGxvY2F0
aW5nIHRoZSBwYWdlcyBJJ20gZmluZSB3aXRoIHRoaXMsIHRob3VnaC4KPgpBcyBJIHVuZGVyc3Rh
bmTvvIx0aGUgYXJtNjQgYXBwcm9hY2ggZG9lcyBub3QgaW1wbGVtZW50IGR5bmFtaWMgc3BsaXR0
aW5nLgpJZiBrZmVuY2UgaXMgZW5hYmxlZCBpbiBhcmNoIGFybTY0LCB0aGUgbGluZWFyIG1hcCBu
ZWVkIHRvIGJlIGZvcmNpYmx5IG1hcHBlZAphdCBwYWdlIGdyYW51bGFyaXR5LiBCdXQgeDg2IGRv
ZXMgbm90IGhhdmUgc3VjaCBjb25zdHJhaW50cyBhcyBpdCBvbmx5IHNwbGl0IHBhZ2VzCmluIHRo
ZSBrZmVuY2UgcG9vbCwgc28gSSB0aGluayB0aGUgeDg2IGFwcHJvYWNoIGlzIGJldHRlciBhcyBp
dCBoYXMgbGVzcyBpbmZsdWVuY2UKb24gdGhlIHdob2xlLgo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxp
bmUgYm9vbCBrZmVuY2VfcHJvdGVjdF9wYWdlKHVuc2lnbmVkIGxvbmcgYWRkciwgYm9vbCBwcm90
ZWN0KQo+Pj4gK3sKPj4+ICsgICAgICAgcHRlX3QgKnB0ZSA9IHZpcnRfdG9fa3B0ZShhZGRyKTsK
Pj4+ICsKPj4+ICsgICAgICAgaWYgKHByb3RlY3QpCj4+PiArICAgICAgICAgICAgICAgc2V0X3B0
ZShwdGUsIF9fcHRlKHB0ZV92YWwoKnB0ZSkgJiB+X1BBR0VfUFJFU0VOVCkpOwo+Pj4gKyAgICAg
ICBlbHNlCj4+PiArICAgICAgICAgICAgICAgc2V0X3B0ZShwdGUsIF9fcHRlKHB0ZV92YWwoKnB0
ZSkgfCBfUEFHRV9QUkVTRU5UKSk7Cj4+PiArCj4+PiArICAgICAgIGZsdXNoX3RsYl9rZXJuZWxf
cmFuZ2UoYWRkciwgYWRkciArIFBBR0VfU0laRSk7Cj4+PiArCj4+PiArICAgICAgIHJldHVybiB0
cnVlOwo+Pj4gK30KPj4+ICsKPj4+ICsjZW5kaWYgLyogX0FTTV9SSVNDVl9LRkVOQ0VfSCAqLwo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1
bHQuYwo+Pj4gaW5kZXggMDk2NDYzY2M2ZmZmLi5hYTA4ZGQyZjhmYWUgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+
Pj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4+ICAjaW5jbHVkZSA8bGludXgvc2lnbmFsLmg+Cj4+PiAg
I2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPj4+ICAjaW5jbHVkZSA8bGludXgva3Byb2Jlcy5o
Pgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9rZmVuY2UuaD4KPj4+Cj4+PiAgI2luY2x1ZGUgPGFzbS9w
dHJhY2UuaD4KPj4+ICAjaW5jbHVkZSA8YXNtL3RsYmZsdXNoLmg+Cj4+PiBAQCAtNDUsNyArNDYs
MTUgQEAgc3RhdGljIGlubGluZSB2b2lkIG5vX2NvbnRleHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
IHVuc2lnbmVkIGxvbmcgYWRkcikKPj4+ICAgICAgICAgICogT29wcy4gVGhlIGtlcm5lbCB0cmll
ZCB0byBhY2Nlc3Mgc29tZSBiYWQgcGFnZS4gV2UnbGwgaGF2ZSB0bwo+Pj4gICAgICAgICAgKiB0
ZXJtaW5hdGUgdGhpbmdzIHdpdGggZXh0cmVtZSBwcmVqdWRpY2UuCj4+PiAgICAgICAgICAqLwo+
Pj4gLSAgICAgICBtc2cgPSAoYWRkciA8IFBBR0VfU0laRSkgPyAiTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIiA6ICJwYWdpbmcgcmVxdWVzdCI7Cj4+PiArICAgICAgIGlmIChhZGRyIDwgUEFHRV9T
SVpFKQo+Pj4gKyAgICAgICAgICAgICAgIG1zZyA9ICJOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ui
Owo+Pj4gKyAgICAgICBlbHNlIHsKPj4+ICsgICAgICAgICAgICAgICBpZiAoa2ZlbmNlX2hhbmRs
ZV9wYWdlX2ZhdWx0KGFkZHIsIHJlZ3MtPmNhdXNlID09IEVYQ19TVE9SRV9QQUdFX0ZBVUxULCBy
ZWdzKSkKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAg
ICAgICAgICAgICBtc2cgPSAicGFnaW5nIHJlcXVlc3QiOwo+Pj4gKyAgICAgICB9Cj4+PiArCj4+
PiAgICAgICAgIGRpZV9rZXJuZWxfZmF1bHQobXNnLCBhZGRyLCByZWdzKTsKPj4+ICB9Cj4+Pgo+
Pj4gLS0gCj4+PiAyLjE4LjAuaHVhd2VpLjI1Cj4+Pgo+Cj4gLgo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
