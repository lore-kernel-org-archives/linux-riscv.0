Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB2CC6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YFzbPR9PbUOqmdqgJN2Sti0N9uy1ugiz9Xj82TmFQw=; b=MtLs3t4ZEfn6sF
	XCZZ977roB09Yc8YFH/ghx2W5mWfWG15ap0YTnnViS16VQIzPzpXKEk5Tf8IIkwSdhJ8kgrc6qBRC
	DI7Byg7UqLV62ZVFRYMC44EerAeXptRmPC5UPoXVsYg7B79F8XkoP7feyntkxMrvluiAB1S2vQG5i
	g1zNB9GIMGkcOsQGbR8eJ7ncB8HSV8ZfK666LqzFqvwYX6M0KsheeX5b+fmO+Za3rNXm0qKM2JCik
	KoyPVYEDvZkwCerMMdSJ44cOzIz/sfOvjEWMxx035+beGy8i9n2cIvMNQAYKI8ETOkleyRaOORusZ
	9XmJMyXpcwYMBnS1RuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pflF2-0056Uw-2X;
	Fri, 24 Mar 2023 17:30:16 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pflEz-0056Si-1F
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 17:30:15 +0000
Received: from [167.98.27.226] (helo=[10.35.5.186])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pflEq-005Vdh-TE; Fri, 24 Mar 2023 17:30:05 +0000
Message-ID: <47351a26-eddd-a7e1-5d13-dee114b521da@codethink.co.uk>
Date: Fri, 24 Mar 2023 17:30:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] riscv: mm: add pgprot_dmacoherent for zicbom
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: heiko@sntech.de, linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 ajones@ventanamicro.com
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
 <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
 <1772602.TLkxdtWsSY@diego>
 <d87edae2-701e-2bfe-f643-d8c79139dc83@codethink.co.uk>
Content-Language: en-GB
Organization: Codethink Limited.
In-Reply-To: <d87edae2-701e-2bfe-f643-d8c79139dc83@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_103013_428533_037AEB49 
X-CRM114-Status: GOOD (  15.84  )
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

T24gMDgvMDMvMjAyMyAxNDo0OCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDA4LzAzLzIwMjMgMTM6
MTksIGhlaWtvQHNudGVjaC5kZSB3cm90ZToKPj4gQW0gTWl0dHdvY2gsIDguIE3DpHJ6IDIwMjMs
IDEwOjM1OjE0IENFVCBzY2hyaWViIEJlbiBEb29rczoKPj4+IE9uIDA3LzAzLzIwMjMgMjA6NTgs
IEJlbiBEb29rcyB3cm90ZToKPj4+PiBJZiB0aGUgc3lzdGVtIHVzZXMgYm90aCBaSUNCT00gYW5k
IFNWUEJNVCB0aGVuIGN1cnJlbnRseSBTVlBCTVQgd2lsbCBiZQo+Pj4+IHVzZWQgZm9yIERNQSBh
bGxvY2F0ZWQgbWVtb3J5IGV2ZW4gdGhvdWdoIFpJQ0JPTSBnaXZlcyB1cyB0aGUgY2FjaGUgb3Bz
Cj4+Pj4gdG8gdXNlIGNhY2hlZCBtZW1vcnkgYW5kIGNsZWFuL2ZsdXNoIHRoZW0gYXMgbmVlZGVk
IGJ5IHRoZSBETUEgY29kZS4KPj4+Pgo+Pj4+IEZpeCB0aGlzIGJ5IGFkZGluZyBwZ3Byb3RfZG1h
Y29oZXJlbnQoKSB3aGljaCBpcyB1c2VkIGJ5IHRoZSBhbGxvY2F0b3IKPj4+PiBjb2RlIHRvIG1h
cCB0aGUgZG1hIG1lbW9yeSwgdGh1cyBhbGxvd2luZyB0aGUgcmV0dXJuIG9mIHN1aXRhYmx5IG1h
cHBlZAo+Pj4+IG1lbW9yeSBmb3IgYW55IHVzZSBvZiBkbWFfYWxsb2NfYXR0cnMoKSBjb2RlLiBU
aGlzIHMgdXNlcyB0aGUgYWRkZWQKPj4+PiByaXNjdl9wYWdlX2RtYWNvaGVyZW50KCkgd2hpY2gg
d2lsbCB3b3JrIG91dCB0aGUgY29ycmVjdCBwYWdlIGZsYWdzIHRvCj4+Pj4gcmV0dXJuIHVzaW5n
IEFMVF9TVlBCTVRfWklDQk9NKCkgdG8gcnVudGltZSBwYXRjaCB0aGUgcmlnaHQgcmVzdWx0Lgo+
Pj4+Cj4+Pj4gTm90ZSwgd2UgY2FuJ3QganVzdCBkaXNhYmxlIFNWUEJNVCBhcyBpdCB3aWxsIGJl
IG5lZWRlIGZvciB0aGluZ3MgbGlrZQo+Pj4+IGlvcmVtYXAoKSB3aGljaCBkb24ndCBoYXZlIGFz
c29pY2F0ZWQgY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRpb25zLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+Pj4+IC0tLQo+Pj4+
IMKgwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgMTYgKysrKysrKysr
KysrKysrKwo+Pj4+IMKgwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmjCoCB8
IDEwICsrKysrKysrKysKPj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xp
c3QuaCAKPj4+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+Pj4+IGlu
ZGV4IGZiMWE4MTBmM2Q4Yy4uNDllZDJlNzk4NGE3IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZXJyYXRhX2xpc3QuaAo+Pj4+IEBAIC02Miw2ICs2MiwyMiBAQCBhc20oQUxURVJOQVRJ
VkVfMigibGkgJTAsIAo+Pj4+IDBcdFxubm9wIizCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJJIihBTFRfU1ZQQk1U
X1NISUZUKSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiSSIoQUxUX1RIRUFEX1BCTVRfU0hJRlQpKQo+Pj4+ICsjZGVmaW5lIEFM
VF9TVlBCTVRfWklDQk9NKF92YWwsIHByb3QpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+Pj4+ICthc20oQUxURVJOQVRJVkVfMygibGkgJTAsIDBcdFxubm9wIizCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAibGkgJTAsICUxXHRcbnNsbGkgJTAsJTAsJTMiLCAwLMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0lTQV9FWFRfU1ZQQk1ULCBD
T05GSUdfUklTQ1ZfSVNBX1NWUEJNVCzCoMKgwqAgXAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAg
ImxpICUwLCAwXHRcbm5vcCIsIDAswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJJU0NWX0lTQV9FWFRfWklDQk9NLCBD
T05GSUdfUklTQ1ZfSVNBX1pJQ0JPTSzCoMKgwqAgXAo+Pj4KPj4+IHNvLCBJIHRpbmsgdGhpcyBu
ZWVkcyB0byBiZSBzZWxlY3RlZCBvbiBDT05GSUdfUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4+PiBh
cyBqdXN0IGhhdmluZyBaSUNCT00gaW4gdGhlIElTQSBpc24ndCBlbm91Z2ggdG8gYWN0dWFsbHkg
dXNlIGl0LCB5b3UnbGwKPj4+IG5lZWQgdGhlIGRtYS1ub25jb2hlcmVudC5vIGJlaW5nIGJ1aWx0
IHRvIGRvIHRoZSBjYWNoZSBtYW5hZ2VtZW50Lgo+Pgo+PiBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JP
TSBkb2VzIGEKPj4gwqDCoMKgwqBzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4+IHNhbWUg
YXMgQ09ORklHX0VSUkFUQV9USEVBRF9DTU8KPj4KPj4gU28gZG1hLW5vbmNvaGVyZW50IGdldHMg
YnVpbGQgaWYgeW91IGVuYWJsZSBhdCBsZWFzdCBvbmUgb2YgdGhlbS4KPj4gV2hhdCBhbSBJIG1p
c3Npbmc/Cj4gCj4gQWgsIEkgdGhpbmsgKGFuZCBDb25ub3IgYWxzbyBwb2ludGVkIG91dCkgdGhh
dCBjdXJyZW50bHkgdGhlIGNvbmZpZwo+IGlzIHNlbGNldGVkIGZyb20gZWl0aGVyIHVzZXIgb2Yg
dGhlIGRtYS1ub25jb2hlcmVudC5jIGNvZGUuIEkgdGhpbmsKPiB0aGVyZW9yZSB3ZSBjYW4gcHJv
YmFibHkga2VlcCB0aGlzIGFzIGlzCgpBZnRlciBhIGRpc2N1c3Npb24gd2l0aCBBcm5kIGl0IGxv
b2tzIGxpa2UgSSB3YXMgdXNpbmcgdGhlIERNQSBhcGkKd3JvbmcgYW5kIHdhcyBhZnRlciBkbWFf
YWxsb2Nfbm9uY29oZXJlbnQgb3Igc2ltaWxhci4KClRoZXNlIHBhdGNoZXMgY2FuIGJlIGRyb3Bw
ZWQKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBF
bmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2Rl
dGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
