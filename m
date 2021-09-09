Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F9FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 00:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F184B61132
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 00:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F184B61132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsT0Z8CnOn3rsPxwpZbNaGGYPLrhZGKXTLJr90Zsrnk=; b=n5UCXieaf92cRmbpeTmPzEMDXv
	4yXsIGvVUShNK2ryuphszXIDiSHy5cU1LSldMn5yg7fw4XRTIc/svxYMIPwiLCwfxNxJiRLAv19x0
	wc4MbD/hFT0Y+FbLRFlzT+upk8qOn/bzb5BFDCZEFzJRauaqPI5hqdIm3urLJHXqGFNqF77hczjzI
	ZMXOcif/jcAzavCa/3Tp/U/vrFCUjI1/CqxmvBdcmhUcm9EDv/iUUyt7wCYykyvmYDsG6y01RMABj
	pHveogckhS78NsPt10/w9x6w/nhI+0a28PLnLUiu20tTXR5gU2IIdw1wQ7VyCSKZqfRy20zCf5U0k
	AT12kDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO8Oo-007sn6-AD; Thu, 09 Sep 2021 00:58:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO8Ok-007sl7-JT
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 00:58:40 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H4gb81MJXz1DGRh;
 Thu,  9 Sep 2021 08:57:40 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 08:58:32 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 08:58:31 +0800
Subject: Re: [PATCH] riscv: enable GENERIC_FIND_FIRST_BIT
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210718001423.6b8e1d23@xhacker> <20210908230427.3a92fb87@xhacker>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <bbd220c4-b535-d024-6bd3-b620b4702ed3@huawei.com>
Date: Thu, 9 Sep 2021 08:58:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210908230427.3a92fb87@xhacker>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_175838_853425_F77AC787 
X-CRM114-Status: GOOD (  13.60  )
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

Ck9uIDIwMjEvOS84IDIzOjA0LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEhpIFBhbG1lciwKPgo+
IE9uIFN1biwgMTggSnVsIDIwMjEgMDA6MTQ6MjMgKzA4MDAKPiBKaXNoZW5nIFpoYW5nIHdyb3Rl
Ogo+Cj4+IEZyb206IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4KPj4gcmlz
Y3YgZG9lc24ndCBpbXBsZW1lbnQgYXJjaGl0ZWN0dXJlLW9wdGltaXplZCBiaXRzZWFyY2hpbmcg
ZnVuY3Rpb25zCj4+IHN1Y2ggYXMgZmluZF9maXJzdF97emVyb31fYml0KCkgZXRjLgo+Pgo+PiBX
aGVuIEdFTkVSSUNfRklORF9GSVJTVF9CSVQ9biwgZmluZF9maXJzdF9iaXQoKSBpcyBpbXBsZW1l
bnRlZCB3aXRoCj4+IGZpbmRfbmV4dF9iaXQoKSB3aGljaCBpcyBsZXNzIGVmZmljaWVudC4gRW5h
YmxlIEdFTkVSSUNfRklORF9GSVJTVF9CSVQKPj4gZm9yIHJpc2N2IHRvIGdldCBtb3JlIG9wdGlt
aXplZCBmaW5kX2ZpcnN0X2JpdCgpIGltcGxlbWVudGF0aW9uLCBhbgo+PiBpbml0aWFsIHRlc3Qo
bGliL2ZpbmRfYml0X2JlbmNobWFyaykgc2hvd3MgZmluZF9maXJzdF9iaXQoKSBwZXJmb3JtYW5j
ZQo+PiBpcyBpbXByb3ZlZCBieSBuZWFybHkgMzIlLgo+IEl0IHNlZW1zIHRoaXMgcGF0Y2ggaXMg
bWlzc2VkLiBJcyBpdCBwb3NzaWJsZSB0byBwaWNrIGl0IHVwIGZvciAybmQgNS4xNS1yYzEgUFI/
Cj4KPiBUaGFua3MKCkl0IGlzIGVuYWJsZWQgdW5jb25kaXRpb25hbGx5IGJ5IGZvbGxvd2luZyBj
b21taXQKCmNvbW1pdCBkYmJjY2ZlNTA1ZWY4ZmFlODA0Njc3YWJmMDU2NGMxZTA3NDc5MTAyCgpB
dXRob3I6IFl1cnkgTm9yb3YgPHl1cnkubm9yb3ZAZ21haWwuY29tPgpEYXRlOsKgwqAgVHVlIEF1
ZyAyNCAwOTo1OTo1NiAyMDIxICsxMDAwCgogwqDCoMKgIGFyY2g6IHJlbW92ZSBHRU5FUklDX0ZJ
TkRfRklSU1RfQklUIGVudGlyZWx5Cgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSAr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggOGZjY2ViOGVk
YTA3Li43ZWJjNTRjNWMyNDUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiAr
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTQ3LDYgKzQ3LDcgQEAgY29uZmlnIFJJU0NW
Cj4+ICAgCXNlbGVjdCBHRU5FUklDX0FUT01JQzY0IGlmICE2NEJJVAo+PiAgIAlzZWxlY3QgR0VO
RVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QgaWYgU01QCj4+ICAgCXNlbGVjdCBHRU5FUklDX0VB
UkxZX0lPUkVNQVAKPj4gKwlzZWxlY3QgR0VORVJJQ19GSU5EX0ZJUlNUX0JJVAo+PiAgIAlzZWxl
Y3QgR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWYgSEFWRV9HRU5FUklDX1ZEU08KPj4gICAJc2VsZWN0
IEdFTkVSSUNfSU9SRU1BUAo+PiAgIAlzZWxlY3QgR0VORVJJQ19JUlFfTVVMVElfSEFORExFUgo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
