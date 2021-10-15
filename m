Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F084DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 13:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA6961151
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 13:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACA6961151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2fbFLX7EiHTOXsqw20oES6YfwrZrOfRyKOpv/+JyAHI=; b=WBQz7wRc1E9KEVGlVC+irLtFOP
	RtLACGGrN5NYeRCxgc5U3agxrsA0S5Ty7geXPmhvXs0J2pfdHxeQPZfR8xF7TVdvaFzZy95tY6YAp
	71sDcudaVZsJBccWxDqio5ZXILF+MGDpFHY+cX6TGi/IcbfAFJ5i1oGgqGaXxM+/gmvdpFaUUK9J0
	HqsonPHEK3eXRysHH7HwcOVyNIhkAG75I4QPXHgyIzUg3wzLN4MJ+Vt6TwBFP8a/oPwBiFgxV5HvJ
	spqm6lnqrXWyNLPEX6cgI1i+mDvI1BNjJ1bXC65nyMY3XGnIlxbIIQcvxMVusM+vBna8eFUmDI0cs
	oJuOXrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbMtk-0077rj-L0; Fri, 15 Oct 2021 13:05:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbMtQ-0077jx-VV
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 13:05:03 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 401031C0007;
 Fri, 15 Oct 2021 13:04:51 +0000 (UTC)
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
From: Alexandre ghiti <alex@ghiti.fr>
To: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: elver@google.com, akpm@linux-foundation.org, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-mm@kvack.org
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
 <YWhg8/UzjJsB51Gd@archlinux-ax161>
 <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
Message-ID: <990a894c-1806-5ab2-775e-a6f2355c2299@ghiti.fr>
Date: Fri, 15 Oct 2021 15:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_060501_392405_CA9803CC 
X-CRM114-Status: GOOD (  30.63  )
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

T24gMTAvMTQvMjEgODozMSBQTSwgQWxleCBHaGl0aSB3cm90ZToKPiBIaSBOYXRoYW4sCj4KPiBM
ZSAxNC8xMC8yMDIxIMOgIDE4OjU1LCBOYXRoYW4gQ2hhbmNlbGxvciBhIMOpY3JpdMKgOgo+PiBP
biBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMTo0Njo1NUFNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3
cm90ZToKPj4+IE9uIFRodSwgMjMgU2VwIDIwMjEgMDc6NTk6NDYgUERUICgtMDcwMCksIG5hdGhh
bkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4+IE9uIFRodSwgU2VwIDIzLCAyMDIxIGF0IDEyOjA3OjE3
UE0gKzAyMDAsIE1hcmNvIEVsdmVyIHdyb3RlOgo+Pj4+PiBPbiBXZWQsIDIyIFNlcHQgMjAyMSBh
dCAyMjo1NSwgTmF0aGFuIENoYW5jZWxsb3IKPj4+Pj4gPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90
ZToKPj4+Pj4+IEN1cnJlbnRseSwgdGhlIGFzYW4tc3RhY2sgcGFyYW1ldGVyIGlzIG9ubHkgcGFz
c2VkIGFsb25nIGlmCj4+Pj4+PiBDRkxBR1NfS0FTQU5fU0hBRE9XIGlzIG5vdCBlbXB0eSwgd2hp
Y2ggcmVxdWlyZXMKPj4+Pj4+IEtBU0FOX1NIQURPV19PRkZTRVQgdG8KPj4+Pj4+IGJlIGRlZmlu
ZWQgaW4gS2NvbmZpZyBzbyB0aGF0IHRoZSB2YWx1ZSBjYW4gYmUgY2hlY2tlZC4gSW4gUklTQy1W
J3MKPj4+Pj4+IGNhc2UsIEtBU0FOX1NIQURPV19PRkZTRVQgaXMgbm90IGRlZmluZWQgaW4gS2Nv
bmZpZywgd2hpY2ggbWVhbnMKPj4+Pj4+IHRoYXQKPj4+Pj4+IGFzYW4tc3RhY2sgZG9lcyBub3Qg
Z2V0IGRpc2FibGVkIHdpdGggY2xhbmcgZXZlbiB3aGVuCj4+Pj4+PiBDT05GSUdfS0FTQU5fU1RB
Q0sKPj4+Pj4+IGlzIGRpc2FibGVkLCByZXN1bHRpbmcgaW4gbGFyZ2Ugc3RhY2sgd2FybmluZ3Mg
d2l0aCBhbGxtb2Rjb25maWc6Cj4+Pj4+Pgo+Pj4+Pj4gZHJpdmVycy92aWRlby9mYmRldi9vbWFw
Mi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmM6MTE3OjEyOgo+Pj4+
Pj4KPj4+Pj4+IGVycm9yOiBzdGFjayBmcmFtZSBzaXplICgxNDQwMCkgZXhjZWVkcyBsaW1pdCAo
MjA0OCkgaW4gZnVuY3Rpb24KPj4+Pj4+ICdsYjAzNXEwMl9jb25uZWN0JyBbLVdlcnJvciwtV2Zy
YW1lLWxhcmdlci10aGFuXQo+Pj4+Pj4gc3RhdGljIGludCBsYjAzNXEwMl9jb25uZWN0KHN0cnVj
dCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldikKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Xgo+Pj4+Pj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4+Pj4+Pgo+Pj4+Pj4gRW5zdXJlIHRoYXQgdGhl
IHZhbHVlIG9mIENPTkZJR19LQVNBTl9TVEFDSyBpcyBhbHdheXMgcGFzc2VkCj4+Pj4+PiBhbG9u
ZyB0bwo+Pj4+Pj4gdGhlIGNvbXBpbGVyIHNvIHRoYXQgdGhlc2Ugd2FybmluZ3MgZG8gbm90IGhh
cHBlbiB3aGVuCj4+Pj4+PiBDT05GSUdfS0FTQU5fU1RBQ0sgaXMgZGlzYWJsZWQuCj4+Pj4+Pgo+
Pj4+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1
ZXMvMTQ1Mwo+Pj4+Pj4gUmVmZXJlbmNlczogNmJhZWM4ODBkN2E1ICgia2FzYW46IHR1cm4gb2Zm
IGFzYW4tc3RhY2sgZm9yIGNsYW5nLTgKPj4+Pj4+IGFuZCBlYXJsaWVyIikKPj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPj4+Pj4KPj4+
Pj4gUmV2aWV3ZWQtYnk6IE1hcmNvIEVsdmVyIDxlbHZlckBnb29nbGUuY29tPgo+Pj4+Cj4+Pj4g
VGhhbmtzIQo+Pj4+Cj4+Pj4+IFsgV2hpY2ggdHJlZSBhcmUgeW91IHBsYW5uaW5nIHRvIHRha2Ug
aXQgdGhyb3VnaD8gXQo+Pj4+Cj4+Pj4gR2FoLCBJIHdhcyBpbnRlbmRpbmcgZm9yIGl0IHRvIGdv
IHRocm91Z2ggLW1tLCB0aGVuIEkgY2MnZCBuZWl0aGVyCj4+Pj4gQW5kcmV3IG5vciBsaW51eC1t
bS4uLiA6LyBBbmRyZXcsIGRvIHlvdSB3YW50IG1lIHRvIHJlc2VuZCBvciBjYW4geW91Cj4+Pj4g
Z3JhYiBpdCBmcm9tIExLTUw/Cj4+Pgo+Pj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4+Pgo+Pj4gKGFzc3VtaW5nIHlvdSBzdGlsbCB3YW50IGl0
IHRocm91Z2ggc29tZXdoZXJlIGVsc2UpCj4+Cj4+IFRoYW5rcywgaXQgaXMgbm93IGluIG1haW5s
aW5lIGFzIGNvbW1pdCAxOTUzMjg2OWZlYjkgKCJrYXNhbjogYWx3YXlzCj4+IHJlc3BlY3QgQ09O
RklHX0tBU0FOX1NUQUNLIikuCj4+Cj4+Pj4+IE5vdGUsIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a2FzYW4uaCBtZW50aW9ucyBLQVNBTl9TSEFET1dfT0ZGU0VUIGluCj4+Pj4+IGNvbW1lbnQgKGNv
cGllZCBmcm9tIGFybTY0KS4gRGlkIFJJU0MtViBqdXN0IGZvcmdldCB0byBjb3B5IG92ZXIgdGhl
Cj4+Pj4+IEtjb25maWcgb3B0aW9uPwo+Pj4+Cj4+Pj4gSSBkbyBzZWUgaXQgZGVmaW5lZCBpbiB0
aGF0IGZpbGUgYXMgd2VsbCBidXQgeW91IGFyZSByaWdodCB0aGF0Cj4+Pj4gdGhleSBkaWQKPj4+
PiBub3QgY29weSB0aGUgS2NvbmZpZyBsb2dpYywgZXZlbiB0aG91Z2ggaXQgd2FzIHByZXNlbnQg
aW4gdGhlIHRyZWUKPj4+PiB3aGVuCj4+Pj4gUklTQy1WIEtBU0FOIHdhcyBpbXBsZW1lbnRlZC4g
UGVyaGFwcyB0aGV5IHNob3VsZCBzbyB0aGF0IHRoZXkgZ2V0Cj4+Pj4gYWNjZXNzIHRvIHRoZSBv
dGhlciBmbGFncyBpbiB0aGUgImVsc2UiIGJyYW5jaD8KPj4+Cj4+PiBZYSwgbG9va3MgbGlrZSB3
ZSBqdXN0IHNjcmV3ZWQgdGhpcyB1cC7CoCBJJ20gc2VlaW5nIHNvbWUgd2FybmluZ3MgbGlrZQo+
Pj4KPj4+IMKgwqDCoCBjYzE6IHdhcm5pbmc6IOKAmC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3Pi
gJkgd2l0aCBzdGFjayBwcm90ZWN0aW9uCj4+PiBpcyBub3Qgc3VwcG9ydGVkIHdpdGhvdXQg4oCY
LWZhc2FuLXNoYWRvdy1vZmZzZXQ94oCZIGZvciB0aGlzIHRhcmdldAo+Pgo+PiBIbW1tLCBJIHRo
b3VnaHQgSSBkaWQgYSBHQ0MgYnVpbGQgd2l0aCB0aGlzIGNoYW5nZSBidXQgSSBtdXN0IG5vdCBo
YXZlCj4+IDovCj4+Cj4+PiB3aGljaCBpcyBob3cgSSBlbmRlZCB1cCBoZXJlLCBJJ20gYXNzdW1p
bmcgdGhhdCdzIHdoYXQgeW91J3JlCj4+PiB0YWxraW5nIGFib3V0Cj4+PiBoZXJlP8KgIExNSyBp
ZiB5b3Ugd2VyZSBwbGFubmluZyBvbiBzZW5kaW5nIGFsb25nIGEgZml4IG9yIGlmIHlvdQo+Pj4g
d2FudCBtZSB0bwo+Pj4gZ28gZmlndXJlIGl0IG91dC4KPj4KPj4gSSB0b29rIGEgbG9vayBhdCBt
b3ZpbmcgdGhlIGxvZ2ljIGludG8gS2NvbmZpZyBsaWtlIGFybTY0IGJlZm9yZSBzZW5kaW5nCj4+
IHRoaXMgY2hhbmdlIGFuZCBJIGRpZCBub3QgcmVhbGx5IHVuZGVyc3RhbmQgaXQgd2VsbCBlbm91
Z2ggdG8gZG8gc28uIEkKPj4gdGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3Ugd2VyZSBhYmxl
IHRvIGRvIHRoYXQgc28gdGhhdCBub3RoaW5nIGdldHMKPj4gbWVzc2VkIHVwLgo+Pgo+Cj4gSSds
bCBkbyBpdCB0b21vcnJvdywgSSdtIHRoZSBsYXN0IG9uZSB3aG8gdG91Y2hlZCBrYXNhbiBvbiBy
aXNjdiA6KQo+CgpBZGRpbmcgS0FTQU5fU0hBRE9XX09GRlNFVCBjb25maWcgbWFrZXMga2FzYW4g
a2VybmVsIGZhaWxzIHRvIGJvb3QuCkl0IHJlY2VpdmVzIGEgKndyaXRlKiBmYXVsdCBhdCB0aGUg
YmVnaW5uaW5nIG9mIGEgbWVtYmxvY2tfYWxsb2MKZnVuY3Rpb24gd2hpbGUgcG9wdWxhdGluZyB0
aGUga2VybmVsIHNoYWRvdyBtZW1vcnk6IHRoZSB0cmFwIGFkZHJlc3MgaXMKaW4gdGhlIGthc2Fu
IHNoYWRvdyB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgYW5kIHRoaXMgY29ycmVzcG9uZHMgdG8gYQpr
ZXJuZWwgYWRkcmVzcyBpbiBpbml0X3N0YWNrLiBUaGUgcXVlc3Rpb24gaXM6IGhvdyBkbyBJIHBv
cHVsYXRlIHRoZQpzdGFjayBzaGFkb3cgbWFwcGluZyB3aXRob3V0IHVzaW5nIG1lbWJsb2NrIEFQ
ST8gSXQncyB3ZWlyZCwgSSBkb24ndApmaW5kIGFueXRoaW5nIG9uIG90aGVyIGFyY2hpdGVjdHVy
ZXMuCgpBbmQganVzdCBhIHNob3J0IG5vdGU6IEkgaGF2ZSByZWFsaXplZCB0aGlzIHdpbGwgYnJl
YWsgd2l0aCB0aGUgc3Y0OApwYXRjaHNldCBhcyB3ZSBkZWNpZGUgYXQgcnVudGltZSB0aGUgYWRk
cmVzcyBzcGFjZSB3aWR0aCBhbmQgdGhlIGthc2FuCnNoYWRvdyBzdGFydCBhZGRyZXNzIGlzIGRp
ZmZlcmVudCBiZXR3ZWVuIHN2MzkgYW5kIHN2NDguIEkgd2lsbCBoYXZlIHRvCmRvIGxpa2UgeDg2
IGFuZCBtb3ZlIHRoZSBrYXNhbiBzaGFkb3cgc3RhcnQgYXQgdGhlIGVuZCBvZiB0aGUgYWRkcmVz
cwpzcGFjZSBzbyB0aGF0IGl0IGlzIHRoZSBzYW1lIGZvciBib3RoIHN2MzkgYW5kIHN2NDguCgpU
aGFua3MsCgpBbGV4CgoKPiBUaGFua3MsCj4KPiBBbGV4Cj4KPj4gQ2hlZXJzLAo+PiBOYXRoYW4K
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo+Pgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
