Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1E4C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgSD2hN7lIKSAbLVIaZ1O6ODc6IozIesXD9yLm6QPU8=; b=DCHNTd08F+ADvolFbLVCOJFZaG
	zD2Z/2G5U7gHs7BOdKMQueylYgtc04+b+qdQvhHmAZ3c8nl01yW9b24unIyEV0zbWPvmzFbQviH5Q
	zJh7TUEmjCX3bjssa1I63m/aOMtg6TCoWdjqMbgKSqsr/iDshexmC/f8lS2PfMnLQ2PRQMXyh4O34
	vHr/K0aNz2HFg08HX0AyHMKfO0gpba59K01UMv8vKCVjmC27RGg0cKuWTMKDfRCH4itJ9U/VpJ1uU
	nSNrTBUduOp/tOLggxOFPjrkj3/79c744AkTDjTVFeZ8LtT0SUZIbMzySixl5Q3ifw3Nu0DSb4huf
	3s3b7mFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCCIe-003udM-Ek; Fri, 15 Jul 2022 03:47:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCCIa-003uUn-Vk
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 03:47:31 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LkcgB6lkCzjWyZ;
	Fri, 15 Jul 2022 11:44:38 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Jul 2022 11:47:15 +0800
Received: from [10.67.111.195] (10.67.111.195) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Jul 2022 11:47:15 +0800
Subject: Re: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
From: chenlifu <chenlifu@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<akira.tsukamoto@gmail.com>, <jszhang@kernel.org>,
	<wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alankao@andestech.com>
References: <20220615014714.1650349-1-chenlifu@huawei.com>
 <11a0698c-5726-15e8-2448-3529d2d0b098@huawei.com>
Message-ID: <606b1f5a-ea1e-f756-a00b-6b622238b453@huawei.com>
Date: Fri, 15 Jul 2022 11:47:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <11a0698c-5726-15e8-2448-3529d2d0b098@huawei.com>
X-Originating-IP: [10.67.111.195]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_204729_233929_68F63A32 
X-CRM114-Status: GOOD (  10.22  )
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

Pj4gU2luY2UgY29tbWl0IDVkODU0NGUyZDAwNyAoIlJJU0MtVjogR2VuZXJpYyBsaWJyYXJ5IHJv
dXRpbmVzIGFuZCAKPj4gYXNzZW1ibHkiKQo+PiBhbmQgY29tbWl0IGViY2JkNzVlMzk2MiAoInJp
c2N2OiBGaXggdGhlIGJ1ZyBpbiBtZW1vcnkgYWNjZXNzIGZpeHVwIAo+PiBjb2RlIiksCj4+IGlm
IF9fY2xlYXJfdXNlciBhbmQgX19jb3B5X3VzZXIgcmV0dXJuIGZyb20gYW4gZml4dXAgYnJhbmNo
LAo+PiBDU1JfU1RBVFVTIFNSX1NVTSBiaXQgd2lsbCBiZSBzZXQsIGl0IGlzIGEgdnVsbmVyYWJp
bGl0eSwgc28gdGhhdAo+PiBTLW1vZGUgbWVtb3J5IGFjY2Vzc2VzIHRvIHBhZ2VzIHRoYXQgYXJl
IGFjY2Vzc2libGUgYnkgVS1tb2RlIHdpbGwgCj4+IHN1Y2Nlc3MuCj4+IERpc2FibGUgUy1tb2Rl
IGFjY2VzcyB0byBVLW1vZGUgbWVtb3J5IHNob3VsZCBjbGVhciBTUl9TVU0gYml0Lgo+Pgo+PiBG
aXhlczogNWQ4NTQ0ZTJkMDA3ICgiUklTQy1WOiBHZW5lcmljIGxpYnJhcnkgcm91dGluZXMgYW5k
IGFzc2VtYmx5IikKPj4gRml4ZXM6IGViY2JkNzVlMzk2MiAoInJpc2N2OiBGaXggdGhlIGJ1ZyBp
biBtZW1vcnkgYWNjZXNzIGZpeHVwIGNvZGUiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIExp
ZnUgPGNoZW5saWZ1QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L2xpYi91YWNj
ZXNzLlMgfCA0ICsrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyBi
L2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+PiBpbmRleCA4YzQ3NWY0ZGEzMDguLmVjNDg2ZTUz
NjlkOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+ICsrKyBiL2Fy
Y2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+PiBAQCAtMTczLDExICsxNzMsMTEgQEAgRU5UUlkoX19h
c21fY29weV9mcm9tX3VzZXIpCj4+IMKgwqDCoMKgwqAgcmV0Cj4+IMKgwqDCoMKgwqAgLyogRXhj
ZXB0aW9uIGZpeHVwIGNvZGUgKi8KPj4gwqAgMTA6Cj4+IMKgwqDCoMKgwqAgLyogRGlzYWJsZSBh
Y2Nlc3MgdG8gdXNlciBtZW1vcnkgKi8KPj4gLcKgwqDCoCBjc3JzIENTUl9TVEFUVVMsIHQ2Cj4+
ICvCoMKgwqAgY3NyYyBDU1JfU1RBVFVTLCB0Ngo+PiDCoMKgwqDCoMKgIG12IGEwLCB0NQo+PiDC
oMKgwqDCoMKgIHJldAo+PiDCoCBFTkRQUk9DKF9fYXNtX2NvcHlfdG9fdXNlcikKPj4gwqAgRU5E
UFJPQyhfX2FzbV9jb3B5X2Zyb21fdXNlcikKPj4gwqAgRVhQT1JUX1NZTUJPTChfX2FzbV9jb3B5
X3RvX3VzZXIpCj4+IEBAIC0yMjUsMTAgKzIyNSwxMCBAQCBFTlRSWShfX2NsZWFyX3VzZXIpCj4+
IMKgwqDCoMKgwqAgaiAzYgo+PiDCoMKgwqDCoMKgIC8qIEV4Y2VwdGlvbiBmaXh1cCBjb2RlICov
Cj4+IMKgIDExOgo+PiDCoMKgwqDCoMKgIC8qIERpc2FibGUgYWNjZXNzIHRvIHVzZXIgbWVtb3J5
ICovCj4+IC3CoMKgwqAgY3NycyBDU1JfU1RBVFVTLCB0Ngo+PiArwqDCoMKgIGNzcmMgQ1NSX1NU
QVRVUywgdDYKPj4gwqDCoMKgwqDCoCBtdiBhMCwgYTEKPj4gwqDCoMKgwqDCoCByZXQKPj4gwqAg
RU5EUFJPQyhfX2NsZWFyX3VzZXIpCj4+IMKgIEVYUE9SVF9TWU1CT0woX19jbGVhcl91c2VyKQo+
Pgo+IAo+IGZyaWVuZGx5IHBpbmcgLi4uCj4gCgpmcmllbmRseSBwaW5nIC4uLgoKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
