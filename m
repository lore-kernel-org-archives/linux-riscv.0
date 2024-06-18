Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB4BC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evuo8/bbXKLyOV5Uv+kt7w1rwq0pw9Lvkglj/BscrIo=; b=4QE2KVXziBzc9q
	x99tWmNs41wRZABcFdcdZyTcqwGiXKqgDJACtmEPIcGpn/nz+GyjjCDtHJy8UDpO8OIWe0+Zyun2j
	ilxOs/Q8keG0NQzzjgLMl84xf/gq8N8H9OQ/do6rpgerWYPA1MqaXxGpTcCOOjNUoEd4d46xv3Vq3
	f7a90ZvncTFvHHrMuocBRTrS3wGjAVhEn8vbEDLjiFLI3yPjmjiJK+BpzLuzJnT7XDY3Fr5TPUgOi
	p1OUmIFpDheYFcMsOUhHIHdASWFvBnXkTo3w7fSveYU8l+SZjWodEiA9aL0WLgb7/2jidRYNAzGGu
	aWWeaEu6/xGjRP/258jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVPE-0000000EDQi-2l3x;
	Tue, 18 Jun 2024 09:45:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVPA-0000000EDOJ-2Z1w
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 09:45:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52AFDC000C;
	Tue, 18 Jun 2024 09:45:29 +0000 (UTC)
Message-ID: <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
Date: Tue, 18 Jun 2024 11:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
Content-Language: en-US
To: Xu Lu <luxu.kernel@bytedance.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_024532_977504_501557E1 
X-CRM114-Status: GOOD (  18.92  )
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

SGkgWHUgTHUsCgpPbiAyNC8wOC8yMDIzIDE0OjA4LCBYdSBMdSB3cm90ZToKPiBPbiBXZWQsIEF1
ZyA5LCAyMDIzIGF0IDI6NTjigK9QTSDml63ot68gPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+PiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDI6MDXigK9QTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4+IE9uIFR1ZSwgMjUgSnVsIDIwMjMgMDA6
MDU6NDkgUERUICgtMDcwMCksIGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20gd3JvdGU6Cj4+Pj4g
V2hlbiBhcmNoX2xvY2FsX2lycV9yZXN0b3JlKCkgaXMgY2FsbGVkIHdpdGggZmxhZ3MgaW5kaWNh
dGluZyBpcnFzCj4+Pj4gZGlzYWJsZWQsIHdlIG5lZWQgdG8gY2xlYXIgU1JfSUUgYml0IGluIENT
Ul9TVEFUVVMsIHdoZXJlYXMgY3VycmVudAo+Pj4+IGltcGxlbWVudGF0aW9uIGJhc2VkIG9uIGNz
cl9zZXQoKSBmdW5jdGlvbiBvbmx5IHNldHMgU1JfSUUgYml0IG9mCj4+Pj4gQ1NSX1NUQVRVUyB3
aGVuIFNSX0lFIGJpdCBvZiBmbGFncyBpcyBoaWdoIGFuZCBkb2VzIG5vdGhpbmcgd2hlbgo+Pj4+
IFNSX0lFIGJpdCBvZiBmbGFncyBpcyBsb3cuCj4+Pj4KPj4+PiBUaGlzIGNvbW1pdCBzdXBwbGll
cyBjc3IgY2xlYXIgb3BlcmF0aW9uIHdoZW4gY2FsbGluZyBpcnEgcmVzdG9yZQo+Pj4+IGZ1bmN0
aW9uIHdpdGggZmxhZ3MgaW5kaWNhdGluZyBpcnEgZGlzYWJsZWQuCj4+Pj4KPj4+PiBGaXhlczog
NmQ2MGI2ZWUwYzk3ICgiUklTQy1WOiBEZXZpY2UsIHRpbWVyLCBJUlFzLCBhbmQgdGhlIFNCSSIp
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4+
Pj4gLS0tCj4+Pj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmggfCA1ICsrKyst
Cj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oCj4+Pj4gaW5kZXggMDhkNGQ2YTViN2U5
Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
cnFmbGFncy5oCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oCj4+
Pj4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGFyY2hfaXJxc19kaXNhYmxl
ZCh2b2lkKQo+Pj4+ICAgLyogc2V0IGludGVycnVwdCBlbmFibGVkIHN0YXR1cyAqLwo+Pj4+ICAg
c3RhdGljIGlubGluZSB2b2lkIGFyY2hfbG9jYWxfaXJxX3Jlc3RvcmUodW5zaWduZWQgbG9uZyBm
bGFncykKPj4+PiAgIHsKPj4+PiAtICAgICBjc3Jfc2V0KENTUl9TVEFUVVMsIGZsYWdzICYgU1Jf
SUUpOwo+Pj4+ICsgICAgIGlmIChmbGFncyAmIFNSX0lFKQo+Pj4+ICsgICAgICAgICAgICAgY3Ny
X3NldChDU1JfU1RBVFVTLCBTUl9JRSk7Cj4+Pj4gKyAgICAgZWxzZQo+Pj4+ICsgICAgICAgICAg
ICAgY3NyX2NsZWFyKENTUl9TVEFUVVMsIFNSX0lFKTsKPj4+IFVubGVzcyBJJ20gbWlzc2luZyBz
b21ldGhpbmcsIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIGlzIGNvcnJlY3Q6Cj4+PiBsb2NhbF9pcnFf
cmVzdG9yZSgpIG11c3QgYmUgcGFpcmVkIHdpdGggYSBsb2NhbF9pcnFfc2F2ZSgpLCBzbyB3ZSBj
YW4KPj4+IG9ubHkgZ2V0IGhlcmUgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+PiBZZXMsIGl0
IGlzIGNvcnJlY3QgaWYgbG9jYWxfaXJxX3NhdmUoKSBpcyBjYWxsZWQgd2hlbiBpcnEgaXMgZW5h
YmxlZCBiZWZvcmUuCj4+IFRoZSBmbGFncyByZXR1cm5lZCB3aWxsIGJlIFNSX0lFLiBBbmQgaXQg
aXMgc2FmZSB0byBjYWxsIGxvY2FsX2lycV9yZXN0b3JlKCkKPj4gd2l0aCBmbGFnIFNSX0lFIGlu
IGFueSBjYXNlLgo+Pgo+PiBIb3dldmVyLCBpZiBsb2NhbF9pcnFfc2F2ZSgpIGlzIGNhbGxlZCB3
aGVuIGlycSBpcyBkaXNhYmxlZC4gVGhlIFNSX0lFIGJpdCBvZgo+PiBmbGFnIHJldHVybmVkIGlz
IGNsZWFyLiBJZiBzb21lIGNvZGUgYmV0d2VlbiBsb2NhbF9pcnFfc2F2ZSgpIGFuZAo+PiBsb2Nh
bF9pcnFfcmVzdG9yZSgpIHJlZW5hYmxlcyBpcnEsIGNhdXNpbmcgdGhlIFNSX0lFIGJpdCBvZiBD
U1JfU1RBVFVTCj4+IGJhY2sgdG8gMSwgdGhlbiBsb2NhbF9pcnFfcmVzdG9yZSgpIGNhbiBub3Qg
cmVzdG9yZSBpcnEgc3RhdHVzIGJhY2sgdG8gZGlzYWJsZWQuCj4+Cj4+IEhlcmUgaXMgYW4gZXhh
bXBsZSBpbiBleGlzdGluZyBkcml2ZXIgKG1heSBub3QgYmVsb25nIHRvIHJpc2N2IGFyY2gpIGlu
Cj4+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9ydGw4NzIzYWUvaHcuYy4g
VGhlIHBzZXVkbyBjb2RlCj4+IGJlaGF2ZXMgbGlrZToKPj4KPj4gaW50IHJ0bDg3MjNlX2h3X2lu
aXQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcpCj4+IHsKPj4gICAgICAgaW50IGVycjsKPj4gICAg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gICAgICAgLi4uCj4+ICAgICAgIGxvY2FsX2lycV9z
YXZlX2ZsYWdzKGZsYWdzKTsKPj4gICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+PiAgICAgICAu
Li4KPj4gICAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwo+PiAgICAgICAuLi4KPj4gICAg
ICAgcmV0dXJuIGVycjsKPj4gfQo+Pgo+Pgo+Pj4+ICAgfQo+Pj4+Cj4+Pj4gICAjZW5kaWYgLyog
X0FTTV9SSVNDVl9JUlFGTEFHU19IICovCj4gQSBnZW50bGUgcGluZy4KCgpUaGlzIGdvdCBsb3N0
IGJ1dCB0aGlzIGlzIHN0aWxsIGNvcnJlY3QgYW5kIG5lZWRlZC4KCkRvIHlvdSB0aGluayB5b3Ug
Y2FuIHJlc3BpbiBhIG5ldyB2ZXJzaW9uPyBPdGhlcndpc2UsIEknbGwgZG8gaXQgYW5kIAprZWVw
IHlvdSBTb0IuCgpUaGFua3MsCgpBbGV4CgoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
