Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F64C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0s76qHOW51lvS54bMVqkBDtBjMpAPQQ5NE2QaVAo/0=; b=pR7Ht4xzsa+W/1
	mUszeiTPV51MOiugANR5bM2lSJW9mUhi+XpxAkcGAx0pkM2frI29+l9fIWrIsSYNeTnk8yXlO1ZWN
	d87sR1ttuzoA2SpZYmUksGlOwVsnJfQFzWthe/JICrNeIeWeDn4vpODdsWAHBUnpd+BZRr0h2Zuld
	WsXndilI/GI06Fm51gUAh8x8StFRYTGjWW7B5TityGzjpr5qCWijvXSbTkTuU9kIysBvT/itn2gGQ
	88L8T/d1firT/Qjb2KRlqaGH5wUbPDOukEMjN+wMdMXeK/OKaW7zdVY0A36hxZHTUWdTx3WGN4B+E
	ny8fwNrq4g6Ub0+sU7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmVGb-00EGtW-Hi; Thu, 05 May 2022 06:47:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmVGQ-00EGp8-Kc; Thu, 05 May 2022 06:47:04 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kv4310yQ8zfbF5;
 Thu,  5 May 2022 14:45:49 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 14:46:53 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 14:46:52 +0800
Message-ID: <3f0439c7-9c25-b83a-58dd-9c3d638b9236@huawei.com>
Date: Thu, 5 May 2022 14:46:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v6 5/6] arm64/mm: Enable
 ARCH_SUPPORTS_PAGE_TABLE_CHECK
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220426081036.1374452-1-tongtiangen@huawei.com>
 <20220426081036.1374452-6-tongtiangen@huawei.com>
 <ae74ea7c-9014-b162-f1e7-a66f402aee49@arm.com>
 <80f6c347-db5d-8836-bc79-60c7b2a6eed8@huawei.com> <YnK3U3qDhhgwaULb@arm.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <YnK3U3qDhhgwaULb@arm.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_234702_876712_6A1C24D8 
X-CRM114-Status: UNSURE (   7.96  )
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

CgrlnKggMjAyMi81LzUgMToyNiwgQ2F0YWxpbiBNYXJpbmFzIOWGmemBkzoKPiBPbiBUdWUsIE1h
eSAwMywgMjAyMiBhdCAwOToxMzoyMEFNICswODAwLCBUb25nIFRpYW5nZW4gd3JvdGU6Cj4+IOWc
qCAyMDIyLzQvMjkgMTQ6MTgsIEFuc2h1bWFuIEtoYW5kdWFsIOWGmemBkzoKPj4+IE9uIDQvMjYv
MjIgMTM6NDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPj4+PiBAQCAtODg0LDcgKzkyOCwxMSBAQCBz
dGF0aWMgaW5saW5lIHB0ZV90IHB0ZXBfZ2V0X2FuZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKPj4+PiAgICBzdGF0aWMgaW5saW5lIHBtZF90IHBtZHBfaHVnZV9nZXRfYW5kX2NsZWFyKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4+ICAgIAkJCQkJICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVz
cywgcG1kX3QgKnBtZHApCj4+Pj4gICAgewo+Pj4+IC0JcmV0dXJuIHB0ZV9wbWQocHRlcF9nZXRf
YW5kX2NsZWFyKG1tLCBhZGRyZXNzLCAocHRlX3QgKilwbWRwKSk7Cj4+Pj4gKwlwbWRfdCBwbWQg
PSBwdGVfcG1kKF9fcHRlKHhjaGdfcmVsYXhlZCgmcHRlX3ZhbCgqKHB0ZV90ICopcG1kcCksIDAp
KSk7Cj4+Pgo+Pj4gV2h5IHRoZXJlIGlzIGFueSBjaGFuZ2UgaGVyZSA/IFdoeSBub3QganVzdCB0
aGUgZm9sbG93aW5nIGluc3RlYWQsIGxpa2Ugd2hhdCB5b3UgZGlkCj4+PiBpbiBwdGVwX2dldF9h
bmRfY2xlYXIoKSBhYm92ZS4gVGhlIHBhZ2UgdGFibGUgZW50cnkgcmV0dXJuIHZhbHVlIGhlcmUg
anVzdCBuZWVkcyB0bwo+Pj4gYmUgcHJlc2VydmVkIGZvciBzdWJzZXF1ZW50IHBhZ2UgdGFibGUg
Y2hlY2sgaGVscGVycy4KPj4+Cj4+PiAJcG1kX3QgcG1kID0gcHRlX3BtZChwdGVwX2dldF9hbmRf
Y2xlYXIobW0sIGFkZHJlc3MsIChwdGVfdCAqKXBtZHApKTsKPj4KPj4gVGhlIHB1cnBvc2Ugb2Yg
d2hhdCBJIGRvIGhlcmUgaXMgdG8gYXZvaWQgZG9pbmcgcGFnZV90YWJsZV9jaGVja19wdGVfY2xl
YXIoKQo+PiBpbiBwdGVwX2dldF9hbmRfY2xlYXIoKS4gdGhlcmUgaXMgbm8gZnVuY3Rpb25hbCBj
aGFuZ2UgaGVyZS4KPiAKPiBJJ20gZmluZSB3aXRoIHVzaW5nIHhjaGcgaGVyZSBidXQgSSdkIGdv
IGZvciBwbWRfdmFsIGRpcmVjdGx5LCBubyBuZWVkCj4gZm9yIGNvbnZlcnNpb24gdG8gcHRlX3Q6
Cj4gCj4gCXBtZF90IHBtZCA9IF9fcG1kKHhjaGdfcmVsYXhlZCgmcG1kX3ZhbCgqcG1kcCksIDAp
KTsKPiAKCk9LLCBUaGlzIGltcGxlbWVudGF0aW9uIGlzIGdvb2QgYW5kIGF2b2lkcyByZWR1bmRh
bnQgY29udmVyc2lvbiwgd2lsbCAKZml4IGl0IG5leHQgdmVyc2lvbi4KClRoYW5rcywKVG9uZy4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
