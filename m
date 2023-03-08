Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7282C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWweZ4grEY10fn7y0UZ+VIyfB7NDlv0h5A7rkw6mlVc=; b=4UxD1nvySnrRK9
	aG8Fz00c/xhAcQLvBW6UawaySji8XadDVy4iyFvac8PMrE6qMuAy5OlMDp5YsM0kOtU/3+v368z5H
	fY5oQ3CydaXL8bph9doUeeeqRUNI5wkSZLeaYoTpooBBh+E8TL6VhYYsbCUr2q7Z+gaTqYcWG9T4G
	i4fpZgENol7BEtnWuEAjWHx6t468+uhbpXYK5ferjLLRrjFB18PerAdWWDAR/I0FZxkAdhZ69RNRj
	FspDAmuwy4X2oOHMy5tAwKqfv0DqLqmRnAHEy/4YPJAa9MhAMsDYV2L5qHw/IqiwEtXKdywOZ8Bdg
	9YwopRwRN3kQ168N6axQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkOw-003Hzu-C0; Wed, 08 Mar 2023 03:23:38 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkOt-003Hzd-VK; Wed, 08 Mar 2023 03:23:36 +0000
Message-ID: <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
Date: Tue, 7 Mar 2023 19:23:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
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
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
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

CgpPbiAzLzcvMjMgMTg6NTQsIEplc3NlIFRhdWJlIHdyb3RlOgo+IAo+IAo+IE9uIDMvNy8yMyAy
MTo1MSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pgo+Pgo+PiBPbiAzLzcvMjMgMTg6MzMsIFJhbmR5
IER1bmxhcCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMy83LzIzIDE4OjMwLCBKZXNzZSBUYXViZSB3
cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMy83LzIzIDIxOjE2LCBSYW5keSBEdW5sYXAgd3JvdGU6
Cj4+Pj4+IEhpLS0KPj4+Pj4KPj4+Pj4gT24gMy83LzIzIDE3OjI2LCBKZXNzZSBUYXViZSB3cm90
ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gT24gMi8yOC8yMyAyMzo0MiwgRGFtaWVuIExlIE1vYWwg
d3JvdGU6Cj4+Pj4+Pj4gT24gMy8xLzIzIDEzOjA3LCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+Pj4+
Pj4+IEhpLS0KPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMi8yOC8yMyAxNjoyNiwgSmVzc2UgVGF1YmUg
d3JvdGU6Cj4+Pj4+Pj4+PiBUaGlzIHBhdGNoLXNldCBhaW1zIHRvIGFkZCBOT01NVSBzdXBwb3J0
IHRvIFJWMzIuCj4+Pj4+Pj4+PiBNYW55IHBlb3BsZSB3YW50IHRvIGJ1aWxkIHNpbXBsZSBlbXVs
YXRvcnMgb3IgSERMCj4+Pj4+Pj4+PiBtb2RlbHMgb2YgUklTQy1WIHRoaXMgcGF0Y2ggbWFrZXMg
aXQgcG9zc2libGUgdG8KPj4+Pj4+Pj4+IHJ1biBsaW51eCBvbiB0aGVtLgo+Pj4+Pj4+Pj4KPj4+
Pj4+Pj4+IFlpbWluIEd1IGlzIHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhpcyBzZXQuCj4+Pj4+
Pj4+PiBTdWJtaXR0ZWQgaGVyZToKPj4+Pj4+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9waXBlcm1haWwvYnVpbGRyb290LzIwMjItTm92ZW1iZXIvNjU2MTM0Lmh0bWwKPj4+Pj4+Pj4+
Cj4+Pj4+Pj4+PiBUaG91Z2ggSmVzc2UgVCByZXdyb3RlIHRoZSBEY29uZi4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gRGNvbmY/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhlIG5ldyBzZXQ6Cj4+
Pj4+Pj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9vdC8y
MDIyLURlY2VtYmVyLzY1ODI1OC5odG1sCj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+IFYxLT5WMjoK
Pj4+Pj4+Pj4+IMKgwqDCoCAtIEFkZCBDb25vcidzIGNsb2NrIHBhdGNoIGZvciBpbXBsaWNpdCBk
aXY2NAo+Pj4+Pj4+Pj4gwqDCoMKgIC0gRml4IHR5cG8gaW4gY29tbWl0IHRpdGxlIDMvMwo+Pj4+
Pj4+Pj4gwqDCoMKgIC0gRml4IHR5cG8gaW4gY29tbWl0IGRlc2NyaXB0aW9uIDIvMwo+Pj4+Pj4+
Pj4gVjItPlYzCj4+Pj4+Pj4+PiDCoMKgwqAgLSBDaGFuZ2UgZnJvbSBkZWZjb25maWcgZmlsZSB0
byBhIFBIT05ZIGNvbmZpZwo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IElzIHRoaXMg
J3J2MzJfbm9tbXVfdmlydF9kZWZjb25maWcnIHRhcmdldCB0aGUgb25seSBidWlsZCB0YXJnZXQK
Pj4+Pj4+Pj4gdGhhdCBpcyBzdXBwb3J0ZWQ/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgYXNrIGJlY2F1
c2UgSSBhcHBsaWVkIHRoZSAzIHBhdGNoZXMgYW5kIGRpZCAyNSByYW5kY29uZmlnIGJ1aWxkcy4K
Pj4+Pj4+Pj4gNSBvZiB0aGVtIGZhaWxlZCB0aGUgc2FtZSB3YXk6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IHJpc2N2MzItbGludXgtbGQ6IGRyaXZlcnMvc29jL2NhbmFhbi9rMjEwLXN5c2N0bC5vOiBpbiBm
dW5jdGlvbiBgazIxMF9zb2NfZWFybHlfaW5pdCc6Cj4+Pj4+Pj4+IGsyMTAtc3lzY3RsLmM6KC5p
bml0LnRleHQrMHg3OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGsyMTBfY2xrX2Vhcmx5X2lu
aXQnCj4+Pj4+PiBJIGNhbiBub3QgcmVjcmVhdGUgdGhpcyBlcnJvci4KPj4+Pj4+IGNhbiB5b3Ug
c2VuZCBtZSB0aGUgLmNvbmZpZyB5b3UgdXNlZC4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+
PiBKZXNzZSBUYXViZQo+Pj4+Pgo+Pj4+PiBTdXJlLCBpdCdzIGF0dGFjaGVkLgo+Pj4+Cj4+Pj4g
SG1tbSwgaXQgbGlua3MgZmluZSBmb3IgbWUuCj4+Pj4KPj4+PiBvYmpkdW1wIC14IHZtbGludXgg
fCBncmVwIGsyMTBfY2xrX2Vhcmx5X2luaXQKPj4+PiA4MWU0MDEyNCBnwqDCoMKgwqAgRiAuaW5p
dC50ZXh0wqDCoMKgwqAgMDAwMDAwODggazIxMF9jbGtfZWFybHlfaW5pdAo+Pj4+Cj4+Pj4gZ2Nj
IHZlcnNpb24gMTEuMy4wIChCdWlsZHJvb3QgMjAyMi4xMS0zNjEtZzFiZTBkNDM4ZjcpCj4+Pj4g
R05VIGFzc2VtYmxlciB2ZXJzaW9uIDIuMzggKHJpc2N2MzItYnVpbGRyb290LWxpbnV4LXVjbGli
YykKPj4+PiBHTlUgbGQgKEdOVSBCaW51dGlscykgMi4zOAo+Pj4+Cj4+Pj4gd2hhdCBnY2MgdmVy
c2lvbiBhcmUgeW91IHVzaW5nPwo+Pj4KPj4+Cj4+PiBnY2MgKFNVU0UgTGludXgpIDEyLjIuMSAy
MDIzMDEyNCBbcmV2aXNpb24gMTkzZjdlNjI4MTViNDA4OWRmYWVkNGMyYmQzNGZkNGYxMDIwOWUy
N10KPj4+IGZyb20gb3BlbnN1c2UgVHVtYmxld2VlZC4KPj4+Cj4+PiBJJ2xsIHRyeSBpdCBvbiBh
IGN1cnJlbnQgdHJlZS4uLgo+Pgo+PiBPSywgSSBkb24ndCBrbm93IGhvdyBpdCBoYXBwZW5lZC4g
SSBjYW5ub3QgcmVwcm9kdWNlIGl0IG5vdy4KPj4gVGhlIGZhaWxpbmcgLmNvbmZpZyBmaWxlcyBo
YXMgQ09ORklHX01NVSBpcyBub3Qgc2V0IChmb3IgUlYzMkkpLCB3aGljaAo+PiBhcHBlYXJzIHRv
IGJlIGltcG9zc2libGUuCj4gVGhlc2UgcGF0Y2hlcyBhZGQgYENPTkZJR19NTVUgaXMgbm90IHNl
dGAgKGZvciBSVjMySSkuCj4gQnV0IG5vIHdvcnJpZXMgaXQgc2VlbXMgdG8gYmUgYSBub24gaXNz
dWXCoCBub3cuCj4gCj4gWW91ciB0aG91Z2h0cyBEYW1pZW4/Cj4gCgpUaGFua3MgZm9yIHJlbWlu
ZGluZyBtZS4KCldpdGggdGhlc2UgMyBwYXRjaGVzIGFwcGxpZWQgdG8gbGludXgtbmV4dC0yMDIz
MDMwNywKSSBzdGlsbCBnZXQgdGhpcyBidWlsZCBlcnJvci4KCgo+IFRoYW5rcywKPiBKZXNzZSBU
YXViZQo+Pgo+PiBTb3JyeSB0byBib3RoZXIgeW91Lgo+Pgo+PiBUaGFua3MuCj4+Cj4+Pj4+Cj4+
Pj4+Pj4gQXJnLiBGb3Jnb3QgYWJvdXQgdGhhdC4gazIxMCBpcyBydjY0IG9ubHkgYW5kIHdoaWxl
IHRoZSBjbGsgZHJpdmVyIGNvdWxkIHN0aWxsCj4+Pj4+Pj4gY29tcGlsZSB0ZXN0IHdpdGggcnYz
MiAob3IgYW55IGFyY2gpLCB0aGF0IGRyaXZlciBwcm92aWRlcyB0aGUKPj4+Pj4+PiBrMjEwX2Ns
a19lYXJseV9pbml0KCkgZnVuY3Rpb24gd2hpY2ggaXMgY2FsbGVkIHZlcnkgZWFybHkgaW4gdGhl
IGJvb3QgcHJvY2Vzcwo+Pj4+Pj4+IGZyb20gazIxMF9zb2NfZWFybHlfaW5pdCgpLCB3aGljaCBp
cyBhbiBTT0NfRUFSTFlfSU5JVF9ERUNMQVJFKCkgY2FsbC4gVGhlCj4+Pj4+Pj4gcHJvYmxlbSBt
YXkgYmUgdGhlcmUuIFByb2JhYmx5IHNob3VsZCBiZSBkaXNhYmxlZCBmb3IgcnYzMiBpZiBubyBT
b0MgbmVlZCB0aGF0Cj4+Pj4+Pj4gc29ydCBvZiBlYXJseSBpbml0IGNhbGwuCj4+Pj4+Pj4KPj4+
Pj4+Pj4KPj4+Pj4+Pj4gYmVjYXVzZQo+Pj4+Pj4+PiAjIENPTkZJR19DT01NT05fQ0xLX0syMTAg
aXMgbm90IHNldAo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBNYXliZSBTT0NfQ0FOQUFOIG5l
ZWRzIHNvbWUgbW9yZSBzZWxlY3RzIGZvciByZXF1aXJlZCBjb2RlPwo+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4gQ29ub3IgRG9vbGV5ICgxKToKPj4+Pj4+Pj4+IMKgwqDCoMKgIGNsazogazIxMDogcmVtb3Zl
IGFuIGltcGxpY2l0IDY0LWJpdCBkaXZpc2lvbgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEplc3NlIFRh
dWJlICgxKToKPj4+Pj4+Pj4+IMKgwqDCoMKgIHJpc2N2OiBjb25maWdzOiBBZGQgbm9tbXUgUEhP
TlkgZGVmY29uZmlnIGZvciBSVjMyCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gWWltaW4gR3UgKDEpOgo+
Pj4+Pj4+Pj4gwqDCoMKgwqAgcmlzY3Y6IEtjb25maWc6IEFsbG93IFJWMzIgdG8gYnVpbGQgd2l0
aCBubyBNTVUKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiDCoMKgwqAgYXJjaC9yaXNjdi9LY29uZmlnwqDC
oMKgwqAgfCA1ICsrLS0tCj4+Pj4+Pj4+PiDCoMKgwqAgYXJjaC9yaXNjdi9NYWtlZmlsZcKgwqDC
oCB8IDQgKysrKwo+Pj4+Pj4+Pj4gwqDCoMKgIGRyaXZlcnMvY2xrL2Nsay1rMjEwLmMgfCAyICst
Cj4+Pj4+Pj4+PiDCoMKgwqAgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Cj4+Pgo+PgoKLS0gCn5S
YW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
