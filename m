Return-Path: <SRS0=cdG+=H2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E5C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 11:13:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AFA64E83
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 11:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AFA64E83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kKFLWKwR3t2v04FGuycmJ1HpoWqDH12/I/vJ1Y3jJFQ=; b=JTzfYdt+w7+VolaXzEYcOK7Nll
	yj9LzbqLCsk46luacad+cEAo5e9oJxxvrCMSjz6NLpqTPv4BmTtnLgV+cumerwIIxWboA2Xrf/vvY
	8WEr71KQfk4PGcyXcmFv0Yq5YQAIop8w78KwlmuPp6ElEJQGKAaUFiWEUjF6ORkXI3IFTzc0xUZCN
	qzyJw3qkL6b+VRkQp7n1124d2Piu34/FvQIAzKbGVuMlFUb1QAviL4ERKAsT79FDaXg2R6iqyoZxR
	DThuW5EWHdtVcsb/fYWS0Zn6T6eTgnO45cj2hLgMF87UCJBC5f+77p3jVAY+tV0ulqs+6IQRYuIl7
	sLNQ5vdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEs6v-0003mL-9J; Wed, 24 Feb 2021 11:13:41 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEs6s-0003jI-5M
 for linux-riscv@lists.infradead.org; Wed, 24 Feb 2021 11:13:39 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DltXx2CfxzjQ5Y;
 Wed, 24 Feb 2021 19:12:01 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Feb 2021 19:13:17 +0800
To: <atish.patra@wdc.com>, <ardb@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: question about RISCV EFI stub support
Message-ID: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
Date: Wed, 24 Feb 2021 19:13:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_061338_498212_9303F7CB 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXRpc2ggYW5kIEFyZCwKClRoZSBjb21taXQgImNiN2QyZGQ1NjEyYSBSSVNDLVY6IEFkZCBQ
RS9DT0ZGIGhlYWRlciBmb3IgRUZJIHN0dWIiIHVzZSAKYy5saSB0bwoKYWRkIE1hZ2ljICJNWiIg
c2lnbmF0dXJlIGZvciBQRS9DT0ZGIGhlYWRlciwgd2hpY2ggc2VsZWN0IFJJU0NWX0lTQV9DLCAK
YnV0ICJDIgoKdG8gdGhlIElTQSBpcyBvcHRpb25hbCzCoCBhbmQgaWYgIkMiIGlzIG5vdCBzdXBw
b3J0ICzCoCBFRkkgYm9vdCBpcyBub3QgCnN1cHBvcnRlZC4KCkNvdWxkIHdlIHVzZSAiLndvcmQg
TVpfTUFHSUMiIGxpa2UgeDg2IGNvZGUgb3Igc29tZSBvdGhlciB3YXkgdG8gc3VwcG9ydCAKIk1a
IiBzaWduYXR1cmU/CgpUaGFua3MsCgpLZWZlbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
