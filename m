Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836BCCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGEAw8H76bvRT02vHq49TlEfGVGjVShv2SD5+DmaNo4=; b=MDBrOJqC+W7CO5
	y4OA8niUAhdNY1kL+npKw32aWS8tSq2Xk88XkD+2LC+bWz8bEXomuMg6uKU/9CwSAb9ZOr7/FSaCe
	lapXVoPB2FkmIRkaAmj1KTA46A7qUkeePv+PaufyS4iNssqour6c2CpIEKUUoaVzNuE/qbz3wzc6m
	vSvLYw6F6CAl8R9tdTfNZaYFjcyBJFXKZv0AyXsRV0MXR3BOdo23cn+cciNjCZPOpatLeg3lubJTm
	TXESRQP7R7Innr38E7yCufEQmxwcbJGmiz04xsQhFEc3vssr1vrQ3dRuK67N8LhfNeIIIKHMmJXt0
	TVMmHX2Q2U5fyIB6GO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2tD-0000000GpmR-3D5F;
	Wed, 03 Apr 2024 15:51:03 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2t9-0000000Gpir-3u0m
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 15:51:02 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V8q381gCKz4f3mHy
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 23:50:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 9C8481A0172
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 23:50:52 +0800 (CST)
Received: from [10.82.3.99] (unknown [10.82.3.99])
	by APP1 (Coremail) with SMTP id cCh0CgDnAQvaeg1mi5PLIw--.46271S2;
	Wed, 03 Apr 2024 23:50:52 +0800 (CST)
Message-ID: <9bffde6f-ca7f-40d4-9b27-4e53ed274751@huaweicloud.com>
Date: Wed, 3 Apr 2024 23:50:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add testcase where 7th
 argment is struct
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240403072818.1462811-1-pulehui@huaweicloud.com>
 <20240403072818.1462811-3-pulehui@huaweicloud.com>
 <0f459fc1-1445-6e83-ace4-b2c42abfe884@iogearbox.net>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <0f459fc1-1445-6e83-ace4-b2c42abfe884@iogearbox.net>
X-CM-TRANSID: cCh0CgDnAQvaeg1mi5PLIw--.46271S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy8urW5Aw4furW8Cw13CFg_yoW5AF4fpF
	18Xw15Kry8Jr4fAr17JrWUXFWFvr4kXw1UJry7JF15Zr1DGr10qF1Igr4j9F15Jr4kGr1a
	yw12qry5uryUXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU13rcDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_085100_455170_52E975B4 
X-CRM114-Status: GOOD (  13.54  )
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

CgpPbiAyMDI0LzQvMyAyMjo0MCwgRGFuaWVsIEJvcmttYW5uIHdyb3RlOgo+IE9uIDQvMy8yNCA5
OjI4IEFNLCBQdSBMZWh1aSB3cm90ZToKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
LmNvbT4KPj4KPj4gQWRkIHRlc3RjYXNlIHdoZXJlIDd0aCBhcmd1bWVudCBpcyBzdHJ1Y3QgZm9y
IGFyY2hpdGVjdHVyZXMgd2l0aCA4Cj4+IGFyZ3VtZW50IHJlZ2lzdGVycywgYW5kIGluY3JlYXNl
IHRoZSBjb21wbGV4aXR5IG9mIHRoZSBzdHJ1Y3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPgo+PiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgo+PiAtLS0KPj4gwqAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNU
LmFhcmNoNjTCoCB8wqAgMSArCj4+IMKgIC4uLi9zZWxmdGVzdHMvYnBmL2JwZl90ZXN0bW9kL2Jw
Zl90ZXN0bW9kLmPCoMKgIHwgMTkgKysrKysrKysrKwo+PiDCoCAuLi4vc2VsZnRlc3RzL2JwZi9w
cm9nX3Rlc3RzL3RyYWNpbmdfc3RydWN0LmMgfCAxMyArKysrKysrCj4+IMKgIC4uLi9zZWxmdGVz
dHMvYnBmL3Byb2dzL3RyYWNpbmdfc3RydWN0LmPCoMKgwqDCoMKgIHwgMzUgKysrKysrKysrKysr
KysrKysrKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0IAo+
PiBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5hYXJjaDY0Cj4+IGluZGV4
IGQ4YWRlMTVlMjc4OS4uNjM5ZWUzZjViYzc0IDEwMDY0NAo+PiAtLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NAo+PiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NAo+PiBAQCAtNiw2ICs2LDcgQEAga3Byb2JlX211
bHRpX3Rlc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjIAo+PiBuZWVkcyBDT05GSUdfRlBST0JFCj4+IMKgIG1vZHVsZV9hdHRh
Y2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICMgcHJvZyAKPj4gJ2twcm9iZV9tdWx0aSc6IGZhaWxlZCB0byBhdXRv
LWF0dGFjaDogLTk1Cj4+IMKgIGZlbnRyeV90ZXN0L2ZlbnRyeV9tYW55X2FyZ3PCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgCj4+IGZlbnRyeV9tYW55X2FyZ3M6RkFJ
TDpmZW50cnlfbWFueV9hcmdzX2F0dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAtNTI0Cj4+IMKgIGZl
eGl0X3Rlc3QvZmV4aXRfbWFueV9hcmdzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIyAKPj4gZmV4aXRfbWFueV9hcmdzOkZBSUw6ZmV4aXRfbWFueV9hcmdzX2F0
dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAtNTI0Cj4+ICt0cmFjaW5nX3N0cnVjdMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICMgCj4+IHRlc3RfZmVudHJ5OkZBSUw6dHJhY2luZ19zdHJ1Y3RfX2F0dGFjaCB1bmV4cGVjdGVk
IGVycm9yOiAtNTI0Cj4gCj4gRG8gd2UgbmVlZCB0byBibGFja2xpc3QgdGhlIHdob2xlIHRlc3Qg
Z2l2ZW4gaXQgaGFkIGNvdmVyYWdlIG9uIGFybTY0Cj4gYmVmb3JlLi4gcGVyaGFwcyB0aGlzIHRl
c3QgaGVyZSBjb3VsZCBiZSBkb25lIGFzIGEgbmV3IHN1YnRlc3QgYW5kIG9ubHkKPiB0aGF0IG9u
ZSBpcyBsaXN0ZWQgZm9yIGFybTY0PwoKWWVhaCwgSSB0aG91Z2h0IHNvIGF0IGZpcnN0LCBqdXN0
IGxpa2UgZmV4aXRfbWFueV9hcmdzIG9mIGZlbnRyeS9mZXhpdCwgCmJ1dCBJIGZvdW5kIHRoYXQg
dGhlIHRoaW5ncyBzdHJ1Y3RfdHJhY2luZyBkb2VzIGFyZSBhbGwgaW4gdGhlIHNhbWUgCnNlcmll
cywgYnV0IHRoZSBudW1iZXIgb3IgdHlwZSBvZiBwYXJhbWV0ZXJzIGFyZSBkaWZmZXJlbnQsIGFu
ZCB0aGUgbmV3IAp1c2UgY2FzZSBJIGFkZGVkIGlzIHRoZSBzYW1lIGluIHRoaXMgd2F5LiBBbmQg
SSBmb3VuZCB0aGF0IHRoZSBleGVjdXRpb24gCmxvZ2ljIG9mIHN0cmFjdF90cmFjaW5nIGlzIHJl
bGF0aXZlbHkgc2ltcGxlIGFuZCBjbGVhciwgdHJpZ2dlcmluZyBhbGwgCmhvb2sgcG9pbnRzLCBl
eGVjdXRpbmcgYWxsIGJwZiBwcm9ncmFtcywgYW5kIGFzc2VydGluZyBhbGwgcGFyYW1ldGVycy4K
U2hhbGwgd2UgbmVlZCB0byBzbGljZSB0aGVtIHVwPwoKPiAKPj4gwqAgZmlsbF9saW5rX2luZm8v
a3Byb2JlX211bHRpX2xpbmtfaW5mb8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyAKPj4gYnBmX3By
b2dyYW1fX2F0dGFjaF9rcHJvYmVfbXVsdGlfb3B0cyB1bmV4cGVjdGVkIGVycm9yOiAtOTUKPj4g
wqAgZmlsbF9saW5rX2luZm8va3JldHByb2JlX211bHRpX2xpbmtfaW5mb8KgwqDCoMKgwqDCoMKg
wqAgIyAKPj4gYnBmX3Byb2dyYW1fX2F0dGFjaF9rcHJvYmVfbXVsdGlfb3B0cyB1bmV4cGVjdGVk
IGVycm9yOiAtOTUKPj4gwqAgZmlsbF9saW5rX2luZm8va3Byb2JlX211bHRpX2ludmFsaWRfdWJ1
ZmbCoMKgwqDCoMKgwqDCoCAjIAo+PiBicGZfcHJvZ3JhbV9fYXR0YWNoX2twcm9iZV9tdWx0aV9v
cHRzIHVuZXhwZWN0ZWQgZXJyb3I6IC05NQo+IAo+IFRoYW5rcywKPiBEYW5pZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
