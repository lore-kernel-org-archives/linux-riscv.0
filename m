Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11272C5CFEB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3TrOYKwpi6AAw4le6jugsLQAtuoq7LtBreNE5y3MOg=; b=aERZs6BxBDIKXh
	xtc3orvYRZ2k09Xph7lQR3+TDo4ywR9xxGtbAT5IoKlhm5iVS7K60htk5mKMxLtqs7aFPuG1j829Y
	auKeXeSTnqVKzdH8mfEbZkHcFtLVH0/IqKmYIVbA0kXlciSgMgf/pFS2gzNvYOLk0QkPN6cLXimAg
	+VwsTl/BKKCmcjjJ6MJHWIi8fkk1yp4aNa+8rh2AeR3FekWhe8a9Ur1RIqg2VGyuIIeqMN6x0iSkc
	icfNHBGN+TAbVe8pRdARt/e3BrJuok7yYbFJgwQH753gJOPfrxdHVFKFBN2eREsWUG4LzCsSQk/C5
	mIpp1J7NjFlf0hjfFtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOaR-0000000HSfp-3V08;
	Thu, 13 Aug 2026 06:06:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOaQ-0000000HSfZ-1wAv;
	Thu, 13 Aug 2026 06:06:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2042F41649;
	Thu, 13 Aug 2026 06:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2EA1F000E9;
	Thu, 13 Aug 2026 06:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786601201;
	bh=2bRU4db2xtFcGOhDIJOKkQ4ShBGU9e2BMEUZzod3loM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WepnVrP8FwDHztG5a+pL5+vdR+Cg8T4y90PcZBh/rlnZNWLRLfnDWWRxVJvS0+crZ
	 lh7fpDVlbqh/6qvpmhacKyRBEAArsqvbDDRNZsTZ84+InSYC+LQE/2ApqTgrggsNhH
	 YhxB5J0+AVZSQsk4LoO4+RjU9GDi4VJ7LjJUaYY3sLwr0c5vz/7/bRPur4asCQDR1r
	 cNVYLKjWL4z4LWF+Z0JghcCDVi9WN26c7VGLvxJXgFSrnHhF5fGl1dbGiWnRcm8sU1
	 SI1/W2qha+159VhpFETiKxPs27GXkyYyN7ajSyXNSy7VOA36iIT+UpNy1PI2kQZa1m
	 WhxFEX5ERcXyQ==
Date: Thu, 13 Aug 2026 08:06:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	jingoohan1@gmail.com, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/16] PCI: dwc: Use cached PCIe capability offset in
 core
Message-ID: <ps2qzgcb5lixkoqz2xbofdurkgmsiojg7e5ueqfdhyissqvzf2@tuderrjgzg6b>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-3-18255117159@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720150619.24733-3-18255117159@163.com>
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

T24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMTE6MDY6MDVQTSArMDgwMCwgSGFucyBaaGFuZyB3cm90
ZToKPiBNb2RpZnkgdGhlIERXQyBjb3JlIGZ1bmN0aW9ucyB0byB1c2UgdGhlIGNhY2hlZCBwY2ll
X2NhcCBvZmZzZXQgaW5zdGVhZAo+IG9mIGNhbGxpbmcgZHdfcGNpZV9maW5kX2NhcGFiaWxpdHko
KSBlYWNoIHRpbWUuCj4gCj4gSW4gdGhlIERXQyBjb3JlLCBkd19wY2llX2ZpbmRfY2FwYWJpbGl0
eSgpIGlzIGNhbGxlZCBhdCBzZXZlcmFsIGxvY2F0aW9uczoKPiAtIGR3X3BjaWVfZXBfaW5pdF9u
b25fc3RpY2t5X3JlZ2lzdGVycygpCj4gLSBkd19wY2llX3dhaXRfZm9yX2xpbmsoKQo+IC0gZHdf
cGNpZV9saW5rX3NldF9tYXhfc3BlZWQoKQo+IC0gZHdfcGNpZV9saW5rX2dldF9tYXhfbGlua193
aWR0aCgpCj4gLSBkd19wY2llX2xpbmtfc2V0X21heF9saW5rX3dpZHRoKCkKPiAKPiBUaGUgY2Fj
aGVkIG9mZnNldCBpcyBpbml0aWFsaXplZCBhZnRlciBoYXJkd2FyZSBpcyByZWFkeToKPiAtIElu
IGhvc3QgbW9kZTogZHdfcGNpZV9ob3N0X2luaXQoKSBjYWxscyBwcC0+b3BzLT5ob3N0X2luaXQo
KSAoZW5hYmxlcwo+ICAgY2xvY2tzL3Jlc2V0cyksIHRoZW4gZHdfcGNpZV9nZXRfcGNpZV9jYXAo
KSBjYWNoZXMgdGhlIG9mZnNldC4KPiAtIEluIGVuZHBvaW50IG1vZGU6IHRoZSBjb3JlIG5vIGxv
bmdlciBjYWNoZXMgYXV0b21hdGljYWxseS4gSW5zdGVhZCwKPiAgIGRyaXZlcnMgbXVzdCBjYWxs
IGR3X3BjaWVfZ2V0X3BjaWVfY2FwKCkgYWZ0ZXIgaGFyZHdhcmUgaXMgZW5hYmxlZAo+ICAgKGUu
Zy4sIGFmdGVyIFBFUlNUIyBkZWFzc2VydCkuCgpCdXQgeW91IGRpZG4ndCBtb2RpZnkgYWxsIERX
QyBFUCBkcml2ZXJzIHRvIGNhbGwgZHdfcGNpZV9nZXRfcGNpZV9jYXAoKS4gVGhpcwpjYW4gbGVh
ZCB0byBwY2llX2NhcCBiZWluZyAwLgoKPiBkd19wY2llX2VwX2luaXRfbm9uX3N0aWNreV9yZWdp
c3RlcnMoKQo+ICAgaXMgY2FsbGVkIGFmdGVyIHRoYXQgcG9pbnQsIHNvIGl0IGNhbiBzYWZlbHkg
dXNlIHBjaS0+cGNpZV9jYXAuCj4gCj4gZHdfcGNpZV9lcF9pbml0X25vbl9zdGlja3lfcmVnaXN0
ZXJzKCkgbm93IGFzc3VtZXMgcGNpLT5wY2llX2NhcCBpcwo+IHZhbGlkLiBpZiBub3QsIGl0IHBy
aW50cyBhIHdhcm5pbmcgYW5kIHNraXBzIHRoZSBvcGVyYXRpb24uCgpXaGVyZSBpcyB0aGlzIHdh
cm5pbmcgcHJpbnRlZD8KClRoZXNlIGFyZSBhbHJlYWR5IHBvaW50ZWQgb3V0IGJ5IFNhc2hpa28u
IFlvdSBzaG91bGQgZ28gcmVhbGx5IGdvIHRocm91Z2ggYWxsIG9mCnRoZW0gKG5vdCB0aGUgcHJl
LWV4aXN0aW5nIGlzc3VlcykgYW5kIGNvbW1lbnQgd2hldGhlciB0aGUgaXNzdWVzIGFyZSB2YWxp
ZCBvcgpmYWxzZSBwb3NpdGl2ZS4gRm9yIGEgc2VyaWVzIHRvdWNoaW5nIG1hbnkgY29udHJvbGxl
ciBkcml2ZXJzLCB0aGlzIGlzIG5lY2Vzc2FyeQp0byBhdm9pZCBpbnRyb2R1Y2luZyByZWdyZXNz
aW9ucy4KCkknbSBub3QgZ29pbmcgdG8gbWVyZ2UgdGhpcyBzZXJpZXMgdW50aWwgeW91IGZpeCB0
aGUgcmVhbCBpc3N1ZXMgU2FzaGlrbwpyZXBvcnRlZCBvciBtYXJrIHRoZW0gYXMgZmFsc2UgcG9z
aXRpdmUgaWYgbm90IHZhbGlkLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p
4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
