Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD9C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arqnTqdCLbaFIHhmapWdnB4xXK+eevIGzv5IiL7MwS8=; b=hKb5MjSrxBCkFK
	Tx0N5Y2yeeM675rrG13Dd6Ysh86sNwm8cv4hdYsvIu2CLNKXS0c8SnIbUgUhk/tRzuxXhOX+LHZst
	g9qUBA9dKUWPMKPERZ/1A0+cBqevSfXGSUOCpOo0oH9WpcHllPM9Ef4rFALnlTATI+pevX8FL8GAg
	Z/a+4NBVC32LPqsvg1gX33bTsYrbP0k+SQ9J9ZKefqZFP3J8+ANm6WLjmR295w/1/olfuykuWzeOv
	XVOEosob9YEIHfztgNTQaeEu7jZ5TrALXIGGkrwNspa9KBlmHSOiFWw9Ume/Nyfy58ffvxWh/33le
	pAt8cNsxNx74JOIUwkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p292F-001B8I-NX; Mon, 05 Dec 2022 10:49:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p292A-001B4d-FP
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 10:49:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE86360C5C;
	Mon,  5 Dec 2022 10:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BCCC433D6;
	Mon,  5 Dec 2022 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670237353;
	bh=TM/r0k5u2Pt27z45OlKDLTYpA4Gk6ZH5Ef+T3t89ykk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ti/4YSEDFaEqaGcI7l/+n+Qk5FdH8M8W/Jj6RMEljTcdEmrrWR98uFpjDzg0Xcu1U
	 BW5UgAChKM6rXv1Quq6kw/hbl+y5f4GF1D9h63WlOeMtiavJFNeBEJJYiLGH5RGokn
	 uzEcYDaVp/Z6xFP7BDs7MyTwZmuSrhyoKZ0Fn0JnRMeAo8XiKzFRPuWAiGSJF+RuUC
	 NH4ddmq1MdWbIbGwQHH6nLB0ZF6O3QN0nk/HUaZn0Pa4691idOiWwAUIzGYUnHnLvc
	 u3B94j9Bb7mOIVZQ6MtdNfy3kxOPkEDH8QrbAi/CAXeTEFC82GrYasvC2QgdOIym6H
	 ngMl6Uk0GYpbA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V8 06/14] riscv: convert to generic entry
In-Reply-To: <20221103075047.1634923-7-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-7-guoren@kernel.org>
Date: Mon, 05 Dec 2022 11:49:10 +0100
Message-ID: <874jua9lcp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_024914_625267_CF197AF6 
X-CRM114-Status: GOOD (  17.51  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGlzIHBhdGNoIGNvbnZlcnRzIHJpc2N2IHRvIHVzZSB0aGUgZ2Vu
ZXJpYyBlbnRyeSBpbmZyYXN0cnVjdHVyZSBmcm9tCj4ga2VybmVsL2VudHJ5LyouIFRoZSBnZW5l
cmljIGVudHJ5IG1ha2VzIG1haW50YWluZXJzJyB3b3JrIGVhc2llciBhbmQKPiBjb2RlcyBtb3Jl
IGVsZWdhbnQuIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIHRoYW4gYmVmb3JlOgo+Cj4gIC0gTW9yZSBj
bGVhciBlbnRyeS5TIHdpdGggaGFuZGxlX2V4Y2VwdGlvbiBhbmQgcmV0X2Zyb21fZXhjZXB0aW9u
Cj4gIC0gR2V0IHJpZCBvZiBjb21wbGV4IGN1c3RvbSBzaWduYWwgaW1wbGVtZW50YXRpb24KPiAg
LSBNb3JlIHJlYWRhYmxlIHN5c2NhbGwgcHJvY2VkdXJlCj4gIC0gTGl0dGxlIG1vZGlmaWNhdGlv
biBvbiByZXRfZnJvbV9mb3JrICYgcmV0X2Zyb21fa2VybmVsX3RocmVhZAo+ICAtIFdyYXAgd2l0
aCBpcnFlbnRyeV9lbnRlci9leGl0IGFuZCBzeXNjYWxsX2VudGVyL2V4aXRfZnJvbV91c2VyX21v
ZGUKPiAgLSBVc2UgdGhlIHN0YW5kYXJkIHByZWVtcHRpb24gY29kZSBpbnN0ZWFkIG9mIGN1c3Rv
bQo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IFN1Z2dlc3RlZC1i
eTogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4KPiBUZXN0ZWQtYnk6IFlpcGVu
ZyBab3UgPHpvdXlpcGVuZ0BodWF3ZWkuY29tPgo+IC0tLQoKWy4uLl0KCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jp
c2N2LmMKPiBpbmRleCA1ZDNmMmZiZWIzM2MuLmM4NmQwZWFmZGY2YSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jCj4gQEAgLTUsOCArNSwxMCBAQAo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTcgU2lG
aXZlCj4gICAqLwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWNvbW1vbi5oPgo+ICAjaW5j
bHVkZSA8bGludXgvc3lzY2FsbHMuaD4KPiAgI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9zeXNjYWxsLmg+Cj4gICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgo+ICAj
aW5jbHVkZSA8YXNtLWdlbmVyaWMvbW1hbi1jb21tb24uaD4KPiAgCj4gQEAgLTY5LDMgKzcxLDI4
IEBAIFNZU0NBTExfREVGSU5FMyhyaXNjdl9mbHVzaF9pY2FjaGUsIHVpbnRwdHJfdCwgc3RhcnQs
IHVpbnRwdHJfdCwgZW5kLAo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gKwo+ICt0eXBlZGVmIGxv
bmcgKCpzeXNjYWxsX3QpKHVsb25nLCB1bG9uZywgdWxvbmcsIHVsb25nLCB1bG9uZywgdWxvbmcs
IHVsb25nKTsKPiArCj4gK2FzbWxpbmthZ2Ugdm9pZCBkb19zeXNfZWNhbGxfdShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiArewo+ICsJc3lzY2FsbF90IHN5c2NhbGw7Cj4gKwl1bG9uZyBuciA9IHJl
Z3MtPmE3Owo+ICsKPiArCXJlZ3MtPmVwYyArPSA0Owo+ICsJcmVncy0+b3JpZ19hMCA9IHJlZ3Mt
PmEwOwo+ICsJcmVncy0+YTAgPSAtRU5PU1lTOwo+ICsKPiArCW5yID0gc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZShyZWdzLCBucik7Cj4gKyNpZmRlZiBDT05GSUdfQ09NUEFUCj4gKwlpZiAo
KHJlZ3MtPnN0YXR1cyAmIFNSX1VYTCkgPT0gU1JfVVhMXzMyKQo+ICsJCXN5c2NhbGwgPSBjb21w
YXRfc3lzX2NhbGxfdGFibGVbbnJdOwo+ICsJZWxzZQo+ICsjZW5kaWYKPiArCQlzeXNjYWxsID0g
c3lzX2NhbGxfdGFibGVbbnJdOwo+ICsKPiArCWlmIChuciA8IE5SX3N5c2NhbGxzKQo+ICsJCXJl
Z3MtPmEwID0gc3lzY2FsbChyZWdzLT5vcmlnX2EwLCByZWdzLT5hMSwgcmVncy0+YTIsCj4gKwkJ
CQkgICByZWdzLT5hMywgcmVncy0+YTQsIHJlZ3MtPmE1LAo+ICAJcmVncy0+YTYpOwoKTm93IHRo
YXQgd2UncmUgZG9pbmcgdGhlICJwdF9yZWdzIHRvIGNhbGwiIGRhbmNlLCBpdCB3b3VsZCBtYWtl
IHNlbnNlIHRvCmludHJvZHVjZSBhIHN5c2NhbGwgd3JhcHBlciAobGlrZSB4ODYgYW5kIGFybTY0
KSBmb3IgcmlzY3YsIHNvIHRoYXQgd2UKZG9uJ3QgbmVlZCB0byB1bndyYXAgYWxsIHJlZ3MgZm9y
IGFsbCBzeXNjYWxscyAoU2VlIF9fTUFQKCkgaW4KaW5jbHVkZS9saW51eC9zeXNjYWxscy5oKS4g
VGhhdCB3b3VsZCBiZSBhbiBvcHRpbWl6YXRpb24sIHNvIGl0IGNvdWxkIGJlCmRvbmUgYXMgYSBm
b2xsb3ctdXAsIGFuZCBub3QgcGFydCBvZiB0aGUgc2VyaWVzLgoKCkJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
