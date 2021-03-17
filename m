Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD9BC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 15:22:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619B264EE2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 15:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619B264EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rp6rQACKbbsc9FJs/IhqkgNGpR45NUr8jN0iyNNefXU=; b=Ni3j2Vnq8KgzKVG6JkfFF4/c/
	9XC/fbUjCv/MCChnBp4JfRPxWvRg4cvFG8ZW/NfGvE7yC5msv0Y2+uwz6vwa5ljMjk5cQU85tRxve
	JJLUMYGW4D7AkWQEfRebWkMRnyQDFNowcmrHpY3jNxvlkDIWIN0n0CUn5QIMg1Y5O/dIF/6Eye/YS
	4Pv2EFJJLDOkHbUiczRRNXM763p8OlXaRVJHabUrcp6v7QgUlJGN0DQ/Gw7S05dkSRnOadJ7VNxhf
	Uufb/tF57jNBMKWQe9jSm3be7yAt+F8xrG5qpU9bYtMmaamywuRVgJETpwO4rObRBZb7UvxVS2HNS
	G0QBazUxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMXzO-003Qxp-C8; Wed, 17 Mar 2021 15:21:38 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMXzJ-003QxH-Lp
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 15:21:36 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F0v3F4jnyzkbVt;
 Wed, 17 Mar 2021 23:19:53 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 23:21:22 +0800
Subject: Re: [PATCH] riscv: Drop const annotation for sp
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, <atish.patra@wdc.com>, <palmerdabbelt@google.com>
References: <20210317150838.112021-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <ce5b3533-b75d-c31c-4319-9d29769bbbd5@huawei.com>
Date: Wed, 17 Mar 2021 23:21:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210317150838.112021-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_152134_079427_7202CF24 
X-CRM114-Status: GOOD (  14.87  )
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

SGkgUGFsbWVy77yMIEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0Cgpjb21taXQgNTJlN2M1MmQyZGVk
NTkwOGU2YTRmOGE3MjQ4ZTVmYTZlMGQ2ODA5YQpBdXRob3I6IFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJkYWJiZWx0QGdvb2dsZS5jb20+CkRhdGU6wqDCoCBUaHUgRmViIDI3IDExOjA3OjI4IDIwMjAg
LTA4MDAKCiDCoMKgwqAgUklTQy1WOiBTdG9wIHJlbHlpbmcgb24gR0NDJ3MgcmVnaXN0ZXIgYWxs
b2NhdG9yJ3MgaHVlcmlzdGljcwoKV2h5IGRvIHlvdSBvbmx5IHVzZSBzcF9pbl9nbG9iYWwgZGly
ZWN0bHkgd2hlbiBDT05GSUdfRlJBTUVfUE9JTlRFUiBub3QgCmVuYWJsZWQsCgphbmQga2VlcCB0
aGUgY3VycmVudF9zcCBwYXJ0IHdoZW4gQ09ORklHX0ZSQU1FX1BPSU5URVIgZW5hYmxlZD8KCklm
IHRoZXJlIGFyZSBzcGVjaWFsIHJlYXNvbiwgSSB0aGluayBJIHNob3VsZCByZXZlcnQgdGhlIGRl
YzgyMjc3MWIwMSwgCnRoYW5rcy4KCgpPbiAyMDIxLzMvMTcgMjM6MDgsIEtlZmVuZyBXYW5nIHdy
b3RlOgo+IFRoZSBjb25zdCBhbm5vdGF0aW9uIHNob3VsZCBub3QgYmUgdXNlZCBmb3IgJ3NwJywg
b3IgaXQgd2lsbAo+IGJlY29tZSByZWFkIG9ubHkgYW5kIGxlYWQgdG8gYmFkIHN0YWNrIG91dHB1
dC4KPgo+IEZpeGVzOiBkZWM4MjI3NzFiMDEgKCJyaXNjdjogc3RhY2t0cmFjZTogTW92ZSByZWdp
c3RlciBrZXl3b3JkIHRvIGJlZ2lubmluZyBvZiBkZWNsYXJhdGlvbiIpCj4gU2lnbmVkLW9mZi1i
eTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+IC0tLQo+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gaW5k
ZXggM2Y4OTNjOWQ5ZDg1Li4yYjNlMGNiOTBkNzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3RhY2t0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5j
Cj4gQEAgLTE0LDcgKzE0LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGFzbS9zdGFja3RyYWNlLmg+
Cj4gICAKPiAtcmVnaXN0ZXIgY29uc3QgdW5zaWduZWQgbG9uZyBzcF9pbl9nbG9iYWwgX19hc21f
Xygic3AiKTsKPiArcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBzcF9pbl9nbG9iYWwgX19hc21fXygi
c3AiKTsKPiAgIAo+ICAgI2lmZGVmIENPTkZJR19GUkFNRV9QT0lOVEVSCj4gICAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
