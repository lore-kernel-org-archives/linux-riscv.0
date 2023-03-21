Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763E9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 02:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1W8NVmJoWZ2FHHzICYkMOLhZvkndNqyqVUi+FqtBr0=; b=mAW6EgVyn5aF8W
	8Twtb8awT/bmdsW9VlRIuFJ0aXkdlJllchzTnNUkS0eZ8kTLCLQ+n3v2FXB6JB3h9bYuJJHAwBM5x
	PBjnx9ZMCESsYh7r2UOkV6LoPlrk4pvVTy0AFHG36AxebdJOrhjgpiOi/2a7SKZrDkvpgccYWxyZy
	PpxTDcxkhPr8dhQxyo4tinQIZk5vXuC8vgIKwFLaWVsB59jOW7p/NGGDEOwTtqBIJFhhqqOR33EFu
	qQ51tueVmkSbuB6kB26k4IFgXsU1Nqz27v7DuEk6scbBJWBP5NeAhuxDx/jE3bERTqJlQjhhbtXXC
	ImXXehK97ozLIDMeGCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRxi-00B2qk-13;
	Tue, 21 Mar 2023 02:42:58 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peRxb-00B2pZ-1j
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 02:42:54 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 32L2gFuL055035;
	Tue, 21 Mar 2023 10:42:15 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from APC323 (10.0.12.101) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 21 Mar 2023 10:42:14 +0800
Date: Tue, 21 Mar 2023 10:42:37 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Zong Li <zongbox@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <guoren@kernel.org>, <sergey.matyukevich@syntacore.com>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <x5710999x@gmail.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>, <alistair.francis@wdc.com>
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing
 TLB
Message-ID: <ZBkZnRG4FYqjGiLz@APC323>
References: <20230313034906.2401730-1-dylan@andestech.com>
 <CA+ZOyahmpKXq2K-VqKkfN8t5aLDwU-OvL46oj9nNpdm6ZU3qNQ@mail.gmail.com>
 <ZBAh4EY2RNLryzEW@APC323>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBAh4EY2RNLryzEW@APC323>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Originating-IP: [10.0.12.101]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 32L2gFuL055035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_194252_025929_9FFEC532 
X-CRM114-Status: GOOD (  27.83  )
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

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMDM6Mjc6MzBQTSArMDgwMCwgRHlsYW4gSmhvbmcgd3Jv
dGU6Cj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6MjI6NDNBTSArMDgwMCwgWm9uZyBMaSB3
cm90ZToKPiA+IER5bGFuIEpob25nIDxkeWxhbkBhbmRlc3RlY2guY29tPiDmlrwgMjAyM+W5tDPm
nIgxM+aXpSDpgLHkuIAg5LiL5Y2IMTI6Mjnlr6vpgZPvvJoKPiA+ID4KPiA+ID4gQ3VycmVudGx5
LCB3ZSBwYXNzIHRoZSBDT05URVhUSUQgaW5zdGVhZCBvZiB0aGUgQVNJRCB0byB0aGUgVExCIGZs
dXNoCj4gPiA+IGZ1bmN0aW9uLiBXZSBzaG91bGQgb25seSB0YWtlIHRoZSBBU0lEIGZpZWxkIHRv
IHByZXZlbnQgZnJvbSB0b3VjaGluZwo+ID4gPiB0aGUgcmVzZXJ2ZWQgYml0IGZpZWxkLgo+ID4g
Pgo+ID4gPiBGaXhlczogM2YxZTc4Mjk5OGNkICgicmlzY3Y6IGFkZCBBU0lELWJhc2VkIHRsYmZs
dXNoaW5nIG1ldGhvZHMiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEeWxhbiBKaG9uZyA8ZHlsYW5A
YW5kZXN0ZWNoLmNvbT4KPiA+ID4gLS0tCj4gPiAKPiA+IEhpIER5bGFuLAo+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwgdGhlcmUgd2FzIGEgcGF0Y2gg
ZnJvbQo+ID4gQWxpc3RhaXIgRnJhbmNpcyBkaWQgdGhlIHNpbWlsYXIgZml4LiBQZXJoYXBzIHdl
IHNob3VsZCB0cmFjayB0aGF0Cj4gPiBwYXRjaCB0byBzZWUgd2h5IGl0IGRvZXNuJ3QgYmUgbWVy
Z2VkLiBUaGFua3MuCj4gPiAKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFp
bC9saW51eC1yaXNjdi8yMDIyLU1hcmNoLzAxMzU1OC5odG1sCj4gPgo+IEhpIFpvbmcsCj4gVGhh
bmtzIGZvciB0aGUgcmVtaW5kZXIsIEkgZGlkbid0IG5vdGljZSB0aGF0IEFsaXN0YWlyIGhhZCBz
ZW50IHRoZSBzYW1lIHBhdGNoIGJlZm9yZS4KPiAKPiBIaSBQYWxtZXIsIEFsaXN0YWlyCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjItTWFyY2gv
MDEzNTk3Lmh0bWwKPiBUaGlzIHBhdGNoIGRvZXMgbm90IHNlZW0gdG8gYmUgY2hlcnJ5LXBpY2tl
ZCBiYWNrIHRvIHRoZSByZWxlYXNlZCBsaW51eCBrZXJuZWwsCj4gYW5kIEkgaGF2ZSBub3Qgc2Vl
biB0aGUgdjQgcGF0Y2guIE1heSBJIGFzayBob3cgaXMgdGhlIGZvbGxvdy11cCBwcm9ncmVzcyBv
ZiB0aGlzIHBhdGNoPwo+IAo+IEJlc3QsCj4gRHlsYW4KPgoKSGkgUGFsbWVyLAoKUGluZy4gQW55
IHVwZGF0ZSBvbiB0aGlzPwoKQmVzdCwKRHlsYW4KCj4gPiA+IENoYW5nZXMgZnJvbSB2MjoKPiA+
ID4gLSBSZW1vdmUgdW5zdWVkIEVYUE9SVF9TWU1CT0woKQo+ID4gPiAtLS0KPiA+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiA+ID4gIGFyY2gvcmlzY3YvbW0v
Y29udGV4dC5jICAgICAgICAgICB8IDIgKy0KPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyAgICAgICAgICB8IDIgKy0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4g
PiA+IGluZGV4IDkwN2I5ZWZkMzlhOC4uNTk3ZDZkOGFlYzI4IDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiA+IEBAIC0xMiw2ICsxMiw4IEBACj4gPiA+ICAjaW5j
bHVkZSA8YXNtL2VycmF0YV9saXN0Lmg+Cj4gPiA+Cj4gPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+
ID4gPiArZXh0ZXJuIHVuc2lnbmVkIGxvbmcgYXNpZF9tYXNrOwo+ID4gPiArCj4gPiA+ICBzdGF0
aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX2FsbCh2b2lkKQo+ID4gPiAgewo+ID4gPiAg
ICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgic2ZlbmNlLnZtYSIgOiA6IDogIm1lbW9yeSIp
Owo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMgYi9hcmNoL3Jpc2N2
L21tL2NvbnRleHQuYwo+ID4gPiBpbmRleCA4MGNlOWNhYmE4ZDIuLjZkMWFlYjA2M2U4MSAxMDA2
NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9tbS9jb250ZXh0LmMKPiA+ID4gQEAgLTIyLDcgKzIyLDcgQEAgREVGSU5FX1NUQVRJQ19L
RVlfRkFMU0UodXNlX2FzaWRfYWxsb2NhdG9yKTsKPiA+ID4KPiA+ID4gIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGFzaWRfYml0czsKPiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIG51bV9hc2lkczsK
PiA+ID4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiA+ID4gK3Vuc2lnbmVkIGxv
bmcgYXNpZF9tYXNrOwo+ID4gPgo+ID4gPiAgc3RhdGljIGF0b21pY19sb25nX3QgY3VycmVudF92
ZXJzaW9uOwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
IGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiA+IGluZGV4IGNlN2RmYzgxYmIzZi4uYmE0
YzI3MTg3Yzk1IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+
ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiA+IEBAIC0yNyw3ICsyNyw3IEBA
IHN0YXRpYyB2b2lkIF9fc2JpX3RsYl9mbHVzaF9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ID4gICAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1
c2ggbmVlZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiA+ICAgICAgICAgYnJvYWRj
YXN0ID0gY3B1bWFza19hbnlfYnV0KGNtYXNrLCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+ID4gPiAg
ICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3IpKSB7
Cj4gPiA+IC0gICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9taWNfbG9uZ19y
ZWFkKCZtbS0+Y29udGV4dC5pZCk7Cj4gPiA+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGFzaWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4g
PiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAvKgo+ID4gPiAgICAgICAgICAgICAgICAgICogVExC
IHdpbGwgYmUgaW1tZWRpYXRlbHkgZmx1c2hlZCBvbiBoYXJ0cyBjb25jdXJyZW50bHkKPiA+ID4g
LS0KPiA+ID4gMi4zNC4xCj4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
