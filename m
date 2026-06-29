Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B423C43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 02:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkCgU/y1IaJ0RG4b1i8ub9WQTzsWnC/RRblAjHB6W5s=; b=E7c5YQlxiIbeFX
	1EDK9zKNKRO3n7xxSd51orXyUuZDEWgvUvbVeCZvUaikpExPnazYfhFsnGQEfXbGtT16kNCgdLMA+
	FrBWxsdB/H6L8w+malWTcItCdf43kK+Lqfs3RJt3sVxkKPVwVSiWJY4OA4OZOeeLZte49L5Y2gVFE
	lb6PGwkGPH0Q0fIj6blJrmeh7KCQseG0bUXBgVjHzECe1Hdagx92nFh9L4EQCLEG0BoTctoeZKyo8
	HVHid9pFtu3/Zqdy0PIEEB1NPDnNeSxBKraifUdwSJNS3kY0WP9rnFrjl1lsTR4hHNiJiMnw2JbEU
	sKFlEiG3BiW9sXcf6h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we28M-0000000DbML-41Sd;
	Mon, 29 Jun 2026 02:54:06 +0000
Received: from [113.46.200.222] (helo=canpmsgout07.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we28K-0000000DbLM-0b7S
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 02:54:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W3FqOxsqdQ6iwoUKRoTUgDxVPiV8Voe0fgSNJHznDw8=;
	b=pYcownOWqGaXEePpDpYbUTSVTuffdVuH/4YGcEIz54CPk4yHi1wupiDjhIMmCaBAQLZZKZILI
	rE0KHW3FO+xSukROjHlVMlygXYuZoXTem+xj0RtQhjxcPy8+v4oI75my3Eh3JKXUL2oOfg2w+VK
	TA0O2rrs3bR3cJrihPd8ErU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gpVwg2TGvzLlZH;
	Mon, 29 Jun 2026 10:44:19 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 99AF540588;
	Mon, 29 Jun 2026 10:53:27 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 29 Jun
 2026 10:53:26 +0800
Message-ID: <d5810b66-a2f9-4449-a808-c588e4a2ff1c@huawei.com>
Date: Mon, 29 Jun 2026 10:53:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Content-Language: en-US
To: Varun R Mallya <varunrmallya@gmail.com>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<eddyz87@gmail.com>, <memxor@gmail.com>, <bjorn@kernel.org>, <alex@ghiti.fr>,
	<martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<jolsa@kernel.org>, <emil@etsalapatis.com>, <puranjay@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-3-varunrmallya@gmail.com>
 <b6e8c677-5fff-4de1-8483-fc23361898dc@huawei.com> <akDOkptnqJt9LDtj@computer>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <akDOkptnqJt9LDtj@computer>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_195404_497229_126FAE36 
X-CRM114-Status: GOOD (  20.34  )
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

Ck9uIDIwMjYvNi8yOCAxNTozNCwgVmFydW4gUiBNYWxseWEgd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MjMsIDIwMjYgYXQgMTA6MTE6NTdBTSArMDgwMCwgUHUgTGVodWkgd3JvdGU6Cj4+Cj4+IFdlIGRv
bid0IG5lZWQgdG8gZHVwbGljYXRlIGNvZGUuIFBsZWFzZSBtZXJnZSBpdC4KPiAKPiBNYWtpbmcg
dGhpcyBjaGFuZ2UgaW4gdGhlIG5leHQgdmVyc2lvbiEKPiAKPj4+ICsKPj4+ICsJCWlmICghYXV4
LT5leGNlcHRpb25fY2IgJiYgYXV4LT5leGNlcHRpb25fYm91bmRhcnkpIHsKPj4+ICsJCQkvKgo+
Pj4gKwkJCSAqIEJvdW5kYXJ5IHByb2dyYW06IGFsbG9jYXRlIHRoZSBmcmFtZSBhbmQgc2F2ZSB0
aGUKPj4+ICsJCQkgKiBmdWxsIGNhbGxlZS1zYXZlZCBzZXQsIGNhcHR1cmluZyB0aGUgY2FsbGVy
J3MgdmFsdWVzLgo+Pj4gKwkJCSAqLwo+Pj4gKwkJCWVtaXRfYWRkaShSVl9SRUdfU1AsIFJWX1JF
R19TUCwgLXN0YWNrX2FkanVzdCwgY3R4KTsKPj4+ICsJCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlf
U0laRShydl9leGNlcHRpb25fY3NhdmVfcmVncyk7IGkrKykgewo+Pj4gKwkJCQllbWl0X3NkKFJW
X1JFR19TUCwgc3RvcmVfb2Zmc2V0LAo+Pj4gKwkJCQkJcnZfZXhjZXB0aW9uX2NzYXZlX3JlZ3Nb
aV0sIGN0eCk7Cj4+PiArCQkJCXN0b3JlX29mZnNldCAtPSA4Owo+Pj4gKwkJCX0KPj4+ICsJCQll
bWl0X2FkZGkoUlZfUkVHX0ZQLCBSVl9SRUdfU1AsIHN0YWNrX2FkanVzdCwgY3R4KTsKPj4+ICsJ
CX0gZWxzZSB7Cj4+PiArCQkJLyoKPj4+ICsJCQkgKiBFeGNlcHRpb24gY2FsbGJhY2ssIHJldXNl
IHRoZSBib3VuZGFyeSBwcm9ncmFtJ3MKPj4+ICsJCQkgKiBmcmFtZSwgd2hvc2UgZnJhbWUgcG9p
bnRlciBpcyBwYXNzZWQgaW4gYTIuIFNldHRpbmcKPj4KPj4gc29tZXRoaW5nIGNvbmZ1c2Vk4oCU
d2h5IGlzIGl0IEEyPyBJIGZlZWwgbGlrZSBJIG1pc3NlZCBzb21ldGhpbmcuCj4gCj4gYnBmX3Ro
cm93KCkgaW52b2tlcyB0aGUgZXhjZXB0aW9uIGNhbGxiYWNrIGFzCj4gYnBmX2V4Y2VwdGlvbl9j
Yihjb29raWUsIHNwLCBicCwgMCwgMCkgLCB3aG9zZSAzcmQgYXJndW1lbnQgKHdoaWNoLAo+IGFj
Y29yZGluZyB0byBSSVNDLVYncyBjYWxsaW5nIGNvbnZlbnRpb24gcmVzaWRlcyBpbiBBMikgaXMg
dGhlIGJvdW5kYXJ5Cj4gcHJvZydzIGZyYW1lIHBvaW50ZXIuIFNpbmNlIHRoaXMgZWxzZSBicmFu
Y2ggaGFuZGxlcwo+IHRoZSBjYWxsYmFjaywgaXQgZXhwZWN0cyBBMiB0byBoYXZlIHRoZSBmcmFt
ZSBwb2ludGVyLiBUaGUgYXJtCj4gaW1wbGVtZW50YXRpb24gZG9lcyBzb21ldGhpbmcgdmVyeSBz
aW1pbGFyIHdpdGggZW1pdChBNjRfTU9WKDEsIEE2NF9GUCwgQTY0X1IoMikpLCBjdHgpCj4gd2hl
cmUgQTY0X1IoMikgaXMgdGhlIHRoaXJkIGFyZy4KCm9rLCBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gY2xlYXIgaW4gdGhlIGNvbW1lbnRzIHRoYXQgaXQgaXMgdGhlIHRoaXJkIApwYXJhbWV0ZXIu
Cgo+IAo+Pj4gKwkJCSAqIFNQID0gRlAgLSBzdGFja19hZGp1c3QgbGluZXMgdGhlIGVwaWxvZ3Vl
J3MgbG9hZHMgdXAKPj4+ICsJCQkgKiB3aXRoIHRoZSByZWdpc3RlcnMgdGhlIGJvdW5kYXJ5IHNh
dmVkLgo+Pj4gKwkJCSAqLwo+Pj4gKwkJCWVtaXRfbXYoUlZfUkVHX0ZQLCBSVl9SRUdfQTIsIGN0
eCk7Cj4+PiArCQkJZW1pdF9hZGRpKFJWX1JFR19TUCwgUlZfUkVHX0ZQLCAtc3RhY2tfYWRqdXN0
LCBjdHgpOwo+Pj4gKwkJfQo+Pj4gKwo+Pj4gKwkJZ290byB0YWlsX3NldHVwOwo+Pj4gKwl9Cj4+
PiArCj4+PiAgICAJaWYgKHNlZW5fcmVnKFJWX1JFR19SQSwgY3R4KSkKPj4+ICAgIAkJc3RhY2tf
YWRqdXN0ICs9IDg7Cj4+PiAgICAJc3RhY2tfYWRqdXN0ICs9IDg7IC8qIFJWX1JFR19GUCAqLwo+
Pj4gQEAgLTIwODIsNiArMjE3Myw3IEBAIHZvaWQgYnBmX2ppdF9idWlsZF9wcm9sb2d1ZShzdHJ1
Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwgYm9vbCBpc19zdWJwcm9nKQo+Pj4gICAgCWVtaXRfYWRk
aShSVl9SRUdfRlAsIFJWX1JFR19TUCwgc3RhY2tfYWRqdXN0LCBjdHgpOwo+Pj4gK3RhaWxfc2V0
dXA6Cj4+PiAgICAJaWYgKGJwZl9zdGFja19hZGp1c3QpCj4+PiAgICAJCWVtaXRfYWRkaShSVl9S
RUdfUzUsIFJWX1JFR19TUCwgYnBmX3N0YWNrX2FkanVzdCwgY3R4KTsKPj4+IEBAIC0yMTU3LDMg
KzIyNDksMTMgQEAgYm9vbCBicGZfaml0X3N1cHBvcnRzX2ZzZXNzaW9uKHZvaWQpCj4+PiAgICB7
Cj4+PiAgICAJcmV0dXJuIHRydWU7Cj4+PiAgICB9Cj4+PiArCj4+PiArYm9vbCBicGZfaml0X3N1
cHBvcnRzX2V4Y2VwdGlvbnModm9pZCkKPj4+ICt7Cj4+PiArCS8qCj4+PiArCSAqIGJwZl90aHJv
dygpIHVud2luZHMgYnkgd2Fsa2luZyB0aGUgZnJhbWUtcG9pbnRlciBjaGFpbiBmcm9tIGluc2lk
ZQo+Pj4gKwkgKiB0aGUga2VybmVsIGJhY2sgaW50byB0aGUgQlBGIGZyYW1lcyAoc2VlIGFyY2hf
YnBmX3N0YWNrX3dhbGsoKSksIHNvCj4+PiArCSAqIGV4Y2VwdGlvbnMgcmVxdWlyZSB0aGUgZnJh
bWUtcG9pbnRlciB1bndpbmRlciB0byBiZSBlbmFibGVkLgo+Pj4gKwkgKi8KPj4+ICsJcmV0dXJu
IElTX0VOQUJMRUQoQ09ORklHX0ZSQU1FX1BPSU5URVIpOwo+Pgo+PiByaXNjdiBzZWxlY3QgQVJD
SF9XQU5UX0ZSQU1FX1BPSU5URVJTLCBzbyB0aGlzIHdpbGwgYWx3YXlzIHRydWUKPiAKPiBJIGNo
ZWNrZWQgdGhhdCB0aGUga2VybmVsIGNvbXBpbGVkIGV2ZW4gd2hlbiBJIHR1cm5lZAo+IENPTkZJ
R19GUkFNRV9QT0lOVEVSIGV4cGxpY2l0bHkgb2ZmLCBzbyBub3QgZ2F0aW5nIHRoaXMKPiB3b3Vs
ZCBiZSBhIG1pc3Rha2UsIHJpZ2h0ID8gQVJDSF9XQU5UX0ZSQU1FX1BPSU5URVJTIG1ha2VzCj4g
Q09ORklHX0ZSQU1FX1BPSU5URVIgdXNlciBzZWxlY3RhYmxlIGFuZCBtYWtlcyBpdCBkZWZhdWx0
IHRvCj4gdHJ1ZSwgYnV0IGl0J3Mgbm90IGFsd2F5cyB0cnVlLiBXaGF0IGRvZXMgZm9yY2UgaXQg
aXMgUEVSRl9FVkVOVFM9eSBidXQgaWYKPiB0aGF0IHRvbyBpcyB0dXJuZWQgb2ZmLCB0aGVuIENP
TkZJR19GUkFNRV9QT0lOVEVSIGNhbiBhbHNvIGJlIHR1cm5lZAo+IG9mZi4KCmFscmlnaHQsIGxn
dG0KPiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXchIQo+IC0gVmFydW4KPj4+ICt9CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
