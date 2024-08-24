Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0903EC5321E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 02:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzsFlhs4yw9EzgE16FiEIaU3yQ2qIe7poWUcLYmOEHs=; b=H7LyJ+QX73IPPd
	0LB46IrY0X6CuXeP+/BUHMy8aJfWHucy4C9kCDsrS7IVAeDzfnkUaaRknrKGsfbTjhHB+Cx2UWl+C
	mWGX0NaXUna5FzOggK/0wncCdg+bIfOQNX1zj4qnO7D0e7Nl83AncwKJuRQYuyDrs0aVrTuVmxp7r
	nWkhlwS5juBVUCQ5wa/PaVdJ5vbgP4Fv4Ntk7cAJGsVCDFxCTuFUW7hG6NoBVkt93u8IOa21LkR+a
	i2QXpjvo1S6HVZpmeDlVR2rku4uEOQuCVpNItelcIqmiIJnhBvyFPg1A6aJm6iiwcYPF1RHSOqeiC
	dcXnbWiXsGDsPxIHr0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgij-00000001GV8-1JAL;
	Sat, 24 Aug 2024 02:41:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgif-00000001GUc-3i9Y
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 02:41:40 +0000
Received: from [10.213.18.30] (unknown [210.73.53.31])
	by APP-03 (Coremail) with SMTP id rQCowADHpRhYSMlmp0a9CQ--.52229S2;
	Sat, 24 Aug 2024 10:41:29 +0800 (CST)
Message-ID: <18c653d4-e2d5-4886-bbcc-a2c87da7e8e9@iscas.ac.cn>
Date: Sat, 24 Aug 2024 10:41:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, samuel.holland@sifive.com, evan@rivosinc.com,
 tglx@linutronix.de, andy.chiu@sifive.com, cleger@rivosinc.com,
 ajones@ventanamicro.com, linux-riscv@lists.infradead.org
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
 <20240823-circulate-underarm-13406fd8cc44@spud>
Content-Language: en-US
From: qiaozhe <qiaozhe@iscas.ac.cn>
In-Reply-To: <20240823-circulate-underarm-13406fd8cc44@spud>
X-CM-TRANSID: rQCowADHpRhYSMlmp0a9CQ--.52229S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW8KF18Ar47KF4kZw1UJrb_yoW5GFWUpF
	48Grs8CFs8trs7CwnIq348WryYyr1vgF45KF1ftFyrtF9rCrn7Jws5KayfuFy5tF1ruF4F
	yr4UW34Y9ayDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_194138_314584_0F97187B 
X-CRM114-Status: GOOD (  17.33  )
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

CgoKT24gMjAyNC84LzIzIDIwOjU3LCBDb25vciBEb29sZXkgd3JvdGU6Cgo+IE9uIEZyaSwgQXVn
IDIzLCAyMDI0IGF0IDA1OjExOjAwUE0gKzA4MDAsIFpoZSBRaWFvIHdyb3RlOgo+PiBJbiB0aGUg
b2ZfcGFyc2VfYW5kX2luaXRfY3B1cygpIGZ1bmN0aW9uLCB3aGVuIHRoZSBfX2NwdWlkX3RvX2hh
cnRpZF9tYXBbXQo+PiBhcnJheSByZWNvcmRzIHRoZSBDUFUgaGFyZHdhcmUgSUQsIGlmIHRoZSBz
YW1lIENQVSBoYXJkd2FyZSBhdHRyaWJ1dGUgaGFzIAo+PiBiZWVuIHJlY29yZGVkLCBhbiBlcnJv
ciByZXBvcnQgaXMgaXNzdWVkLCB0aGVyZWJ5IGVuc3VyaW5nIHRoZSB1bmlxdWVuZXNzCj4+IG9m
IHRoZSBDUFUgaGFyZHdhcmUgSUQgcmVjb3JkZWQgaW4gdGhlIF9fY3B1aWRfdG9faGFydGlkX21h
cFtdIGFycmF5Lgo+IFdoeSBpcyB0aGlzIGFjdHVhbGx5IHJlcXVpcmVkPyBPbiB3aGF0IHN5c3Rl
bSBkaWQgeW91IGVuY291bnRlciB0aGlzPwoKVGhpcyBpcyBub3QgYWN0dWFsbHkgYSBwYXRjaCBz
dWJtaXR0ZWQgZm9yIHByb2JsZW1zIGVuY291bnRlcmVkIGluIGFjdHVhbMKgCgpkZXZlbG9wbWVu
dCBlbnZpcm9ubWVudHMsIGJ1dCByYXRoZXIgYSBjb21wYXJpc29uIG9mIEFSTSBhcmNoaXRlY3R1
cmUgd2hlbsKgCgpJIHdhcyBsZWFybmluZyBMaW51eCBrZXJuZWwgYW5kIGZvdW5kIHNpbWlsYXIg
anVkZ21lbnRzIG9uIEFSTSBhcmNoaXRlY3R1cmUuCgoKSW4gYWRkaXRpb24sIGlmIHRoZSBzYW1l
IGF0dHJpYnV0ZSBleGlzdHMgb24gdGhlIENQVSBoYXJkd2FyZSBJRCBhbmQgaXPCoAoKcmVjb3Jk
ZWQgaW4gX19jcHVpZF90b19oYXJ0aWRfbWFwW10sIHRoZSBrZXJuZWwgbWF5IG5lZWQgdG8gbWFr
ZSBhIGp1ZGdtZW50wqAKCm9uIHRoaXMgZXJyb3IuCgoKPj4gU2lnbmVkLW9mZi1ieTogWmhlIFFp
YW8gPHFpYW96aGVAaXNjYXMuYWMuY24+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc21w
Ym9vdC5jIHwgMTYgKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+PiBpbmRleCAwZjhmMWM5NWFjMzguLjY5OGY5
ZmU3OTFmNyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+PiBAQCAtMTE4LDYgKzExOCwxNiBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgYWNwaV9wYXJzZV9hbmRfaW5pdF9jcHVzKHZvaWQpCj4+ICAjZGVm
aW5lIGFjcGlfcGFyc2VfYW5kX2luaXRfY3B1cyguLi4pCWRvIHsgfSB3aGlsZSAoMCkKPj4gICNl
bmRpZgo+PiAgCj4+ICtzdGF0aWMgYm9vbCBfX2luaXQgaXNfbXBpZHJfZHVwbGljYXRlKHVuc2ln
bmVkIGludCBjcHVpZCwgdTY0IGhhcnQpCj4+ICt7Cj4+ICsJdW5zaWduZWQgaW50IGk7Cj4+ICsK
Pj4gKwlmb3IgKGkgPSAxOyAoaSA8IGNwdWlkKSAmJiAoaSA8IE5SX0NQVVMpOyBpKyspCj4+ICsJ
CWlmIChjcHVpZF90b19oYXJ0aWRfbWFwKGkpID09IGhhcnQpCj4+ICsJCQlyZXR1cm4gdHJ1ZTsK
Pj4gKwlyZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyB2b2lkIF9faW5pdCBvZl9w
YXJzZV9hbmRfaW5pdF9jcHVzKHZvaWQpCj4+ICB7Cj4+ICAJc3RydWN0IGRldmljZV9ub2RlICpk
bjsKPj4gQEAgLTEzMSw2ICsxNDEsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IG9mX3BhcnNlX2Fu
ZF9pbml0X2NwdXModm9pZCkKPj4gIAkJaWYgKHJjIDwgMCkKPj4gIAkJCWNvbnRpbnVlOwo+PiAg
Cj4+ICsJCWlmIChpc19tcGlkcl9kdXBsaWNhdGUoY3B1aWQsIGhhcnQpKSB7Cj4+ICsJCQlwcl9l
cnIoIiVwT0Y6IGR1cGxpY2F0ZSBjcHUgcmVnIHByb3BlcnRpZXMgaW4gdGhlIERUXG4iLAo+PiAr
CQkJCWRuKTsKPj4gKwkJCWNvbnRpbnVlOwo+IFdoeSB3b3VsZCB3ZSBjb250aW51ZSBpbiB0aGlz
IGNhc2U/IElmIHRoZSBkZXZpY2V0cmVlIGlzIHRoaXMgYnJva2VuLAo+IHdoeSBzaG91bGRuJ3Qg
d2UganVzdCBCVUcoKSBhbmQgYWJvcnQgaW1tZWRpYXRlbHk/CgpUaGlzIGlzIGJlY2F1c2UgSSBk
aWQgbm90IGZpbmQgYW55IGp1ZGdtZW50IG9uIHRoaXMgaXNzdWUgaW4gdGhlIHByZXZpb3VzIGNv
ZGXCoAoKZHVyaW5nIHRoZSBhbmFseXNpcyBwcm9jZXNzLCBzbyBJIGRpZCBub3QgdGFrZSBtb3Jl
IGFnZ3Jlc3NpdmUgbWVhc3VyZXMgaW4gdGhpc8KgCgpyZWdhcmQsIGJ1dCBvbmx5IGlzc3VlZCBh
biBlcnJvciBhbGFybS4KCj4+ICsJCX0KPj4gKwo+PiAgCQlpZiAoaGFydCA9PSBjcHVpZF90b19o
YXJ0aWRfbWFwKDApKSB7Cj4+ICAJCQlCVUdfT04oZm91bmRfYm9vdF9jcHUpOwo+PiAgCQkJZm91
bmRfYm9vdF9jcHUgPSAxOwo+PiAtLSAKPj4gMi40My4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKClRoYW5rcwoKWmhlCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
