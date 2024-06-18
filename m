Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B34C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PyZXvDulnUJgutk9+HgnXWPuLaLy1gtSisUthTc9TKo=; b=iUzp5OoZfxk6/Q
	yZ4KW05P4yQWR7RBAxh0M0rLAzdvxuXXXgkr4wDiqjGyj6zjk2GkiMSOf7b0vYIZj2sSqoG/Kc3ha
	KcDEOKPloPxzcyfjH9bIKF9ypr/egS22VVIntDTANAwW6xl2UCYXlANTyS+Ew035/BQDxlYAy3zSl
	fOu6NOzbv8yrjOuVtOyGy7tMxlOGi7gfOwx3wEfIE5KgvUfJoqCYJRxDPDOrSAzZrGe//mOUdKXr3
	vxu+9XYe2nizz6lnemnNHx0Cm50d/zPCg441yzxUjz4wXwHAZL6Y8C3cX8WC/6JvBCKGzKBmhuXzQ
	3KEM5y7+l57RO3g0Q+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVfl-0000000EFdE-1QwA;
	Tue, 18 Jun 2024 10:02:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVfi-0000000EFbe-2zdx
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:02:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06519C0003;
	Tue, 18 Jun 2024 10:02:34 +0000 (UTC)
Message-ID: <7181600f-21cd-469f-a99d-d6e8a75f9b3d@ghiti.fr>
Date: Tue, 18 Jun 2024 12:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
Content-Language: en-US
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com>
 <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
 <CAPYmKFuLap8SZrcgGM36G85TYshuhMhMA1WUHt1A_VkD9JiTqQ@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAPYmKFuLap8SZrcgGM36G85TYshuhMhMA1WUHt1A_VkD9JiTqQ@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_030239_059867_32EF4638 
X-CRM114-Status: GOOD (  20.89  )
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

T24gMTgvMDYvMjAyNCAxMjowMCwgWHUgTHUgd3JvdGU6Cj4gSGkgQWxleCwKPgo+IEkgd2lsbCBz
ZW5kIGEgbmV3IHZlcnNpb24gbGF0ZXIgdG9kYXkuCgoKR3JlYXQsIHRoYW5rcywgSSdsbCBtYWtl
IHN1cmUgaXQgbGFuZHMgaW4gLWZpeGVzLgoKU29ycnkgaXQgZGlkIG5vdCBnZXQgbWVyZ2VkIHNv
b25lci4KClRoYW5rcywKCkFsZXgKCgo+Cj4gVGhhbmtzLAo+Cj4gWHUgTHUKPgo+IE9uIFR1ZSwg
SnVuIDE4LCAyMDI0IGF0IDU6NDXigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+
IHdyb3RlOgo+PiBIaSBYdSBMdSwKPj4KPj4gT24gMjQvMDgvMjAyMyAxNDowOCwgWHUgTHUgd3Jv
dGU6Cj4+PiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDI6NTjigK9QTSDml63ot68gPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Pj4+IE9uIFdlZCwgQXVnIDksIDIwMjMgYXQgMjow
NeKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Pj4+PiBP
biBUdWUsIDI1IEp1bCAyMDIzIDAwOjA1OjQ5IFBEVCAoLTA3MDApLCBsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tIHdyb3RlOgo+Pj4+Pj4gV2hlbiBhcmNoX2xvY2FsX2lycV9yZXN0b3JlKCkgaXMg
Y2FsbGVkIHdpdGggZmxhZ3MgaW5kaWNhdGluZyBpcnFzCj4+Pj4+PiBkaXNhYmxlZCwgd2UgbmVl
ZCB0byBjbGVhciBTUl9JRSBiaXQgaW4gQ1NSX1NUQVRVUywgd2hlcmVhcyBjdXJyZW50Cj4+Pj4+
PiBpbXBsZW1lbnRhdGlvbiBiYXNlZCBvbiBjc3Jfc2V0KCkgZnVuY3Rpb24gb25seSBzZXRzIFNS
X0lFIGJpdCBvZgo+Pj4+Pj4gQ1NSX1NUQVRVUyB3aGVuIFNSX0lFIGJpdCBvZiBmbGFncyBpcyBo
aWdoIGFuZCBkb2VzIG5vdGhpbmcgd2hlbgo+Pj4+Pj4gU1JfSUUgYml0IG9mIGZsYWdzIGlzIGxv
dy4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIGNvbW1pdCBzdXBwbGllcyBjc3IgY2xlYXIgb3BlcmF0aW9u
IHdoZW4gY2FsbGluZyBpcnEgcmVzdG9yZQo+Pj4+Pj4gZnVuY3Rpb24gd2l0aCBmbGFncyBpbmRp
Y2F0aW5nIGlycSBkaXNhYmxlZC4KPj4+Pj4+Cj4+Pj4+PiBGaXhlczogNmQ2MGI2ZWUwYzk3ICgi
UklTQy1WOiBEZXZpY2UsIHRpbWVyLCBJUlFzLCBhbmQgdGhlIFNCSSIpCj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+
Pj4gICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oIHwgNSArKysrLQo+Pj4+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4K
Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPj4+Pj4+IGluZGV4IDA4ZDRkNmE1Yjdl
OS4uN2MzMWZjM2MzNTU5IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9pcnFmbGFncy5oCj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdz
LmgKPj4+Pj4+IEBAIC00OSw3ICs0OSwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBhcmNoX2lycXNf
ZGlzYWJsZWQodm9pZCkKPj4+Pj4+ICAgIC8qIHNldCBpbnRlcnJ1cHQgZW5hYmxlZCBzdGF0dXMg
Ki8KPj4+Pj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2xvY2FsX2lycV9yZXN0b3JlKHVu
c2lnbmVkIGxvbmcgZmxhZ3MpCj4+Pj4+PiAgICB7Cj4+Pj4+PiAtICAgICBjc3Jfc2V0KENTUl9T
VEFUVVMsIGZsYWdzICYgU1JfSUUpOwo+Pj4+Pj4gKyAgICAgaWYgKGZsYWdzICYgU1JfSUUpCj4+
Pj4+PiArICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX1NUQVRVUywgU1JfSUUpOwo+Pj4+Pj4gKyAg
ICAgZWxzZQo+Pj4+Pj4gKyAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX1NUQVRVUywgU1JfSUUp
Owo+Pj4+PiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGUgb3JpZ2luYWwgdmVyc2lv
biBpcyBjb3JyZWN0Ogo+Pj4+PiBsb2NhbF9pcnFfcmVzdG9yZSgpIG11c3QgYmUgcGFpcmVkIHdp
dGggYSBsb2NhbF9pcnFfc2F2ZSgpLCBzbyB3ZSBjYW4KPj4+Pj4gb25seSBnZXQgaGVyZSB3aXRo
IGludGVycnVwdHMgZGlzYWJsZWQuCj4+Pj4gWWVzLCBpdCBpcyBjb3JyZWN0IGlmIGxvY2FsX2ly
cV9zYXZlKCkgaXMgY2FsbGVkIHdoZW4gaXJxIGlzIGVuYWJsZWQgYmVmb3JlLgo+Pj4+IFRoZSBm
bGFncyByZXR1cm5lZCB3aWxsIGJlIFNSX0lFLiBBbmQgaXQgaXMgc2FmZSB0byBjYWxsIGxvY2Fs
X2lycV9yZXN0b3JlKCkKPj4+PiB3aXRoIGZsYWcgU1JfSUUgaW4gYW55IGNhc2UuCj4+Pj4KPj4+
PiBIb3dldmVyLCBpZiBsb2NhbF9pcnFfc2F2ZSgpIGlzIGNhbGxlZCB3aGVuIGlycSBpcyBkaXNh
YmxlZC4gVGhlIFNSX0lFIGJpdCBvZgo+Pj4+IGZsYWcgcmV0dXJuZWQgaXMgY2xlYXIuIElmIHNv
bWUgY29kZSBiZXR3ZWVuIGxvY2FsX2lycV9zYXZlKCkgYW5kCj4+Pj4gbG9jYWxfaXJxX3Jlc3Rv
cmUoKSByZWVuYWJsZXMgaXJxLCBjYXVzaW5nIHRoZSBTUl9JRSBiaXQgb2YgQ1NSX1NUQVRVUwo+
Pj4+IGJhY2sgdG8gMSwgdGhlbiBsb2NhbF9pcnFfcmVzdG9yZSgpIGNhbiBub3QgcmVzdG9yZSBp
cnEgc3RhdHVzIGJhY2sgdG8gZGlzYWJsZWQuCj4+Pj4KPj4+PiBIZXJlIGlzIGFuIGV4YW1wbGUg
aW4gZXhpc3RpbmcgZHJpdmVyIChtYXkgbm90IGJlbG9uZyB0byByaXNjdiBhcmNoKSBpbgo+Pj4+
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnRsd2lmaS9ydGw4NzIzYWUvaHcuYy4gVGhl
IHBzZXVkbyBjb2RlCj4+Pj4gYmVoYXZlcyBsaWtlOgo+Pj4+Cj4+Pj4gaW50IHJ0bDg3MjNlX2h3
X2luaXQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcpCj4+Pj4gewo+Pj4+ICAgICAgICBpbnQgZXJy
Owo+Pj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+ICAgICAgICAuLi4KPj4+PiAg
ICAgICAgbG9jYWxfaXJxX3NhdmVfZmxhZ3MoZmxhZ3MpOwo+Pj4+ICAgICAgICBsb2NhbF9pcnFf
ZW5hYmxlKCk7Cj4+Pj4gICAgICAgIC4uLgo+Pj4+ICAgICAgICBsb2NhbF9pcnFfcmVzdG9yZShm
bGFncyk7Cj4+Pj4gICAgICAgIC4uLgo+Pj4+ICAgICAgICByZXR1cm4gZXJyOwo+Pj4+IH0KPj4+
Pgo+Pj4+Cj4+Pj4+PiAgICB9Cj4+Pj4+Pgo+Pj4+Pj4gICAgI2VuZGlmIC8qIF9BU01fUklTQ1Zf
SVJRRkxBR1NfSCAqLwo+Pj4gQSBnZW50bGUgcGluZy4KPj4KPj4gVGhpcyBnb3QgbG9zdCBidXQg
dGhpcyBpcyBzdGlsbCBjb3JyZWN0IGFuZCBuZWVkZWQuCj4+Cj4+IERvIHlvdSB0aGluayB5b3Ug
Y2FuIHJlc3BpbiBhIG5ldyB2ZXJzaW9uPyBPdGhlcndpc2UsIEknbGwgZG8gaXQgYW5kCj4+IGtl
ZXAgeW91IFNvQi4KPj4KPj4gVGhhbmtzLAo+Pgo+PiBBbGV4Cj4+Cj4+Cj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
