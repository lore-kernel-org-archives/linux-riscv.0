Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B15C369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1JUTWbRmKjDseI6h24TepIVh4cHIpKPppDOQypUaRQ=; b=weaIMaxmbmcHrn
	voJOlvxE1j4kBNU2lbX9vjUwYZ6uTCw+LmrZdEhl+23gmCfLlkQNEhXEfhvsCSKb1EuLAEErUEn8t
	fmkfVjy57+lfAbYsCVNO7I8jMuO3Xx7asNwoRq3Kyk72mV7pLpyft1vI39lOF8+gK9imVpbQumMaA
	h5Q/MB1lT0kA2h9Aanp8d0vwYDfMNHLatR3i6pr7J048lBPYPMoyv8e3O8T40vvXkOP1RqiWRfOeY
	u8sy5vdZMrhZcDoKcBlEedv4bDw3MK3z+zTnuTmYKEdC8g+cPFZ+iQDncwboLPPh4azTxqo2M0bP/
	25B2MGgG2f3p/3C0KtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65Hl-000000018v3-3x7w;
	Sat, 19 Apr 2025 10:18:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65Hk-000000018uG-1sHB
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 10:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E7D45375;
	Sat, 19 Apr 2025 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7226BC4CEE7;
	Sat, 19 Apr 2025 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745057935;
	bh=jAcmSoS3GtzgVfgKeZM4QEikFmRzlkijiCGw0g5VRhk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d2txBxSt3JpSGV8a+0y4n+83rtV/oUrj63dD9V9AZDsKWdEy3brZ4Qkk1tWWCOmIl
	 B5noMhBIn1LPeXZfVooW6XrkjUOsENGTQdO2kbgPsmXGBJQsJZYjkuP+N2jwf54gk0
	 7/arCRwEuMvjwSik8iOslOGofJuq0EJVFewBEIi3ysk2KHhpBCKDYGEvC/GnQX3iKR
	 KMxi1SktQn7nNY1e4lFh/5r1WT65S4QuhoLcomU6xnkGWRF7CsJUBpz4cfDa9LnB47
	 0yh+TP0xgGyYwDNg13ix8IceO7TxJazZQtXG6MjCad/RNseAy7TUIf9+xl6F9t5+DV
	 yIwXnD3b6UQsA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@kernel.org>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH fixes] riscv: uprobes: Add missing fence.i after
 building the XOL buffer
In-Reply-To: <b864fc90-1297-4e1d-8487-61049e23e405@sifive.com>
References: <20250417074952.1315641-1-bjorn@kernel.org>
 <b864fc90-1297-4e1d-8487-61049e23e405@sifive.com>
Date: Sat, 19 Apr 2025 12:18:51 +0200
Message-ID: <87ikn0tpx0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_031856_507836_0B6D7738 
X-CRM114-Status: GOOD (  11.90  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gSGkg
QmrDtnJuLAo+Cj4gT24gMjAyNS0wNC0xNyAyOjQ5IEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+IAo+PiBUaGUgWE9M
IChleGVjdXRlIG91dC1vZi1saW5lKSBidWZmZXIgaXMgdXNlZCB0byBzaW5nbGUtc3RlcCB0aGUK
Pj4gcmVwbGFjZWQgaW5zdHJ1Y3Rpb24ocykgZm9yIHVwcm9iZXMuIFRoZSBSSVNDLVYgcG9ydCB3
YXMgbWlzc2luZyBhCj4+IHByb3BlciBmZW5jZS5pIChpJCBmbHVzaGluZykgYWZ0ZXIgY29uc3Ry
dWN0aW5nIHRoZSBYT0wgYnVmZmVyLCB3aGljaAo+PiBjYW4gcmVzdWx0IGluIGluY29ycmVjdCBl
eGVjdXRpb24gb2Ygc3RhbGUvYnJva2VuIGluc3RydWN0aW9ucy4KPj4gCj4+IFRoaXMgd2FzIGZv
dW5kIHJ1bm5pbmcgdGhlIEJQRiBzZWxmdGVzdHMgInRlc3RfcHJvZ3M6Cj4+IHVwcm9iZV9hdXRv
YXR0YWNoLCBhdHRhY2hfcHJvYmUiIG9uIHRoZSBTcGFjZW1pdCBLMS9YNjAsIHdoZXJlIHRoZQo+
PiB1cHJvYmVzIHRlc3RzIHJhbmRvbWx5IGJsZXcgdXAuCj4+IAo+PiBGaXhlczogNzQ3ODQwODFh
YWM4ICgicmlzY3Y6IEFkZCB1cHJvYmVzIHN1cHBvcnRlZCIpCj4+IFNpZ25lZC1vZmYtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMvdXByb2Jlcy5jIHwgOSArLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vw
cm9iZXMuYwo+PiBpbmRleCA0YjNkYzhiZWFmNzcuLjRmYWVmOTJkZDc3MSAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4+IEBAIC0xNzYsMTMgKzE3Niw2IEBAIHZvaWQgYXJj
aF91cHJvYmVfY29weV9peG9sKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25nIHZhZGRy
LAo+PiAgCQkqKHVwcm9iZV9vcGNvZGVfdCAqKWRzdCA9IF9fQlVHX0lOU05fMzI7Cj4+ICAJfQo+
PiAgCj4+ICsJZmx1c2hfaWNhY2hlX3JhbmdlKCh1bnNpZ25lZCBsb25nKWRzdCwgKHVuc2lnbmVk
IGxvbmcpZHN0ICsgbGVuKTsKPgo+IFRoaXMgd29ya3MgYmVjYXVzZSBmbHVzaF9pY2FjaGVfcmFu
Z2UgY3VycmVudGx5IGlnbm9yZXMgdGhlIHJhbmdlLCBidXQKPiBzZW1hbnRpY2FsbHkgaXMgbm90
IHF1aXRlIHJpZ2h0LCBiZWNhdXNlIG9mIHRoZSBsaW5lIGp1c3QgYWJvdmUgdGhlIGNvbnRleHQg
dGhhdAo+IGluY3JlbWVudHMgZHN0LiBJZiB0aGUgcmFuZ2Ugd2FzIHJlc3BlY3RlZCwgdGhpcyB3
b3VsZCBvbmx5IGZsdXNoIHRoZSBlYnJlYWssCj4gbm90IHRoZSBwcmVjZWRpbmcgc2luZ2xlLXN0
ZXBwZWQgaW5zdHJ1Y3Rpb24uCgpJbmRlZWQhIFRoYXQgd2FzIHNsb3BweSEgSSdsbCBzcGluIGEg
djIhCgpUaGFuayB5b3UhCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
