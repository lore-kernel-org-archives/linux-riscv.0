Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C9C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 07:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFAd+CNBMHAP6abrOGauTzxV4Ob6ZhwhAsR+umRoyFw=; b=FK0YHwJVDtOUmh
	XUwHfXm6cx26pxmcLH6ZE7bS2XbRymcJIW9SVk0DRzRYlp8dsL9ghB2lxzzLj+Td5jUHESjTwaCsU
	KuijUdVZrUBXlRdXgos4ZnkQtG/fDA5UoJIV+rDidENACpYwUjIneQ4a6Akt69eD3jTHJWFLN92MI
	N1d7CLZTvb6WTI4zq7uLWApojCB4WjS0WLRbl3+5CQfu+i22JXsG1HIMrmWrMXf+QDEswlF0dJanq
	1WV/pTWy5l0UWAvo7/lU2kp6FvQTVMMOEQp9tlfb0ikRGFQn0VItssrZNbtj4DMDutvS9RYZrBKLQ
	hiVNhWcdc5iaT7sLad6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkoh-006Y9k-To; Tue, 31 Jan 2023 07:12:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkod-006Y9G-MA
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 07:12:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3FF9B819D3;
	Tue, 31 Jan 2023 07:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319BEC433EF;
	Tue, 31 Jan 2023 07:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675149144;
	bh=GLgjuhuoJia1KAR/5UGex45CJbUQqaV06MfhGq/cpgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LG9+Z6uP0o6BTNazjYmtFoa+ZhTZHaq7InRd4D32TMcfZFvPAu/GFZXkeGKQpNfrh
	 JnaiZsV6aEjsA1Y8PC4X61ZWGSBNdBXI1TN6GgTmX1KlLV8ibKByby1zXWkICShRWi
	 qlOBtz4PQMbqWk8aTVDoFz+9X8NW1D0xCQc/tutAZK3KGnNIhcoJaPg9WB51YuYssi
	 FDkNyDBfzlEuNMMXR1mTwc22cEbGezu+inYjgeQydjFYzn5kEW47Ec8U1fuODBL+xp
	 6Iy99il2z6Fkw1tzbs+DLo5k6o2AZL05J9wFElZNHTmDH4JrFL2MCXOvlPwd4J17tf
	 URwpmqI2ACtSA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
 <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
Date: Tue, 31 Jan 2023 08:12:22 +0100
Message-ID: <87a61z2n55.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_231228_026394_2F5A0D04 
X-CRM114-Status: GOOD (  21.03  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gTW9uLCBKYW4gMzAsIDIw
MjMgYXQgMTE6NDkgUE0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6
Cj4+Cj4+IEhpIEJqb3JuLAo+Pgo+PiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwNDoyODoxNVBN
ICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiA+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cml0ZXM6Cj4+ID4KPj4gPiA+PiBJbiB0aGUgc2VyaWUgb2YgUklTQ1YgT1BUUFJPQkVT
IFsxXSwgaXQgcGF0Y2hlcyBhIGxvbmctanVtcCBpbnN0cnVjdGlvbnMgcGFpcgo+PiA+ID4+IEFV
SVBDL0pBTFIgaW4ga2VybmVsIHRleHQsIHNvIGluIG9yZGVyIHRvIGVuc3VyZSBvdGhlciBDUFVz
IGRvZXMgbm90IGV4ZWN1dGUKPj4gPiA+PiBpbiB0aGUgaW5zdHJ1Y3Rpb25zIHRoYXQgd2lsbCBi
ZSBtb2RpZmllZCwgaXQgaXMgc3RpbGwgbmVlZCB0byBzdG9wIG90aGVyIENQVXMKPj4gPiA+PiB2
aWEgcGF0Y2hfdGV4dCBBUEksIG9yIHlvdSBoYXZlIGFueSBiZXR0ZXIgc29sdXRpb24gdG8gYWNo
aWV2ZSB0aGUgcHVycG9zZT8KPj4gPiA+ICAtIFRoZSBzdG9wX21hY2hpbmUgaXMgYW4gZXhwZW5z
aXZlIHdheSBhbGwgYXJjaGl0ZWN0dXJlcyBzaG91bGQKPj4gPiA+IGF2b2lkLCBhbmQgeW91IGNv
dWxkIGtlZXAgdGhhdCBpbiB5b3VyIE9QVFBST0JFUyBpbXBsZW1lbnRhdGlvbiBmaWxlcwo+PiA+
ID4gd2l0aCBzdGF0aWMgZnVuY3Rpb25zLgo+PiA+ID4gIC0gVGhlIHN0b3BfbWFjaGluZSBjb3Vs
ZG4ndCB3b3JrIHdpdGggUFJFRU1QVElPTiwgc28geW91cgo+PiA+ID4gaW1wbGVtZW50YXRpb24g
bmVlZHMgdG8gd29yayB3aXRoICFQUkVFTVBUSU9OLgo+PiA+Cj4+ID4gLi4uYW5kIHN0b3BfbWFj
aGluZSgpIHdpdGggIVBSRUVNUFRJT04gaXMgYnJva2VuIGFzIHdlbGwsIHdoZW4geW91J3JlCj4+
ID4gcmVwbGFjaW5nIG11bHRpcGxlIGluc3RydWN0aW9ucyAoc2VlIE1hcmsncyBwb3N0IGF0IFsx
XSkuIFRoZQo+PiA+IHN0b3BfbWFjaGluZSgpIGRhbmNlIG1pZ2h0IHdvcmsgd2hlbiB5b3UncmUg
cmVwbGFjaW5nICpvbmUqIGluc3RydWN0aW9uLAo+PiA+IG5vdCBtdWx0aXBsZSBhcyBpbiB0aGUg
UklTQy1WIGNhc2UuIEknbGwgZXhwYW5kIG9uIHRoaXMgaW4gYSBjb21tZW50IGluCj4+ID4gdGhl
IE9QVFBST0JFUyB2NiBzZXJpZXMuCj4+Cj4+IEp1c3QgdG8gY2xhcmlmeSwgbXkgY29tbWVudHMg
aW4gWzFdIHdlcmUgYXNzdW1pbmcgdGhhdCBzdG9wX21hY2hpbmUoKSB3YXMgbm90Cj4+IHVzZWQs
IGluIHdoaWNoIGNhc2UgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggb3Igd2l0aG91dCBQUkVFTVBU
SU9OLgo+Pgo+PiBJIGJlbGlldmUgdGhhdCB3aGVuIHVzaW5nIHN0b3BfbWFjaGluZSgpLCB0aGUg
IVBSRUVNUFRJT04gY2FzZSBpcyBmaW5lLCBzaW5jZQo+PiBzdG9wX21hY2hpbmUoKSBzY2hlZHVs
ZXMgd29yayByYXRoZXIgdGhhbiBydW5uaW5nIHdvcmsgaW4gSVJRIGNvbnRleHQgb24gdGhlCj4+
IGJhY2sgb2YgYW4gSVBJLCBzbyBubyBDUFVzIHNob3VsZCBiZSBtaWQtc2VxdW5jZSBkdXJpbmcg
dGhlIHBhdGNoaW5nLCBhbmQgaXQncwo+PiBub3QgcG9zc2libGUgZm9yIHRoZXJlIHRvIGJlIHRo
cmVhZHMgd2hpY2ggYXJlIHByZWVtcHRlZCBtaWQtc2VxdWVuY2UuCj4+Cj4+IFRoYXQgYWxsIHNh
aWQsIElJVUMgb3B0cHJvYmVzIGlzIGdvaW5nIHRvIGRpc2FwcGVhciBvbmNlIGZwcm9iZSBpcyBy
ZWFkeQo+PiBldmVyeXdoZXJlLCBzbyB0aGF0IG1pZ2h0IGJlIG1vb3QuCj4gVGhlIG9wdHByb2Jl
cyBjb3VsZCBiZSBpbiB0aGUgbWlkZGxlIG9mIGEgZnVuY3Rpb24sIGJ1dCBmcHJvYmUgbXVzdCBi
ZQo+IHRoZSBlbnRyeSBvZiBhIGZ1bmN0aW9uLCByaWdodD8KPgo+IERvZXMgeW91ciBmcHJvYmUg
aGVyZSBtZWFuOiA/Cj4KPiBUaGUgTGludXgga2VybmVsIGNvbmZpZ3VyYXRpb24gaXRlbSBDT05G
SUdfRlBST0JFOgo+Cj4gcHJvbXB0OiBLZXJuZWwgRnVuY3Rpb24gUHJvYmUgKGZwcm9iZSkKPiB0
eXBlOiBib29sCj4gZGVwZW5kcyBvbjogKCBDT05GSUdfRlVOQ1RJT05fVFJBQ0VSICkgJiYgKAo+
IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKSAmJiAoIENPTkZJR19IQVZFX1JFVEhP
T0sgKQo+IGRlZmluZWQgaW4ga2VybmVsL3RyYWNlL0tjb25maWcKClNlZSB0aGUgY292ZXIgb2Yg
WzFdLiBJdCdzIGFib3V0IGRpcmVjdCBjYWxscyBmb3IgQlBGIHRyYWNpbmcgKGFuZCBtb3JlKQpv
biBBcm0sIGFuZCB5b3UncmUgY29tcGxldGx5IHJpZ2h0LCB0aGF0IGl0J3MgKm5vdCogcmVsYXRl
ZCB0byBvcHRwcm9iZXMKYXQgYWxsLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIyMTEwODIyMDY1MS4yNDQ5Mi0xLXJldmVzdEBjaHJvbWl1bS5vcmcvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
