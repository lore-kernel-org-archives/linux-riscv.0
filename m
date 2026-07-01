Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07550C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 19:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKkvZmfeM6IOLNb4E1hru+n+WBZGW93gsw6ono+QgHk=; b=AjRh5uhTVsyzm2
	7yZgdpIMUJbBvmz9qb/RsjmyHgEzxek/EToSKiR3vpx7hZfnHZ6tGAF98VNY/s+2nsC3nUnIgwBiJ
	DhZqVlu0/WvKxvONCPYTWjww1iaDa0cIFaqG5u4WFyIvd+/oSSWXxvqJ6MfgUaG/yDC+21RSyDDO6
	sh7AZnJu/T+Me4MNbOSOhVt4rJyf7ZV8SlVfk2z33g9fAFWIPVGg5P2+3vfiFz68w+xHl4khOlXva
	UroMq7ATpHydKP1sHhjLJZdv93cM93lD4cxSM2LFzI2RVoYjIYE/2r8abMmaTZRf0JanFwzYVMfRu
	8wa4gdHmiSDq9e2Nr4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf158-00000002vji-3BZQ;
	Wed, 01 Jul 2026 19:58:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf156-00000002vii-0KUx;
	Wed, 01 Jul 2026 19:58:49 +0000
Date: Wed, 1 Jul 2026 21:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782935924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGRGPG5nxs0MWmKVH1XE9+ETMnAwiphDMI53H6S+Wgo=;
	b=RAJ3EfqoP6AG9c1WaCNIITbaruiAfTva7N92jqjyzHz99/OruOfTsQ9TCd5norcqHnFuwa
	K9sh09kmJbujZbohmQiFhoRumZZlkBpyLFNp1xSsQHibl5CYF+m/TJNK1JhQMyAn4LmeYK
	vdaEeUVaGAU+fb3jPhlEJA3GzYYBti4GYIH1mbLCU4yq2vg0A1P6iRNphahOyuLvRiQCzs
	G1ZivJCtGVTCUncdkOK4rty08ys6o4EvaF5DGpYcDpyLTW6lNjZo45NVlQ3WiTzvV04wgl
	nuZ/G2Tc5emil0fKKVXCMNNGwnTOt8sLqOwW9B3eQ381vduezgRl0dPzG4QrFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782935924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGRGPG5nxs0MWmKVH1XE9+ETMnAwiphDMI53H6S+Wgo=;
	b=1SUZz5LD4PErOtj5qqBP0NkzivGmhqyBp9E8O8FyVIUjOEo15F26+TZGAU3SxaFSaSBgu/
	gXmhX52PlPw+fiAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260701195842.GKzb73-i@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630045531.3939-9-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_125848_256349_8217AA26 
X-CRM114-Status: GOOD (  13.62  )
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

T24gMjAyNi0wNi0zMCAwNDo1NTozMSBbKzAwMDBdLCBLIFByYXRlZWsgTmF5YWsgd3JvdGU6Cj4g
LS0tIGEva2VybmVsL2Z1dGV4L2NvcmUuYwo+ICsrKyBiL2tlcm5lbC9mdXRleC9jb3JlLmMKPiBA
QCAtMzk1LDEzICszOTEsMTMgQEAgX19mdXRleF9oYXNoKHVuaW9uIGZ1dGV4X2tleSAqa2V5LCBz
dHJ1Y3QgZnV0ZXhfcHJpdmF0ZV9oYXNoICpmcGgsIHN0cnVjdCBmdXRleF8KPiAgCQkgKiBOT1RF
OiB0aGlzIGlzbid0IHBlcmZlY3RseSB1bmlmb3JtLCBidXQgaXQgaXMgZmFzdCBhbmQKPiAgCQkg
KiBoYW5kbGVzIHNwYXJzZSBub2RlIG1hc2tzLgo+ICAJCSAqLwo+IC0JCW5vZGUgPSAoaGFzaCA+
PiBmdXRleF9oYXNoc2hpZnQpICUgbnJfbm9kZV9pZHM7Cj4gKwkJbm9kZSA9IHJ1bnRpbWVfY29u
c3Rfc2hpZnRfcmlnaHRfMzIoaGFzaCwgX19mdXRleF9zaGlmdCkgJSBucl9ub2RlX2lkczsKPiAg
CQlpZiAoIW5vZGVfcG9zc2libGUobm9kZSkpIHsKPiAgCQkJbm9kZSA9IGZpbmRfbmV4dF9iaXRf
d3JhcChub2RlX3Bvc3NpYmxlX21hcC5iaXRzLCBucl9ub2RlX2lkcywgbm9kZSk7Cj4gIAkJfQoK
SSByZXBsYWNlZCB0aGlzIHdpdGg6CgpkaWZmIC0tZ2l0IGEva2VybmVsL2Z1dGV4L2NvcmUuYyBi
L2tlcm5lbC9mdXRleC9jb3JlLmMKaW5kZXggNzllNzcwZDRkMTY2Li4zMGQ4NjIyOTU4ZDIgMTAw
NjQ0Ci0tLSBhL2tlcm5lbC9mdXRleC9jb3JlLmMKKysrIGIva2VybmVsL2Z1dGV4L2NvcmUuYwpA
QCAtMzgyLDYgKzM4Miw3IEBAIF9fZnV0ZXhfaGFzaCh1bmlvbiBmdXRleF9rZXkgKmtleSwgc3Ry
dWN0IGZ1dGV4X3ByaXZhdGVfaGFzaCAqZnBoLCBzdHJ1Y3QgZnV0ZXhfCiAJCSAgICAgIGtleS0+
Ym90aC5vZmZzZXQpOwogCiAJaWYgKG5vZGUgPT0gRlVURVhfTk9fTk9ERSkgeworCQl1MzIgbm9k
ZV9saW1pdCA9IG5yX25vZGVfaWRzOwogCQkvKgogCQkgKiBJbiBjYXNlIG9mICFGTEFHU19OVU1B
LCB1c2Ugc29tZSB1bnVzZWQgaGFzaCBiaXRzIHRvIHBpY2sgYQogCQkgKiBub2RlIC0tIHRoaXMg
ZW5zdXJlcyByZWd1bGFyIGZ1dGV4ZXMgYXJlIGludGVybGVhdmVkIGFjcm9zcwpAQCAtMzkxLDkg
KzM5Miw5IEBAIF9fZnV0ZXhfaGFzaCh1bmlvbiBmdXRleF9rZXkgKmtleSwgc3RydWN0IGZ1dGV4
X3ByaXZhdGVfaGFzaCAqZnBoLCBzdHJ1Y3QgZnV0ZXhfCiAJCSAqIE5PVEU6IHRoaXMgaXNuJ3Qg
cGVyZmVjdGx5IHVuaWZvcm0sIGJ1dCBpdCBpcyBmYXN0IGFuZAogCQkgKiBoYW5kbGVzIHNwYXJz
ZSBub2RlIG1hc2tzLgogCQkgKi8KLQkJbm9kZSA9IHJ1bnRpbWVfY29uc3Rfc2hpZnRfcmlnaHRf
MzIoaGFzaCwgX19mdXRleF9zaGlmdCkgJSBucl9ub2RlX2lkczsKLQkJaWYgKCFub2RlX3Bvc3Np
YmxlKG5vZGUpKSB7Ci0JCQlub2RlID0gZmluZF9uZXh0X2JpdF93cmFwKG5vZGVfcG9zc2libGVf
bWFwLmJpdHMsIG5yX25vZGVfaWRzLCBub2RlKTsKKwkJbm9kZSA9IHJlY2lwcm9jYWxfc2NhbGUo
aGFzaCwgbm9kZV9saW1pdCk7CisJCWlmICghbm9kZV9wb3NzaWJsZShub2RlKSkgeworCQkJbm9k
ZSA9IGZpbmRfbmV4dF9iaXRfd3JhcChub2RlX3Bvc3NpYmxlX21hcC5iaXRzLCBub2RlX2xpbWl0
LCBub2RlKTsKIAkJfQogCX0KIApJIGRvbid0IHRoaW5rIGl0IGlzIHdvcnNlLCBJIGhhcmRseSBz
ZWUgYSBjaGFuZ2UgcGVyZiB3aXNlLiBTb21ldGltZXMKb3AvcyBpcyByZXBvcnRlZCBhbG1vc3Qg
dW5jaGFuZ2VkLCBzb21ldGltZXMgaXQgaW1wcm92ZXMgYSBiaXQuCgpXaGF0IGl0IGRvZXMgaXQg
cmVhZHMgbnJfbm9kZV9pZHMgb25seSBvbmNlICh3aGljaCBoYXMgbm8gZWZmZWN0IGhlcmUKYmVj
YXVzZSBJIGhhdmUgbm8gc3BhcnNlIG5vZGUpIGFuZCBpdCByZXBsYWNlcyB0aGUgc2hpZnQgKyBk
aXZsIHdpdGgKaW11bHEgKyBzaGlmdC4KCnBlcmYgd2FzIHBvaW50aW5nIG1lIHRvIHRoZSBkaXZs
IGJ1dCBub3cgaXQgcG9pbnRzIHRvIHRoZSBpbXVscS4Kwq9cXyjjg4QpXy/CrwoKQnV0IGhhdmlu
ZyB0aGF0IGRpdiBnb25lLCBjYW4ndCBiZSBiYWQsIGNhbiBpdD8KClNlYmFzdGlhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
