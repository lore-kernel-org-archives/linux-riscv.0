Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E11C54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 01:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5e6ejwW6mBif70x9G57FeNko1S53d3Dlu8NQVNAyyU=; b=MMzup38boCO/6k
	I5vwzzORouCuFpIqk7DBroG0fOP1zaRfA5bFtVG4mvC132rRZBLDg5eD3hUCPuJ8ukvzT2+dH+jHl
	pTrJMYcnAudWs5U2oQfwjKAD1lTw/JHefNcEYg8nSKAAWW1Y+DXVIjNxbppTtmeBw6gJALLJfUIFM
	y+NVtilE+clLVMD5sc8g+y/bQZcFBSmo2kpnYkl+J2ZOwqU4Fo0939NyCS/ci4DYp89KnE8Iq3QBV
	RE5eUhKjSj25sbKNCG3Vq4DZWTeAbDXt1kgUewyyuOt1jq3lszWMEYWu7Yvq65aWkUrpR5IrPnTVJ
	3B5pM833JB7G4/dsylEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovrJ-00000002gBO-16e5;
	Tue, 26 Mar 2024 01:44:13 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovrG-00000002gAm-0Gof
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 01:44:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V3Xdk02GJz4f3jXq
	for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 09:43:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 2CCBE1A01A7
	for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 09:44:00 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgB3lA1dKAJmPQpfIA--.9979S2;
	Tue, 26 Mar 2024 09:43:58 +0800 (CST)
Message-ID: <c812aed1-8659-4cdf-bcee-89d100ded9d4@huaweicloud.com>
Date: Tue, 26 Mar 2024 09:43:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement bpf_addr_space_cast
 instruction
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Puranjay Mohan <puranjay12@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Manu Bretelle <chantra@meta.com>,
 Mykola Lysenko <mykolal@meta.com>, Nikolay Yurin <yurinnick@meta.com>
References: <20240325155434.65589-1-puranjay12@gmail.com>
 <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
 <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
 <20240325-perpetual-liking-25f26e485b65@spud>
 <CANk7y0jtURUC6PWx5nSDigMpScUT+p3qd=hTtqJkCqAN+Nq32A@mail.gmail.com>
 <878r263vg3.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <878r263vg3.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: cCh0CgB3lA1dKAJmPQpfIA--.9979S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury8AryUAw4UXw48AF1DWrg_yoW8GryUpF
	W5KFyFyws5Ca9rJ395Ka18Jr4rCrs5ta4UA3WkJrWUZr1agF1jgryIkFZ0ka43ZrZ7GFya
	yFnIvw1UG3Z8uaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1rMa5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_184410_458539_CA21A97E 
X-CRM114-Status: GOOD (  12.67  )
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

CgpPbiAyMDI0LzMvMjYgNDozMSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdXJhbmpheSBNb2hh
biA8cHVyYW5qYXkxMkBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gSXMgdGhlcmUgYSBzZXBhcmF0
ZSBDSSBmb3IgUklTQ1YgcmVsYXRlZCBzdHVmZj8gaXMgaXQgcHVibGljPwo+Pgo+PiBJIHdvdWxk
IGJlIGludGVyZXN0ZWQgaW4gYWRkaW5nIFJJU0MtViBzdXBwb3J0IGluCj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9rZXJuZWwtcGF0Y2hlcy9icGYKPj4gSXMgc29tZW9uZSBhbHJlYWR5IHdvcmtpbmcg
b24gdGhpcz8KPiAKPiArQ2MgTWFudS9NeWtvbGEvTmljbyB3aG8ncyBkb2luZyBhbGwgb2YgdGhl
IGF3ZXNvbWUgQlBGIENJIHdvcmsgYXQgTWV0YSwKPiBhbmQgY2FuIGtlZXAgbWUgaG9uZXN0LiA7
LSkKPiAKPiBJIGRpZCBzb21lIGVhcmx5IGhhY2tzIGZvciB0byBhZGQgUklTQy1WIHN1cHBvcnQg
Zm9yIHRoZSBCUEYgQ0ksIGJ1dAo+IGhhdmVuJ3QgaGFkIHRpbWUgdG8gd29yayBvbiBpdCByZWNl
bnRseS4gOi0oCj4gCj4gICAgWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJicGYvY2kvcHVsbC84
Nwo+ICAgIFsyXSBodHRwczovL2dpdGh1Yi5jb20va2VybmVsLXBhdGNoZXMvdm10ZXN0L3B1bGwv
MTk0Cj4gCj4gSSd2ZSBiZWVuIHRhbGtpbmcgcmVjZW50bHkgdG8gTGVodWkgYWJvdXQgaXQgYXMg
d2VsbC4KPiAKPiBUd28gbWFqb3IgdGhpbmdzIGFyZSBtaXNzaW5nOgo+IAo+IDEuIENyb3NzLWNv
bXBpbGF0aW9uIHN1cHBvcnQgKGV4cGFuZCBvbiBbMV0pCj4gMi4gQWxpZ24gdGhlIHJvb3RmcyB3
aXRoIHdoYXQgdGhlIG90aGVyIGFyY2ggYXJlIHVzaW5nLCB0byBydW4gdGhlIHRlc3RzCj4gICAg
IG9uIFFlbXUvVENHIChhbmQgcHJvcGVyIEhXIGF0IHNvbWUgcG9pbnQhKS4gUklTQy1WIGRvZXMg
bm90IGhhdmUKPiAgICAgRGViaWFuIFN0YWJsZSBzdXBwb3J0LCBhbmQgd291bGQgcHJvYmFibHkg
bmVlZCBVYnVudHUgb3IgRGViaWFuIFNpZAo+ICAgICBzbmFwc2hvcC4gTWFudSBvdXRsaW5lcyBz
b21lIGlzc3VlcyBoZXJlOgo+ICAgICBodHRwczovL2dpdGh1Yi5jb20vbGliYnBmL2NpL3B1bGwv
ODMKCnllYWgsIHRoZSBjdXJyZW50IGlzc3VlIGJlbG93IGlzIGZpeGVkIGFuZCBJIHRoaW5rIHdl
IGNhbiBtb3ZlIGZvcndhcmQuCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9icGYvYnBmLmdpdC9jb21taXQvP2lkPTQ0MzU3NGIwMzM4NzZjODVhMzVkZTRj
NjVjMTRmN2ZlMDkyMjIyYjIKCj4gCj4gSGF2aW5nIHRvIG1hbnVhbGx5IHJ1biBCUEYgdGVzdHMg
KCJub24tb2ZmaWNpYWwgUklTQy1WIEJQRiBDSSIpIGlzIGEKPiBtZXNzIQo+IAo+IAo+IEJqw7Zy
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
