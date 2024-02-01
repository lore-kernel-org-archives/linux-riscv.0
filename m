Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38ADC47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 12:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYbrOtwOdXcLa7TUZSUQb4Qt9nKYLPS/dyDsOG8pNyk=; b=Aq/NdjV9IdTptl
	Z96+7w6bvK53IC+f38c8MRzh8a72ohqhOUWl+tXpboRWYmMzSbYVJuCxqTSFIJugqOZ4JLW867hdy
	EbOxi3Xm7qCVEoE5zSV7xoPziASKcvKIBEagGTvDQMbTv6cTfpYm6ho0Pql8Ormdzytm2ummTdVKJ
	Wfjv3vB3L7IIbwedP0Ks4CuHTg75BVzWuFP0zW7aFuzhiBobs/EO6r8URK2ttxNnid0x6ZQGf5zPm
	C1l73W1hs6LeY9VN/pAODgw//V77l+7JmAAP4pRZiVHNqaUugGXQIqXXhlSsTw1KZD4Qhd8QIkHxf
	WbWz/W/ZN6dNSKwd5S8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVto-00000007hO8-2MEq;
	Thu, 01 Feb 2024 12:10:32 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVtk-00000007hM3-3KiX
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 12:10:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4TQd5G5THmz4f3jsD
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 20:10:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id F40131A0199
	for <linux-riscv@lists.infradead.org>; Thu,  1 Feb 2024 20:10:14 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgBHBp4lirtlK9FmCg--.10909S2;
	Thu, 01 Feb 2024 20:10:14 +0800 (CST)
Message-ID: <93209b12-9117-484a-908a-5b138fa2ffb0@huaweicloud.com>
Date: Thu, 1 Feb 2024 20:10:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240130040958.230673-1-pulehui@huaweicloud.com>
 <20240130040958.230673-5-pulehui@huaweicloud.com>
 <87sf2eohj2.fsf@all.your.base.are.belong.to.us>
 <fab22b9e-7b56-4fef-ba92-bf62ec43007d@huaweicloud.com>
 <878r44mr4g.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <878r44mr4g.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: _Ch0CgBHBp4lirtlK9FmCg--.10909S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr18ZF1rKFy8JF17JFyUGFg_yoW8Gr17p3
	ykKa4ayay8Jr45CrnFgF1vqF9Iyrn5tFn8Jrn3Ga1fCrWqgFykGa1Utayj9F98Awn5Jr48
	Xr1qqan3GayYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UZ18PUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_041029_204790_3965EB7B 
X-CRM114-Status: UNSURE (   8.83  )
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

CgpPbiAyMDI0LzIvMSAxODoxMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4+PiBAQCAtMjUyLDEwICsyMjAsNyBA
QCBzdGF0aWMgdm9pZCBfX2J1aWxkX2VwaWxvZ3VlKGJvb2wgaXNfdGFpbF9jYWxsLCBzdHJ1Y3Qg
cnZfaml0X2NvbnRleHQgKmN0eCkKPj4+PiAgICAJCWVtaXRfbGQoUlZfUkVHX1M1LCBzdG9yZV9v
ZmZzZXQsIFJWX1JFR19TUCwgY3R4KTsKPj4+PiAgICAJCXN0b3JlX29mZnNldCAtPSA4Owo+Pj4+
ICAgIAl9Cj4+Pj4gLQlpZiAoc2Vlbl9yZWcoUlZfUkVHX1M2LCBjdHgpKSB7Cj4+Pj4gLQkJZW1p
dF9sZChSVl9SRUdfUzYsIHN0b3JlX29mZnNldCwgUlZfUkVHX1NQLCBjdHgpOwo+Pj4+IC0JCXN0
b3JlX29mZnNldCAtPSA4Owo+Pj4+IC0JfQo+Pj4+ICsJZW1pdF9sZChSVl9SRUdfVENDLCBzdG9y
ZV9vZmZzZXQsIFJWX1JFR19TUCwgY3R4KTsKPj4+Cj4+PiBXaHkgZG8geW91IG5lZWQgdG8gcmVz
dG9yZSBSVl9SRUdfVENDPyBXZSdyZSBwYXNzaW5nIFJWX1JFR19UQ0MgKGE2KSBhcwo+Pj4gYW4g
YXJndW1lbnQgYXQgYWxsIGNhbGwtc2l0ZXMsIGFuZCBmb3IgdGFpbGNhbGxzIHdlJ3JlIGxvYWRp
bmcgZnJvbSB0aGUKPj4+IHN0YWNrLgo+Pj4KPj4+IElzIHRoaXMgdG8gZmFrZSB0aGUgYTYgYXJn
dW1lbnQgZm9yIHRoZSB0YWlsLWNhbGw/IElmIHNvLCBpdCdzIGJldHRlciB0bwo+Pj4gbW92ZSBp
dCB0byBlbWl0X2JwZl90YWlsX2NhbGwoKSwgaW5zdGVhZCBvZiBsZXR0aW5nIGFsbCBwcm9ncmFt
cyBwYXkgZm9yCj4+PiBpdC4KPj4KPj4gWWVzLCB3ZSBjYW4gcmVtb3ZlIHRoaXMgZHVwbGljYXRl
IGxvYWQuIHdpbGwgZG8gdGhhdCBhdCBuZXh0IHZlcnNpb24uCj4gCj4gSG1tLCBubyByZW1vdmUs
IGJ1dCAqbW92ZSogcmlnaHQ/IE90aGVyd2lzZSBhNiBjYW4gY29udGFpbiBnYXJnYWJlIG9uCj4g
ZW50ZXJpbmcgdGhlIHRhaWxjYWxsPwo+IAo+IE1vdmUgaXQgYmVmb3JlIF9fZW1pdF9lcGlsb2d1
ZSgpIGluIHRoZSB0YWlsY2FsbCwgbm8/Cj4gCgpJSVVDLCB3ZSBkb24ndCBuZWVkIHRvIGxvYWQg
aXQgYWdhaW4uIEluIGVtaXRfYnBmX3RhaWxfY2FsbCBmdW5jdGlvbiwgd2UgCmxvYWQgVENDIGZy
b20gc3RhY2sgdG8gQTYsIEE2LS0sIHRoZW4gc3RvcmUgQTYgYmFjayB0byBzdGFjay4gVGhlbiAK
dW53aW5kIHRoZSBjdXJyZW50IHN0YWNrIGFuZCBqdW1wIHRvIHRhcmdldCBicGYgcHJvZywgZHVy
aW5nIHRoaXMgCnBlcmlvZCwgd2UgZGlkIG5vdCB0b3VjaCB0aGUgQTYgcmVnaXN0ZXIsIGRvIHdl
IHN0aWxsIG5lZWQgdG8gbG9hZCBpdCBhZ2Fpbj8KCj4gCj4gQmrDtnJuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
