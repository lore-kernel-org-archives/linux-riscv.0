Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6317BC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA9260F00
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAA9260F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeVznmcXocWRTAwHg4+puCjfHuF3WGc78iRTYv3Xy8o=; b=ubwvNpZi+EX1Rbect+HvCR1gj3
	TC0vS6xteUQF5JkT6ccfkB06qqbaVHIhZ2rYqeu1EjDrnxj0Y243nxBs4d+4kRM7RtYrZKIR+uARu
	c7eNvM4PBi0QszJJKJjXJmH2hlKxndNWvEG4ybVTjopqvVt1vgbcG8EhPY1ErFeyZ/16la0Dyui2u
	jm9E8vcan5oOTz0GqUpUPRkWlmuoeWJG4gTaP2eOmo7JagWWHIRH0wKBU1NWRd/deq6k4E+x8Nk1c
	7iRGXl90Mj6R0JgXeP+nxM/hFw38zE/K+dnV0EV41vHipeumupmDeBIDSuReOWKiTSCw6wiPvlD6A
	6Jr+VJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dtm-00HMV8-2y; Wed, 28 Jul 2021 07:22:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dtd-00HMPK-Ub
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 07:22:31 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZQ276VbKzYhPw;
 Wed, 28 Jul 2021 15:16:31 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 15:22:16 +0800
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 15:22:13 +0800
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
From: Hanjun Guo <guohanjun@huawei.com>
To: Kenneth Lee <nek.in.cn@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel
 <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, Kenneth Lee
 <liguozhu@hisilicon.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Vitaly
 Wool" <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 "Jisheng Zhang" <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>, Nick
 Kossifidis <mick@ics.forth.gr>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <wangzhou1@hisilicon.com>
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
 <0b813cde-ca37-9b83-c0c5-ce9f6b8eab3c@huawei.com>
Message-ID: <27b3ce52-5d88-90e3-8509-c032bda1f559@huawei.com>
Date: Wed, 28 Jul 2021 15:22:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0b813cde-ca37-9b83-c0c5-ce9f6b8eab3c@huawei.com>
Content-Language: en-GB
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_002230_391337_EAC35BD4 
X-CRM114-Status: GOOD (  15.40  )
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

T24gMjAyMS83LzI4IDE1OjEzLCBIYW5qdW4gR3VvIHdyb3RlOgo+IE9uIDIwMjEvNy8yOCAxNDo0
MywgS2VubmV0aCBMZWUgd3JvdGU6Cj4+IEZyb206IEtlbm5ldGggTGVlIDxsaWd1b3podUBoaXNp
bGljb24uY29tPgo+Pgo+PiBSSVNDViB1c2UgYSBnbG9iYWwgdmFyaWFibGUgcGZuX2Jhc2UgZm9y
IHBhZ2UvcGZuIHRyYW5zbGF0aW9uLiBCdXQgdGhpcwo+PiBpcyBhIGNvbW1vbiBuYW1lIGFuZCB3
aWxsIGJlIHVzZWQgZWxzZXdoZXJlLiBJbiB0aG9zZSBjYXNlLAo+PiB0aGUgcGFnZS1wZm4gbWFj
cm8gd2hpY2ggcmVmZXIgdGhpcyBuYW1lIHdpbGwgcmVmZXIgdG8gdGhlIGxvY2FsL2lucHV0Cj4+
IHZhcmlhYmxlIG9mIHRob3NlIGZ1bmN0aW9uIChzdWNoIGFzIGluIHZmaW9fcGluX3BhZ2VzX3Jl
bW90ZSkuIFRoaXMgbWFrZQo+PiBldmVyeXRoaW5nIHdyb25nLgo+Pgo+PiBUaGlzIHBhdGNoIGNo
YW5nZSB0aGUgbmFtZSBmcm9tIHBmbl9iYXNlIHRvIHJpc2N2X2dsb2JhbF9wZm5fYmFzZSB0byBm
aXgKPj4gdGhpcyBwcm9ibGVtCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlbm5ldGggTGVlIDxsaWd1
b3podUBoaXNpbGljb24uY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
YWdlLmggfCA0ICsrLS0KPj4gwqAgYXJjaC9yaXNjdi9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKg
wqAgfCA2ICsrKy0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFn
ZS5oIAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4+IGluZGV4IGNjYTg3NjRh
ZWQ4My4uODcxMWU0MTVmMzdjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BhZ2UuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+PiBAQCAtNzks
OCArNzksOCBAQCB0eXBlZGVmIHN0cnVjdCBwYWdlICpwZ3RhYmxlX3Q7Cj4+IMKgICNlbmRpZgo+
PiDCoCAjaWZkZWYgQ09ORklHX01NVQo+PiAtZXh0ZXJuIHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7
Cj4+IC0jZGVmaW5lIEFSQ0hfUEZOX09GRlNFVMKgwqDCoMKgwqDCoMKgIChwZm5fYmFzZSkKPj4g
K2V4dGVybiB1bnNpZ25lZCBsb25nIHJpc2N2X2dsb2JhbF9wZm5fYmFzZTsKPj4gKyNkZWZpbmUg
QVJDSF9QRk5fT0ZGU0VUwqDCoMKgwqDCoMKgwqAgKHJpc2N2X2dsb2JhbF9wZm5fYmFzZSkKPj4g
wqAgI2Vsc2UKPj4gwqAgI2RlZmluZSBBUkNIX1BGTl9PRkZTRVTCoMKgwqDCoMKgwqDCoCAoUEFH
RV9PRkZTRVQgPj4gUEFHRV9TSElGVCkKPj4gwqAgI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMK
Pj4gaW5kZXggYTE0YmYzOTEwZWVjLi4yY2U0ZTlhNDZjYTAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IEBAIC0yMjgs
OCArMjI4LDggQEAgc3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgX3B0X29wcyBfX2luaXRkYXRh
Owo+PiDCoCAjZGVmaW5lIHB0X29wcyBfcHRfb3BzCj4+IMKgICNlbmRpZgo+PiAtdW5zaWduZWQg
bG9uZyBwZm5fYmFzZSBfX3JvX2FmdGVyX2luaXQ7Cj4+IC1FWFBPUlRfU1lNQk9MKHBmbl9iYXNl
KTsKPj4gK3Vuc2lnbmVkIGxvbmcgcmlzY3ZfZ2xvYmFsX3Bmbl9iYXNlIF9fcm9fYWZ0ZXJfaW5p
dDsKPj4gK0VYUE9SVF9TWU1CT0wocmlzY3ZfZ2xvYmFsX3Bmbl9iYXNlKTsKPiAKPiBKdXN0IG5p
dDogSSBkaWRuJ3Qgc2VlIGFueSBkcml2ZXIgaW4ga2VybmVsIHJlZmVycyB0bwo+IHRoZSByaXNj
dl9nbG9iYWxfcGZuX2Jhc2UsIGNhbiB3ZSBqdXN0IHJlbW92ZSB0aGUgRVhQT1JUX1NZTUJPTCgp
77yfCgpTb3JyeSwgSSdtIHdyb25nLCB3aWxsIGJlIHVzZWQgYnkgQVJDSF9QRk5fT0ZGU0VULi4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
