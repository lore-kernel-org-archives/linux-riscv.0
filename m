Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F1C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW8k1AJBpDfzB83gT/dbFmftjvjy21IHbpAkSTtgOJs=; b=sVCnmx3w/872A1
	Kzs8rjo7kixnOOgMo1+dPuyBbCJQU4IgFaY2IYySdl5es+DbbJdUml6oguedSbEwiYIbJ4Eb2GHDb
	honoeNPJqmCAfRNyfugwYkOoADqI1bQwF/GGc5cPUydOFe5vipVNTkPDTeza1F6WcWk53vUn0SS26
	mX7f6y8xH4b8yV7SnhuY+oBqjWOBY+QWgLUS50CMY/YRBEPGstftrMjzmiEBqBqlashZFLlUGBtjT
	u7MStw5T8EcPXr1tZXwYn/5fUDxaaBTgrW2cCW34ZnR0yijlL3Utq1syW33pJ2kahl6CblDOGztSj
	L2+v6tzVI5jAYFIuLSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FqV-00000003jDq-0qDb;
	Fri, 10 May 2024 02:18:51 +0000
Received: from out0-194.mail.aliyun.com ([140.205.0.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FqR-00000003jA5-2R1A
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 02:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715307519; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=z3HIGnGQLgftTdCGksj44Ar9SYsXylJNvYIUDPPEOR8=;
	b=1oef9RVl4+N/ZYuO1r199a6Nq3kwuoLZIbNsqS5eAeKrUwDDaUy7KWB/Rlypbubs9gEf2XfB085njZAef06aOsTdB2EJCquUI8JP9TcOTIRQhA72BMBM6Q4qdaLZSQHihol1xFjGr2HsGIEOtzU+btyAdAE7PCEGFyRkuI7exvU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047209;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XXRy7zj_1715307516;
Received: from 30.230.92.230(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XXRy7zj_1715307516)
          by smtp.aliyun-inc.com;
          Fri, 10 May 2024 10:18:37 +0800
Message-ID: <282a3696-e883-49bb-9bb5-57d4762250cf@antgroup.com>
Date: Fri, 10 May 2024 10:18:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] riscv: Add update_mmu_tlb_range()
To: Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 david@redhat.com, ryan.roberts@arm.com, ioworker0@gmail.com,
 libang.linux@gmail.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-4-libang.li@antgroup.com>
 <5a812c84-c3bb-4874-b29c-0816494b77a8@ghiti.fr>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <5a812c84-c3bb-4874-b29c-0816494b77a8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_191847_811259_D3C035BC 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

VGhhbmtzLCBBbGV4IQoKT24gMjAyNC81LzcgMTM6MzUsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToK
PiBIaSBCYW5nLAo+IAo+IE9uIDA2LzA1LzIwMjQgMTc6NTEsIEJhbmcgTGkgd3JvdGU6Cj4+IEFk
ZGVkIHVwZGF0ZV9tbXVfdGxiX3JhbmdlIGZ1bmN0aW9uLCB3ZSBjYW4gYmF0Y2ggdXBkYXRlIHRs
YiBvZiBhbgo+PiBhZGRyZXNzIHJhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCYW5nIExpIDxs
aWJhbmcubGlAYW50Z3JvdXAuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggfCA0ICsrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggCj4+
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gaW5kZXggNjYxYjJiNGZlNzU4
Li5mNzg0YzZkZDJjNjYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IEBAIC00
ODksNiArNDg5LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlX3Jhbmdl
KHN0cnVjdCAKPj4gdm1fZmF1bHQgKnZtZiwKPj4gwqAgI2RlZmluZSBfX0hBVkVfQVJDSF9VUERB
VEVfTU1VX1RMQgo+PiDCoCAjZGVmaW5lIHVwZGF0ZV9tbXVfdGxiIHVwZGF0ZV9tbXVfY2FjaGUK
Pj4gKyNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEJfUkFOR0UKPj4gKyNkZWZpbmUg
dXBkYXRlX21tdV90bGJfcmFuZ2Uodm1hLCBhZGRyLCBwdGVwLCBucikgXAo+PiArwqDCoMKgIHVw
ZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoTlVMTCwgdm1hLCBhZGRyLCBwdGVwLCBucikKPj4gKwo+PiDC
oCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9wbWQoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGFkZHJlc3Ms
IHBtZF90ICpwbWRwKQo+PiDCoCB7Cj4gCj4gCj4gWW91IGNhbiBhZGQ6Cj4gCj4gUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGFua3Ms
Cj4gCj4gQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
