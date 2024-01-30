Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68EEC47DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2j6WZ/xLBylzeTRoi2y3H1ZjTM8aTCXNXI048LmIvw=; b=JTVxa7U8SsLpqc
	JApgQq3mRvtWX5Q2YteqT4dBINGYoklyELPYDoVYLzQ6zgq6TyLYOsTHwU66mmi6Ac2NmPF2fBrrl
	NMT3ppuvIJAMgc57fv3/mrRLxuphXRjz4s73XSSfLgivCAi7uVeA7b5GQyuoQtTc8wNlA6+qnCl+x
	ebnPRC9kG+EC2iBBihZGhMcv+W6yhyeaS0rrXw+uDL6cS0xb17shBfrxOPHMjWiQr07++K3pr71Yv
	msQXR89FImb5mFXAIllYOD+dP2dSoSoe5WlVGRMh1qKhNfvOrkEA2gYyhFvbvPFH8mWoxMeBmTTGp
	GSvItr2n6FcJnP+U+HvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUefP-0000000F6H1-3KMC;
	Tue, 30 Jan 2024 03:20:07 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUefL-0000000F6Dg-2wJC
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 03:20:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TP9NJ04kZz29krM;
	Tue, 30 Jan 2024 11:18:08 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 486A61A016B;
	Tue, 30 Jan 2024 11:19:57 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Tue, 30 Jan 2024 11:19:56 +0800
Message-ID: <8cc7d3ad-1b34-478d-bfc8-6a2f791aa5d9@huawei.com>
Date: Tue, 30 Jan 2024 11:19:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/3] bpf: Keep im address consistent between dry
 run and real patching
Content-Language: en-US
To: Song Liu <song@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>
References: <20240123103241.2282122-1-pulehui@huaweicloud.com>
 <20240123103241.2282122-3-pulehui@huaweicloud.com>
 <CAPhsuW67c8NYxBhwrq8JK8HP95P1Wwq1zHEDqooAOgP+aru13g@mail.gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <CAPhsuW67c8NYxBhwrq8JK8HP95P1Wwq1zHEDqooAOgP+aru13g@mail.gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_192004_149728_A8EB241E 
X-CRM114-Status: GOOD (  20.95  )
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

CgpPbiAyMDI0LzEvMzAgMTo1OCwgU29uZyBMaXUgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjMsIDIw
MjQgYXQgMjozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6
Cj4+Cj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Cj4+IEluIF9fYXJj
aF9wcmVwYXJlX2JwZl90cmFtcG9saW5lLCB3ZSBlbWl0IGluc3RydWN0aW9ucyB0byBzdG9yZSB0
aGUKPj4gYWRkcmVzcyBvZiBpbSB0byByZWdpc3RlciBhbmQgdGhlbiBwYXNzIGl0IHRvIF9fYnBm
X3RyYW1wX2VudGVyIGFuZAo+PiBfX2JwZl90cmFtcF9leGl0IGZ1bmN0aW9ucy4gQ3VycmVudGx5
IHdlIHVzZSBmYWtlIGltIGluCj4+IGFyY2hfYnBmX3RyYW1wb2xpbmVfc2l6ZSBmb3IgdGhlIGRy
eSBydW4sIGFuZCB0aGVuIGFsbG9jYXRlIG5ldyBpbSBmb3IKPj4gdGhlIHJlYWwgcGF0Y2hpbmcu
IFRoaXMgaXMgZmluZSBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IHVzZSBmaXhlZAo+PiBpbnN0cnVj
dGlvbnMgdG8gZ2VuZXJhdGUgYWRkcmVzc2VzLiBIb3dldmVyLCBmb3IgYXJjaGl0ZWN0dXJlcyB0
aGF0IHVzZQo+PiBkeW5hbWljIGluc3RydWN0aW9ucyB0byBnZW5lcmF0ZSBhZGRyZXNzZXMsIHRo
aXMgbWF5IG1ha2UgdGhlIGZyb250IGFuZAo+PiByZWFyIGltYWdlcyBpbmNvbnNpc3RlbnQsIGxl
YWRpbmcgdG8gcGF0Y2hpbmcgb3ZlcmZsb3cuIFdlIGNhbiBleHRyYWN0Cj4+IHRoZSBpbSBhbGxv
Y2F0aW9uIGFoZWFkIG9mIHRoZSBkcnkgcnVuIGFuZCBwYXNzIHRoZSBhbGxvY2F0ZWQgaW0gdG8K
Pj4gYXJjaF9icGZfdHJhbXBvbGluZV9zaXplLCBzbyB0aGF0IHdlIGNhbiBlbnN1cmUgdGhhdCBp
bSBpcyBjb25zaXN0ZW50IGluCj4+IGRyeSBydW4gYW5kIHJlYWwgcGF0Y2hpbmcuCj4gCj4gSUlV
QywgdGhpcyBpcyByZXF1aXJlZCBiZWNhdXNlIGVtaXRfaW1tKCkgZm9yIHJpc2N2IG1heSBnZW5l
cmF0ZSB2YXJpYWJsZQo+IHNpemUgaW5zdHJ1Y3Rpb25zIChkZXBlbmRzIG9uIHRoZSB2YWx1ZSBv
ZiBpbSkuIEkgd29uZGVyIHdlIGNhbiBmaXggdGhpcyBieQo+IHNpbXBseSBzZXQgYSBzcGVjaWFs
IHZhbHVlIGZvciBmYWtlIGltIGluIGFyY2hfYnBmX3RyYW1wb2xpbmVfc2l6ZSgpIHRvCj4gc28g
dGhhdCBlbWl0X2ltbSgpIGFsd2F5cyBnaXZlcyBiaWdnZXN0IHZhbHVlIGZvciB0aGUgZmFrZSBp
bS4KPiAKCkhpIFNvbmcsCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LiBZZXMsIEkgaGFkIHRoZSBz
YW1lIGlkZWEgYXMgeW91IGF0IGZpcnN0LCBlbWl0IApiaWdnaXN0IGNvdW50IGluc3RydWN0aW9u
cyB3aGVuIGN0eC0+aW5zbnMgaXMgTlVMTCwgYnV0IHRoaXMgbWF5IGxlYWQgdG8gCm1lbW9yeSB3
YXN0ZS4gU28gdHJ5IG1vdmluZyBvdXQgb2YgSU0gdG8gZ2V0IGEgZml4ZWQgSU0gYWRkcmVzcywg
bWF5YmUgCm90aGVyIGFyY2hpdGVjdHVyZXMgcmVxdWlyZSBpdCB0b28uIElmIHlvdSBmZWVsIGl0
IGlzIGluYXBwcm9wcmlhdGUsIEkgCndpbGwgd2l0aGRyYXcgaXQuCgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+PiAtLS0KPiBbLi4uXQo+Pgo+PiAg
IHN0YXRpYyBpbnQgYnBmX3RyYW1wb2xpbmVfdXBkYXRlKHN0cnVjdCBicGZfdHJhbXBvbGluZSAq
dHIsIGJvb2wgbG9ja19kaXJlY3RfbXV0ZXgpCj4+IEBAIC00MzIsMjMgKzQyNSwyNyBAQCBzdGF0
aWMgaW50IGJwZl90cmFtcG9saW5lX3VwZGF0ZShzdHJ1Y3QgYnBmX3RyYW1wb2xpbmUgKnRyLCBi
b29sIGxvY2tfZGlyZWN0X211dAo+PiAgICAgICAgICAgICAgICAgIHRyLT5mbGFncyB8PSBCUEZf
VFJBTVBfRl9PUklHX1NUQUNLOwo+PiAgICNlbmRpZgo+Pgo+PiAtICAgICAgIHNpemUgPSBhcmNo
X2JwZl90cmFtcG9saW5lX3NpemUoJnRyLT5mdW5jLm1vZGVsLCB0ci0+ZmxhZ3MsCj4+ICsgICAg
ICAgaW0gPSBremFsbG9jKHNpemVvZigqaW0pLCBHRlBfS0VSTkVMKTsKPj4gKyAgICAgICBpZiAo
IWltKSB7Cj4+ICsgICAgICAgICAgICAgICBlcnIgPSAtRU5PTUVNOwo+PiArICAgICAgICAgICAg
ICAgZ290byBvdXQ7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgc2l6ZSA9IGFyY2hfYnBm
X3RyYW1wb2xpbmVfc2l6ZShpbSwgJnRyLT5mdW5jLm1vZGVsLCB0ci0+ZmxhZ3MsCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGxpbmtzLCB0ci0+ZnVuYy5hZGRy
KTsKPj4gICAgICAgICAgaWYgKHNpemUgPCAwKSB7Cj4+ICAgICAgICAgICAgICAgICAgZXJyID0g
c2l6ZTsKPj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+PiArICAgICAgICAgICAgICAgZ290
byBvdXRfZnJlZV9pbTsKPj4gICAgICAgICAgfQo+Pgo+PiAgICAgICAgICBpZiAoc2l6ZSA+IFBB
R0VfU0laRSkgewo+PiAgICAgICAgICAgICAgICAgIGVyciA9IC1FMkJJRzsKPj4gLSAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+PiArICAgICAgICAgICAgICAgZ290byBvdXRfZnJlZV9pbTsKPj4g
ICAgICAgICAgfQo+Pgo+PiAtICAgICAgIGltID0gYnBmX3RyYW1wX2ltYWdlX2FsbG9jKHRyLT5r
ZXksIHNpemUpOwo+PiAtICAgICAgIGlmIChJU19FUlIoaW0pKSB7Cj4+IC0gICAgICAgICAgICAg
ICBlcnIgPSBQVFJfRVJSKGltKTsKPj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+PiAtICAg
ICAgIH0KPj4gKyAgICAgICBlcnIgPSBicGZfdHJhbXBfaW1hZ2VfYWxsb2MoaW0sIHRyLT5rZXks
IHNpemUpOwo+PiArICAgICAgIGlmIChlcnIgPCAwKQo+PiArICAgICAgICAgICAgICAgZ290byBv
dXRfZnJlZV9pbTsKPiAKPiBJIGZlZWwgdGhpcyBjaGFuZ2UganVzdCBtYWtlcyBicGZfdHJhbXBv
bGluZV91cGRhdGUoKSBldmVuCj4gbW9yZSBjb25mdXNpbmcuCj4gCj4+Cj4+ICAgICAgICAgIGVy
ciA9IGFyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShpbSwgaW0tPmltYWdlLCBpbS0+aW1hZ2Ug
KyBzaXplLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRy
LT5mdW5jLm1vZGVsLCB0ci0+ZmxhZ3MsIHRsaW5rcywKPj4gQEAgLTQ5Niw2ICs0OTMsOCBAQCBz
dGF0aWMgaW50IGJwZl90cmFtcG9saW5lX3VwZGF0ZShzdHJ1Y3QgYnBmX3RyYW1wb2xpbmUgKnRy
LCBib29sIGxvY2tfZGlyZWN0X211dAo+Pgo+PiAgIG91dF9mcmVlOgo+PiAgICAgICAgICBicGZf
dHJhbXBfaW1hZ2VfZnJlZShpbSk7Cj4+ICtvdXRfZnJlZV9pbToKPj4gKyAgICAgICBrZnJlZV9y
Y3UoaW0sIHJjdSk7Cj4gCj4gSWYgd2UgZ290byBvdXRfZnJlZSBhYm92ZSwgd2Ugd2lsbCBjYWxs
IGtmcmVlX3JjdShpbSwgcmN1KQo+IHR3aWNlLCByaWdodD8gT25jZSBpbiBicGZfdHJhbXBfaW1h
Z2VfZnJlZSgpLCBhbmQgYWdhaW4KPiBoZXJlLgo+IAoKT29wcywgc29ycnksIGZvcmdvdCB0byBy
ZW1vdmUga2ZyZWVfcmN1IGluIGJwZl90cmFtcF9pbWFnZV9mcmVlIGluIHRoaXMgCnZlcnNpb24u
Cgo+IFRoYW5rcywKPiBTb25nCj4gCj4gWy4uLl0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
