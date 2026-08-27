Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE846C61DC4
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 17:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKofah7Vf8SVv7PlbfLWGnJwXQV4XUki7xFcIEm97Uw=; b=qpY4dJzBWxvzfE
	c23Ks9PTolwNjL+RxKaBVurwX+LK4yjVS5v2G54/K29WaDGpCtwtYu8dxMD3bkj/rPjrEdA9152lY
	ZAECeVG9FgLZ/iqusyrmdFUhTyWguXeY7EFISfOSe5Jq4iCsdArlSd/i6fB6pl2ANMaGapdnW1XTg
	UiRRTSwhKSjS1L02qkzD6/CeVQFdah/4a89Qw8oCDeojtVtQUMyWn4sbK3j4FoV4eVOBbqSEg9kPD
	T0vc6S/zPN9uODxWQFk0NUID/QuuC3tszJxyIL4rRJPUg8vJ1Bz3OyjgjrjhfOkHe7Y7rQQH00KtQ
	zN9blW+7bXH/r/xWZM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHJ-00000004Vmc-100y;
	Thu, 27 Aug 2026 17:52:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHC-00000004Vgj-32wN;
	Thu, 27 Aug 2026 17:52:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C51F2165C;
	Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB0F3F7D8;
	Thu, 27 Aug 2026 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1787853149; bh=3Lo+ZdElb1bhCszSyr1ciTzcKatyHt00pcCO0obh9Hk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=LLVXzCCVqihttZUVw5hf327N6NQF/8OTgVqmkRTWAKwtW7JaJNRd34Dmfeb89URQY
	 SFvbiIJ41kOlYkwg6d2BlBms8vwwU1klpZ1EkH3E618IMsvMTHTUDoTHcVPSrjx5Ns
	 UPBGKX1xHk57nyAWP2hBKL9tmsqr2otVNnrPAcSU=
Message-ID: <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
Date: Thu, 27 Aug 2026 12:52:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
From: Bill Roberts <bill.roberts@foss.arm.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org
Cc: dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com,
 debug@rivosinc.com, broonie@kernel.org
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
Content-Language: en-US
In-Reply-To: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105238_517845_16C01375 
X-CRM114-Status: GOOD (  13.42  )
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

T24gOC8yNy8yNiAxMjoxNSBQTSwgQmlsbCBSb2JlcnRzIHdyb3RlOgoKU29ycnkgcmVzZW5kLCB3
cm9uZyBvdXRnb2luZyBtYWlsIHNlcnZlciBpbiBteSBjbGllbnQgc28gaXQgZ290IG1hbmdsZWQs
IAp0aGlzIG9uZSBzaG91bGQgYmUgcHJvcGVyLi4uCgpIb3dkeSBmb2xrcywKCklmIHlvdSBoYXZl
bid0IHNlZW4sIEkgaGF2ZSBiZWVuIGZsb2F0aW5nIHNvbWUgcGF0Y2hlcyB0byBicmluZyB4ODYt
NjQgCnNoYWRvdyBzdGFjayBjb250cm9scyBvdmVyIHRvIHByY3RsLCBhbmQgaXQncyBnZW5lcmFs
bHkgc3RyYWlnaHQgZm9yd2FyZC4KVGhlIGxhcmdlciBtb3RpdmF0aW9uLCBpcyB0aGF0IEkgYW0g
ZG9pbmcgYWxsIG9mIHRoaXMgc28gd2UgY2FuIHBsYWNlIApMU00gY29udHJvbHMgb24gc2hhZG93
IHN0YWNrIG1hbmlwdWxhdGlvbnMuIEZvciB4ODYgd2lsbCB3ZSBuZWVkIHRvIGhvb2sKdGhlIG9s
ZCBhbmQgbmV3IGltcGxlbWVudGF0aW9ucy4KCkkgaGF2ZSBub3RpY2VkIHNvbWUgc2VtYW50aWMg
ZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgYXJjaGVzLiBHaXZlbiB0aGlzIApleGFtcGxlIG9mIGN1
cnJlbnQgdGhyZWFkIHN0YXRlLCBjdXJyZW50IHRocmVhZCBsb2NraW5nIHN0YXRlIGFuZCB0aGUK
bmV3IGZlYXR1cmVzIHJlcXVlc3RlZCwgYXMgc2hvd24gYmVsb3c6Cgp1bnNpZ25lZCBsb25nIGxv
Y2tlZCA9IDB4MjsgLy8gS2VybmVsIFRhc2sgU3RhdGUgLT4gTE9DSyBXUklURQp1bnNpZ25lZCBs
b25nIGN1cl92YWwgPSAweDM7IC8vIEtlcm5lbCBUYXNrIFN0YXRlIC0+IFdSSVRFIGFuZCAKU0hB
RE9XU1RBQ0sgRU5BQkxFRAp1bnNpZ25lZCBsb25nIG5ld192YWwgPSAweDA7IC8vIFVzZXJzcGFj
ZSBGZWF0dXJlIENoYW5nZSB2aWEgc3lzY2FsbCAtPiAKRElTQUJMRQoKfCB4ODYtNjQgfCByaXNj
LXYgfCBhcm02NCB8CnwgLS0tLS0tLS0tLSB8IC0tLS0tLS0tIHwgLS0tLS0tLS0tIHwKfCBXb3Jr
c8KgIHwgRmFpbHPCoCB8IEZhaWxzwqAgwqAgwqB8CgpCZXNpZGVzIHRoZSBsb2NraW5nIGRpZmZl
cmVuY2UsIEkgaGF2ZSBhbHNvIG5vdGljZWQgYSBmZXcgb3RoZXIgaXNzdWVzIApub3RlZCBiZWxv
dzoKClJpc2MtdjoKLSBzaG91bGRuJ3QgcmVqZWN0IGFsbCBiaXRzIGluIGxvY2tpbmcsIGl0IHN1
cHBvcnRzIHNoYWRvdyBzdGFjay4KLSBzaG91bGRuJ3QgcmV0dXJuIEVJTlZBTCBvbiBsb2NraW5n
IGNoZWNrcwoKU2VlIHRoZSBjb2RlIHNuaXBwZXRzIGZvciB0aGVzZSBiZWxvdzoKCmlmIChpc19z
aHN0a19sb2NrZWQodCkpCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLUVJTlZBTDsK
CmludCBhcmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRh
c2ssCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1
bnNpZ25lZCBsb25nIGFyZykKewogwqAgwqAgwqAgwqAgLyogSWYgc2h0c3RrIG5vdCBzdXBwb3J0
ZWQgb3Igbm90IGVuYWJsZWQgb24gdGFzaywgbm90aGluZyB0byAKbG9jayBoZXJlICovCiDCoCDC
oCDCoCDCoCBpZiAoIWlzX3VzZXJfc2hzdGtfZW5hYmxlZCgpIHx8CiDCoCDCoCDCoCDCoCDCoCDC
oCAhaXNfc2hzdGtfZW5hYmxlZCh0YXNrKSB8fCBhcmcgIT0gMCkKIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHJldHVybiAtRUlOVkFMOwoKIMKgIMKgIMKgIMKgIHNldF9zaHN0a19sb2NrKHRhc2ss
IHRydWUpOwoKIMKgIMKgIMKgIMKgIHJldHVybiAwOwp9Cgphcm02NDoKMS4gTG9ja2luZyBmYWls
dXJlcyByZXR1cm4gLUVCVVNZIHZzIC1FUEVSTSwgSSBzcG9rZSB3aXRoIE1hcmsgKG9uIENDKSAK
aGUgc2VlbWVkIE9LIHdpdGggdGhpcywKCkkgd291bGQgbGlrZSB0byBmaW5kIGEgd2F5IHRvIHJl
Y3RpZnkgdGhpcyBzbyB1c2Vyc3BhY2UgaGFzIGEgY29tbW9uIEFQSS4KCkkgYW0gcHJvcG9zaW5n
IGFuZCBoYXZlIHF1ZXN0aW9ucyBvdmVyIHRoZSBmb2xsb3dpbmc6CjEuIFdoYXQgc2hvdWxkIHRo
ZSBiZWhhdmlvciBiZSBpZiB5b3UgaGFkIHdyaXRlIGxvY2tlZCBhbmQgZGlzYWJsZSB0aGUgCnNo
YWRvdyBzdGFjaz8KIMKgIC0gSSBjYW4gYXJndWUgYm90aCB3YXlzIGhlcmUsIC1FUEVSTSBvciBz
dWNjZXNzLiBJIHRoaW5rIEkgYW5kIG1vc3QgCmFyY2hlcyBsZWFkIHRvIGZhaWx1cmUuCjIuIHJp
c2N2IHNob3VsZCBjaGVjayB0aGF0IHRoZSBsb3cgYml0IGlzIHNldCBpbiBsb2NraW5nIG5vdCBq
dXN0IHRoYXQgCml0cyAwLCBpdCBzaG91bGQgYmUgMQozLiByaXNjdiBzaG91bGQgcmV0dXJuIC1F
UEVSTSB2cyAtRUlOVkFMCjQuIHg4NiBsb2NraW5nIHN0YXRlIHNob3VsZCBmYWlsCgpJZiB3ZSBj
YW4gYWxsIGFncmVlIG9uIGl0ZW0gMSwgdGhhdCBsb2NrZWQgYml0cyBjaGVjayBjYW4gYmUgcmVm
YWN0b3JlZCAKYW5kIHNoYXJlZCBpbiBvbmUgb2YKdHdvIHdheXM6CjEuIHdpdGhpbiBwcmN0bCBp
dHNlbGYsIGJlZm9yZSB0aGUgYXJjaCBob29rIGlzIGNhbGxlZCwgd2Ugd291bGQgbmVlZCAKaGVs
cGVycyBwZXItYXJjaCB0byBleHRyYWN0IHRoZSB0aHJlYWQgZmVhdHVyZXMgYW5kIGxvY2sgYml0
cwoyLiBhcyBhIGhlbHBlciB3aGVyZSBmb2xrcyBqdXN0IHBhc3MgdGhlIHVuc2lnbmVkIGxvbmcg
b2YgdGhlIGJpdHMgdG8gCmdldCB0aGUgcmVzdWx0CgpUaGFua3MgZXZlcnlvbmUKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
