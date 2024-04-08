Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695CDCD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzlGL2qyrtCfGowG7brZftgtJOnvBx7CVikfRacMxmU=; b=LzRpPwrC3zgSBe
	0wWwdvQgYLmOMBMIm0d2Q5L9Eq6AWfyUqxulG7T3+byJbFLsvZ9p1KOf3fWHSopB8V+Al7Ol3g7Ww
	YK01Y5oQrdmdBkfoCpEPOYotxDkZ+Vei9V0WU2JTwOwWtSFfyE55HD2CNUg/bBk9QRdVZgpVlRa9m
	aj+VGfxkjyCaEhoKjVhnh9hT1vWc/8nUIDHzvtnS8iHTGevez6b+NE5EZx5aC0AQIyktR3cKCZLWx
	ToiQJQakNB3yiTs/MVRMtjPRrM8VQ27QTx1E5xxBX7fYcDXjnngnLxGVHaYgevLTufJOPKut64Sh+
	yVqst8if4v0xUvMc1cPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpWT-0000000Fngy-3beK;
	Mon, 08 Apr 2024 13:58:57 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtpWL-0000000Fnbl-06Gn
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 13:58:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VCrJQ0XM3z1GGMG;
	Mon,  8 Apr 2024 21:57:42 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F1EE18002D;
	Mon,  8 Apr 2024 21:58:26 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 8 Apr 2024 21:58:25 +0800
Message-ID: <71e2ec5b-e46e-4c85-ad83-b584ef3056a0@huawei.com>
Date: Mon, 8 Apr 2024 21:58:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add testcase where 7th
 argment is struct
To: Daniel Borkmann <daniel@iogearbox.net>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huaweicloud.com>
References: <20240403072818.1462811-1-pulehui@huaweicloud.com>
 <20240403072818.1462811-3-pulehui@huaweicloud.com>
 <0f459fc1-1445-6e83-ace4-b2c42abfe884@iogearbox.net>
 <9bffde6f-ca7f-40d4-9b27-4e53ed274751@huaweicloud.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <9bffde6f-ca7f-40d4-9b27-4e53ed274751@huaweicloud.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_065854_201431_ECC998C5 
X-CRM114-Status: GOOD (  14.05  )
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

Ck9uIDIwMjQvNC8zIDIzOjUwLCBQdSBMZWh1aSB3cm90ZToKPiAKPiAKPiBPbiAyMDI0LzQvMyAy
Mjo0MCwgRGFuaWVsIEJvcmttYW5uIHdyb3RlOgo+PiBPbiA0LzMvMjQgOToyOCBBTSwgUHUgTGVo
dWkgd3JvdGU6Cj4+PiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+Pj4KPj4+
IEFkZCB0ZXN0Y2FzZSB3aGVyZSA3dGggYXJndW1lbnQgaXMgc3RydWN0IGZvciBhcmNoaXRlY3R1
cmVzIHdpdGggOAo+Pj4gYXJndW1lbnQgcmVnaXN0ZXJzLCBhbmQgaW5jcmVhc2UgdGhlIGNvbXBs
ZXhpdHkgb2YgdGhlIHN0cnVjdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPgo+Pj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Pj4gLS0tCj4+PiDCoCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFy
Y2g2NMKgIHzCoCAxICsKPj4+IMKgIC4uLi9zZWxmdGVzdHMvYnBmL2JwZl90ZXN0bW9kL2JwZl90
ZXN0bW9kLmPCoMKgIHwgMTkgKysrKysrKysrKwo+Pj4gwqAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJv
Z190ZXN0cy90cmFjaW5nX3N0cnVjdC5jIHwgMTMgKysrKysrKwo+Pj4gwqAgLi4uL3NlbGZ0ZXN0
cy9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3QuY8KgwqDCoMKgwqAgfCAzNSArKysrKysrKysrKysr
KysrKysrCj4+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQg
Cj4+PiBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0Cj4+PiBp
bmRleCBkOGFkZTE1ZTI3ODkuLjYzOWVlM2Y1YmM3NCAxMDA2NDQKPj4+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0Cj4+PiArKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NAo+Pj4gQEAgLTYsNiArNiw3IEBAIGtw
cm9iZV9tdWx0aV90ZXN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIyAKPj4+IG5lZWRzIENPTkZJR19GUFJPQkUKPj4+IMKgIG1v
ZHVsZV9hdHRhY2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgcHJvZyAKPj4+ICdrcHJvYmVfbXVsdGknOiBmYWls
ZWQgdG8gYXV0by1hdHRhY2g6IC05NQo+Pj4gwqAgZmVudHJ5X3Rlc3QvZmVudHJ5X21hbnlfYXJn
c8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyAKPj4+IGZlbnRyeV9t
YW55X2FyZ3M6RkFJTDpmZW50cnlfbWFueV9hcmdzX2F0dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAt
NTI0Cj4+PiDCoCBmZXhpdF90ZXN0L2ZleGl0X21hbnlfYXJnc8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgCj4+PiBmZXhpdF9tYW55X2FyZ3M6RkFJTDpmZXhp
dF9tYW55X2FyZ3NfYXR0YWNoIHVuZXhwZWN0ZWQgZXJyb3I6IC01MjQKPj4+ICt0cmFjaW5nX3N0
cnVjdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICMgCj4+PiB0ZXN0X2ZlbnRyeTpGQUlMOnRyYWNpbmdfc3RydWN0X19h
dHRhY2ggdW5leHBlY3RlZCBlcnJvcjogLTUyNAo+Pgo+PiBEbyB3ZSBuZWVkIHRvIGJsYWNrbGlz
dCB0aGUgd2hvbGUgdGVzdCBnaXZlbiBpdCBoYWQgY292ZXJhZ2Ugb24gYXJtNjQKPj4gYmVmb3Jl
Li4gcGVyaGFwcyB0aGlzIHRlc3QgaGVyZSBjb3VsZCBiZSBkb25lIGFzIGEgbmV3IHN1YnRlc3Qg
YW5kIG9ubHkKPj4gdGhhdCBvbmUgaXMgbGlzdGVkIGZvciBhcm02ND8KPiAKPiBZZWFoLCBJIHRo
b3VnaHQgc28gYXQgZmlyc3QsIGp1c3QgbGlrZSBmZXhpdF9tYW55X2FyZ3Mgb2YgZmVudHJ5L2Zl
eGl0LCAKPiBidXQgSSBmb3VuZCB0aGF0IHRoZSB0aGluZ3Mgc3RydWN0X3RyYWNpbmcgZG9lcyBh
cmUgYWxsIGluIHRoZSBzYW1lIAo+IHNlcmllcywgYnV0IHRoZSBudW1iZXIgb3IgdHlwZSBvZiBw
YXJhbWV0ZXJzIGFyZSBkaWZmZXJlbnQsIGFuZCB0aGUgbmV3IAo+IHVzZSBjYXNlIEkgYWRkZWQg
aXMgdGhlIHNhbWUgaW4gdGhpcyB3YXkuIEFuZCBJIGZvdW5kIHRoYXQgdGhlIGV4ZWN1dGlvbiAK
PiBsb2dpYyBvZiBzdHJhY3RfdHJhY2luZyBpcyByZWxhdGl2ZWx5IHNpbXBsZSBhbmQgY2xlYXIs
IHRyaWdnZXJpbmcgYWxsIAo+IGhvb2sgcG9pbnRzLCBleGVjdXRpbmcgYWxsIGJwZiBwcm9ncmFt
cywgYW5kIGFzc2VydGluZyBhbGwgcGFyYW1ldGVycy4KPiBTaGFsbCB3ZSBuZWVkIHRvIHNsaWNl
IHRoZW0gdXA/CgpwaW5nfiBEYW5pZWwsIHNoYWxsIHdlIG5lZWQgdG8gZG8gdGhhdD8KCj4gCj4+
Cj4+PiDCoCBmaWxsX2xpbmtfaW5mby9rcHJvYmVfbXVsdGlfbGlua19pbmZvwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAjIAo+Pj4gYnBmX3Byb2dyYW1fX2F0dGFjaF9rcHJvYmVfbXVsdGlfb3B0cyB1
bmV4cGVjdGVkIGVycm9yOiAtOTUKPj4+IMKgIGZpbGxfbGlua19pbmZvL2tyZXRwcm9iZV9tdWx0
aV9saW5rX2luZm/CoMKgwqDCoMKgwqDCoMKgICMgCj4+PiBicGZfcHJvZ3JhbV9fYXR0YWNoX2tw
cm9iZV9tdWx0aV9vcHRzIHVuZXhwZWN0ZWQgZXJyb3I6IC05NQo+Pj4gwqAgZmlsbF9saW5rX2lu
Zm8va3Byb2JlX211bHRpX2ludmFsaWRfdWJ1ZmbCoMKgwqDCoMKgwqDCoCAjIAo+Pj4gYnBmX3By
b2dyYW1fX2F0dGFjaF9rcHJvYmVfbXVsdGlfb3B0cyB1bmV4cGVjdGVkIGVycm9yOiAtOTUKPj4K
Pj4gVGhhbmtzLAo+PiBEYW5pZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
