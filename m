Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA90BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GPbH5fBcV5qrAMGP2bg/LsIY5NwJqFtOwsmlo3kQp8=; b=esbGZzyezdmEL6
	lsbpyjBpwoLu18OHMNrXhkV0m5PXavuvIf5EWLKmiHdNh1iTeGoiu2PY3S0msZ1cqPl2E6mkcKuj/
	5edkkuIEFEE0hoeKsNrgShcr+OWuzXxxVDHOnXMj3Y2bykkreKm0H2XFfd6lxHSe5NSHeKtSo5YHX
	qm3gaSC1NK0g/vwz1C5y9T/a8KjKDqTTybCYzCJ0v5aaOeopjiYmHbwb4YNK8fWQAnX+KUPW10/Bu
	Ehdyb/kZtCiXSodVyFeLWE8YbzIubBFpWGwZfHcYS1dCXKSif2cRBLn/N4eyJKMKBo21T9n58SdRM
	ZLCUxQNHsepXyPHf2R8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7oyR-007vDn-8v; Wed, 21 Dec 2022 02:36:51 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7oyN-007uu3-Ne
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 02:36:50 +0000
Received: from mail02.huawei.com (unknown [172.30.67.169])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4NcHd86MT9z4f3s6F
	for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 10:36:28 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgCHNCItcaJj3abcAA--.30228S2;
	Wed, 21 Dec 2022 10:36:31 +0800 (CST)
Message-ID: <0039743b-5837-c0d3-7574-7719698f9dc1@huaweicloud.com>
Date: Wed, 21 Dec 2022 10:36:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH RESEND bpf-next 1/4] bpf: Rollback to text_poke when
 arch not supported ftrace direct call
Content-Language: en-US
To: Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221220021319.1655871-1-pulehui@huaweicloud.com>
 <20221220021319.1655871-2-pulehui@huaweicloud.com>
 <a2bf7ed9-4977-608c-d5a5-8ee6a520cf52@huawei.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <a2bf7ed9-4977-608c-d5a5-8ee6a520cf52@huawei.com>
X-CM-TRANSID: _Ch0CgCHNCItcaJj3abcAA--.30228S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4kJr4xJF1xXw1DXF1UZFb_yoW8tr1fpF
	s3Ja45u3yUXrykWF9Fq3WUXFyYyw4kX34DGr4UJa4rGan3Kr92gF4UZrnYgryvkr48WF42
	yF15Xr9IvFy7Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_183648_146673_FC1834B0 
X-CRM114-Status: GOOD (  15.66  )
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

CgpPbiAyMDIyLzEyLzIwIDEwOjMyLCBYdSBLdW9oYWkgd3JvdGU6Cj4gT24gMTIvMjAvMjAyMiAx
MDoxMyBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aS5jb20+Cj4+Cj4+IFRoZSBjdXJyZW50IGJwZiB0cmFtcG9saW5lIGF0dGFjaCB0byBrZXJuZWwg
ZnVuY3Rpb25zIHZpYSBmdHJhY2UgZGlyZWN0Cj4+IGNhbGwgQVBJLCB3aGlsZSB0ZXh0X3Bva2Ug
aXMgYXBwbGllZCBmb3IgYnBmMmJwZiBhdHRhY2ggYW5kIHRhaWwgY2FsbAo+PiBvcHRpbWl6YXRp
b24uIEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90IHN1cHBvcnQgZnRyYWNlIGRpcmVjdCBj
YWxsLAo+PiB0ZXh0X3Bva2UgaXMgc3RpbGwgYWJsZSB0byBhdHRhY2ggYnBmIHRyYW1wb2xpbmUg
dG8ga2VybmVsIGZ1bmN0aW9ucy4KPj4gTGV0J3MgcmVsYXggaXQgYnkgcm9sbGJhY2sgdG8gdGV4
dF9wb2tlIHdoZW4gYXJjaGl0ZWN0dXJlIG5vdCBzdXBwb3J0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBrZXJuZWwvYnBm
L3RyYW1wb2xpbmUuYyB8IDggKystLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvdHJh
bXBvbGluZS5jIGIva2VybmVsL2JwZi90cmFtcG9saW5lLmMKPj4gaW5kZXggZDYzOTUyMTViODQ5
Li4zODYxOTdhNzk1MmMgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9icGYvdHJhbXBvbGluZS5jCj4+
ICsrKyBiL2tlcm5lbC9icGYvdHJhbXBvbGluZS5jCj4+IEBAIC0yMjgsMTUgKzIyOCwxMSBAQCBz
dGF0aWMgaW50IG1vZGlmeV9mZW50cnkoc3RydWN0IGJwZl90cmFtcG9saW5lIAo+PiAqdHIsIHZv
aWQgKm9sZF9hZGRyLCB2b2lkICpuZXdfYWQKPj4gwqAgc3RhdGljIGludCByZWdpc3Rlcl9mZW50
cnkoc3RydWN0IGJwZl90cmFtcG9saW5lICp0ciwgdm9pZCAqbmV3X2FkZHIpCj4+IMKgIHsKPj4g
wqDCoMKgwqDCoCB2b2lkICppcCA9IHRyLT5mdW5jLmFkZHI7Cj4+IC3CoMKgwqAgdW5zaWduZWQg
bG9uZyBmYWRkcjsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiAtwqDCoMKgIGZhZGRyID0gZnRy
YWNlX2xvY2F0aW9uKCh1bnNpZ25lZCBsb25nKWlwKTsKPj4gLcKgwqDCoCBpZiAoZmFkZHIpIHsK
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICghdHItPmZvcHMpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU5PVFNVUFA7Cj4+ICvCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0RZ
TkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTKSAmJgo+PiArwqDCoMKgwqDCoMKgwqAgISFm
dHJhY2VfbG9jYXRpb24oKHVuc2lnbmVkIGxvbmcpaXApKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
dHItPmZ1bmMuZnRyYWNlX21hbmFnZWQgPSB0cnVlOwo+PiAtwqDCoMKgIH0KPj4KPiAKPiBBZnRl
ciB0aGlzIHBhdGNoLCBhIGtlcm5lbCBmdW5jdGlvbiB3aXRoIHRydWUgdHJhY2VfbG9jYXRpb24g
d2lsbCBiZSAKPiBwYXRjaGVkCj4gYnkgYnBmIHdoZW4gQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTIGlzIGRpc2FibGVkLCB3aGljaCAKPiBtZWFucwo+IHRoYXQgYSBrZXJu
ZWwgZnVuY3Rpb24gbWF5IGJlIHBhdGNoZWQgYnkgYm90aCBicGYgYW5kIGZ0cmFjZSBpbiBhIG11
dHVhbGx5Cj4gdW5hd2FyZSB3YXkuIFRoaXMgd2lsbCBjYXVzZSBmdHJhY2UgYW5kIGJwZl9hcmNo
X3RleHRfcG9rZSB0byBmYWlsIGluIGEKPiBzb21ld2hhdCByYW5kb20gd2F5IGlmIHRoZSBmdW5j
dGlvbiB0byBiZSBwYXRjaGVkIHdhcyBhbHJlYWR5IHBhdGNoZWQKPiBieSB0aGUgb3RoZXIuCgpU
aGFua3MgZm9yIHlvdXIgcmV2aWV3LiBBbmQgeWVzLCB0aGlzIGlzIGEgYmFja3dhcmQgY29tcGF0
aWJsZSBzb2x1dGlvbiAKZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBub3Qgc3VwcG9ydCBEWU5BTUlD
X0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUy4KCj4gCj4+IMKgwqDCoMKgwqAgaWYgKGJwZl90cmFt
cG9saW5lX21vZHVsZV9nZXQodHIpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9F
TlQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
