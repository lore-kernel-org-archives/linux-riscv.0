Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A81E7AD72
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyfAPtoan9EuJWTlUMq6GCTB6CuDuZHxukoJCq3UIAo=; b=2lrVQjZC+CQARjlwzgsk1GdMK/
	N2MSzakyIXL/P3OGYBvlobqTRHc5Q5kgIt/yVSw9ZlnlXN8eSJBqat8JcwFN3DTqneijDfxZS/OyE
	n/sQngjUv9oOpqjQEa8EgUdPR+DjeE3mfJwk/r+yeOQ2F+NOXAO2/TazA0qiV0nwlYuaq8RkZSF9F
	jV1fWfZmUFuc95n6Hrjj+xAUoeNEiYx2epxRbviwo6IvLFSI1Tr0ltQielED224cufEkkknA0k6lU
	PbHv4uTTrsWhcBCPWkONce+IfGZqSPKiw5DxKZWhPyXatkq3pkB3AZl9HFGIiuHVyDogyV/81R6if
	iQdGUAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhYS-00EtvX-1x;
	Tue, 03 Oct 2023 15:43:24 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhYN-00Etu0-28
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 15:43:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24B891BF207;
	Tue,  3 Oct 2023 15:43:10 +0000 (UTC)
Message-ID: <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
Date: Tue, 3 Oct 2023 17:43:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230928151846.8229-1-alexghiti@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_084319_836755_046A4709 
X-CRM114-Status: GOOD (  17.57  )
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

K2NjIEFuZHJldzogV291bGTCoCB5b3UgbWluZCB0YWtpbmcgdGhpcyBwYXRjaHNldCBpbiB5b3Vy
IHRyZWUgZm9yIHRoZSAKbmV4dCByYz8gVGhpcyBwYXRjaHNldCBkZXBlbmRzIG9uIGEgcHJldmlv
dXMgZml4IGZvciBhcm02NCB0aGF0IHlvdSAKbWVyZ2VkIGluIHJjNCB3aGljaCBpcyBub3QgaW4g
dGhlIHJpc2N2IC1maXhlcyBicmFuY2ggeWV0LgoKSSBzYXcgd2l0aCBQYWxtZXIgYW5kIGhlIHNo
b3VsZCBhY2sgdGhpcyBzaG9ydGx5LgoKSWYgSSBjYW4gZG8gYW55dGhpbmcgZWxzZSB0byBoZWxw
LCBsZXQgbWUga25vdy4KClRoYW5rcywKCkFsZXgKCk9uIDI4LzA5LzIwMjMgMTc6MTgsIEFsZXhh
bmRyZSBHaGl0aSB3cm90ZToKPiBBIHJlY2VudCByZXBvcnQgWzFdIGZyb20gUnlhbiBmb3IgYXJt
NjQgcmV2ZWFsZWQgdGhhdCB3ZSBkbyBub3QgaGFuZGxlCj4gc3dhcCBlbnRyaWVzIHdoZW4gc2V0
dGluZyBhIGh1Z2VwYWdlIGJhY2tlZCBieSBhIE5BUE9UIHJlZ2lvbiAodGhlCj4gY29udHB0ZSBy
aXNjdiBlcXVpdmFsZW50KS4KPgo+IEFzIGV4cGxhaW5lZCBpbiBbMV0sIHRoZSBpc3N1ZSB3YXMg
ZGlzY292ZXJlZCBieSBhIG5ldyB0ZXN0IGluIGtzZWxmdGVzdAo+IHdoaWNoIHVzZXMgcG9pc29u
IGVudHJpZXMsIGJ1dCB0aGUgc3ltcHRvbXMgYXJlIGRpZmZlcmVudCBmcm9tIGFybTY0IHRob3Vn
aDoKPgo+IC0gdGhlIHJpc2N2IGtlcm5lbCBidWdzIGJlY2F1c2Ugd2UgZG8gbm90IGhhbmRsZSBW
TV9GQVVMVF9IV1BPSVNPTiosCj4gICAgdGhpcyBpcyBmaXhlZCBieSBwYXRjaCAxLAo+IC0gYWZ0
ZXIgdGhhdCwgdGhlIHRlc3QgcGFzc2VzIGJlY2F1c2UgdGhlIGZpcnN0IHB0ZV9uYXBvdCgpIGZh
aWxzICh0aGUKPiAgICBwb2lzb24gZW50cnkgZG9lcyBub3QgaGF2ZSB0aGUgTiBiaXQgc2V0KSwg
YW5kIHRoZW4gd2Ugb25seSBzZXQgdGhlCj4gICAgZmlyc3QgcGFnZSB0YWJsZSBlbnRyeSBjb3Zl
cmluZyB0aGUgTkFQT1QgaHVnZXBhZ2UsIHdoaWNoIGlzIGVub3VnaAo+ICAgIGZvciBodWdldGxi
X2ZhdWx0KCkgdG8gY29ycmVjdGx5IHJhaXNlIGEgVk1fRkFVTFRfSFdQT0lTT04gd2hlcmV2ZXIg
d2UKPiAgICB3cml0ZSBpbiB0aGlzIG1hcHBpbmcgc2luY2Ugb25seSB0aGlzIGZpcnN0IHBhZ2Ug
dGFibGUgZW50cnkgaXMKPiAgICBjaGVja2VkCj4gICAgKHNlZSBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ni42LXJjMy9zb3VyY2UvbW0vaHVnZXRsYi5jI0w2MDcxKS4KPiAgICBC
dXQgdGhpcyBzZWVtcyBmcmFnaWxlIHNvIHBhdGNoIDIgc2V0cyBhbGwgcGFnZSB0YWJsZSBlbnRy
aWVzIG9mIGEKPiAgICBOQVBPVCBtYXBwaW5nLgo+Cj4gWzFdOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwOTIyMTE1ODA0LjIwNDM3NzEtMS1yeWFuLnJvYmVy
dHNAYXJtLmNvbS8KPgo+Cj4gQWxleGFuZHJlIEdoaXRpICgyKToKPiAgICByaXNjdjogSGFuZGxl
IFZNX0ZBVUxUX1tIV1BPSVNPTnxIV1BPSVNPTl9MQVJHRV0gZmF1bHRzIGluc3RlYWQgb2YKPiAg
ICAgIHBhbmlja2luZwo+ICAgIHJpc2N2OiBGaXggc2V0X2h1Z2VfcHRlX2F0KCkgZm9yIE5BUE9U
IG1hcHBpbmdzIHdoZW4gYSBzd2FwIGVudHJ5IGlzCj4gICAgICBzZXQKPgo+ICAgYXJjaC9yaXNj
di9tbS9mYXVsdC5jICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvcmlzY3YvbW0vaHVnZXRsYnBhZ2Uu
YyB8IDE5ICsrKysrKysrKysrKystLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
