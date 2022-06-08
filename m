Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B284EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyr9HRMyWQom9yUU8G7pzR5LD+wclxiRR1vFPdphwnw=; b=HwQtW1XnITbVKQ
	MNe/IiXr5TR8fNsxeehwfrctvH70+f0MdCMrJFUKOHqyuxWoqvoOArYBUAObJXTSMb2X2SjutJhop
	WpsE8le7pjCCvVuqGYai78BCvJDcySlGG0WUA9sQgrkLtjeiOasH13jn60gNsQ/eJC/KTx1nMUN4r
	ZlEfv/OPjFJkrv8vgLNIzIrDlyYQYGrSmLjNtiYugAiOWJILy1HqRpmI8raTOgdeUPmmKm7Ph2Qy4
	8SEXxhq+BLl8MMKKpu2dw5kRK02NAm+YSaHVN+WNZi3xwxWcIXZhqO+VN/oMRedITqtIkyJNlyP0k
	/mUiIgEukQB3GU7KOqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nykTE-00ADp6-Uy; Wed, 08 Jun 2022 01:26:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nykT2-00ADm6-U9; Wed, 08 Jun 2022 01:26:42 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LHqJv1XQ4z1KH3V;
	Wed,  8 Jun 2022 09:24:47 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 09:26:35 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 09:26:33 +0800
Message-ID: <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
Date: Wed, 8 Jun 2022 09:26:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: mawupeng <mawupeng1@huawei.com>
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
To: <david@redhat.com>, <corbet@lwn.net>, <will@kernel.org>,
	<ardb@kernel.org>, <catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <anshuman.khandual@arm.com>,
	<thunder.leizhen@huawei.com>, <wangkefeng.wang@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
 <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
In-Reply-To: <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_182641_177680_DC7ADAF2 
X-CRM114-Status: UNSURE (   9.75  )
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

CgrlnKggMjAyMi82LzcgMjA6MjUsIERhdmlkIEhpbGRlbmJyYW5kIOWGmemBkzoKPiBPbiAwNy4w
Ni4yMiAxMTozOCwgV3VwZW5nIE1hIHdyb3RlOgo+PiBGcm9tOiBNYSBXdXBlbmcgPG1hd3VwZW5n
MUBodWF3ZWkuY29tPgo+Pgo+PiBGb3IgYSBzeXN0ZW0gb25seSBoYXZlIGxpbWl0ZWQgbWlycm9y
ZWQgbWVtb3J5IG9yIHNvbWUgbnVtYSBub2RlIHdpdGhvdXQKPj4gbWlycm9yZWQgbWVtb3J5LCB0
aGUgcGVyIG5vZGUgdm1lbW1hcCBwYWdlX3N0cnVjdHMgcHJlZmVyIHRvIGFsbG9jYXRlCj4+IG1l
bW9yeSBmcm9tIG1pcnJvcmVkIHJlZ2lvbiwgd2hpY2ggd2lsbCBsZWFkIHRvIHZtZW1tYXBfdmVy
aWZ5KCkgaW4KPj4gdm1lbW1hcF9wb3B1bGF0ZV9iYXNlcGFnZXMoKSByZXBvcnQgbG90cyBvZiB3
YXJuaW5nIG1lc3NhZ2UuCj4+Cj4+IFRoaXMgcGF0Y2ggZGVtb3RlIHRoZSAicG90ZW50aWFsIG9m
Zm5vZGUgcGFnZV9zdHJ1Y3RzIiB3YXJuaW5nIG1lc3NhZ2VzCj4+IHRvIGRlYnVnIGxldmVsIHRv
IGF2b2lkIGEgdmVyeSBsb25nIHByaW50IGR1cmluZyBib290dXAuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE1hIFd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIG1tL3NwYXJz
ZS12bWVtbWFwLmMgfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9zcGFyc2Utdm1lbW1hcC5jIGIvbW0v
c3BhcnNlLXZtZW1tYXAuYwo+PiBpbmRleCBmNGZhNjFkYmJlZTMuLjc4ZGViZGI4OWViMSAxMDA2
NDQKPj4gLS0tIGEvbW0vc3BhcnNlLXZtZW1tYXAuYwo+PiArKysgYi9tbS9zcGFyc2Utdm1lbW1h
cC5jCj4+IEBAIC01MjgsNyArNTI4LDcgQEAgdm9pZCBfX21lbWluaXQgdm1lbW1hcF92ZXJpZnko
cHRlX3QgKnB0ZSwgaW50IG5vZGUsCj4+ICAgCWludCBhY3R1YWxfbm9kZSA9IGVhcmx5X3Bmbl90
b19uaWQocGZuKTsKPj4gICAKPj4gICAJaWYgKG5vZGVfZGlzdGFuY2UoYWN0dWFsX25vZGUsIG5v
ZGUpID4gTE9DQUxfRElTVEFOQ0UpCj4+IC0JCXByX3dhcm4oIlslbHgtJWx4XSBwb3RlbnRpYWwg
b2Zmbm9kZSBwYWdlX3N0cnVjdHNcbiIsCj4+ICsJCXByX2RlYnVnKCJbJWx4LSVseF0gcG90ZW50
aWFsIG9mZm5vZGUgcGFnZV9zdHJ1Y3RzXG4iLAo+PiAgIAkJCXN0YXJ0LCBlbmQgLSAxKTsKPj4g
ICB9Cj4+ICAgCj4gCj4gVGhpcyB3aWxsIHBvc3NpYmx5IGhpZGUgaXQgaW4gZW52aXJvbm1lbnRz
IHdoZXJlIHRoaXMgbWlnaHQgaW5kZWVkCj4gaW5kaWNhdGUgcGVyZm9ybWFuY2UgaXNzdWVzLgo+
IAo+IFdoYXQgYWJvdXQgYSBwcl93YXJuX29uY2UoKT8KPiAKClN1cmUuCgpUaGlzIHdpbGwgd29y
a3MuIFdlIGNhbiBjZXJ0YWlubHkgdXNlIGEgcHJfd2Fybl9vbmNlKCkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
