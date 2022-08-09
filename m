Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF6EC19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW/TO0Y1YgWd7jdrP0Nlc4+0AwGnsMk02GhVgPXSmKQ=; b=zJkuUaTCzo9kKV6HmTMbPTTy2N
	vM/iIbZH/q7Bg48JgdCOU+keT0vFQLzJOzQZKXbdSvBE1uGb5piExbOa9sRK/soMDwbSVQeCW9/xG
	H7HzWa+CCSOBFqJRodIHeO9t1EfhCDlYfkeKFivpICo828wP1nLYE/G+JJL+mOXmqu/BQKPNvfERs
	RcpoxoYS24L0fVl1/QDJMIxkKdC4pleQ9BQtVnzXduhea9pT/5k610P7jCywX7gjgZWbmdYdVGXTD
	q6REA3aR+Hnxd3xP32uFJkW72xIeRM3BcEraLOf8aKdL4LMzkpYQJGmgCOvagMx6fuJuqCkhhqq5+
	LEL8ubxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLN08-003P1l-KN; Tue, 09 Aug 2022 11:02:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLN05-003Oyg-CN
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 11:02:19 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M29715yFzzlVqB;
	Tue,  9 Aug 2022 18:59:09 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 9 Aug 2022 19:02:01 +0800
Received: from [10.67.111.195] (10.67.111.195) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 9 Aug 2022 19:02:01 +0800
Subject: Re: [PATCH -next] riscv: lib: uaccess: fix CSR_STATUS SR_SUM bit
From: chenlifu <chenlifu@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<akira.tsukamoto@gmail.com>, <jszhang@kernel.org>,
	<wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <alankao@andestech.com>
References: <20220615014714.1650349-1-chenlifu@huawei.com>
 <11a0698c-5726-15e8-2448-3529d2d0b098@huawei.com>
 <606b1f5a-ea1e-f756-a00b-6b622238b453@huawei.com>
Message-ID: <dda3f0c3-a5ee-e648-fac1-d484e475634c@huawei.com>
Date: Tue, 9 Aug 2022 19:01:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <606b1f5a-ea1e-f756-a00b-6b622238b453@huawei.com>
X-Originating-IP: [10.67.111.195]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_040217_609733_3BBC80AB 
X-CRM114-Status: UNSURE (   8.12  )
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

5ZyoIDIwMjIvNy8xNSAxMTo0NywgY2hlbmxpZnUg5YaZ6YGTOgo+Pj4gU2luY2UgY29tbWl0IDVk
ODU0NGUyZDAwNyAoIlJJU0MtVjogR2VuZXJpYyBsaWJyYXJ5IHJvdXRpbmVzIGFuZCAKPj4+IGFz
c2VtYmx5IikKPj4+IGFuZCBjb21taXQgZWJjYmQ3NWUzOTYyICgicmlzY3Y6IEZpeCB0aGUgYnVn
IGluIG1lbW9yeSBhY2Nlc3MgZml4dXAgCj4+PiBjb2RlIiksCj4+PiBpZiBfX2NsZWFyX3VzZXIg
YW5kIF9fY29weV91c2VyIHJldHVybiBmcm9tIGFuIGZpeHVwIGJyYW5jaCwKPj4+IENTUl9TVEFU
VVMgU1JfU1VNIGJpdCB3aWxsIGJlIHNldCwgaXQgaXMgYSB2dWxuZXJhYmlsaXR5LCBzbyB0aGF0
Cj4+PiBTLW1vZGUgbWVtb3J5IGFjY2Vzc2VzIHRvIHBhZ2VzIHRoYXQgYXJlIGFjY2Vzc2libGUg
YnkgVS1tb2RlIHdpbGwgCj4+PiBzdWNjZXNzLgo+Pj4gRGlzYWJsZSBTLW1vZGUgYWNjZXNzIHRv
IFUtbW9kZSBtZW1vcnkgc2hvdWxkIGNsZWFyIFNSX1NVTSBiaXQuCj4+Pgo+Pj4gRml4ZXM6IDVk
ODU0NGUyZDAwNyAoIlJJU0MtVjogR2VuZXJpYyBsaWJyYXJ5IHJvdXRpbmVzIGFuZCBhc3NlbWJs
eSIpCj4+PiBGaXhlczogZWJjYmQ3NWUzOTYyICgicmlzY3Y6IEZpeCB0aGUgYnVnIGluIG1lbW9y
eSBhY2Nlc3MgZml4dXAgY29kZSIpCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBMaWZ1IDxj
aGVubGlmdUBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBhcmNoL3Jpc2N2L2xpYi91YWNjZXNz
LlMgfCA0ICsrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUyBi
L2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+Pj4gaW5kZXggOGM0NzVmNGRhMzA4Li5lYzQ4NmU1
MzY5ZDkgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMKPj4+ICsrKyBi
L2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+Pj4gQEAgLTE3MywxMSArMTczLDExIEBAIEVOVFJZ
KF9fYXNtX2NvcHlfZnJvbV91c2VyKQo+Pj4gwqDCoMKgwqDCoCByZXQKPj4+IMKgwqDCoMKgwqAg
LyogRXhjZXB0aW9uIGZpeHVwIGNvZGUgKi8KPj4+IMKgIDEwOgo+Pj4gwqDCoMKgwqDCoCAvKiBE
aXNhYmxlIGFjY2VzcyB0byB1c2VyIG1lbW9yeSAqLwo+Pj4gLcKgwqDCoCBjc3JzIENTUl9TVEFU
VVMsIHQ2Cj4+PiArwqDCoMKgIGNzcmMgQ1NSX1NUQVRVUywgdDYKPj4+IMKgwqDCoMKgwqAgbXYg
YTAsIHQ1Cj4+PiDCoMKgwqDCoMKgIHJldAo+Pj4gwqAgRU5EUFJPQyhfX2FzbV9jb3B5X3RvX3Vz
ZXIpCj4+PiDCoCBFTkRQUk9DKF9fYXNtX2NvcHlfZnJvbV91c2VyKQo+Pj4gwqAgRVhQT1JUX1NZ
TUJPTChfX2FzbV9jb3B5X3RvX3VzZXIpCj4+PiBAQCAtMjI1LDEwICsyMjUsMTAgQEAgRU5UUlko
X19jbGVhcl91c2VyKQo+Pj4gwqDCoMKgwqDCoCBqIDNiCj4+PiDCoMKgwqDCoMKgIC8qIEV4Y2Vw
dGlvbiBmaXh1cCBjb2RlICovCj4+PiDCoCAxMToKPj4+IMKgwqDCoMKgwqAgLyogRGlzYWJsZSBh
Y2Nlc3MgdG8gdXNlciBtZW1vcnkgKi8KPj4+IC3CoMKgwqAgY3NycyBDU1JfU1RBVFVTLCB0Ngo+
Pj4gK8KgwqDCoCBjc3JjIENTUl9TVEFUVVMsIHQ2Cj4+PiDCoMKgwqDCoMKgIG12IGEwLCBhMQo+
Pj4gwqDCoMKgwqDCoCByZXQKPj4+IMKgIEVORFBST0MoX19jbGVhcl91c2VyKQo+Pj4gwqAgRVhQ
T1JUX1NZTUJPTChfX2NsZWFyX3VzZXIpCj4+Pgo+Pgo+PiBmcmllbmRseSBwaW5nIC4uLgo+Pgo+
IAo+IGZyaWVuZGx5IHBpbmcgLi4uCj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4gLgo+IC4KCmZyaWVuZGx5IHBpbmcgLi4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
