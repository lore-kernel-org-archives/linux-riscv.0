Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A6ECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Bx0YvdlIcAH7+xW3KRrAtMttWUx989K69kcccEhBSA=; b=jRPQzXLE0sLnjL
	b6wh0XuumtLdycRHjbe6JvGrtvYmguvAelWXG8nakZaDoFjrKPZJaP6rN8Lail0LDs/dXfzL7wLDW
	r/PHoewQOPdWyEJqgbz5WDRubc1RbejQthi8KCoKv+NN0Im6HV9RNyOMKA0MEj3VXr78bV13xCjN2
	12oL3O4MIdPu0lFunQlMenlF/2Lpso64rOTGtiF13ZHC+zExOZkaFf4WJEv1l1IxcPEmcu7ALCYMX
	lIuBVyd0CrcOZKo+EfCiQEOVOwlbNs4pONlYxQRMmc6ZJkzK0Bm8zzqK7Fiyb+/0oky4xtykk0Paz
	HqUXOWMMJ/RusERJz2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtEL-007sAv-3A; Sat, 27 Aug 2022 10:39:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtEH-007rrc-6Y
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 10:39:55 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MFCnV21PgznTWK;
	Sat, 27 Aug 2022 18:37:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:39:40 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:39:39 +0800
Message-ID: <301cd27e-d003-584b-2eb0-8fa025348cff@huawei.com>
Date: Sat, 27 Aug 2022 18:39:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 2/2] riscv: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
To: Andrew Jones <ajones@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-3-tongtiangen@huawei.com>
 <20220825110602.bog5mjpascvikwxx@kamzik>
 <7718a9bc-e976-daeb-f490-e7b5190e50b6@huawei.com>
 <20220826081607.ci42sbffrmsfhk2w@kamzik>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220826081607.ci42sbffrmsfhk2w@kamzik>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_033953_611359_9FEBA049 
X-CRM114-Status: GOOD (  15.49  )
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

CgrlnKggMjAyMi84LzI2IDE2OjE2LCBBbmRyZXcgSm9uZXMg5YaZ6YGTOgo+IE9uIEZyaSwgQXVn
IDI2LCAyMDIyIGF0IDAyOjQ0OjQ4UE0gKzA4MDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4KPj4K
Pj4g5ZyoIDIwMjIvOC8yNSAxOTowNiwgQW5kcmV3IEpvbmVzIOWGmemBkzoKPj4+IE9uIE1vbiwg
QXVnIDE1LCAyMDIyIGF0IDAzOjIwOjI1QU0gKzAwMDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4+
PiBDdXJyZW50bHksIFRoZSBleHRhYmxlIHR5cGUgRVhfVFlQRV9VQUNDRVNTX0VSUl9aRVJPIGlz
IHVzZWQgYnkKPj4+PiBfX2dldC9wdXRfa2VybmVsX25vZmF1bHQoKSwgYnV0IHRob3NlIGhlbHBl
cnMgYXJlIG5vdCB1YWNjZXNzIHR5cGUsIHNvIHdlCj4+Pj4gYWRkIGEgbmV3IGV4dGFibGUgdHlw
ZSBFWF9UWVBFX0tBQ0NFU1NfRVJSX1pFUk8gd2hpY2ggY2FuIGJlIHVzZWQgYnkKPj4+PiBfX2dl
dC9wdXRfa2VybmVsX25vX2ZhdWx0KCkuCj4+Pj4KPj4+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0
aG91dCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLgo+Pj4KPj4+IFRoaXMgaXNuJ3QgcXVpdGUgdHJ1
ZS4gX19nZXQvcHV0X2tlcm5lbF9ub2ZhdWx0IG5vdyBzZXRzIGEgZGlmZmVyZW50Cj4+PiBleHRh
YmxlIHR5cGUgKGFzIHRoZSBjb21taXQgbWVzc2FnZSBzYXlzKS4gQnV0LCBub3RoaW5nIHNwZWNp
YWwgc2VlbXMKPj4+IHRvIGJlIGRvbmUgd2l0aCB0aGF0LCBzbyB0aGVyZSdzIGVmZmVjdGl2ZWx5
IG5vIGZ1bmN0aW9uYWwgY2hhbmdlLiBDYW4KPj4+IHlvdSBwbGVhc2UgZWxhYm9yYXRlIG9uIHRo
ZSBtb3RpdmF0aW9uIGZvciB0aGlzIGNoYW5nZT8gV2hlcmUgd2lsbCB0aGUKPj4+IEtBQ0NFU1Mg
dHlwZSBuZWVkIHRvIGJlIGRpc3Rpbmd1aXNoZWQgZnJvbSB0aGUgVUFDQ0VTUyB0eXBlPwo+Pgo+
PiBUaGUgaW50cm9kdWN0aW9uIG9mIEVYX1RZUEVfS0FDQ0VTU19FUlJfWkVSTyBkb2VzIG5vdCBj
aGFuZ2UgYW55IGZ1bmN0aW9uLAo+PiBidXQgbWFrZXMgYSBjb3JyZWN0IGRpc3RpbmN0aW9uIGlu
IHRoZSBhY3R1YWwgdHlwZSwgaW5kaWNhdGluZyB0aGF0IHRoZXJlCj4+IGFyZSBpbmRlZWQgc29t
ZSBrYWNjZXNzIGVudHJpZXMgaW4gZXh0YWJsZS4gSSB0aGluayB0aGlzIG9wdGltaXphdGlvbiBp
cwo+PiBtb3JlIGNsZWFyIGFuZCByZWFzb25hYmxlLgo+IAo+IFdlbGwsIGNyZWF0aW5nIG5ldyB0
eXBlcywganVzdCBmb3IgbmV3IHR5cGUgc2FrZSwganVzdCBibG9hdHMgY29kZS4KPiAKPj4KPj4g
QSBmZXcgd2Vla3MgYWdvLCBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciBvbiBhcm02NFsxXS4gSSB0
aGluayB0aGlzCj4+IG9wdGltaXphdGlvbiBjYW4gYWxzbyBiZSB1c2VkIG9uIHJpc2N2Lgo+Pgo+
PiBXZSBjYW4gZG8gc29tZSBmZWF0dXJlcyB0aGF0IGFyZSB1c2VkIG9uIHVhY2NzcyBidXQgbm90
IGFwcGxpY2FibGUgb24KPj4ga2FjY2VzcyBpbiB0aGUgZnV0dXJlWzJdLgo+Pgo+PiBbMV0KPj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDYyMTA3MjYzOC4xMjczNTk0LTItdG9u
Z3RpYW5nZW5AaHVhd2VpLmNvbS8KPj4gWzJdaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIyMDgxMjA3MDU1Ny4xMDI4NDk5LTQtdG9uZ3RpYW5nZW5AaHVhd2VpLmNvbS8KPj4KPiAKPiBU
aGlzIGlzIHBhcnQgb2YgdGhlIGluZm9ybWF0aW9uLCBidXQgSSBoYWQgYWxyZWFkeSBmb3VuZCB0
aGlzLiBXaGF0J3MKPiBzdGlsbCBtaXNzaW5nIHRvIG1lIGFyZSB0aGUgcmlzY3YgcGF0Y2hlcywg
b3IgYXQgbGVhc3QgYSByaXNjdiBwbGFuLCBmb3IKPiBhY3R1YWxseSBpbXBsZW1lbnRpbmcgc29t
ZXRoaW5nIHdoaWNoIHJlcXVpcmVzIGthY2Nlc3MgYW5kIHVhY2Nlc3MgdG8gaGF2ZQo+IGRpc3Rp
bmN0IHR5cGVzLgo+IAo+IFRoYW5rcywKPiBkcmV3CgpBdCBwcmVzZW50LCB0aGVyZSBpcyBubyBz
dWNoIHBsYW4gb24gcmlzY3YsIGJlY2F1c2UgaXQgaXMgcmVseSBvbiAKaGFyZHdhcmUgc3VwcG9y
dC4KSSB0aGluayB0aGlzIHBhdGNoIGNhbiBiZSBtZXJnZWQgYXMgYSBzbWFsbCBjb2RlIG9wdGlt
aXphdGlvbiBhbmQgCndpdGhvdXQgYW55IGZ1bmN0aW9uIGNoYW5nZS4KClRoYW5rcywKVG9uZy4K
Cj4gCj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
