Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0702C742A7
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 02:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQTAYaHP9fjV49qaxsLfuFReq45kkF37GGzNFvcb/DI=; b=a7IyTCBtT1EipO
	5SQjej+EM1Ylkepzy/jejDssxLhJntBblGLZTylLvxBzNYMByqutAZ7JH5dz71khf6p9Y+w72vTzp
	sVlfcuQYg9u+3znBXuyTOKe0wZEFPBE1eqwkoNqgkmqPQUdsPTdM6u0g1ibjliN0PJ8eMBOpP53FY
	giuyohr8PJF+3WKq3Xtnn8ULYrWzJ5cCWLG82NUbEbHCPKGW5OZIQI4lIyD2O5ozcAfy16GWnPExD
	OGhKuQIU9e9ESaJff4KaCbIzM+uWgaK419cf3x4PJtGDW14+5szcdFxvRNvCDcZGIszPPOTVwOJxD
	lxIfto5WjNcQaEuluE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjtR-003ERP-32; Wed, 08 Mar 2023 02:51:05 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjtO-003EQx-74; Wed, 08 Mar 2023 02:51:02 +0000
Message-ID: <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
Date: Tue, 7 Mar 2023 18:51:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Jesse Taube <mr.bossman075@gmail.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
In-Reply-To: <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
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

CgpPbiAzLzcvMjMgMTg6MzMsIFJhbmR5IER1bmxhcCB3cm90ZToKPiAKPiAKPiBPbiAzLzcvMjMg
MTg6MzAsIEplc3NlIFRhdWJlIHdyb3RlOgo+Pgo+Pgo+PiBPbiAzLzcvMjMgMjE6MTYsIFJhbmR5
IER1bmxhcCB3cm90ZToKPj4+IEhpLS0KPj4+Cj4+PiBPbiAzLzcvMjMgMTc6MjYsIEplc3NlIFRh
dWJlIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAyLzI4LzIzIDIzOjQyLCBEYW1pZW4gTGUgTW9h
bCB3cm90ZToKPj4+Pj4gT24gMy8xLzIzIDEzOjA3LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+Pj4+
PiBIaS0tCj4+Pj4+Pgo+Pj4+Pj4gT24gMi8yOC8yMyAxNjoyNiwgSmVzc2UgVGF1YmUgd3JvdGU6
Cj4+Pj4+Pj4gVGhpcyBwYXRjaC1zZXQgYWltcyB0byBhZGQgTk9NTVUgc3VwcG9ydCB0byBSVjMy
Lgo+Pj4+Pj4+IE1hbnkgcGVvcGxlIHdhbnQgdG8gYnVpbGQgc2ltcGxlIGVtdWxhdG9ycyBvciBI
REwKPj4+Pj4+PiBtb2RlbHMgb2YgUklTQy1WIHRoaXMgcGF0Y2ggbWFrZXMgaXQgcG9zc2libGUg
dG8KPj4+Pj4+PiBydW4gbGludXggb24gdGhlbS4KPj4+Pj4+Pgo+Pj4+Pj4+IFlpbWluIEd1IGlz
IHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhpcyBzZXQuCj4+Pj4+Pj4gU3VibWl0dGVkIGhlcmU6
Cj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAyMi1Ob3ZlbWJlci82NTYxMzQuaHRtbAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhvdWdoIEplc3NlIFQg
cmV3cm90ZSB0aGUgRGNvbmYuCj4+Pj4+Pgo+Pj4+Pj4gRGNvbmY/Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGhlIG5ldyBzZXQ6Cj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3Bp
cGVybWFpbC9idWlsZHJvb3QvMjAyMi1EZWNlbWJlci82NTgyNTguaHRtbAo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+IFYxLT5WMjoKPj4+Pj4+PiDCoMKgIC0gQWRkIENvbm9yJ3MgY2xvY2sgcGF0Y2ggZm9y
IGltcGxpY2l0IGRpdjY0Cj4+Pj4+Pj4gwqDCoCAtIEZpeCB0eXBvIGluIGNvbW1pdCB0aXRsZSAz
LzMKPj4+Pj4+PiDCoMKgIC0gRml4IHR5cG8gaW4gY29tbWl0IGRlc2NyaXB0aW9uIDIvMwo+Pj4+
Pj4+IFYyLT5WMwo+Pj4+Pj4+IMKgwqAgLSBDaGFuZ2UgZnJvbSBkZWZjb25maWcgZmlsZSB0byBh
IFBIT05ZIGNvbmZpZwo+Pj4+Pj4+IC0tLQo+Pj4+Pj4KPj4+Pj4+IElzIHRoaXMgJ3J2MzJfbm9t
bXVfdmlydF9kZWZjb25maWcnIHRhcmdldCB0aGUgb25seSBidWlsZCB0YXJnZXQKPj4+Pj4+IHRo
YXQgaXMgc3VwcG9ydGVkPwo+Pj4+Pj4KPj4+Pj4+IEkgYXNrIGJlY2F1c2UgSSBhcHBsaWVkIHRo
ZSAzIHBhdGNoZXMgYW5kIGRpZCAyNSByYW5kY29uZmlnIGJ1aWxkcy4KPj4+Pj4+IDUgb2YgdGhl
bSBmYWlsZWQgdGhlIHNhbWUgd2F5Ogo+Pj4+Pj4KPj4+Pj4+IHJpc2N2MzItbGludXgtbGQ6IGRy
aXZlcnMvc29jL2NhbmFhbi9rMjEwLXN5c2N0bC5vOiBpbiBmdW5jdGlvbiBgazIxMF9zb2NfZWFy
bHlfaW5pdCc6Cj4+Pj4+PiBrMjEwLXN5c2N0bC5jOiguaW5pdC50ZXh0KzB4NzgpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBrMjEwX2Nsa19lYXJseV9pbml0Jwo+Pj4+IEkgY2FuIG5vdCByZWNy
ZWF0ZSB0aGlzIGVycm9yLgo+Pj4+IGNhbiB5b3Ugc2VuZCBtZSB0aGUgLmNvbmZpZyB5b3UgdXNl
ZC4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiBKZXNzZSBUYXViZQo+Pj4KPj4+IFN1cmUsIGl0J3Mg
YXR0YWNoZWQuCj4+Cj4+IEhtbW0sIGl0IGxpbmtzIGZpbmUgZm9yIG1lLgo+Pgo+PiBvYmpkdW1w
IC14IHZtbGludXggfCBncmVwIGsyMTBfY2xrX2Vhcmx5X2luaXQKPj4gODFlNDAxMjQgZ8KgwqDC
oMKgIEYgLmluaXQudGV4dMKgwqDCoMKgIDAwMDAwMDg4IGsyMTBfY2xrX2Vhcmx5X2luaXQKPj4K
Pj4gZ2NjIHZlcnNpb24gMTEuMy4wIChCdWlsZHJvb3QgMjAyMi4xMS0zNjEtZzFiZTBkNDM4Zjcp
Cj4+IEdOVSBhc3NlbWJsZXIgdmVyc2lvbiAyLjM4IChyaXNjdjMyLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMpCj4+IEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjM4Cj4+Cj4+IHdoYXQgZ2NjIHZlcnNp
b24gYXJlIHlvdSB1c2luZz8KPiAKPiAKPiBnY2MgKFNVU0UgTGludXgpIDEyLjIuMSAyMDIzMDEy
NCBbcmV2aXNpb24gMTkzZjdlNjI4MTViNDA4OWRmYWVkNGMyYmQzNGZkNGYxMDIwOWUyN10KPiBm
cm9tIG9wZW5zdXNlIFR1bWJsZXdlZWQuCj4gCj4gSSdsbCB0cnkgaXQgb24gYSBjdXJyZW50IHRy
ZWUuLi4KCk9LLCBJIGRvbid0IGtub3cgaG93IGl0IGhhcHBlbmVkLiBJIGNhbm5vdCByZXByb2R1
Y2UgaXQgbm93LgpUaGUgZmFpbGluZyAuY29uZmlnIGZpbGVzIGhhcyBDT05GSUdfTU1VIGlzIG5v
dCBzZXQgKGZvciBSVjMySSksIHdoaWNoCmFwcGVhcnMgdG8gYmUgaW1wb3NzaWJsZS4KClNvcnJ5
IHRvIGJvdGhlciB5b3UuCgpUaGFua3MuCgo+Pj4KPj4+Pj4gQXJnLiBGb3Jnb3QgYWJvdXQgdGhh
dC4gazIxMCBpcyBydjY0IG9ubHkgYW5kIHdoaWxlIHRoZSBjbGsgZHJpdmVyIGNvdWxkIHN0aWxs
Cj4+Pj4+IGNvbXBpbGUgdGVzdCB3aXRoIHJ2MzIgKG9yIGFueSBhcmNoKSwgdGhhdCBkcml2ZXIg
cHJvdmlkZXMgdGhlCj4+Pj4+IGsyMTBfY2xrX2Vhcmx5X2luaXQoKSBmdW5jdGlvbiB3aGljaCBp
cyBjYWxsZWQgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzCj4+Pj4+IGZyb20gazIxMF9z
b2NfZWFybHlfaW5pdCgpLCB3aGljaCBpcyBhbiBTT0NfRUFSTFlfSU5JVF9ERUNMQVJFKCkgY2Fs
bC4gVGhlCj4+Pj4+IHByb2JsZW0gbWF5IGJlIHRoZXJlLiBQcm9iYWJseSBzaG91bGQgYmUgZGlz
YWJsZWQgZm9yIHJ2MzIgaWYgbm8gU29DIG5lZWQgdGhhdAo+Pj4+PiBzb3J0IG9mIGVhcmx5IGlu
aXQgY2FsbC4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBiZWNhdXNlCj4+Pj4+PiAjIENPTkZJR19DT01N
T05fQ0xLX0syMTAgaXMgbm90IHNldAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBNYXliZSBTT0NfQ0FO
QUFOIG5lZWRzIHNvbWUgbW9yZSBzZWxlY3RzIGZvciByZXF1aXJlZCBjb2RlPwo+Pj4+Pj4KPj4+
Pj4+PiBDb25vciBEb29sZXkgKDEpOgo+Pj4+Pj4+IMKgwqDCoCBjbGs6IGsyMTA6IHJlbW92ZSBh
biBpbXBsaWNpdCA2NC1iaXQgZGl2aXNpb24KPj4+Pj4+Pgo+Pj4+Pj4+IEplc3NlIFRhdWJlICgx
KToKPj4+Pj4+PiDCoMKgwqAgcmlzY3Y6IGNvbmZpZ3M6IEFkZCBub21tdSBQSE9OWSBkZWZjb25m
aWcgZm9yIFJWMzIKPj4+Pj4+Pgo+Pj4+Pj4+IFlpbWluIEd1ICgxKToKPj4+Pj4+PiDCoMKgwqAg
cmlzY3Y6IEtjb25maWc6IEFsbG93IFJWMzIgdG8gYnVpbGQgd2l0aCBubyBNTVUKPj4+Pj4+Pgo+
Pj4+Pj4+IMKgwqAgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqAgfCA1ICsrLS0tCj4+Pj4+Pj4g
wqDCoCBhcmNoL3Jpc2N2L01ha2VmaWxlwqDCoMKgIHwgNCArKysrCj4+Pj4+Pj4gwqDCoCBkcml2
ZXJzL2Nsay9jbGstazIxMC5jIHwgMiArLQo+Pj4+Pj4+IMKgwqAgMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Cj4+Pgo+
IAoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
