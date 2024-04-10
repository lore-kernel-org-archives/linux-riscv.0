Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6BBCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNvAdJhdthbgsl+2+hwQ85fiDrDM+fBQiXLz+ffSl9k=; b=OWO/hyBNPSrOb6
	pHJT9p+tju8Rmoj3rbM8Dp5Oraz1O4VT6b+SaBr3F9wAR69vgQSNLQ/OaGdwnfKMmf7rvq/ccR9n/
	+xv+4+XlWlu18Z8AOkRIdf18BpiLVpLlab8+rd8WDAhN+oVvvSFWaJUOTzXjYKquUOPS7AEbvzwnQ
	cs6LPf/ttlqwHKA/6skF2SDUsxw8NbYGY1Bi3EC7FMbRhCqzv9SGS6DM890QTboZykKOMTdK+z1I9
	8F0vkvpsms13EWmhPcGb3fsqBseG5ILhZHqOwzccwT16XNntAKRkA0kGwKDJT+qkbio9U7oVSpApk
	T3NFmug9rJFHvaXbJkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufAJ-00000008xKR-3neG;
	Wed, 10 Apr 2024 21:07:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufAF-00000008xHw-3uK5;
	Wed, 10 Apr 2024 21:07:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VFFjC372rz6K6DM;
	Thu, 11 Apr 2024 05:05:35 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 403711402C7;
	Thu, 11 Apr 2024 05:07:14 +0800 (CST)
Received: from localhost (10.126.168.81) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 22:07:13 +0100
Date: Wed, 10 Apr 2024 22:07:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	<linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <20240410220712.0000726f@Huawei.com>
In-Reply-To: <CAJZ5v0gG0xLajHsWXVM+-V+fQZAudvojechUa-DzFgwCs2q8Dg@mail.gmail.com>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
	<E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
	<20240322185327.00002416@Huawei.com>
	<20240410134318.0000193c@huawei.com>
	<CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
	<20240410145005.00003050@Huawei.com>
	<ZhbgwBBvh6ccdO7x@shell.armlinux.org.uk>
	<CAJZ5v0gG0xLajHsWXVM+-V+fQZAudvojechUa-DzFgwCs2q8Dg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.126.168.81]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_140728_272664_A53B257E 
X-CRM114-Status: GOOD (  22.75  )
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

T24gV2VkLCAxMCBBcHIgMjAyNCAyMTowODowNiArMDIwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
YWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDg6NTbi
gK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90
ZToKPiA+Cj4gPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwMjo1MDowNVBNICswMTAwLCBKb25h
dGhhbiBDYW1lcm9uIHdyb3RlOiAgCj4gPiA+IElmIHdlIGdldCByaWQgb2YgdGhpcyBjYXRjaCBh
bGwsIHNvbHV0aW9uIHdvdWxkIGJlIHRvIG1vdmUgdGhlCj4gPiA+ICFhY3BpX2Rpc2FibGVkIGNo
ZWNrIGludG8gdGhlIGFybTY0IHZlcnNpb24gb2YgYXJjaF9jcHVfcmVnaXN0ZXIoKQo+ID4gPiBi
ZWNhdXNlIHdlIHdvdWxkIG9ubHkgd2FudCB0aGUgZGVsYXllZCByZWdpc3RyYXRpb24gcGF0aCB0
byBiZQo+ID4gPiB1c2VkIG9uIEFDUEkgY2FzZXMgd2hlcmUgdGhlIHF1ZXN0aW9uIG9mIENQVSBh
dmFpbGFiaWxpdHkgY2FuJ3QKPiA+ID4geWV0IGJlIHJlc29sdmVkLiAgCj4gPgo+ID4gQXJlbid0
IHdlIHRoZW4gbmVlZGluZyB0d28gYXJjaF9yZWdpc3Rlcl9jcHUoKSBpbXBsZW1lbnRhdGlvbnM/
Cj4gPiBJJ20gYXNzdW1pbmcgdGhhdCB5b3UncmUgc3VnZ2VzdGluZyB0aGF0IHRoZSAhYWNwaV9k
aXNhYmxlZCwgdGhlbgo+ID4gZG8gbm90aGluZyBjaGVjayBpcyBtb3ZlZCBpbnRvIGFyY2hfcmVn
aXN0ZXJfY3B1KCkgLSBvciB0byBwdXQgaXQKPiA+IGFub3RoZXIgd2F5LCBhcmNoX3JlZ2lzdGVy
X2NwdSgpIGRvZXMgbm90aGluZyBpZiBBQ1BJIGlzIGVuYWJsZWQuCj4gPgo+ID4gSWYgYXJjaF9y
ZWdpc3Rlcl9jcHUoKSBkb2VzIG5vdGhpbmcgaWYgQUNQSSBpcyBlbmFibGVkLCBob3cgZG8KPiA+
IENQVXMgZ2V0IHJlZ2lzdGVyZWQgKGFuZCBzeXNmcyBmaWxlcyBnZXQgY3JlYXRlZCB0byBjb250
cm9sIHRoZW0pCj4gPiBvbiBBQ1BJIHN5c3RlbXM/IEFDUEkgd291bGRuJ3QgYmUgYWJsZSB0byBj
YWxsIGFyY2hfcmVnaXN0ZXJfY3B1KCksCj4gPiBzbyBJIHN1c3BlY3QgeW91J2xsIG5lZWQgYW4g
QUNQSS1zcGVjaWZpYyB2ZXJzaW9uIG9mIHRoaXMgZnVuY3Rpb24uICAKPiAKPiBhcmNoX3JlZ2lz
dGVyX2NwdSgpIHdpbGwgZG8gd2hhdCBpdCBkb2VzLCBidXQgaXQgd2lsbCBjaGVjayAodXBmcm9u
dCkKPiBpZiBBQ1BJIGlzIGVuYWJsZWQgYW5kIGlmIHNvLCBpZiB0aGUgQUNQSSBOYW1lc3BhY2Ug
aXMgYXZhaWxhYmxlLiAgSW4KPiB0aGUgY2FzZSB3aGVuIEFDUEkgaXMgZW5hYmxlZCBhbmQgdGhl
IEFDUEkgTmFtZXNwYWNlIGlzIG5vdCByZWFkeSwgaXQKPiB3aWxsIHJldHVybiAtRVBST0JFX0RF
RkVSIChzYXkpLgoKRXhhY3RseS4gIEkgb3ZlcnNpbXBsaWZpZWQgYW5kIHdhc24ndCBjbGVhciBl
bm91Z2guClRoZSBjaGVjayBpcyB0aGVyZSBpbiB0aGUgYXJjaF9yZWdpc3Rlcl9jcHUoKSBhbmQg
aXMgb25lIG9mIHRoZSB3YXlzCnRoYXQgZnVuY3Rpb24gY2FuIGRlY2lkZSB0byBhY3R1YWxseSBy
ZWdpc3RlciB0aGUgY3B1IGJ1dCBub3QgdGhlIG9ubHkgb25lLgoKSSB0aGluayB3ZSBtYXkgbGF0
ZXIgd2FudCB0byBjb25zaWRlciBicmVha2luZyBpdCBpbnRvIDIgYXJjaCBjYWxscwooY2hlY2sg
aWYgcmVhZHkgdG8gcmVnaXN0ZXIgKyByZWdpc3RlcikgdG8gcmVkdWNlIGNvZGUgZHVwbGljYXRp
b24KaW4gd2l0aCB0aGUgaG90cGx1ZyBwYXRoIHdoZXJlIHRoZXJlIGlzIGEgbGl0dGxlIGV4dHJh
IHRvIGRvCmluYmV0d2Vlbi4KCkhvcGVmdWxseSB0aGF0IGNhbiB3YWl0IHRob3VnaC4KCkpvbmF0
aGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
