Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A40C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447BD6117A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447BD6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J764XnAP8OWICkxMm/U7mZe9RBY1qz6FvfIPcmzKJ4=; b=euRdDDF8Jhic0pguIZoV+cp/g3
	u3hQjG/0pv+mjYFJZYEl1b3Uzv75LVhnfcjHhoPft05Ot9I21VTrh4se1Ch9V4xwbAxuT68uhZUJH
	vMMKLGSlAwPRJ6XlX/7Mv4gtgYuFpZ0dSuZjFLYrLXSiLv6+axnnt4eKDkjofbIMSpKa8zTwdKt4t
	qSn0K+6o31n8wgeR4/90zvJu7JtKC6p9+Zole0vU4IX+n0kyz0mdEEdyaN5ZxAQFM9/CShhx5oqvC
	3KvVUMk48dtVNBujI7r2KXTthlymceE+rL1hR4U2qCz+h7X7+kI6SpjMKY+ctAmPgC7x9Woxd7USg
	0nLSVhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltoU2-009hUS-Jm; Thu, 17 Jun 2021 09:38:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltoTz-009hSI-CH
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 09:38:45 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G5H3S3CQ5zZhbh;
 Thu, 17 Jun 2021 17:35:32 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 17:38:28 +0800
Received: from [10.174.177.125] (10.174.177.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 17:38:28 +0800
Subject: Re: [PATCH -next] riscv: mm: remove redundant trampoline PGD for 64bit
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>
References: <20210527144819.12101-1-sunnanyong@huawei.com>
From: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development
 Dep)" <sunnanyong@huawei.com>
Message-ID: <a58c4cde-6212-29f3-080a-f4e50221db21@huawei.com>
Date: Thu, 17 Jun 2021 17:38:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527144819.12101-1-sunnanyong@huawei.com>
X-Originating-IP: [10.174.177.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_023843_621448_9E974A25 
X-CRM114-Status: UNSURE (   7.87  )
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

T24gMjAyMS81LzI3IDIyOjQ4LCBOYW55b25nIFN1biB3cm90ZToKCj4gUmVtb3ZlIHJlZHVuZGFu
dCB0cmFtcG9saW5lIFBHRCBmb3IgNjRiaXQgYW5kIGFkZCBtb3JlIGNvbW1lbnQKPiBmb3Igd2h5
IDMyYml0IHN5c3RlbXMgbmVlZCB0cmFtcG9saW5lIFBHRC4KPgo+IFRoZXJlIHdhcyBhIHBhdGNo
IGFuZCBkaXNjdXNzaW9uIHNpbWlsYXIgdG8gdGhpcyxyZWZlciB0bwo+IHRoZSBsaW5rIFsxXVsy
XS4KPgo+IFRoZSB0cmFtcG9saW5lIFBHRCBpcyByZWR1bmRhbnQgZm9yIDY0Yml0IHN5c3RlbXMg
YmVjYXVzZToKPiAxLiBUaGUgZWFybHkgUEdEIGNvdmVycyB0aGUgZW50aXJlIGtlcm5lbCBtYXBw
aW5nLiBEaXJlY3RseQo+IGxvYWRpbmcgZWFybHkgUEdEIGNhbiBhY2hpZXZlIHRoZSByZXN1bHQg
aW4gYm9vdCBzdGFnZS4KPiBBIG1vcmUgdHJhbXBvbGluZSBQR0QgbWFrZXMgY29kZSBoYXJkIHRv
IHVuZGVyc3RhbmQuCj4gMi4gRGlyZWN0bHkgbG9hZGluZyBlYXJseSBQR0QgaXMgc2FmZSBpbiA2
NGJpdCBzeXN0ZW1zIHNpbmNlCj4gdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Mgc3RhcnRzIGFz
IDB4RkZGRnh4eHh4eHh4eHh4eCwKPiB3aGljaCBoYXMgYSB2ZXJ5IGJpZyBnYXAgd2l0aCBSQU0g
YWRkcmVzcy5JdCB3b24ndCBmYWxsIGludG8KPiB0aGUgY29ybmVyIGNhc2UgdGhhdCAzMmJpdCBz
eXN0ZW0gd29ycnlzLgo+IDMuIFJlbW92ZSByZWR1bmRhbnQgdHJhbXBvbGluZSBQR0QgY2FuIGJl
bmVmaXQgdG8gY29kZSBtYWludGFpbmNlLAo+IGJlY2F1c2UgNjRiaXQgc3lzdGVtcyBoYXZlIG1v
cmUgcGFnZSB0YWJsZSBsZXZlbHMuRm9yIGV4YW1wbGU6Cj4gSWYgd2Ugd2FudCB0byBzdXBwb3J0
IFNWNDggd2hpY2ggaGFzIDQgcGFnZSB0YWJsZSBsZXZlbHMsIHdlIGhhdmUKPiB0byBhZGQgYSB0
cmFtcG9saW5lX3B1ZCBhbmQgaW5zZXJ0IGl0IGJlZm9yZSB0cmFtcG9saW5lX3BtZC4KPgo+IFJl
ZmVyZW5jZSBsaW5rOgo+IFsxXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MTkwMzI1MDkyMjM0LjU0NTEtNC1hbnVwLnBhdGVsQHdkYy5jb20vCj4gWzJdaHR0cHM6Ly9sa21s
Lm9yZy9sa21sLzIwMTkvMy8yOC8xNDcKCkxvbmcgdGltZSBubyByZXNwb25zZS4KCkhpIGFudXAs
CgogwqDCoMKgIGRvIHlvdSBhZ3JlZSB0aGlzPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
