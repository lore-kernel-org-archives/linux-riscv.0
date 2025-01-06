Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CD7E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvW32lq8P7a5X3n9zIU+fsljo5w/HbyuVDACsPWNS1A=; b=DsImZMG69sJ76l
	5v7T3XHi/LopMcWhTCfab8hPu4fizJPEUDwSSZOuV1At8t2RQXsJ6a6NW3X2r1YAUTEW1HYatsP26
	e/RHv4TwQNZsGN9pOfpKKb4Gvp0YVkjJagme2whB/sctvoeHLQmIbK42I/iQsM4XiSKChI35mS45W
	x1S+sHKNkgyLZh+wyrnCoaKbsdPVECVplVIu81XIFxi5MxTu+LPHN2t68NsbKEVJIASm6xFqfTaFJ
	GYHR7REySXio/3G/vquk9EVIezUBRmISkfWKVAhbuu1jsSFBkxHKK8Ra1U1nkcsZiJKpMEHnP5MBi
	T749Sb8En2MCDwc1nApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiqd-00000000ZP1-1Qn2;
	Mon, 06 Jan 2025 08:52:31 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiqa-00000000ZNq-2mhb
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 08:52:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79207C0006;
	Mon,  6 Jan 2025 08:52:23 +0000 (UTC)
Message-ID: <1fad8701-9667-487f-b356-45c6d07eeb49@ghiti.fr>
Date: Mon, 6 Jan 2025 09:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: use local label names instead of global ones in
 assembly
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250103141814.508865-1-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250103141814.508865-1-cleger@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_005229_014933_95362A34 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgQ2zDqW1lbnQsCgpPbiAwMy8wMS8yMDI1IDE1OjE3LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gTG9jYWwgbGFiZWxzIHNob3VsZCBiZSBwcmVmaXggYnkgJy5MJyBvciB0aGV5J2xsIGJlIGV4
cG9ydGVkIGluIHRoZQo+IHN5bWJvbCB0YWJsZS4gQWRkaXRpb25hbGx5LCB0aGlzIG1lc3NlcyB1
cCB0aGUgYmFja3RyYWNlIGJ5IGRpc3BsYXlpbmcKPiBhbiBpbmNvcnJlY3Qgc3ltYm9sOgo+Cj4g
ICAgLi4uCj4gICAgWyAgIDEyLjc1MTgxMF0gWzxmZmZmZmZmZjgwNDQxNjI4Pl0gX2NvcHlfZnJv
bV91c2VyKzB4MjgvMHhjMgo+ICAgIFsgICAxMi43NTIwMzVdIFs8ZmZmZmZmZmY4MDAxNTJjYT5d
IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQrMHgxY2EvMHgyZmMKPiAgICBbICAgMTIuNzUyMzEwXSBb
PGZmZmZmZmZmODBhMDMzZTg+XSBkb190cmFwX2xvYWRfbWlzYWxpZ25lZCsweDI0LzB4ZWUKPiAg
ICBbICAgMTIuNzUyNTk2XSBbPGZmZmZmZmZmODBhMGRjYWU+XSBfbmV3X3ZtYWxsb2NfcmVzdG9y
ZV9jb250ZXh0X2EwKzB4YzIvMHhjZQoKClllcywgSSBub3RpY2VkIHRoaXMgbGFzdCB3ZWVrLCB0
aGFua3MgZm9yIGxvb2tpbmcgaW50byBpdC4gSSB3b3VsZCBhZGQgYSAKRml4ZXMgdGFnIGFuZCBt
ZXJnZSB0aGF0IGluIHRoZSBuZXh0IC1yYyBpZiBwb3NzaWJsZSBhcyB0aGUgYWJvdmUgCmJhY2t0
cmFjZSBpcyAiZGlzdHVyYmluZyIuCgoKPgo+IEFmdGVyOgo+ICAgIC4uLgo+ICAgIFsgICAxMC4y
NDM5MTZdIFs8ZmZmZmZmZmY4MDQ0MTVlND5dIF9jb3B5X2Zyb21fdXNlcisweDI4LzB4YzIKPiAg
ICBbICAgMTAuMjQ0MDI2XSBbPGZmZmZmZmZmODAwMTUyY2E+XSBoYW5kbGVfbWlzYWxpZ25lZF9s
b2FkKzB4MWNhLzB4MmZjCj4gICAgWyAgIDEwLjI0NDE1MF0gWzxmZmZmZmZmZjgwYTAzM2EwPl0g
ZG9fdHJhcF9sb2FkX21pc2FsaWduZWQrMHgyNC8weGVlCj4gICAgWyAgIDEwLjI0NDI2OF0gWzxm
ZmZmZmZmZjgwYTBkYzY2Pl0gaGFuZGxlX2V4Y2VwdGlvbisweDE0Ni8weDE1Mgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Cj4gLS0tCj4g
ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwo+IGluZGV4IGMyMDBkMzI5ZDRiZC4uMjE2NTgxODM1ZWIwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRy
eS5TCj4gQEAgLTIzLDIxICsyMywyMSBAQAo+ICAgCVJFR19TIAlhMCwgVEFTS19USV9BMCh0cCkK
PiAgIAljc3JyIAlhMCwgQ1NSX0NBVVNFCj4gICAJLyogRXhjbHVkZSBJUlFzICovCj4gLQlibHQg
IAlhMCwgemVybywgX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMAo+ICsJYmx0ICAJYTAs
IHplcm8sIC5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2EwCj4gICAKPiAgIAlSRUdfUyAJ
YTEsIFRBU0tfVElfQTEodHApCj4gICAJLyogT25seSBjaGVjayBuZXdfdm1hbGxvYyBpZiB3ZSBh
cmUgaW4gcGFnZS9wcm90ZWN0aW9uIGZhdWx0ICovCj4gICAJbGkgICAJYTEsIEVYQ19MT0FEX1BB
R0VfRkFVTFQKPiAtCWJlcSAgCWEwLCBhMSwgX25ld192bWFsbG9jX2tlcm5lbF9hZGRyZXNzCj4g
KwliZXEgIAlhMCwgYTEsIC5MbmV3X3ZtYWxsb2Nfa2VybmVsX2FkZHJlc3MKPiAgIAlsaSAgIAlh
MSwgRVhDX1NUT1JFX1BBR0VfRkFVTFQKPiAtCWJlcSAgCWEwLCBhMSwgX25ld192bWFsbG9jX2tl
cm5lbF9hZGRyZXNzCj4gKwliZXEgIAlhMCwgYTEsIC5MbmV3X3ZtYWxsb2Nfa2VybmVsX2FkZHJl
c3MKPiAgIAlsaSAgIAlhMSwgRVhDX0lOU1RfUEFHRV9GQVVMVAo+IC0JYm5lICAJYTAsIGExLCBf
bmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4gKwlibmUgIAlhMCwgYTEsIC5MbmV3X3Zt
YWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4gICAKPiAtX25ld192bWFsbG9jX2tlcm5lbF9hZGRy
ZXNzOgo+ICsuTG5ld192bWFsbG9jX2tlcm5lbF9hZGRyZXNzOgo+ICAgCS8qIElzIGl0IGEga2Vy
bmVsIGFkZHJlc3M/ICovCj4gICAJY3NyciAJYTAsIENTUl9UVkFMCj4gLQliZ2UgCWEwLCB6ZXJv
LCBfbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4gKwliZ2UgCWEwLCB6ZXJvLCAuTG5l
d192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMQo+ICAgCj4gICAJLyogQ2hlY2sgaWYgYSBuZXcg
dm1hbGxvYyBtYXBwaW5nIGFwcGVhcmVkIHRoYXQgY291bGQgZXhwbGFpbiB0aGUgdHJhcCAqLwo+
ICAgCVJFR19TCWEyLCBUQVNLX1RJX0EyKHRwKQo+IEBAIC02OSw3ICs2OSw3IEBAIF9uZXdfdm1h
bGxvY19rZXJuZWxfYWRkcmVzczoKPiAgIAkvKiBDaGVjayB0aGUgdmFsdWUgb2YgbmV3X3ZtYWxs
b2MgZm9yIHRoaXMgY3B1ICovCj4gICAJUkVHX0wJYTIsIDAoYTApCj4gICAJYW5kCWEyLCBhMiwg
YTEKPiAtCWJlcQlhMiwgemVybywgX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dAo+ICsJYmVx
CWEyLCB6ZXJvLCAuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dAo+ICAgCj4gICAJLyogQXRv
bWljYWxseSByZXNldCB0aGUgY3VycmVudCBjcHUgYml0IGluIG5ld192bWFsbG9jICovCj4gICAJ
YW1veG9yLmQJYTAsIGExLCAoYTApCj4gQEAgLTgzLDExICs4MywxMSBAQCBfbmV3X3ZtYWxsb2Nf
a2VybmVsX2FkZHJlc3M6Cj4gICAJY3NydwlDU1JfU0NSQVRDSCwgeDAKPiAgIAlzcmV0Cj4gICAK
PiAtX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dDoKPiArLkxuZXdfdm1hbGxvY19yZXN0b3Jl
X2NvbnRleHQ6Cj4gICAJUkVHX0wgCWEyLCBUQVNLX1RJX0EyKHRwKQo+IC1fbmV3X3ZtYWxsb2Nf
cmVzdG9yZV9jb250ZXh0X2ExOgo+ICsuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMToK
PiAgIAlSRUdfTCAJYTEsIFRBU0tfVElfQTEodHApCj4gLV9uZXdfdm1hbGxvY19yZXN0b3JlX2Nv
bnRleHRfYTA6Cj4gKy5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2EwOgo+ICAgCVJFR19M
CWEwLCBUQVNLX1RJX0EwKHRwKQo+ICAgLmVuZG0KPiAgIAoKCllvdSBjYW4gYWRkOgoKUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywK
CkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
