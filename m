Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07676C5321D
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rr9KxXffUu/yMeWNCPTntiswd+aucEH/R/pwjEF3sI=; b=XX5w5O8XL4nAWR
	YoIUckSxpILslhJz/N+STMkZvuyIDascRd+MQDAiQs23C/VRw7x+cS5ph2C2z/PMHh12gac84FocS
	v8ZbeAeJUcpMWgJizxWbxpUEdCvLmMt7/ID/fxALOBeuZ1th4HCj9pEVeo7r1oKkbDQNKqKcH/g1l
	grpPmxLTqKYh0enfA1rtpO78cOGnz8CFi+CIUNz1EuABS9kPIexUkXcq2DeWYXyOzsVA7UFG7e7xy
	BXIeuN8koguo9FRd0GvIRSw6r4cHPvXBJAFWEzCLcQrBcarlH61oA6YpsaNQFVzMYrOFqV6Jk8LrI
	+anGxGW3OjjeB00SWgvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgEV-00000001DQd-13J5;
	Sat, 24 Aug 2024 02:10:27 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgER-00000001DPV-0qst
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 02:10:25 +0000
Received: from [10.213.18.30] (unknown [210.73.53.31])
	by APP-01 (Coremail) with SMTP id qwCowACHb8AFQclmCgXbCQ--.49486S2;
	Sat, 24 Aug 2024 10:10:14 +0800 (CST)
Message-ID: <59482b29-3335-4c54-a0b8-1a86a5b91289@iscas.ac.cn>
Date: Sat, 24 Aug 2024 10:10:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
To: Anup Patel <apatel@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, samuel.holland@sifive.com, evan@rivosinc.com,
 tglx@linutronix.de, andy.chiu@sifive.com, cleger@rivosinc.com,
 ajones@ventanamicro.com, linux-riscv@lists.infradead.org
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
 <CAK9=C2XXkZTEsfLPGjDeT-jrYt7f8VN6Pxqo4OCjnpmJ+Mr9ZA@mail.gmail.com>
Content-Language: en-US
From: qiaozhe <qiaozhe@iscas.ac.cn>
In-Reply-To: <CAK9=C2XXkZTEsfLPGjDeT-jrYt7f8VN6Pxqo4OCjnpmJ+Mr9ZA@mail.gmail.com>
X-CM-TRANSID: qwCowACHb8AFQclmCgXbCQ--.49486S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AryUCr4UWr1fWF15tw18Xwb_yoW8tr45pr
	W8GFs8CrZ8JFnrCasIqw48WF1ayr1vgrs3tr1fta4rJF9rurn7J398Ka45uF15tF1ruF4F
	vF4UCryj9w1DAFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07j86p9UUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_191023_634678_1D016F84 
X-CRM114-Status: GOOD (  14.03  )
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

CgoKT24gMjAyNC84LzIzIDE4OjA4LCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDIz
LCAyMDI0IGF0IDI6NDTigK9QTSBaaGUgUWlhbyA8cWlhb3poZUBpc2Nhcy5hYy5jbj4gd3JvdGU6
Cj4+IEluIHRoZSBvZl9wYXJzZV9hbmRfaW5pdF9jcHVzKCkgZnVuY3Rpb24sIHdoZW4gdGhlIF9f
Y3B1aWRfdG9faGFydGlkX21hcFtdCj4+IGFycmF5IHJlY29yZHMgdGhlIENQVSBoYXJkd2FyZSBJ
RCwgaWYgdGhlIHNhbWUgQ1BVIGhhcmR3YXJlIGF0dHJpYnV0ZSBoYXMKPj4gYmVlbiByZWNvcmRl
ZCwgYW4gZXJyb3IgcmVwb3J0IGlzIGlzc3VlZCwgdGhlcmVieSBlbnN1cmluZyB0aGUgdW5pcXVl
bmVzcwo+PiBvZiB0aGUgQ1BVIGhhcmR3YXJlIElEIHJlY29yZGVkIGluIHRoZSBfX2NwdWlkX3Rv
X2hhcnRpZF9tYXBbXSBhcnJheS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWmhlIFFpYW8gPHFpYW96
aGVAaXNjYXMuYWMuY24+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIHwg
MTYgKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3NtcGJvb3QuYwo+PiBpbmRleCAwZjhmMWM5NWFjMzguLjY5OGY5ZmU3OTFmNyAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+PiBAQCAtMTE4LDYgKzExOCwxNiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgYWNwaV9wYXJzZV9hbmRfaW5pdF9jcHVzKHZvaWQpCj4+ICAjZGVmaW5lIGFjcGlf
cGFyc2VfYW5kX2luaXRfY3B1cyguLi4pICBkbyB7IH0gd2hpbGUgKDApCj4+ICAjZW5kaWYKPj4K
Pj4gK3N0YXRpYyBib29sIF9faW5pdCBpc19tcGlkcl9kdXBsaWNhdGUodW5zaWduZWQgaW50IGNw
dWlkLCB1NjQgaGFydCkKPiBUaGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIG1waWRyIGluIHRoZSBS
SVNDLVYgd29ybGQuCj4KPiBzL21waWRyL2hhcnRpZC8KCgpJJ20gdmVyeSBzb3JyeSwgSSBkaWRu
J3Qgbm90aWNlIHRoYXQgdXNpbmcgbXBpZHIgb24gZnVuY3Rpb24gbmFtZXMgaXMgaW5jb3JyZWN0
CgppbiB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZS4gVGhpcyBpcyBiZWNhdXNlIEkgcmVmZXJyZWQg
dG8gdGhlIHByb2Nlc3NpbmcgbWV0aG9kcwoKb24gdGhlIEFSTTY0IGFyY2hpdGVjdHVyZSwgc28g
SSBkaWQgbm90IG1vZGlmeSB0aGUgZnVuY3Rpb24gbmFtZSBuYW1pbmcuCgpUaGFua3MgZm9yIHlv
dXIgcmVtaW5kZXIuCgo+PiArewo+PiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiArCj4+ICsg
ICAgICAgZm9yIChpID0gMTsgKGkgPCBjcHVpZCkgJiYgKGkgPCBOUl9DUFVTKTsgaSsrKQo+PiAr
ICAgICAgICAgICAgICAgaWYgKGNwdWlkX3RvX2hhcnRpZF9tYXAoaSkgPT0gaGFydCkKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4+ICsgICAgICAgcmV0dXJuIGZhbHNl
Owo+PiArfQo+PiArCj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgb2ZfcGFyc2VfYW5kX2luaXRfY3B1
cyh2b2lkKQo+PiAgewo+PiAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZG47Cj4+IEBAIC0x
MzEsNiArMTQxLDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBvZl9wYXJzZV9hbmRfaW5pdF9jcHVz
KHZvaWQpCj4+ICAgICAgICAgICAgICAgICBpZiAocmMgPCAwKQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPj4KPj4gKyAgICAgICAgICAgICAgIGlmIChpc19tcGlkcl9kdXBs
aWNhdGUoY3B1aWQsIGhhcnQpKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2Vycigi
JXBPRjogZHVwbGljYXRlIGNwdSByZWcgcHJvcGVydGllcyBpbiB0aGUgRFRcbiIsCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZG4pOwo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiAgICAgICAgICAgICAgICAg
aWYgKGhhcnQgPT0gY3B1aWRfdG9faGFydGlkX21hcCgwKSkgewo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICBCVUdfT04oZm91bmRfYm9vdF9jcHUpOwo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICBmb3VuZF9ib290X2NwdSA9IDE7Cj4+IC0tCj4+IDIuNDMuMAo+Pgo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gUmVnYXJkcywK
PiBBbnVwCgoKVGhhbmtzClpoZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
