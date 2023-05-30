Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B03C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1up0pcFjvAhsPWUgLO56oimi8+SdOd2mKvTX25D+fY=; b=Z2Eg0Ikfvo7shJ
	exOfi3IyLUBWmY8jJrEoRK62SLzz+9zlJeX6K5RTuiZQJqTVLFIG/Kn4Wl0k5gK4LMZ6GpwEg1MeY
	PU1tE4VtKl3H/HoPXrixWMSDT8wOjTHj+wvUHGDAFXzfIkQWXj6csPIYcYchbt1VbnN6bseC2/q1a
	9S7BY+UAWZxaoYT37Il+qZrswxB3TIs06J914Ez72V7ApG5TVRrZYzqyDDKxFL9bNplEaBpAfwL6z
	OkPPDV5ugOGrL+c2ETvySp8g8goCopAhYcaqC0tQ/UZwxa05DHWsUd+0lnbvB6HhRxBwt+Ek7IPSz
	2U7q4uI1o/CyHDAnCeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ya4-00DtDb-14;
	Tue, 30 May 2023 12:36:04 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ya1-00DtCT-1X
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 12:36:03 +0000
Date: Tue, 30 May 2023 14:35:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685450155; bh=b3RCf6QIsO9f8zMyCggnyJj6PukOHn5wfBsC9TyQ1dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaUm6cUuHuaFhYQTwVcQ8AU/Wy8mBIiJ/R3mHoNxiPxQz1KzFcDN1HXTfFZMb/siM
	 W1SeYr2d2cqcmrKpifP1LvSyQYqpsBn/xM+fCTxjMDhGX2sH3Zk+q4IC8VDq6AfPD9
	 BcTjuZ7qSBbMWtGpL7dezm09CozCCIVVxioGDLA8=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
Message-ID: <280867a8-7601-4a96-9b85-87668e1f1282@t-8ch.de>
References: <cover.1685428087.git.falcon@tinylab.org>
 <bfc3dba52300dcce03ae1c7c41f2bb8984cf459b.1685428087.git.falcon@tinylab.org>
 <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
 <ZHXmbNg4BdJNd4cO@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHXmbNg4BdJNd4cO@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_053601_669968_A01F866D 
X-CRM114-Status: GOOD (  27.60  )
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

T24gMjAyMy0wNS0zMCAxNDowNTowMCswMjAwLCBXaWxseSBUYXJyZWF1IHdyb3RlOgo+IE9uIFR1
ZSwgTWF5IDMwLCAyMDIzIGF0IDEyOjU5OjMxUE0gKzAyMDAsIFRob21hcyBXZWnDn3NjaHVoIHdy
b3RlOgo+ID4gT24gMjAyMy0wNS0zMCAxNDozNzo0OSswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToK
PiA+ID4gVGhlc2UgMyB0ZXN0IGNhc2VzIGFyZSBhZGRlZCB0byBjb3ZlciB0aGUgbm9ybWFsIHVz
aW5nIHNjZW5lcyBvZgo+ID4gPiBnZXR0aW1lb2ZkYXkoKS4KPiA+ID4gCj4gPiA+IFRoZXkgaGF2
ZSBiZWVuIHVzZWQgdG8gdHJpZ2dlciBhbmQgZml4IHVwIHN1Y2ggaXNzdWU6Cj4gPiA+IAo+ID4g
PiAgICAgbm9saWJjLXRlc3QuYzooLnRleHQuZ2V0dGltZW9mZGF5KzB4NTQpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBfX2FlYWJpX2xkaXZtb2QnCj4gPiA+IAo+ID4gPiBUaGlzIGlzc3VlIGhh
cHBlbnMgd2hpbGUgdGhlcmUgaXMgbm8gInVuc2lnbmVkIGludCIgY29udmVyc2lvbiBpbiB0aGUK
PiA+ID4gbmV3IGNsb2NrX2dldHRpbWUgLyBjbG9ja19nZXR0aW1lNjQgc3lzY2FsbCBwYXRoIG9m
IGdldHRpbWVvZmRheSgpOgo+ID4gPiAKPiA+ID4gICAgIHR2LT50dl91c2VjID0gdHMudHZfbnNl
YyAvIDEwMDA7Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZ2ppbiBXdSA8ZmFsY29u
QHRpbnlsYWIub3JnPgo+ID4gPiAtLS0KPiA+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25v
bGliYy9ub2xpYmMtdGVzdC5jIHwgNSArKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJj
L25vbGliYy10ZXN0LmMKPiA+ID4gaW5kZXggOGJhOGMyZmM3MWEwLi4yMGQxODRkYTlhMmIgMTAw
NjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVz
dC5jCj4gPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVz
dC5jCj4gPiA+IEBAIC01MzMsNiArNTMzLDggQEAgc3RhdGljIGludCB0ZXN0X3N0YXRfdGltZXN0
YW1wcyh2b2lkKQo+ID4gPiAgICovCj4gPiA+ICBpbnQgcnVuX3N5c2NhbGwoaW50IG1pbiwgaW50
IG1heCkKPiA+ID4gIHsKPiA+ID4gKwlzdHJ1Y3QgdGltZXZhbCB0djsKPiA+ID4gKwlzdHJ1Y3Qg
dGltZXpvbmUgdHo7Cj4gPiA+ICAJc3RydWN0IHN0YXQgc3RhdF9idWY7Cj4gPiA+ICAJaW50IGV1
aWQwOwo+ID4gPiAgCWludCBwcm9jOwo+ID4gPiBAQCAtNTg4LDYgKzU5MCw5IEBAIGludCBydW5f
c3lzY2FsbChpbnQgbWluLCBpbnQgbWF4KQo+ID4gPiAgCQlDQVNFX1RFU1QoZ2V0ZGVudHM2NF9y
b290KTsgICBFWFBFQ1RfU1lTTkUoMSwgdGVzdF9nZXRkZW50czY0KCIvIiksIC0xKTsgYnJlYWs7
Cj4gPiA+ICAJCUNBU0VfVEVTVChnZXRkZW50czY0X251bGwpOyAgIEVYUEVDVF9TWVNFUigxLCB0
ZXN0X2dldGRlbnRzNjQoIi9kZXYvbnVsbCIpLCAtMSwgRU5PVERJUik7IGJyZWFrOwo+ID4gPiAg
CQlDQVNFX1RFU1QoZ2V0dGltZW9mZGF5X251bGwpOyBFWFBFQ1RfU1lTWlIoMSwgZ2V0dGltZW9m
ZGF5KE5VTEwsIE5VTEwpKTsgYnJlYWs7Cj4gPiA+ICsJCUNBU0VfVEVTVChnZXR0aW1lb2ZkYXlf
dHYpOyAgIEVYUEVDVF9TWVNaUigxLCBnZXR0aW1lb2ZkYXkoJnR2LCBOVUxMKSk7IGJyZWFrOwo+
ID4gPiArCQlDQVNFX1RFU1QoZ2V0dGltZW9mZGF5X3R6KTsgICBFWFBFQ1RfU1lTWlIoMSwgZ2V0
dGltZW9mZGF5KE5VTEwsICZ0eikpOyBicmVhazsKPiA+IAo+ID4gQ2FsbGluZyBnZXR0aW1lb2Zk
YXkoTlVMTCwgLi4uKSB3aWxsIGFjdHVhbGx5IHNlZ2ZhdWx0IG9uIGdsaWJjLgo+ID4gSXQgd29y
a3Mgd2hlbiBjYWxsaW5nIHRocm91Z2ggdGhlIFZEU08sIGJ1dCBub3QgdGhlIGxvZ2ljIGluIGds
aWJjCj4gPiBpdHNlbGYsIHdoaWNoIGlzIGd1ZXNzIGlzIGFsbG93ZWQgYnkgUE9TSVguCj4gCj4g
VGhlbiB0aGF0J3Mgc2hvY2tpbmcsIGJlY2F1c2UgdGhlIG1hbiBwYWdlIHNheXM6Cj4gCj4gICAg
ICAgIElmIGVpdGhlciB0diBvciB0eiBpcyBOVUxMLCB0aGUgY29ycmVzcG9uZGluZyBzdHJ1Y3R1
cmUgaXMgbm90ICBzZXQgIG9yCj4gICAgICAgIHJldHVybmVkLiAgIChIb3dldmVyLCBjb21waWxh
dGlvbiB3YXJuaW5ncyB3aWxsIHJlc3VsdCBpZiB0diBpcyBOVUxMLikKPiAKPiBJJ2QgZXhwZWN0
IGdsaWJjIHRvIGF0IGxlYXN0IHN1cHBvcnQgd2hhdCdkIGRvY3VtZW50ZWQgaW4gdGhlIG1hbgo+
IHBhZ2UgOi0vCgpUaGF0IGlzIGdldHRpbWVvZmRheSgyKSwgd2hpY2ggY29tZXMgZnJvbSB0aGUg
TGludXggbWFuLXBhZ2VzIHByb2plY3QuCgpnZXR0aW1lb2ZkYXkoM3ApIHdoaWNoIHNwZWNpZmll
cyB0aGUgcG9zaXggZnVuY3Rpb24gZG9lcyBub3QgaGF2ZSB0aGF0IHdvcmRpbmcuCkl0IGFsc28g
c3BlY2lmaWVzIHRoYXQgdGhlcmUgaXMgbm8gd2F5IHRvIGluZGljYXRlIGVycm9ycy4uLgoKU2Vl
bXMgdG8gYmUgYSB3ZWlyZCBzaXR1YXRpb24uCgo+ID4gSSBwcm9wb3NlIHRvIGF2b2lkIGRvaW5n
IGl0IDotKQo+IAo+IElmIHlvdSdyZSBjZXJ0YWluIHRoYXQncyB0aGUgY2FzZSwgdGhlbiBJIGFn
cmVlLgo+IAo+ID4gRWl0aGVyIHdlIGdhdGUgdGhlIGV4aXN0aW5nIHRlc3QgaW4gI2lmZGVmIE5P
TElCQyBvciB3ZSByZW1vdmUgaXQuCj4gCj4gQmV0dGVyIG5vdCBrZWVwIHRlc3RzIHNwZWNpZmlj
IHRvIG5vbGliYyBpZiB0aGV5IGFpbSBhdCB2ZXJpZnlpbmcgc29tZQo+IGNvbXBhdGlibGlpdHku
CgpUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
