Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD1F55434
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 01:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSMjjaImvD82Q/U/ODLn0E4i36VJM2y0nwyzb/mWwIs=; b=yPc1rxZdp8hEQU
	t+tpPIAH4yCvohjnBODRjSdYPa5Ag9G/jSRRVSysjqlwFYb4IKEmw0PKJhS4Jv2rXZhZ71YmB+ekh
	j+kkQlCWJISMmZ/HG6gqnJk0rUXqmDnyqW356J8TkK/hsiLUxdh0HgA6cNl/N018jsbiTCbL1zGW4
	wPPx/VrFB942896b//b4kocRPZOCcvm352EcBx2nJbz3Ou6qvg6BQ1ZER2AsAwk0TUWQxNm8S98Il
	IporghS67OzKoTJSasV6rdWn0Ka1tEpbvWMNt/8LCzgpS1oZ31bW1WFa6d3mAwbMfTrbnakgJMDI8
	huxN4pdXEYN7xmDjFE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4At-000000033kT-2opF;
	Wed, 25 Feb 2026 01:58:51 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4Aq-000000033k6-1VNs
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 01:58:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VeJ2O0BCo2zRU3gLWZ9ftz4rdNgg/fYFySx32YQqD44=;
	b=t2qO04CNU5gpKQcCx06GBeGbLXlyCEH2bJQDjYG/7R4my6bS3EJmloDAmRTvbccBYrjsj6Qv4
	/uWld0n23lYwINN31oMWUYyt4t/HBmg3s7EwcXSsgXNcFGwXMvk0fYSBQqOkV8v/lmYnQO3zNmP
	xzwQ+85o/ZI5kmaXqA1SdvY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fLHgf6qtgzmV8C;
	Wed, 25 Feb 2026 09:53:50 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C95740562;
	Wed, 25 Feb 2026 09:58:38 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Feb 2026 09:58:37 +0800
Message-ID: <4b219cd0-9391-4edb-83c0-b6a1c60d0790@huawei.com>
Date: Wed, 25 Feb 2026 09:58:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mm: Regression with v7.0-rc1 on RISC-V
To: Zi Yan <ziy@nvidia.com>, Ron Economos <re@w6rz.net>, "David Hildenbrand
 (Arm)" <david@kernel.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <jackmanb@google.com>,
	<jane.chu@oracle.com>, <hannes@cmpxchg.org>, <willy@infradead.org>,
	<muchun.song@linux.dev>, <osalvador@suse.de>, <sidhartha.kumar@oracle.com>,
	<vbabka@suse.cz>, <claudiu.beznea.uj@bp.renesas.com>, Mark Brown
	<broonie@kernel.org>, <akpm@linux-foundation.org>, <pjw@kernel.org>
References: <1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net>
 <13b8d60d-1209-4650-9fa5-982381c53512@kernel.org>
 <1966378802.577797.1771952827516@app.mailbox.org>
 <78D36EC1-2596-448A-A939-0A1AC7B3D1BC@nvidia.com>
 <1AB3E96B-F4CA-4B00-9078-2AC20A1A60DC@nvidia.com>
 <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <272A58BA-445F-46F9-8DAB-D82E43D7771A@nvidia.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf100008.china.huawei.com (7.185.36.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175849_110067_B287AC4A 
X-CRM114-Status: GOOD (  17.42  )
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

CgpPbiAyMDI2LzIvMjUgMToyOSwgWmkgWWFuIHdyb3RlOgo+IE9uIDI0IEZlYiAyMDI2LCBhdCAx
MjoxNywgWmkgWWFuIHdyb3RlOgoKLi4uCgo+Pj4+Cj4+Pj4gVGhpbmtpbmcgYWdhaW4gd2l0aG91
dCBteSBjb21wdXRlciBhdCBoYW5kIOKApiBpc27igJh0IHRoZSBjYWxsIGNvbXBsZXRlbHkgb3B0
aW1pemVkIG91dCB3aXRob3V0IENPTkZJR19ERUJVR19WTT8KPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBB
dCBsZWFzdCB0aGF04oCZcyB3aGF0IEkgcmVtZW1iZXIuCj4+Pgo+Pj4gUmlnaHQuIFdpdGhvdXQg
Q09ORklHX0RFQlVHX1ZNPXksIFZNX1dBUk5fT04oIXB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19w
YWdlKHBmbikpKQo+Pj4gYW5kIGlzX2NoZWNrX3BhZ2VzX2VuYWJsZWQoKSwgd2hpY2ggbGVhZHMg
dG8gZnJlZV9wYWdlX2lzX2JhZCgp4oCZcwo+Pj4g4oCccGFnZSBkdW1wZWQgYmVjYXVzZTogbm9u
emVybyBfcmVmY291bnTigJ0sIGFyZSBkaXNhYmxlZC4KPj4+Cj4+PiBJdCBzZWVtcyB0byBtZSB0
aGF0IHNvbWVvbmUgZWxzZSBidW1wIHRoZSBwYWdlIHJlZmNvdW50IGJldHdlZW4KPj4+IFZNX1dB
Uk5fT04oIXB1dF9wYWdlX3Rlc3R6ZXJvKHBmbl90b19wYWdlKHBmbikpKSBhbmQgZnJlZV9wYWdl
X2lzX2JhZCgpLgo+Pj4KPj4KPj4gTWVyZ2luZyBSb27igJlzIHJlcGx5IGZyb20gYW5vdGhlciB0
aHJlYWRbMV06Cj4+Cj4+IOKAnFNvbWV0aGluZyBzdHJhbmdlIGlzIGdvaW5nIG9uLiBJIGVuYWJs
ZWQgQ09ORklHX0RFQlVHX1ZNIGJ5IGl0c2VsZiBhbmQKPj4gdGhlIGlzc3VlIHdlbnQgYXdheS4g
TGV0IG1lIHRyeSBDT05GSUdfREVCVUdfUEFHRV9SRUYu4oCdCj4+Cj4+IExvb2tzIGxpa2Ugc29t
ZXRoaW5nIGlzIHJhY3ksIHNpbmNlIGl0IGlzIHJlcHJvZHVjaWJsZSByZWxpYWJseS4KPj4KPj4g
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8zMGRkMWVmYy05YmQ5LTQ2NjQtOTk5ZS02
MTBkMTgxNjAwZjlAdzZyei5uZXQvCj4gCj4gVk1fV0FSTl9PTigpIGlzIEJVSUxEX0JVR19PTl9J
TlZBTElEKCkgd2hlbiBDT05GSUdfREVCVUdfVk0gaXMgb2ZmLiBPbmx5Cj4gdGhlIHZhbGlkaXR5
IG9mIHRoZSBleHByZXNzaW9uIGlzIGNoZWNrZWQgYW5kIG5vIGNvZGUgaXMgZ2VuZXJhdGVkLgo+
IFNvIHRoYXQgcHV0X3BhZ2VfdGVzdHplcm8oKSBiZWNvbWVzIGEgTk9QLgoKSW5kZWVkLi4uCgo+
IAo+IEhpIFJvbiwKPiAKPiBDYW4geW91IGNoZWNrIGlmIHRoZSBwYXRjaCBiZWxvdyBmaXggdGhl
IGlzc3VlIHdpdGhvdXQgQ09ORklHX0RFQlVHX1ZNPwo+IAo+IGRpZmYgLS1naXQgYS9tbS9jbWEu
YyBiL21tL2NtYS5jCj4gaW5kZXggOTRiNWRhNDY4YTdkLi45NmJlNjJlYjM3MTMgMTAwNjQ0Cj4g
LS0tIGEvbW0vY21hLmMKPiArKysgYi9tbS9jbWEuYwo+IEBAIC0xMDIwLDggKzEwMjAsMTEgQEAg
Ym9vbCBjbWFfcmVsZWFzZShzdHJ1Y3QgY21hICpjbWEsIGNvbnN0IHN0cnVjdCBwYWdlICpwYWdl
cywKPiAgIAkJcmV0dXJuIGZhbHNlOwo+IAo+ICAgCXBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VzKTsK
PiAtCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrLCBwZm4rKykKPiAtCQlWTV9XQVJOX09OKCFw
dXRfcGFnZV90ZXN0emVybyhwZm5fdG9fcGFnZShwZm4pKSk7Cj4gKwlmb3IgKGkgPSAwOyBpIDwg
Y291bnQ7IGkrKywgcGZuKyspIHsKPiArCQlpbnQgX19tYXliZV91bnVzZWQgcmV0ID0gcHV0X3Bh
Z2VfdGVzdHplcm8ocGZuX3RvX3BhZ2UocGZuKSk7Cj4gKwo+ICsJCVZNX1dBUk5fT04oIXJldCk7
Cj4gKwl9CgpNYXliZSB3ZSBvbmx5IHdhcm4gb25jZSBieSBhZGRpbmcgYmFjayB0aGUgb3JpZ2lu
YWwgY2hlY2s/CgpkaWZmIC0tZ2l0IGEvbW0vY21hLmMgYi9tbS9jbWEuYwppbmRleCA5NGI1ZGE0
NjhhN2QuLmE3M2EyMmQzNDIzMiAxMDA2NDQKLS0tIGEvbW0vY21hLmMKKysrIGIvbW0vY21hLmMK
QEAgLTEwMTQsMTQgKzEwMTQsMTcgQEAgYm9vbCBjbWFfcmVsZWFzZShzdHJ1Y3QgY21hICpjbWEs
IGNvbnN0IHN0cnVjdCAKcGFnZSAqcGFnZXMsCiAgewogICAgICAgICBzdHJ1Y3QgY21hX21lbXJh
bmdlICpjbXI7CiAgICAgICAgIHVuc2lnbmVkIGxvbmcgaSwgcGZuOworICAgICAgIGludCByZXQg
PSAwOwoKICAgICAgICAgY21yID0gZmluZF9jbWFfbWVtcmFuZ2UoY21hLCBwYWdlcywgY291bnQp
OwogICAgICAgICBpZiAoIWNtcikKICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7CgogICAg
ICAgICBwZm4gPSBwYWdlX3RvX3BmbihwYWdlcyk7Ci0gICAgICAgZm9yIChpID0gMDsgaSA8IGNv
dW50OyBpKyssIHBmbisrKQotICAgICAgICAgICAgICAgVk1fV0FSTl9PTighcHV0X3BhZ2VfdGVz
dHplcm8ocGZuX3RvX3BhZ2UocGZuKSkpOworICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3VudDsg
aSsrLCBwZm4rKykgeworICAgICAgICAgICAgICAgcmV0ICsgPSBwdXRfcGFnZV90ZXN0emVybyhw
Zm5fdG9fcGFnZShwZm4pKTsKKworICAgICAgIFdBUk4ocmV0ICE9IDAsICIlbHUgcGFnZXMgYXJl
IHN0aWxsIGluIHVzZSFcbiIsIHJldCk7CgogICAgICAgICBfX2NtYV9yZWxlYXNlX2Zyb3plbihj
bWEsIGNtciwgcGFnZXMsIGNvdW50KTsKCgoKPiAKPiAgIAlfX2NtYV9yZWxlYXNlX2Zyb3plbihj
bWEsIGNtciwgcGFnZXMsIGNvdW50KTsKPiAKPiAKPiAKPiBCZXN0IFJlZ2FyZHMsCj4gWWFuLCBa
aQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
