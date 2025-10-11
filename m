Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8451ECCD183
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH9VqKREGyADDGJWjl8JaVlCq6aCdvtO1D2QD2G/bz8=; b=oCe2+c2C0zJaB02dHrsgk4ghVV
	/itWeA+EnzV2+Zo5Z3qYLcYJGBgxefazHgrjdPL+moHW2HVPEwt5h3S7NqXIMJ3IcJ6W8P1yqkViE
	tuXTrKR+JYZqal11VlcqPONW7OzEWosmdx84C5/7tjqSOlXFN+BKf3slziBgdsjiVgPy4CH/95eK1
	HTTHn01wDIyha5uliXZ4fGo4c2m/9/SJnw995HhVRECfYjuspL+feYks4TvZ+4ljOFtSlN9Ob4USD
	qlOTWohTWkJ8ei9nhG0kEPq3NwMr7GuAG3hC6cZ+P3IGyeQCOk0HIdsjScroNitDGGDI9Wq2vY+Q/
	f2/IacAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3Y-00000009uMc-20eb;
	Sat, 11 Oct 2025 07:30:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3X-00000009uMS-1bEM;
	Sat, 11 Oct 2025 07:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zMGK255wwyAjRD6lvlMg99YBP8AsvkgV9+EN+wiypcY=; b=AWNaKYPUGdLtOtUZ0n5U+uV2jz
	fMmu6Ap3VSworTaXMMSOkdpkOdq6im+9OAwjloneyNiZXHcIXRZEJrxpts+eu29gMqRG56Idj9/QJ
	Uut+A/6jG11o3awzSCxcaTpi44GK/+LWbway4tSbJ0PaqmlYp+CFPzzJKiOIZovOp07dgwsTdtpvM
	wKfjvtOToK8BAAR/gfjDGS2wwBIxAmCOQxI6l72UX5akWC2HhxVY/fzpFqxxVYyNxMVlzn8Yfp9LX
	tYWpf37tBr7E+nO63qVqQGsROUtkCxLryuQYxUAoN2NiR2h53kWuPpnIQiAnBq74PQhrpOAK/XdOr
	b8bDEvcA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7U3K-00000002krq-3Cb4;
	Sat, 11 Oct 2025 07:30:17 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_79sB+poSPoUAA--.44534S3;
	Sat, 11 Oct 2025 15:29:49 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxusBrB+poDevZAA--.1109S3;
	Sat, 11 Oct 2025 15:29:48 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250928085506.4471-1-yangtiezhu@loongson.cn>
 <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
 <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
Date: Sat, 11 Oct 2025 15:29:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJAxusBrB+poDevZAA--.1109S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF43GF17tw43Jr4ftFy7urX_yoW8KrW8pF
	WjkFWYkF4rZr4UXw1vyayjvrWaqrs3trWUKasxXryfZan8Xr4aqr4Y9w1q9F4kJrZ7W3W2
	va1xtr9Iyayqy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jza0PUUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_083010_228592_2641D0B4 
X-CRM114-Status: GOOD (  19.84  )
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

T24gMjAyNS8xMC8xMSDkuIrljYgxMTo0MCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gT24gRnJp
LCAxMCBPY3QgMjAyNSBhdCAxOTo1NCwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgT2N0IDExLCAyMDI1IGF0IDk6MTPigK9BTSBUaWV6aHUg
WWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4+Pgo+Pj4gT24gMjAyNS8xMC8x
MSDkuIrljYgxMjoyNSwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4+PiAuLi4KPj4+PiBXaHkgZG8g
d2UgbmVlZCBib3RoICgxKSBhbmQgKDIpPwo+Pj4KPj4+IE5vdCBib3RoLCBlaXRoZXIgKDEpIG9y
ICgyKS4KPj4+IFdoaWNoIG9uZSBkbyB5b3UgcHJlZmVyPyBPciBhbnkgb3RoZXIgc3VnZ2VzdGlv
bnM/Cj4+Pgo+Pj4gVGFraW5nIGFsbCBvZiB0aGUgY29uc2lkZXJhdGlvbnMgaW4gYmFsYW5jZSwg
d2Ugc2hvdWxkIGRlY2lkZQo+Pj4gd2hhdCBpcyB0aGUgcHJvcGVyIHdheS4KPj4gQXMgYSBzdW1t
YXJ5LCB0aGVyZSBhcmUgdGhyZWUgbWV0aG9kczoKPj4gKDEpIE9ubHkgbGluayBsaWJzdHViIHdp
dGggdm1saW51eC5vIGR1cmluZyB0aGUgZmluYWwgdm1saW51eCBsaW5rLgo+PiAoMikgUmVtb3Zl
IHRoZSBhdHRyaWJ1dGUgX19ub3JldHVybiBmb3IgcmVhbF9rZXJuZWxfZW50cnkoKSBhbmQgYWRk
IHdoaWxlICgxKS4KPj4gKDMpIElnbm9yZSAiX19lZmlzdHViXyIgcHJlZml4IGluIG9ianRvb2wu
Cj4+Cj4+IEpvc2ggcHJlZmVycyBtZXRob2QgKDEpLCBJIHByZWZlciBtZXRob2QgKDMpIGJ1dCBh
bHNvIGFjY2VwdCBtZXRob2QKPj4gKDEpIGlmIGl0IGlzIG5vdCBvbmx5IHNwZWNpZmljIHRvIGxv
b25nYXJjaC4KPj4KPiAKPiBUaGlzIGlzIGEgZmFsc2UgcG9zaXRpdmUgd2FybmluZyBpbiBvYmp0
b29sLCB3aGljaCBjb21wbGFpbnMgYWJvdXQgYQo+IGZ1bmN0aW9uIHRoYXQgZmFsbHMgdGhyb3Vn
aCwgZXZlbiB0aG91Z2ggdGhhdCBjYW4gbmV2ZXIgaGFwcGVuIGluCj4gcmVhbGl0eS4KPiAKPiBU
byBtZSwgaXQgaXMgbm90IGFjY2VwdGFibGUgdG8gbW9kaWZ5IGhvdyB2bWxpbnV4Lm8gaXMgY29u
c3RydWN0ZWQKPiBhbHNvIGZvciBvdGhlciBhcmNoaXRlY3R1cmVzLCBpbiBvcmRlciB0byBoaWRl
IHNvbWUgb2YgaXRzIGNvbnN0aXR1ZW50Cj4gcGFydHMgZnJvbSBvYmp0b29sLCB3aGljaCBkbyBu
b3QgdXNlIG9ianRvb2wgdG8gYmVnaW4gd2l0aC4KPiAKPiAKPiBJZiB5b3UgYXJlIG5vdCB3aWxs
aW5nIHRvIGZpeCBvYmp0b29sLCBJIHN1Z2dlc3QgZml4aW5nIHRoZSBsb29uZ2FyY2gKPiBjb2Rl
IGxpa2UgdGhpczoKClRoYW5rIHlvdS4KCj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi9sb29uZ2FyY2guYwo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvbG9v
bmdhcmNoLmMKPiBAQCAtMTAsNyArMTAsNyBAQAo+ICAgI2luY2x1ZGUgImVmaXN0dWIuaCIKPiAg
ICNpbmNsdWRlICJsb29uZ2FyY2gtc3R1Yi5oIgo+IAo+IC10eXBlZGVmIHZvaWQgX19ub3JldHVy
biAoKmtlcm5lbF9lbnRyeV90KShib29sIGVmaSwgdW5zaWduZWQgbG9uZyBjbWRsaW5lLAo+ICt0
eXBlZGVmIHZvaWQgKCprZXJuZWxfZW50cnlfdCkoYm9vbCBlZmksIHVuc2lnbmVkIGxvbmcgY21k
bGluZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBzeXN0YWIpOwo+IAo+ICAgZWZpX3N0YXR1c190IGNoZWNrX3BsYXRmb3JtX2ZlYXR1
cmVzKHZvaWQpCj4gQEAgLTgxLDQgKzgxLDYgQEAKPiAKPiAgICAgICAgICByZWFsX2tlcm5lbF9l
bnRyeSh0cnVlLCAodW5zaWduZWQgbG9uZyljbWRsaW5lX3B0ciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAodW5zaWduZWQgbG9uZyllZmlfc3lzdGVtX3RhYmxlKTsKPiArCj4gKyAgICAg
ICByZXR1cm4gRUZJX0xPQURfRVJST1I7Cj4gICB9CgpJIHRlc3RlZCB0aGUgYWJvdmUgY2hhbmdl
cywgdGhlIGZhbGxzIHRocm91Z2ggb2JqdG9vbCB3YXJuaW5nIGNhbgpiZSBmaXhlZCBiZWNhdXNl
IGVmaV9ib290X2tlcm5lbCgpIGVuZHMgd2l0aCBhIHJldHVybiBpbnN0cnVjdGlvbiwKSSB0aGlu
ayB0aGlzIGlzIHJlYXNvbmFibGUuCgplZmlfYm9vdF9rZXJuZWwoKSBoYXMgYSByZXR1cm4gdmFs
dWUsIHRoZXJlIGFyZSAicmV0dXJuIHN0YXR1cyIgaW4Kb3RoZXIgcGFydHMgb2YgZWZpX2Jvb3Rf
a2VybmVsKCksIGl0IHNob3VsZCBhbHNvIHJldHVybiBhdCB0aGUgZW5kCm9mIGVmaV9ib290X2tl
cm5lbCgpIGluIHRoZW9yeSwgYWx0aG91Z2ggd2Ugc2hvdWxkIG5ldmVyIGdldCBoZXJlLgoKSWYg
dGhlcmUgYXJlIG1vcmUgY29tbWVudHMsIHBsZWFzZSBsZXQgbWUga25vdy4KClRoYW5rcywKVGll
emh1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
