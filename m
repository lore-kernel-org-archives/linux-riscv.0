Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C12AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 06:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghOtDCnZ3lgH6ZPEs5uOLzB/3/wReoc7PCXSGj+tdDQ=; b=g491YLySXsuUPs
	s/+rkZPOxrF/O76yJtOVY4/8U4UnfSCNyRqNqrS9jz6fOVhlRGMioClYU7r0BFFXgMnFAoQhDuSbV
	k6dbY74LHY7XEP5zZ7vwaRJY0lf39oaGjTJOJnKDgMD0pI1NwHxnCsGEecenzot5jvMfrXXQG9cDF
	ovRvTxaYbitT2uEOYIB7LTeOr05snakhk79poqPsxLn5570y/Hiit16hdCQs4Ngm6B7ua/T+DnH0p
	tPSA7XSI/Y+hAP5JOFcOA1IXTPe3gkvsZdseMWvtSqwkV/AzxNAziCGUu0FXUs+HZxYTdggP/OHSt
	bbcxl5LjkUgqhz7zkrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtsY-0000000EDrB-0bwn;
	Wed, 03 Apr 2024 06:13:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtsU-0000000EDpu-0apg;
	Wed, 03 Apr 2024 06:13:44 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V8ZBg2jZLz1JB3c;
	Wed,  3 Apr 2024 14:11:23 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id A9A6B1402C7;
	Wed,  3 Apr 2024 14:13:31 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 14:13:30 +0800
Message-ID: <bcfe8e2e-7ca9-44a8-b6ea-f4d9d789cc10@huawei.com>
Date: Wed, 3 Apr 2024 14:13:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when
 VM_FAULT_BADACCESS
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
CC: <akpm@linux-foundation.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
 Schaefer <gerald.schaefer@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-3-wangkefeng.wang@huawei.com>
 <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
 <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_231342_663890_478C2B45 
X-CRM114-Status: GOOD (  16.45  )
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

CgpPbiAyMDI0LzQvMyAxMzozMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+IE9uIFR1ZSwg
QXByIDIsIDIwMjQgYXQgMTA6MTnigK9QTSBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29n
bGUuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtl
ZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gVGhl
IHZtX2ZsYWdzIG9mIHZtYSBhbHJlYWR5IGNoZWNrZWQgdW5kZXIgcGVyLVZNQSBsb2NrLCBpZiBp
dCBpcyBhCj4+PiBiYWQgYWNjZXNzLCBkaXJlY3RseSBzZXQgZmF1bHQgdG8gVk1fRkFVTFRfQkFE
QUNDRVNTIGFuZCBoYW5kbGUgZXJyb3IsCj4+PiBubyBuZWVkIHRvIGxvY2tfbW1fYW5kX2ZpbmRf
dm1hKCkgYW5kIGNoZWNrIHZtX2ZsYWdzIGFnYWluLCB0aGUgbGF0ZW5jeQo+Pj4gdGltZSByZWR1
Y2UgMzQlIGluIGxtYmVuY2ggJ2xhdF9zaWcgLVAgMSBwcm90IGxhdF9zaWcnLgo+Pgo+PiBUaGUg
Y2hhbmdlIG1ha2VzIHNlbnNlIHRvIG1lLiBQZXItVk1BIGxvY2sgaXMgZW5vdWdoIHRvIGtlZXAK
Pj4gdm1hLT52bV9mbGFncyBzdGFibGUsIHNvIG5vIG5lZWQgdG8gcmV0cnkgd2l0aCBtbWFwX2xv
Y2suCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2Fu
Z0BodWF3ZWkuY29tPgo+Pgo+PiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJl
bmJAZ29vZ2xlLmNvbT4KPj4KPj4+IC0tLQo+Pj4gICBhcmNoL2FybTY0L21tL2ZhdWx0LmMgfCA0
ICsrKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2ZhdWx0LmMgYi9hcmNoL2FybTY0
L21tL2ZhdWx0LmMKPj4+IGluZGV4IDliYjlmMzk1MzUxYS4uNDA1ZjlhYTgzMWJkIDEwMDY0NAo+
Pj4gLS0tIGEvYXJjaC9hcm02NC9tbS9mYXVsdC5jCj4+PiArKysgYi9hcmNoL2FybTY0L21tL2Zh
dWx0LmMKPj4+IEBAIC01NzIsNyArNTcyLDkgQEAgc3RhdGljIGludCBfX2twcm9iZXMgZG9fcGFn
ZV9mYXVsdCh1bnNpZ25lZCBsb25nIGZhciwgdW5zaWduZWQgbG9uZyBlc3IsCj4+Pgo+Pj4gICAg
ICAgICAgaWYgKCEodm1hLT52bV9mbGFncyAmIHZtX2ZsYWdzKSkgewo+Pj4gICAgICAgICAgICAg
ICAgICB2bWFfZW5kX3JlYWQodm1hKTsKPj4+IC0gICAgICAgICAgICAgICBnb3RvIGxvY2tfbW1h
cDsKPj4+ICsgICAgICAgICAgICAgICBmYXVsdCA9IFZNX0ZBVUxUX0JBREFDQ0VTUzsKPj4+ICsg
ICAgICAgICAgICAgICBjb3VudF92bV92bWFfbG9ja19ldmVudChWTUFfTE9DS19TVUNDRVNTKTsK
Pj4KPj4gbml0OiBWTUFfTE9DS19TVUNDRVNTIGFjY291bnRpbmcgaGVyZSBzZWVtcyBjb3JyZWN0
IHRvIG1lIGJ1dAo+PiB1bnJlbGF0ZWQgdG8gdGhlIG1haW4gY2hhbmdlLiBFaXRoZXIgc3BsaXR0
aW5nIGludG8gYSBzZXBhcmF0ZSBwYXRjaAo+PiBvciBtZW50aW9uaW5nIHRoaXMgYWRkaXRpb25h
bCBmaXh1cCBpbiB0aGUgY2hhbmdlbG9nIHdvdWxkIGJlIGhlbHBmdWwuCj4gCj4gVGhlIGFib3Zl
IG5pdCBhcHBsaWVzIHRvIGFsbCB0aGUgcGF0Y2hlcyBhZnRlciB0aGlzIG9uZSwgc28gSSB3b24n
dAo+IGNvbW1lbnQgb24gZWFjaCBvbmUgc2VwYXJhdGVseS4gSWYgeW91IGRlY2lkZSB0byBzcGxp
dCBvciBhZGp1c3QgdGhlCj4gY2hhbmdlbG9nIHBsZWFzZSBkbyB0aGF0IGZvciBlYWNoIHBhdGNo
LgoKSSB3aWxsIHVwZGF0ZSB0aGUgY2hhbmdlIGxvZyBmb3IgZWFjaCBwYXRjaCwgdGhhbmsgZm9y
IHlvdXIgcmV2aWV3IGFuZCAKc3VnZ2VzdGlvbi4KCj4gCj4+Cj4+PiArICAgICAgICAgICAgICAg
Z290byBkb25lOwo+Pj4gICAgICAgICAgfQo+Pj4gICAgICAgICAgZmF1bHQgPSBoYW5kbGVfbW1f
ZmF1bHQodm1hLCBhZGRyLCBtbV9mbGFncyB8IEZBVUxUX0ZMQUdfVk1BX0xPQ0ssIHJlZ3MpOwo+
Pj4gICAgICAgICAgaWYgKCEoZmF1bHQgJiAoVk1fRkFVTFRfUkVUUlkgfCBWTV9GQVVMVF9DT01Q
TEVURUQpKSkKPj4+IC0tCj4+PiAyLjI3LjAKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
