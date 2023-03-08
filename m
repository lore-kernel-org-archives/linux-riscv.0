Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E24C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9Ld2krv7Sbj8TEFZz9efXKc6RlAPplrkbnXccGl4Vc=; b=IRKpViz+UqJVhq
	HhLjtOUa1v/eVDpw4JeZGp74ZFacFuz12val1GsHMgsJAkyP/0dJUgjLU7XdYFqET4IHyss/gMsmj
	aTQgCAMreNQwBipUqP6ouohZ8QCLQlEqTOZpmkJ5wkYMKtr+HnB8PEc9V1fhgmpTRomI0B68Scayn
	1+qRQfNVovZ+tl7vfg+kWkEVpyAMoPCvw0k05iWjB2Ht9adb6iGnxaUFHR2bBfb/RIn9WCghnh97t
	k65GVuvBhibrelf3zicBhAIn2hhELtrXeNTQ19vpd0JRKp/hPUT7qL7sKZJ3P5g3+/ZO7HDXrxNw6
	OrTafziS8VsKlflLmNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZv5u-005YwH-Bl; Wed, 08 Mar 2023 14:48:42 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZv5s-005Yv2-3R
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 14:48:41 +0000
Received: from [167.98.27.226] (helo=[10.35.5.186])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pZv5l-00Eujw-N7; Wed, 08 Mar 2023 14:48:33 +0000
Message-ID: <d87edae2-701e-2bfe-f643-d8c79139dc83@codethink.co.uk>
Date: Wed, 8 Mar 2023 14:48:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] riscv: mm: add pgprot_dmacoherent for zicbom
To: heiko@sntech.de, linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 ajones@ventanamicro.com
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
 <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
 <1772602.TLkxdtWsSY@diego>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <1772602.TLkxdtWsSY@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_064840_164059_60711192 
X-CRM114-Status: GOOD (  15.30  )
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

T24gMDgvMDMvMjAyMyAxMzoxOSwgaGVpa29Ac250ZWNoLmRlIHdyb3RlOgo+IEFtIE1pdHR3b2No
LCA4LiBNw6RyeiAyMDIzLCAxMDozNToxNCBDRVQgc2NocmllYiBCZW4gRG9va3M6Cj4+IE9uIDA3
LzAzLzIwMjMgMjA6NTgsIEJlbiBEb29rcyB3cm90ZToKPj4+IElmIHRoZSBzeXN0ZW0gdXNlcyBi
b3RoIFpJQ0JPTSBhbmQgU1ZQQk1UIHRoZW4gY3VycmVudGx5IFNWUEJNVCB3aWxsIGJlCj4+PiB1
c2VkIGZvciBETUEgYWxsb2NhdGVkIG1lbW9yeSBldmVuIHRob3VnaCBaSUNCT00gZ2l2ZXMgdXMg
dGhlIGNhY2hlIG9wcwo+Pj4gdG8gdXNlIGNhY2hlZCBtZW1vcnkgYW5kIGNsZWFuL2ZsdXNoIHRo
ZW0gYXMgbmVlZGVkIGJ5IHRoZSBETUEgY29kZS4KPj4+Cj4+PiBGaXggdGhpcyBieSBhZGRpbmcg
cGdwcm90X2RtYWNvaGVyZW50KCkgd2hpY2ggaXMgdXNlZCBieSB0aGUgYWxsb2NhdG9yCj4+PiBj
b2RlIHRvIG1hcCB0aGUgZG1hIG1lbW9yeSwgdGh1cyBhbGxvd2luZyB0aGUgcmV0dXJuIG9mIHN1
aXRhYmx5IG1hcHBlZAo+Pj4gbWVtb3J5IGZvciBhbnkgdXNlIG9mIGRtYV9hbGxvY19hdHRycygp
IGNvZGUuIFRoaXMgcyB1c2VzIHRoZSBhZGRlZAo+Pj4gcmlzY3ZfcGFnZV9kbWFjb2hlcmVudCgp
IHdoaWNoIHdpbGwgd29yayBvdXQgdGhlIGNvcnJlY3QgcGFnZSBmbGFncyB0bwo+Pj4gcmV0dXJu
IHVzaW5nIEFMVF9TVlBCTVRfWklDQk9NKCkgdG8gcnVudGltZSBwYXRjaCB0aGUgcmlnaHQgcmVz
dWx0Lgo+Pj4KPj4+IE5vdGUsIHdlIGNhbid0IGp1c3QgZGlzYWJsZSBTVlBCTVQgYXMgaXQgd2ls
bCBiZSBuZWVkZSBmb3IgdGhpbmdzIGxpa2UKPj4+IGlvcmVtYXAoKSB3aGljaCBkb24ndCBoYXZl
IGFzc29pY2F0ZWQgY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRpb25zLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4+IC0tLQo+Pj4g
ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgMTYgKysrKysrKysrKysr
KysrKwo+Pj4gICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggIHwgMTAgKysr
KysrKysrKwo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+Pj4gaW5kZXggZmIxYTgxMGYzZDhjLi40
OWVkMmU3OTg0YTcgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0
YV9saXN0LmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+
Pj4gQEAgLTYyLDYgKzYyLDIyIEBAIGFzbShBTFRFUk5BVElWRV8yKCJsaSAlMCwgMFx0XG5ub3Ai
LAkJCQkJXAo+Pj4gICAgCQkgICJJIihBTFRfU1ZQQk1UX1NISUZUKSwJCQkJXAo+Pj4gICAgCQkg
ICJJIihBTFRfVEhFQURfUEJNVF9TSElGVCkpCj4+PiAgICAKPj4+ICsjZGVmaW5lIEFMVF9TVlBC
TVRfWklDQk9NKF92YWwsIHByb3QpCQkJCQlcCj4+PiArYXNtKEFMVEVSTkFUSVZFXzMoImxpICUw
LCAwXHRcbm5vcCIsCQkJCQlcCj4+PiArCQkgICJsaSAlMCwgJTFcdFxuc2xsaSAlMCwlMCwlMyIs
IDAsCQkJXAo+Pj4gKwkJCVJJU0NWX0lTQV9FWFRfU1ZQQk1ULCBDT05GSUdfUklTQ1ZfSVNBX1NW
UEJNVCwJXAo+Pj4gKwkJICAibGkgJTAsIDBcdFxubm9wIiwgMCwJCQkJCVwKPj4+ICsJCQlSSVND
Vl9JU0FfRVhUX1pJQ0JPTSwgQ09ORklHX1JJU0NWX0lTQV9aSUNCT00sCVwKPj4KPj4gc28sIEkg
dGluayB0aGlzIG5lZWRzIHRvIGJlIHNlbGVjdGVkIG9uIENPTkZJR19SSVNDVl9ETUFfTk9OQ09I
RVJFTlQKPj4gYXMganVzdCBoYXZpbmcgWklDQk9NIGluIHRoZSBJU0EgaXNuJ3QgZW5vdWdoIHRv
IGFjdHVhbGx5IHVzZSBpdCwgeW91J2xsCj4+IG5lZWQgdGhlIGRtYS1ub25jb2hlcmVudC5vIGJl
aW5nIGJ1aWx0IHRvIGRvIHRoZSBjYWNoZSBtYW5hZ2VtZW50Lgo+IAo+IENPTkZJR19SSVNDVl9J
U0FfWklDQk9NIGRvZXMgYQo+IAlzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gc2FtZSBh
cyBDT05GSUdfRVJSQVRBX1RIRUFEX0NNTwo+IAo+IFNvIGRtYS1ub25jb2hlcmVudCBnZXRzIGJ1
aWxkIGlmIHlvdSBlbmFibGUgYXQgbGVhc3Qgb25lIG9mIHRoZW0uCj4gV2hhdCBhbSBJIG1pc3Np
bmc/CgpBaCwgSSB0aGluayAoYW5kIENvbm5vciBhbHNvIHBvaW50ZWQgb3V0KSB0aGF0IGN1cnJl
bnRseSB0aGUgY29uZmlnCmlzIHNlbGNldGVkIGZyb20gZWl0aGVyIHVzZXIgb2YgdGhlIGRtYS1u
b25jb2hlcmVudC5jIGNvZGUuIEkgdGhpbmsKdGhlcmVvcmUgd2UgY2FuIHByb2JhYmx5IGtlZXAg
dGhpcyBhcyBpcy4KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsv
ClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczov
L3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
