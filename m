Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48946C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTvmHaL0CALzcY1PYFXPiRhsLjwMGj8H/QzvGVHMqhY=; b=KYBeIjfZzaOnLp
	VhOGLzY/FSXNY6LpbVMmP64HA1GNjifg9xQejFcSzo3phEvwRlrguVjqDXLvAXK+fspWXtW66MkM4
	y1fdyfX2PaCqZStVeuKl2Od7L3FAF3cnj7AD6YVDOtbWsfAKsNhNDyRKBvzXjD4lkTyuF2OFysUEB
	cKRyjgwxUfS6d322NnP98Cy8bQqVL/xvegei6qQqVqX33zt4Q5bdp9YMb1DrKhLGwkYFU8rRKxWVw
	3EMRKG4WqqrVsfPXQFkstnRMmK2lOS0rH7r3ZWWxSvIsgFxmnfluFsEScpieM04qN81y//DJgL/wa
	kCI+yWbQnzqUftlJhJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqq3-007Y3F-C3; Fri, 21 Oct 2022 12:09:23 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqpy-007Y0x-3L
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 12:09:22 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mv36Z431NzmVC9;
	Fri, 21 Oct 2022 20:04:22 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:08:37 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 20:08:36 +0800
Message-ID: <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
Date: Fri, 21 Oct 2022 20:08:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Andrea Parri <parri.andrea@gmail.com>, Guo Ren <guoren@kernel.org>
CC: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
 <Y1JaE/ot91Z0KXuC@andrea>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Y1JaE/ot91Z0KXuC@andrea>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_050918_331157_0217EF1D 
X-CRM114-Status: GOOD (  11.74  )
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

CgrlnKggMjAyMi8xMC8yMSAxNjozNiwgQW5kcmVhIFBhcnJpIOWGmemBkzoKPj4+PiArICAgICBh
dG9taWNfc2V0X3JlbGVhc2UoJnNwaW5fc2hhZG93X3N0YWNrLCAwKTsKPj4+Cj4+PiBIYXZlIG5v
dCByZWFsbHkgbG9va2VkIHRoZSBkZXRhaWxzOiBzaG91bGQgdGhlcmUgYmUgYSBtYXRjaGluZyBh
Y3F1aXJlPwo+Pgo+PiBJIHVzZSBhdG9taWNfc2V0X3JlbGVhc2UgaGVyZSwgYmVjYXVzZSBJIG5l
ZWQgZWFybGllciBtZW1vcnkKPj4gb3BlcmF0aW9ucyBmaW5pc2hlZCB0byBtYWtlIHN1cmUgdGhl
IHNwIGlzIHJlYWR5IHRoZW4gc2V0IHRoZSBzcGluCj4+IGZsYWcuCj4+Cj4+IFRoZSBmb2xsb3dp
bmcgbWVtb3J5IG9wZXJhdGlvbnMgb3JkZXIgaXMgbm90IGltcG9ydGFudCwgYmVjYXVzZSB3ZQo+
PiBqdXN0IGNhcmUgYWJvdXQgc3AgdmFsdWUuCj4+Cj4+IEFsc28sIHdlIHVzZSByZWxheCBhbW9z
d2FwIGJlZm9yZSwgYmVjYXVzZSBzcCBoYXMgbmF0dXJlbGx5Cj4+IGRlcGVuZGVuY3kuIEJ1dCBn
aXZpbmcgdGhlbSBSQ3NjIGlzIG9rYXkgaGVyZSwgYmVjYXVzZSB3ZSBkb24ndCBjYXJlCj4+IGFi
b3V0IHBlcmZvcm1hbmNlIGhlcmUuCj4gCj4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4K
PiAKPiBJJ20gbm90IHJlYWxseSBzdWdnZXN0aW5nIHRvIGFkZCB1bm5lZWRlZCBzeW5jaHJvbml6
YXRpb24sIGV2ZW4gbW9yZQo+IHNvIGluIGxvY2FsL3ByaXZhdGUgY29uc3RydWN0cyBhcyBpbiB0
aGlzIGNhc2UuICBJdCBqdXN0IGZlbHQgb2RkIHRvCj4gc2VlIHRoZSByZWxlYXNlIHdpdGhvdXQg
YSBwYWlyaW5nIGFjcXVpcmUsIHNvIEkgYXNrZWQuICA7LSkKPiAKPiBUaGFua3MsCj4gICAgQW5k
cmVhCj4gCj4gCj4+IGVnOgo+PiAgIGhhbmRsZV9rZXJuZWxfc3RhY2tfb3ZlcmZsb3c6Cj4+ICsx
OiAgICAgbGEgc3AsIHNwaW5fc2hhZG93X3N0YWNrCj4+ICsgICAgICAgYW1vc3dhcC53LmFxcmwg
c3AsIHNwLCAoc3ApCj4+ICsgICAgICAgYm5leiBzcCwgMWIKPj4gKwo+PiAuLi4uCj4+ICsgICAg
IHNtcF9zdG9yZV9yZWxlYXNlKCZzcGluX3NoYWRvd19zdGFjaywgMCk7Cj4+ICsgICAgIHNtcF9t
YigpOwo+IAoKSGkgQW5kcmVhLCBaaGFuZywgR3VvOgoJQ29uc2lkZXIgdGhpcyBpbXBsZW1lbnRh
dGlvbjopCgoJc21wX3N0b3JlX21iKCZzcGluX3NoYWRvd19zdGFjaywgMCk7CgpUaGFua3MsClRv
bmcuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
