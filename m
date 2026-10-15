Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885ABCC6B3A
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1QXHNUc8OngmM26Uj11keCHwSX5K8GOik1GytwcMbM=; b=KjIFu5igowkcfz
	1Qdx+1ALY8n76dfRaqP1vrAOrRlTb9XCM2GWnkDNuUZzCjUuguwAW7RCGbHr1wNtH7rzKkPyoyRuP
	nKfmg72/WDK5te0kMg+wydGvZ8lILF1E+0TxJq9BGkYp4H2XT7gp8Rr8W8omwdgU3q75s8FbfPrBE
	gBQjTmWdh8hPYxLzOMRwUD+Qi+JXBMiVh/gHOvZVT+E7ZQixwcHRSSPC6NXTFfojLVh+osBMZI2Pr
	pZY0nohFh4jMVH4kmbQoik7NdEcY+q5zWYPI+3RXiF4umnTdcFJVYn6PDotUTNCYvlzGrN8ps3cY+
	AOkXEvmDenlQVbtjUMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOAz-00000000oej-0FtL;
	Thu, 15 Oct 2026 16:19:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOAx-00000000oeT-3WsP
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 16:19:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F4841B4D;
	Thu, 15 Oct 2026 16:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2D51F000C5;
	Thu, 15 Oct 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792081167;
	bh=PIBFLItZ4V5cAmzj5Xcdj2gfvndzkJvcHnICXv18F7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IusWLQXaauc+8BtXqJ61en+ufethH6O9W4ytYQl05XQMjEAXiLInOFCIreQ0iH0Cf
	 RHbCW8+ZGEcIfbF1BqlBf7s97c0e4pubOQ5nbAudRRfY3hf9EZ9yRBmY8smeXMQBNf
	 bs01L0Sp9/imv7mhcQlntYfkG83ybNr4+kA0EvW+d+l9DIplS5ybMpyX927cdLTPXR
	 Ypk/DnzzssqynODPSIE4SyvwIgH5TE95Foq/CSczP6pAsewPnI37MAmGHfzwGbDWFq
	 mGKNoDYeRU+Rzo3VEMDVM83wlBnOOHl3q+CS7YpSgJCAcaalDYdXMJik6A608zGiX1
	 +ZGUI9D7GTFfw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Pre-allocate module page tables for execmem
In-Reply-To: <20261015033643.84972-1-kmehltretter@gmail.com>
References: <20261015033643.84972-1-kmehltretter@gmail.com>
Date: Thu, 15 Oct 2026 18:19:24 +0200
Message-ID: <87a4of5437.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

S2FybCBNZWhsdHJldHRlciA8a21laGx0cmV0dGVyQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBSVjY0
IHByZS1hbGxvY2F0ZXMgcGFnZS10YWJsZSBsZXZlbHMgZm9yIGxhdGUga2VybmVsIG1hcHBpbmdz
LiBUaGUgbW9kdWxlCj4gcmFuZ2UgaXMgZ3VhcmRlZCBieSBDT05GSUdfTU9EVUxFUywgYWx0aG91
Z2ggZXhlY21lbSBjYW4gdXNlIGl0IHdpdGhvdXQKPiBtb2R1bGVzLgo+Cj4gV2l0aCBDT05GSUdf
QlBGX0pJVD15IGFuZCBDT05GSUdfTU9EVUxFUz1uLCBleGVjbWVtIGFkZHMgYSBtYXBwaW5nIHRv
Cj4gaW5pdF9tbSB3aGlsZSB0aGUgY3VycmVudCBwcm9jZXNzIHJldGFpbnMgYW4gZW1wdHkgUEdE
IGVudHJ5LiBJbml0aWFsaXppbmcKPiBhIEJQRiBwcm9ncmFtIHBhY2sgdGhlbiBmYXVsdHM6Cj4K
PiAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IC4uLgo+ICAgW2ZmZmZm
ZmZmNzgwMDAwMDBdIHBnZD0wMDAwMDAwMDAwMDAwMDAwCj4gICAuLi4KPiAgIGJwZl9qaXRfZmls
bF9ob2xlX3dpdGhfemVybwo+ICAgYnBmX3Byb2dfcGFja19hbGxvYwo+Cj4gVXNlIENPTkZJR19F
WEVDTUVNIGZvciB0aGUgbW9kdWxlLXJhbmdlIHByZS1hbGxvY2F0aW9uLCBhcyBwb3dlcnBjIGRv
ZXMKPiBmb3IgaXRzIGV4ZWNtZW0gcGFnZS10YWJsZSBzZXR1cC4gQm90aCBDT05GSUdfTU9EVUxF
UyBhbmQgQ09ORklHX0JQRl9KSVQKPiBzZWxlY3QgaXQuCj4KPiBGaXhlczogMmM5ZTVkNGEwMDgy
ICgiYnBmOiByZW1vdmUgQ09ORklHX0JQRl9KSVQgZGVwZW5kZW5jeSBvbiBDT05GSUdfTU9EVUxF
UyBvZiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBBc3Npc3RlZC1ieTogTExNCj4g
U2lnbmVkLW9mZi1ieTogS2FybCBNZWhsdHJldHRlciA8a21laGx0cmV0dGVyQGdtYWlsLmNvbT4K
ClRZIQoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
