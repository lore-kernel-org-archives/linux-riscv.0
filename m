Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2229C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 16:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A546109E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 16:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80A546109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+c3A7P6Bw4bpg93WwQeuksopcFRwbue9hL2NlYPvJwE=; b=PZtKX73dn3itu2
	xV7FUWWqN6yuOFReVAz3eDHtH0WMDq8+/Ip9b2eabFpshEZYQm4EvdFrkKnGCyp74vv1MS18ngQ1d
	icd4+Y94JD3sFgCU4LUnMSML8I262cTHW9jme+vceYOnLMz2GVVvzFg9WqXDdzGUSLhVURbPggjy8
	Dka5GEIzJdYlDCa+pcBN9ZxwCPxHH7hCD50/0hFayN1zbc4ERYl6GBCen6IbZtTxL06x6yM1l1B+u
	wARkKZJqnnx+xDGVt6ArJtSBVQuzkJtJcC50wUeROAwsAxUw5FAyA6pHJIxzTgaidK4Se0JS/P86Q
	JwJdn6xTuJjHLeUFRtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb40r-003vAD-2U; Thu, 14 Oct 2021 16:55:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb40o-003v9N-EI
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 16:55:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DB9D6101D;
 Thu, 14 Oct 2021 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634230522;
 bh=SK9fa8kBvKfk0pw+RnBE/3/wOfdzkDkUl60TS++n7Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URMDQCzgsfwoK5y/yNeoJ9JNO/8oJ2NMHAFhAdOy1sGEmtF9XAAISro92Op+4CLCV
 yz8pYDFNRFzXaJjjZZNkQmS6xjCt/ghBTpBe7izXZK2HZZK1u2FLlZOLXSvNd4nD06
 5CanmAIdF34pzRmAIif5Q64GJtcQ5TngqgFvJeW3E9bfmHJTfsyZGGGL7cjuetxvNQ
 DjWaqDEAhLYF/YM9Is2bNH9fPhtpTop86L1W5TtLmWjFVRN3MvUgUa0tbyI4Tl/rs+
 ROpY6NxCNDMdit7BPa0iEvomWIMDs3JszoYmWYSAtxoUAU4nwX7pJmq+LQ7+RU+IFc
 BqEp9rvWIEb2A==
Date: Thu, 14 Oct 2021 09:55:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: elver@google.com, akpm@linux-foundation.org, ryabinin.a.a@gmail.com,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-mm@kvack.org
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
Message-ID: <YWhg8/UzjJsB51Gd@archlinux-ax161>
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_095522_545422_D119242F 
X-CRM114-Status: GOOD (  31.89  )
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

T24gRnJpLCBPY3QgMDgsIDIwMjEgYXQgMTE6NDY6NTVBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gVGh1LCAyMyBTZXAgMjAyMSAwNzo1OTo0NiBQRFQgKC0wNzAwKSwgbmF0aGFu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBPbiBUaHUsIFNlcCAyMywgMjAyMSBhdCAxMjowNzoxN1BN
ICswMjAwLCBNYXJjbyBFbHZlciB3cm90ZToKPiA+ID4gT24gV2VkLCAyMiBTZXB0IDIwMjEgYXQg
MjI6NTUsIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+
ID4gQ3VycmVudGx5LCB0aGUgYXNhbi1zdGFjayBwYXJhbWV0ZXIgaXMgb25seSBwYXNzZWQgYWxv
bmcgaWYKPiA+ID4gPiBDRkxBR1NfS0FTQU5fU0hBRE9XIGlzIG5vdCBlbXB0eSwgd2hpY2ggcmVx
dWlyZXMgS0FTQU5fU0hBRE9XX09GRlNFVCB0bwo+ID4gPiA+IGJlIGRlZmluZWQgaW4gS2NvbmZp
ZyBzbyB0aGF0IHRoZSB2YWx1ZSBjYW4gYmUgY2hlY2tlZC4gSW4gUklTQy1WJ3MKPiA+ID4gPiBj
YXNlLCBLQVNBTl9TSEFET1dfT0ZGU0VUIGlzIG5vdCBkZWZpbmVkIGluIEtjb25maWcsIHdoaWNo
IG1lYW5zIHRoYXQKPiA+ID4gPiBhc2FuLXN0YWNrIGRvZXMgbm90IGdldCBkaXNhYmxlZCB3aXRo
IGNsYW5nIGV2ZW4gd2hlbiBDT05GSUdfS0FTQU5fU1RBQ0sKPiA+ID4gPiBpcyBkaXNhYmxlZCwg
cmVzdWx0aW5nIGluIGxhcmdlIHN0YWNrIHdhcm5pbmdzIHdpdGggYWxsbW9kY29uZmlnOgo+ID4g
PiA+Cj4gPiA+ID4gZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFu
ZWwtbGdwaGlsaXBzLWxiMDM1cTAyLmM6MTE3OjEyOgo+ID4gPiA+IGVycm9yOiBzdGFjayBmcmFt
ZSBzaXplICgxNDQwMCkgZXhjZWVkcyBsaW1pdCAoMjA0OCkgaW4gZnVuY3Rpb24KPiA+ID4gPiAn
bGIwMzVxMDJfY29ubmVjdCcgWy1XZXJyb3IsLVdmcmFtZS1sYXJnZXItdGhhbl0KPiA+ID4gPiBz
dGF0aWMgaW50IGxiMDM1cTAyX2Nvbm5lY3Qoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2
KQo+ID4gPiA+ICAgICAgICAgICAgXgo+ID4gPiA+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+ID4gPiA+
Cj4gPiA+ID4gRW5zdXJlIHRoYXQgdGhlIHZhbHVlIG9mIENPTkZJR19LQVNBTl9TVEFDSyBpcyBh
bHdheXMgcGFzc2VkIGFsb25nIHRvCj4gPiA+ID4gdGhlIGNvbXBpbGVyIHNvIHRoYXQgdGhlc2Ug
d2FybmluZ3MgZG8gbm90IGhhcHBlbiB3aGVuCj4gPiA+ID4gQ09ORklHX0tBU0FOX1NUQUNLIGlz
IGRpc2FibGVkLgo+ID4gPiA+Cj4gPiA+ID4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5n
QnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTQ1Mwo+ID4gPiA+IFJlZmVyZW5jZXM6IDZiYWVjODgw
ZDdhNSAoImthc2FuOiB0dXJuIG9mZiBhc2FuLXN0YWNrIGZvciBjbGFuZy04IGFuZCBlYXJsaWVy
IikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5l
bC5vcmc+Cj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogTWFyY28gRWx2ZXIgPGVsdmVyQGdvb2ds
ZS5jb20+Cj4gPiAKPiA+IFRoYW5rcyEKPiA+IAo+ID4gPiBbIFdoaWNoIHRyZWUgYXJlIHlvdSBw
bGFubmluZyB0byB0YWtlIGl0IHRocm91Z2g/IF0KPiA+IAo+ID4gR2FoLCBJIHdhcyBpbnRlbmRp
bmcgZm9yIGl0IHRvIGdvIHRocm91Z2ggLW1tLCB0aGVuIEkgY2MnZCBuZWl0aGVyCj4gPiBBbmRy
ZXcgbm9yIGxpbnV4LW1tLi4uIDovIEFuZHJldywgZG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIG9y
IGNhbiB5b3UKPiA+IGdyYWIgaXQgZnJvbSBMS01MPwo+IAo+IEFja2VkLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+IAo+IChhc3N1bWluZyB5b3Ugc3RpbGwg
d2FudCBpdCB0aHJvdWdoIHNvbWV3aGVyZSBlbHNlKQoKVGhhbmtzLCBpdCBpcyBub3cgaW4gbWFp
bmxpbmUgYXMgY29tbWl0IDE5NTMyODY5ZmViOSAoImthc2FuOiBhbHdheXMKcmVzcGVjdCBDT05G
SUdfS0FTQU5fU1RBQ0siKS4KCj4gPiA+IE5vdGUsIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2Fz
YW4uaCBtZW50aW9ucyBLQVNBTl9TSEFET1dfT0ZGU0VUIGluCj4gPiA+IGNvbW1lbnQgKGNvcGll
ZCBmcm9tIGFybTY0KS4gRGlkIFJJU0MtViBqdXN0IGZvcmdldCB0byBjb3B5IG92ZXIgdGhlCj4g
PiA+IEtjb25maWcgb3B0aW9uPwo+ID4gCj4gPiBJIGRvIHNlZSBpdCBkZWZpbmVkIGluIHRoYXQg
ZmlsZSBhcyB3ZWxsIGJ1dCB5b3UgYXJlIHJpZ2h0IHRoYXQgdGhleSBkaWQKPiA+IG5vdCBjb3B5
IHRoZSBLY29uZmlnIGxvZ2ljLCBldmVuIHRob3VnaCBpdCB3YXMgcHJlc2VudCBpbiB0aGUgdHJl
ZSB3aGVuCj4gPiBSSVNDLVYgS0FTQU4gd2FzIGltcGxlbWVudGVkLiBQZXJoYXBzIHRoZXkgc2hv
dWxkIHNvIHRoYXQgdGhleSBnZXQKPiA+IGFjY2VzcyB0byB0aGUgb3RoZXIgZmxhZ3MgaW4gdGhl
ICJlbHNlIiBicmFuY2g/Cj4gCj4gWWEsIGxvb2tzIGxpa2Ugd2UganVzdCBzY3Jld2VkIHRoaXMg
dXAuICBJJ20gc2VlaW5nIHNvbWUgd2FybmluZ3MgbGlrZQo+IAo+ICAgIGNjMTogd2FybmluZzog
4oCYLWZzYW5pdGl6ZT1rZXJuZWwtYWRkcmVzc+KAmSB3aXRoIHN0YWNrIHByb3RlY3Rpb24gaXMg
bm90IHN1cHBvcnRlZCB3aXRob3V0IOKAmC1mYXNhbi1zaGFkb3ctb2Zmc2V0PeKAmSBmb3IgdGhp
cyB0YXJnZXQKCkhtbW0sIEkgdGhvdWdodCBJIGRpZCBhIEdDQyBidWlsZCB3aXRoIHRoaXMgY2hh
bmdlIGJ1dCBJIG11c3Qgbm90IGhhdmUKOi8gCgo+IHdoaWNoIGlzIGhvdyBJIGVuZGVkIHVwIGhl
cmUsIEknbSBhc3N1bWluZyB0aGF0J3Mgd2hhdCB5b3UncmUgdGFsa2luZyBhYm91dAo+IGhlcmU/
ICBMTUsgaWYgeW91IHdlcmUgcGxhbm5pbmcgb24gc2VuZGluZyBhbG9uZyBhIGZpeCBvciBpZiB5
b3Ugd2FudCBtZSB0bwo+IGdvIGZpZ3VyZSBpdCBvdXQuCgpJIHRvb2sgYSBsb29rIGF0IG1vdmlu
ZyB0aGUgbG9naWMgaW50byBLY29uZmlnIGxpa2UgYXJtNjQgYmVmb3JlIHNlbmRpbmcKdGhpcyBj
aGFuZ2UgYW5kIEkgZGlkIG5vdCByZWFsbHkgdW5kZXJzdGFuZCBpdCB3ZWxsIGVub3VnaCB0byBk
byBzby4gSQp0aGluayBpdCB3b3VsZCBiZSBiZXN0IGlmIHlvdSB3ZXJlIGFibGUgdG8gZG8gdGhh
dCBzbyB0aGF0IG5vdGhpbmcgZ2V0cwptZXNzZWQgdXAuCgpDaGVlcnMsCk5hdGhhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
