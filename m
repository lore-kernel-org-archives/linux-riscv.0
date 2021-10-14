Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE9AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 18:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898616105A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 18:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 898616105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+pgIXnVUXvBztFcYqup9I65IDB/6M5ARY6CNhp3cAA=; b=AZIuu9zaCDypiOVV1UZ2AwKJdw
	EPEZX4Afa7Kqo6iFtPurI2pa6UOnSwASGE1sN9o1Pm59CpRRLGZpdMOpraNB2+WP/aeN/ALOyjPBG
	SHswYvOtUeIq2IVkFNcTqWrywfi2G+Tf9RP0AUs2kdtQsLvpcgo50jzHzM+lKG3yFiLUNkPlzbPvH
	3HWj1U/vyEdcc34zJaVE2rDOBBmP+zJpz9KBG1lmrv++/S3vdDlaqQCJBAJ6S84Ww0NpYb3IjBTcO
	f18oiR6lffwSX3THacJ4sl1NA8z2gpprWFG4vkbgmv8aJjpZL36Pqi9ZUbHGxc9i1XdR0Uz0ygU0A
	K6TzTcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb5Va-0047oT-Sc; Thu, 14 Oct 2021 18:31:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb5VX-0047mt-IJ
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 18:31:13 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9666D1BF205;
 Thu, 14 Oct 2021 18:31:00 +0000 (UTC)
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
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
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <afeaea5f-70f2-330f-f032-fb0c8b5d0aa5@ghiti.fr>
Date: Thu, 14 Oct 2021 20:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWhg8/UzjJsB51Gd@archlinux-ax161>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_113111_921450_CF97551E 
X-CRM114-Status: GOOD (  27.32  )
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

SGkgTmF0aGFuLAoKTGUgMTQvMTAvMjAyMSDDoCAxODo1NSwgTmF0aGFuIENoYW5jZWxsb3IgYSDD
qWNyaXTCoDoKPiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAxMTo0Njo1NUFNIC0wNzAwLCBQYWxt
ZXIgRGFiYmVsdCB3cm90ZToKPj4gT24gVGh1LCAyMyBTZXAgMjAyMSAwNzo1OTo0NiBQRFQgKC0w
NzAwKSwgbmF0aGFuQGtlcm5lbC5vcmcgd3JvdGU6Cj4+PiBPbiBUaHUsIFNlcCAyMywgMjAyMSBh
dCAxMjowNzoxN1BNICswMjAwLCBNYXJjbyBFbHZlciB3cm90ZToKPj4+PiBPbiBXZWQsIDIyIFNl
cHQgMjAyMSBhdCAyMjo1NSwgTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPiB3
cm90ZToKPj4+Pj4gQ3VycmVudGx5LCB0aGUgYXNhbi1zdGFjayBwYXJhbWV0ZXIgaXMgb25seSBw
YXNzZWQgYWxvbmcgaWYKPj4+Pj4gQ0ZMQUdTX0tBU0FOX1NIQURPVyBpcyBub3QgZW1wdHksIHdo
aWNoIHJlcXVpcmVzIEtBU0FOX1NIQURPV19PRkZTRVQgdG8KPj4+Pj4gYmUgZGVmaW5lZCBpbiBL
Y29uZmlnIHNvIHRoYXQgdGhlIHZhbHVlIGNhbiBiZSBjaGVja2VkLiBJbiBSSVNDLVYncwo+Pj4+
PiBjYXNlLCBLQVNBTl9TSEFET1dfT0ZGU0VUIGlzIG5vdCBkZWZpbmVkIGluIEtjb25maWcsIHdo
aWNoIG1lYW5zIHRoYXQKPj4+Pj4gYXNhbi1zdGFjayBkb2VzIG5vdCBnZXQgZGlzYWJsZWQgd2l0
aCBjbGFuZyBldmVuIHdoZW4gQ09ORklHX0tBU0FOX1NUQUNLCj4+Pj4+IGlzIGRpc2FibGVkLCBy
ZXN1bHRpbmcgaW4gbGFyZ2Ugc3RhY2sgd2FybmluZ3Mgd2l0aCBhbGxtb2Rjb25maWc6Cj4+Pj4+
Cj4+Pj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLWxn
cGhpbGlwcy1sYjAzNXEwMi5jOjExNzoxMjoKPj4+Pj4gZXJyb3I6IHN0YWNrIGZyYW1lIHNpemUg
KDE0NDAwKSBleGNlZWRzIGxpbWl0ICgyMDQ4KSBpbiBmdW5jdGlvbgo+Pj4+PiAnbGIwMzVxMDJf
Y29ubmVjdCcgWy1XZXJyb3IsLVdmcmFtZS1sYXJnZXItdGhhbl0KPj4+Pj4gc3RhdGljIGludCBs
YjAzNXEwMl9jb25uZWN0KHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldikKPj4+Pj4gICAg
ICAgICAgICAgXgo+Pj4+PiAxIGVycm9yIGdlbmVyYXRlZC4KPj4+Pj4KPj4+Pj4gRW5zdXJlIHRo
YXQgdGhlIHZhbHVlIG9mIENPTkZJR19LQVNBTl9TVEFDSyBpcyBhbHdheXMgcGFzc2VkIGFsb25n
IHRvCj4+Pj4+IHRoZSBjb21waWxlciBzbyB0aGF0IHRoZXNlIHdhcm5pbmdzIGRvIG5vdCBoYXBw
ZW4gd2hlbgo+Pj4+PiBDT05GSUdfS0FTQU5fU1RBQ0sgaXMgZGlzYWJsZWQuCj4+Pj4+Cj4+Pj4+
IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzE0
NTMKPj4+Pj4gUmVmZXJlbmNlczogNmJhZWM4ODBkN2E1ICgia2FzYW46IHR1cm4gb2ZmIGFzYW4t
c3RhY2sgZm9yIGNsYW5nLTggYW5kIGVhcmxpZXIiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4+Pj4KPj4+PiBSZXZpZXdlZC1ieTog
TWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+Cj4+Pgo+Pj4gVGhhbmtzIQo+Pj4KPj4+PiBb
IFdoaWNoIHRyZWUgYXJlIHlvdSBwbGFubmluZyB0byB0YWtlIGl0IHRocm91Z2g/IF0KPj4+Cj4+
PiBHYWgsIEkgd2FzIGludGVuZGluZyBmb3IgaXQgdG8gZ28gdGhyb3VnaCAtbW0sIHRoZW4gSSBj
YydkIG5laXRoZXIKPj4+IEFuZHJldyBub3IgbGludXgtbW0uLi4gOi8gQW5kcmV3LCBkbyB5b3Ug
d2FudCBtZSB0byByZXNlbmQgb3IgY2FuIHlvdQo+Pj4gZ3JhYiBpdCBmcm9tIExLTUw/Cj4+Cj4+
IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Pgo+
PiAoYXNzdW1pbmcgeW91IHN0aWxsIHdhbnQgaXQgdGhyb3VnaCBzb21ld2hlcmUgZWxzZSkKPiAK
PiBUaGFua3MsIGl0IGlzIG5vdyBpbiBtYWlubGluZSBhcyBjb21taXQgMTk1MzI4NjlmZWI5ICgi
a2FzYW46IGFsd2F5cwo+IHJlc3BlY3QgQ09ORklHX0tBU0FOX1NUQUNLIikuCj4gCj4+Pj4gTm90
ZSwgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rYXNhbi5oIG1lbnRpb25zIEtBU0FOX1NIQURPV19P
RkZTRVQgaW4KPj4+PiBjb21tZW50IChjb3BpZWQgZnJvbSBhcm02NCkuIERpZCBSSVNDLVYganVz
dCBmb3JnZXQgdG8gY29weSBvdmVyIHRoZQo+Pj4+IEtjb25maWcgb3B0aW9uPwo+Pj4KPj4+IEkg
ZG8gc2VlIGl0IGRlZmluZWQgaW4gdGhhdCBmaWxlIGFzIHdlbGwgYnV0IHlvdSBhcmUgcmlnaHQg
dGhhdCB0aGV5IGRpZAo+Pj4gbm90IGNvcHkgdGhlIEtjb25maWcgbG9naWMsIGV2ZW4gdGhvdWdo
IGl0IHdhcyBwcmVzZW50IGluIHRoZSB0cmVlIHdoZW4KPj4+IFJJU0MtViBLQVNBTiB3YXMgaW1w
bGVtZW50ZWQuIFBlcmhhcHMgdGhleSBzaG91bGQgc28gdGhhdCB0aGV5IGdldAo+Pj4gYWNjZXNz
IHRvIHRoZSBvdGhlciBmbGFncyBpbiB0aGUgImVsc2UiIGJyYW5jaD8KPj4KPj4gWWEsIGxvb2tz
IGxpa2Ugd2UganVzdCBzY3Jld2VkIHRoaXMgdXAuICBJJ20gc2VlaW5nIHNvbWUgd2FybmluZ3Mg
bGlrZQo+Pgo+PiAgICAgY2MxOiB3YXJuaW5nOiDigJgtZnNhbml0aXplPWtlcm5lbC1hZGRyZXNz
4oCZIHdpdGggc3RhY2sgcHJvdGVjdGlvbiBpcyBub3Qgc3VwcG9ydGVkIHdpdGhvdXQg4oCYLWZh
c2FuLXNoYWRvdy1vZmZzZXQ94oCZIGZvciB0aGlzIHRhcmdldAo+IAo+IEhtbW0sIEkgdGhvdWdo
dCBJIGRpZCBhIEdDQyBidWlsZCB3aXRoIHRoaXMgY2hhbmdlIGJ1dCBJIG11c3Qgbm90IGhhdmUK
PiA6Lwo+IAo+PiB3aGljaCBpcyBob3cgSSBlbmRlZCB1cCBoZXJlLCBJJ20gYXNzdW1pbmcgdGhh
dCdzIHdoYXQgeW91J3JlIHRhbGtpbmcgYWJvdXQKPj4gaGVyZT8gIExNSyBpZiB5b3Ugd2VyZSBw
bGFubmluZyBvbiBzZW5kaW5nIGFsb25nIGEgZml4IG9yIGlmIHlvdSB3YW50IG1lIHRvCj4+IGdv
IGZpZ3VyZSBpdCBvdXQuCj4gCj4gSSB0b29rIGEgbG9vayBhdCBtb3ZpbmcgdGhlIGxvZ2ljIGlu
dG8gS2NvbmZpZyBsaWtlIGFybTY0IGJlZm9yZSBzZW5kaW5nCj4gdGhpcyBjaGFuZ2UgYW5kIEkg
ZGlkIG5vdCByZWFsbHkgdW5kZXJzdGFuZCBpdCB3ZWxsIGVub3VnaCB0byBkbyBzby4gSQo+IHRo
aW5rIGl0IHdvdWxkIGJlIGJlc3QgaWYgeW91IHdlcmUgYWJsZSB0byBkbyB0aGF0IHNvIHRoYXQg
bm90aGluZyBnZXRzCj4gbWVzc2VkIHVwLgo+IAoKSSdsbCBkbyBpdCB0b21vcnJvdywgSSdtIHRo
ZSBsYXN0IG9uZSB3aG8gdG91Y2hlZCBrYXNhbiBvbiByaXNjdiA6KQoKVGhhbmtzLAoKQWxleAoK
PiBDaGVlcnMsCj4gTmF0aGFuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
