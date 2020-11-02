Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE27BC00A89
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 07:27:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC13221FF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 07:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQ8RQzKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC13221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jJDepVPvTzSHnvZ57APpg1thT7GtG5CKDff9UY3csNY=; b=iQ8RQzKgs7thMNudRAaE0maGV
	9BrekUShAElJCixVkbsd7y7iu66tZIqL8qndw/D0f07VMIOWvaTQnGlG6uuj9KUqJalo/QpIGkiCv
	mAuvOIP01qFRqDagAMIEQFqEVnUWcqka45wehadcPHYUOUej9P1CxgiJRuD5iqV3kQuQKKB3QyDHr
	3754m9gAkcGSK3bK2bhTAkPciWEtkQG3Yt801RjjsXxIpxZMrTc8yfIoC9aENd7Qw+9iN9upTOuyE
	O0zuEoff5jbYMqewRxYA8+tfiIGCg5IuyCvlSXowXX1m569yJvlfZNAV9w8mZ9E3xzlHvsxMERfoV
	L0rB+wwNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUFQ-0006lW-P4; Mon, 02 Nov 2020 07:27:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUFJ-0006kb-M4
 for linux-riscv@lists.infradead.org; Mon, 02 Nov 2020 07:27:22 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPky75lySz15PWh;
 Mon,  2 Nov 2020 15:27:11 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 15:27:12 +0800
Subject: Re: [PATCH 3/3] riscv: Ignore all compressed Image formats
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
 <20201102040357.118400-3-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <35efc7af-dd90-a1b5-b363-9dbb8d7ce4a8@huawei.com>
Date: Mon, 2 Nov 2020 15:27:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201102040357.118400-3-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_022720_962874_9173BDAD 
X-CRM114-Status: GOOD (  12.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Ck9uIDIwMjAvMTEvMiAxMjowMywgS2VmZW5nIFdhbmcgd3JvdGU6Cj4gRG8gbm90IHRyYWNrIGFs
bCBjb21wcmVzc2VkIEltYWdlIGZvcm1hdHMuCnNob3VsZCBhZGQgYWxsIGxvYWRlci4qIHRvbywg
ZWcgbG9hZGVyLmJpbizCoCB3aWxsIHJlc2VuZCBhZnRlciBhbGwgCnBhdGNoZXMgcmV2aWV3ZWQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5j
b20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2Jvb3QvLmdpdGlnbm9yZSB8IDIgKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC8uZ2l0aWdub3JlIGIvYXJjaC9yaXNjdi9ib290Ly5naXRpZ25vcmUK
PiBpbmRleCA1NzRjMTBmOGZmNjguLjJhMzFhNjFjYTM4MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2Jvb3QvLmdpdGlnbm9yZQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC8uZ2l0aWdub3JlCj4g
QEAgLTEsNSArMSw1IEBACj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKPiAgIEltYWdlCj4gLUltYWdlLmd6Cj4gK0ltYWdlLioKPiAgIGxvYWRlcgo+ICAgbG9hZGVy
LmxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
