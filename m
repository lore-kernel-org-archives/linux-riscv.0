Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D529ACD37B3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 05:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeVdyl9Le+rO05dnO6MMO570HiJUu3pOLUcVRaIpOzs=; b=TXxtcosqVacOqc
	S0fFinwssTcFRIJqu8pgmkOdYKLaUOavPAr36zRSKQRQqkk28Y/erdhNqzIVkYHLv3W+U5kGBnmGR
	pawFTewyiqlTgYUpjssvHnmbBKPqxsywLS7ZVBzUZjl0sGkNlZh0a+YhpFvMEr4Ejnz1ll52L7ESl
	2dV96Ya3anMIoBm556/UWs4IcK0B4FqpsNlzw0SDj4hQs/awYg3srpzU+26It8VfwPrCL+Gt7hhOr
	DeGtguElRa+QxlXu1CZ4kBlOHQ7hY/5OTyI8peyHWWb7QT8WQWcbRz5Ww+MpcvPhBYJTagqc9nLyM
	K/ajXPrCNQHkugAq/BXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhkfd-00DAFG-1B;
	Sun, 17 Sep 2023 05:50:13 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhkfY-00DADn-1G
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 05:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694929799;
	bh=I2ORHDPmzg8IMQkgZSGbyhmTUn7nAixQxkusYZXX9Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNhvK9COLyxFXqsSZoncbm4ouWx+Xn1gh6p+fU6V31arYi8oIbkEOyMxEv8YtTaM4
	 9JuXFJ7xrV8X8uhdb/ZrUvtuG054Xa4X5b66PsE+uDraTemleD4RBH9PezFqXpHXYh
	 jgb+n3iwz/+Ck3NN2n1YjPHOM/2fLBWGlxMJLLTw=
Date: Sun, 17 Sep 2023 07:49:57 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <2bd688b7-5f1b-44ca-a41b-6e90dc3e8557@t-8ch.de>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
 <20230917025851.GE9646@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917025851.GE9646@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_225009_066636_68CC73C2 
X-CRM114-Status: GOOD (  19.41  )
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

T24gMjAyMy0wOS0xNyAwNDo1ODo1MSswMjAwLCBXaWxseSBUYXJyZWF1IHdyb3RlOgo+IE9uIFRo
dSwgU2VwIDE0LCAyMDIzIGF0IDA2OjAxOjE4UE0gKzAyMDAsIFRob21hcyBXZWnDn3NjaHVoIHdy
b3RlOgo+ID4gVGhlIEVOT1NZUyBmYWxsYmFjayBjb2RlIGRvZXMgbm90IHVzZSBpdHMgZnVuY3Rp
b25zIHBhcmFtZXRlcnMuCj4gPiBUaGlzIGNhbiBsZWFkIHRvIGNvbXBpbGVyIHdhcm5pbmdzIGFi
b3V0IHVudXNlZCBwYXJhbWV0ZXJzLgo+ID4gCj4gPiBFeHBsaWNpdGx5IGF2b2lkIHRoZXNlIHdh
cm5pbmdzLgo+IAo+IEp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgZGlkIHlvdSBmaW5kIGEgdmFsaWQg
Y2FzZSBmb3IgZW5hYmxpbmcgdGhpcwo+IHdhcm5pbmcgb3Igd2VyZSB5b3UgdHJ5aW5nIHZhcmlv
dXMgY29tYmluYXRpb25zID8gSSdtIGFza2luZyBiZWNhdXNlCj4gSSd2ZSBuZXZlciBzZWVuIGl0
IGVuYWJsZWQgYW55d2hlcmUgZ2l2ZW4gdGhhdCBpdCdzIHByb2JhYmx5IHRoZSBtb3N0IAo+IHVz
ZWxlc3MgYW5kIHVudXNhYmxlIHdhcm5pbmc6IGFzIHNvb24gYXMgeW91J3JlIGRlYWxpbmcgd2l0
aCBmdW5jdGlvbgo+IHBvaW50ZXJzLCB5b3Ugc3RhcnQgdG8gaGF2ZSBtdWx0aXBsZSBmdW5jdGlv
bnMgd2l0aCBhIHNpbWlsYXIKPiBwcm90b3R5cGUsIHNvbWUgb2Ygd2hpY2gganVzdCBkb24ndCBu
ZWVkIGNlcnRhaW4gYXJndW1lbnRzLCBhbmQgdGhlCj4gb25seSB3YXkgdG8gc2h1dCB0aGUgd2Fy
bmluZyBpcyB0byBzaWduaWZpY2FudGx5IHVnbGlmeSB0aGUgY29kZS4KCm5vbGliYy10ZXN0IHVz
ZXMgaXQgY3VycmVudGx5IGFuZCBJIGFsc28gdXNlZCBpdCBpbiBzb21lIHByb2plY3RzLgoKPiBJ
ZiByZWFsbHkgbmVlZGVkLCBJJ20gd29uZGVyaW5nIGlmIGluc3RlYWQgd2Ugc2hvdWxkbid0IGhh
dmUgYW4KPiAibm9fc3lzY2FsbCoiIHNldCBvZiBtYWNyb3MsIHRoYXQgd291bGQgaGF2ZSB0aGUg
c2FtZSBzaWduYXR1cmUKPiBhcyBteV9zeXNjYWxsKiB0byBqdXN0IGNvbnN1bWUgYWxsIGFyZ3Mg
aW4gdGhlIHNhbWUgb3JkZXIgYW5kCj4gcmV0dXJuIC1FTk9TWVMuIEUuZywgY29uc2lkZXIgdGhl
IGZvbGxvd2luZzoKPiAKPiAgIEBAIC05MzQsNiArOTYwLDExIEBAIGludCBzeXNfc2VsZWN0KGlu
dCBuZmRzLCBmZF9zZXQgKnJmZHMsIGZkX3NldCAqd2ZkcywgZmRfc2V0ICplZmRzLCBzdHJ1Y3Qg
dGltZXZhCj4gICAgI2VuZGlmCj4gICAgCXJldHVybiBteV9zeXNjYWxsNShfX05SX19uZXdzZWxl
Y3QsIG5mZHMsIHJmZHMsIHdmZHMsIGVmZHMsIHRpbWVvdXQpOwo+ICAgICNlbHNlCj4gICArCSh2
b2lkKW5mZHM7Cj4gICArCSh2b2lkKXJmZHM7Cj4gICArCSh2b2lkKXdmZHM7Cj4gICArCSh2b2lk
KWVmZHM7Cj4gICArCSh2b2lkKXRpbWVvdXQ7Cj4gICAgCXJldHVybiAtRU5PU1lTOwo+ICAgICNl
bmRpZgo+IAo+IEl0IHdvdWxkIGJlY29tZToKPiAKPiAgIEBAIC05MzQsNiArOTYwLDExIEBAIGlu
dCBzeXNfc2VsZWN0KGludCBuZmRzLCBmZF9zZXQgKnJmZHMsIGZkX3NldCAqd2ZkcywgZmRfc2V0
ICplZmRzLCBzdHJ1Y3QgdGltZXZhCj4gICAgI2VuZGlmCj4gICAgCXJldHVybiBteV9zeXNjYWxs
NShfX05SX19uZXdzZWxlY3QsIG5mZHMsIHJmZHMsIHdmZHMsIGVmZHMsIHRpbWVvdXQpOwo+ICAg
ICNlbHNlCj4gICArCXJldHVybiBub19zeXNjYWxsNShuZmRzLCByZmRzLCB3ZmRzLCBlZmRzLCB0
aW1lb3V0KTsKPiAgIC0JcmV0dXJuIC1FTk9TWVM7Cj4gICAgI2VuZGlmCj4gCj4gV2hhdCBkbyB5
b3UgdGhpbmsgPwoKVGhlIGlkZWEgc291bmRzIGdvb2QuIEJ1dCAibm9fc3lzY2FsbDUiIHNvdW5k
cyBhIGJpdCBub24tb2J2aW91cyB0byBtZS4KCk1heWJlIHRoZSBtYWNyby1lcXVpdmFsZW50IG9m
IHRoaXM/CgpzdGF0aWMgaW5saW5lIGludCBfX25vbGliY19lbm9zeXMoLi4uKQp7CglyZXR1cm4g
LUVOT1NZUzsKfQoKVGhlIG9ubHktdmFyYXJnIGZ1bmN0aW9uIHVuZm9ydHVuYXRlbHkgbmVlZHMg
QzIzIHNvIHdlIGNhbid0IHVzZSBpdC4KCkl0J3MgY2xlYXIgdG8gdGhlIHVzZXJzIHRoYXQgdGhp
cyBpcyBhYm91dCBFTk9TWVMgYW5kIHdlIGRvbid0IG5lZWQgYQpidW5jaCBvZiBuZXcgbWFjcm9z
IHNpbWlsYXIuCgpJJ2xsIGNoZWNrIGlmIGl0IGlzIGNsZWFuZXIgdG8gaW1wbGVtZW50IGEgZ2Vu
ZXJpYyBtYWNybyBvciBhIGZldwpudW1iZXJlZCBvbmVzLgoKClRob21hcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
