Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0356C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 02:54:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0796113E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 02:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF0796113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YSkZBq9GHDt4fkd1dTKTHZo7ALfWx8i2jTejhTfKZMg=; b=yZGX704b9FhXBZBgnca2y0ozQe
	5c/F0i+MeUG5H5uvC3xrItjhdqzfUHyYweInbFSQAj+BC3MaaEdh/puMH6mzTJl7fFlzG4QwofJma
	oIZKqU9HqQVNt624sCqlmP1rySouChNJneD4r14NJ+AzWTdfi/JoMyO3+TCpmz/TF/ZW4hy6PaAc5
	IQ21e3DTP6RiZ09zIUGX5H9unjfw+sLp63UnBlqoqBI8f7DaiQSDi+3quAB6Rn8dPFF3y+Ecxr6im
	9ejvSrLHQphOsCqQxh6620+koEjNbHJE+NNLYuMiwtKzFSL3wRftIQAIU7XukUQ9ZydmL7GBQ4x+J
	V0eIjNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQhXS-00ADZD-LW; Thu, 16 Sep 2021 02:54:14 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQhXP-00ADXo-Au
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 02:54:13 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H91qW1gRwz8snt;
 Thu, 16 Sep 2021 10:53:27 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 10:54:05 +0800
Received: from [10.174.177.134] (10.174.177.134) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 16 Sep 2021 10:54:04 +0800
Subject: Re: [SPAM] [PATCH 0/2] riscv: improve unaligned memory accesses
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Darius Rad <darius@bluespec.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20210913121956.1776656-1-chenhuang5@huawei.com>
 <20210915221353.634c6a78@xhacker>
From: Chen Huang <chenhuang5@huawei.com>
Message-ID: <4d5f812d-88b8-313c-7293-89fd033b9ea5@huawei.com>
Date: Thu, 16 Sep 2021 10:54:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210915221353.634c6a78@xhacker>
X-Originating-IP: [10.174.177.134]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_195411_584991_55AAEE16 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGlrZSBBUk2jrHBvd2VycGMgYW5kIG02OEujrHNvbWUgQ1BVcyBkb24ndCBzdXBwb3J0IHRoZSB1
bmFsaWduZWQgbWVtb3J5IGFjY2VzcywKb2ZmZXIgdGhpcyBhcyBhbiBvcHRpb24gdGhhdCBDUFUg
Y2FuIGNob29zZSBpdCBkZXBlbmRpbmcgb24gaXRzIG93biBkZXNpZ24uIEkgd2lsbApzZW5kIHYy
IHNvb24uCgrU2iAyMDIxLzkvMTUgMjI6MTMsIEppc2hlbmcgWmhhbmcg0LS1wDoKPiBPbiBNb24s
IDEzIFNlcCAyMDIxIDEyOjE5OjU0ICswMDAwCj4gQ2hlbiBIdWFuZyA8Y2hlbmh1YW5nNUBodWF3
ZWkuY29tPiB3cm90ZToKPiAKPj4gVGhlIFJJU0NWIElTQSBjYW4gc3VwcG9ydCB1bmFsaWduZWQg
bWVtb3J5IGFjY2Vzc2VzLCBzbyB0aGUgcGF0Y2hzZXQKPj4gc2VsZWN0cyBIQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTIGFuZCBzdXBwb3J0cyBEQ0FDSEVfV09SRF9BQ0NFU1MKPiAKPiBO
TywgcGVyIHRoZSBzcGVjLCAiRXZlbiB3aGVuIG1pc2FsaWduZWQgbG9hZHMgYW5kIHN0b3JlcyBj
b21wbGV0ZQo+IHN1Y2Nlc3NmdWxseSwgdGhlc2UgYWNjZXNzZXMgbWlnaHQgcnVuIGV4dHJlbWVs
eSBzbG93bHkgZGVwZW5kaW5nIG9uIHRoZQo+IGltcGxlbWVudGF0aW9uIi4gaXQncyBmYXIgYXdh
eSBmcm9tICJlZmZpY2llbnQiCj4gCj4+IHRvIGltcHJvdmUgdGhlIGVmZmljaWVuY3kgb2YgdW5h
bGlnbmVkIG1lbW9yeSBhY2Nlc3Nlcy4KPj4KPj4gQ2hlbiBIdWFuZyAoMik6Cj4+ICAgcmlzY3Y6
IEtjb25maWc6IHNlbGVjdCBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4+ICAgcmlz
Y3Y6IFN1cHBvcnQgRENBQ0hFX1dPUkRfQUNDRVNTCj4+Cj4+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS93
b3JkLWF0LWEtdGltZS5oIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMiBmaWxl
cyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4+Cj4gCj4gCj4gLgo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
