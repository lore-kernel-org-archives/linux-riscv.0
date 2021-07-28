Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13226C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C186D60F91
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C186D60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFlBeMllk9nJrpvvoXV8xk0GWKztG4aoLENZfT8DIbU=; b=IBh0/LQDdMnZbbeJqXdF+3I6LB
	eg7c+TDI8KVqM98Ih3yaryoUsRm6ZpNAbM3uXZByH2o3NU6vaP5ICyTdQyQyNqe9bGtQ1eKh0n7jH
	9ofTjlLEKk+O0RJhSX71GDeQqkq/U/gM9+0SspcTFgID0iEmiC01vh3RfjXNaL1ojICUpJBhfCJc6
	3xi8EfNcYciLieuXyUu3sn0NsBMlf9iijnkKvZWh9HVVkRTDmMSLbUoHB6US+yNonmBPjNJx0Q067
	bE8L8Zzyo+FBjtlkKPdJij48GRkO4ABK2Rs3jhPBFtHV8vF2anNz5BK3j3OenqEecJ87EdsHNcLqB
	8HFUsh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dks-00HLFh-8i; Wed, 28 Jul 2021 07:13:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dko-00HLEn-FH
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 07:13:24 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZPtP4t4JzZtjx;
 Wed, 28 Jul 2021 15:09:49 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 15:13:17 +0800
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 15:13:16 +0800
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
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
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <0b813cde-ca37-9b83-c0c5-ce9f6b8eab3c@huawei.com>
Date: Wed, 28 Jul 2021 15:13:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210728064318.375747-1-nek.in.cn@gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_001322_720731_5AE799FA 
X-CRM114-Status: GOOD (  17.47  )
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

T24gMjAyMS83LzI4IDE0OjQzLCBLZW5uZXRoIExlZSB3cm90ZToKPiBGcm9tOiBLZW5uZXRoIExl
ZSA8bGlndW96aHVAaGlzaWxpY29uLmNvbT4KPiAKPiBSSVNDViB1c2UgYSBnbG9iYWwgdmFyaWFi
bGUgcGZuX2Jhc2UgZm9yIHBhZ2UvcGZuIHRyYW5zbGF0aW9uLiBCdXQgdGhpcwo+IGlzIGEgY29t
bW9uIG5hbWUgYW5kIHdpbGwgYmUgdXNlZCBlbHNld2hlcmUuIEluIHRob3NlIGNhc2UsCj4gdGhl
IHBhZ2UtcGZuIG1hY3JvIHdoaWNoIHJlZmVyIHRoaXMgbmFtZSB3aWxsIHJlZmVyIHRvIHRoZSBs
b2NhbC9pbnB1dAo+IHZhcmlhYmxlIG9mIHRob3NlIGZ1bmN0aW9uIChzdWNoIGFzIGluIHZmaW9f
cGluX3BhZ2VzX3JlbW90ZSkuIFRoaXMgbWFrZQo+IGV2ZXJ5dGhpbmcgd3JvbmcuCj4gCj4gVGhp
cyBwYXRjaCBjaGFuZ2UgdGhlIG5hbWUgZnJvbSBwZm5fYmFzZSB0byByaXNjdl9nbG9iYWxfcGZu
X2Jhc2UgdG8gZml4Cj4gdGhpcyBwcm9ibGVtCj4gCj4gU2lnbmVkLW9mZi1ieTogS2VubmV0aCBM
ZWUgPGxpZ3Vvemh1QGhpc2lsaWNvbi5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UuaCB8IDQgKystLQo+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgfCA2
ICsrKy0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiBpbmRleCBjY2E4NzY0YWVkODMuLjg3MTFlNDE1
ZjM3YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gQEAgLTc5LDggKzc5LDggQEAgdHlwZWRl
ZiBzdHJ1Y3QgcGFnZSAqcGd0YWJsZV90Owo+ICAgI2VuZGlmCj4gICAKPiAgICNpZmRlZiBDT05G
SUdfTU1VCj4gLWV4dGVybiB1bnNpZ25lZCBsb25nIHBmbl9iYXNlOwo+IC0jZGVmaW5lIEFSQ0hf
UEZOX09GRlNFVAkJKHBmbl9iYXNlKQo+ICtleHRlcm4gdW5zaWduZWQgbG9uZyByaXNjdl9nbG9i
YWxfcGZuX2Jhc2U7Cj4gKyNkZWZpbmUgQVJDSF9QRk5fT0ZGU0VUCQkocmlzY3ZfZ2xvYmFsX3Bm
bl9iYXNlKQo+ICAgI2Vsc2UKPiAgICNkZWZpbmUgQVJDSF9QRk5fT0ZGU0VUCQkoUEFHRV9PRkZT
RVQgPj4gUEFHRV9TSElGVCkKPiAgICNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCBh
MTRiZjM5MTBlZWMuLjJjZTRlOWE0NmNhMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2lu
aXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTIyOCw4ICsyMjgsOCBAQCBz
dGF0aWMgc3RydWN0IHB0X2FsbG9jX29wcyBfcHRfb3BzIF9faW5pdGRhdGE7Cj4gICAjZGVmaW5l
IHB0X29wcyBfcHRfb3BzCj4gICAjZW5kaWYKPiAgIAo+IC11bnNpZ25lZCBsb25nIHBmbl9iYXNl
IF9fcm9fYWZ0ZXJfaW5pdDsKPiAtRVhQT1JUX1NZTUJPTChwZm5fYmFzZSk7Cj4gK3Vuc2lnbmVk
IGxvbmcgcmlzY3ZfZ2xvYmFsX3Bmbl9iYXNlIF9fcm9fYWZ0ZXJfaW5pdDsKPiArRVhQT1JUX1NZ
TUJPTChyaXNjdl9nbG9iYWxfcGZuX2Jhc2UpOwoKSnVzdCBuaXQ6IEkgZGlkbid0IHNlZSBhbnkg
ZHJpdmVyIGluIGtlcm5lbCByZWZlcnMgdG8KdGhlIHJpc2N2X2dsb2JhbF9wZm5fYmFzZSwgY2Fu
IHdlIGp1c3QgcmVtb3ZlIHRoZSBFWFBPUlRfU1lNQk9MKCnvvJ8KClRoYW5rcwpIYW5qdW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
