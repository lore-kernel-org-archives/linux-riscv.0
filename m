Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD49C07E99
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 06:43:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A9F61CD1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 06:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A9F61CD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU8uwKY6smRmu6YeH6TDHr4SIIQ29esIdZxecPtZw8o=; b=mCxeEoAqG2MUOhpMknY44BieAM
	50dhnoRYrtL6XJm5v5flfXu1rxa6CEaen0zw6j4XW5js6bzIvIN6n9ow9XcM0JLS1yQCMWOMq7tRP
	KbD36ycKArYzv2bwpyr1geA5qACytc0jSgCKTVtNC5nvjY9mcHxHN5JdrXTKs1apGPm1xUOwX2Fd2
	ipxLgkR+Vtq5rlv+rm4DgdcLY56uvQBpfErw81GG8SZ5Q4hSMnyfQxF0P45QogU/Zl7bCoxWmTOMx
	EzXJz45luxyTbdxlu1egawqnKZlYs5RAR7yZYGAou1BW8ZokQ21JfPynoY/kiY6L/d37ebra5Eoq2
	b/nVylSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1NkN-00GA2D-1Y; Thu, 08 Jul 2021 06:42:55 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1NkK-00GA1o-9i
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 06:42:54 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GL68l0jdnzZpTg;
 Thu,  8 Jul 2021 14:39:35 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 14:42:47 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 14:42:46 +0800
Subject: Re: [PATCH 1/3] riscv: Allow forced irq threading
To: Christoph Hellwig <hch@infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
References: <20210708015949.20076-1-wangkefeng.wang@huawei.com>
 <20210708015949.20076-2-wangkefeng.wang@huawei.com>
 <YOaM9bfqZiU386T7@infradead.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <231ce61f-1af6-dea0-bcdb-a8de3c42a3fa@huawei.com>
Date: Thu, 8 Jul 2021 14:42:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YOaM9bfqZiU386T7@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_234252_631013_C66AB678 
X-CRM114-Status: GOOD (  11.50  )
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

Ck9uIDIwMjEvNy84IDEzOjI4LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBUaHUsIEp1
bCAwOCwgMjAyMSBhdCAwOTo1OTo0N0FNICswODAwLCBLZWZlbmcgV2FuZyB3cm90ZToKPj4gVGhl
IHRpbWVyIGludGVycnVwdCBhbmQgdGhlIHBlcmYgaW50ZXJydXB0IG9uIHJpc2N2IGFyZSB3aXRo
Cj4+IElSUUZfUEVSQ1BVLCBzbyBpdCdzIHNhZmUgdG8gYWxsb3cgZm9yY2VkIGludGVycnVwdCB0
aHJlYWRpbmcuCj4gIkFyY2hpdGVjdHVyZSBjb2RlIG5lZWRzIHRvIHNlbGVjdCBDT05GSUdfSVJR
X0ZPUkNFRF9USFJFQURJTkcgYWZ0ZXIKPiAgIG1hcmtpbmcgdGhlIGludGVycnVwdHMgd2hpY2gg
Y2FudCBiZSB0aHJlYWRlZCBJUlFGX05PX1RIUkVBRC4KPiAgIEFsbCBpbnRlcnJ1cHRzIHdoaWNo
IGhhdmUgSVJRRl9USU1FUiBzZXQgYXJlIGltcGxpY3QgbWFya2VkCj4gICBJUlFGX05PX1RIUkVB
RC4gQWxzbyBhbGwgUEVSX0NQVSBpbnRlcnJ1cHRzIGFyZSBleGNsdWRlZC4iCj4KPiBEaWQgeW91
IGRvIHRoYXQgYXVkaXQ/CgpZZXMsIEkgY2hlY2sgdGhlIHBlcmYgYW5kIHRpbWVyIG9uIFJJU0NW
LAoKYXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9ldmVudC5jCgpzdGF0aWMgaW50IHJlc2VydmVfcG1j
X2hhcmR3YXJlKHZvaWQpCgp7CgogwqBlcnIgPSByZXF1ZXN0X2lycShyaXNjdl9wbXUtPmlycSwg
cmlzY3ZfcG11LT5oYW5kbGVfaXJxLAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJUlFGX1BFUkNQVSwgInJpc2N2LWJhc2Ut
cGVyZiIsIE5VTEwpOwoKfQoKZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCgpzdGF0
aWMgaW50IF9faW5pdCByaXNjdl90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbikK
CnsKCiDCoMKgwqAgZXJyb3IgPSByZXF1ZXN0X3BlcmNwdV9pcnEocmlzY3ZfY2xvY2tfZXZlbnRf
aXJxLApyaXNjdl90aW1lcl9pbnRlcnJ1cHQsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJyaXNjdi10aW1lciIsICZyaXNj
dl9jbG9ja19ldmVudCk7Cgp9CgpJcyB0aGlzIGVub3VnaD8KPiAuCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
