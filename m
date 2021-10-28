Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE68C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:00:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86329608FE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86329608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rT8XH9h2iG95LVDPZ7WXTQoG0SGHt+ZTtHGUcs9AeJ8=; b=HNClakf/kDcVeQCq8rmQmrwPbJ
	JjSHnw2jo+lrHqDANo5b0IPwv8zZQ0sjtZepWYGTAlbvwuJkdBrCvzeTlbuqcNIbsSrhvoklWJv1x
	KB0qC5YCqKIpbgwRepCRl4PSqY5h0mcvN5Um2UyTayfuhlCRqD5VAzDH6tAN18FGwasObMucgHY4p
	j9RpV7+h//AXTxftkPEtHJMioBLNKHTcxg5REwJ88Qy+GX3E1f99GDqll/NcTW4pK7BojWt5FAtSe
	dKc7NBOvVtAqJk7pzfIIxUa19NCfwJQVfx78sLuXfgPtSulgrpx+zw2Sb40JT/S+0NZjS2VBXf4r8
	NP1hIEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mftm8-006b3t-6t; Thu, 28 Oct 2021 01:00:12 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mftm4-006b2c-TN
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 01:00:11 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HfnH018nsz1DHqv;
 Thu, 28 Oct 2021 08:58:04 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 09:00:00 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 08:59:58 +0800
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
 <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, bpf
 <bpf@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <d5c619a0-9632-6d13-c86b-46e3c2a16dcc@huawei.com>
Date: Thu, 28 Oct 2021 08:59:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ+HfNhC=hfFnjVvCf=bw+n1msRjR3gGUyapAmsRDupZ5CusrQ@mail.gmail.com>
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_180009_500043_9967DE66 
X-CRM114-Status: GOOD (  19.34  )
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

CgpPbiAyMDIxLzEwLzI4IDA6NTUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gT24gV2VkLCAyNyBP
Y3QgMjAyMSBhdCAxMzowMywgVG9uZyBUaWFuZ2VuIDx0b25ndGlhbmdlbkBodWF3ZWkuY29tPiB3
cm90ZToKPj4KPj4gV2hlbiBhIHRyYWNpbmcgQlBGIHByb2dyYW0gYXR0ZW1wdHMgdG8gcmVhZCBt
ZW1vcnkgd2l0aG91dCB1c2luZyB0aGUKPj4gYnBmX3Byb2JlX3JlYWQoKSBoZWxwZXIsIHRoZSB2
ZXJpZmllciBtYXJrcyB0aGUgbG9hZCBpbnN0cnVjdGlvbiB3aXRoCj4+IHRoZSBCUEZfUFJPQkVf
TUVNIGZsYWcuIFNpbmNlIHRoZSByaXNjdiBKSVQgZG9lcyBub3QgY3VycmVudGx5IHJlY29nbml6
ZQo+PiB0aGlzIGZsYWcgaXQgZmFsbHMgYmFjayB0byB0aGUgaW50ZXJwcmV0ZXIuCj4+Cj4+IEFk
ZCBzdXBwb3J0IGZvciBCUEZfUFJPQkVfTUVNLCBieSBhcHBlbmRpbmcgYW4gZXhjZXB0aW9uIHRh
YmxlIHRvIHRoZQo+PiBCUEYgcHJvZ3JhbS4gSWYgdGhlIGxvYWQgaW5zdHJ1Y3Rpb24gY2F1c2Vz
IGEgZGF0YSBhYm9ydCwgdGhlIGZpeHVwCj4+IGluZnJhc3RydWN0dXJlIGZpbmRzIHRoZSBleGNl
cHRpb24gdGFibGUgYW5kIGZpeGVzIHVwIHRoZSBmYXVsdCwgYnkKPj4gY2xlYXJpbmcgdGhlIGRl
c3RpbmF0aW9uIHJlZ2lzdGVyIGFuZCBqdW1waW5nIG92ZXIgdGhlIGZhdWx0aW5nCj4+IGluc3Ry
dWN0aW9uLgo+Pgo+PiBBIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiB3b3VsZCBhZGQgYSAiaGFuZGxl
ciIgZmllbGQgdG8gdGhlIHRhYmxlIGVudHJ5LAo+PiBsaWtlIG9uIHg4NiBhbmQgczM5MC4KPj4K
Pj4gVGhlIHNhbWUgaXNzdWUgaW4gQVJNNjQgaXMgZml4ZWQgaW46Cj4+IGNvbW1pdCA4MDA4MzQy
ODUzNjEgKCJicGYsIGFybTY0OiBBZGQgQlBGIGV4Y2VwdGlvbiB0YWJsZXMiKQo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2VuQGh1YXdlaS5jb20+Cj4+IFRlc3Rl
ZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IHYzOgo+PiBNb2Rp
ZnkgYWNjb3JkaW5nIHRvIEJqw7ZybidzIGNvbW1lbnRzLCBtYWlubHkgY29kZSBvcHRpbWl6YXRp
b24uCj4KPiBUaGFuayB5b3UhCj4KPiBJIHJhbiB0aGlzIHBhdGNoIGFnYWluc3QgdGhlIHRlc3Rf
YnBmLmtvLCBhbmQgc2VsZnRlc3RzL2JwZiAtLSBubwo+IHJlZ3Jlc3Npb25zLCBhbmQgYWZ0ZXIg
dGhlIHBhdGNoIGlzIGFwcGxpZWQgbW9yZSB0ZXN0cyBwYXNzZXMuIFlheSEKCkV4Y2l0aW5nIHRl
c3QgcmVzdWx0LCBUaGFua3MhCgo+Cj4gT24gYSByZWxhdGVkIG5vdGUuIFRoZSBSSVNDLVYgc2Vs
ZnRlc3RzL2JwZiBpcyBpbiBhIHByZXR0eSBsb3VzeQo+IHN0YXRlLiBJJ2xsIHNlbmQgYSBjbGVh
bnVwIHBhdGNoIGZvciB0aGVtIHNvb25pc2guIEUuZy46Cj4KPiAqIFJJU0MtViBpcyBtaXNzaW5n
IGluIGJwZl90cmFjaW5nLmggKGxpYmJwZikKPiAqIFNvbWUgcHJvZ3JhbXMgZG9uJ3QgY29udmVy
Z2UgaW4gMTYgc3RlcHMsIEkgaGFkIHRvIGluY3JlYXNlIGl0IHRvIH4zMgo+ICogVGhlIHNlbGZ0
ZXN0L2JwZiBNYWtlZmlsZSBuZWVkZWQgc29tZSBSViBzcGVjaWZpYyBjaGFuZ2VzCj4gKiAuLi5h
IGxvdCBvZiB0ZXN0cyBzdGlsbCBkb24ndCBwYXNzLCBhbmQgbmVlZHMgdG8gYmUgbG9va2VkIGlu
IHRvCj4KPiBGZWVsIGZyZWUgdG8gYWRkOgo+Cj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+Cj4KPj4gdjI6Cj4+IE1vZGlmeSBhY2NvcmRpbmcgdG8gQmrDtnJuJ3Mg
Y29tbWVudHMsIG1haW5seSByZW1vdmVzIHJlZHVuZGFudCBoZWFkIGZpbGVzCj4+IGV4dGFibGUu
aCBhbmQgc29tZSBjb2RlIHN0eWxlIGlzc3Vlcy4KPj4KPj4gIGFyY2gvcmlzY3YvbW0vZXh0YWJs
ZS5jICAgICAgICAgfCAgMTkgKysrLQo+PiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oICAgICAg
ICB8ICAgMSArCj4+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMTg1ICsrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
cmUuYyAgIHwgIDE5ICsrLS0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgMTc3IGluc2VydGlvbnMoKyks
IDQ3IGRlbGV0aW9ucygtKQo+Pgo+Cj4gWy4uLl0KPgo+IEJqw7Zybgo+IC4KPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
