Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCFACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr1A6KDsxA6V7qen4bZuTEAL3D2tYujTu2ri+cNQ3kk=; b=EVTpBmFqR81TpQ
	HC42IE47EpA+2EWaQATNdYJxfK6yqmdzLjfzjwFSBtTSIbf7/FbO7gz5calOL9peDX51yA1i1XzEd
	m+ktylKS76Cp0oubJT0ngtVdobggIh88SIZr0qE+r3XNci70BoUuj3vZf6RdyPltJ2uaxZ7yt0m4A
	2RM1SE7jksQCnLHQsjSQJa35eyjdmkfrsgOVB2WiHpVwWnUc+NFzGL3yG4jqXr+7VLO6xMHwioi//
	BvGeDwoKf16YuRDL1wdaC/9ix+GNgzAgJ4U/kMCLNwwyy+WQkifoPpzdbNzGLJb1+YfHIc33/siJI
	AAcHd8tofgLa/AmPXFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSzr-00000005mTK-1Z4U;
	Wed, 10 Apr 2024 08:07:55 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSzm-00000005mPM-0wzY;
	Wed, 10 Apr 2024 08:07:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VDwQn2tqGz1GGhl;
	Wed, 10 Apr 2024 16:06:57 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D373140154;
	Wed, 10 Apr 2024 16:07:43 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 16:07:42 +0800
Message-ID: <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
Date: Wed, 10 Apr 2024 16:07:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] riscv: mm: accelerate pagefault when badaccess
Content-Language: en-US
To: Alexandre Ghiti <alex@ghiti.fr>, <akpm@linux-foundation.org>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <surenb@google.com>, <linux-mm@kvack.org>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
 <8fe1a53f-f031-4423-97e1-28d93d0cd59e@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <8fe1a53f-f031-4423-97e1-28d93d0cd59e@ghiti.fr>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_010750_672182_F3770C22 
X-CRM114-Status: GOOD (  15.81  )
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

CgpPbiAyMDI0LzQvMTAgMTU6MzIsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBLZWZlbmcs
Cj4gCj4gT24gMDMvMDQvMjAyNCAxMDozOCwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4+IFRoZSBhY2Nl
c3NfZXJyb3IoKSBvZiB2bWEgYWxyZWFkeSBjaGVja2VkIHVuZGVyIHBlci1WTUEgbG9jaywgaWYg
aXQKPj4gaXMgYSBiYWQgYWNjZXNzLCBkaXJlY3RseSBoYW5kbGUgZXJyb3IsIG5vIG5lZWQgdG8g
cmV0cnkgd2l0aCBtbWFwX2xvY2sKPj4gYWdhaW4uIFNpbmNlIHRoZSBwYWdlIGZhdXQgaXMgaGFu
ZGxlZCB1bmRlciBwZXItVk1BIGxvY2ssIGNvdW50IGl0IGFzCj4+IGEgdm1hIGxvY2sgZXZlbnQg
d2l0aCBWTUFfTE9DS19TVUNDRVNTLgo+Pgo+PiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdh
bmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9tbS9mYXVs
dC5jIHwgNSArKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMgYi9hcmNo
L3Jpc2N2L21tL2ZhdWx0LmMKPj4gaW5kZXggM2JhMWQ0ZGRlNWRkLi5iM2ZjZjdkNjdlZmIgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L21t
L2ZhdWx0LmMKPj4gQEAgLTI5Miw3ICsyOTIsMTAgQEAgdm9pZCBoYW5kbGVfcGFnZV9mYXVsdChz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoYWNjZXNzX2Vy
cm9yKGNhdXNlLCB2bWEpKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdm1hX2VuZF9yZWFkKHZt
YSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIGxvY2tfbW1hcDsKPj4gK8KgwqDCoMKgwqDCoMKg
IGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+PiArwqDCoMKgwqDC
oMKgwqAgdHNrLT50aHJlYWQuYmFkX2NhdXNlID0gU0VHVl9BQ0NFUlI7Cj4gCj4gCj4gSSB0aGlu
ayB3ZSBzaG91bGQgdXNlIHRoZSBjYXVzZSB2YXJpYWJsZSBoZXJlIGluc3RlYWQgb2YgU0VHVl9B
Q0NFUlIsIGFzIAo+IGJhZF9jYXVzZSBpcyBhIHJpc2N2IGludGVybmFsIHN0YXR1cyB3aGljaCBk
ZXNjcmliZXMgdGhlIHJlYWwgZmF1bHQgdGhhdCAKPiBoYXBwZW5lZC4KCk9oLCBJIHNlZSwgaXQg
aXMgZXhjZXB0aW9uIGNhdXNlcyBvbiByaXNjdiwgc28gaXQgc2hvdWxkIGJlCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCmluZGV4IGIz
ZmNmN2Q2N2VmYi4uNTIyNGYzNzMzODAyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2ZhdWx0
LmMKKysrIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCkBAIC0yOTMsOCArMjkzLDggQEAgdm9pZCBo
YW5kbGVfcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykKICAgICAgICAgaWYgKHVubGlr
ZWx5KGFjY2Vzc19lcnJvcihjYXVzZSwgdm1hKSkpIHsKICAgICAgICAgICAgICAgICB2bWFfZW5k
X3JlYWQodm1hKTsKICAgICAgICAgICAgICAgICBjb3VudF92bV92bWFfbG9ja19ldmVudChWTUFf
TE9DS19TVUNDRVNTKTsKLSAgICAgICAgICAgICAgIHRzay0+dGhyZWFkLmJhZF9jYXVzZSA9IFNF
R1ZfQUNDRVJSOwotICAgICAgICAgICAgICAgYmFkX2FyZWFfbm9zZW1hcGhvcmUocmVncywgY29k
ZSwgYWRkcik7CisgICAgICAgICAgICAgICB0c2stPnRocmVhZC5iYWRfY2F1c2UgPSBjYXVzZTsK
KyAgICAgICAgICAgICAgIGJhZF9hcmVhX25vc2VtYXBob3JlKHJlZ3MsIFNFR1ZfQUNDRVJSLCBh
ZGRyKTsKICAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgIH0KCkhpIEFsZXgsIGNvdWxk
IHlvdSBoZWxwIHRvIGNoZWNrIGl0PwoKSGkgQW5kcmV3LCBwbGVhc2UgaGVscCB0byBzcXVhc2gg
aXQgYWZ0ZXIgQWxleCBhY2sgaXQuCgpUaGFua3MgYm90aC4KCgo+IAo+IFRoYW5rcywKPiAKPiBB
bGV4Cj4gCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCBiYWRfYXJlYV9ub3NlbWFwaG9yZShyZWdzLCBj
b2RlLCBhZGRyKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqAgZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCBhZGRyLCBmbGFncyB8IEZB
VUxUX0ZMQUdfVk1BX0xPQ0ssIAo+PiByZWdzKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
