Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C360C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 03:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfZwVXy6RbpaHDDhhXDxw54HGQ9drFVPLXfignvk2Iw=; b=c91Qj3+obOlLhI
	N1rvOxrNZpwh6LXdxPfmozA/4bCpLczsN/G930wBhY/fPWEdOOKHZq48HIlPfokIYYKAplR6Sj84D
	85Og6O5LC4DXFuxkVjneYSxilj/i7gf2aCyd2kc87qfSLPwEgZ7r2cMw/wxKl3S08Q6esgsPv33aP
	tLmCzv6nPqH4+seb04CwzdiRqEU9TElBoOXtCWYxwFQfBEMpZMAZl8ump3bs1RFLN4gQNNzRxLA0X
	yH6KAB4DF0HrJ3r7PS0OJzQjacPbvWwgXPF2QjV/KKm7bXFS9R9M9cGqA30yL2yR8rXq1yIRNTzgk
	H9USa9QGd7conLI9z/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrX06-00HAVr-Be; Mon, 29 Nov 2021 03:06:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrWzs-00HAT0-CS; Mon, 29 Nov 2021 03:06:30 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J2VYG4jL9z1DJgC;
 Mon, 29 Nov 2021 11:03:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 11:06:24 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 11:06:23 +0800
Message-ID: <073253ba-f5c5-c64c-f8cb-6fb39f35af0e@huawei.com>
Date: Mon, 29 Nov 2021 11:06:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
CC: <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tj@kernel.org>, <gregkh@linuxfoundation.org>,
 <cl@linux.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com> <YaRA6o0pHU6/206a@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaRA6o0pHU6/206a@fedora>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_190628_786003_8FF9C42E 
X-CRM114-Status: UNSURE (   8.37  )
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

Ck9uIDIwMjEvMTEvMjkgMTA6NTQsIERlbm5pcyBaaG91IHdyb3RlOgo+IE9uIE1vbiwgTm92IDI5
LCAyMDIxIGF0IDEwOjUxOjE4QU0gKzA4MDAsIEtlZmVuZyBXYW5nIHdyb3RlOgo+PiBIaSBEZW5u
aXMgYW5kIGFsbCBtYWludGFpbmVycywgYW55IGNvbW1lbnRzIGFib3V0IHRoZSBjaGFuZ2VzLCBt
YW55IHRoYW5rcy4KPj4KPj4gT24gMjAyMS8xMS8yMSAxNzozNSwgS2VmZW5nIFdhbmcgd3JvdGU6
Cj4+PiBXaGVuIHN1cHBvcnQgcGFnZSBtYXBwaW5nIHBlcmNwdSBmaXJzdCBjaHVuayBhbGxvY2F0
b3Igb24gYXJtNjQsIHdlCj4+PiBmb3VuZCB0aGVyZSBhcmUgbG90cyBvZiBkdXBsaWNhdGVkIGNv
ZGVzIGluIHBlcmNwdSBlbWJlZC9wYWdlIGZpcnN0Cj4+PiBjaHVuayBhbGxvY2F0b3IuIFRoaXMg
cGF0Y2hzZXQgaXMgYWltZWQgdG8gY2xlYW51cCB0aGVtIGFuZCBzaG91bGQKPj4+IG5vIGZ1bmNp
dG9uIGNoYW5nZSwgb25seSB0ZXN0IG9uIGFybTY0Lgo+Pj4KPj4+IEtlZmVuZyBXYW5nICg0KToK
Pj4+ICAgICBtbTogcGVyY3B1OiBHZW5lcmFsaXplIHBlcmNwdSByZWxhdGVkIGNvbmZpZwo+Pj4g
ICAgIG1tOiBwZXJjcHU6IEFkZCBwY3B1X2ZjX2NwdV90b19ub2RlX2ZuX3QgdHlwZWRlZgo+Pj4g
ICAgIG1tOiBwZXJjcHU6IEFkZCBnZW5lcmljIHBjcHVfZmNfYWxsb2MvZnJlZSBmdW5jaXRvbgo+
Pj4gICAgIG1tOiBwZXJjcHU6IEFkZCBnZW5lcmljIHBjcHVfcG9wdWxhdGVfcHRlKCkgZnVuY3Rp
b24KPj4+Cj4+PiAgICBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICAgfCAgMjAgKy0tLS0K
Pj4+ICAgIGFyY2gvaWE2NC9LY29uZmlnICAgICAgICAgICAgICB8ICAgOSArLS0KPj4+ICAgIGFy
Y2gvbWlwcy9LY29uZmlnICAgICAgICAgICAgICB8ICAxMCArLS0KPj4+ICAgIGFyY2gvbWlwcy9t
bS9pbml0LmMgICAgICAgICAgICB8ICAxNCArLS0tCj4+PiAgICBhcmNoL3Bvd2VycGMvS2NvbmZp
ZyAgICAgICAgICAgfCAgMTcgKy0tLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cF82
NC5jIHwgIDkyICstLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gICAgYXJjaC9yaXNjdi9LY29uZmln
ICAgICAgICAgICAgIHwgIDEwICstLQo+Pj4gICAgYXJjaC9zcGFyYy9LY29uZmlnICAgICAgICAg
ICAgIHwgIDEyICstLQo+Pj4gICAgYXJjaC9zcGFyYy9rZXJuZWwvc21wXzY0LmMgICAgIHwgMTA1
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAg
ICAgICAgIHwgIDE3ICstLS0KPj4+ICAgIGFyY2gveDg2L2tlcm5lbC9zZXR1cF9wZXJjcHUuYyB8
ICA2NiArKy0tLS0tLS0tLS0tLS0KPj4+ICAgIGRyaXZlcnMvYmFzZS9hcmNoX251bWEuYyAgICAg
ICB8ICA2OCArLS0tLS0tLS0tLS0tLS0tCj4+PiAgICBpbmNsdWRlL2xpbnV4L3BlcmNwdS5oICAg
ICAgICAgfCAgMTMgKy0tCj4+PiAgICBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAg
MTIgKysrCj4+PiAgICBtbS9wZXJjcHUuYyAgICAgICAgICAgICAgICAgICAgfCAxNDMgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+PiAgICAxNSBmaWxlcyBjaGFuZ2VkLCAxNjUg
aW5zZXJ0aW9ucygrKSwgNDQzIGRlbGV0aW9ucygtKQo+Pj4KPiBIaSBLZWZhbmcsCj4KPiBJIGFw
b2xvZ2l6ZSBmb3IgdGhlIGRlbGF5LiBJdCdzIGEgaG9saWRheSB3ZWVrIGluIHRoZSBVUyArIEkg
aGFkIHNvbWUKPiBwZXJzb25hbCB0aGluZ3MgY29tZSB1cCBhdCB0aGUgYmVnaW5uaW5nIG9mIGxh
c3Qgd2Vlay4gSSdsbCBoYXZlIGl0Cj4gcmV2aWV3ZWQgYnkgdG9tb3Jyb3cuCkl0J3MgZ3JlYXQg
dG8gaGVhciBhYm91dCB5b3VyIHJlcGx5LMKgIHRoYW5rcy4KPgo+IFRoYW5rcywKPiBEZW5uaXMK
PiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
