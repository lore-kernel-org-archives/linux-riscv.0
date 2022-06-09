Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD74C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjcvk8WthFQMWBW+IoRSEQf0rpsGmRDQeHRwbfJ1Ar8=; b=CPeDvlxhLH9mJj
	4QrpHGAeyfHe4r8IHmpq7rVUvog+CHGqugXSokEJPiCE5FuMKFyovsW7xUz9ImnFQspnXAWAluB6A
	1mBoSiUOGKMgf6aY0df7ASqDdofLLBkELgAEWW4H3yaWBjTHJ1KepGbQRQcrhdSdcIKy/vO/I/63Z
	gR5UShVsmnotJ20x6cnbaOhHJKRwQ+RiWLymk3YH/vc2QUKWk8iNAmjskPTGz3u0fTU6MupY7cXcQ
	BTFUU0OsI9UxA2nDJg05h57DTkuNmjlL5vY+riZ0V+sGprhPcQmRaBtLIPfAhTxY24AbcMczju7T/
	X8OmgC1s62TmOoXTA86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDIu-0009BW-SV; Thu, 09 Jun 2022 08:14:08 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDIj-00091t-N7; Thu, 09 Jun 2022 08:13:59 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LJcKx5gqNz8wtL;
	Thu,  9 Jun 2022 16:13:25 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 9 Jun 2022 16:13:45 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 9 Jun 2022 16:13:43 +0800
Message-ID: <8d5e867f-e51a-d763-5ac3-6dfc4e67a376@huawei.com>
Date: Thu, 9 Jun 2022 16:13:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: mawupeng <mawupeng1@huawei.com>
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
To: <anshuman.khandual@arm.com>, <david@redhat.com>, <corbet@lwn.net>,
	<will@kernel.org>, <ardb@kernel.org>, <catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <thunder.leizhen@huawei.com>,
	<wangkefeng.wang@huawei.com>, <gpiccoli@igalia.com>, <chenhuacai@kernel.org>,
	<geert@linux-m68k.org>, <vijayb@linux.microsoft.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-efi@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
 <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
 <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
 <1f2a76d5-7c4e-46bc-ce66-20a962eac73c@arm.com>
In-Reply-To: <1f2a76d5-7c4e-46bc-ce66-20a962eac73c@arm.com>
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_011358_118649_99717217 
X-CRM114-Status: UNSURE (   8.85  )
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

CgrlnKggMjAyMi82LzggMTg6MDAsIEFuc2h1bWFuIEtoYW5kdWFsIOWGmemBkzoKPiAKPiAKPiBP
biA2LzgvMjIgMDY6NTYsIG1hd3VwZW5nIHdyb3RlOgo+Pgo+Pgo+PiDlnKggMjAyMi82LzcgMjA6
MjUsIERhdmlkIEhpbGRlbmJyYW5kIOWGmemBkzoKPj4+IE9uIDA3LjA2LjIyIDExOjM4LCBXdXBl
bmcgTWEgd3JvdGU6Cj4+Pj4gRnJvbTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4K
Pj4+Pgo+Pj4+IEZvciBhIHN5c3RlbSBvbmx5IGhhdmUgbGltaXRlZCBtaXJyb3JlZCBtZW1vcnkg
b3Igc29tZSBudW1hIG5vZGUgd2l0aG91dAo+Pj4+IG1pcnJvcmVkIG1lbW9yeSwgdGhlIHBlciBu
b2RlIHZtZW1tYXAgcGFnZV9zdHJ1Y3RzIHByZWZlciB0byBhbGxvY2F0ZQo+Pj4+IG1lbW9yeSBm
cm9tIG1pcnJvcmVkIHJlZ2lvbiwgd2hpY2ggd2lsbCBsZWFkIHRvIHZtZW1tYXBfdmVyaWZ5KCkg
aW4KPj4+PiB2bWVtbWFwX3BvcHVsYXRlX2Jhc2VwYWdlcygpIHJlcG9ydCBsb3RzIG9mIHdhcm5p
bmcgbWVzc2FnZS4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggZGVtb3RlIHRoZSAicG90ZW50aWFsIG9m
Zm5vZGUgcGFnZV9zdHJ1Y3RzIiB3YXJuaW5nIG1lc3NhZ2VzCj4+Pj4gdG8gZGVidWcgbGV2ZWwg
dG8gYXZvaWQgYSB2ZXJ5IGxvbmcgcHJpbnQgZHVyaW5nIGJvb3R1cC4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1hIFd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5jb20+Cj4+Pj4gLS0tCj4+Pj4g
IMKgIG1tL3NwYXJzZS12bWVtbWFwLmMgfCAyICstCj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL21tL3Nw
YXJzZS12bWVtbWFwLmMgYi9tbS9zcGFyc2Utdm1lbW1hcC5jCj4+Pj4gaW5kZXggZjRmYTYxZGJi
ZWUzLi43OGRlYmRiODllYjEgMTAwNjQ0Cj4+Pj4gLS0tIGEvbW0vc3BhcnNlLXZtZW1tYXAuYwo+
Pj4+ICsrKyBiL21tL3NwYXJzZS12bWVtbWFwLmMKPj4+PiBAQCAtNTI4LDcgKzUyOCw3IEBAIHZv
aWQgX19tZW1pbml0IHZtZW1tYXBfdmVyaWZ5KHB0ZV90ICpwdGUsIGludCBub2RlLAo+Pj4+ICDC
oMKgwqDCoMKgIGludCBhY3R1YWxfbm9kZSA9IGVhcmx5X3Bmbl90b19uaWQocGZuKTsKPj4+PiAg
wqAgwqDCoMKgwqDCoCBpZiAobm9kZV9kaXN0YW5jZShhY3R1YWxfbm9kZSwgbm9kZSkgPiBMT0NB
TF9ESVNUQU5DRSkKPj4+PiAtwqDCoMKgwqDCoMKgwqAgcHJfd2FybigiWyVseC0lbHhdIHBvdGVu
dGlhbCBvZmZub2RlIHBhZ2Vfc3RydWN0c1xuIiwKPj4+PiArwqDCoMKgwqDCoMKgwqAgcHJfZGVi
dWcoIlslbHgtJWx4XSBwb3RlbnRpYWwgb2Zmbm9kZSBwYWdlX3N0cnVjdHNcbiIsCj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJ0LCBlbmQgLSAxKTsKPj4+PiAgwqAgfQo+Pj4+
ICAgIAo+Pj4KPj4+IFRoaXMgd2lsbCBwb3NzaWJseSBoaWRlIGl0IGluIGVudmlyb25tZW50cyB3
aGVyZSB0aGlzIG1pZ2h0IGluZGVlZAo+Pj4gaW5kaWNhdGUgcGVyZm9ybWFuY2UgaXNzdWVzLgo+
Pj4KPj4+IFdoYXQgYWJvdXQgYSBwcl93YXJuX29uY2UoKT8KPj4+Cj4+Cj4+IFN1cmUuCj4+Cj4+
IFRoaXMgd2lsbCB3b3Jrcy4gV2UgY2FuIGNlcnRhaW5seSB1c2UgYSBwcl93YXJuX29uY2UoKS4K
PiAKPiBXaHkgbm90IHByX3dhcm5fcmF0ZWxpbWl0ZWQoKSBsaWtlIGluIHRoZSBwcmV2aW91cyBw
YXRjaCA/CgpGdW5jdGlvbiB2bWVtbWFwX3BvcHVsYXRlX2Jhc2VwYWdlcygpIGlzIHVzZWQgdG8g
cG9wdWxhdGUgYmFzZSBwYWdlcy4KU3lzdGVtIHdpdGggaHVnZSBtZW1vcnkgd2lsbCBwcm9kdWNl
IGxvdHMgbG90cyBvZiB3YXJuaW5nIG1lc3NhZ2UKZHVyaW5nIHRoaXMgcG9wdWxhdGUgcHJvY2Vz
cyBldmVuIHdpdGggcmF0ZWxpbWl0ZWQuIFRoaXMgbWF5IGxlYWQgdG8gc2xvdwpzdGFydHVwLgoK
VGhhbmtzIGZvciByZXZpZXdpbmcuCgo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
