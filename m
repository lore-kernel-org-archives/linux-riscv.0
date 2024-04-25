Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F51C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jD4xbzPyv4FrRO5kAvDXmNiGJWezmxRY5mlRX9UwMM=; b=lpto0e/vx4PtJ0
	tXa7Avg1/gF5NGGeIyPEm2INQeSYGgeIPF+ga4m7LHRRqXiSLIYHtFKR0aAIaOpN/TldyrY/8e6X6
	SaSECJfNgyN4SMuMk5Sb7tHRb6Uk+cOOH1bKYKRbCbQTsHJTUtmjAM8yMw8sTjf9T4u3UPHGSSXMz
	PvfXtYhbuasWO8S6Cr/1unSYuOAgltN47MY68SmXURORKnMWjc7E6rtlBnssUWdL5KE2A6q/cH6+V
	xhUPvgJzlgmeI0gRpwyk1Dp6xv5cvK0s0tkInFAsRZyvy14gSOpv7la2AfXLxBs1GSWvNZ9bFnlu6
	UHZfaBR3ua+RXUdAlhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxeG-000000084o7-3c9j;
	Thu, 25 Apr 2024 11:52:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxeC-000000084n4-10Au
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 11:52:19 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1714045930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fibyo5fIycycuHzgFLgvHTjArYf2fAIDmOJSGGnfeGs=;
	b=Kadmz8lAwQLU3paaGZBH65Tjdo3KhzmylFuE02Dqc7LTfpnpfS3GfwxvL1yyQGORNj17EC
	V+McuIKS7D0dxVPn3HBxgZd+D8kdby9OBv0FlQDAiCv4EiVxCvaAGQkbNtsbk9nCp1SHhN
	ditgLrxqv7LYyRUkOCd9fvSf0B+2eRN7bbf2pSKWK/I0ZoTuORnXruLjq3mmIaCzmi3bpP
	g5EYyjly4N7X9EIIFFWKmmXJYGEHXGFz3R8at4BrejfxGE4eLd6zROXFgm6g2xKQKi2Lg1
	+s9dmyG0/YgbtpqP4Pe2Mva5mxCyJZXL9dmsMThEI8py4tcqac7YdGExA6nSHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1714045930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fibyo5fIycycuHzgFLgvHTjArYf2fAIDmOJSGGnfeGs=;
	b=ZnFBdGswK+ol1V8O6CB2quAGkSrJbxl+WNQir6NbIJkdiz+PDXH5C9go+QLzuDZ5g2kBW8
	aLndt7NlV0MzdbBw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: fix overlap of allocated page and PTR_ERR
Date: Thu, 25 Apr 2024 13:52:01 +0200
Message-Id: <20240425115201.3044202-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_045216_441361_3D8A4301 
X-CRM114-Status: GOOD (  15.47  )
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

T24gcmlzY3YzMiwgaXQgaXMgcG9zc2libGUgZm9yIHRoZSBsYXN0IHBhZ2UgaW4gdmlydHVhbCBh
ZGRyZXNzIHNwYWNlCigweGZmZmZmMDAwKSB0byBiZSBhbGxvY2F0ZWQuIFRoaXMgcGFnZSBvdmVy
bGFwcyB3aXRoIFBUUl9FUlIsIHNvIHRoYXQKc2hvdWxkbid0IGhhcHBlbi4KClRoZXJlIGlzIGFs
cmVhZHkgc29tZSBjb2RlIHRvIGVuc3VyZSBtZW1ibG9jayB3b24ndCBhbGxvY2F0ZSB0aGUgbGFz
dCBwYWdlLgpIb3dldmVyLCBidWRkeSBhbGxvY2F0b3IgaXMgbGVmdCB1bmNoZWNrZWQuCgpGaXgg
dGhpcyBieSByZXNlcnZpbmcgcGh5c2ljYWwgbWVtb3J5IHRoYXQgd291bGQgYmUgbWFwcGVkIGF0
IHZpcnR1YWwKYWRkcmVzc2VzIGdyZWF0ZXIgdGhhbiAweGZmZmZmMDAwLgoKUmVwb3J0ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvODc4cjFpYnBkbi5mc2ZAYWxsLnlvdXIuYmFzZS5hcmUuYmVs
b25nLnRvLnVzCkZpeGVzOiA3NmQyYTA0OTNhMTcgKCJSSVNDLVY6IEluaXQgYW5kIEhhbHQgQ29k
ZSIpClNpZ25lZC1vZmYtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgpDYzogPHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyMSArKysr
KysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jCmluZGV4IDk2ODc2MTg0MzIwMy4uN2M5ODU0MzViM2ZjIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMjM1
LDE4ICsyMzUsMTkgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKIAkJ
a2VybmVsX21hcC52YV9wYV9vZmZzZXQgPSBQQUdFX09GRlNFVCAtIHBoeXNfcmFtX2Jhc2U7CiAK
IAkvKgotCSAqIG1lbWJsb2NrIGFsbG9jYXRvciBpcyBub3QgYXdhcmUgb2YgdGhlIGZhY3QgdGhh
dCBsYXN0IDRLIGJ5dGVzIG9mCi0JICogdGhlIGFkZHJlc3NhYmxlIG1lbW9yeSBjYW4gbm90IGJl
IG1hcHBlZCBiZWNhdXNlIG9mIElTX0VSUl9WQUxVRQotCSAqIG1hY3JvLiBNYWtlIHN1cmUgdGhh
dCBsYXN0IDRrIGJ5dGVzIGFyZSBub3QgdXNhYmxlIGJ5IG1lbWJsb2NrCi0JICogaWYgZW5kIG9m
IGRyYW0gaXMgZXF1YWwgdG8gbWF4aW11bSBhZGRyZXNzYWJsZSBtZW1vcnkuICBGb3IgNjQtYml0
Ci0JICoga2VybmVsLCB0aGlzIHByb2JsZW0gY2FuJ3QgaGFwcGVuIGhlcmUgYXMgdGhlIGVuZCBv
ZiB0aGUgdmlydHVhbAotCSAqIGFkZHJlc3Mgc3BhY2UgaXMgb2NjdXBpZWQgYnkgdGhlIGtlcm5l
bCBtYXBwaW5nIHRoZW4gdGhpcyBjaGVjayBtdXN0Ci0JICogYmUgZG9uZSBhcyBzb29uIGFzIHRo
ZSBrZXJuZWwgbWFwcGluZyBiYXNlIGFkZHJlc3MgaXMgZGV0ZXJtaW5lZC4KKwkgKiBSZXNlcnZl
IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgdGhhdCB3b3VsZCBiZSBtYXBwZWQgdG8gdmlydHVhbAor
CSAqIGFkZHJlc3NlcyBncmVhdGVyIHRoYW4gKHZvaWQgKikoLVBBR0VfU0laRSkgYmVjYXVzZToK
KwkgKiAgLSBUaGlzIG1lbW9yeSB3b3VsZCBvdmVybGFwIHdpdGggRVJSX1BUUgorCSAqICAtIFRo
aXMgbWVtb3J5IGJlbG9uZ3MgdG8gaGlnaCBtZW1vcnksIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQK
KwkgKgorCSAqIFRoaXMgaXMgbm90IGFwcGxpY2FibGUgdG8gNjQtYml0IGtlcm5lbCwgYmVjYXVz
ZSB2aXJ0dWFsIGFkZHJlc3NlcworCSAqIGFmdGVyICh2b2lkICopKC1QQUdFX1NJWkUpIGFyZSBu
b3QgbGluZWFybHkgbWFwcGVkOiB0aGV5IGFyZQorCSAqIG9jY3VwaWVkIGJ5IGtlcm5lbCBtYXBw
aW5nLiBBbHNvIGl0IGlzIHVucmVhbGlzdGljIGZvciBoaWdoIG1lbW9yeQorCSAqIHRvIGV4aXN0
IG9uIDY0LWJpdCBwbGF0Zm9ybXMuCiAJICovCiAJaWYgKCFJU19FTkFCTEVEKENPTkZJR182NEJJ
VCkpIHsKLQkJbWF4X21hcHBlZF9hZGRyID0gX19wYSh+KHVsb25nKTApOwotCQlpZiAobWF4X21h
cHBlZF9hZGRyID09IChwaHlzX3JhbV9lbmQgLSAxKSkKLQkJCW1lbWJsb2NrX3NldF9jdXJyZW50
X2xpbWl0KG1heF9tYXBwZWRfYWRkciAtIDQwOTYpOworCQltYXhfbWFwcGVkX2FkZHIgPSBfX3Zh
X3RvX3BhX25vZGVidWcoLVBBR0VfU0laRSk7CisJCW1lbWJsb2NrX3Jlc2VydmUobWF4X21hcHBl
ZF9hZGRyLCAocGh5c19hZGRyX3QpLW1heF9tYXBwZWRfYWRkcik7CiAJfQogCiAJbWluX2xvd19w
Zm4gPSBQRk5fVVAocGh5c19yYW1fYmFzZSk7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
