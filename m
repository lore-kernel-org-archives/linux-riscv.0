Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21192CD4F4C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 02:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zj6Y8JPs8wHULQj4Y+y18DnoKrPkThHzgV8wUsdEvaM=; b=Th9pWcbM8qBEcG
	Fu1Rb+J8sHH43z9BI0rUWZKWC8NmcnWOlC5rt9P/YPdBcTnWhZV2r5WUPX0KAVLTdsXjMqbgNZchs
	FCbxKL3JQ1wbtiTjTVinRdWuJkWEXOvr+4XS1piXW/lr5uP2+e84pS2TjlT7zCVGiVMlbiDarwxiD
	W3tC5BFu6IvET8t2f6YWwhGRlEV5zOC+lWLx/LpyKQIRG9Nl+9qs/WK6sLDlWmXmakjGzqLmhI5v7
	nj0LxQK9Pok9Xh6sK6/Ptp3nkukS4zyfpZdoO/JvBGw9z0rLw5Jsrntp9i6k5GIQPSgSYki1NXYRw
	aqr4++uG4d2NEALSRMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm2D0-00000006hEm-3Fp0;
	Thu, 05 Sep 2024 02:26:54 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm2Cv-00000006hBr-1oK1
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 02:26:52 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wzjsc75lcz4f3kK5
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 10:26:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 534811A0359
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 10:26:39 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgB3+V7bFtlm_4W0AQ--.33113S2;
	Thu, 05 Sep 2024 10:26:36 +0800 (CST)
Message-ID: <1c88c7b7-3554-4ae6-92ca-9297c38f1bd3@huaweicloud.com>
Date: Thu, 5 Sep 2024 10:26:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 0/4] Fix accessing first syscall argument on
 RV64
Content-Language: en-US
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
 patchwork-bot+netdevbpf@kernel.org
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 john fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
 <172548183128.1158691.9881712792582282151.git-patchwork-notify@kernel.org>
 <CAEf4BzayV1ihbfSg4fv0AqSazVycXqCJp4dTq1pwRt5hmx7X4g@mail.gmail.com>
 <CAEf4Bza5i+MFqeOs8w+Zhw4e6vt7KMgVwjNaEOTz33P8T6Ldsg@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAEf4Bza5i+MFqeOs8w+Zhw4e6vt7KMgVwjNaEOTz33P8T6Ldsg@mail.gmail.com>
X-CM-TRANSID: Syh0CgB3+V7bFtlm_4W0AQ--.33113S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF48XF1rAr1xJw1kJw1DJrb_yoW5GFW5pa
	y8AFWYkr4UXFW8X3Z29rWj9F1ktw4Fkry5WryUJrs5uF9FgF1Ygr1I9w4Yg3ZxXr97G3ya
	vr12vasI9342vFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_192650_067332_DF6568A9 
X-CRM114-Status: GOOD (  15.29  )
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

CgpPbiAyMDI0LzkvNSA4OjAzLCBBbmRyaWkgTmFrcnlpa28gd3JvdGU6Cj4gT24gV2VkLCBTZXAg
NCwgMjAyNCBhdCAzOjQ04oCvUE0gQW5kcmlpIE5ha3J5aWtvCj4gPGFuZHJpaS5uYWtyeWlrb0Bn
bWFpbC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiBXZWQsIFNlcCA0LCAyMDI0IGF0IDE6MzDi
gK9QTSA8cGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4g
SGVsbG86Cj4+Pgo+Pj4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gYnBmL2JwZi1uZXh0Lmdp
dCAobWFzdGVyKQo+Pj4gYnkgQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9yZz46Cj4+
Pgo+Pj4gT24gU2F0LCAzMSBBdWcgMjAyNCAwNDoxOTozMCArMDAwMCB5b3Ugd3JvdGU6Cj4+Pj4g
T24gUlY2NCwgYXMgSWx5YSBtZW50aW9uZWQgYmVmb3JlIFswXSwgdGhlIGZpcnN0IHN5c2NhbGwg
cGFyYW1ldGVyIHNob3VsZCBiZQo+Pj4+IGFjY2Vzc2VkIHRocm91Z2ggb3JpZ19hMCAoc2VlIGFy
Y2gvcmlzY3Y2NC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgpLAo+Pj4+IG90aGVyd2lzZSBpdCB3aWxs
IGNhdXNlIHNlbGZ0ZXN0cyBsaWtlIGJwZl9zeXNjYWxsX21hY3JvLCB2bWxpbnV4LAo+Pj4+IHRl
c3RfbHNtLCBldGMuIHRvIGZhaWwgb24gUlY2NC4KPj4+Pgo+Pj4+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2JwZi8yMDIyMDIwOTAyMTc0NS4yMjE1NDUyLTEtaWlpQGxpbnV4LmlibS5j
b20gWzBdCj4+Pj4KPj4+PiBbLi4uXQo+Pj4KPj4+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKPj4+ICAgIC0gW2JwZi1uZXh0LHYzLDEvNF0gbGliYnBmOiBBY2Nlc3MgZmlyc3Qgc3lz
Y2FsbCBhcmd1bWVudCB3aXRoIENPLVJFIGRpcmVjdCByZWFkIG9uIHMzOTAKPj4+ICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy82NWVlMTFkOWM4MjIKPj4+ICAgIC0g
W2JwZi1uZXh0LHYzLDIvNF0gbGliYnBmOiBBY2Nlc3MgZmlyc3Qgc3lzY2FsbCBhcmd1bWVudCB3
aXRoIENPLVJFIGRpcmVjdCByZWFkIG9uIGFybTY0Cj4+PiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvYnBmL2JwZi1uZXh0L2MvZWJkOGFkNDc0ODg4Cj4+PiAgICAtIFticGYtbmV4dCx2Mywz
LzRdIHNlbGZ0ZXN0cy9icGY6IEVuYWJsZSB0ZXN0X2JwZl9zeXNjYWxsX21hY3JvOnN5c2NhbGxf
YXJnMSBvbiBzMzkwIGFuZCBhcm02NAo+Pj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Jw
Zi9icGYtbmV4dC9jLzNhOTEzYzRkNjJlMQo+Pj4gICAgLSBbYnBmLW5leHQsdjMsNC80XSBsaWJi
cGY6IEZpeCBhY2Nlc3NpbmcgZmlyc3Qgc3lzY2FsbCBhcmd1bWVudCBvbiBSVjY0Cj4+PiAgICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvYnBmL2JwZi1uZXh0L2MvMTMxNDNjNTgxNmJjCj4+Pgo+
Pgo+PiBPaywgSSBoYWQgdG8gInVuYXBwbHkiIHRoZXNlIHBhdGNoZXMsIGFzIHMzOTB4IHNlbGZ0
ZXN0IChicGZfc3lzY2FsbF9tYWNybykgc3RhcnRlZCBmYWlsaW5nIChhcm02NCBpcyBmaW5lLCBz
byBJIHRoaW5rIGl0J3MgcHJvYmFibHkgZHVlIHRvIHBhdGNoICMzIHRoYXQgY2hhbmdlcyBzZWxm
dGVzdHMgaXRzZWxmKS4KPj4KPj4gUHUsIGNhbiB5b3UgcGxlYXNlIHRha2UgYSBsb29rIGF0IHRo
YXQgKGUuZy4sIHNlZSBbMF0pPyBJdCdzIGEgYml0IHN0cmFuZ2UsIGFzIG9yaWdpbmFsbHkgbm8g
ZXJyb3Igd2FzIHJlcG9ydGVkLCBzbyBub3Qgc3VyZSB3aGF0IGNoYW5nZWQuIFBsZWFzZSBhbHNv
IHNlZSB0aGUgdGhpbmdzIEkgd2FzIGZpeGluZyB1cCB3aGlsZSBhcHBseWluZywgc28gSSBkb24n
dCBoYXZlIHRvIGRvIGl0IGFnYWluIDopCj4+Cj4+ICAgIFswXSBodHRwczovL2dpdGh1Yi5jb20v
a2VybmVsLXBhdGNoZXMvYnBmL2FjdGlvbnMvcnVucy8xMDcwOTAyNDc1NS9qb2IvMjk2OTMwNTY1
NTAjc3RlcDo1Ojg3NDYKPiAKPiBPaCwgSSBmaWd1cmVkIGl0IG91dCEgVGhhdCB0bXAgaXMgdGhl
cmUgZm9yIGEgcmVhc29uISBXZQo+IGJwZl9wcm9iZV9yZWFkX2tlcm5lbCgpIDggYnl0ZXMsIGJ1
dCBzeXNjYWxsJ3MgMXN0IGFyZ3VtZW50IGl0c2VsZiBpcwo+IDQgYnl0ZSBsb25nLCBzbyB3ZSBu
ZWVkIHRvIGNhc3QgdTY0IHRvIHUzMi4gQW5kIHMzOTB4IGJlaW5nIHRoZSBiaWcKPiBlbmRpYW4g
YXJjaGl0ZWN0dXJlIGRldGVjdGVkIHRoaXMgcHJvYmxlbSwgd2hpbGUgZm9yIGFybTY0IHdlIHdl
cmUKPiBsdWNreS4KPiAKPiBTbyBuZXZlciBtaW5kLCBJJ2xsIGFwcGx5IHlvdXIgcGF0Y2hlcyB3
aXRoIGZpeCB1cHMgaW4gdGhlCj4gYnBmX3RyYWNpbmcuaCBoZWFkZXIsIGJ1dCBJIHdvbid0IHRv
dWNoIHBhdGNoICMzLgoKU29ycnkgZm9yIGNvdWxkbid0IHJlcGx5IGluIHRpbWUgZHVlIHRvIGpl
dCBsYWcuIEdsYWQgdGhlIGlzc3VlIGRpZG4ndCAKYmxvY2sgaW4gdGhlIGVuZC7wn5iECgo+IAo+
Pgo+Pj4gWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCj4+PiAtLQo+Pj4gRGVldC1kb290LWRv
dCwgSSBhbSBhIGJvdC4KPj4+IGh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3Jr
L3B3Ym90Lmh0bWwKPj4+Cj4+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
