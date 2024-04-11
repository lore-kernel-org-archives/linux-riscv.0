Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70033CD129A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/z2UITksvyTWDmdkQKEeWbGJl2gN2MctHuPL6q/djA=; b=ni8t3zRaIFcj4U
	Zo3SRIzfs4TvoYqGFrDN7CQrxQskIPv1yCB4MywRAT4q3LmHQdrcdI5cD+wVL41Osk6qdFGwu7q79
	1qKePp00eIIq74h+8ImqH0tInUhWA2YlRXBYU4ZnbWbuyl4iJt18ukcrvWxRHAHBps1aGZxcKzGIE
	/VpqhPrt4hogIjvo3zodY6SukRsEW/W16HbZmDvvnPqyzHLGT66AGV7anK2+HEawDqXRD1SOSJcDE
	WfieqwrpS85GFGHugUZVw/JarwNlc/D1bsssWn3oFxvFmOMHOHAhajtznsbnOP/OsoAqcX9QgpyRz
	buyjpYlsv2vyQnps+/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj4o-00000009o9j-2q3o;
	Thu, 11 Apr 2024 01:18:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruj4j-00000009o7G-3C6v;
	Thu, 11 Apr 2024 01:18:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VFMFF2htSztSMV;
	Thu, 11 Apr 2024 09:15:13 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 93B58180072;
	Thu, 11 Apr 2024 09:17:57 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 09:17:56 +0800
Message-ID: <ddb260bc-c4fc-4c42-b10f-0f459cf965e6@huawei.com>
Date: Thu, 11 Apr 2024 09:17:56 +0800
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
 <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
 <3493a2f4-9cae-4773-a6a1-2eeb2d23f0c8@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <3493a2f4-9cae-4773-a6a1-2eeb2d23f0c8@ghiti.fr>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_181802_351691_B02203DE 
X-CRM114-Status: GOOD (  15.99  )
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

CgpPbiAyMDI0LzQvMTEgMToyOCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IE9uIDEwLzA0LzIw
MjQgMTA6MDcsIEtlZmVuZyBXYW5nIHdyb3RlOgo+Pgo+Pgo+PiBPbiAyMDI0LzQvMTAgMTU6MzIs
IEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IEhpIEtlZmVuZywKPj4+Cj4+PiBPbiAwMy8wNC8y
MDI0IDEwOjM4LCBLZWZlbmcgV2FuZyB3cm90ZToKPj4+PiBUaGUgYWNjZXNzX2Vycm9yKCkgb2Yg
dm1hIGFscmVhZHkgY2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0Cj4+Pj4gaXMgYSBi
YWQgYWNjZXNzLCBkaXJlY3RseSBoYW5kbGUgZXJyb3IsIG5vIG5lZWQgdG8gcmV0cnkgd2l0aCBt
bWFwX2xvY2sKPj4+PiBhZ2Fpbi4gU2luY2UgdGhlIHBhZ2UgZmF1dCBpcyBoYW5kbGVkIHVuZGVy
IHBlci1WTUEgbG9jaywgY291bnQgaXQgYXMKPj4+PiBhIHZtYSBsb2NrIGV2ZW50IHdpdGggVk1B
X0xPQ0tfU1VDQ0VTUy4KPj4+Pgo+Pj4+IFJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4g
PHN1cmVuYkBnb29nbGUuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5n
a2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBhcmNoL3Jpc2N2L21tL2Zh
dWx0LmMgfCA1ICsrKystCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQu
YyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4+IGluZGV4IDNiYTFkNGRkZTVkZC4uYjNmY2Y3
ZDY3ZWZiIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4+ICsrKyBi
L2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4+IEBAIC0yOTIsNyArMjkyLDEwIEBAIHZvaWQgaGFu
ZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Pj4gwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoYWNjZXNzX2Vycm9yKGNhdXNlLCB2bWEpKSkgewo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB2bWFfZW5kX3JlYWQodm1hKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBsb2NrX21t
YXA7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NL
X1NVQ0NFU1MpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB0c2stPnRocmVhZC5iYWRfY2F1c2UgPSBT
RUdWX0FDQ0VSUjsKPj4+Cj4+Pgo+Pj4gSSB0aGluayB3ZSBzaG91bGQgdXNlIHRoZSBjYXVzZSB2
YXJpYWJsZSBoZXJlIGluc3RlYWQgb2YgU0VHVl9BQ0NFUlIsIAo+Pj4gYXMgYmFkX2NhdXNlIGlz
IGEgcmlzY3YgaW50ZXJuYWwgc3RhdHVzIHdoaWNoIGRlc2NyaWJlcyB0aGUgcmVhbCAKPj4+IGZh
dWx0IHRoYXQgaGFwcGVuZWQuCj4+Cj4+IE9oLCBJIHNlZSwgaXQgaXMgZXhjZXB0aW9uIGNhdXNl
cyBvbiByaXNjdiwgc28gaXQgc2hvdWxkIGJlCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2ZhdWx0LmMgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPj4gaW5kZXggYjNmY2Y3ZDY3ZWZi
Li41MjI0ZjM3MzM4MDIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+PiAr
KysgYi9hcmNoL3Jpc2N2L21tL2ZhdWx0LmMKPj4gQEAgLTI5Myw4ICsyOTMsOCBAQCB2b2lkIGhh
bmRsZV9wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiDCoMKgwqDCoMKgwqDCoCBp
ZiAodW5saWtlbHkoYWNjZXNzX2Vycm9yKGNhdXNlLCB2bWEpKSkgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdm1hX2VuZF9yZWFkKHZtYSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb3VudF92bV92bWFfbG9ja19ldmVudChWTUFfTE9DS19TVUNDRVNTKTsK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHNrLT50aHJlYWQuYmFkX2NhdXNlID0g
U0VHVl9BQ0NFUlI7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJhZF9hcmVhX25v
c2VtYXBob3JlKHJlZ3MsIGNvZGUsIGFkZHIpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0c2stPnRocmVhZC5iYWRfY2F1c2UgPSBjYXVzZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmFkX2FyZWFfbm9zZW1hcGhvcmUocmVncywgU0VHVl9BQ0NFUlIsIGFkZHIp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiDCoMKgwqDCoMKg
wqDCoCB9Cj4+Cj4+IEhpIEFsZXgsIGNvdWxkIHlvdSBoZWxwIHRvIGNoZWNrIGl0Pwo+Pgo+PiBI
aSBBbmRyZXcsIHBsZWFzZSBoZWxwIHRvIHNxdWFzaCBpdCBhZnRlciBBbGV4IGFjayBpdC4KPj4K
Pj4gVGhhbmtzIGJvdGguCj4gCj4gCj4gU28gSSBoYXZlIGp1c3QgdGVzdGVkIEtlZmVuZydzIGZp
eHVwIG9uIG15IHVzdWFsIENJIGFuZCB3aXRoIGEgc2ltcGxlIAo+IHByb2dyYW0gdGhhdCB0cmln
Z2VycyBzdWNoIGJhZCBhY2Nlc3MsIGV2ZXJ5dGhpbmcgd2VudCBmaW5lIHNvIHdpdGggdGhlIAo+
IGZpeHVwIGFwcGxpZWQ6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KCkdyZWF0LCB0aGFua3MuCgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4g
Cj4gCj4gCj4+Cj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+IEFsZXgKPj4+Cj4+Pgo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBiYWRfYXJlYV9ub3NlbWFwaG9yZShyZWdzLCBjb2RlLCBhZGRyKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKg
wqAgZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCBhZGRyLCBmbGFncyB8IAo+Pj4+IEZBVUxU
X0ZMQUdfVk1BX0xPQ0ssIHJlZ3MpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
