Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF9C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VdpAaSHoAb8uDQgVjFRrhmkqBU0vdi4CcSeJ0sCj7M=; b=DveMl30OrCj6Z+
	HJRzPyfr4Epnbyfp8Mg/SHdm1revQi3ixDyOCNS/cVPUPj6htw5Eop+3qQVv9bvwO8uYQ1OdkV+5P
	pYu2MJUyyeBPQtSPmFBUahHhhJyzSp91EbpZG6tSzSGzpdpQG7pGzFFx+4RVcLJXSJ7VJqrODGIFk
	88EdjRW0U8y3/V03CGNO0e9uT9bCWV1bJRIsOMiIKNf4LC6IJmUHPB41VSsrhoadjIUW0J7Wo5aI6
	X2/7pqiwqMVcje+UWGULqUtLEr/0Q9oyv2yTcqPBkgERj6ypG0/QRFVFjrr1O9KiLSGC6/R3AF83Y
	+uLVOaJY2yMnGsObm1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F10-007M6B-1C;
	Wed, 29 Nov 2023 07:29:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8F0v-007M4k-2w
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 07:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D8C58B8244D;
	Wed, 29 Nov 2023 07:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D9C433C8;
	Wed, 29 Nov 2023 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701242974;
	bh=JeS974xooxXbY2aUbrV+BCTn2Y8BWdv08zOfWtRHTxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZM2ntIIB8LEbvWSNluhL7GsoM2lrtXQUYuc26m2cI2DaeWvTnNA9Z15PurRR0jith
	 kSB9COSrxtY4UDD9NvFrtlZK7Rqf0cMLqLE52iGMdOIxUXyzKgudmJYTqhUf/ugNIy
	 H+btzFiS+yFb7WQakZrT3k5sl+y1af7DkVYtBcaCGTZncF01MAHhIwcJH7B7SLx9ZZ
	 ruvL+5pcbdTZQHnTCTaACsjVwyT0YPEJDDqPOol8EkuzxweuSTAsg2IEOns44rlUBR
	 tekCD+Q85psU29Y4nNSdX/19aVqB1Dq/xYRbTzrXxOULv0bfqgE9OwKWeXwuj9Ruef
	 1dH5DIekawzaw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Ron Economos <re@w6rz.net>, Samuel Holland
 <samuel.holland@sifive.com>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Charlie
 Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 1/2] riscv: Safely remove entries from relocation list
In-Reply-To: <20231127-module_linking_freeing-v4-1-a2ca1d7027d0@rivosinc.com>
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
 <20231127-module_linking_freeing-v4-1-a2ca1d7027d0@rivosinc.com>
Date: Wed, 29 Nov 2023 08:29:31 +0100
Message-ID: <877cm19fvo.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_232942_730553_202D76C6 
X-CRM114-Status: GOOD (  14.11  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPiBVc2UgdGhl
IHNhZmUgdmVyc2lvbnMgb2YgbGlzdCBhbmQgaGxpc3QgaXRlcmF0aW9uIHRvIHNhZmVseSByZW1v
dmUKPiBlbnRyaWVzIGZyb20gdGhlIG1vZHVsZSByZWxvY2F0aW9uIGxpc3RzLiBUbyBhbGxvdyBt
dXRsaXBsZSB0aHJlYWRzIHRvCj4gbG9hZCBtb2R1bGVzIGNvbmN1cnJlbnRseSwgbW92ZSByZWxv
Y2F0aW9uIGxpc3QgcG9pbnRlcnMgb250byB0aGUgc3RhY2sKPiByYXRoZXIgdGhhbiB1c2luZyBn
bG9iYWwgdmFyaWFibGVzLgo+Cj4gRml4ZXM6IDhmZDZjNTE0MjM5NSAoInJpc2N2OiBBZGQgcmVt
YWluaW5nIG1vZHVsZSByZWxvY2F0aW9ucyIpCj4gUmVwb3J0ZWQtYnk6IFJvbiBFY29ub21vcyA8
cmVAdzZyei5uZXQ+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di80NDRkZTg2YS03ZTdjLTRkZTctNWQxZC1jMWM0MGVlZmE0YmFAdzZyei5uZXQKPiBTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyB8IDExMCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyks
IDI4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVs
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKPiBpbmRleCA1NmE4Yzc4ZTllMjEuLjUz
NTkzZmU1OGNkOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gQEAgLTQwLDE1ICs0MCw2IEBAIHN0cnVj
dCByZWxvY2F0aW9uX2hhbmRsZXJzIHsKPiAgCQkJCSAgbG9uZyBidWZmZXIpOwo+ICB9Owo+ICAK
PiAtdW5zaWduZWQgaW50IGluaXRpYWxpemVfcmVsb2NhdGlvbl9oYXNodGFibGUodW5zaWduZWQg
aW50IG51bV9yZWxvY2F0aW9ucyk7Cj4gLXZvaWQgcHJvY2Vzc19hY2N1bXVsYXRlZF9yZWxvY2F0
aW9ucyhzdHJ1Y3QgbW9kdWxlICptZSk7Cj4gLWludCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVs
YXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwgdm9pZCAqbG9jYXRpb24sCj4gLQkJCQkg
dW5zaWduZWQgaW50IGhhc2h0YWJsZV9iaXRzLCBFbGZfQWRkciB2KTsKPiAtCj4gLXN0cnVjdCBo
bGlzdF9oZWFkICpyZWxvY2F0aW9uX2hhc2h0YWJsZTsKPiAtCj4gLXN0cnVjdCBsaXN0X2hlYWQg
dXNlZF9idWNrZXRzX2xpc3Q7Cj4gLQo+ICAvKgo+ICAgKiBUaGUgYXVpcGMramFsciBpbnN0cnVj
dGlvbiBwYWlyIGNhbiByZWFjaCBhbnkgUEMtcmVsYXRpdmUgb2Zmc2V0Cj4gICAqIGluIHRoZSBy
YW5nZSBbLTJeMzEgLSAyXjExLCAyXjMxIC0gMl4xMSkKPiBAQCAtNjA0LDcgKzU5NSwxMCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHJlbG9jYXRpb25faGFuZGxlcnMgcmVsb2NfaGFuZGxlcnNbXSA9
IHsKPiAgCS8qIDE5Mi0yNTUgbm9uc3RhbmRhcmQgQUJJIGV4dGVuc2lvbnMgICovCj4gIH07Cj4g
IAo+IC12b2lkIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoc3RydWN0IG1vZHVsZSAq
bWUpCj4gK3N0YXRpYyB2b2lkCj4gK3Byb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoc3Ry
dWN0IG1vZHVsZSAqbWUsCgpOaXQvYnJlYWtzIG15IHdvcmtmbG93IDstKTogRG9uJ3QgYm90aGVy
IGlmIHlvdSdyZSBub3QgcmVzcGlubmluZyBmb3IKb3RoZXIgcmVhc29ucy4gVGhlIGxpbmVicmVh
ayBhZnRlciByZXR1cm4gdHlwZSBtYWtlcyBpdCBoYXJkZXIgdG8gZ3JlcAp0aGUgY29kZSAoYW5k
IGFsc28gaXMgbm90IGluIGxpbmUgd2l0aCB0aGUgbGF5b3V0IHdpdGggcmVzdCBvZiB0aGlzKS4K
CgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
