Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B0CECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSQp+CBlDc8lHAxW978mzbEM8GFUO82t1AMlgtCfOqQ=; b=XnYPnK0e7+/2EQ
	ROYcOpt1vWpV0l7eQZDgWwBZTR7Y2PqsskUECEuXEIwDw/mQWQBPjgufP6dAhIGDlDIiNQz0Jet49
	l3ZvDgcboUxP2FFP3z/FuF2rH+ZbrTZwwLq13ICXKGW0aXzP9xogmP3HpTLFE8WD99R3eFKSqIDzM
	BpxZj7VsB/Jp8plnkrv6BvzTCxt0kQhFE8UGQchL8h3uikFi4DVLuq1QgLFmuo2it5n17zfVIui8P
	4RtYJTBf6WyCkL34+hoNoy1HeuJ6OoZt67y2tYhl1ISgaaXD0oQBNQSabO998seyzu2n/w6aOmFLU
	JxfKlowPmaihB7OJ5v+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT5Q-00EqZi-Ca; Fri, 26 Aug 2022 06:45:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT5M-00EqXv-7k
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 06:44:58 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MDVZk42sGzYcpx;
	Fri, 26 Aug 2022 14:40:30 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 14:44:49 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 14:44:48 +0800
Message-ID: <7718a9bc-e976-daeb-f490-e7b5190e50b6@huawei.com>
Date: Fri, 26 Aug 2022 14:44:48 +0800
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
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220825110602.bog5mjpascvikwxx@kamzik>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234456_476198_F4ACAA7B 
X-CRM114-Status: UNSURE (   9.65  )
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

CgrlnKggMjAyMi84LzI1IDE5OjA2LCBBbmRyZXcgSm9uZXMg5YaZ6YGTOgo+IE9uIE1vbiwgQXVn
IDE1LCAyMDIyIGF0IDAzOjIwOjI1QU0gKzAwMDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4gQ3Vy
cmVudGx5LCBUaGUgZXh0YWJsZSB0eXBlIEVYX1RZUEVfVUFDQ0VTU19FUlJfWkVSTyBpcyB1c2Vk
IGJ5Cj4+IF9fZ2V0L3B1dF9rZXJuZWxfbm9mYXVsdCgpLCBidXQgdGhvc2UgaGVscGVycyBhcmUg
bm90IHVhY2Nlc3MgdHlwZSwgc28gd2UKPj4gYWRkIGEgbmV3IGV4dGFibGUgdHlwZSBFWF9UWVBF
X0tBQ0NFU1NfRVJSX1pFUk8gd2hpY2ggY2FuIGJlIHVzZWQgYnkKPj4gX19nZXQvcHV0X2tlcm5l
bF9ub19mYXVsdCgpLgo+Pgo+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rp
b25hbCBjaGFuZ2VzLgo+IAo+IFRoaXMgaXNuJ3QgcXVpdGUgdHJ1ZS4gX19nZXQvcHV0X2tlcm5l
bF9ub2ZhdWx0IG5vdyBzZXRzIGEgZGlmZmVyZW50Cj4gZXh0YWJsZSB0eXBlIChhcyB0aGUgY29t
bWl0IG1lc3NhZ2Ugc2F5cykuIEJ1dCwgbm90aGluZyBzcGVjaWFsIHNlZW1zCj4gdG8gYmUgZG9u
ZSB3aXRoIHRoYXQsIHNvIHRoZXJlJ3MgZWZmZWN0aXZlbHkgbm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
IENhbgo+IHlvdSBwbGVhc2UgZWxhYm9yYXRlIG9uIHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIGNo
YW5nZT8gV2hlcmUgd2lsbCB0aGUKPiBLQUNDRVNTIHR5cGUgbmVlZCB0byBiZSBkaXN0aW5ndWlz
aGVkIGZyb20gdGhlIFVBQ0NFU1MgdHlwZT8KClRoZSBpbnRyb2R1Y3Rpb24gb2YgRVhfVFlQRV9L
QUNDRVNTX0VSUl9aRVJPIGRvZXMgbm90IGNoYW5nZSBhbnkgCmZ1bmN0aW9uLCBidXQgbWFrZXMg
YSBjb3JyZWN0IGRpc3RpbmN0aW9uIGluIHRoZSBhY3R1YWwgdHlwZSwgaW5kaWNhdGluZyAKdGhh
dCB0aGVyZSBhcmUgaW5kZWVkIHNvbWUga2FjY2VzcyBlbnRyaWVzIGluIGV4dGFibGUuIEkgdGhp
bmsgdGhpcyAKb3B0aW1pemF0aW9uIGlzIG1vcmUgY2xlYXIgYW5kIHJlYXNvbmFibGUuCgpBIGZl
dyB3ZWVrcyBhZ28sIEkgZGlkIHNvbWV0aGluZyBzaW1pbGFyIG9uIGFybTY0WzFdLiBJIHRoaW5r
IHRoaXMgCm9wdGltaXphdGlvbiBjYW4gYWxzbyBiZSB1c2VkIG9uIHJpc2N2LgoKV2UgY2FuIGRv
IHNvbWUgZmVhdHVyZXMgdGhhdCBhcmUgdXNlZCBvbiB1YWNjc3MgYnV0IG5vdCBhcHBsaWNhYmxl
IG9uIAprYWNjZXNzIGluIHRoZSBmdXR1cmVbMl0uCgpbMV0gCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyMjA2MjEwNzI2MzguMTI3MzU5NC0yLXRvbmd0aWFuZ2VuQGh1YXdlaS5jb20v
ClsyXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA4MTIwNzA1NTcuMTAyODQ5OS00
LXRvbmd0aWFuZ2VuQGh1YXdlaS5jb20vCgpUaGFua3MsClRvbmcuCgo+IAo+IFRoYW5rcywKPiBk
cmV3Cj4gLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
