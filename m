Return-Path: <SRS0=Z71o=LW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A87C48BC2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 00:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E242619AB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 00:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E242619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I2cEQRS4ICzl06x0HB+ijE9ygZDyICNH/89PGVBhdg=; b=2Q15OLsd0KAr2O9Oc6ROT7TRk5
	JuuOx/E3XFR6rm3i705pNMzjaJX+uulkJ7XHhq9jRsvjhVaiv1/OBf/f682OWekwCFHbj18x6oZGM
	5cai/jZp0Xe/Pwjen00G8TXSG8RXnYRU3CvRwJOBeBN/E4ZhGKBqJOdzEEU7k1i5k7mvDvp9gCc9A
	6Pc2jtAGE6VkSDn2u2rhlLl93fm2PxADwBBUyw2WkXtdRRCrQROz0fVbgTFoNvvGSQBgcROTYXm87
	gZxx9Qucvt/S1zmMOnefNKUUyuFpiNafmUwYJzRRp/Trlh6UCwdMGYaKOWGKFq4HhWqzBMEI2VCli
	qnlagd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxfWy-006N3N-5S; Mon, 28 Jun 2021 00:53:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfWm-006N2T-Uc
 for linux-riscv@lists.infradead.org; Mon, 28 Jun 2021 00:53:35 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GCpqh412zzXlsd;
 Mon, 28 Jun 2021 08:48:00 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 08:53:17 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 08:53:16 +0800
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 Atish Patra <atish.patra@wdc.com>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
CC: <stable@vger.kernel.org>
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
Date: Mon, 28 Jun 2021 08:53:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210627135117.28641-1-bmeng.cn@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_175333_209884_3FF62ABA 
X-CRM114-Status: GOOD (  17.25  )
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

SGnvvIwgc29ycnkgZm9yIHRoZSBtaXN0YWtl77yMdGhlIGJ1ZyBpcyBmaXhlZCBieQoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMTA2MDIwODU1MTcuMTI3NDgxLTItd2Fu
Z2tlZmVuZy53YW5nQGh1YXdlaS5jb20vCgpPbiAyMDIxLzYvMjcgMjE6NTEsIEJpbiBNZW5nIHdy
b3RlOgo+IENvbW1pdCBkZDJkMDgyYjU3NjAgKCJyaXNjdjogQ2xlYW51cCBzZXR1cF9ib290bWVt
KCkiKSBhZGp1c3RlZAo+IHRoZSBjYWxsaW5nIHNlcXVlbmNlIGluIHNldHVwX2Jvb3RtZW0oKSwg
d2hpY2ggaW52YWxpZGF0ZXMgdGhlIGZpeAo+IGNvbW1pdCBkZTA0M2RhMGI5ZTcgKCJSSVNDLVY6
IEZpeCB1c2FnZSBvZiBtZW1ibG9ja19lbmZvcmNlX21lbW9yeV9saW1pdCIpCj4gZGlkIGZvciAz
Mi1iaXQgUklTQy1WIHVuZm9ydHVuYXRlbHkuCj4KPiBTbyBub3cgMzItYml0IFJJU0MtViBkb2Vz
IG5vdCBib290IGFnYWluIHdoZW4gdGVzdGluZyBib290aW5nIGtlcm5lbAo+IG9uIFFFTVUgJ3Zp
cnQnIHdpdGggJy1tIDJHJywgd2hpY2ggd2FzIGV4YWN0bHkgd2hhdCB0aGUgb3JpZ2luYWwKPiBj
b21taXQgZGUwNDNkYTBiOWU3ICgiUklTQy1WOiBGaXggdXNhZ2Ugb2YgbWVtYmxvY2tfZW5mb3Jj
ZV9tZW1vcnlfbGltaXQiKQo+IHRyaWVkIHRvIGZpeC4KPgo+IEZpeGVzOiBkZDJkMDgyYjU3NjAg
KCJyaXNjdjogQ2xlYW51cCBzZXR1cF9ib290bWVtKCkiKQo+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnICMgdjUuMTIrCj4gU2lnbmVkLW9mZi1ieTogQmluIE1lbmcgPGJtZW5nLmNuQGdtYWls
LmNvbT4KPiAtLS0KPgo+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA0ICsrKy0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gaW5kZXggNGM0
YzkyY2UwYmI4Li45YjIzYjk1YzUwY2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBAIC0xMjMsNyArMTIzLDcgQEAgdm9p
ZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ICAgewo+ICAgCXBoeXNfYWRkcl90IHZtbGlu
dXhfZW5kID0gX19wYV9zeW1ib2woJl9lbmQpOwo+ICAgCXBoeXNfYWRkcl90IHZtbGludXhfc3Rh
cnQgPSBfX3BhX3N5bWJvbCgmX3N0YXJ0KTsKPiAtCXBoeXNfYWRkcl90IGRyYW1fZW5kID0gbWVt
YmxvY2tfZW5kX29mX0RSQU0oKTsKPiArCXBoeXNfYWRkcl90IGRyYW1fZW5kOwo+ICAgCXBoeXNf
YWRkcl90IG1heF9tYXBwZWRfYWRkciA9IF9fcGEofih1bG9uZykwKTsKPiAgIAo+ICAgI2lmZGVm
IENPTkZJR19YSVBfS0VSTkVMCj4gQEAgLTE0Niw2ICsxNDYsOCBAQCB2b2lkIF9faW5pdCBzZXR1
cF9ib290bWVtKHZvaWQpCj4gICAjZW5kaWYKPiAgIAltZW1ibG9ja19yZXNlcnZlKHZtbGludXhf
c3RhcnQsIHZtbGludXhfZW5kIC0gdm1saW51eF9zdGFydCk7Cj4gICAKPiArCWRyYW1fZW5kID0g
bWVtYmxvY2tfZW5kX29mX0RSQU0oKTsKPiArCj4gICAJLyoKPiAgIAkgKiBtZW1ibG9jayBhbGxv
Y2F0b3IgaXMgbm90IGF3YXJlIG9mIHRoZSBmYWN0IHRoYXQgbGFzdCA0SyBieXRlcyBvZgo+ICAg
CSAqIHRoZSBhZGRyZXNzYWJsZSBtZW1vcnkgY2FuIG5vdCBiZSBtYXBwZWQgYmVjYXVzZSBvZiBJ
U19FUlJfVkFMVUUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
