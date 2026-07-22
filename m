Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9441C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ETbMvet6ocCYpU06swq2PeDa61QnRTEhBziwEnK2w4=; b=qNzG9jSevYL5fF
	FXyRg6rhszrC+ls9RnknfPJa/AvWDQ61m58uL0Z54Cuj4urBK+pWaqxoycMPqygTKa0rIcM8JPxXe
	SPr4OW9jAFU+8GlhSRrqVc/jAKD768LW0zVOytuZF5bR5nDIA0Wbta3c8xFKJA1f83kmVuccAeRXW
	g/wpc1EdbnjCV0+Pmb3TgxlZtBLIBTYwSCUhJF7mOvc+wiaCwN096CuEMJOZ389NdK0vbT3d9/7Kv
	C9SRpX53AA37fXAQAGvRG751TnSfPCCd6V68OJa+VpQsHAKcK92K3mXCChudKkw7n0T9KlXmXWGMu
	kyHLfZ5IZVesQuUCGaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU3u-0000000BWiL-1H5a;
	Wed, 22 Jul 2026 10:20:26 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmU3r-0000000BWKK-1sLA
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 10:20:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=h9L8mZwcaSEYqtHbvb4ujqFx0pT12RwD6oNzavrJYvE=;
	b=4DwY6um3U7bafCA1X9Y9RRHNOHavkkRwtEebewVEtIekBpcjcvBP+YczJPxY1YduGPc/yfIto
	1tPzHs/zmV8qzc6T2hVU86xoSItkwbYtT0S3cV8NFlp2AA6Hm5bwp7hi1i5/6nMVmX+ch7oTsVa
	oxSlmoQfoYb+VUE52Ewswjo=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h4qhh6njYzcZyH;
	Wed, 22 Jul 2026 18:08:36 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id C36A6202E6;
	Wed, 22 Jul 2026 18:18:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 22 Jul
 2026 18:18:04 +0800
Message-ID: <53b49505-f593-44d1-a4ea-b3ad81f6cc0b@huawei.com>
Date: Wed, 22 Jul 2026 18:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 1/3] bpf, riscv: add support for timed
 may_goto
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
 <20260722-riscv-bpf-timed-may-goto-v4-1-e117e6337bc7@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260722-riscv-bpf-timed-may-goto-v4-1-e117e6337bc7@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_032023_797403_23A33919 
X-CRM114-Status: GOOD (  19.66  )
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

Ck9uIDIwMjYvNy8yMiAxMjoyMSwgRmVuZyBKaWFuZyB3cm90ZToKPiBJbXBsZW1lbnQgYXJjaF9i
cGZfdGltZWRfbWF5X2dvdG8oKSBmb3IgdGhlIFJWNjQgSklULiBUaGUgYXJndW1lbnQgYW5kCj4g
cmV0dXJuIHZhbHVlIGFyZSBjYXJyaWVkIGluIEJQRl9SRUdfQVgsIGFuZCBCUEYgUjAtUjUgYXJl
IHByZXNlcnZlZAo+IGFjcm9zcyB0aGUgY2FsbCB0byB0aGUgZ2VuZXJpYyBicGZfY2hlY2tfdGlt
ZWRfbWF5X2dvdG8oKS4KPiAKPiBFbmFibGUgYnBmX2ppdF9zdXBwb3J0c190aW1lZF9tYXlfZ290
bygpIHNvIHRoZSB2ZXJpZmllciB1c2VzIHRoZSB0aW1lZAo+IGV4cGFuc2lvbiBwYXRoLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEZlbmcgSmlhbmcgPGppYW5nZmVuZ0BreWxpbm9zLmNuPgo+IC0tLQo+
ICAgYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUgICAgICAgICAgICAgfCAgMiArLQo+ICAgYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgfCAxMiArKysrKysrKystCj4gICBhcmNoL3Jp
c2N2L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvTWFrZWZpbGUgYi9h
cmNoL3Jpc2N2L25ldC9NYWtlZmlsZQo+IGluZGV4IDlhMWU1ZjBhOTRlNS4uNjQ1OGQ0ZDUxOTkw
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNj
di9uZXQvTWFrZWZpbGUKPiBAQCAtMyw3ICszLDcgQEAKPiAgIG9iai0kKENPTkZJR19CUEZfSklU
KSArPSBicGZfaml0X2NvcmUubwo+ICAgCj4gICBpZmVxICgkKENPTkZJR19BUkNIX1JWNjRJKSx5
KQo+IC0Jb2JqLSQoQ09ORklHX0JQRl9KSVQpICs9IGJwZl9qaXRfY29tcDY0Lm8KPiArCW9iai0k
KENPTkZJR19CUEZfSklUKSArPSBicGZfaml0X2NvbXA2NC5vIGJwZl90aW1lZF9tYXlfZ290by5v
Cj4gICBlbHNlCj4gICAJb2JqLSQoQ09ORklHX0JQRl9KSVQpICs9IGJwZl9qaXRfY29tcDMyLm8K
PiAgIGVuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggYWQwODlhOWE0ZWE5Li44
ZmU4OTY5ZmI4YTAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQu
Ywo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtMTg0MSw3ICsx
ODQxLDEyIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmlu
c24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgCQlpZiAoYXV4LT50YWlsX2NhbGxf
cmVhY2hhYmxlICYmIGluc24tPnNyY19yZWcgPT0gQlBGX1BTRVVET19DQUxMKQo+ICAgCQkJZW1p
dF9zZChSVl9SRUdfU1AsIGN0eC0+dGNjX29mZnNldCwgUlZfUkVHX1RDQywgY3R4KTsKPiAgIAo+
IC0JCWlmIChpbnNuLT5zcmNfcmVnICE9IEJQRl9QU0VVRE9fQ0FMTCkKPiArCQkvKgo+ICsJCSAq
IGFyY2hfYnBmX3RpbWVkX21heV9nb3RvKCkgaXMgZW1pdHRlZCBieSB0aGUgdmVyaWZpZXIgYW5k
Cj4gKwkJICogcmV0dXJucyBpdHMgcmVzdWx0IGluIEJQRl9SRUdfQVggaW5zdGVhZCBvZiBCUEZf
UkVHXzAsIHNvCj4gKwkJICogc2tpcCB0aGUgbm9ybWFsICJtb3ZlIHJldHVybiByZWdpc3RlciBp
bnRvIFIwIi4KPiArCQkgKi8KPiArCQlpZiAoaW5zbi0+c3JjX3JlZyAhPSBCUEZfUFNFVURPX0NB
TEwgJiYgYWRkciAhPSAodTY0KWFyY2hfYnBmX3RpbWVkX21heV9nb3RvKQo+ICAgCQkJZW1pdF9t
dihicGZfdG9fcnZfcmVnKEJQRl9SRUdfMCwgY3R4KSwgUlZfUkVHX0EwLCBjdHgpOwo+ICAgCQli
cmVhazsKPiAgIAl9Cj4gQEAgLTIxNjEsMyArMjE2Niw4IEBAIGJvb2wgYnBmX2ppdF9zdXBwb3J0
c19zdWJwcm9nX3RhaWxjYWxscyh2b2lkKQo+ICAgewo+ICAgCXJldHVybiB0cnVlOwo+ICAgfQo+
ICsKPiArYm9vbCBicGZfaml0X3N1cHBvcnRzX3RpbWVkX21heV9nb3RvKHZvaWQpCj4gK3sKPiAr
CXJldHVybiB0cnVlOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl90aW1l
ZF9tYXlfZ290by5TIGIvYXJjaC9yaXNjdi9uZXQvYnBmX3RpbWVkX21heV9nb3RvLlMKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjRiZjJjZDEwNTg2Cj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl90aW1lZF9tYXlfZ290by5TCj4g
QEAgLTAsMCArMSw0NyBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAq
Lwo+ICsvKiBDb3B5cmlnaHQgKGMpIDIwMjYgRmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3Mu
Y24+ICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+ICsjaW5jbHVkZSA8YXNt
L2FzbS5oPgo+ICsKPiArLyoKPiArICogVHJhbXBvbGluZSBmb3IgdGhlIEJQRiB0aW1lZCBtYXlf
Z290byBsb29wIGJvdW5kLiBDdXN0b20gY2FsbGluZyBjb252ZW50aW9uOgo+ICsgKgktIGlucHV0
OiAgc3RhY2sgb2Zmc2V0IGluIEJQRl9SRUdfQVggKHQwKQo+ICsgKgktIG91dHB1dDogdXBkYXRl
ZCBjb3VudCBpbiBCUEZfUkVHX0FYICh0MCkKPiArICoKPiArICogQ2FsbHMgYnBmX2NoZWNrX3Rp
bWVkX21heV9nb3RvKHB0cikgd2l0aCB0aGUgc3RhbmRhcmQgUklTQy1WIEFCSSwgd2hlcmUKPiAr
ICogcHRyID0gQlBGX1JFR19GUCAoczUpICsgQlBGX1JFR19BWCAodDApLiBCUEYgUjAtUjUgKGE1
LCBhMC1hNCkgYXJlIHNhdmVkCj4gKyAqIGFjcm9zcyB0aGUgY2FsbDsgQlBGX1JFR19GUCAoczUp
IGlzIGNhbGxlZS1zYXZlZCBhbmQgbmVlZHMgbm8gc2F2aW5nLgo+ICsgKi8KPiArCj4gK1NZTV9G
VU5DX1NUQVJUKGFyY2hfYnBmX3RpbWVkX21heV9nb3RvKQo+ICsJYWRkaQlzcCwgc3AsIC02NAo+
ICsJc2QJcmEsIDU2KHNwKQo+ICsJc2QJczAsIDQ4KHNwKQo+ICsJYWRkaQlzMCwgc3AsIDY0Cj4g
Kwo+ICsJLyogU2F2ZSBCUEYgcmVnaXN0ZXJzIFIwLVI1IChhNSwgYTAtYTQpICovCj4gKwlzZAlh
NSwgNDAoc3ApCj4gKwlzZAlhMCwgMzIoc3ApCj4gKwlzZAlhMSwgMjQoc3ApCj4gKwlzZAlhMiwg
MTYoc3ApCj4gKwlzZAlhMywgOChzcCkKPiArCXNkCWE0LCAwKHNwKQo+ICsKPiArCWFkZAlhMCwg
dDAsIHM1Cj4gKwljYWxsCWJwZl9jaGVja190aW1lZF9tYXlfZ290bwo+ICsJbXYJdDAsIGEwCj4g
Kwo+ICsJLyogUmVzdG9yZSBCUEYgcmVnaXN0ZXJzIFIwLVI1ICovCj4gKwlsZAlhNCwgMChzcCkK
PiArCWxkCWEzLCA4KHNwKQo+ICsJbGQJYTIsIDE2KHNwKQo+ICsJbGQJYTEsIDI0KHNwKQo+ICsJ
bGQJYTAsIDMyKHNwKQo+ICsJbGQJYTUsIDQwKHNwKQo+ICsKPiArCWxkCXMwLCA0OChzcCkKPiAr
CWxkCXJhLCA1NihzcCkKPiArCWFkZGkJc3AsIHNwLCA2NAo+ICsJcmV0Cj4gK1NZTV9GVU5DX0VO
RChhcmNoX2JwZl90aW1lZF9tYXlfZ290bykKCkkgdGhpbmsgd2Ugc2hvdWxkIHVzZSBSRUdfUy9S
RUdfTC9TWlJFRyBsaWtlIGluIGFyY2gvcmlzY3YgKFswXSkg4oCTIGl0IAprZWVwcyB1cyBpbiBz
eW5jIHdpdGggdXBzdHJlYW0gYW5kIHdpbGwgbWFrZSBpdCBlYXNpZXIgaWYgd2UgbWF5IGxhdGVy
IApwb3J0IHRpbWVkX21heV9nb3RvIHRvIFJWMzIuCgpbMF0gYXJjaC9yaXNjdi9rZXJuZWwvbWNv
dW50LlMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
