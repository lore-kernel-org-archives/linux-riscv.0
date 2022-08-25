Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002FC04AA5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 03:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N01o9V+MT7SEqIi+zxxO5HkyqEQY964gy+/pZbD+k5Q=; b=JDuEFbyOOyFvSb
	LalN5ms2OcZc3tZXZMA/BTbP9iRoE/aVlsfdVOsBGxOrN2vu0l63Sz3lcNt2aWeK9/EzlO+wmLYQ5
	uiLWb7oeRx5vc9n0gTlLKe+9n1/9J9QjM/X0BnaQgmgdfgzB4fgQsHNls7dQCd52oaKOSvvtjbYti
	uUtB+SvFceuvmW/pZaz1JuLjJaAHPz01t4LqNmh9Ya+MN9D4Fk71cuxGkLW4+k66eAQX4HHdMFYrh
	75vwYeEYIxJDcrm9I1pZkaY79P6PeAaZNELnhKG/8r79bMsh9L++SthrTWVRQ3JOz6vjKFX1wpakL
	OnG4CVuE+nK2Qvhki0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3B8-004tl8-NG; Thu, 25 Aug 2022 03:05:10 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR3B5-004tdJ-Qr
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 03:05:09 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MCnpc3y4GzGppf;
	Thu, 25 Aug 2022 11:03:20 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 25 Aug 2022 11:05:01 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 25 Aug 2022 11:05:00 +0800
Message-ID: <868e2e01-3462-dcb3-257a-f71d904b2a27@huawei.com>
Date: Thu, 25 Aug 2022 11:04:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 0/2]riscv: some refactorings realted to uaccess
 and extable
To: <Conor.Dooley@microchip.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <4063da85-b110-4afd-2023-59d4da41c27f@huawei.com>
 <207ef9da-34d3-b059-9bfd-871a0c6ddab2@microchip.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <207ef9da-34d3-b059-9bfd-871a0c6ddab2@microchip.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_200508_080372_15C4F015 
X-CRM114-Status: GOOD (  10.17  )
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

CgrlnKggMjAyMi84LzI1IDA6NDksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAyNC8wOC8yMDIyIDA3OjMxLCBUb25nIFRpYW5nZW4gd3JvdGU6Cj4+IEhpIHJpc2N2IG1h
aW50YWluZXJzLCBraW5kbHkgcGluZy4uLgo+Pgo+PiBUaGFua3MsCj4+IFRvbmcuCj4+Cj4+IOWc
qCAyMDIyLzgvMTUgMTE6MjAsIFRvbmcgVGlhbmdlbiDlhpnpgZM6Cj4gCj4gSXQncyBiYXJlbHkg
YmVlbiBtb3JlIHRoYW4gYSB3ZWVrLCByZWxheCA6KQo+IAo+IGNoZWNrcGF0Y2ggcmVhbGx5IGRv
ZXMgbm90IGxpa2Ugb25lIG9mIHRoZSBtYWNyb3MgeW91IGFkZGVkLiBQbGVhc2UKPiBjb25zaWRl
ciB3aGV0aGVyIHRoaXMgaXMgdmFsaWQ6Cj4gCj4gRVJST1I6IE1hY3JvcyB3aXRoIGNvbXBsZXgg
dmFsdWVzIHNob3VsZCBiZSBlbmNsb3NlZCBpbiBwYXJlbnRoZXNlcwo+ICMzODogRklMRTogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tZXh0YWJsZS5oOjYxOgo+ICsjZGVmaW5lIF9BU01fRVhU
QUJMRV9LQUNDRVNTX0VSUl9aRVJPKGluc24sIGZpeHVwLCBlcnIsIHplcm8pICAgICAgICAgIFwK
PiArICAgICAgIF9fREVGSU5FX0FTTV9HUFJfTlVNUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICBfX0FTTV9FWFRBQkxFX1JBVygjaW5zbiwgI2Zp
eHVwLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgX19zdHJpbmdpZnkoRVhfVFlQRV9LQUNDRVNTX0VSUl9aRVJPKSwgICAgICAgIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICIoIiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIEVYX0RBVEFf
UkVHKEVSUiwgZXJyKSAiIHwgIiAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBFWF9EQVRBX1JFRyhaRVJPLCB6ZXJvKSAgICAgICAgICAgICAgICAgICAgIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICIpIikKPiAKPiBUaGFua3MsCj4gQ29ub3IuCgoK
SnVkZ2luZyBmcm9tIHRoZSB1c2UgY29udGV4dCBvZiB0aGlzIG1hY3JvLCB0aGVyZSBpcyBubyBw
cm9ibGVtIHdpdGggdGhlIApkZWZpbml0aW9uIG9mIHRoaXMgbWFjcm8uCgpJbiBhZGRpdGlvbiwg
SSByZWZlciB0byB0aGUgZGVmaW5pdGlvbiBvZiBtYWNybyAKX0FTTV9FWFRBQkxFX1VBQ0NFU1Nf
RVJSX1pFUk8gZm9yIHRoZSBzdHlsZSBvZiB0aGlzIG1hY3JvLiBUaGUgCmRpZmZlcmVuY2UgaXMg
dGhhdCB0aGUgdHlwZXMgdXNlZCBpbiB0aGUgbWFjcm8gYXJlIGRpZmZlcmVudC4KCjopCgpUaGFu
a3MsClRvbmcuCgo+IAo+Pj4gVGhpcyBwYXRjaHNldCBkbyBzb21lIHJlZmFjdG9yaW5ncyByZWxh
dGVkIHRvIHJpc2N2J3MgdWFjY2VzcyBhbmQgZXh0YWJsZSwKPj4+IG1haW5seSBmb3IgdGhlIHVz
YWdlIG9mIF9fZ2V0L3B1dF91c2VyX25vY2hlY2soKSB3aGljaCBub3QgZGlzdGluZ3Vpc2ggdXNl
cgo+Pj4gYWNjZXNzIGFuZCBrZXJuZWwgYWNjZXNzLgo+Pj4KPj4+IHYxIC0+IHYyOgo+Pj4gIMKg
wqAgQWNjb3JkaW5nIHRvIENvbm9yJ3Mgc3VnZ2VzdGlvbiwgc3BsaXQgaW50byB0d28gbG9naWNh
bGx5IGluZGVwZW5kZW50Cj4+PiAgwqDCoCBwYXRjaGVzLgo+Pj4KPj4+IFRvbmcgVGlhbmdlbiAo
Mik6Cj4+PiAgwqDCoCByaXNjdjogdWFjY2VzczogcmVuYW1lIF9fZ2V0L3B1dF91c2VyX25vY2hl
Y2sgdG8gX19nZXQvcHV0X21lbV9ub2NoZWNrCj4+PiAgwqDCoCByaXNjdjogZXh0YWJsZTogYWRk
IG5ldyBleHRhYmxlIHR5cGUgRVhfVFlQRV9LQUNDRVNTX0VSUl9aRVJPIHN1cHBvcnQKPj4+Cj4+
PiAgwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tZXh0YWJsZS5oIHzCoCAxMiArKwo+Pj4g
IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5owqDCoMKgwqAgfCAxNjIgKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tCj4+PiAgwqAgYXJjaC9yaXNjdi9tbS9leHRhYmxlLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4+ICDCoCAzIGZpbGVzIGNoYW5nZWQs
IDk0IGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9ucygtKQo+Pj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
