Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BECDC11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 10:45:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C38A561418
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 10:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C38A561418
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEKjHaUI8t5b8FrKibDLDhUxmE0cQ8DM+lzv1vi5wOs=; b=FwNcy4J5exDqvpsMb/XERpgecL
	NVo9tbyhsomUbsidDpNgYNPcpHQJfgXvAi/kl5M2pIxz1HMwGHMANknKLtWHatj/JsTOX77/BqpYz
	k1cV7LRkXcpmrIS5ZmCDQo0+7SwgX0FYpfijTnX0S/nMS6DQIIjKi6PDAe9gDQf4mQZHx+u3KO9+E
	t2L3Et8O6M65zKMH5SUuk6fmxVx7xki70RG8wOxsv45Q4FcVVvaLMOAz1QKBEN53ycjLrkG9eur1x
	z1Xdnik+MLPuT/exQ51Ocp9nT+00wP4g7ja9Ru3P0i6rT+9nNHDGXYDOaM1IaXf5BmLhvw1KagBH7
	H5TNYLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyuBd-00GzxC-78; Thu, 01 Jul 2021 10:44:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyuBZ-00GzwI-L4
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 10:44:47 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GFvpY5TdlzXmNC;
 Thu,  1 Jul 2021 18:39:17 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 18:44:38 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 18:44:38 +0800
Subject: Re: [PATCH 1/3] riscv: Fix memory_limit for 64-bit kernel
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210629091349.3802690-1-alex@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <6a38fb9a-d658-836b-4ff4-7c47cadb7db0@huawei.com>
Date: Thu, 1 Jul 2021 18:44:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210629091349.3802690-1-alex@ghiti.fr>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_034445_911039_B4995B1A 
X-CRM114-Status: GOOD (  20.05  )
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

Ck9uIDIwMjEvNi8yOSAxNzoxMywgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEFzIGRlc2NyaWJl
ZCBpbiBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QsIHRoZSBlbmQgb2YgdGhlCj4g
dmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvciA2NC1iaXQga2VybmVsIGlzIG9jY3VwaWVkIGJ5IHRo
ZSBtb2R1bGVzL0JQRi8KPiBrZXJuZWwgbWFwcGluZ3Mgc28gdGhpcyBhY3R1YWxseSByZWR1Y2Vz
IHRoZSBhbW91bnQgb2YgbWVtb3J5IHdlIGFyZSBhYmxlCj4gdG8gbWFwIGFuZCB0aGVuIHVzZSBp
biB0aGUgbGluZWFyIG1hcHBpbmcuIFNvIG1ha2Ugc3VyZSB0aGlzIGxpbWl0IGlzCj4gY29ycmVj
dGx5IHNldC4KPgo+IEZpeGVzOiBjOTgxMWUzNzliMjEgKCJyaXNjdjogQWRkIG1lbSBrZXJuZWwg
cGFyYW1ldGVyIHN1cHBvcnQiKQoKClNob3VsZCB0aGUgRml4ZXMgdGFnIGJlIGRlMDQzZGEwYjll
NyDvvIjigJxSSVNDLVY6IEZpeCB1c2FnZSBvZiAKbWVtYmxvY2tfZW5mb3JjZV9tZW1vcnlfbGlt
aXTigJzvvIksCgpUaGUgLVBBR0VfT0ZGU0VUIGlzIHNldCB0byB0aGUgbWF4aW1hbCBwaHlzaWNh
bCBtZW1vcnkgZnJvbSB0aGlzIHBvaW50IDopCgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleEBnaGl0aS5mcj4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMTEg
KysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+IGluZGV4IDEyZjk1NmIzYTY3NC4uMDRhNWRiM2E5Nzg4IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBA
QCAtMTI0LDEwICsxMjQsMTcgQEAgdm9pZCBfX2luaXQgbWVtX2luaXQodm9pZCkKPiAgIH0KPiAg
IAo+ICAgLyoKPiAtICogVGhlIGRlZmF1bHQgbWF4aW1hbCBwaHlzaWNhbCBtZW1vcnkgc2l6ZSBp
cyAtUEFHRV9PRkZTRVQsCj4gLSAqIGxpbWl0IHRoZSBtZW1vcnkgc2l6ZSB2aWEgbWVtLgo+ICsg
KiBUaGUgZGVmYXVsdCBtYXhpbWFsIHBoeXNpY2FsIG1lbW9yeSBzaXplIGlzIC1QQUdFX09GRlNF
VCBmb3IgMzItYml0IGtlcm5lbCwKPiArICogd2hlcmVhcyBmb3IgNjQtYml0IGtlcm5lbCwgdGhl
IGVuZCBvZiB0aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGlzIG9jY3VwaWVkCj4gKyAqIGJ5IHRo
ZSBtb2R1bGVzL0JQRi9rZXJuZWwgbWFwcGluZ3Mgd2hpY2ggcmVkdWNlcyB0aGUgYXZhaWxhYmxl
IHNpemUgb2YgdGhlCj4gKyAqIGxpbmVhciBtYXBwaW5nLgo+ICsgKiBMaW1pdCB0aGUgbWVtb3J5
IHNpemUgdmlhIG1lbS4KPiAgICAqLwo+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gK3N0YXRpYyBw
aHlzX2FkZHJfdCBtZW1vcnlfbGltaXQgPSAtUEFHRV9PRkZTRVQgLSBTWl80RzsKPiArI2Vsc2UK
PiAgIHN0YXRpYyBwaHlzX2FkZHJfdCBtZW1vcnlfbGltaXQgPSAtUEFHRV9PRkZTRVQ7Cj4gKyNl
bmRpZgo+ICAgCj4gICBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPiAgIHsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
