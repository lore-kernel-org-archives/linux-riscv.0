Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C82C44508
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bYepoPhEc34ZPLN9ONioMeRjhjookJi/09i9jd2RFY=; b=hkU8NGjySpSpBz
	QYjyIsuGgrCJcG1522OWbG36BsSga2bB4ntDmKErC9wyrT8KZyiWUGhqUqAi6UBoiUqCMURg5A7cz
	uK2EleHjfqdTrniX03W1jXR/NeNvFRpqNDthTBGu/lbyMPJS4Qka9Da5o9DHURRpUl3YdCreEtoS3
	t8FGrxefUjp0nGf7UopD/QeFl5uPlWWB4rAJlIgQKi1oxs7bI7pKPBvRlVsUSG3x4s7M+v0ax71gP
	tWtqYU5impq5nLKTE+D1sGHq4u6p1VYOhiCxRUlxwj1V2soEKYIvv93IeRa52qRwakhx4q0cpLWcn
	jRn4RtpcpsD6yjGp4KiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf46-0000000CXPq-1eFq;
	Tue, 14 Jul 2026 15:28:58 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjf43-0000000CXPA-1Akp
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:28:56 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.105.230])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 68B74C2C75;
	Tue, 14 Jul 2026 18:28:44 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 68B74C2C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784042933;
	bh=oWZluxV84siLpiF5+zUyziImhfWV+NEScMbyx+dvzBs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Vbg3kCjOcEIDdoCRUl8bNodo0GCsg6KqZ8Nz67Kr0ZmfOuCejAmX+j5j7Xw45N4Sj
	 0s25sd9fircbQmy6b9Af1co7rARL4M/97kMvNOxfQfyv+jYMfwpAr84/FD55Ah8W+1
	 4U+RtbsU89XGXActBjUAYLqkixwlcLr9tyTW6XI7okTl23G/0pRgU3AJ9T0iiO472p
	 bsUcLyqdUKhEeYdYBK+PYaOYK2X0MF7DG7hzwqvZC3+VGh/aY/Z/oFpw5A4RSGKYqp
	 jpqPJme1o46ygr7QSihAhkv6fxLdRMBZM5EENkoyRg/n/BZI65MV8QeBxnO8GT5CxZ
	 HYC6QlS9f4YEg==
Message-ID: <230256edbe24e417e0e80e31f5a7e7ca120692dc.camel@rendec.net>
Subject: Re: [patch 2/4] entry: Rework trace_syscall_enter()
From: Radu Rendec <radu@rendec.net>
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Michal =?ISO-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, Michael Ellerman
	 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle	
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland	 <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Magnus Lindholm	 <linmag7@gmail.com>, "Mukesh Kumar Chaurasiya (IBM)"
 <mkchauras@gmail.com>,  Jonathan Corbet	 <corbet@lwn.net>
Date: Tue, 14 Jul 2026 11:28:39 -0400
In-Reply-To: <20260712141346.639115923@kernel.org>
References: <20260712134433.549076055@kernel.org>
	 <20260712141346.639115923@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_082855_495673_5B5F2474 
X-CRM114-Status: GOOD (  13.16  )
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

T24gU3VuLCAyMDI2LTA3LTEyIGF0IDIzOjI1ICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gUmVyZWFkIHRoZSBzeXNjYWxsIG51bWJlciBmcm9tIHB0X3JlZ3MgYW5kIHN0b3AgcmV0dXJu
aW5nIHRoZSBldmVudHVhbGx5Cj4gbW9kaWZpZWQgc3lzY2FsbCBudW1iZXIuCj4gCj4gVGhhdCBt
b3ZlcyB0aGUgcmVyZWFkIHRvIHRoZSBlbmQgb2YgdGhlIHN5c2NhbGxfdHJhY2VfZW50ZXIoKSBh
bmQgcHJlcGFyZXMKPiBmb3IgbW92aW5nIGl0IHRvIHRoZSBjYWxsIHNpdGUuCj4gCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gwqBpbmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5owqAgfMKg
wqAgMTAgKysrKy0tLS0tLQo+IMKga2VybmVsL2VudHJ5L3N5c2NhbGwtY29tbW9uLmMgfMKgwqDC
oCA5ICsrLS0tLS0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQo+IAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmgKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5oCj4gQEAgLTU4LDcgKzU4LDcgQEAgc3RhdGlj
IF9fYWx3YXlzX2lubGluZSBib29sIGFyY2hfcHRyYWNlXwo+IMKgfQo+IMKgI2VuZGlmCj4gwqAK
PiAtbG9uZyB0cmFjZV9zeXNjYWxsX2VudGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBsb25nIHN5
c2NhbGwpOwo+ICt2b2lkIHRyYWNlX3N5c2NhbGxfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Owo+IMKgdm9pZCB0cmFjZV9zeXNjYWxsX2V4aXQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGxvbmcg
cmV0KTsKPiDCoHZvaWQgc3lzY2FsbF9lbnRlcl9hdWRpdChzdHJ1Y3QgcHRfcmVncyAqcmVncyk7
Cj4gwqAKPiBAQCAtOTYsMTYgKzk2LDE0IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgbG9uZyBz
eXNjYWxsX3RyYWMKPiDCoAkJCXJldHVybiAtMUw7Cj4gwqAJfQo+IMKgCj4gLQkvKiBFaXRoZXIg
b2YgdGhlIGFib3ZlIG1pZ2h0IGhhdmUgY2hhbmdlZCB0aGUgc3lzY2FsbCBudW1iZXIgKi8KPiAt
CXN5c2NhbGwgPSBzeXNjYWxsX2dldF9ucihjdXJyZW50LCByZWdzKTsKPiAtCj4gwqAJaWYgKHVu
bGlrZWx5KHdvcmsgJiBTWVNDQUxMX1dPUktfU1lTQ0FMTF9UUkFDRVBPSU5UKSkKPiAtCQlzeXNj
YWxsID0gdHJhY2Vfc3lzY2FsbF9lbnRlcihyZWdzLCBzeXNjYWxsKTsKPiArCQl0cmFjZV9zeXNj
YWxsX2VudGVyKHJlZ3MpOwo+IMKgCj4gwqAJaWYgKHVubGlrZWx5KGF1ZGl0X2NvbnRleHQoKSkp
Cj4gwqAJCXN5c2NhbGxfZW50ZXJfYXVkaXQocmVncyk7Cj4gwqAKPiAtCXJldHVybiBzeXNjYWxs
Owo+ICsJLyogRWl0aGVyIG9mIHRoZSBhYm92ZSBtaWdodCBoYXZlIGNoYW5nZWQgdGhlIHN5c2Nh
bGwgbnVtYmVyICovCgpuaXQ6ICJFaXRoZXIiIGltcGxpZXMgdHdvIGl0ZW1zLiBJIHdvdWxkIHJl
cGhyYXNlIGl0IHRvICJBbnkiIHRvIG1ha2UKdGhpbmdzIGNsZWFyZXIuCgo+ICsJcmV0dXJuIHN5
c2NhbGxfZ2V0X25yKGN1cnJlbnQsIHJlZ3MpOwo+IMKgfQo+IMKgCj4gwqAvKioKPiAtLS0gYS9r
ZXJuZWwvZW50cnkvc3lzY2FsbC1jb21tb24uYwo+ICsrKyBiL2tlcm5lbC9lbnRyeS9zeXNjYWxs
LWNvbW1vbi5jCj4gQEAgLTgsMTQgKzgsOSBAQAo+IMKgCj4gwqAvKiBPdXQgb2YgbGluZSB0byBw
cmV2ZW50IHRyYWNlcG9pbnQgY29kZSBkdXBsaWNhdGlvbiAqLwo+IMKgCj4gLWxvbmcgdHJhY2Vf
c3lzY2FsbF9lbnRlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgbG9uZyBzeXNjYWxsKQo+ICt2b2lk
IHRyYWNlX3N5c2NhbGxfZW50ZXIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gwqB7Cj4gLQl0cmFj
ZV9zeXNfZW50ZXIocmVncywgc3lzY2FsbCk7Cj4gLQkvKgo+IC0JICogUHJvYmVzIG9yIEJQRiBo
b29rcyBpbiB0aGUgdHJhY2Vwb2ludCBtYXkgaGF2ZSBjaGFuZ2VkIHRoZQo+IC0JICogc3lzdGVt
IGNhbGwgbnVtYmVyLiBSZXJlYWQgaXQuCj4gLQkgKi8KPiAtCXJldHVybiBzeXNjYWxsX2dldF9u
cihjdXJyZW50LCByZWdzKTsKPiArCXRyYWNlX3N5c19lbnRlcihyZWdzLCBzeXNjYWxsX2dldF9u
cihjdXJyZW50LCByZWdzKSk7Cj4gwqB9Cj4gwqAKPiDCoHZvaWQgdHJhY2Vfc3lzY2FsbF9leGl0
KHN0cnVjdCBwdF9yZWdzICpyZWdzLCBsb25nIHJldCkKCldpdGggdGhlIGFib3ZlLAoKUmV2aWV3
ZWQtYnk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
