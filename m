Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xt8Ql0jfQtYBqevrsmE/6IeduHiMYYHuy87r1E6U3qU=; b=4eoK2uMMbopVW3WwZgBtNGdEnt
	3jEwOeRwFZYNnFSwbqFlcbB4rWMfKpK8uSuhbYSUkc+AkAiuKD8ga1cAsFGJ6Ge5TU0XCw2praTO6
	NcrGO4TIYfnP0Ymn7zgHY04BBsCGLzxs0b8hshxKdryGmc5ptMy61GKQGjsiZiFvnbndWoCIzU9TH
	VmwpBTRh67aGghYGABkTMITpIpmoLbgAZFQiqnGbpkP4QReGOrYh6p2sF5VRuPGwrrZsXVSgMX9cN
	s7JkvckuDECiTKLNwNsl7DONMaadn07tFMLfUaMJRD/FYI9WHRYO64+CU0N4ZPEGTWMH8wij0kj5Y
	P1O0puSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov7aG-00GIfH-G4; Wed, 16 Nov 2022 01:51:24 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov7a4-00GIQL-H2; Wed, 16 Nov 2022 01:51:14 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NBmGP6h74z15Mgc;
	Wed, 16 Nov 2022 09:50:37 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:50:58 +0800
CC: <yangyicong@hisilicon.com>, Andrew Morton <akpm@linux-foundation.org>,
	Linux-MM <linux-mm@kvack.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, X86 ML <x86@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Anshuman
 Khandual <anshuman.khandual@arm.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra
	<peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	"punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, kernel list
	<linux-kernel@vger.kernel.org>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>,
	"lipeifeng@oppo.com" <lipeifeng@oppo.com>, "zhangshiming@oppo.com"
	<zhangshiming@oppo.com>, "guojian@oppo.com" <guojian@oppo.com>,
	"realmz6@gmail.com" <realmz6@gmail.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "openrisc@lists.librecores.org"
	<openrisc@lists.librecores.org>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
	Barry Song <21cnbao@gmail.com>, "wangkefeng.wang@huawei.com"
	<wangkefeng.wang@huawei.com>, haoxin <xhao@linux.alibaba.com>,
	"prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, Barry Song
	<v-songbaohua@oppo.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Nadav Amit <namit@vmware.com>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-3-yangyicong@huawei.com>
 <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <91e4804d-cb99-fd22-dafd-2f418f5c7ba9@huawei.com>
Date: Wed, 16 Nov 2022 09:50:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_175112_768382_49D3E1A1 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMi8xMS8xNiA3OjM4LCBOYWRhdiBBbWl0IHdyb3RlOgo+IE9uIE5vdiAxNCwgMjAyMiwg
YXQgNzoxNCBQTSwgWWljb25nIFlhbmcgPHlhbmd5aWNvbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4g
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+PiBpbmRleCA4YTQ5N2Q5MDJjMTYuLjViZDc4YWU1
NWNkNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+PiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4+IEBAIC0yNjQsNyArMjY0LDgg
QEAgc3RhdGljIGlubGluZSB1NjQgaW5jX21tX3RsYl9nZW4oc3RydWN0IG1tX3N0cnVjdCAqbW0p
Cj4+IH0KPj4KPj4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRkX21tKHN0cnVj
dCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCwKPj4gLQkJCQkJc3RydWN0IG1tX3N0
cnVjdCAqbW0pCj4+ICsJCQkJCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+PiArCQkJCQl1bnNpZ25l
ZCBsb25nIHVhZGRyKQo+IAo+IExvZ2ljLXdpc2UgaXQgbG9va3MgZmluZS4gSSBub3RpY2UgdGhl
IOKAnHY2IiwgYW5kIGl0IHNob3VsZCBub3QgYmUgYmxvY2tpbmcsCj4gYnV0IEkgd291bGQgbm90
ZSB0aGF0IHRoZSBuYW1lICJhcmNoX3RsYmJhdGNoX2FkZF9tbSgp4oCdIGRvZXMgbm90IG1ha2Ug
bXVjaAo+IHNlbnNlIG9uY2UgdGhlIGZ1bmN0aW9uIGFsc28gdGFrZXMgYW4gYWRkcmVzcy4KPiAK
Cm9rIHRoZSBhZGRfbW0gc2hvdWxkIHN0aWxsIGFwcGx5IHRvIHg4NiBzaW5jZSB0aGUgYWRkcmVz
cyBpcyBub3QgdXNlZCwgYnV0IG5vdCBmb3IgYXJtNjQuCgo+IEl0IGNvdWxk4oCZdmUgYmVlbiBz
b21ldGhpbmcgbGlrZSBhcmNoX3NldF90bGJfdWJjX2ZsdXNoX3BlbmRpbmcoKSBidXQgdGhhdOKA
mXMKPiB0b28gbG9uZy4gSeKAmW0gbm90IHZlcnkgZ29vZCB3aXRoIG5hbWluZywgYnV0IHRoZSBj
dXJyZW50IG5hbWUgaXMgbm90IGdyZWF0Lgo+IAoKV2hhdCBhYm91dCBhcmNoX3RsYmJhdGNoX2Fk
ZF9wZW5kaW5nKCk/IENvbnNpZGVyaW5nIHRoZSB4ODYgaXMgcGVuZGluZyB0aGUgZmx1c2ggb3Bl
cmF0aW9uCndoaWxlIGFybTY0IGlzIHBlbmRpbmcgdGhlIHN5Y2hyb25pemF0aW9uIG9wZXJhdGlv
biwgYXJjaF90bGJiYXRjaF9hZGRfcGVuZGluZygpIHNob3VsZAptYWtlIHNlbnNlIHRvIGJvdGgu
CgpUaGFua3MuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
