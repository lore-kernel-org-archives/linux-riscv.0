Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CAFECAAD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAjuW+yHgybS5VedPl2B99ekA1+V6+RMCe4HlWZoSwE=; b=Dky36bRQDAS9f+
	iIIUs2JXMmDcFuhyoUocOwtUyFKogFNA/f85MNQfgq1rbcSErPM0SW0n0eSghlu6sDcaWb2X2wwh9
	2Ox2AUZNpQX+WvpiG294A3Pk6ky6xurgx0XN9fRH5l3NV9pn7P7HUgk9YYXdzQ6mMTl3UTOhhy6vV
	lKOeNh+Q303pvUs8cS8N0XqotqEp5gBwiHzPvf0l8KzIXWw/oh12UfTkEjw4hXHAMHgxwOXL5WADO
	JeESRllh+lO/kNERrR3D5NqbPSPSV/cBPHX93cGnF/H5TdNV65KE9NyIG8dMyL+EqAtzD9P8HTCai
	/ay2mRFzQuGNEh2E/qsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtEQ-007sOW-UI; Sat, 27 Aug 2022 10:40:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRtEJ-007rsK-6P
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 10:39:56 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MFCm95yQQzkWcF;
	Sat, 27 Aug 2022 18:36:09 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:39:44 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 27 Aug 2022 18:39:42 +0800
Message-ID: <b1af8198-3291-149e-cd8b-c55d7321deb7@huawei.com>
Date: Sat, 27 Aug 2022 18:39:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
To: Andrew Jones <ajones@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
 <20220825105600.ezueddmwehob42rf@kamzik>
 <3541c980-7fcf-7047-cec7-3c2ca6381a99@huawei.com>
 <20220826074318.g6nwri5ziiutiio5@kamzik>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20220826074318.g6nwri5ziiutiio5@kamzik>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_033955_619305_32A91D71 
X-CRM114-Status: GOOD (  10.89  )
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

CgrlnKggMjAyMi84LzI2IDE1OjQzLCBBbmRyZXcgSm9uZXMg5YaZ6YGTOgo+IE9uIEZyaSwgQXVn
IDI2LCAyMDIyIGF0IDAyOjMzOjQ3UE0gKzA4MDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4KPj4K
Pj4g5ZyoIDIwMjIvOC8yNSAxODo1NiwgQW5kcmV3IEpvbmVzIOWGmemBkzoKPj4+IE9uIE1vbiwg
QXVnIDE1LCAyMDIyIGF0IDAzOjIwOjI0QU0gKzAwMDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4+
PiBDdXJyZW50LCBUaGUgaGVscGVycyBfX2dldC9wdXRfdXNlcl9ub2NoZWNrKCkgaXMgdXNlZCBi
eSBnZXQvcHV0X3VzZXIoKSBhbmQKPj4+PiBfX2dldC9wdXRfa2VybmVsX25vZmF1bHQoKSwgd2hp
Y2ggaXMgbm90IGFsd2F5cyB1YWNjZXNzLCBzbyB0aGUgbmFtZSB3aXRoCj4+Pj4gKnVzZXIqIGlz
IG5vdCBhcHByb3ByaWF0ZS4KPj4+Pgo+Pj4+IEFsc28gcmVuYW1lIHh4eF91c2VyX3h4eCB0byB4
eHhfbWVtX3h4ICBvbiB0aGUgY2FsbCBwYXRoIG9mCj4+Pj4gX19nZXQvcHV0X3VzZXJfbm9jaGVj
aygpCj4+Pj4KPj4+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rpb25hbCBj
aGFuZ2VzLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdl
bkBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFj
Y2Vzcy5oIHwgNDggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+Pj4+IGluZGV4IDg1NTQ1MGJlZDlmNS4uMTM3MGRhMDU1
YjQ0IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4+
Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4+PiBAQCAtNTAsNyAr
NTAsNyBAQAo+Pj4+ICAgICAqIGNhbGwuCj4+Pj4gICAgICovCj4+Pj4gLSNkZWZpbmUgX19nZXRf
dXNlcl9hc20oaW5zbiwgeCwgcHRyLCBlcnIpCQkJXAo+Pj4+ICsjZGVmaW5lIF9fZ2V0X21lbV9h
c20oaW5zbiwgeCwgcHRyLCBlcnIpCQkJXAo+Pj4+ICAgIGRvIHsJCQkJCQkJCVwKPj4+PiAgICAJ
X190eXBlb2ZfXyh4KSBfX3g7CQkJCQlcCj4+Pj4gICAgCV9fYXNtX18gX192b2xhdGlsZV9fICgJ
CQkJCVwKPj4+PiBAQCAtNjQsMTIgKzY0LDEyIEBAIGRvIHsJCQkJCQkJCVwKPj4+PiAgICB9IHdo
aWxlICgwKQo+Pj4+ICAgICNpZmRlZiBDT05GSUdfNjRCSVQKPj4+PiAtI2RlZmluZSBfX2dldF91
c2VyXzgoeCwgcHRyLCBlcnIpIFwKPj4+PiAtCV9fZ2V0X3VzZXJfYXNtKCJsZCIsIHgsIHB0ciwg
ZXJyKQo+Pj4+ICsjZGVmaW5lIF9fZ2V0X21lbV84KHgsIHB0ciwgZXJyKSBcCj4+Pj4gKwlfX2dl
dF9tZW1fYXNtKCJsZCIsIHgsIHB0ciwgZXJyKQo+Pj4+ICAgICNlbHNlIC8qICFDT05GSUdfNjRC
SVQgKi8KPj4+PiAtI2RlZmluZSBfX2dldF91c2VyXzgoeCwgcHRyLCBlcnIpCQkJCVwKPj4+PiAr
I2RlZmluZSBfX2dldF9tZW1fOCh4LCBwdHIsIGVycikJCQkJXAo+Pj4+ICAgIGRvIHsJCQkJCQkJ
CVwKPj4+PiAtCXUzMiBfX3VzZXIgKl9fcHRyID0gKHUzMiBfX3VzZXIgKikocHRyKTsJCVwKPj4+
PiArCXUzMiAqX19wdHIgPSAodTMyICopKHB0cik7CQkJCVwKPj4+Cj4+PiBEb2Vzbid0IGNhc3Rp
bmcgYXdheSBfX3VzZXIgcmVkdWNlIHNwYXJzZSdzIHV0aWxpdHk/Cj4+Cj4+ICBGcm9tIHRoZSBj
YWxsIGxvZ2ljWzFdLCB0aGUgYWRkcmVzcyBwYXNzZWQgaW50byB0aGlzIG1hY3JvIGlzIG5vdAo+
PiBuZWNlc3NhcmlseSBfX3VzZXIuIEkgdW5kZXJzdGFuZCB0aGF0IG5vIHByb2JsZW0gd2lsbCBi
ZSBpbnRyb2R1Y2VkIGZvcgo+PiBzcGFyc2UncyB1dGlsaXR5Lgo+Pgo+PiBJbiBhZGRpdGlvbiwg
dGhlcmUgaXMgbm8gbmVlZCB0byBkbyBhIHBvaW50ZXIgY29udmVyc2lvbiBoZXJlLCB3aWxsIGJl
IGZpeGVkCj4+IG5leHQgdmVyc2lvbi4KPj4KPj4gWzFdIF9fZ2V0X2tlcm5lbF9ub2ZhdWx0IC0+
IF9fZ2V0X21lbV9ub2NoZWNrIC0+IF9fZ2V0X21lbV84Cj4gCj4gWWVzLCBJIHVuZGVyc3Rvb2Qg
dGhhdC4gTXkgY29uY2VybiB3YXMgZm9yIHRoZSB0aW1lcyB0aGF0IHRoZSBhZGRyZXNzIHdhcwo+
IF9fdXNlciBhcyB3ZSdkIG5vIGxvbmdlciBnZXQgdGhhdCBjaGVjayBmb3IgdGhlbS4KCkNoZWNr
IF9fdXNlciBwdHIgYXQgX19nZXRfdXNlcigpIGhhcyB0aGUgc2FtZSBlZmZlY3Q/IElzIHRoaXMg
CnVuZGVyc3RhbmRpbmcgY29ycmVjdO+8nwoKVGhhbmtzLApUb25nLgoKPiAKPiBUaGFua3MsCj4g
ZHJldwo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
