Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB01BC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b43FxntR5YPItsjNL54cJRU4TxrQ7wdwG7vqDKAEHBA=; b=qYlNfg30XUuUDs
	GstMRMzkHRxce84lwCs869k4uqhufUstXY+t640oafbgkNUBWvpJcnHDnp6SkbxOqPs6fGxIo+fqq
	acOs6v5+55rO4UO7xWeWDv4dRC6oVPuuSR50BWm4jvwZDn5sSiuB5l/EsYD/WIr2bgTXJaEBuED3e
	am8A6vBzoYJO/8JVqD762/XTeq71OMfnM6WyN9jw34qAYjfBT0CIxKaAw7tvDBPL5j79D5wcOXAj0
	8zDN/R+k6+pDsjkf9/dpmwm1u9obw++wCRu3jewnTlnqN/XWd3LqnnDGSaEK+jvxPGmP7oDY7pH36
	2ICnyOdMwhZ3EVXJIrVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7zP-004jqZ-1K;
	Fri, 14 Jul 2023 01:52:59 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7zL-004jor-0Q;
	Fri, 14 Jul 2023 01:52:57 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R2DxQ4ZhTz18LhT;
	Fri, 14 Jul 2023 09:52:10 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 09:52:45 +0800
Message-ID: <6f06f7d5-7d84-815e-699b-eef684e014b0@huawei.com>
Date: Fri, 14 Jul 2023 09:52:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
	<willy@infradead.org>
CC: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Russell
 King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com>
 <ZLAjFQGgcjt4ykS7@casper.infradead.org>
 <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_185255_590329_E68197D2 
X-CRM114-Status: GOOD (  16.34  )
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

CgpPbiAyMDIzLzcvMTQgNDoxMiwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+IE9uIFRodSwg
SnVsIDEzLCAyMDIzIGF0IDk6MTXigK9BTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4gd3JvdGU6Cj4+Cj4+PiAraW50IHRyeV92bWFfbG9ja2VkX3BhZ2VfZmF1bHQoc3RydWN0
IHZtX2xvY2tlZF9mYXVsdCAqdm1sZiwgdm1fZmF1bHRfdCAqcmV0KQo+Pj4gK3sKPj4+ICsgICAg
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+Pj4gKyAgICAgdm1fZmF1bHRfdCBmYXVsdDsK
Pj4KPj4KPj4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMDU6NTM6MjlQTSArMDgwMCwgS2VmZW5n
IFdhbmcgd3JvdGU6Cj4+PiArI2RlZmluZSBWTV9MT0NLRURfRkFVTFRfSU5JVChfbmFtZSwgX21t
LCBfYWRkcmVzcywgX2ZhdWx0X2ZsYWdzLCBfdm1fZmxhZ3MsIF9yZWdzLCBfZmF1bHRfY29kZSkg
XAo+Pj4gKyAgICAgX25hbWUubW0gICAgICAgICAgICAgICAgPSBfbW07ICAgICAgICAgICAgICAg
ICAgXAo+Pj4gKyAgICAgX25hbWUuYWRkcmVzcyAgICAgICAgICAgPSBfYWRkcmVzczsgICAgICAg
ICAgICAgXAo+Pj4gKyAgICAgX25hbWUuZmF1bHRfZmxhZ3MgICAgICAgPSBfZmF1bHRfZmxhZ3M7
ICAgICAgICAgXAo+Pj4gKyAgICAgX25hbWUudm1fZmxhZ3MgICAgICAgICAgPSBfdm1fZmxhZ3M7
ICAgICAgICAgICAgXAo+Pj4gKyAgICAgX25hbWUucmVncyAgICAgICAgICAgICAgPSBfcmVnczsg
ICAgICAgICAgICAgICAgXAo+Pj4gKyAgICAgX25hbWUuZmF1bHRfY29kZSAgICAgICAgPSBfZmF1
bHRfY29kZQo+Pgo+PiBNb3JlIGNvbnNvbGlkYXRlZCBjb2RlIGlzIGEgZ29vZCBpZGVhOyBubyBx
dWVzdGlvbi4gIEJ1dCBJIGRvbid0IHRoaW5rCj4+IHRoaXMgaXMgdGhlIHJpZ2h0IHdheSB0byBk
byBpdC4KCkkgYWdyZWUgaXQgaXMgbm90IGdvb2QgZW5vdWdoLCBidXQgdGhlIGFyY2gncyB2bWEg
Y2hlY2sgYWNlc3MgaGFzCmRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiwgc29tZSB1c2Ugdm0gZmxh
Z3MsIHNvbWUgbmVlZCBmYXVsdCBjb2RlIGFuZApyZWdzLCBhbmQgc29tZSB1c2UgYm90aCA6KAoK
Pj4KPj4+ICtpbnQgX193ZWFrIGFyY2hfdm1hX2NoZWNrX2FjY2VzcyhzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1f
bG9ja2VkX2ZhdWx0ICp2bWxmKTsKPj4KPj4gVGhpcyBzaG91bGQgYmU6Cj4+Cj4+ICNpZm5kZWYg
dm1hX2NoZWNrX2FjY2Vzcwo+PiBib29sIHZtYV9jaGVja19hY2Nlc3Moc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsICkKPj4gewo+PiAgICAgICAgICByZXR1cm4gKHZtYS0+dm1fZmxhZ3MgJiB2
bV9mbGFncykgPT0gMDsKPj4gfQo+PiAjZW5kaWYKPj4KPj4gYW5kIHRoZW4gYXJjaGVzIHdoaWNo
IHdhbnQgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCBjYW4ganVzdCBkZWZpbmUKPj4gdm1hX2No
ZWNrX2FjY2Vzcy4KCk9rLCBJIGNvdWxkIGNvbnZlcnQgdG8gdXNlIHRoaXMgd2F5LgoKPj4KPj4+
ICtpbnQgdHJ5X3ZtYV9sb2NrZWRfcGFnZV9mYXVsdChzdHJ1Y3Qgdm1fbG9ja2VkX2ZhdWx0ICp2
bWxmLCB2bV9mYXVsdF90ICpyZXQpCj4+PiArewo+Pj4gKyAgICAgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWE7Cj4+PiArICAgICB2bV9mYXVsdF90IGZhdWx0Owo+Pgo+PiBEZWNsYXJpbmcgdGhl
IHZtZiBpbiB0aGlzIGZ1bmN0aW9uIGFuZCB0aGVuIGNvcHlpbmcgaXQgYmFjayBpcyBqdXN0IHdy
b25nLgo+PiBXZSBuZWVkIHRvIGRlY2xhcmUgdm1fZmF1bHRfdCBlYXJsaWVyIChpbiB0aGUgYXJj
aCBmYXVsdCBoYW5kbGVyKSBhbmQKPj4gcGFzcyBpdCBpbi4KCkFjdHVhbGx5IEkgcGFzc2VkIHRo
ZSB2bV9mYXVsdF90ICpyZXQoaW4gdGhlIGFyY2ggZmF1bHQgaGFuZGxlciksIHdlCmNvdWxkIGRp
cmVjdGx5IHVzZSAqcmV0IGluc3RlYWQgb2YgYSBuZXcgbG9jYWwgdmFyaWFibGUsIGFuZCBubyBj
b3B5Lgo+IAo+IERpZCB5b3UgbWVhbiB0byBzYXkgIndlIG5lZWQgdG8gZGVjbGFyZSB2bWYgKHN0
cnVjdCB2bV9mYXVsdCkgZWFybGllcgo+IChpbiB0aGUgYXJjaCBmYXVsdCBoYW5kbGVyKSBhbmQg
cGFzcyBpdCBpbi4iID8KPiAKPj4gICBJIGRvbid0IHRoaW5rIHRoYXQgY3JlYXRpbmcgc3RydWN0
IHZtX2xvY2tlZF9mYXVsdCBpcyB0aGUKPj4gcmlnaHQgaWRlYSBlaXRoZXIuCgpBcyBtZW50aW9u
ZWQgYWJvdmUgZm9yIHZtYSBjaGVjayBhY2Nlc3MsIHdlIG5lZWQgbWFueSBhcmd1bWVudHMgZm9y
IGEgCmZ1bmN0aW9uLCBhIG5ldyBzdHJ1Y3QgbG9va3MgcG9zc2libGUgYmV0dGVyLCBpcyB0aGVy
ZSBiZXR0ZXIgc29sdXRpb24Kb3IgYW55IHN1Z2dlc3Rpb24/CgpUaGFua3MuCgo+Pgo+Pj4gKyAg
ICAgaWYgKCEodm1sZi0+ZmF1bHRfZmxhZ3MgJiBGQVVMVF9GTEFHX1VTRVIpKQo+Pj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsKPj4+ICsgICAgIHZtYSA9IGxvY2tfdm1hX3Vu
ZGVyX3JjdSh2bWxmLT5tbSwgdm1sZi0+YWRkcmVzcyk7Cj4+PiArICAgICBpZiAoIXZtYSkKPj4+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiArICAgICBpZiAoYXJjaF92
bWFfY2hlY2tfYWNjZXNzKHZtYSwgdm1sZikpIHsKPj4+ICsgICAgICAgICAgICAgdm1hX2VuZF9y
ZWFkKHZtYSk7Cj4+PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgfQo+
Pj4gKwo+Pj4gKyAgICAgZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCB2bWxmLT5hZGRyZXNz
LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1sZi0+ZmF1bHRfZmxhZ3MgfCBG
QVVMVF9GTEFHX1ZNQV9MT0NLLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1s
Zi0+cmVncyk7Cj4+PiArICAgICAqcmV0ID0gZmF1bHQ7Cj4+PiArCj4+PiArICAgICBpZiAoIShm
YXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8IFZNX0ZBVUxUX0NPTVBMRVRFRCkpKQo+Pj4gKyAgICAg
ICAgICAgICB2bWFfZW5kX3JlYWQodm1hKTsKPj4+ICsKPj4+ICsgICAgIGlmICgoZmF1bHQgJiBW
TV9GQVVMVF9SRVRSWSkpCj4+PiArICAgICAgICAgICAgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50
KFZNQV9MT0NLX1JFVFJZKTsKPj4+ICsgICAgIGVsc2UKPj4+ICsgICAgICAgICAgICAgY291bnRf
dm1fdm1hX2xvY2tfZXZlbnQoVk1BX0xPQ0tfU1VDQ0VTUyk7Cj4+PiArCj4+PiArICAgICByZXR1
cm4gMDsKPj4+ICt9Cj4+PiArCj4+PiAgICNlbmRpZiAvKiBDT05GSUdfUEVSX1ZNQV9MT0NLICov
Cj4+Pgo+Pj4gICAjaWZuZGVmIF9fUEFHRVRBQkxFX1A0RF9GT0xERUQKPj4+IC0tCj4+PiAyLjI3
LjAKPj4+Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
