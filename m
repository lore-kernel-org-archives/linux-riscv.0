Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457AEC636D6
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 01:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poNBLsvS+JZhpu99xE3k+Zps06FPbO4riPBjyrXkXp8=; b=VJHHsmlv6jQVbH
	BEvVIsqVWm8uNrHRWseUJJUBcE+XOIjHrv6G4p5P4Yt00uMCfu8tTjrm3g71qjxoqGvVvU00/36Ch
	1tLueL2O8+prW5qw8DoQIqIoHLCLGFKpJOCzQyxWJy+S+cxb/RzlATV7utHff9pYU/mvOfijU5UbY
	AumFLrAopcmxY2SHyyJlE+0aSUonE2/vUQAzb3RRZgcU//9C/5g/Al52vj8Z0dPcKB9l33zxs1BCd
	P03d9j3A1EsG1TMi9SbJIy6xVYpeKrAX2vdGfb72wbZ0kSeAkV9Y9Y8Xu8FVmD0+M1mTXnszPqBrb
	qcd8WXHXXdZv7sQG3iZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTC46-00G8a7-1o; Sat, 18 Feb 2023 01:31:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTC42-00G8Xy-J0
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 01:31:01 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PJWKJ6L6rznW8X;
	Sat, 18 Feb 2023 09:28:20 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 18 Feb 2023 09:30:44 +0800
Message-ID: <3c9d2ff9-46b3-1587-e0c0-e3931118fb01@huawei.com>
Date: Sat, 18 Feb 2023 09:30:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong
 Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
	<guoren@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
	<xi.wang@gmail.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
 <8735763pcu.fsf@all.your.base.are.belong.to.us>
 <091287c6-5121-58e5-b1b2-76277d2f1b1a@iogearbox.net>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <091287c6-5121-58e5-b1b2-76277d2f1b1a@iogearbox.net>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_173058_994310_C5241166 
X-CRM114-Status: GOOD (  11.70  )
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

CgpPbiAyMDIzLzIvMTggNDo0OSwgRGFuaWVsIEJvcmttYW5uIHdyb3RlOgo+IE9uIDIvMTYvMjMg
MTA6NTYgQU0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gQlBGIHRyYW1wb2xpbmUgaXMgdGhlIGNyaXRpY2Fs
IGluZnJhc3RydWN0dXJlIG9mIHRoZSBicGYKPj4+IHN1YnN5c3RlbSwgYWN0aW5nIGFzIGEgbWVk
aWF0b3IgYmV0d2VlbiBrZXJuZWwgZnVuY3Rpb25zCj4+PiBhbmQgQlBGIHByb2dyYW1zLiBOdW1l
cm91cyBpbXBvcnRhbnQgZmVhdHVyZXMsIHN1Y2ggYXMKPj4+IHVzaW5nIGVicGYgcHJvZ3JhbSBm
b3IgemVybyBvdmVyaGVhZCBrZXJuZWwgaW50cm9zcGVjdGlvbiwKPj4+IHJlbHkgb24gdGhpcyBr
ZXkgY29tcG9uZW50LiBXZSBjYW4ndCB3YWl0IHRvIHN1cHBvcnQgYnBmCj4+PiB0cmFtcG9saW5l
IG9uIFJWNjQuIFNpbmNlIFJWNjQgZG9lcyBub3Qgc3VwcG9ydCBmdHJhY2UKPj4+IGRpcmVjdCBj
YWxsIHlldCwgdGhlIGN1cnJlbnQgUlY2NCBicGYgdHJhbXBvbGluZSBpcyBvbmx5Cj4+PiB1c2Vk
IGluIGJwZiBjb250ZXh0Lgo+Pj4KPj4+IEFzIG1vc3Qgb2YgcmlzY3YgY3B1IHN1cHBvcnQgdW5h
bGlnbmVkIG1lbW9yeSBhY2Nlc3NlcywKPj4+IHdlIHRlbXBvcmFyaWx5IHVzZSBwYXRjaCBbMV0g
dG8gZmFjaWxpdGF0ZSB0ZXN0aW5nLiBUaGUKPj4+IHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93
LCBhbmQgdGVzdF92ZXJpZmllciB3aXRoIG5vCj4+PiBuZXcgZmFpbHVyZSBjZXNlcy4KPj4+Cj4+
PiAtIGZleGl0X2JwZjJicGY6T0sKPj4+IC0gZHVtbXlfc3Rfb3BzOk9LCj4+PiAtIHhkcF9icGYy
YnBmOk9LCj4+Pgo+Pj4gWzFdIAo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyMTA5MTYxMzA4NTUuNDA1NDkyNi0yLWNoZW5odWFuZzVAaHVhd2VpLmNvbS8KPj4+Cj4+
PiB2MToKPj4+IC0gUmVtb3ZlIHRoZSBsb2dpYyBvZiBicGZfYXJjaF90ZXh0X3Bva2Ugc3VwcG9y
dGVkIGZvcgo+Pj4gwqDCoCBrZXJuZWwgZnVuY3Rpb25zLiAoS3VvaGFpIGFuZCBCasO2cm4pCj4+
PiAtIEV4dGVuZCBwYXRjaF90ZXh0IGZvciBtdWx0aXBsZSBpbnN0cnVjdGlvbnMuIChCasO2cm4p
Cj4+PiAtIEZpeCBPT0IgaXNzdWUgd2hlbiBpbWFnZSB0b28gYmlnLiAoQmrDtnJuKQo+Pgo+PiBU
aGlzIHNlcmllcyBpcyByZWFkeSB0byBnbyBpbiBhcyBpcy4KPiAKPiBPay4KPiAKPj4gQFBhbG1l
ciBJJ2QgbGlrZSB0byB0YWtlIHRoaXMgc2VyaWVzIHZpYSB0aGUgYnBmLW5leHQgdHJlZSAoYXMg
dXN1YWwpLAo+PiBidXQgbm90ZSB0aGF0IHRoZXJlIGFyZSBzb21lIG5vbi1CUEYgY2hhbmdlcyBh
cyB3ZWxsLCByZWxhdGVkIHRvIHRleHQKPj4gcG9raW5nLgo+Pgo+PiBATGVodWkgSSdkIGxpa2Ug
dG8gc2VlIHR3byBmb2xsb3ctdXAgcGF0Y2hlczoKPj4KPj4gMS4gRW5hYmxlIGtmdW5jIGZvciBS
VjY0LCBieSBhZGRpbmc6Cj4+IMKgIHwgYm9vbCBicGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwo
dm9pZCkKPj4gwqAgfCB7Cj4+IMKgIHzCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+PiDC
oCB8IH0KPj4KPj4gMi4gUmVtb3ZlIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcgb24gcGF0Y2ggNDoK
Pj4gwqAgfCBXQVJOSU5HOiBrZnJlZShOVUxMKSBpcyBzYWZlIGFuZCB0aGlzIGNoZWNrIGlzIHBy
b2JhYmx5IG5vdCByZXF1aXJlZAo+PiDCoCB8ICMzMTM6IEZJTEU6IGFyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmM6OTg0Ogo+PiDCoCB8ICvCoMKgwqAgaWYgKGJyYW5jaGVzX29mZikKPj4g
wqAgfCArwqDCoMKgwqDCoMKgwqAga2ZyZWUoYnJhbmNoZXNfb2ZmKTsKPj4KPj4KPj4gRm9yIHRo
ZSBzZXJpZXM6Cj4+Cj4+IFRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+PiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+
IFRoYW5rcywgSSBmaXhlZCB1cCBpc3N1ZSAyIGFuZCBjbGVhbmVkIHVwIHRoZSBjb21taXQgbXNn
cyB3aGlsZSBhcHBseWluZy4KPiBGb3IgaXNzdWUgMSwgcGxzIHNlbmQgYSBmb2xsb3ctdXAuCgpU
aGFuayB5b3UgYm90aCwgd2lsbCBoYW5kbGUgdGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
