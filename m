Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BDFC3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 02:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPGcA5O4FmXnfVgj0QzJ6+dUbaGOjv7m0zMh11VtC78=; b=CuiG59BIkcWefg
	TtyTugSHfkorVF6GkQBgEfyVQ2pHu5DR1zhg9k7p06+Lk/33hXG/1Lg1ywa/mFjMHhCeADqGD3xoy
	ohxWx8S9LDfhMcXE0vheaaoCdY7aFuHllpSFFn3Aom7i+lFN1wgfqxjBwvLAtrm1VutL97wud2Vmk
	GYmmL17I6+Uw7rbkKF0bZyBN6gyICL0iFtND2gNHKd44hEjawi3a4mXQCkAJ0MsV9odj7hAim74Hn
	sgjB4XdtRVFLMnF1i+qjparvPYymDR4tIqHPJ74weKJuY0T06/kzT1AtcxYPWqnKGKdeLzrmC0MOw
	6xZ6EHAFHj6ll2dxHTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1san2j-0000000EM3x-0uha;
	Mon, 05 Aug 2024 02:01:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1san2g-0000000EM3E-0zgj
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 02:01:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wcfn94YfTzyPs6
	for <linux-riscv@lists.infradead.org>; Mon,  5 Aug 2024 10:01:33 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 46FB518009B
	for <linux-riscv@lists.infradead.org>; Mon,  5 Aug 2024 10:01:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 10:01:37 +0800
Message-ID: <3dd9303f-de28-3dae-9aab-3c524051a948@huawei.com>
Date: Mon, 5 Aug 2024 10:01:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] crash: Fix riscv64 crash memory reserve dead loop
Content-Language: en-US
To: <linux-riscv@lists.infradead.org>
References: <20240802090105.3871929-1-ruanjinjie@huawei.com>
 <ce86ad6b-5f56-4856-9756-fa8867d0d1df@ghiti.fr>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ce86ad6b-5f56-4856-9756-fa8867d0d1df@ghiti.fr>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_190146_672520_6BBE4AA3 
X-CRM114-Status: GOOD (  21.20  )
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

CgpPbiAyMDI0LzgvMiAyMDoyNCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIEppbmppZSwK
PiAKPiBPbiAwMi8wOC8yMDI0IDExOjAxLCBKaW5qaWUgUnVhbiB3cm90ZToKPj4gT24gUklTQ1Y2
NCBRZW11IG1hY2hpbmUgd2l0aCA1MTJNQiBtZW1vcnksIGNtZGxpbmUKPj4gImNyYXNoa2VybmVs
PTUwME0saGlnaCIKPj4gd2lsbCBjYXVzZSBzeXN0ZW0gc3RhbGwgYXMgYmVsb3c6Cj4+Cj4+IMKg
wqDCoMKgIFpvbmUgcmFuZ2VzOgo+PiDCoMKgwqDCoMKgwqAgRE1BMzLCoMKgwqAgW21lbSAweDAw
MDAwMDAwODAwMDAwMDAtMHgwMDAwMDAwMDlmZmZmZmZmXQo+PiDCoMKgwqDCoMKgwqAgTm9ybWFs
wqDCoCBlbXB0eQo+PiDCoMKgwqDCoCBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQo+
PiDCoMKgwqDCoCBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKPj4gwqDCoMKgwqDCoMKgIG5vZGXC
oMKgIDA6IFttZW0gMHgwMDAwMDAwMDgwMDAwMDAwLTB4MDAwMDAwMDA4MDA1ZmZmZl0KPj4gwqDC
oMKgwqDCoMKgIG5vZGXCoMKgIDA6IFttZW0gMHgwMDAwMDAwMDgwMDYwMDAwLTB4MDAwMDAwMDA5
ZmZmZmZmZl0KPj4gwqDCoMKgwqAgSW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbSAweDAwMDAwMDAw
ODAwMDAwMDAtMHgwMDAwMDAwMDlmZmZmZmZmXQo+PiDCoMKgwqDCoChzdGFsbCBoZXJlKQo+Pgo+
PiBjb21taXQgNWQ5OWNhZGYxNTY4ICgiY3Jhc2g6IGZpeCB4ODZfMzIgY3Jhc2ggbWVtb3J5IHJl
c2VydmUgZGVhZCBsb29wCj4gCj4gCj4gSSBjYW4ndCBmaW5kIHRoaXMgcmV2aXNpb24sIHdhcyB0
aGlzIHBhdGNoIG1lcmdlZCBpbiA2LjExCgpZZXMsIGl0IGlzIGluIGxpbnV4LW5leHQuCgoKPiAK
PiAKPj4gYnVnIikgZml4IHRoaXMgb24gMzItYml0IGFyY2hpdGVjdHVyZS4gSG93ZXZlciwgdGhl
IHByb2JsZW0gaXMgbm90Cj4+IGNvbXBsZXRlbHkgc29sdmVkLiBJZiBgQ1JBU0hfQUREUl9MT1df
TUFYID0gQ1JBU0hfQUREUl9ISUdIX01BWGAgb24KPj4gNjQtYml0Cj4+IGFyY2hpdGVjdHVyZSwg
Zm9yIGV4YW1wbGUsIHdoZW4gc3lzdGVtIG1lbW9yeSBpcyBlcXVhbCB0bwo+PiBDUkFTSF9BRERS
X0xPV19NQVggb24gUklTQ1Y2NCwgdGhlIGZvbGxvd2luZyBpbmZpbml0ZSBsb29wIHdpbGwgYWxz
bwo+PiBvY2N1cjoKPj4KPj4gwqDCoMKgwqAtPiByZXNlcnZlX2NyYXNoa2VybmVsX2dlbmVyaWMo
KSBhbmQgaGlnaCBpcyB0cnVlCj4+IMKgwqDCoMKgwqDCoCAtPiBhbGxvYyBhdCBbQ1JBU0hfQURE
Ul9MT1dfTUFYLCBDUkFTSF9BRERSX0hJR0hfTUFYXSBmYWlsCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAtPiBhbGxvYyBhdCBbMCwgQ1JBU0hfQUREUl9MT1dfTUFYXSBmYWlsIGFuZCByZXBlYXRlZGx5
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoYmVjYXVzZSBDUkFTSF9BRERSX0xPV19NQVgg
PSBDUkFTSF9BRERSX0hJR0hfTUFYKS4KPj4KPj4gQmVmb3JlIHJlZmFjdG9yIGluIGNvbW1pdCA5
YzA4YTJhMTM5ZmUgKCJ4ODY6IGtkdW1wOiB1c2UgZ2VuZXJpYwo+PiBpbnRlcmZhY2UKPj4gdG8g
c2ltcGxpZnkgY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gY29kZSIpLCB4ODYgZG8gbm90IHRyeSB0
byByZXNlcnZlCj4+IGNyYXNoCj4+IG1lbW9yeSBhdCBsb3cgaWYgaXQgZmFpbHMgdG8gYWxsb2Mg
YWJvdmUgaGlnaCA0Ry4gSG93ZXZlciBiZWZvcmUKPj4gcmVmYXRvciBpbgo+PiBjb21taXQgZmRj
MjY4MjMyZGJiYSAoImFybTY0OiBrZHVtcDogdXNlIGdlbmVyaWMgaW50ZXJmYWNlIHRvIHNpbXBs
aWZ5Cj4+IGNyYXNoa2VybmVsIHJlc2VydmF0aW9uIiksIGFybTY0IHRyeSB0byByZXNlcnZlIGNy
YXNoIG1lbW9yeSBhdCBsb3cgaWYgaXQKPj4gZmFpbHMgYWJvdmUgaGlnaCA0Ry4gRm9yIDY0LWJp
dCBzeXN0ZW1zLCB0aGlzIGF0dGVtcHQgaXMgbGVzcyBiZW5lZmljaWFsCj4+IHRoYW4gdGhlIG9w
cG9zaXRlLCByZW1vdmUgaXQgdG8gZml4IHRoaXMgYnVnIGFuZCBhbGlnbiB3aXRoIG5hdGl2ZSB4
ODYKPj4gaW1wbGVtZW50YXRpb24uCj4+Cj4+IEFmdGVyIHRoaXMgcGF0Y2gsIGl0IHByaW50Ogo+
PiDCoMKgwqDCoGNhbm5vdCBhbGxvY2F0ZSBjcmFzaGtlcm5lbCAoc2l6ZToweDFmNDAwMDAwKQo+
Pgo+PiBGaXhlczogMzkzNjUzOTUwNDZmICgicmlzY3Y6IGtkdW1wOiB1c2UgZ2VuZXJpYyBpbnRl
cmZhY2UgdG8gc2ltcGxpZnkKPj4gY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24iKQo+IAo+IAo+IFlv
dXIgcGF0Y2ggc3ViamVjdCBpbmRpY2F0ZXMgIi1uZXh0IiBidXQgSSBzZWUgdGhpcyBjb21taXQg
XiBsYW5kZWQgaW4KPiA2LjcsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIG1lcmdlIGl0IG5vdywgbGV0
IG1lIGtub3cgaWYgSSBtaXNzZWQgc29tZXRoaW5nLgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4g
Cj4gCj4+IFNpZ25lZC1vZmYtYnk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiDCoCBrZXJuZWwvY3Jhc2hfcmVzZXJ2ZS5jIHwgOSAtLS0tLS0tLS0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9rZXJuZWwv
Y3Jhc2hfcmVzZXJ2ZS5jIGIva2VybmVsL2NyYXNoX3Jlc2VydmUuYwo+PiBpbmRleCA1Mzg3MjY5
MTE0ZjYuLjY5ZTRiOGI3Yjk2OSAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2NyYXNoX3Jlc2VydmUu
Ywo+PiArKysgYi9rZXJuZWwvY3Jhc2hfcmVzZXJ2ZS5jCj4+IEBAIC00MjAsMTUgKzQyMCw2IEBA
IHZvaWQgX19pbml0IHJlc2VydmVfY3Jhc2hrZXJuZWxfZ2VuZXJpYyhjaGFyCj4+ICpjbWRsaW5l
LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmV0cnk7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoCAvKgo+PiAtwqDCoMKgwqDC
oMKgwqDCoCAqIEZvciBjcmFzaGtlcm5lbD1zaXplW0tNR10saGlnaCwgaWYgdGhlIGZpcnN0IGF0
dGVtcHQgd2FzCj4+IC3CoMKgwqDCoMKgwqDCoMKgICogZm9yIGhpZ2ggbWVtb3J5LCBmYWxsIGJh
Y2sgdG8gbG93IG1lbW9yeS4KPj4gLcKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gLcKgwqDCoMKgwqDC
oMKgIGlmIChoaWdoICYmIHNlYXJjaF9lbmQgPT0gQ1JBU0hfQUREUl9ISUdIX01BWCkgewo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWFyY2hfZW5kID0gQ1JBU0hfQUREUl9MT1dfTUFYOwo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWFyY2hfYmFzZSA9IDA7Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gcmV0cnk7Cj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBwcl93YXJuKCJjYW5ub3QgYWxsb2NhdGUgY3Jhc2hrZXJuZWwgKHNpemU6MHgl
bGx4KVxuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3Jhc2hfc2l6ZSk7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
