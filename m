Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9371DCDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUBIyGSCgQ6j47D+vEkYiIdTRK9AEpyQb/r0vMCg1Jg=; b=TUQkg4JROMi0JC
	4RWvB55bi72qs2/OhPBX7lZr80jnCtL4zgoNbym/7eeIVbbNsoQqUQIsoeUkPz+V11WoLA14OdNgJ
	ZT8IYCu+q+5F4cR+FZwhqOkEltotlUt2BDG/aJMib3c63D1pEP3nG6600/PTpbj/PBfKe8E+Azxs3
	D770HUjH6YDT6KmdxxP8CnNp6MbGicOYusd+6jLD7/OBqJjzXLCi73hiVRkttgF1Eb2rutNsChaT+
	tBynXIwbdIg3YTgTDlXTFxziKU7w2S7qIs9++bcgVMXGdUWdi2F0XpzNuiwhwAkMY1413pqt3lwpR
	Xl1zzSHMV85ZvYGMtDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbqX-00000004pP4-09vW;
	Mon, 22 Jun 2026 10:25:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbqT-00000004pNz-24KA
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 10:25:40 +0000
Received: from [192.168.0.105] (unknown [123.118.218.239])
	by APP-05 (Coremail) with SMTP id zQCowAA3nN+JDTlqtLaqFA--.57426S2;
	Mon, 22 Jun 2026 18:25:14 +0800 (CST)
Message-ID: <2f32370b-63c1-4e8a-bf71-d40874b6bebb@iscas.ac.cn>
Date: Mon, 22 Jun 2026 18:25:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
To: Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>
Cc: Kees Cook <kees@kernel.org>, arnd@arndb.de, palmer@rivosinc.com,
 tglx@linutronix.de, luto@kernel.org, conor.dooley@microchip.com,
 heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
 falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
 palmer@dabbelt.com, bjorn@rivosinc.com, daniel.thompson@linaro.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, stable@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20230702025708.784106-1-guoren@kernel.org>
 <202606191652.38297DE51@keescook> <ajeKPpg2rwadVPY4@gmail.com>
 <20260622082841.GW49951@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260622082841.GW49951@noisy.programming.kicks-ass.net>
X-CM-TRANSID: zQCowAA3nN+JDTlqtLaqFA--.57426S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4ktFy3KFW7Cw4fCrykZrb_yoW5CFWkpF
	W3Kay2kF4kJryxZwsrKw40vF9Yka4SqF4rCr45tryrJw4avr1SgFs7trW3KFWDZrW8Wr12
	vFy0q3srua4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUvaZXDUUUU
X-Originating-IP: [123.118.218.239]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_032537_898860_512BFB0E 
X-CRM114-Status: GOOD (  19.79  )
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

T24gNi8yMi8yNiAxNjoyOCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gU3VuLCBKdW4gMjEs
IDIwMjYgYXQgMDI6NTI6NDZBTSAtMDQwMCwgR3VvIFJlbiB3cm90ZToKPj4gT24gRnJpLCBKdW4g
MTksIDIwMjYgYXQgMDQ6NTQ6NTNQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3RlOgo+Pj4gKnRocmVh
ZCBlbmNyb21hbmN5Kgo+Pj4KPj4+IE9uIFNhdCwgSnVsIDAxLCAyMDIzIGF0IDEwOjU3OjA3UE0g
LTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPj4+Pgo+Pj4+IFRoZSBpcnFlbnRyeV9ubWlfZW50ZXIvZXhp
dCB3b3VsZCBmb3JjZSB0aGUgY3VycmVudCBjb250ZXh0IGludG8gaW5faW50ZXJydXB0Lgo+Pj4+
IFRoYXQgd291bGQgdHJpZ2dlciB0aGUga2VybmVsIHRvIGRlYWQgcGFuaWMsIGJ1dCB0aGUga2Ri
IHN0aWxsIG5lZWRzICJlYnJlYWsiIHRvCj4+Pj4gZGVidWcgdGhlIGtlcm5lbC4KPj4+Pgo+Pj4+
IE1vdmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQgdG8gZXhjZXB0aW9uX2VudGVyL2V4aXQgY291
bGQgY29ycmVjdCBoYW5kbGVfYnJlYWsKPj4+PiBvZiB0aGUga2VybmVsIHNpZGUuCj4+Pj4KPj4+
PiBCZWZvcmUgdGhlIGZpeHVwOgo+Pj4+ICRlY2hvIEJVRyA+IC9zeXMva2VybmVsL2RlYnVnL3By
b3Zva2UtY3Jhc2gvRElSRUNUCj4+Pj4gICBsa2R0bTogUGVyZm9ybWluZyBkaXJlY3QgZW50cnkg
QlVHCj4+Pj4gICAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+PiAgIGtl
cm5lbCBCVUcgYXQgZHJpdmVycy9taXNjL2xrZHRtL2J1Z3MuYzo3OCEKPj4+PiBbLi4uXQo+Pj4+
ICAgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEFpZWUsIGtpbGxpbmcgaW50ZXJydXB0IGhh
bmRsZXIhCj4+PiBUaGlzIGFwcGVhcnMgdG8gc3RpbGwgYmUgdW5maXhlZC4gV2hhdCdzIHRoZSBi
bG9ja2VyPyBUaGUgc29sdXRpb25zIGluCj4+PiB0aGlzIHRocmVhZCBzZWVtIHRvIHdvcmsuLi4K
Pj4+Cj4+PiBJJ2QgbGlrZSB0byBiZSBleGVyY2lzaW5nIGFuIE9vcHMgcGF0aCB2aWEgS1VuaXQg
KGZvciBLQ0ZJKSwgYW5kIHJpc2N2Cj4+PiBqdXN0IGluc3RhbnRseSBmYWxscyBvdmVyIGluc3Rl
YWQgb2YgdGhyZWFkLWtpbGxpbmcgb24gdGhlIGV4Y2VwdGlvbi4KPj4gVGhhbmtzIGZvciByZXZp
dmluZyB0aGlzIHRocmVhZC4gQXQgdGhlIHRpbWUgSSBkaWRu4oCZdCBmdWxseSB1bmRlcnN0YW5k
Cj4+IFBldGVy4oCZcyBwb2ludC4gV2Ugc2hvdWxkIG9ubHkgdXNlIHRoZSBOTUkgcGF0aCB3aGVu
IHRoZSB0cmFwIG9jY3VycyB3aXRoCj4+IGludGVycnVwdHMgZGlzYWJsZWQuCj4+IEhlcmXigJlz
IHRoZSB1cGRhdGVkIGZpeDoKPj4KPj4gIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4+IC4uLiAKPj4gIAkJaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4+ICAJ
fSBlbHNlIHsKPj4gLQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRl
cihyZWdzKTsKPj4gKwkJaWYgKHJlZ3MtPnN0YXR1cyAmIFNSX0lFKSB7Cj4+ICsJCQllbnVtIGN0
eF9zdGF0ZSBwcmV2X3N0YXRlID0gZXhjZXB0aW9uX2VudGVyKCk7Cj4+ICAKPj4gLQkJaGFuZGxl
X2JyZWFrKHJlZ3MpOwo+PiArCQkJaGFuZGxlX2JyZWFrKHJlZ3MpOwo+PiAgCj4+IC0JCWlycWVu
dHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKPj4gKwkJCWV4Y2VwdGlvbl9leGl0KHByZXZfc3Rh
dGUpOwo+PiArCQl9IGVsc2Ugewo+PiArCQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVu
dHJ5X25taV9lbnRlcihyZWdzKTsKPj4gKwo+PiArCQkJaGFuZGxlX2JyZWFrKHJlZ3MpOwo+PiAr
Cj4+ICsJCQlpcnFlbnRyeV9ubWlfZXhpdChyZWdzLCBzdGF0ZSk7Cj4+ICsJCX0KPj4gIAl9Cj4+
ICB9Cj4+Cj4+IElmIHlvdSAmIFBldGVyIGhhdmUgbm8gb2JqZWN0aW9uLCBJ4oCZbGwgcG9zdCBh
IHYyLgo+IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBpdC4gVGhpcyBjYW5ub3QgZml4IGFueXRo
aW5nLiBDb25zaWRlcjoKPgo+ICBFQlJFQUsKPiAgcmF3X3NwaW5fbG9ja19pcnEoJnlvdXJfbG9j
aykKPiAgRUJSRUFLCj4KPiBTbyBub3cgdGhlIGZpcnN0ICd3b3JrcycsIGJ1dCB0aGUgc2Vjb25k
IHdpbGwgY3Jhc2guIEFkZGl0aW9uYWxseSwKPiBoYXZpbmcgdGhlIEVCUkVBSyBjb250ZXh0IGRp
ZmZlciBzbyBkcmFtYXRpY2FsbHkgYmV0d2VlbiBpbnZvY2F0aW9ucwo+IHNlZW1zIGxpa2UgYSB2
ZXJ5IGJhZCBkZWFsIHRvIG1lLgoKVG8gc3BlbGwgaXQgb3V0LCB0aGUgcHJvYmxlbSB0aGF0IG5l
ZWRzIGZpeGluZyBpczoKCi0+IEJVRygpCiAgIC0+IGVicmVhayBpbnN0cnVjdGlvbgogICAgICAt
PiBCcmVha3BvaW50IGV4Y2VwdGlvbgogICAgICAgICAtPiBkb190cmFwX2JyZWFrKCkKICAgICAg
ICAgICAgLT4gaXJxZW50cnlfbm1pX2VudGVyKCkKICAgICAgICAgICAgWyBub3cgaW5fbm1pKCkg
LyBpbl9pbnRlcnJ1cHQoKSBdCiAgICAgICAgICAgIC0+IHJlcG9ydF9idWcoKSByZXR1cm5zIEJV
R19UUkFQX1RZUEVfQlVHCiAgICAgICAgICAgIC0+IGRpZSgpCiAgICAgICAgICAgICAgIC0+IG1h
a2VfdGFza19kZWFkKCkKICAgICAgICAgICAgICAgICAgLT4gcGFuaWMoKSBiZWNhdXNlIHdlJ3Jl
IGluX2ludGVycnVwdCgpCgpBcyBzdWNoLCBjdXJyZW50bHkgb24gcmlzY3YgYWxsIEJVRygpIHNp
bXBseSBjb21wbGV0ZWx5IHBhbmljKCkgdGhlCmVudGlyZSBtYWNoaW5lLCByYXRoZXIgdGhhbiBq
dXN0IGtpbGxpbmcgdGhlIG9uZSB0YXNrLgoKSG93IGRvIHlvdSB0aGluayB0aGlzIHNob3VsZCBi
ZSBmaXhlZD8gSGVyZSBhcmUgc29tZSBpZGVhcyBidXQgSSdtIG5vdApmYW1pbGlhciB3aXRoIGdl
bmVyaWMgZW50cnkgc3R1ZmY6CgogICogU2hvdWxkIHdlIGlycWVudHJ5X25taV9leGl0KCkgYmVm
b3JlIGNhbGxpbmcgZGllKCkgZm9yIEJVRygpPwogICogU2hvdWxkIHdlIG1vdmUgdGhlIEdFTkVS
SUNfQlVHIHRyYXAgaW5zdHJ1Y3Rpb24gdG8gY2F1c2UgaWxsZWdhbAogICAgaW5zdHJ1Y3Rpb24g
ZXhjZXB0aW9uIGluc3RlYWQsIGZvciB3aGljaCB3ZSBjYW4gd3JpdGUgYSBzaW1wbGVyCiAgICBo
YW5kbGVyIHRoYXQgZG9lc24ndCBuZWVkIHRvIGNhcmUgYWJvdXQgdGhlIHByb2JlIHN0dWZmPwoK
Vml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
