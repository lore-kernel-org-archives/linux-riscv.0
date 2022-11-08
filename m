Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BD9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 11:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AbDrv5rGdjaXYzpIvS+7hrJ+eOmL/JzFyqecDTisRU=; b=Jniwx0cwi4gII8
	aZHAAaFJ3mSwK5Fl36is8qt73uO3smJsyiQjvJDngvoqWUexfDvjEvf3x4N2REKTlrnBAItN6llyr
	7ywRXv/j2JlwHRIv4irN54OnqKxC8vk8lGoe+HNnoFJD7ISDA9jSCde6/xo8IcZaed+zduTFtUD36
	ocwhXbO+qMy1SWeqIRJuENxQK3ybaOJIl/tL0GHWi4xM14ToaC44p9McofiLTU4LH1NCsIlioFyaB
	NQYFRhldBXzf06QQ6K2rX2ycgmZAYIIW1tIvPDcSjI0Zf1Ukm0vFQhv0F0uCOtvsH4ttOJGMgXej+
	PR+/Ek9JQMxnZeFTfEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMrt-004swp-JJ; Tue, 08 Nov 2022 11:34:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMrp-004ss4-Sq
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 11:34:12 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N65Vw2fD9zpWG1;
	Tue,  8 Nov 2022 19:30:16 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 19:33:55 +0800
Message-ID: <598bc40d-e826-f9cc-14fd-f4570051f4c6@huawei.com>
Date: Tue, 8 Nov 2022 19:33:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/8] Add OPTPROBES feature on RISCV
To: Xim <chenguokai17@mails.ucas.ac.cn>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Liao Chang
	<liaoclark@163.com>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
 <87y1sm1z8j.fsf@all.your.base.are.belong.to.us>
 <9A705974-A007-45E2-BC5D-A7E90821A258@mails.ucas.ac.cn>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <9A705974-A007-45E2-BC5D-A7E90821A258@mails.ucas.ac.cn>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_033410_150104_838B9390 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMi8xMS84IDE5OjA0LCBYaW0g5YaZ6YGTOgo+IEhpIEJqw7ZybiwKPiAKPiBUaGFu
a3MgZm9yIHlvdXIgZ3JlYXQgcmV2aWV3ISBTb21lIGV4cGxhbmF0aW9ucyBiZWxvdy4KPiAKPj4g
MjAyMuW5tDEx5pyIOOaXpSAwMDo1NO+8jEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IOWGmemBk++8mgo+Pgo+PiBIYXZlIHlvdSBydW4gdGhlIHNlcmllcyBvbiByZWFsIGhhcmR3YXJl
LCBvciBqdXN0IHFlbXU/Cj4gCj4gQ3VycmVudGx5IG9ubHkgcWVtdSB0ZXN0cyBhcmUgbWFkZSwg
SSB3aWxsIHRyeSB0byB0ZXN0IGl0IG9uIGEgRlBHQSByZWFsIGhhcmR3YXJlIHNvb24uCj4gCj4+
IEFGQUlVLCB0aGUgYWxnb3JpdGhtIG9ubHkgdHJhY2tzIHJlZ2lzdGVycyB0aGF0IGFyZSAqaW4g
dXNlKi4gWW91IGFyZQo+PiBhbHJlYWR5IHNjYW5uaW5nIHRoZSB3aG9sZSBmdW5jdGlvbiAobmV4
dCBwYXRjaCkuIFdoYXQgYWJvdXQgdGhlIGNhbGxlcgo+PiBzYXZlZCByZWdpc3RlcnMgdGhhdCBh
cmUgKm5vdCogdXNlZCBieSB0aGUgZnVuY3Rpb24gaW4gdGhlIHByb2JlIHJhbmdlPwo+PiBDYW4g
dGhvc2UsIHBvdGVudGlhbGx5IHVudXNlZCwgcmVncyBiZSB1c2VkPwo+IAo+IEdyZWF0IG1pc3Np
bmcgcGFydCEgSSBoYXZlIG1hZGUgYSBzdGF0aWMgYW5hbHl6YXRpb24gcmlnaHQgdXBvbiByZWNl
aXZpbmcgdGhpcyBtYWlsLgo+IFRoZSByZXN1bHQgc2hvd3MgdGhhdCB0aGlzIG5ld2x5IHB1cnBv
c2VkIGlkZWEgcmVhY2hlcyBhYm91dCB0aGUgc2FtZQo+IHN1Y2Nlc3MgcmF0ZSBvbiBteSB0ZXN0
IHNldCAocnY2NCBkZWZjb25mIHdpdGggUlZJIG9ubHkpIHdoaWxlIHdoZW4gY29tYmluZWQsCj4g
dGhleSBjYW4gcmVhY2ggYSBoaWdoZXIgc3VjY2VzcyByYXRlLCAxLzMgYWJvdmUgdGhlaXIgYmFz
ZWxpbmUuIEEgcGF0Y2ggdGhhdAo+IGluY2x1ZGVzIHRoaXMgc3RyYXRlZ3kgd2lsbCBiZSBzZW50
IHNvb24uCj4+Cj4+PiArc3RhdGljIHZvaWQgYXJjaF9maW5kX3JlZ2lzdGVyKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+Pgo+PiBOaXQ7IFdoZW4gSSBzZWUgImFyY2hf
IiBJIHRoaW5rIGl0J3MgZnVuY3Rpb25hbGl0eSB0aGF0IGNhbiBiZQo+PiBvdmVycmlkZGVuIHBl
ci1hcmNoLiBUaGlzIGlzIG5vdCB0aGUgY2FzZSwgYnV0IGp1c3QgYSBoZWxwZXIgZm9yIFJWLgo+
IAo+IEl0IGNhbiBiZSBleHBsYWluZWQgZnJvbSB0d28gYXNwZWN0cy4gRmlyc3QsIGl0IGNhbiBi
ZSBleHRlbmRlZCB0byBtb3N0IFJJU0MKPiBhcmNocywgd2hpY2ggY2FuIGJlIGV4dHJhY3RlZCBp
bnRvIHRoZSBjb21tb24gZmxvdyBvZiBLcHJvYmUuIFNlY29uZCwgaXQgaXMgaW5kZWVkCj4gYSBp
bnRlcm5hbCBoZWxwZXIgZm9yIG5vdywgc28gSSB3aWxsIGNvcnJlY3QgdGhlIG5hbWUgaW4gdGhl
IG5leHQgdmVyc2lvbi4KPiAKPj4+IHN0YXRpYyB2b2lkIGZpbmRfZnJlZV9yZWdpc3RlcnMoc3Ry
dWN0IGtwcm9iZSAqa3AsIHN0cnVjdCBvcHRpbWl6ZWRfa3Byb2JlICpvcCwKPj4+IC0JCQkJaW50
ICpyZDEsIGludCAqcmQyKQo+Pj4gKwkJCQlpbnQgKnJkLCBpbnQgKnJhKQo+Pgo+PiBOaXQ7IFBs
ZWFzZSBnZXQgcmlkIG9mIHRoaXMgY29kZSBjaHVybiwganVzdCBuYW1lIHRoZSBwYXJhbWV0ZXJz
Cj4+IGNvcnJlY3RseSBvbiBpbnRyb2R1Y3Rpb24gaW4gdGhlIHByZXZpb3VzIHBhdGNoLgo+IAo+
IFdpbGwgYmUgZml4ZWQuCj4gCj4+PiArCSpyZCA9ICgoa3cgfCBvdykgPT0gMVVMKSA/IDAgOiBf
X2J1aWx0aW5fY3R6bCgoa3cgfCBvdykgJiB+MVVMKTsKPj4+ICsJKnJhID0gKGt3ID09IDFVTCkg
PyAwIDogX19idWlsdGluX2N0emwoa3cgJiB+MVVMKTsKPj4KPj4gSG1tLCBfX2J1aWx0aW5fY3R6
bCBpcyB1bmRlZmluZWQgZm9yIDAsIHJpZ2h0PyBDYW4gdGhhdCBiZSB0cmlnZ2VyZWQKPj4gaGVy
ZT8KClRoaXMgY29ybmVyIGNhc2UgaGFzIGJlZW4gdGFrZW4gaW50byBhY2NvdW50LCBsb29rIHRo
ZXNlIGNvbmRpdGlvbiBwYXJ0cywKaWYga3cgPT0gMVVMIHRoaXMgZXhwcmVzc2lvbiB3aWxsIHJl
dHVybiAwIGRpcmVjdGx5LCBubyBjaGFuY2UgdG8gaW52b2tlIF9fYnVpbHRpbl9jdHpsLgoKVGhh
bmtzLgoKPiAKPiBXaWxsIGJlIGZpeGVkLgo+IAo+IFJlZ2FyZHMsCj4gR3Vva2FpIENoZW4KPiAK
Ci0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
