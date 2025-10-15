Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F48CCD193
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 01:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtFizwriwEWklKTOknna/aefvED0l5A/SQeqqsz9i5Q=; b=lSDGviO3tFH2ak
	RxPKffuw3Nc2FjwrTllHb06XFhpSkbyofJ2gqvuB7c8LXLimGvYQE4Z0klKrWTIlb6/1tsGjUnjqI
	Ln6y2dIx9tiSlXnroqqMY7ErZb4EZlRnQGVoFFbCAElxIqlg4VFmyWi1b+Hz/xNyc3LYg77kvTrPN
	3QU1r6mmvcO7sc9C1vB2NkG51lazpWwxA/Lfd09ueskcI++xmuN63spQGdIGhu4sw5gHZuPA8KNrI
	af+Xrjm6KkRrf+5VTtX2k9aoM7JadAonFQ6Q6ZpxKhBAmmd4MtyKNgjqVVh4sNGaIDtHgv38y/Yaj
	ZcjTE+0OJnjHsUH11vYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pzD-000000008SX-2jUp;
	Wed, 15 Oct 2025 01:07:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pzC-000000008SO-3Yc5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 01:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A7962460
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1811C113D0
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760490445;
	bh=xY+ze6fHA9Rf3jL29Ykl6MCDANvjndaE04zu8qEa1RI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ut80++C5Y6q/VNJaxhej2OETDFw+mq1fB5/cYtaeiAks2W8s4TcYaGOujT4dHwaxn
	 y78aqX4dic8bvDKdSN4cSH+G4ChrhKyelLlJrpNfEjMz6cVlEZ6sq6LzgWTG9fJRPn
	 URYNCsr58HdNwIJ4KReP2klU/leUOjPeEdNNfkfNDAtlE0qO98ZxEKf0lDgvLeBbCo
	 mB4TddbmbVtZB5k489Hd5URmoivQ+2SamfH3ZIBP+ix1udtz1nWEmOTGNPWody3fNF
	 u1x8GoJPFD/Zwtsh8bmpimeYh56hq2aSA8tkkJcCFybfY3mEp6pOlXHcWIhJEEmGJP
	 E2e1DRNFViSEQ==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso4382978f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 18:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyGNOFOe6p2q7W8HkXxnEy5ibs9wqlPko4TSvrj4oAtu+vaOiBHiSKfFXEBwdgU6gA1t5+dV9qM14Sew==@lists.infradead.org
X-Gm-Message-State: AOJu0YywliYsXnhfFzBiY30M/fS0LYVq/gg7UDbpmhCN6nA2ZxgYFqlL
	f7z7hrUI4mCyurZMh5ds+erjhBgvQboM+7/8gMtSW4ftfPrL0iwvJzJn7xrlNjbpfTnCMs0m4QG
	MMkBtTQRkW1XsLWdmUWjCLOqd7dc5uCY=
X-Google-Smtp-Source: AGHT+IHwvormcZdElu5C7IsFzc0BjjpZQylsJXFDkKp7gK1zxNAzYaPTNmtdqtw+AnNzsoYEYdgRm0mjKHqOEWalWaw=
X-Received: by 2002:a05:6000:25c6:b0:3ee:1118:df7d with SMTP id
 ffacd0b85a97d-4266e8de439mr17402019f8f.47.1760490444460; Tue, 14 Oct 2025
 18:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251014131032.49616-1-ziyao@disroot.org> <20251014131032.49616-6-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-6-ziyao@disroot.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 15 Oct 2025 09:07:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQ-F6nBWV0ZTsFFsHATBAPQO=hjC1Gws+=+_x7yWGQnA@mail.gmail.com>
X-Gm-Features: AS18NWAr2bxoHiZNoK45bPhaq7a9ecYsouPhzbOoevcye2nhg_fXbJNYwcxyQIA
Message-ID: <CAJF2gTSQ-F6nBWV0ZTsFFsHATBAPQO=hjC1Gws+=+_x7yWGQnA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more
 subsystems for TH1520
To: Yao Zi <ziyao@disroot.org>
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgOToxMuKAr1BNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5v
cmc+IHdyb3RlOgo+Cj4gRGVzY3JpYmUgcmVzZXQgY29udHJvbGxlcnMgZm9yIFZJLCBNSVNDLCBB
UCwgRFNQIGFuZCBBTyBzdWJzeXN0ZW1zLiBUaGUKPiBvbmUgZm9yIEFPIHN1YnN5c3RlbSBpcyBt
YXJrZWQgYXMgcmVzZXJ2ZWQsIHNpbmNlIGl0IG1heSBiZSB1c2VkIGJ5IEFPTgo+IGZpcm13YXJl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFvIFppIDx6aXlhb0BkaXNyb290Lm9yZz4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDM3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gaW5kZXggZTY4MGQxYTdjODIxLi4xNWQ2
NGVhZWE4OWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAu
ZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiBAQCAt
Mjc3LDYgKzI3NywxMiBAQCBjbGludDogdGltZXJAZmZkYzAwMDAwMCB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1M19pbnRjIDM+LCA8JmNwdTNf
aW50YyA3PjsKPiAgICAgICAgICAgICAgICAgfTsKPgo+ICsgICAgICAgICAgICAgICByc3Rfdmk6
IHJlc2V0LWNvbnRyb2xsZXJAZmZlNDA0MDEwMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJ0aGVhZCx0aDE1MjAtcmVzZXQtdmkiOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweGZmIDB4ZTQwNDAxMDAgMHgwIDB4OD47Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICB9Owo+ICsKPiAg
ICAgICAgICAgICAgICAgc3BpMDogc3BpQGZmZTcwMGMwMDAgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLXNwaSIsICJzbnBzLGR3LWFwYi1zc2ki
Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZTcwMGMwMDAgMHgwIDB4
MTAwMD47Cj4gQEAgLTUwMiw2ICs1MDgsMTggQEAgdWFydDI6IHNlcmlhbEBmZmVjMDEwMDAwIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgICAgICAg
ICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgIHJzdF9taXNjOiByZXNldC1jb250cm9sbGVy
QGZmZWMwMmMwMDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhl
YWQsdGgxNTIwLXJlc2V0LW1pc2MiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eGZmIDB4ZWMwMmMwMDAgMHgwIDB4MTg+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNyZXNl
dC1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAg
IHJzdF92cDogcmVzZXQtY29udHJvbGxlckBmZmVjYzMwMDAwIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1yZXNldC12cCI7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4ZmYgMHhlY2MzMDAwMCAweDAgMHgxND47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Owo+ICsgICAgICAgICAgICAgICB9
Owo+ICsKPiAgICAgICAgICAgICAgICAgY2xrOiBjbG9jay1jb250cm9sbGVyQGZmZWYwMTAwMDAg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLWNs
ay1hcCI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ZmYgMHhlZjAxMDAwMCAw
eDAgMHgxMDAwPjsKPiBAQCAtNTA5LDYgKzUyNywxOCBAQCBjbGs6IGNsb2NrLWNvbnRyb2xsZXJA
ZmZlZjAxMDAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+
Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgIHJzdF9hcDogcmVzZXQt
Y29udHJvbGxlckBmZmVmMDE0MDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInRoZWFkLHRoMTUyMC1yZXNldC1hcCI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4ZmYgMHhlZjAxNDAwMCAweDAgMHgxMDAwPjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAjcmVzZXQtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAg
ICAgICAgICAgICByc3RfZHNwOiByZXNldC1jb250cm9sbGVyQGZmZWYwNDAwMjggewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLXJlc2V0LWRzcCI7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ZmYgMHhlZjA0MDAyOCAweDAgMHg0
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICAjcmVzZXQtY2VsbHMgPSA8MT47Cj4gKyAgICAg
ICAgICAgICAgIH07Cj4gKwo+ICAgICAgICAgICAgICAgICBncHU6IGdwdUBmZmVmNDAwMDAwIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRoZWFkLHRoMTUyMC1ncHUi
LCAiaW1nLGltZy1ieG0tNC02NCIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJpbWcsaW1nLXJvZ3VlIjsKPiBAQCAtNjgxLDYgKzcxMSwxMyBAQCBhb2dwaW86IGdwaW8t
Y29udHJvbGxlckAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICAgICAgICAgICAg
ICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgIHJzdF9hbzogcmVzZXQtY29udHJvbGxlckBmZmZm
ZjQ0MDAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRoZWFkLHRo
MTUyMC1yZXNldC1hbyI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ZmYgMHhm
ZmY0NDAwMCAweDAgMHgyMDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAjcmVzZXQtY2Vs
bHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gInJlc2VydmVkIjsK
PiArICAgICAgICAgICAgICAgfTsKPiArCj4gICAgICAgICAgICAgICAgIHBhZGN0cmxfYW9zeXM6
IHBpbmN0cmxAZmZmZmY0YTAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ0aGVhZCx0aDE1MjAtcGluY3RybCI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4ZmYgMHhmZmY0YTAwMCAweDAgMHgyMDAwPjsKPiAtLQo+IDIuNTAuMQo+CkxHVE0hCgpB
Y2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
