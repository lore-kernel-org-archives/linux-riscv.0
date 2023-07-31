Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA49EC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 10:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RU5UvI3O3MwZmo4XoetMKmqvbMjfghB8yxOAgGw6e4=; b=Kdzmka9GVKqO88
	YeN29ib1qbyGhZvOjo3hnc2JM9c9+newEcYr2hGe5rqH7dFSHB/jpzwpmNP6f9zScLwx8lTMa3hS5
	yIYuwaNgfBsyfRos0lTBvorh9a0w4n8gWC1Kw8BRPIoOuStIW3YPAHwzWXucWlRexfHWP07CNs1i+
	Nc63U7C6/j/wjzFmkGUImG9bMfdkr8xDuH8+hX/03bRQi+YWD9ycmbLrjL/FgXLL7SL30exOfgPXQ
	As8lwacjEUJWqt8PnMCaQiDlSfvlvdW0WjlTtSwNqI+hjc7A6NNIKUdu1XCR8ircmoQJuqSbqr+u6
	E8KX5KyNAbDhtTrAzogQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPxU-00EyfB-0K;
	Mon, 31 Jul 2023 10:17:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPxQ-00Eye6-01
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 10:16:58 +0000
Received: from [192.168.0.107] (unknown [111.197.209.91])
	by APP-03 (Coremail) with SMTP id rQCowACHj8fxicdkWHydDw--.11897S2;
	Mon, 31 Jul 2023 18:16:17 +0800 (CST)
Message-ID: <572ad471-8a0b-95e2-1112-c55f42e5594b@iscas.ac.cn>
Date: Mon, 31 Jul 2023 18:16:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Bin Meng <bmeng@tinylab.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org,
 Guo Ren <guoren@kernel.org>
References: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>
 <20230726-outclass-parade-2ccea9f6688a@spud>
 <10231b81-ea42-26d0-4c11-92851229e658@iscas.ac.cn>
 <20230726-armchair-evasive-427dd245a9fe@spud>
 <20230727-briskness-sappy-e2d9e4c1ef36@spud>
 <d75ef570-c0ad-cea4-687a-d02b560aa676@iscas.ac.cn>
 <20230729-chaps-coauthor-95557d86b189@spud>
Content-Language: en-US
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Organization: ISCAS
In-Reply-To: <20230729-chaps-coauthor-95557d86b189@spud>
X-CM-TRANSID: rQCowACHj8fxicdkWHydDw--.11897S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr45Gw18tryDtw17KFyDKFg_yoW8Zw43pF
	4kCFyDGry5Xw1xGw4xJ34UWry0yr4rJay5Jr45W3WUAryUAFy0grykXw1Ygr1DArs5tw10
	vr1093WDZwn8JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU56c_DUUUUU==
X-Originating-IP: [111.197.209.91]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiCQkJCmTHZrJ09wAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_031656_414149_9042E4A5 
X-CRM114-Status: GOOD (  17.92  )
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

T24gNy8zMC8yMyAwMTo0OCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIFN1biwgSnVsIDMwLCAy
MDIzIGF0IDAxOjM2OjQ5QU0gKzA4MDAsIE1pbmd6aGVuZyBYaW5nIHdyb3RlOgo+Cj4+IEkgcmVw
cm9kdWNlZCB0aGUgZXJyb3Igd2l0aCBnY2MtMTIuMi4wIGFuZCBiaW51dGlscy0yLjM1LiBJIHRy
aWVkIGEKPj4gZGlmZmVyZW50IHNvbHV0aW9uLCB3aGljaCBJIHRoaW5rIG1ha2VzIHRoZSBsb2dp
YyBlYXNpZXIuIFNob3dpbmcKPj4gdGhlIG5ldyBwYXRjaCBjb2RlOgo+IEl0IGlzIGluZGVlZCBz
aW1wbGVyLCBuZWF0Lgo+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gaW5kZXggNGMwN2I5MTg5Yzg2Li5hNmZhMWVlZDg5NWMgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
Pj4gQEAgLTU2OSwyNSArNTY5LDI0IEBAIGNvbmZpZyBUT09MQ0hBSU5fSEFTX1pJSElOVFBBVVNF
Cj4+Cj4+ICDCoGNvbmZpZyBUT09MQ0hBSU5fTkVFRFNfRVhQTElDSVRfWklDU1JfWklGRU5DRUkK
Pj4gIMKgwqDCoMKgwqDCoMKgIGRlZl9ib29sIHkKPj4gLcKgwqDCoMKgwqDCoCAjIGh0dHBzOi8v
c291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1jb21taXQ7aD1hZWQ0NDI4
NmVmYThhZTg3MTdhNzdkOTRiNTFhYzM2MTRlMmNhNmRjCj4+IC3CoMKgwqDCoMKgwqAgZGVwZW5k
cyBvbiBBU19JU19HTlUgJiYgQVNfVkVSU0lPTiA+PSAyMzgwMAo+PiArwqDCoMKgwqDCoMKgIGRl
cGVuZHMgb24gQVNfSVNfR05VICYmIEFTX1ZFUlNJT04gPj0gMjM2MDAKPj4gIMKgwqDCoMKgwqDC
oMKgIGhlbHAKPj4gLcKgwqDCoMKgwqDCoMKgwqAgTmV3ZXIgYmludXRpbHMgdmVyc2lvbnMgZGVm
YXVsdCB0byBJU0Egc3BlYyB2ZXJzaW9uIDIwMTkxMjEzIHdoaWNoCj4+IC3CoMKgwqDCoMKgwqDC
oMKgIG1vdmVzIHNvbWUgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIEkgZXh0ZW5zaW9uIHRvIHRoZSBa
aWNzciBhbmQgWmlmZW5jZWkKPj4gLcKgwqDCoMKgwqDCoMKgwqAgZXh0ZW5zaW9ucy4KPj4gK8Kg
wqDCoMKgwqDCoMKgwqAgQmludXRpbHMgaGFzIHN1cHBvcnRlZCB6aWNzciBhbmQgemlmZW5jZWkg
ZXh0ZW5zaW9ucyBzaW5jZSB2ZXJzaW9uIDIuMzYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgIHRyeSB0
byBhZGFwdCB0byB0aGUgY2hhbmdlcyBieSB1c2luZyBleHBsaWNpdCB6aWNzciBhbmQgemlmZW5j
ZWkgdmlhCj4+ICvCoMKgwqDCoMKgwqDCoMKgIC1tYXJjaC4KPiBUaGlzIHNlbnRlbmNlIG5vIGxv
bmdlciBtYWtlcyBzZW5zZSB0byBtZSwgdGhlIG1vdGl2YXRpb24gZm9yIHdoeSB3ZSBhcmUKPiBk
b2luZyB0aGlzIGlzIGxvc3QuIFBsZWFzZSBwcmVzZXJ2ZSB0aGUgbGluayAmIGV4cGxhbmF0aW9u
IGFib3V0IHRoZQo+IDIwMTkxMjEzIHZlcnNpb24gb2YgdGhlIHNwZWMsIGFkZGluZyB0byBpdCB0
aGUgY29tbWVudGFyeSBhYm91dCBob3cgd2UKPiBjYW4gcmVsYXggdGhlIGNoZWNrIHRvIDIuMzYs
IHNpbmNlIHRoYXQgbWFrZXMgb3VyIGxpdmVzIGVhc2llci4KPgo+IFRoZSByZXN0IG9mIHRoaXMg
bG9va3MgZmluZSB0byBtZSwgaWYgeW91IHJlc3VibWl0IEknbGwgbG9vayBhdCBpdAo+IGZ1cnRo
ZXIgb24gTW9uZGF5LgoKSSB1cGRhdGVkIGl0IGluIHYzIFsxXS4gVGhhbmtzIGZvciB5b3VyIHJl
dmlldy4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MzEwOTU5MzYuMjMz
OTctMS14aW5nbWluZ3poZW5nQGlzY2FzLmFjLmNuCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
