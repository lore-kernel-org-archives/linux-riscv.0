Return-Path: <SRS0=1I3Q=NO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB4FC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 02:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3766124D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 02:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A3766124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lir2n5XABnpZwKV5XG9dXDvPTeE6HknRquf9gab+v0g=; b=Vup1iO9OkY4EUABoHymn+fXOgd
	QLdmDCLqQmaToTODvhCyYrunqNWicn2GAQzoD3F5EemK6wHNpleQ6QAO2C+BEO1HtPOm+7YMTWx65
	R5fzuMrZzI3R3qDSxfapBQnTz38aAE9Mynnxu+fv/OcE4pXwkcH2ig0U7M8AFQN2VyQSMYf63SlKF
	/uryra0IMx6+tSkhoQq0IDzBcniBGC50X127zUZSgso7SGbueUj5Iu9sLo5JFzo0bW0crCFmKlMJ3
	Pni3STHtmLmOAg5JT5QJ3bGyGbjDKUCaIhs4BtizPCT24qf2/qSU4ocObPUtvPacSw0DQb/npTHJr
	0Luw+83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHzIy-00FAlV-Kh; Mon, 23 Aug 2021 02:03:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHzIt-00FAir-Fe
 for linux-riscv@lists.infradead.org; Mon, 23 Aug 2021 02:03:15 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GtFm45q3KzbdNk;
 Mon, 23 Aug 2021 09:59:16 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 10:02:41 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 10:02:40 +0800
Subject: Re: [PATCH -next v2 0/3] riscv: Fix two vdso issue
To: Tong Tiangen <tongtiangen@huawei.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Palmer
 Dabbelt" <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210820125042.1844629-1-tongtiangen@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <0fa49162-18c2-0643-7495-86f2c891a285@huawei.com>
Date: Mon, 23 Aug 2021 10:02:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210820125042.1844629-1-tongtiangen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_190311_729403_9D126F8E 
X-CRM114-Status: GOOD (  12.20  )
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

Ck9uIDIwMjEvOC8yMCAyMDo1MCwgVG9uZyBUaWFuZ2VuIHdyb3RlOgo+IHYyLT52MToKPiAgIEFk
ZCBwYXRjaCAiUmVmYWN0b3IgYXNtL3Zkc28uaCIgdG8gYXZvaWQgdmRzby5sZHMgc3ludGF4IGVy
cm9yIGlmCj4gICBDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPW4uCgpUaGlzIGlzIGJldHRl
ciB0aGFuIHYxLgoKPgo+IDEpIFJlZmFjdG9yIHRoZSBhc20vdmRzby5oIHRvIGF2b2lkIHZkc28u
bGRzIHN5bnRheCBlcnJvci4KPgo+IDIpIE1vdmUgdmRzbyBkYXRhIHBhZ2UgdXAgZnJvbnQKTW92
ZcKgIHZkc28gZGF0YSBwYWdlIGJlZm9yZSBjb2RlIHBhZ2UgY291bGQgc2F2ZSB0aGUgcHJvYmxl
bSB3aGljaCB0aGUgCi50ZXh0CgpzZWN0aW9uIGNvdWxkIGJlIGJpZ2dlciB0aGFuIFBBR0VfU0la
RS4KCj4gYW5kIGludHJvZHVjZSBlbnVtIHZ2YXJfcGFnZXMsIFRvIHBhdmUgdGhlCj4gd2F5IGZv
ciB0aGUgc3Vic2VxdWVudCBzdXBwb3J0IG9mIFRJTUVfTlMsIHRoZSBzdXBwb3J0IG9mIFRJTUVf
TlMgd2lsbCBiZQo+IGlzc3VlZCBpbiB0aGUgbGF0ZXIgcGF0Y2guClRoaXMgbWFrZXMgaXQgZWFz
aWVyIHRvIGludHJvZHVjZSBuZXcgZmVhdHVyZXMgVElNRV9OUy4KCj4KPiAzKSBJbiBhcmNoX3Nl
dHVwX2FkZGl0aW9uYWxfcGFnZXMoKSwgbWFrZSBXYWl0IGZvciB0aGUgbG9jayBpbiB0aGUKPiBr
aWxsYWJsZSBtb2RlIGFuZCByZXR1cm4gd2l0aCBFSU5UUiBpZiB0aGUgdGFzayBnb3Qga2lsbGVk
IHdoaWxlIHdhaXRpbmcuCkZvciBzZXJpZXMsCgpSZXZpZXdlZC1ieTogS2VmZW5nIFdhbmcgPHdh
bmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+IFRvbmcgVGlhbmdlbiAoMyk6Cj4gICAgcmlzY3Yv
dmRzbzogUmVmYWN0b3IgYXNtL3Zkc28uaAo+ICAgIHJpc2N2L3Zkc286IE1vdmUgdmRzbyBkYXRh
IHBhZ2UgdXAgZnJvbnQKPiAgICByaXNjdi92ZHNvOiBtYWtlIGFyY2hfc2V0dXBfYWRkaXRpb25h
bF9wYWdlcyB3YWl0IGZvciBtbWFwX3NlbSBmb3IKPiAgICAgIHdyaXRlIGtpbGxhYmxlCj4KPiAg
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3lzY2FsbC5oICB8ICAxICsKPiAgIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdmRzby5oICAgICB8IDEwICsrLS0tLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwv
c3lzY2FsbF90YWJsZS5jIHwgIDEgLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jICAgICAg
ICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAgYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby92ZHNvLmxkcy5TIHwgIDMgKy0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
