Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A9CC982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEy3lrKnANxVFtZy8L/m3XhXppKztMIanXBDOw/yPPY=; b=YrBPmbzvEr3lbs
	qrpnOc44+kpcSI+NYtK2ErT2xKbgL+ADytm+TDz9RxtFSZmCZWxZpZmc0B8eZ7KBnH1xkNI/TC7+k
	dp96gjJ0mpnh/Dgb3QpoNE/0LT0xHUp5S29QC7amrFiJem7+MJwMMHc3TElfTfVBJqtHRBqwS/oOy
	Lvna+yp9k0+TkF6C62aG4/pJh7MaalJo8ucAJUbP9AAdDvvwCVcpZIIfN4lkJoj+57W9eL4NjNQct
	oyK9vL14mpnLMEs8O0CqB9F5WhnSnJ5G4rQD6kbtl5oC/TeGvbxaRBtqggXErxIKR9YgUuR1cQrsS
	cYerNv7Cru1GrNnB+zcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wJB-00000004nQJ-2onA;
	Tue, 22 Sep 2026 08:57:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wJA-00000004nOt-2C3T;
	Tue, 22 Sep 2026 08:57:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE3FF60200;
	Tue, 22 Sep 2026 08:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2B61F000FF;
	Tue, 22 Sep 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067419;
	bh=mB6ArwwQWi63lnnyZnmc+lp1xXlr6Q+TPr+ON6lhHYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MNL3Xnb6CWnvvGBDK0J3Mn0L4qOeZ5nvv4L3x8jvkBkxrp+xGTSpgMrYwk4JgC2qV
	 9snp/rxfK9DTTpliyaHgkmJRoQKO6yZng3MZ6TCOmCZ58SkJbHD1AciwzYV1jmDP9T
	 weoFRPO5s+q4kbuS/2JkjIJQyufgbbc2Rqghndy+dE0HSygszhyyhX8NNsmW9OjjAj
	 q+tsmsriKvocNa9XHt90euPbTjKxci4T0s7RA5tQyjpgnP73fjR4Hujl2c4Pj+FV14
	 8I9/nRiLjvKtECSEKKdVfBZYG4utyvcEnX34gjuFlutbaLSf/Zs2/9fYZO95zimVOh
	 hT83kc73npLCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] crash_core: replace for_each_mem_range() with
 for_each_mem_region()
To: robh@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, rppt@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, ruirui.yang@linux.dev, loongarch@lists.linux.dev, tglx@kernel.org, mingo@redhat.com, saravanak@kernel.org, iommu@lists.linux.dev, pratyush@kernel.org, conor+dt@kernel.org, dave.hansen@linux.intel.com, chenhuacai@kernel.org, aou@eecs.berkeley.edu, pjw@kernel.org, linux-arm-kernel@lists.infradead.org, pasha.tatashin@soleen.com, x86@kernel.org, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, kexec@lists.infradead.org, hpa@zytor.com, palmer@dabbelt.com, alex@ghiti.fr, mark.rutland@arm.com, will@kernel.org, kernel@xen0n.name, catalin.marinas@arm.com, bp@alien8.de, robin.murphy@arm.com, linux-mm@kvack.org, devicetree@vger.kernel.org
In-Reply-To: <20260922084256.1515554-5-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-5-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 08:56:58 +0000
Message-Id: <20260922085658.6D2B61F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBmb3JfZWFj
aF9tZW1fcmFuZ2UoKSBza2lwcyBNRU1CTE9DS19OT01BUCByZWdpb25zIGltcGxpY2l0bHkuIFN3
aXRjaCB0aGUKPiB3ZWFrIGRlZmF1bHRzIHRvIGZvcl9lYWNoX21lbV9yZWdpb24oKSwgd2hpY2gg
ZXhwb3NlcyBzdHJ1Y3QKPiBtZW1ibG9ja19yZWdpb24gYW5kIHBlci1yZWdpb24gZmxhZ3MsIGFu
ZCBmaWx0ZXIgTk9NQVAgcmVnaW9ucyBleHBsaWNpdGx5Cj4gdmlhIHRoZSBuZXcgY3Jhc2hfc2hv
dWxkX3NraXBfcmVnaW9uKCkgaGVscGVyLiBUaGlzIHByZXBhcmVzIGZvciBhCj4gc3Vic2VxdWVu
dCBwYXRjaCB0byBleHRlbmQgdGhlIHNraXAgZmlsdGVyLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcu
Y29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91bmQgbm8gaXNzdWVz
LiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjIwODQyNTYuMTUxNTU1NC0xLWNoZW53YW5kdW4xQGdt
YWlsLmNvbT9wYXJ0PTQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
