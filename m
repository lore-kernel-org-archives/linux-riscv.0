Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FDECAAA2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLDrJVcXgP7XC4uTG+JY2Lbpr7qF+x/sq5oIwEDOujA=; b=eMgBnp59WXiB6l
	WN8YMMqo6Er6V19ym0zsQhhEXXFJf+TTffQgsX+4CsckWxo7eZzStZ84sNsPM7tQn5cyseBgH/Etm
	v4D2qFuT93kQHfuErjmrAWhmMhNxnyNsfrw2zFgyTurTnPRpELpv+Ti98Xj6COWCDjpJcGrziFFuF
	CKfxuiu8Ss/PXguNoMHgrws02kQ7p4aTPu/TVTo6Dm7xlHAHi1UeKTTZMmblTsE36bEMCNIWQqpVX
	1lEZxG4S29AajbVH7x3r8jpgL+e6SXzrr209waP2g1hv7XTvI/syCjI1S1W/fBB1pS2/9GjMCIBvE
	PxP/ETx71qYNb6RVeiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSTY5-003Oce-UK; Mon, 29 Aug 2022 01:26:46 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSTY1-003OUv-ES
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 01:26:43 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MGCNm50KQz1N7Rq;
	Mon, 29 Aug 2022 09:22:48 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 29 Aug 2022 09:26:24 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 29 Aug 2022 09:26:23 +0800
Message-ID: <bc23cce2-1a13-27c5-586b-283289ac8275@huawei.com>
Date: Mon, 29 Aug 2022 09:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename
 __get/put_user_nocheck to __get/put_mem_nocheck
To: Arnd Bergmann <arnd@arndb.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220815032025.2685516-1-tongtiangen@huawei.com>
 <20220815032025.2685516-2-tongtiangen@huawei.com>
 <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
 <c0e286b4-3005-71fb-3bb2-476944099d4e@huawei.com>
 <CAK8P3a0akgBkyVQuAfi5qdi9O5DhxZJ3FknxGH-gedpJpAVw6w@mail.gmail.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <CAK8P3a0akgBkyVQuAfi5qdi9O5DhxZJ3FknxGH-gedpJpAVw6w@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_182642_085398_075886A3 
X-CRM114-Status: GOOD (  13.15  )
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

CgrlnKggMjAyMi84LzI3IDIwOjQ5LCBBcm5kIEJlcmdtYW5uIOWGmemBkzoKPiBPbiBTYXQsIEF1
ZyAyNywgMjAyMiBhdCAxMjo0MyBQTSBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5j
b20+IHdyb3RlOgo+PiDlnKggMjAyMi84LzI2IDE3OjMwLCBBcm5kIEJlcmdtYW5uIOWGmemBkzoK
Pj4KPj4gSSBhbSB2ZXJ5IGludGVyZXN0ZWQgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIFg4Ni4g
SSBuZWVkIHRvIGludmVzdGlnYXRlCj4+IGFuZCBjb25zaWRlciBhIGNyb3NzIGFyY2hpdGVjdHVy
ZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBPbmUgbW9yZSBwb2ludCBhYm91dCB0aGUgY3Jvc3MtYXJj
aGl0ZWN0dXJlIHdvcms6IGl0IGdlbmVyYWxseSBtYWtlcwo+IHNlbnNlIHRvIGRvIHRoZSBtb3N0
IGNvbW1vbmx5IHVzZWQgYXJjaGl0ZWN0dXJlcyBmaXJzdCwgdXN1YWxseQo+IHRoYXQgd291bGQg
YmUgeDg2LCBhcm02NCBhbmQgcG93ZXJwYzY0LCBmb2xsb3dlZCBieSByaXNjdiwgYXJtLAo+IHMz
OTAgYW5kIG1pcHMuIElmIHdlIGNhbiBmaW5kIHNvbWV0aGluZyB0aGF0IHRoZSBmaXJzdCBhcmNo
aXRlY3R1cmUKPiBtYWludGFpbmVycyBsaWtlLCBldmVyeW9uZSBlbHNlIGNhbiBmb2xsb3cgYW5k
IHlvdSBkb24ndCBoYXZlIHRvCj4gcmV3b3JrIGFsbCBvZiB0aGVtIG11bHRpcGxlIHRpbWVzIGJl
Zm9yZSBnZXR0aW5nIHRvIGEgY29uc2Vuc3VzLgo+IAo+PiBIb3dldmVyLCBJIHVuZGVyc3RhbmQg
dGhhdCB0aGUgbW9kaWZpY2F0aW9uIG9mIHRoZSBjdXJyZW50IHBhdGNoIGhhcwo+PiBsaXR0bGUg
dG8gZG8gd2l0aCB0aGUgdHdvIHBvaW50cyBtZW50aW9uZWQgYWJvdmUuIFdlIGNhbiBvcHRpbWl6
ZSB0aGUKPj4gY29kZSBzdGVwIGJ5IHN0ZXAuCj4gCj4gWW91IGFyZSBjb3JyZWN0IHRoYXQgdGhp
cyBoYXMgbGl0dGxlIHRvIGRvIHdpdGggeW91ciBwYXRjaCwgbXkgcG9pbnQKPiB3YXMgbWFpbmx5
IHRoYXQgeW91ciBwYXRjaCBpcyBtb3ZpbmcgdGhlIGNvZGUgZnVydGhlciBhd2F5IGZyb20KPiB0
aGUgb3RoZXIgYXJjaGl0ZWN0dXJlcywgc28gaXQgd291bGQgbWFrZSBpdCBoYXJkZXIgdG8gdGhl
biBkbyB0aGUKPiBjaGFuZ2VzIHdlIGFjdHVhbGx5IHdhbnQuCj4gCj4gICAgICAgICBBcm5kCgpJ
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbu+8jGl0J3MgcmVhc29uYWJsZS4KClRoYW5rcywKVG9u
Zy4KPiAKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
