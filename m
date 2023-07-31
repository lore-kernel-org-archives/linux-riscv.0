Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D822C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/8DUMLR+UFQMZUDbXVYYfM2fw7WSH07jxPuSklSmC4=; b=UnZmHFSo3kXh5j
	g59c3+IGGYiokbgrcqfevBgBUgCrtfLuFNG681xCXoDMAlIEf9QDpZQHUQ8JcPUUaK5wS+mnLtAS6
	xpXAicM5MDMElvzCKiCR7WVQvgBWPwhutU/TSWfxgbUGDgdzsh1cE8bRPpawL1XlklU7zFkZhjjwU
	iNr7tJIssKwkBUe0juSmGK9CE8HGQ5LHKQ+E90+c+TKgtyYKHCORuSIV19ZM1wGSkek1MGkfUzfZo
	PDapUN9AlQQRD1B5Hucb5WPeeiJBvCSPJcEm2M1yWgwbJj9X35g4dzlUHFYPktFZLn6KWinDYpgSi
	zSRMxWSBYaFTRehOu4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR41-00FKdT-0C;
	Mon, 31 Jul 2023 11:27:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQR3z-00FKcy-1L
	for linux-riscv@bombadil.infradead.org;
	Mon, 31 Jul 2023 11:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5DLOWPQSviJb7sEjxA+8GAQRuYUY7ddxejMb8PTMsyo=; b=MGULjkoOCX0i6wvv8NSE0mnvx8
	v3BGPzXbCxgi/tLamD6TlBPtsrwChFhFLYMjjzId6zE7TWx9QWGPHh4m8IiYEi5C0MYPRpLH/uSdH
	JUXQEEH5w1ZagXWp1MGZwmUXpC/UN7M+RIwH8C/ZHm2el2029jGt31Wsy0cNhH7A2WuRFZxz3s2Al
	STa0tXXPzL2WrdYf4y0yk8D91jCEeazmTKRmyOEEGAFFtmp6RGxIadiK+ALM9CVAbJCOpFh9WJfjb
	dQpDKisO6D5KfYZGiXFXAxrvCXyDbiMAf9sySUFKHTVbpLY3RjVUe72961pltY2vr0O2V7coqiCk8
	+F9SD40w==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qQR3t-001MBg-Qm
	for linux-riscv@lists.infradead.org; Mon, 31 Jul 2023 11:27:45 +0000
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8DxxPCZmsdkXDgNAA--.32063S3;
	Mon, 31 Jul 2023 19:27:21 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx7yOXmsdk11lCAA--.2410S3;
	Mon, 31 Jul 2023 19:27:19 +0800 (CST)
Message-ID: <cd1a8791-a524-8813-c70d-2adb4e6c5471@loongson.cn>
Date: Mon, 31 Jul 2023 19:27:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Content-Language: en-US
To: guoren@kernel.org, David.Laight@ACULAB.COM, will@kernel.org,
 peterz@infradead.org, mingo@redhat.com, longman@redhat.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230731023308.3748432-1-guoren@kernel.org>
From: bibo mao <maobibo@loongson.cn>
In-Reply-To: <20230731023308.3748432-1-guoren@kernel.org>
X-CM-TRANSID: AQAAf8Cx7yOXmsdk11lCAA--.2410S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW5Zw13CrWDAF4rWF18Xrc_yoW8Kw1Upr
	98CFs3AF47CFykZFZFyF42vr1rJwsF9r18ur90gwn2yFsrX3s5KanY9rn0vr1jk3WxKrsx
	XFW2gFy5uayjyFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9
	N3UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_122742_896857_5985C3F5 
X-CRM114-Status: GOOD (  14.91  )
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

CgrlnKggMjAyMy83LzMxIDEwOjMzLCBndW9yZW5Aa2VybmVsLm9yZyDlhpnpgZM6Cj4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+IFRoZSBhcmNoX3NwaW5fdmFs
dWVfdW5sb2NrZWQgd291bGQgY2F1c2UgYW4gdW5uZWNlc3NhcnkgbWVtb3J5Cj4gYWNjZXNzIHRv
IHRoZSBjb250ZW5kZWQgdmFsdWUuIEFsdGhvdWdoIGl0IHdvbid0IGNhdXNlIGEgc2lnbmlmaWNh
bnQKPiBwZXJmb3JtYW5jZSBnYXAgaW4gbW9zdCBhcmNoaXRlY3R1cmVzLCB0aGUgYXJjaF9zcGlu
X3ZhbHVlX3VubG9ja2VkCj4gYXJndW1lbnQgY29udGFpbnMgZW5vdWdoIGluZm9ybWF0aW9uLiBU
aHVzLCByZW1vdmUgdW5uZWNlc3NhcnkKPiBhdG9taWNfcmVhZCBpbiBhcmNoX3NwaW5fdmFsdWVf
dW5sb2NrZWQoKS4KPiAKPiBUaGUgY2FsbGVyIG9mIGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZCgp
IGNvdWxkIGJlbmVmaXQgZnJvbSB0aGlzCj4gY2hhbmdlLiBDdXJyZW50bHksIHRoZSBvbmx5IGNh
bGxlciBpcyBsb2NrcmVmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgo+IENjOiBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgo+IENjOiBEYXZp
ZCBMYWlnaHQgPERhdmlkLkxhaWdodEBBQ1VMQUIuQ09NPgo+IENjOiBQZXRlciBaaWpsc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+IENoYW5nZWxvZwo+IFYyOgo+ICAtIEZpeHVwIGNvbW1p
dCBsb2cgd2l0aCBXYWltYW4gYWR2aWNlLgo+ICAtIEFkZCBXYWltYW4gY29tbWVudCBpbiB0aGUg
Y29tbWl0IG1zZy4KPiAtLS0KPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9jay5oIHwgMTYg
KysrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2Nr
LmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrLmgKPiBpbmRleCBmZGZlYmNiMDUwZjQu
LjkwODAzYTgyNmJhMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2Nr
LmgKPiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3NwaW5sb2NrLmgKPiBAQCAtNjgsMTEgKzY4
LDE4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBhcmNoX3NwaW5fdW5sb2NrKGFyY2hf
c3BpbmxvY2tfdCAqbG9jaykKPiAgCXNtcF9zdG9yZV9yZWxlYXNlKHB0ciwgKHUxNil2YWwgKyAx
KTsKPiAgfQo+ICAKPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgYXJjaF9zcGluX3ZhbHVl
X3VubG9ja2VkKGFyY2hfc3BpbmxvY2tfdCBsb2NrKQo+ICt7Cj4gKwl1MzIgdmFsID0gbG9jay5j
b3VudGVyOwo+ICsKPiArCXJldHVybiAoKHZhbCA+PiAxNikgPT0gKHZhbCAmIDB4ZmZmZikpOwo+
ICt9CkkgZG8gbm90IGtub3cgbXVjaCBhYm91dCBsb2NrLCB3aWxsIGl0IGJlIGNhY2hlZCBpbiBy
ZWdpc3RlciB3aXRob3V0IG1lbW9yeQphY2Nlc3MgYWdhaW4gbGlrZSBSRUFEX09OQ0Ugb3IgYXRv
bWljX3JlYWQ/CgpSZWdhcmRzCkJpYm8gTWFvCj4gKwo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5l
IGludCBhcmNoX3NwaW5faXNfbG9ja2VkKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPiAgewo+IC0J
dTMyIHZhbCA9IGF0b21pY19yZWFkKGxvY2spOwo+ICsJYXJjaF9zcGlubG9ja190IHZhbCA9IFJF
QURfT05DRSgqbG9jayk7Cj4gIAo+IC0JcmV0dXJuICgodmFsID4+IDE2KSAhPSAodmFsICYgMHhm
ZmZmKSk7Cj4gKwlyZXR1cm4gIWFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZCh2YWwpOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBhcmNoX3NwaW5faXNfY29udGVuZGVkKGFy
Y2hfc3BpbmxvY2tfdCAqbG9jaykKPiBAQCAtODIsMTEgKzg5LDYgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSBpbnQgYXJjaF9zcGluX2lzX2NvbnRlbmRlZChhcmNoX3NwaW5sb2NrX3QgKmxvY2sp
Cj4gIAlyZXR1cm4gKHMxNikoKHZhbCA+PiAxNikgLSAodmFsICYgMHhmZmZmKSkgPiAxOwo+ICB9
Cj4gIAo+IC1zdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBhcmNoX3NwaW5fdmFsdWVfdW5sb2Nr
ZWQoYXJjaF9zcGlubG9ja190IGxvY2spCj4gLXsKPiAtCXJldHVybiAhYXJjaF9zcGluX2lzX2xv
Y2tlZCgmbG9jayk7Cj4gLX0KPiAtCj4gICNpbmNsdWRlIDxhc20vcXJ3bG9jay5oPgo+ICAKPiAg
I2VuZGlmIC8qIF9fQVNNX0dFTkVSSUNfU1BJTkxPQ0tfSCAqLwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
