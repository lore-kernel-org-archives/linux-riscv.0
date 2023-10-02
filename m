Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6035AE784A5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 07:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGs5Rzf8fpnPbWduHieUjKK2GPBmcsvIddNmc77VxKQ=; b=O6a3jjcMS3cuny
	cjMjiTpEauOfuquuo06ucVYZKY04F1cqrg6q3FlZ/wjgvZvdBZ7S0SXJ9yetkkiL3FA78mk50N16q
	mKRB16NwRz76z5Q7wgsDhvWF+bnN3FtZBW1dMoQsrk14aV7dzs/ZywBUE9M1LhVsCd/hEOkXLZDg+
	1i7nrdJuz8q8AO65QMwns8rFLFbzA4XFgXj3aUWO+KYx5+2m3xGDH+QrjN9i+6kaIgNYR691D/4Qy
	nAJ5Q+xrhTEldd3QKLr9G9T5QoniAMWTq4YEbiPvOSHPwme6eKQoxJYOJ4l6ULUFzXLqhIZD72/cW
	zd8bRAuckyl4ikwolTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCxG-00C3t2-0g;
	Mon, 02 Oct 2023 07:02:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCxC-00C3rh-25
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 07:02:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3318B20009;
	Mon,  2 Oct 2023 07:02:42 +0000 (UTC)
Message-ID: <8d305ae1-4235-6ae8-7dfb-9f432fdfcd41@ghiti.fr>
Date: Mon, 2 Oct 2023 09:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Content-Language: en-US
To: Pedro Falcato <pedro.falcato@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: Conor Dooley <conor@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
 <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud> <202309301400.4E1AD87@keescook>
 <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKbZUD08W9_HB9F7tQqwreYvVapgVMOkS3QokzwHPcBnFnVMig@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_000254_844948_131AF06E 
X-CRM114-Status: GOOD (  16.96  )
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

T24gMDEvMTAvMjAyMyAxNzoxOSwgUGVkcm8gRmFsY2F0byB3cm90ZToKPiBPbiBTdW4sIE9jdCAx
LCAyMDIzIGF0IDI6NTHigK9BTSBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4gd3Jv
dGU6Cj4+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDEwOjAyOjM1QU0gKzAxMDAsIENvbm9yIERv
b2xleSB3cm90ZToKPj4+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDAzOjUyOjIyUE0gLTA3MDAs
IFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMjo1NOKA
r1BNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPiB3cm90ZToKPj4+Pj4gT24gRnJp
LCBTZXAgMjksIDIwMjMgYXQgMDk6MTE6NThQTSArMDAwMCwgU2FtaSBUb2x2YW5lbiB3cm90ZToK
Pj4+Pj4+IEFSQ0hfTU1BUF9STkRfQklUU19NQVggaXMgYmFzZWQgb24gU3YzOSwgd2hpY2ggbGVh
dmVzIGEgZmV3Cj4+Pj4+PiBwb3RlbnRpYWwgYml0cyBvZiBtbWFwIHJhbmRvbW5lc3Mgb24gdGhl
IHRhYmxlIGlmIHdlIGVuZCB1cCBlbmFibGluZwo+Pj4+Pj4gNC81LWxldmVsIHBhZ2luZy4gVXBk
YXRlIG1tYXBfcm5kX2JpdHNfbWF4IHRvIHRha2UgdGhlIGZpbmFsIGFkZHJlc3MKPj4+Pj4+IHNw
YWNlIHNpemUgaW50byBhY2NvdW50LiBUaGlzIGluY3JlYXNlcyBtbWFwX3JuZF9iaXRzX21heCBm
cm9tIDI0IHRvCj4+Pj4+PiAzMyB3aXRoIFN2NDgvNTcuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+Cj4+Pj4+IEkgbGlr
ZSB0aGlzLiBJcyBSSVNDViB0aGUgb25seSBhcmNoIHdoZXJlIHRoZSBwYWdpbmcgbGV2ZWwgY2Fu
IGJlIGNob3Nlbgo+Pj4+PiBhdCBib290IHRpbWU/Cj4+Pj4gSSBoYXZlbid0IHNlZW4gdGhpcyBl
bHNld2hlcmUsIGJ1dCBJIGFsc28gaGF2ZW4ndCBsb29rZWQgYXQgYWxsIHRoZQo+Pj4+IG90aGVy
IGFyY2hpdGVjdHVyZXMgdGhhdCBjbG9zZWx5LiBhcm02NCBkb2VzIHNvbWV0aGluZyBpbnRlcmVz
dGluZwo+Pj4+IHdpdGggQVJNNjRfVkFfQklUU181MiwgYnV0IEkgdGhpbmsgd2UgY2FuIHN0aWxs
IGhhbmRsZSB0aGF0IGluCj4+Pj4gS2NvbmZpZy4KPj4+IEFGQUlVLCB4ODYtNjQgY2FuIGRvIHRo
aXMgYWxzbzoKPj4+Cj4+PiAgICAgICAgbm80bHZsICAgICAgICAgIFtSSVNDVl0gRGlzYWJsZSA0
LWxldmVsIGFuZCA1LWxldmVsIHBhZ2luZyBtb2Rlcy4gRm9yY2VzCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgIGtlcm5lbCB0byB1c2UgMy1sZXZlbCBwYWdpbmcgaW5zdGVhZC4KPj4+Cj4+PiAg
ICAgICAgbm81bHZsICAgICAgICAgIFtYODYtNjQsUklTQ1ZdIERpc2FibGUgNS1sZXZlbCBwYWdp
bmcgbW9kZS4gRm9yY2VzCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbCB0byB1c2Ug
NC1sZXZlbCBwYWdpbmcgaW5zdGVhZC4KPj4gQWgtaGEhIE9rYXksIHdlbGwsIHRoZW4gbGV0J3Mg
dHJhY2sgdGhpcyBpZGVhOgo+PiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMv
MzQ2Cj4gKFJlcGx5aW5nIGhlcmUgZm9yIHZpc2liaWxpdHksIHRlbGwgbWUgaWYgeW91IHdhbnQg
dG8gbW92ZSB0aGlzCj4gZGlzY3Vzc2lvbiB0byBnaXRodWIpCj4KPiBBSVVJLCB4ODYgY2Fubm90
IGRvIHRoaXMgZm9yIGNvbXBhdCByZWFzb25zLiBFdmVuIGlmIHlvdSBlbmFibGUgTEE1NywKPiBt
bWFwIG9ubHkgZ2l2ZXMgeW91IDwgNDgtYml0IGFkZHJlc3NlcywgZm9yIGNvbXBhdGliaWxpdHkg
d2l0aCB0aGluZ3MKPiBsaWtlIEpJVHMsIGV0YyB0aGF0IHN0YXNoIGluZm9ybWF0aW9uIGluIHRo
ZSB1cHBlciAxNiBiaXRzLiBZb3UgbmVlZAo+IHRvIHBhc3MgYSA+IDQ4LWJpdCBtbWFwIGhpbnQg
dG8gZ2V0IDU3LWJpdCBhZGRyZXNzZXMuCj4KPiBJIGltYWdpbmUgcmlzY3YgZG9lcyBub3QgaGF2
ZSB0aGlzIGlzc3VlIHlldCwgZHVlIHRvIGxpdHRsZQo+IGFjY3VtdWxhdGVkIGNydWZ0LCBidXQg
aXQgbWF5IGJlIHdpc2UgdG8gY2hlY2sgYWdhaW5zdCBwb3B1bGFyIEpJVHRlcnMKPiBmb3IgdGhl
c2UgcHJvYmxlbXMgb24gcmlzY3YgY29kZS4KPgoKV2UgYWxyZWFkeSBlbmNvdW50ZXJlZCB0aG9z
ZSBpc3N1ZXMgYW5kIHRoZSBzYW1lIHNvbHV0aW9uIHdhcyByZWNlbnRseSAKbWVyZ2VkIChyZXN0
cmljdCB0byBzdjQ4IHVubGVzcyBvdGhlcndpc2Ugc3BlY2lmaWVkKTogCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMDgwOTIzMjIxOC44NDk3MjYtMS1jaGFybGllQHJpdm9zaW5jLmNv
bS8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
