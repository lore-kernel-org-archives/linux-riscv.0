Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E76C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 02:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBeVctUMWskIG8J1UHeOx2GLiYYeIYqiSXgSO3dgMDQ=; b=auG6ndz4rg6j/G
	6Gd9RmA/kTS2D7Zvs5PXD2NM8cSuGa+CnS32myO+zkYpVi+tZLTM3Cv7H4HKWsH11DRQAIpei6V5w
	MPt4ezDGcSEzXywcZFKlK1jFOr5SbgwdKy5ctsvwb67oT5R2udnVtu83eH1bdD5h7zPn63aKZzx+C
	HrtBilGftPKSIzNsibUXuesuZJEK3CTkY6LXhjdYv7NcLc309nflHVacXzeYO0IT304z8+zhR44/b
	XzrO9/Xb+l9xGMzC6aI75hqmV67V1agCQ9E18ql/a7sAXZoG/DBybKZIHXMoHO6Uv1ag6ttbcF2Bg
	gDMZwwe8WdWa72JPffUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we20R-0000000DayM-0zwc;
	Mon, 29 Jun 2026 02:45:55 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we20N-0000000Dawm-1tSR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 02:45:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+RJGyhOhZ1tq7Gv/WlbCg3jJO5RCxNjVoq4LnTJ7QMw=;
	b=zLFZCyhKBZTaW85ElrIqjEtWjtBULUaJRgJ79csFigvWxfctAYuAhpSmb0X8384DNa/kmMLwK
	+oWvsgT6b/pzLEEso0TzdGz+WkNEBVKx8eHnrWybYlaUklmJyMyAHDO3RccwX7+fIfz06j3WE+v
	OC2qxfpzMkzbl76y2sbMM2w=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gpVlg4bDmz1K98D;
	Mon, 29 Jun 2026 10:36:31 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id A47AA40578;
	Mon, 29 Jun 2026 10:45:38 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 29 Jun
 2026 10:45:37 +0800
Message-ID: <912fa271-7358-46b6-ad19-8a2a25b7d34a@huawei.com>
Date: Mon, 29 Jun 2026 10:45:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/3] riscv: stacktrace: Implement
 arch_bpf_stack_walk() for BPF
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Varun R Mallya
	<varunrmallya@gmail.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
CC: <alex@ghiti.fr>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<puranjay@kernel.org>, <shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
 <20260628081710.113333-2-varunrmallya@gmail.com>
 <87ik72y3sr.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87ik72y3sr.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_194552_143039_2960F1D8 
X-CRM114-Status: GOOD (  19.60  )
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

Ck9uIDIwMjYvNi8yOSAxOjI2LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFZhcnVuIQo+IAo+IFRo
YW5rcyBmb3Igc3BlbmRpbmcgdGltZSBvbiBnZXR0aW5nIFJWIGVCUEYgbW9yZSBmZWF0dXJlIGNv
bXBsZXRlISBTb3JyeQo+IGZvciB0aGUgc2xvdyByZXBsaWVzLgo+IAo+IFZhcnVuIFIgTWFsbHlh
IDx2YXJ1bnJtYWxseWFAZ21haWwuY29tPiB3cml0ZXM6Cj4gCj4+IFRoaXMgd2lsbCBiZSB1c2Vk
IGJ5IGJwZl90aHJvdygpIHRvIHVud2luZCB0aWxsIHRoZSBwcm9ncmFtIG1hcmtlZCBhcwo+PiBl
eGNlcHRpb24gYm91bmRhcnkgYW5kIHJ1biB0aGUgY2FsbGJhY2sgd2l0aCB0aGUgc3RhY2sgb2Yg
dGhlIG1haW4KPj4gcHJvZ3JhbS4KPj4gVGhpcyBpcyByZXF1aXJlZCBmb3Igc3VwcG9ydGluZyBC
UEYgZXhjZXB0aW9ucyBvbiBSSVNDLVYuCj4+IFRoaXMgZGVwZW5kcyBvbiB0aGUgZnJhbWUgcG9p
bnRlciB1bndpbmRlciwgc28gaXQgaXMgb25seSBidWlsdCB1bmRlcgo+PiBDT05GSUdfRlJBTUVf
UE9JTlRFUiwgZWxzZSBmYWxscyBiYWNrIHRvIHRoZSB3ZWFrIG5vLW9wLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBWYXJ1biBSIE1hbGx5YSA8dmFydW5ybWFsbHlhQGdtYWlsLmNvbT4KPj4gUmV2aWV3
ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGFyY2gvcmlz
Y3Yva2VybmVsL3N0YWNrdHJhY2UuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3Rh
Y2t0cmFjZS5jCj4+IGluZGV4IGM3NTU1NDQ3MTQ5Yi4uNjQ5MjkzODFiYjMwIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc3RhY2t0cmFjZS5jCj4+IEBAIC01LDYgKzUsNyBAQAo+PiAgICAqLwo+PiAgIAo+PiAg
ICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9maWx0ZXIuaD4K
Pj4gICAjaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvc2No
ZWQuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQvZGVidWcuaD4KPj4gQEAgLTEwMiw2ICsx
MDMsMzYgQEAgdm9pZCBub3RyYWNlIHdhbGtfc3RhY2tmcmFtZShzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRhc2ssIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+PiAgIAl9Cj4+ICAgfQo+PiAgIAo+PiArdm9p
ZCBub3RyYWNlIGFyY2hfYnBmX3N0YWNrX3dhbGsoYm9vbCAoKmNvbnN1bWVfZm4pKHZvaWQgKmNv
b2tpZSwgdTY0IGlwLCB1NjQgc3AsIHU2NCBicCksCj4+ICsJCQkJIHZvaWQgKmNvb2tpZSkKPj4g
K3sKPj4gKwl1bnNpZ25lZCBsb25nIGZwLCBzcCwgcGM7Cj4+ICsJaW50IGdyYXBoX2lkeCA9IDA7
Cj4+ICsKPj4gKwlmcCA9ICh1bnNpZ25lZCBsb25nKV9fYnVpbHRpbl9mcmFtZV9hZGRyZXNzKDAp
Owo+PiArCXNwID0gY3VycmVudF9zdGFja19wb2ludGVyOwo+PiArCXBjID0gKHVuc2lnbmVkIGxv
bmcpYXJjaF9icGZfc3RhY2tfd2FsazsKPj4gKwo+PiArCWZvciAoOzspIHsKPj4gKwkJc3RydWN0
IHN0YWNrZnJhbWUgKmZyYW1lOwo+PiArCj4+ICsJCWlmICh1bmxpa2VseSghX19rZXJuZWxfdGV4
dF9hZGRyZXNzKHBjKSkpCj4+ICsJCQlicmVhazsKPj4gKwkJLyogcGMgYmVsb25ncyB0byB0aGUg
ZnVuY3Rpb24gd2hvc2UgZnJhbWUgcG9pbnRlciBpcyBmcCAqLwo+PiArCQlpZiAoIWNvbnN1bWVf
Zm4oY29va2llLCBwYywgc3AsIGZwKSkKPj4gKwkJCWJyZWFrOwo+PiArCQlpZiAodW5saWtlbHko
IWZwX2lzX3ZhbGlkKGZwLCBzcCkpKQo+PiArCQkJYnJlYWs7Cj4+ICsKPj4gKwkJZnJhbWUgPSAo
c3RydWN0IHN0YWNrZnJhbWUgKilmcCAtIDE7Cj4+ICsJCXNwID0gZnA7Cj4+ICsJCWZwID0gUkVB
RF9PTkNFX1RBU0tfU1RBQ0soY3VycmVudCwgZnJhbWUtPmZwKTsKPj4gKwkJcGMgPSBSRUFEX09O
Q0VfVEFTS19TVEFDSyhjdXJyZW50LCBmcmFtZS0+cmEpOwo+PiArCQlwYyA9IGZ0cmFjZV9ncmFw
aF9yZXRfYWRkcihjdXJyZW50LCAmZ3JhcGhfaWR4LCBwYywKPj4gKwkJCQkJICAgJmZyYW1lLT5y
YSk7Cj4+ICsJfQo+PiArfQo+IAo+IFdlIGRvbid0IG5lZWQgbW9yZSBzdGFjayB1bndpbmRlcnMu
IENhbiB5b3Ugc2VlIGlmIHlvdSBjYW4gZXh0ZW5kCj4gd2Fsa19zdGFja2ZyYW1lKCkgd2l0aCAi
Y29va2llIiB0byBtYXRjaCBCUEYncyBuZWVkcz8gSGF2ZSBhIGxvb2sgYXQKPiB3aGF0IGFybTY0
IGRvZXMuCj4gCj4gU2FzaGlrbyBoYWQgYSBnb29kIHBvaW50IGFib3V0IGZ0cmFjZV9ncmFwaF9y
ZXRfYWRkcigpIC0tIG5vdyB3aGF0IGFib3V0Cj4ga3JldHByb2JlPyBEbyB3ZSBuZWVkIHRvIHRh
a2UgdGhhdCBpbiBjb25zaWRlcmF0aW9uIGFzIHdlbGw/CgpJSVVDLCBhcmNoX2JwZl9zdGFja193
YWxrIG9ubHkgdW53aW5kIGZvciBicGYgcHJvZyBzdGFjaywgbWF5YmUgd2UgY291bGQgCm5vdCBu
ZWVkIHRvIGhhbmRsZSBrcmV0cHJvYmUuCgo+IAo+IAo+IFRoYW5rcywKPiBCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
