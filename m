Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6AC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zr40IeJg7LDih+suThjnEvlUUYADYhhw9RSSWpnkCE8=; b=VGBqqiW/KDWK0G
	kOS+xickBzsPqJOGo7KtSQ+JaHMWR/Zn8jq2lC4GTPw8y9POjbAM080PSJhYc+v/t+XVehfIIUFF/
	V4l5mrVrs6rXfKZGPs06bCJg+57bCljELY4WNtnCGIQjf+P0nl9esBYjpnxzj7OaD98osfwleVt3a
	9b2v8waKRBbKE4bOHK6IV3HQTe9VKURjl8+diZ1wd+xU9B6IVwItYH8ahrnD7cvLfyeNMfu/osDYP
	DfYjKJGHbjef8PQ2sRJ3VGXiKx+AWkU/239gXBDUEbGFkaW+uux//8d7cxNoKN4B/sde+9r7gyIWJ
	5K+pwO7gtM4Uvbe/ZxAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCd1t-000Mpp-AV; Tue, 03 Jan 2023 08:52:17 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcpm-000EfT-LU
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:39:49 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NmQzh4gJHzJpXn;
	Tue,  3 Jan 2023 16:35:44 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 3 Jan 2023 16:39:42 +0800
Message-ID: <09763a5e-22c9-513d-ca51-9234478b9c67@huawei.com>
Date: Tue, 3 Jan 2023 16:39:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH bpf-next 3/4] riscv, bpf: Add bpf_arch_text_poke
 support for RV64
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui
	<pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20221219133736.1387008-1-pulehui@huaweicloud.com>
 <20221219133736.1387008-4-pulehui@huaweicloud.com>
 <87v8looypd.fsf@all.your.base.are.belong.to.us>
 <713f9f26-da42-eda8-c804-338d61b1557c@huawei.com>
 <877cy4xc2l.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <877cy4xc2l.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_003946_957152_70D61A21 
X-CRM114-Status: UNSURE (   7.18  )
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

CgpPbiAyMDIzLzEvMyAxNjoyMSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWkuY29tPiB3cml0ZXM6Cj4gCj4+IE9uIDIwMjMvMS8zIDE1OjM3LCBCasO2cm4g
VMO2cGVsIHdyb3RlOgo+Pj4gUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0
ZXM6Cj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
IGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+Pj4+IGluZGV4IGJmNDcyMWE5OWEw
OS4uZmE4YjAzYzUyNDYzIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcDY0LmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4+Pgo+
Pj4+IEBAIC0xMjY2LDcgKzEzODksNyBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3Ry
dWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPj4+PiAgICAK
Pj4+PiAgICB2b2lkIGJwZl9qaXRfYnVpbGRfcHJvbG9ndWUoc3RydWN0IHJ2X2ppdF9jb250ZXh0
ICpjdHgpCj4+Pj4gICAgewo+Pj4+IC0JaW50IHN0YWNrX2FkanVzdCA9IDAsIHN0b3JlX29mZnNl
dCwgYnBmX3N0YWNrX2FkanVzdDsKPj4+PiArCWludCBpLCBzdGFja19hZGp1c3QgPSAwLCBzdG9y
ZV9vZmZzZXQsIGJwZl9zdGFja19hZGp1c3Q7Cj4+Pj4gICAgCWJvb2wgaXNfbWFpbl9wcm9nID0g
Y3R4LT5wcm9nLT5hdXgtPmZ1bmNfaWR4ID09IDA7Cj4+Pgo+Pj4gVGhpcyBsaW5lIG1hZ2ljYWxs
eSBhcHBlYXJlZCwgYW5kIG1ha2VzIGl0IGhhcmQgdG8gYXBwbHkgdGhlIHNlcmllcwo+Pj4gd2l0
aG91dCBoYWNraW5nIHRoZSBwYXRjaGVzIG1hbnVhbGx5LiBHb2luZyBmb3J3YXJkLCBwbGVhc2Ug
c3VwcGx5IGEKPj4+IGJhc2UgdHJlZSBjb21taXQgdG8gdGhlIHNlcmllcyAob3IgYSBsaW5rIHRv
IGEgY29tcGxldGUgZ2l0IHRyZWUpLgo+Pj4KPj4KPj4gQSByZWJhc2UgdmVyc2lvbiBoYXMgYmVl
biByZXNlbmQgYXMgZm9sbG93Ogo+Pgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAy
MjEyMjAwMjEzMTkuMTY1NTg3MS0xLXB1bGVodWlAaHVhd2VpY2xvdWQuY29tLwo+IAo+IFllcywg
YnV0IHdpdGggdGhlIHNhbWUgaXNzdWU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIw
MjIxMjIwMDIxMzE5LjE2NTU4NzEtNC1wdWxlaHVpQGh1YXdlaWNsb3VkLmNvbS8KPiAKPiBUaGUg
ImlzX21haW5fcHJvZyIgbGluZSBpcyBzdGlsbCBhcm91bmQgaW4gdGhlIHJlc2VuZC4KPiAKCk9v
cHMsIHNvbWV0aGluZyB3YXMgbGVmdCB3aGVuIGRlYnVnZ2luZyBtaXhpbmcgYnBmMmJwZiBhbmQg
dGFpbGNhbGxzLiAKU29ycnksIHdpbGwgc2VuZCB2Mi4KCj4gCj4gQmrDtnJuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
