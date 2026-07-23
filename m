Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0B1C44532
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 01:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jw30GzxJFDe4jq0E+uVKc96+SW4gffO2CG1Gu3jtJ7g=; b=SDGWX8R/q1lsGz
	Dfn0WsXSBSnCMEfUkVcCVmb5qCh1qx99x/2+yPxSwveNIkct+HnJRG3djHNZgbNkZu7wTXeZJTgxV
	//fGjc550qbc63k6KWX5dWcxwmwjULH/xZkLoT0K/inbkzH39/pkh4ii2sGQHOD/GzMD0m/xL5/dJ
	QO4KvyRHQyM5IrTNsww1w1S/85lqu/8QBmQO/M3qMqr/Wvw/r4ObCOwlnum/ysJ6qq8k1z8FPYQNB
	aN3f6J3l8NwWxF54VyU0bKh47IDSSHymEOoPgeG5MB1ZyGuF9pWOsEp9GaqaNWT9NzbwC0ME0tMS0
	ulkE01YwvI/OEfF6T1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiiU-0000000DBNU-2x5m;
	Thu, 23 Jul 2026 01:59:18 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiiS-0000000DBN5-0RRH
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 01:59:18 +0000
X-UUID: 17018a86863a11f1aa26b74ffac11d73-20260723
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bd2c8e79-be37-4086-a867-be825a9344c7,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:e7bac3a,CLOUDID:20777172135575d246cb4784041c59a3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:4|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17018a86863a11f1aa26b74ffac11d73-20260723
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 494042459; Thu, 23 Jul 2026 09:59:07 +0800
Message-ID: <9dc7052f-4004-43c8-8e4b-e93134bff469@kylinos.cn>
Date: Thu, 23 Jul 2026 09:59:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 1/3] bpf, riscv: add support for timed
 may_goto
To: Pu Lehui <pulehui@huawei.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
 <20260722-riscv-bpf-timed-may-goto-v4-1-e117e6337bc7@kylinos.cn>
 <53b49505-f593-44d1-a4ea-b3ad81f6cc0b@huawei.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <53b49505-f593-44d1-a4ea-b3ad81f6cc0b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_185916_458955_EEB83621 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNi83LzIyIDE4OjE4LCBQdSBMZWh1aSB3cm90ZToKPiAKPiBPbiAyMDI2LzcvMjIgMTI6
MjEsIEZlbmcgSmlhbmcgd3JvdGU6Cj4+IEltcGxlbWVudCBhcmNoX2JwZl90aW1lZF9tYXlfZ290
bygpIGZvciB0aGUgUlY2NCBKSVQuIFRoZSBhcmd1bWVudCBhbmQKPj4gcmV0dXJuIHZhbHVlIGFy
ZSBjYXJyaWVkIGluIEJQRl9SRUdfQVgsIGFuZCBCUEYgUjAtUjUgYXJlIHByZXNlcnZlZAo+PiBh
Y3Jvc3MgdGhlIGNhbGwgdG8gdGhlIGdlbmVyaWMgYnBmX2NoZWNrX3RpbWVkX21heV9nb3RvKCku
Cj4+Cj4+IEVuYWJsZSBicGZfaml0X3N1cHBvcnRzX3RpbWVkX21heV9nb3RvKCkgc28gdGhlIHZl
cmlmaWVyIHVzZXMgdGhlIHRpbWVkCj4+IGV4cGFuc2lvbiBwYXRoLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4KClsgLi4uXSAKCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfdGltZWRfbWF5X2dvdG8uUyBiL2FyY2gvcmlzY3Yv
bmV0L2JwZl90aW1lZF9tYXlfZ290by5TCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZjRiZjJjZDEwNTg2Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJj
aC9yaXNjdi9uZXQvYnBmX3RpbWVkX21heV9nb3RvLlMKPj4gQEAgLTAsMCArMSw0NyBAQAo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKy8qIENvcHlyaWdodCAo
YykgMjAyNiBGZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4gKi8KPj4gKwo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2xpbmthZ2UuaD4KPj4gKyNpbmNsdWRlIDxhc20vYXNtLmg+Cj4+ICsKPj4g
Ky8qCj4+ICsgKiBUcmFtcG9saW5lIGZvciB0aGUgQlBGIHRpbWVkIG1heV9nb3RvIGxvb3AgYm91
bmQuIEN1c3RvbSBjYWxsaW5nIGNvbnZlbnRpb246Cj4+ICsgKsKgwqDCoCAtIGlucHV0OsKgIHN0
YWNrIG9mZnNldCBpbiBCUEZfUkVHX0FYICh0MCkKPj4gKyAqwqDCoMKgIC0gb3V0cHV0OiB1cGRh
dGVkIGNvdW50IGluIEJQRl9SRUdfQVggKHQwKQo+PiArICoKPj4gKyAqIENhbGxzIGJwZl9jaGVj
a190aW1lZF9tYXlfZ290byhwdHIpIHdpdGggdGhlIHN0YW5kYXJkIFJJU0MtViBBQkksIHdoZXJl
Cj4+ICsgKiBwdHIgPSBCUEZfUkVHX0ZQIChzNSkgKyBCUEZfUkVHX0FYICh0MCkuIEJQRiBSMC1S
NSAoYTUsIGEwLWE0KSBhcmUgc2F2ZWQKPj4gKyAqIGFjcm9zcyB0aGUgY2FsbDsgQlBGX1JFR19G
UCAoczUpIGlzIGNhbGxlZS1zYXZlZCBhbmQgbmVlZHMgbm8gc2F2aW5nLgo+PiArICovCj4+ICsK
Pj4gK1NZTV9GVU5DX1NUQVJUKGFyY2hfYnBmX3RpbWVkX21heV9nb3RvKQo+PiArwqDCoMKgIGFk
ZGnCoMKgwqAgc3AsIHNwLCAtNjQKPj4gK8KgwqDCoCBzZMKgwqDCoCByYSwgNTYoc3ApCj4+ICvC
oMKgwqAgc2TCoMKgwqAgczAsIDQ4KHNwKQo+PiArwqDCoMKgIGFkZGnCoMKgwqAgczAsIHNwLCA2
NAo+PiArCj4+ICvCoMKgwqAgLyogU2F2ZSBCUEYgcmVnaXN0ZXJzIFIwLVI1IChhNSwgYTAtYTQp
ICovCj4+ICvCoMKgwqAgc2TCoMKgwqAgYTUsIDQwKHNwKQo+PiArwqDCoMKgIHNkwqDCoMKgIGEw
LCAzMihzcCkKPj4gK8KgwqDCoCBzZMKgwqDCoCBhMSwgMjQoc3ApCj4+ICvCoMKgwqAgc2TCoMKg
wqAgYTIsIDE2KHNwKQo+PiArwqDCoMKgIHNkwqDCoMKgIGEzLCA4KHNwKQo+PiArwqDCoMKgIHNk
wqDCoMKgIGE0LCAwKHNwKQo+PiArCj4+ICvCoMKgwqAgYWRkwqDCoMKgIGEwLCB0MCwgczUKPj4g
K8KgwqDCoCBjYWxswqDCoMKgIGJwZl9jaGVja190aW1lZF9tYXlfZ290bwo+PiArwqDCoMKgIG12
wqDCoMKgIHQwLCBhMAo+PiArCj4+ICvCoMKgwqAgLyogUmVzdG9yZSBCUEYgcmVnaXN0ZXJzIFIw
LVI1ICovCj4+ICvCoMKgwqAgbGTCoMKgwqAgYTQsIDAoc3ApCj4+ICvCoMKgwqAgbGTCoMKgwqAg
YTMsIDgoc3ApCj4+ICvCoMKgwqAgbGTCoMKgwqAgYTIsIDE2KHNwKQo+PiArwqDCoMKgIGxkwqDC
oMKgIGExLCAyNChzcCkKPj4gK8KgwqDCoCBsZMKgwqDCoCBhMCwgMzIoc3ApCj4+ICvCoMKgwqAg
bGTCoMKgwqAgYTUsIDQwKHNwKQo+PiArCj4+ICvCoMKgwqAgbGTCoMKgwqAgczAsIDQ4KHNwKQo+
PiArwqDCoMKgIGxkwqDCoMKgIHJhLCA1NihzcCkKPj4gK8KgwqDCoCBhZGRpwqDCoMKgIHNwLCBz
cCwgNjQKPj4gK8KgwqDCoCByZXQKPj4gK1NZTV9GVU5DX0VORChhcmNoX2JwZl90aW1lZF9tYXlf
Z290bykKPiAKPiBJIHRoaW5rIHdlIHNob3VsZCB1c2UgUkVHX1MvUkVHX0wvU1pSRUcgbGlrZSBp
biBhcmNoL3Jpc2N2IChbMF0pIOKAkyBpdCBrZWVwcyB1cyBpbiBzeW5jIHdpdGggdXBzdHJlYW0g
YW5kIHdpbGwgbWFrZSBpdCBlYXNpZXIgaWYgd2UgbWF5IGxhdGVyIHBvcnQgdGltZWRfbWF5X2dv
dG8gdG8gUlYzMi4KPiAKPiBbMF0gYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LlMKCkFncmVlZCwg
d2lsbCBzd2l0Y2ggdG8gUkVHX1MvUkVHX0wvU1pSRUcgaW4gdjUuCgotLSAKV2l0aCBCZXN0IFJl
Z2FyZHMsCkZlbmcgSmlhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
