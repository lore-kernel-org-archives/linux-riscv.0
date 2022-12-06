Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE77EC47090
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13pEwT7VmPgpbj/HZt9T4Oblyq5LwVzbEY6hUK1hJR0=; b=0rt7ZsrDnrEhYm
	kyv10BBZ+T8jBZQTUMLMcv5Pj3TBRqiXbBX2W7txT5hOGXUtIVe8loH32pqXSxiwqBDRj2PIO6OR0
	WBXfoPMH2y1FXuYYIQPpMy+VJjweZam/AbDDlqWyVV74iVITi8VfYoqKDW7vE4kfxc9NhE8cNIohy
	v4yEPW47icUrHBULWLIb4LWM1QhXT/zN8/ApdMx62Vbb6uqrhTytTffY3DhIXXXkHVESu6SXbSQv5
	8n2Cf7o+OCfFAqnHbdeIhQZr0hVC2ZrUZY8e5U56LHFLY/Dgi/mRcTKlS/z2LTtiAuajem68L5aFl
	4fogFGZaisCY8X6B7nlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2T7s-004aZ6-2k; Tue, 06 Dec 2022 08:16:28 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2T7o-004aNc-6B
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 08:16:27 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4NRCt62sD3z4f3knY
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 16:16:14 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgCXutdP+o5jHLL8Bg--.18286S2;
	Tue, 06 Dec 2022 16:16:16 +0800 (CST)
Message-ID: <0620000f-4d06-de15-09d9-24b5b0c47410@huaweicloud.com>
Date: Tue, 6 Dec 2022 16:16:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf v2] riscv, bpf: Emit fixed-length instructions for
 BPF_PSEUDO_FUNC
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Pu Lehui <pulehui@huawei.com>
References: <20221202094837.3872444-1-pulehui@huaweicloud.com>
 <87y1rq848x.fsf@all.your.base.are.belong.to.us>
 <0ade59ea-6863-4d68-607c-22e4b9405a0d@huaweicloud.com>
 <87359t3r0h.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <87359t3r0h.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: gCh0CgCXutdP+o5jHLL8Bg--.18286S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw15Gw1DXrWkZFW7GrWxJFb_yoW5ZF13pF
	W5Krn3Cayvqr4IvFnrtw15tF4Yyr1vvayIk345G34vkanFqFyIkF1DKw4Ykas5ZrW8Kr17
	JF4q9r4ak390yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20221206_001624_633018_492F71E2 
X-CRM114-Status: GOOD (  24.65  )
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

CgpPbiAyMDIyLzEyLzYgMTU6NTUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4gCj4+IFNvcnJ5IGZvciByZXBseWluZyBz
byBsYXRlLiBGb3IgQlBGX1BTRVVET19GVU5DIGluc3RydWN0aW9uLCB2ZXJpZmllcgo+PiB3aWxs
IHNldCBpbnNuWzBdLmltbSBhbmQgaW5zblsxXS5pbW0gdG8gMSB0aGF0IG1ha2UgYWRkciB0byAw
eDEwMDAwMDAwMQo+PiBiZWZvcmUgZXh0cmEgcGFzcywgYW5kIGFsc28gY3R4LT5pbnNucyBpcyBO
VUxMIGluIGl0ZXJhdGlvbiBzdGFnZSwgYWxsCj4+IG9mIHRoZXNlIG1ha2Ugb2ZmIG91dCBvZiBy
YW5nZSBvZiBBVUlQQy1BRERJIHJhbmdlLCBhbmQgcmV0dXJuIGZhaWxlZC4KPj4gV2UgY291bGQg
YWRkIHNvbWUgc3BlY2lhbCBoYW5kbGluZyBhdCBkaWZmZXJlbnQgc3RhZ2VzLCBidXQgdGhhdCBz
ZWVtcyBhCj4+IGxpdHRsZSB3ZWlyZC4gQnkgdGhlIHdheSwgSSBkbyBub3QgcmVhbGx5IGxpa2Ug
ZW1pdF9hZGRyIGZ1bmN0aW9uIHdpdGgKPj4gcmV0dXJuIHZhbHVlLgo+IAo+IE15IHJhdGlvbmFs
IGlzIHRoYXQgKmlmKiBmb3Igc29tZSByZWFzb24gdGhlIGppdCBpcyBwYXNzZWQgYW4gYWRkcmVz
cwo+IHRoYXQgYXVpcGMvYWRkaSBjYW4ndCByZXByZXNlbnQsIHdlJ2QgbGlrZSB0byBjYXRjaCB0
aGF0IGFuZCBub3QgZW1pdAo+IGJyb2tlbiBjb2RlLgo+IAo+PiBXaGlsZSBhIHByb3BlciBhZGRy
ZXNzIGlzIGF0IGxlYXN0IDJCIGFsaWdubWVudCwgYW5kIHRoZSB2YWxpZCBhZGRyZXNzCj4+IGlz
IGZyb20gMHhmZmZmZmZmZjAwMDAwMDAwIHRvIDB4ZmZmZmZmZmZmZmZmZmZmZiwgd2UgY2FuIG1h
a2UgYWRkcmVzcwo+PiBzaGlmZWQgMSBwbGFjZSB0byByaWdodCwgYW5kIGFkZHIgPj4gMSB3aWxs
IGFsd2F5cyBpbiB0aGUgcmFuZ2Ugb2YKPj4gQVVJUEMtQURESSByYW5nZS4gV2UgY2FuIGdldCBy
aWQgb2YgdGhlIHJhbmdlIGRldGVjdGlvbi4gVGhlCj4+IGltcGxlbWVudGF0aW9uIGlzIGFzIGZv
bGxvd3M6Cj4+Cj4+IHN0YXRpYyB2b2lkIGVtaXRfYWRkcih1OCByZCwgdTY0IGFkZHIsIHN0cnVj
dCBydl9qaXRfY29udGV4dCAqY3R4KQo+PiB7Cj4+ICAgICAgICAgICAgczY0IGltbSA9IGFkZHIg
Pj4gMTsKPj4gICAgICAgICAgICBzNjQgdXBwZXIgPSAoaW1tICsgKDEgPDwgMTEpKSA+PiAxMjsK
Pj4gICAgICAgICAgICBzNjQgbG93ZXIgPSBpbW0gJiAweGZmZjsKPj4KPj4gICAgICAgICAgICBl
bWl0KHJ2X2x1aShyZCwgdXBwZXIpLCBjdHgpOwo+PiAgICAgICAgICAgIGVtaXQocnZfYWRkaShy
ZCwgcmQsIGxvd2VyKSwgY3R4KTsKPj4gICAgICAgICAgICBlbWl0KHJ2X3NsbGkocmQsIHJkLCAx
KSwgY3R4KTsKPj4gfQo+Pgo+PiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKPiBUaGF0J3MgYSBjb2Rl
IGdlbmVyYXRpb24gcGVuYWx0eSwgaW5zdGVhZCBvZiBjYXRjaGluZyBpdCBhdCBjb2RlCj4gZ2Vu
LiBEb24ndCBsaWtlISA6LSkgSSBtdWNoIHByZWZlciB0aGUgYXVpcGMvYWRkaSB2ZXJzaW9uLgo+
IAo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoZSBkaWZmIChvbi10b3Agb2YgeW91ciB3b3Jr
KSBiZWxvdz8KPiAKPiAtLTg8LS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBpbmRleCBhYTk0
MTBlZWY3N2MuLjdhY2FmMjhjYjNiZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IEBA
IC0xMzcsMTUgKzEzNywyMSBAQCBzdGF0aWMgYm9vbCBpbl9hdWlwY19qYWxyX3JhbmdlKHM2NCB2
YWwpCj4gICB9Cj4gICAKPiAgIC8qIEVtaXQgZml4ZWQtbGVuZ3RoIGluc3RydWN0aW9ucyBmb3Ig
YWRkcmVzcyAqLwo+IC1zdGF0aWMgdm9pZCBlbWl0X2FkZHIodTggcmQsIHU2NCBhZGRyLCBzdHJ1
Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiArc3RhdGljIGludCBlbWl0X2FkZHIodTggcmQsIHU2
NCBhZGRyLCBib29sIGV4dHJhX3Bhc3MsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ICAg
ewo+ICAgCXU2NCBpcCA9ICh1NjQpKGN0eC0+aW5zbnMgKyBjdHgtPm5pbnNucyk7Cj4gICAJczY0
IG9mZiA9IGFkZHIgLSBpcDsKPiAgIAlzNjQgdXBwZXIgPSAob2ZmICsgKDEgPDwgMTEpKSA+PiAx
MjsKPiAgIAlzNjQgbG93ZXIgPSAoKG9mZiAmIDB4ZmZmKSA8PCA1MikgPj4gNTI7Cj4gICAKPiAr
CWlmIChleHRyYV9wYXNzICYmICFpbl9hdWlwY19qYWxyX3JhbmdlKG9mZikpIHsKPiArCQlwcl9l
cnIoImJwZi1qaXQ6IHRhcmdldCBvZmZzZXQgMHglbGx4IGlzIG91dCBvZiByYW5nZVxuIiwgb2Zm
KTsKPiArCQlyZXR1cm4gLUVSQU5HRTsKPiArCX0KPiArCj4gICAJZW1pdChydl9hdWlwYyhyZCwg
dXBwZXIpLCBjdHgpOwo+ICAgCWVtaXQocnZfYWRkaShyZCwgcmQsIGxvd2VyKSwgY3R4KTsKPiAr
CXJldHVybiAwOwo+ICAgfQo+ICAgCj4gICAvKiBFbWl0IHZhcmlhYmxlLWxlbmd0aCBpbnN0cnVj
dGlvbnMgZm9yIDMyLWJpdCBhbmQgNjQtYml0IGltbSAqLwo+IEBAIC0xMDYxLDEzICsxMDY3LDE3
IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24sIHN0
cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgCXsKPiAgIAkJc3RydWN0IGJwZl9pbnNuIGlu
c24xID0gaW5zblsxXTsKPiAgIAkJdTY0IGltbTY0Owo+ICsJCWludCByZXQ7Cj4gICAKPiAgIAkJ
aW1tNjQgPSAodTY0KWluc24xLmltbSA8PCAzMiB8ICh1MzIpaW1tOwo+IC0JCWlmIChicGZfcHNl
dWRvX2Z1bmMoaW5zbikpCj4gKwkJaWYgKGJwZl9wc2V1ZG9fZnVuYyhpbnNuKSkgewo+ICAgCQkJ
LyogZml4ZWQtbGVuZ3RoIGluc25zIGZvciBleHRyYSBqaXQgcGFzcyAqLwo+IC0JCQllbWl0X2Fk
ZHIocmQsIGltbTY0LCBjdHgpOwo+IC0JCWVsc2UKPiArCQkJcmV0ID0gZW1pdF9hZGRyKHJkLCBp
bW02NCwgZXh0cmFfcGFzcywgY3R4KTsKPiArCQkJaWYgKHJldCkKPiArCQkJCXJldHVybiByZXQ7
Cj4gKwkJfSBlbHNlIHsKPiAgIAkJCWVtaXRfaW1tKHJkLCBpbW02NCwgY3R4KTsKPiArCQl9Cj4g
ICAKPiAgIAkJcmV0dXJuIDE7Cj4gICAJfQo+IAo+IC0tODwtLQo+IAo+IFdvdWxkbid0IHRoYXQg
d29yaz8KPiAKCkl0IGRlZmluaXRlbHkgd29ya3MuIEJ1dCBhdWlwYythZGRpIG1heSBiZSBzb21l
IGhvbGVzLCB3aGlsZSAKbHVpK2FkZGkrc2xsaSBzdXBwb3J0IGFsbCB0aGUgYWRkcmVzcyBvZiBr
ZXJuZWwgYW5kIG1vZHVsZS4gQW5kIHRoaXMgCm1pZ2h0IGJlIGhlbHAgZm9yIHRoZSBmdXR1cmUg
ZmVhdHVyZSBwb3J0aW5nLgoKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
