Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB05C5321D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 01:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB3of73Vk6ES036XfJaJsB4srihFQv7nO4/rvAALFVA=; b=g3YP28Yd9C2p9h
	aN0qTa1+bjypaNwK/mY1cmF4Loqs7bIPgP4dzKUhGtPnip9UVL45OzQ6KgvTKsnlUUwhUQlH+xT3s
	K1ANYCNA3+FgPg+ewPJVhC21j1PQjfP1HQVsgERrnG58gTbXFMQdfyuke1oCu6qqP5d7aZ2DP7zMJ
	LRhUxK9Uuwi9qozVlEXgEeGkltx8qvJXkd9K8QL1YdVwMPwqBBhi88Yz2CINuWoZJr4MtglpgJXrT
	v8K3s7eE0pkMoB12jQ97NtDnBHoVqPTPbo98biXqqgAiLUy+7pI5zoZ/03cmIx0aay+PVj8ICUQcq
	rwQforP0EM2bEXe/9txQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1silEB-00000009Lwn-1AUJ;
	Tue, 27 Aug 2024 01:42:35 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1silCE-00000009Ljp-1lKR
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 01:42:34 +0000
Received: from [10.213.18.31] (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowABHTvqCLs1mAhy3Cg--.26096S2;
	Tue, 27 Aug 2024 09:40:18 +0800 (CST)
Message-ID: <0157d961-1124-43c8-ac40-53e4986dbbf9@iscas.ac.cn>
Date: Tue, 27 Aug 2024 09:39:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 evan@rivosinc.com, tglx@linutronix.de, andy.chiu@sifive.com,
 cleger@rivosinc.com, ajones@ventanamicro.com, linux-riscv@lists.infradead.org
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
 <20240823-circulate-underarm-13406fd8cc44@spud>
 <18c653d4-e2d5-4886-bbcc-a2c87da7e8e9@iscas.ac.cn>
 <20240826-arousal-sharply-9aeffe1bd89d@wendy>
Content-Language: en-US
From: qiaozhe <qiaozhe@iscas.ac.cn>
In-Reply-To: <20240826-arousal-sharply-9aeffe1bd89d@wendy>
X-CM-TRANSID: rQCowABHTvqCLs1mAhy3Cg--.26096S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW5urWUuFW3ZrWUWF1rZwb_yoW5tr48pF
	W8GFs8CFs0qrsrAwnIq3y8XFnayr1vgFs8Wr1xJ34rtr1qyrnxJw4rtFWruFyrGr18uF10
	vF4jq34a9FWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07bel1PUUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_184034_843165_A3524DCB 
X-CRM114-Status: GOOD (  25.17  )
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

Ck9uIDIwMjQvOC8yNiAxNjoxNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgoKPiBPbiBTYXQsIEF1ZyAy
NCwgMjAyNCBhdCAxMDo0MToyOEFNICswODAwLCBxaWFvemhlIHdyb3RlOgo+Pgo+Pgo+PiBPbiAy
MDI0LzgvMjMgMjA6NTcsIENvbm9yIERvb2xleSB3cm90ZToKPj4KPj4+IE9uIEZyaSwgQXVnIDIz
LCAyMDI0IGF0IDA1OjExOjAwUE0gKzA4MDAsIFpoZSBRaWFvIHdyb3RlOgo+Pj4+IEluIHRoZSBv
Zl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkgZnVuY3Rpb24sIHdoZW4gdGhlIF9fY3B1aWRfdG9faGFy
dGlkX21hcFtdCj4+Pj4gYXJyYXkgcmVjb3JkcyB0aGUgQ1BVIGhhcmR3YXJlIElELCBpZiB0aGUg
c2FtZSBDUFUgaGFyZHdhcmUgYXR0cmlidXRlIGhhcyAKPj4+PiBiZWVuIHJlY29yZGVkLCBhbiBl
cnJvciByZXBvcnQgaXMgaXNzdWVkLCB0aGVyZWJ5IGVuc3VyaW5nIHRoZSB1bmlxdWVuZXNzCj4+
Pj4gb2YgdGhlIENQVSBoYXJkd2FyZSBJRCByZWNvcmRlZCBpbiB0aGUgX19jcHVpZF90b19oYXJ0
aWRfbWFwW10gYXJyYXkuCj4+PiBXaHkgaXMgdGhpcyBhY3R1YWxseSByZXF1aXJlZD8gT24gd2hh
dCBzeXN0ZW0gZGlkIHlvdSBlbmNvdW50ZXIgdGhpcz8KPj4gVGhpcyBpcyBub3QgYWN0dWFsbHkg
YSBwYXRjaCBzdWJtaXR0ZWQgZm9yIHByb2JsZW1zIGVuY291bnRlcmVkIGluIGFjdHVhbMKgCj4+
IGRldmVsb3BtZW50IGVudmlyb25tZW50cywgYnV0IHJhdGhlciBhIGNvbXBhcmlzb24gb2YgQVJN
IGFyY2hpdGVjdHVyZSB3aGVuwqAKPj4gSSB3YXMgbGVhcm5pbmcgTGludXgga2VybmVsIGFuZCBm
b3VuZCBzaW1pbGFyIGp1ZGdtZW50cyBvbiBBUk0gYXJjaGl0ZWN0dXJlLgo+IE9rYXksIGl0J3Mg
Z29vZCB0aGF0IHlvdSBkaWRuJ3QgZmluZCBzdWNoIGEgYmFkIGR0YiAiaW4gdGhlIHdpbGQiIDop
Cj4KPj4gSW4gYWRkaXRpb24sIGlmIHRoZSBzYW1lIGF0dHJpYnV0ZSBleGlzdHMgb24gdGhlIENQ
VSBoYXJkd2FyZSBJRCBhbmQgaXPCoAo+PiByZWNvcmRlZCBpbiBfX2NwdWlkX3RvX2hhcnRpZF9t
YXBbXSwgdGhlIGtlcm5lbCBtYXkgbmVlZCB0byBtYWtlIGEganVkZ21lbnTCoAo+PiBvbiB0aGlz
IGVycm9yLgo+Pgo+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFpoZSBRaWFvIDxxaWFvemhlQGlzY2Fz
LmFjLmNuPgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgfCAxNiAr
KysrKysrKysrKysrKysrCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+
Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc21wYm9vdC5jCj4+Pj4gaW5kZXggMGY4ZjFjOTVhYzM4Li42OThmOWZlNzkx
ZjcgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4+Pj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4+Pj4gQEAgLTExOCw2ICsxMTgsMTYgQEAg
c3RhdGljIHZvaWQgX19pbml0IGFjcGlfcGFyc2VfYW5kX2luaXRfY3B1cyh2b2lkKQo+Pj4+ICAj
ZGVmaW5lIGFjcGlfcGFyc2VfYW5kX2luaXRfY3B1cyguLi4pCWRvIHsgfSB3aGlsZSAoMCkKPj4+
PiAgI2VuZGlmCj4+Pj4gIAo+Pj4+ICtzdGF0aWMgYm9vbCBfX2luaXQgaXNfbXBpZHJfZHVwbGlj
YXRlKHVuc2lnbmVkIGludCBjcHVpZCwgdTY0IGhhcnQpCj4+Pj4gK3sKPj4+PiArCXVuc2lnbmVk
IGludCBpOwo+Pj4+ICsKPj4+PiArCWZvciAoaSA9IDE7IChpIDwgY3B1aWQpICYmIChpIDwgTlJf
Q1BVUyk7IGkrKykKPj4+PiArCQlpZiAoY3B1aWRfdG9faGFydGlkX21hcChpKSA9PSBoYXJ0KQo+
Pj4+ICsJCQlyZXR1cm4gdHJ1ZTsKPj4+PiArCXJldHVybiBmYWxzZTsKPj4+PiArfQo+Pj4+ICsK
Pj4+PiAgc3RhdGljIHZvaWQgX19pbml0IG9mX3BhcnNlX2FuZF9pbml0X2NwdXModm9pZCkKPj4+
PiAgewo+Pj4+ICAJc3RydWN0IGRldmljZV9ub2RlICpkbjsKPj4+PiBAQCAtMTMxLDYgKzE0MSwx
MiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgb2ZfcGFyc2VfYW5kX2luaXRfY3B1cyh2b2lkKQo+Pj4+
ICAJCWlmIChyYyA8IDApCj4+Pj4gIAkJCWNvbnRpbnVlOwo+Pj4+ICAKPj4+PiArCQlpZiAoaXNf
bXBpZHJfZHVwbGljYXRlKGNwdWlkLCBoYXJ0KSkgewo+Pj4+ICsJCQlwcl9lcnIoIiVwT0Y6IGR1
cGxpY2F0ZSBjcHUgcmVnIHByb3BlcnRpZXMgaW4gdGhlIERUXG4iLAo+Pj4+ICsJCQkJZG4pOwo+
Pj4+ICsJCQljb250aW51ZTsKPj4+IFdoeSB3b3VsZCB3ZSBjb250aW51ZSBpbiB0aGlzIGNhc2U/
IElmIHRoZSBkZXZpY2V0cmVlIGlzIHRoaXMgYnJva2VuLAo+Pj4gd2h5IHNob3VsZG4ndCB3ZSBq
dXN0IEJVRygpIGFuZCBhYm9ydCBpbW1lZGlhdGVseT8KPj4gVGhpcyBpcyBiZWNhdXNlIEkgZGlk
IG5vdCBmaW5kIGFueSBqdWRnbWVudCBvbiB0aGlzIGlzc3VlIGluIHRoZSBwcmV2aW91cyBjb2Rl
wqAKPj4gZHVyaW5nIHRoZSBhbmFseXNpcyBwcm9jZXNzLCBzbyBJIGRpZCBub3QgdGFrZSBtb3Jl
IGFnZ3Jlc3NpdmUgbWVhc3VyZXMgaW4gdGhpc8KgCj4+IHJlZ2FyZCwgYnV0IG9ubHkgaXNzdWVk
IGFuIGVycm9yIGFsYXJtLgo+IFdoYXQgZG8geW91IHRoaW5rIHRob3VnaD8gU2hvdWxkIHdlIGNv
bnRpbnVlIHRvIGJvb3QgaW4gdGhpcyBjYXNlPwo+IElmIHlvdSByZWFkIHRoZSBmdW5jdGlvbiBh
IGJpdCBmdXJ0aGVyLCB5b3UnbGwgc2VlIHRoYXQgd2UgYWJvcnQgYm9vdAo+IGlmIHRoZXJlIGFy
ZSB0d28gaW5zdGFuY2VzIG9mIHRoZSBib290IENQVS4gRG8geW91IHRoaW5rIHRoZSBzYW1lIHNo
b3VsZAo+IGJlIGRvbmUgZm9yIGFsbCBDUFVzPwoKClllcywgSSBzYXcgdGhhdCBpZiB0aGVyZSBh
cmUgdHdvIGJvb3QgQ1BVcywgYSBCVUcgd2lsbCBvY2N1ci4gRm9yIGFsbCBDUFVzLMKgCgppZiB0
aGVyZSBhcmUgdHdvIENQVXMgd2l0aCB0aGUgc2FtZSBhdHRyaWJ1dGVzLCBJIHRoaW5rIGEgYnVn
IHNob3VsZCBiZSBnZW5lcmF0ZWTCoAoKZGlyZWN0bHkuIFRoaXMgd2lsbCBhdHRyYWN0IG1vcmUg
YXR0ZW50aW9uIHRoYW4gaXNzdWluZyBmYWxzZSB3YXJuaW5ncywgd2hpbGUgYWxzb8KgCgpyZWR1
Y2luZyB0aGUgZGlmZmljdWx0eSBvZiB0cm91Ymxlc2hvb3RpbmcgcmVsYXRlZCBpc3N1ZXMuCgoK
VGhlc2UgYXJlIHNvbWUgb2YgbXkgb3BpbmlvbnMsIEkgZG9uJ3Qga25vdyBpZiB0aGV5IGFyZSBy
ZWFzb25hYmxlIHRvIGNvbnNpZGVyLsKgCgpXaGF0IGRvIHlvdSB0aGluaz8KCgo+IFRoYW5rcywK
PiBDb25vci4KPgo+Pj4+ICsJCX0KPj4+PiArCj4+Pj4gIAkJaWYgKGhhcnQgPT0gY3B1aWRfdG9f
aGFydGlkX21hcCgwKSkgewo+Pj4+ICAJCQlCVUdfT04oZm91bmRfYm9vdF9jcHUpOwo+Pj4+ICAJ
CQlmb3VuZF9ib290X2NwdSA9IDE7Cj4+Pj4gLS0gCj4+Pj4gMi40My4wCgpUaGFua3MsClpoZQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
