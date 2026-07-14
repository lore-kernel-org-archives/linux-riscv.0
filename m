Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D49AC44508
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/+hc0VjGfwjqjvAUnUV4jegYIgrTpqU/TnVLgB4zxc=; b=qHzEp8zJanTLKn
	UMVWwqFY/p4iuUdg0a0v34e9LJpNJ8mD2B4Bb1spsVZ1FY938ve1wU+0N6JKyJhTEs+VCJMx578Q9
	RBscYgN10F0kSjn4wnLNkRvEmseE1J79FCqDC/As4L28ihMoQ3IUaXN/OCreNnzVOs14VJAJdnOxV
	0KVSyLQ7sDM1JQfH1f8whPhzCO2E7ybNmmODifq7K+skfUbfNzKVxOVBaxZyvU3vJG77yytn5Vbox
	72NDSsEV10q63ThSstRla8iqcd8P/GZhXoc5qePdLzFQjGLNzYKRymtKLLhl8X8KhIVi4FOrFIv8Q
	DE33zoRvwVr/pidI/oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfGU-0000000CZ9L-47Dh;
	Tue, 14 Jul 2026 15:41:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfGS-0000000CZ8A-37qv
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jul 2026 15:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hKhKnBtVoVUk/sXTgCEmjbmfk+iGn8mR/E/A1x3cNyk=; b=C5hsWbVXEU7JJ0WEd6WubQLbEP
	GHgLhSfE3y2U0q/4zCrYNHguldpvNZt/xwvraxqsZZMWLWY8QMtMzFhORN4Uu6/uMSr07gu7HlaAi
	jcIuSunExA9WZuJG+M5k/gQGsrkx4n+B26fe7TBVibWJ/cGpHemc1d7HUslLTizWanxKAgSrp/af5
	SUuE2VzkeiMu0Hokdwa032T724dCLGOq9CW55Z7vwYPKIeldSA/bMGFLWVJMZ66yJby56RVQ7UXpW
	+TPBV+EG3fvtWeTL1EOvAeTP8RXZcs+/SqcePyQY9chCUqRERoBQEj/2mei/JlCCjXp4K93a1MgL0
	IwRHltuA==;
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjfGP-0000000CeeF-3NEv
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 15:41:43 +0000
Received: from bat.kanata.rendec.net (unknown [24.114.105.230])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 5F076C2C75;
	Tue, 14 Jul 2026 18:41:28 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 5F076C2C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784043698;
	bh=hKhKnBtVoVUk/sXTgCEmjbmfk+iGn8mR/E/A1x3cNyk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=rAqaJqFFLrO6y6tNVaFvU6vIVcy3LmKR3vuzw4P0LZXbAJVJVm0ALDzL8TymM6hBv
	 CET/mK/kqUWiSZemfVMilwSqWFX7NQXXVpNQ/Te8bp3aMO1QuzmgMSY/iDK1H3oLI+
	 b54jOKhx6ngl0C+7U/vHITetf6JHV6RPlMzsTCj07sqnDOQYY9HRrwARS76jc64IHh
	 JgxemAMZU4ZbJH9EgYX9u416U/McWH+76dZ34vUPOoUw4O7hFqTWBFLZhpRbtKSpsT
	 lqzJ3VpJ/iGQMdziAOF0ZQPwuFo3eBNqkoCEX46BG6CZbIkZNRCTXHdambhKsn3JM6
	 YjYhQXSomeepg==
Message-ID: <0b9b0da3dd27df230038bc87efa8ed43bb02e740.camel@rendec.net>
Subject: Re: [patch 3/4] entry: Make return type of syscall_trace_enter()
 bool
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
Date: Tue, 14 Jul 2026 11:41:24 -0400
In-Reply-To: <20260712141346.699072205@kernel.org>
References: <20260712134433.549076055@kernel.org>
	 <20260712141346.699072205@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_164141_998492_3CE55659 
X-CRM114-Status: GOOD (  14.49  )
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
Cj4gRnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gCj4gVGhpcyBwcmVw
YXJlcyBmb3IgY2hhbmdpbmcgdGhlIHJldHVybiB0eXBlcyBvZgo+IHN5c2NhbGxfZW50ZXJfZnJv
bV91c2VyX21vZGVbX3dvcmtdKCkgdG8gYm9vbCwgd2hpY2ggaW4gdHVybiBzZXBhcmF0ZXMgdGhl
Cj4gZGVjaXNpb24gb2YgaW52b2tpbmcgdGhlIHN5c2NhbGwgZnJvbSB0aGUgc3lzY2FsbCBudW1i
ZXIsIHdoaWNoIG1pZ2h0IGhhdmUKPiBiZWVuIGNoYW5nZWQgaW4gdGhlIGNhbGwgYnkgcHRyYWNl
LCBzZWNjb21wLCB0cmFjaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8
dGdseEBrZXJuZWwub3JnPgo+IC0tLQo+IMKgaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaCB8
wqDCoCAxOCArKysrKysrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+IC0tLSBhL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9u
LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2VudHJ5LWNvbW1vbi5oCj4gQEAgLTcyLDcgKzcyLDcg
QEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBsb25nIHN5c2NhbGxfdHJhYwo+IMKgCSAqLwo+IMKg
CWlmICh3b3JrICYgU1lTQ0FMTF9XT1JLX1NZU0NBTExfVVNFUl9ESVNQQVRDSCkgewo+IMKgCQlp
ZiAoc3lzY2FsbF91c2VyX2Rpc3BhdGNoKHJlZ3MpKQo+IC0JCQlyZXR1cm4gLTFMOwo+ICsJCQly
ZXR1cm4gZmFsc2U7Cj4gwqAJfQo+IMKgCj4gwqAJLyoKPiBAQCAtODcsMTMgKzg3LDEzIEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgbG9uZyBzeXNjYWxsX3RyYWMKPiDCoAlpZiAod29yayAmIChT
WVNDQUxMX1dPUktfU1lTQ0FMTF9UUkFDRSB8IFNZU0NBTExfV09SS19TWVNDQUxMX0VNVSkpIHsK
PiDCoAkJaWYgKCFhcmNoX3B0cmFjZV9yZXBvcnRfc3lzY2FsbF9wZXJtaXRfZW50cnkocmVncykg
fHwKPiDCoAkJwqDCoMKgICh3b3JrICYgU1lTQ0FMTF9XT1JLX1NZU0NBTExfRU1VKSkKPiAtCQkJ
cmV0dXJuIC0xTDsKPiArCQkJcmV0dXJuIGZhbHNlOwo+IMKgCX0KPiDCoAo+IMKgCS8qIERvIHNl
Y2NvbXAgYWZ0ZXIgcHRyYWNlLCB0byBjYXRjaCBhbnkgdHJhY2VyIGNoYW5nZXMuICovCj4gwqAJ
aWYgKHdvcmsgJiBTWVNDQUxMX1dPUktfU0VDQ09NUCkgewo+IMKgCQlpZiAoIV9fc2VjY29tcF9w
ZXJtaXRfc3lzY2FsbCgpKQo+IC0JCQlyZXR1cm4gLTFMOwo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4g
wqAJfQo+IMKgCj4gwqAJaWYgKHVubGlrZWx5KHdvcmsgJiBTWVNDQUxMX1dPUktfU1lTQ0FMTF9U
UkFDRVBPSU5UKSkKPiBAQCAtMTAyLDggKzEwMiw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
bG9uZyBzeXNjYWxsX3RyYWMKPiDCoAlpZiAodW5saWtlbHkoYXVkaXRfY29udGV4dCgpKSkKPiDC
oAkJc3lzY2FsbF9lbnRlcl9hdWRpdChyZWdzKTsKPiDCoAo+IC0JLyogRWl0aGVyIG9mIHRoZSBh
Ym92ZSBtaWdodCBoYXZlIGNoYW5nZWQgdGhlIHN5c2NhbGwgbnVtYmVyICovCj4gLQlyZXR1cm4g
c3lzY2FsbF9nZXRfbnIoY3VycmVudCwgcmVncyk7Cj4gKwlyZXR1cm4gdHJ1ZTsKPiDCoH0KPiDC
oAo+IMKgLyoqCj4gQEAgLTEzMyw4ICsxMzIsMTMgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBs
b25nIHN5c2NhbGxfZW50ZQo+IMKgewo+IMKgCXVuc2lnbmVkIGxvbmcgd29yayA9IFJFQURfT05D
RShjdXJyZW50X3RocmVhZF9pbmZvKCktPnN5c2NhbGxfd29yayk7Cj4gwqAKPiAtCWlmICh3b3Jr
ICYgU1lTQ0FMTF9XT1JLX0VOVEVSKQo+IC0JCXN5c2NhbGwgPSBzeXNjYWxsX3RyYWNlX2VudGVy
KHJlZ3MsIHdvcmssIHN5c2NhbGwpOwo+ICsJaWYgKHdvcmsgJiBTWVNDQUxMX1dPUktfRU5URVIp
IHsKPiArCQlpZiAoIXN5c2NhbGxfdHJhY2VfZW50ZXIocmVncywgd29yaywgc3lzY2FsbCkpCj4g
KwkJCXJldHVybiAtMUw7Cj4gKwo+ICsJCS8qIFJlcmVhZCB0aGUgc3lzY2FsbCBudW1iZXIgYXMg
aXQgbWlnaHQgaGF2ZSBiZWVuIG1vZGlmaWVkICovCgpuaXQ6IEkgd291bGQgYWRkICJpbiB0aGUg
Y2FsbCBhYm92ZSBieSBwdHJhY2UsIHNlY2NvbXAsIHRyYWNpbmciIC0gd2hpY2gKaXMgYWN0dWFs
bHkgaW4geW91ciBjb21taXQgbWVzc2FnZSwgYnV0IHdvdWxkIG1ha2UgaXQgaW1tZWRpYXRlbHkg
b2J2aW91cwp3aGVuIHJlYWRpbmcgdGhlIGNvZGUuCgo+ICsJCXN5c2NhbGwgPSBzeXNjYWxsX2dl
dF9ucihjdXJyZW50LCByZWdzKTsKPiArCX0KPiDCoAo+IMKgCXJldHVybiBzeXNjYWxsOwo+IMKg
fQoKUmV2aWV3ZWQtYnk6IFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRlYy5uZXQ+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
