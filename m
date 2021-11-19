Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A93EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 08:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0287E61A55
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 08:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0287E61A55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uBgohrSrX02iDBTLAh5vWurIljyWydYabuwlQsd8us=; b=1BUASR359QYnPF
	zOs1q4Rkvh3CmgicUzV0Exgi2vPL8iIvlUlbnyNQrm3GIRD0l1ZH5lMUmUMl9Z9lr2IZ+0MA8K99r
	lI8/o5M4pskhgldiAAlm8WY2WYi5L3JOa5drR55nyvZxblWk14QgI7djD2KTX2TB05xtdl+c2KP/E
	G2x/2wvrM1QPj6P+hPjjLLHVgYYawgCLpkjHy0EiGdFOIXYxfmr8PcRtbsJP6XUxupjLUMxr9WjKx
	kIB+a1XWfiPptTwSl4NXIzHhihkkRi4o0mLyXpTxcoklkJNBXk0LID9FCjZFltUFPi8jATcS4Ityc
	PqSQKlPdfXoN+fZ5kHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnz2e-009iqr-Cb; Fri, 19 Nov 2021 08:14:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnz2Q-009iml-SK
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 08:14:28 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HwTsQ6cgVzZd8k;
 Fri, 19 Nov 2021 16:11:54 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 19 Nov 2021 16:14:20 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Fri, 19 Nov 2021 16:14:20 +0800
Message-ID: <ee556125-4ac7-f93b-4996-26b21783dff7@huawei.com>
Date: Fri, 19 Nov 2021 16:14:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] riscv: mm: Enable PMD split page table lock for RV64
Content-Language: en-US
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
 <palmerdabbelt@google.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>
References: <20210927030325.167313-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20210927030325.167313-1-wangkefeng.wang@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_001427_177191_E5DFE6DE 
X-CRM114-Status: GOOD (  12.25  )
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

SGkgUGFsbWVyLMKgIHBpbmcsIGl0IGxvb2tzIHRoaXMgcGF0Y2ggaXMgbWlzc2VkLi4uCgpPbiAy
MDIxLzkvMjcgMTE6MDMsIEtlZmVuZyBXYW5nIHdyb3RlOgo+IEFmdGVyIGNvbW1pdCAxMzU1YzMx
ZWViN2UgKCJhc20tZ2VuZXJpYzogcGdhbGxvYzogcHJvdmlkZSBnZW5lcmljCj4gcG1kX2FsbG9j
X29uZSgpIGFuZCBwbWRfZnJlZV9vbmUoKSIpLCB0aGUgbWFpbiBwYXJ0IHRvIHN1cHBvcnQKPiBQ
TUQgc3BsaXQgcGFnZSB0YWJsZSBsb2NrIGlzIGluIGFzbS1nZW5lcmljL3BnYWxsb2MuaC4KPgo+
IFRoZSBvbmx5IGNoYW5nZSBpcyBhZGQgcGd0YWJsZV9wbWRfcGFnZV9jdG9yKCkgaW50byBhbGxv
Y19wbWRfbGF0ZSgpLAo+IHRoZW4gd2UgY291bGQgZW5hYmxlIEFSQ0hfRU5BQkxFX1NQTElUX1BN
RF9QVExPQ0sgZm9yIFJWNjQuCj4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
QGdoaXRpLmZyPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdA
aHVhd2VpLmNvbT4KPiAtLS0KPiB2MjoKPiAtIHJlYmFzZSB0byB2NS4xNS1yYzMsIHVwZGF0ZSBj
aGFuZ2Vsb2csIGFuZCBhZGQgUkIKPgo+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgfCAxICsKPiAg
IGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMyArKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29u
ZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggMzAxYTU0MjMzYzdlLi41YzQ0NjNmMzBl
YjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9L
Y29uZmlnCj4gQEAgLTE0LDYgKzE0LDcgQEAgY29uZmlnIFJJU0NWCj4gICAJZGVmX2Jvb2wgeQo+
ICAgCXNlbGVjdCBBUkNIX0NMT0NLU09VUkNFX0lOSVQKPiAgIAlzZWxlY3QgQVJDSF9FTkFCTEVf
SFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhVR0VUTEJfUEFHRSAmJiBNSUdSQVRJT04KPiArCXNlbGVj
dCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4gMgo+ICAg
CXNlbGVjdCBBUkNIX0hBU19CSU5GTVRfRkxBVAo+ICAgCXNlbGVjdCBBUkNIX0hBU19ERUJVR19W
TV9QR1RBQkxFCj4gICAJc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZJUlRVQUwgaWYgTU1VCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBp
bmRleCBjMGNkZGYwZmMyMmQuLjFmMjEzNzViYTg2ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTM2Nyw3ICszNjcs
OCBAQCBzdGF0aWMgcGh5c19hZGRyX3QgX19pbml0IGFsbG9jX3BtZF9sYXRlKHVpbnRwdHJfdCB2
YSkKPiAgIAl1bnNpZ25lZCBsb25nIHZhZGRyOwo+ICAgCj4gICAJdmFkZHIgPSBfX2dldF9mcmVl
X3BhZ2UoR0ZQX0tFUk5FTCk7Cj4gLQlCVUdfT04oIXZhZGRyKTsKPiArCUJVR19PTighdmFkZHIg
fHwgIXBndGFibGVfcG1kX3BhZ2VfY3Rvcih2aXJ0X3RvX3BhZ2UodmFkZHIpKSk7Cj4gKwo+ICAg
CXJldHVybiBfX3BhKHZhZGRyKTsKPiAgIH0KPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
