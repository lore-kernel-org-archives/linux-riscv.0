Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DF0CCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkJwleeAui2uFgzgztYxRFIXTkQcsRfjYSxCPCTfBlQ=; b=r9RRAHWz0k8Gsf
	JSHnutejj08gjDFG2qoREkPyNg8eY96+ghkS2w8swbKs+J5yAQGYYltDr8BKfGCa5YIfMK3Dzo4GZ
	xCeITE/+kXjy+zayu52Lfq2mz3TCiE3emyfUfsUiyjsfC0H4fkMaQXLZqho41d4PNE53UjHb0f90L
	x21MLqP40f+gqaRnrTawdgeMbsqnwBKV4qu73C5xzoqDI6EdKwAtyF1pMdIDW7jHprQ9ecsVTwMby
	VGgsdjRLURPEJse8yYVuHM8Rqkv5zRkL2qC/Sr6XVlcZmkPW7frw/hENtesRQXnYYpTalU8uLsAn4
	l4Dhl+zMNiCR4MZVPD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWO-00000007eWr-1BSY;
	Fri, 17 Oct 2025 11:21:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWL-00000007eVj-1chU;
	Fri, 17 Oct 2025 11:21:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=0w22HeRqwsEaDWfFRcdym9ZdxujQL/SMlrRPuJJ8G0lW0VU+roLNqAQqn+5ddD4XHPvhCI
	G8RfcOVLaDb522FTklVP+T9AWU7a2YUuU3/zS9de1315WWxBoHvU0Nj9QJ0h9Ke1JMi7Um
	5yCRggrIaasOfxTCXZDvGcnXQN5DpN5DBZjhPihilyQSh9zfnpDA51OSo91RRi6YZ2ajDU
	zq9nd/fL2MnY3jElVShCHCxnhdw8CHKx+HzZyOCYRxfE/8sQpHPMZx5+Owgr0vwuACBi4W
	Im9zYuGn3kphxZ4bkop+xrUFJb6ZrY64lUNREC8dmKGqVpm3CuTHhMBvBTfxjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760700075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ5/2E9/kdHV6wKk13IMjV26fuC0EY7cU/moeac/r0k=;
	b=yb2o+SyRVbqNJx1T2MjsSgrIjIm9/+bN/XuOD9YUNJmae1nSpVUZAsBLSIxLGfTfjAFqpz
	FrlXldlLVbWUzqBA==
To: Andrew Cooper <andrew.cooper@citrix.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Peter
 Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
Date: Fri, 17 Oct 2025 13:21:14 +0200
Message-ID: <871pn122qd.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042117_556983_8C0CF525 
X-CRM114-Status: GOOD (  13.97  )
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

T24gRnJpLCBPY3QgMTcgMjAyNSBhdCAxMjowOCwgQW5kcmV3IENvb3BlciB3cm90ZToKCj4gT24g
MTcvMTAvMjAyNSAxMTowOSBhbSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L3VhY2Nlc3MuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAo+PiAr
I2RlZmluZSBfX3Njb3BlZF9tYXNrZWRfdXNlcl9hY2Nlc3MoX21vZGUsIF91cHRyLCBfc2l6ZSwg
X2VsYmwpCQkJCQlcCj4+ICtmb3IgKGJvb2wgX19fX3N0b3AgPSBmYWxzZTsgIV9fX19zdG9wOyBf
X19fc3RvcCA9IHRydWUpCQkJCQkJXAo+PiArCWZvciAodHlwZW9mKChfdXB0cikpIF90bXBwdHIg
PSBfX3Njb3BlZF91c2VyX2FjY2Vzc19iZWdpbihfbW9kZSwgX3VwdHIsIF9zaXplLCBfZWxibCk7
CVwKPj4gKwkgICAgICFfX19fc3RvcDsgX19fX3N0b3AgPSB0cnVlKQkJCQkJCQlcCj4+ICsJCWZv
ciAoQ0xBU1MobWFza2VkX3VzZXJfIyNfbW9kZSMjX2FjY2Vzcywgc2NvcGUpIChfdG1wcHRyKTsg
IV9fX19zdG9wOwkJXAo+PiArCQkgICAgIF9fX19zdG9wID0gdHJ1ZSkJCQkJCVwKPj4gKwkJCS8q
IEZvcmNlIG1vZGlmaWVkIHBvaW50ZXIgdXNhZ2Ugd2l0aGluIHRoZSBzY29wZSAqLwkJCVwKPj4g
KwkJCWZvciAoY29uc3QgdHlwZW9mKChfdXB0cikpIF91cHRyID0gX3RtcHB0cjsgIV9fX19zdG9w
OyBfX19fc3RvcCA9IHRydWUpCVwKPj4gKwkJCQlpZiAoMSkKPj4gKwo+Cj4gVHJ1bHkgYSB0aGlu
ZyBvZiBiZWF1dHkuwqAgQXQgbGVhc3QgdGhlIGVuZCB1c2VyIGV4cGVyaWVuY2UgaXMgbmljZS4K
Pgo+IE9uZSB0aGluZyB0byBiZSBhd2FyZSBvZiBpcyB0aGF0Ogo+Cj4gwqDCoMKgIHNjb3BlZF9t
YXNrZWRfdXNlcl9yd19hY2Nlc3MocHRyLCBlZmF1bHQpIHsKPiDCoMKgwqDCoMKgwqDCoCB1bnNh
ZmVfZ2V0X3VzZXIocnZhbCwgJnB0ci0+cnZhbCwgZWZhdWx0KTsKPiDCoMKgwqDCoMKgwqDCoCB1
bnNhZmVfcHV0X3VzZXIod3ZhbCwgJnB0ci0+d3ZhbCwgZWZhdWx0KTsKPiDCoMKgwqAgfSBlbHNl
IHsKPiDCoMKgwqAgwqDCoMKgIC8vIHVucmVhY2hhYmxlCj4gwqDCoMKgIH0KPgo+IHdpbGwgY29t
cGlsZS7CoCBJbnN0ZWFkLCBJIHRoaW5rIHlvdSB3YW50IHRoZSBmaW5hbCBsaW5lIG9mIHRoZSBt
YWNybyB0bwo+IGJlICJpZiAoMCkge30gZWxzZSIgdG8gcHJldmVudCB0aGlzLgoKRHVoLiB5ZXMu
IEJ1dCBJIGNhbiBqdXN0IHJlbW92ZSB0aGUgJ2lmICgxKScgY29tcGxldGVseS4gVGhhdCdzIGEK
bGVmdG92ZXIgZnJvbSBzb21lIGVhcmxpZXIgaXRlcmF0aW9uIG9mIHRoaXMuCgo+IFdoaWxlIHdl
J3JlIG9uIHRoZSBzdWJqZWN0LCBjYW4gd2UgZmluZCBzb21lIEMgc3RhbmRhcmRzIHBlb3BsZSB0
byBsb2JieS4KPgo+IEMyWSBoYXMgYSBwcm9wb3NhbCB0byBpbnRyb2R1Y2UgImlmIChpbnQgZm9v
ID0iIHN5bnRheCB0byBnZW5lcmFsaXNlIHRoZQo+IGZvcigpIGxvb3Agc3BlY2lhbCBjYXNlLsKg
IENhbiB3ZSBwbGVhc2Ugc2VlIGFib3V0IGZpeGluZyB0aGUgcmVzdHJpY3Rpb24KPiBvZiBvbmx5
IGFsbG93aW5nIGEgc2luZ2xlIHR5cGUgcGVyIGxvb3A/wqDCoCBUaGlzIGV4YW1wbGUgY291bGQg
YmUgYQo+IHNpbmdsZSBsb29wIGlmIGl0IHdlcmVuJ3QgZm9yIHRoYXQgcmVzdHJpY3Rpb24uCgpU
aGF0J2QgYmUgbmljZS4gQnV0IHdlIGNhbid0IGhhdmUgbmljZSB0aGluZ3MsIGNhbiB3ZT8KClRo
YW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
