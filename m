Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36614C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:49:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF4761073
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 05:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF4761073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wYtr32c4F4dZeEFL7KUJqQR9hHXUE4ExcuYeudt2uG0=; b=NVYKYf0HsjB2nJWN7AcAWNlJM
	dswQR2SQ6ZDIbByMyZAtl0BZ/dnEUXwB7dvoPBIjZkCqtjgMbxCesGhNG72agGAdtt/t0sZh3ZtGg
	pGjSeqEfqcrqctiZH8dpQq9QH8qRez75Ab4tSbkeFetb27LGBXqMCxCMFrh+XqQBUbu108Er2h1/T
	QHik4J6zxRvoV6I/Zi+aJgvTj8XgGn4lNg/KSnFa53gL9+UCTujINcXBPKaOwfyS68FMC7MZwMRcs
	xpvsIzSKx6/8/qHckJRWdZDrj0qB+gaxbr+09UgYON56PkBaAgSejuSP1awYNzJ4EVELysW1MzzJ7
	EQsTZmlsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXHLv-000uwb-Ui; Fri, 16 Apr 2021 05:49:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHLU-000utH-KP; Fri, 16 Apr 2021 05:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+/wTIfsZe5yssy9qAlO5t+b2F4tL0Cuy7W9IuGWGRos=; b=DR7qP63eLvUwUic5bj6l5cNRtK
 YsJwXBPqaEYg1Bc6jxM7jH8dENufMRjL7xoeZHoSmHGGemmM4HfLHLpAbe3IP/cChENRvco54hFtc
 AirG1rjrrWMjbn6Tro9Ya4cyuk4ULuTuiDCBQWlnFtHzcnMTqXCedytjV+hwLaUxkDqwy4MCb93R7
 EhLqJ/cs0oI1UEReoI9oHl0PUBJ3AHUNIC8Fbbf6AqIodyGS9P8GLDJO6kY5Xx0Mz2CGlg3RoUJo+
 hjbw5Vj38WJcVTiQatEcZ85f/sEnttsUdofJ/pTgqzKpi8Ko/pZ6AJGjrsCoVBSqx5c+Asf3mIbIA
 sKfmzQZQ==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXHLR-00962P-9h; Fri, 16 Apr 2021 05:48:47 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM4yL18bxzB09bL;
 Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y8gfrr0M5iy9; Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM4yK6ptpzB09bK;
 Fri, 16 Apr 2021 07:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3C238B81C;
 Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GFphMEGbTxDw; Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFF598B81A;
 Fri, 16 Apr 2021 07:48:41 +0200 (CEST)
Subject: Re: [PATCH v1 1/5] mm: pagewalk: Fix walk for hugepage tables
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
 <877dl3184l.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <56d4c630-ac1e-6b75-39a5-7b5bfbd5b1aa@csgroup.eu>
Date: Fri, 16 Apr 2021 07:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <877dl3184l.fsf@dja-thinkpad.axtens.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_224845_675041_C920DCA2 
X-CRM114-Status: GOOD (  27.99  )
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

CgpMZSAxNi8wNC8yMDIxIMOgIDAwOjQzLCBEYW5pZWwgQXh0ZW5zIGEgw6ljcml0wqA6Cj4gSGkg
Q2hyaXN0b3BoZSwKPiAKPj4gUGFnZXdhbGsgaWdub3JlcyBodWdlcGQgZW50cmllcyBhbmQgd2Fs
ayBkb3duIHRoZSB0YWJsZXMKPj4gYXMgaWYgaXQgd2FzIHRyYWRpdGlvbm5hbCBlbnRyaWVzLCBs
ZWFkaW5nIHRvIGNyYXp5IHJlc3VsdC4KPj4KPj4gQWRkIHdhbGtfaHVnZXBkX3JhbmdlKCkgYW5k
IHVzZSBpdCB0byB3YWxrIGh1Z2VwYWdlIHRhYmxlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gICBt
bS9wYWdld2Fsay5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9wYWdld2Fsay5jIGIvbW0vcGFnZXdhbGsu
Ywo+PiBpbmRleCBlODE2NDBkOWYxNzcuLjQxMGE5ZDhmNzU3MiAxMDA2NDQKPj4gLS0tIGEvbW0v
cGFnZXdhbGsuYwo+PiArKysgYi9tbS9wYWdld2Fsay5jCj4+IEBAIC01OCw2ICs1OCwzMiBAQCBz
dGF0aWMgaW50IHdhbGtfcHRlX3JhbmdlKHBtZF90ICpwbWQsIHVuc2lnbmVkIGxvbmcgYWRkciwg
dW5zaWduZWQgbG9uZyBlbmQsCj4+ICAgCXJldHVybiBlcnI7Cj4+ICAgfQo+PiAgIAo+PiArc3Rh
dGljIGludCB3YWxrX2h1Z2VwZF9yYW5nZShodWdlcGRfdCAqcGhwZCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+PiArCQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IG1tX3dhbGsgKndhbGss
IGludCBwZHNoaWZ0KQo+PiArewo+PiArCWludCBlcnIgPSAwOwo+PiArI2lmZGVmIENPTkZJR19B
UkNIX0hBU19IVUdFUEQKPj4gKwljb25zdCBzdHJ1Y3QgbW1fd2Fsa19vcHMgKm9wcyA9IHdhbGst
Pm9wczsKPj4gKwlpbnQgc2hpZnQgPSBodWdlcGRfc2hpZnQoKnBocGQpOwo+PiArCWludCBwYWdl
X3NpemUgPSAxIDw8IHNoaWZ0Owo+PiArCj4+ICsJaWYgKGFkZHIgJiAocGFnZV9zaXplIC0gMSkp
Cj4+ICsJCXJldHVybiAwOwo+PiArCj4+ICsJZm9yICg7Oykgewo+PiArCQlwdGVfdCAqcHRlID0g
aHVnZXB0ZV9vZmZzZXQoKnBocGQsIGFkZHIsIHBkc2hpZnQpOwo+PiArCj4+ICsJCWVyciA9IG9w
cy0+cHRlX2VudHJ5KHB0ZSwgYWRkciwgYWRkciArIHBhZ2Vfc2l6ZSwgd2Fsayk7Cj4+ICsJCWlm
IChlcnIpCj4+ICsJCQlicmVhazsKPj4gKwkJaWYgKGFkZHIgPj0gZW5kIC0gcGFnZV9zaXplKQo+
PiArCQkJYnJlYWs7Cj4+ICsJCWFkZHIgKz0gcGFnZV9zaXplOwo+PiArCX0KPiAKPiBJbml0aWFs
bHkgSSB0aG91Z2h0IHRoaXMgd2FzIGEgc29tZXdoYXQgdW5pbnR1aXRpdmUgd2F5IHRvIHN0cnVj
dHVyZQo+IHRoaXMgbG9vcCwgYnV0IEkgc2VlIGl0IHBhcmFsbGVscyB0aGUgc3RydWN0dXJlIG9m
IHdhbGtfcHRlX3JhbmdlX2lubmVyLAo+IHNvIEkgdGhpbmsgdGhlIGNvbnNpc3RlbmN5IGlzIHdv
cnRoIGl0Lgo+IAo+IEkgbm90aWNlIHRoZSBwdGUgd2Fsa2luZyBjb2RlIHBvdGVudGlhbGx5IHRh
a2VzIHNvbWUgbG9ja3M6IGRvZXMgdGhpcwo+IGNvZGUgbmVlZCB0byBkbyB0aGF0Pwo+IAo+IGFy
Y2gvcG93ZXJwYy9tbS9odWdldGxicGFnZS5jIHNheXMgdGhhdCBodWdlcGRzIGFyZSBwcm90ZWN0
ZWQgYnkgdGhlCj4gbW0tPnBhZ2VfdGFibGVfbG9jaywgYnV0IEkgZG9uJ3QgdGhpbmsgd2UncmUg
dGFraW5nIGl0IGluIHRoaXMgY29kZS4KCkknbGwgYWRkIGl0LCB0aGFua3MuCgo+IAo+PiArI2Vu
ZGlmCj4+ICsJcmV0dXJuIGVycjsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgd2Fsa19wbWRf
cmFuZ2UocHVkX3QgKnB1ZCwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwK
Pj4gICAJCQkgIHN0cnVjdCBtbV93YWxrICp3YWxrKQo+PiAgIHsKPj4gQEAgLTEwOCw3ICsxMzQs
MTAgQEAgc3RhdGljIGludCB3YWxrX3BtZF9yYW5nZShwdWRfdCAqcHVkLCB1bnNpZ25lZCBsb25n
IGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAo+PiAgIAkJCQlnb3RvIGFnYWluOwo+PiAgIAkJfQo+
PiAgIAo+PiAtCQllcnIgPSB3YWxrX3B0ZV9yYW5nZShwbWQsIGFkZHIsIG5leHQsIHdhbGspOwo+
PiArCQlpZiAoaXNfaHVnZXBkKF9faHVnZXBkKHBtZF92YWwoKnBtZCkpKSkKPj4gKwkJCWVyciA9
IHdhbGtfaHVnZXBkX3JhbmdlKChodWdlcGRfdCAqKXBtZCwgYWRkciwgbmV4dCwgd2FsaywgUE1E
X1NISUZUKTsKPj4gKwkJZWxzZQo+PiArCQkJZXJyID0gd2Fsa19wdGVfcmFuZ2UocG1kLCBhZGRy
LCBuZXh0LCB3YWxrKTsKPj4gICAJCWlmIChlcnIpCj4+ICAgCQkJYnJlYWs7Cj4+ICAgCX0gd2hp
bGUgKHBtZCsrLCBhZGRyID0gbmV4dCwgYWRkciAhPSBlbmQpOwo+PiBAQCAtMTU3LDcgKzE4Niwx
MCBAQCBzdGF0aWMgaW50IHdhbGtfcHVkX3JhbmdlKHA0ZF90ICpwNGQsIHVuc2lnbmVkIGxvbmcg
YWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCj4+ICAgCQlpZiAocHVkX25vbmUoKnB1ZCkpCj4+ICAg
CQkJZ290byBhZ2FpbjsKPj4gICAKPj4gLQkJZXJyID0gd2Fsa19wbWRfcmFuZ2UocHVkLCBhZGRy
LCBuZXh0LCB3YWxrKTsKPj4gKwkJaWYgKGlzX2h1Z2VwZChfX2h1Z2VwZChwdWRfdmFsKCpwdWQp
KSkpCj4+ICsJCQllcnIgPSB3YWxrX2h1Z2VwZF9yYW5nZSgoaHVnZXBkX3QgKilwdWQsIGFkZHIs
IG5leHQsIHdhbGssIFBVRF9TSElGVCk7Cj4+ICsJCWVsc2UKPj4gKwkJCWVyciA9IHdhbGtfcG1k
X3JhbmdlKHB1ZCwgYWRkciwgbmV4dCwgd2Fsayk7Cj4gCj4gSSdtIGEgYml0IHdvcnJpZWQgeW91
IG1pZ2h0IGVuZCB1cCBjYWxsaW5nIGludG8gd2Fsa19odWdlcGRfcmFuZ2Ugd2l0aAo+IG9wcy0+
cHRlX2VudHJ5ID09IE5VTEwsIGFuZCB0aGVuIGp1bXBpbmcgdG8gMC4KCllvdSBhcmUgcmlnaHQs
IEkgbWlzc2VkIGl0LgpJJ2xsIGJhaWwgb3V0IG9mIHdhbGtfaHVnZXBkX3JhbmdlKCkgd2hlbiBv
cHMtPnB0ZV9lbnRyeSBpcyBOVUxMLgoKCj4gCj4gc3RhdGljIGludCB3YWxrX3B1ZF9yYW5nZShw
NGRfdCAqcDRkLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAo+IAkJCSAg
c3RydWN0IG1tX3dhbGsgKndhbGspCj4gewo+IC4uLgo+ICAgICAgICAgIHB1ZCA9IHB1ZF9vZmZz
ZXQocDRkLCBhZGRyKTsKPiAJZG8gewo+ICAgICAgICAgICAgICAgICAgLi4uCj4gICAgICAgICAg
ICAgICAgICBpZiAoKCF3YWxrLT52bWEgJiYgKHB1ZF9sZWFmKCpwdWQpIHx8ICFwdWRfcHJlc2Vu
dCgqcHVkKSkpIHx8Cj4gCQkgICAgd2Fsay0+YWN0aW9uID09IEFDVElPTl9DT05USU5VRSB8fAo+
IAkJICAgICEob3BzLT5wbWRfZW50cnkgfHwgb3BzLT5wdGVfZW50cnkpKSA8PDwgVEhJUyBDSEVD
Swo+IAkJCWNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICAgLi4uCj4gCQlpZiAoaXNfaHVnZXBk
KF9faHVnZXBkKHB1ZF92YWwoKnB1ZCkpKSkKPiAJCQllcnIgPSB3YWxrX2h1Z2VwZF9yYW5nZSgo
aHVnZXBkX3QgKilwdWQsIGFkZHIsIG5leHQsIHdhbGssIFBVRF9TSElGVCk7Cj4gCQllbHNlCj4g
CQkJZXJyID0gd2Fsa19wbWRfcmFuZ2UocHVkLCBhZGRyLCBuZXh0LCB3YWxrKTsKPiAJCWlmIChl
cnIpCj4gCQkJYnJlYWs7Cj4gCX0gd2hpbGUgKHB1ZCsrLCBhZGRyID0gbmV4dCwgYWRkciAhPSBl
bmQpOwo+IAo+IHdhbGtfcHVkX3JhbmdlIHdpbGwgcHJvY2VlZCBpZiB0aGVyZSBpcyBfZWl0aGVy
XyBhbiBvcHMtPnBtZF9lbnRyeSBfb3JfCj4gYW4gb3BzLT5wdGVfZW50cnksIGJ1dCB3YWxrX2h1
Z2VwZF9yYW5nZSB3aWxsIGNhbGwgb3BzLT5wdGVfZW50cnkKPiB1bmNvbmRpdGlvbmFsbHkuCj4g
Cj4gVGhlIHNhbWUgaXNzdWUgYXBwbGllcyB0byB3YWxrX3twNGQscGdkfV9yYW5nZS4uLgo+IAo+
IEtpbmQgcmVnYXJkcywKPiBEYW5pZWwKPiAKClRoYW5rcwpDaHJpc3RvcGhlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
