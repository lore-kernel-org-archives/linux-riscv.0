Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2117C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 02:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B631720866
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 02:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B631720866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T+rzyDtfvXTdQZiMZ220LpL8S4vWFJmCzP2v2o+NoTk=; b=MloBhes56wCk6Y785zY27EwpO
	bwQBsCG+5WRhKAwYiBN7J+4JlbX5s8jx+XAzxr/yN2qckvI7y+9Se1dAmZGQpAc7Zj+dQ1YFf6pE3
	dAKdQlxAOIyuOYdNaFzbwqjp0iOYbqven7kwAtlJc19SVXNUSU10NGusOWeJrP+mqDANtOfFsWFDp
	0z/eFsKiT7GfiEL4NPaeT2LAA8/TBThxuUa9q5fwzqetXYbwzfTzT8RJRNfRTbPBdf2e+l8XjxL12
	9zSzKo1IFd4qDQB0NO56zJz+lRUUfSfBu4MsEXGDTXa5IlhZo+yjoemEFTWf+d1WRHACZEoWgpxb8
	Sna4naYPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpj8V-0003ff-L9; Thu, 17 Dec 2020 02:35:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpj8S-0003ep-1A
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 02:35:22 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CxGKg4HMtzhsbt;
 Thu, 17 Dec 2020 10:34:31 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 10:34:59 +0800
Subject: Re: [PATCH 0/3] riscv: cover to ARCH_STACKWALK
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <e103e594-d7f5-7a43-6d5d-da538e44b795@huawei.com>
Date: Thu, 17 Dec 2020 10:34:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_213520_326839_ECA4E3BC 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTEvMjEgMTE6MDEsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFRodSwgMTIg
Tm92IDIwMjAgMjI6NDI6MjAgUFNUICgtMDgwMCksIHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29t
IAo+IHdyb3RlOgo+PiBVc2UgdGhlIG5ld2VyIGNvbW1vbiBpbmZyYXN0cnVjdHVyZSBhbmQgc2lt
cGxlciBhcmNoX3N0YWNrX3dhbGsoKSAKPj4gaW50ZXJmYWNlCj4+IGZvciBzdGFjayB3YWxrLgo+
Pgo+PiBLZWZlbmcgV2FuZyAoMyk6Cj4+IMKgIHJpc2N2OiBDbGVhbnVwIHN0YWNrdHJhY2UKPj4g
wqAgcmlzY3Y6IE1ha2Ugc3RhY2sgd2FsayBjYWxsYmFjayBjb25zaXN0ZW50IHdpdGggZ2VuZXJp
YyBjb2RlCj4+IMKgIHJpc2N2OiBFbmFibGUgQVJDSF9TVEFDS1dBTEsKPj4KPj4gwqBhcmNoL3Jp
c2N2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPj4g
wqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrdHJhY2UuaCB8IDE3ICsrKysrKysrCj4+IMKg
YXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9jYWxsY2hhaW4uY8KgIHwgMTAgKy0tLS0KPj4gwqBhcmNo
L3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmPCoMKgwqDCoMKgIHwgNjIgKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPj4gwqA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDU2
IGRlbGV0aW9ucygtKQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3N0YWNrdHJhY2UuaAo+Cj4gVGhhbmtzLCB0aGVzZSBhcmUgb24gZm9yLW5leHQuCgoKaGkg
UGFsbWVyLMKgIEkgZm91bmQgYSBleHRyYSBjb2RlIGFib3V0IGRlbGV0aW5nICJfX0lOSVQiLMKg
IGlzIHRoZXJlIGEgCm1pc3Rha2VuIHdoZW4gbWVyZ2VkIGludG8gZm9yLSBuZXh0PwoKc2VlIGxp
bmsKCmh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3Jpc2N2L2xpbnV4LysvNWNiMDA4MGYxYmZkY2NiNTZkNWMyMjVkMWNkNjQ4Y2RiMzNmYTli
YiU1RSUyMS8jRjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
