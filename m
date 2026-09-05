Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B7FC624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek5LeN9xoRqzwfGTYENw6Ya7pS5llg0knSq+mGEq5EY=; b=eZQOBkzoRzl/uz
	f5KNNm5UdJEegGrcmSj7H6uBLlexKZVwTyB13IiNhrta8R+vinZTMmU0AuVQOwITpdmgRay/PSyjx
	qvEee7GhRs7+do9cumGgWQCgZ8esxz/56e5u5xESlPWk28ZBifLVziECPCMAmcqHpD9VPkoIFUElB
	sLpAK+6ADBj3SMFpLa7ESS6Vk4zbas7SgsRaAcgqMHriWJrs0DzfAYu+Rjwfhpk1LMOfsZIysu0Dq
	19E2rAwzIIClHbknraScdsQTDptA9tHslY0OuXhuUA+G7/4PgNlK2fXEim+O3s4XAmfValVMr1NqK
	3FiCUWujDx6UqdJfpQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sjw-00000004FAY-3nOY;
	Sat, 05 Sep 2026 15:55:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sjv-00000004FAQ-2IgO
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 15:55:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 744CB601DB;
	Sat,  5 Sep 2026 15:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F431F00A3A;
	Sat,  5 Sep 2026 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788623734;
	bh=ZbTROn2XMJRinRQck/0z8ofFxMzsslytuT8P6jNEoSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0+pBOdg9C1mFoFBbVYhln7tAYR2LncMzHVU3jfXsccjpJQ6V7PGuRUfZN7ZFQFkA
	 v1KS5MtKOcjN5C5/pHQaPV3gw1NIzOUVkZpk+s0dKiD96m3vq5KLiFXyvZWOsuxc7m
	 bPYSjQ6ueB5et8T/8e+KYMf+6g9MtRf7ahP3gQeJj7MfyX+MasWU0n8nj8AwA6caQc
	 yr5nEUfPyZk7HrQ4dEp7yrqUk0DToZSgPC27sQVLOSp7g3r8cXtjdXv34fKu1EJmWT
	 NiNpoeiqP3DAkamwRgKHMgJmbOwz+uyBKM38QWK1ZTgB7FuYe7gZ8wKgHJ7OwMsdkW
	 2psCuITcFfaUg==
Date: Sat, 5 Sep 2026 17:55:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yu Ning <ningyu@eswincomputing.com>, 
	Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Message-ID: <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
References: <20260905134251.67210-1-hppiscas@163.com>
 <apwrUYd3VybxbAm7@nickhuang>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apwrUYd3VybxbAm7@nickhuang>
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

T24gU2F0LCBTZXAgMDUsIDIwMjYgYXQgMDI6NDY6NDFQTSArMDAwMCwgTmljayBIdWFuZyB3cm90
ZToKPiBPbiBTYXQsIFNlcCAwNSwgMjAyNiBhdCAwOTo0Mjo1MVBNICswODAwLCBocHAuaXNjYXMg
d3JvdGU6Cj4gPiBUaGUgRVNXSU4gUENJZSBob3N0IGNvbnRyb2xsZXIgaXMgYSBwbGF0Zm9ybSBk
cml2ZXIgbWF0Y2hlZCB0aHJvdWdoCj4gPiBlc3dpbl9wY2llX29mX21hdGNoLiBQQ0lFX0VTV0lO
IGlzIHRyaXN0YXRlLCBidXQgdGhlIHRhYmxlIGlzIG5vdAo+ID4gcHVibGlzaGVkIGZvciBPRiBt
b2R1bGUgYXV0b2xvYWRpbmcuCj4gPiAKPiA+IFB1Ymxpc2ggdGhpcyBwbGF0Zm9ybS1kZXZpY2Ug
dGFibGUuIERvIG5vdCBjaGFuZ2UgdGhlIFJJU0MtViBob3N0Cj4gPiBpbml0aWFsaXphdGlvbiBz
ZXF1ZW5jZSBvciBQQ0kgZGV2aWNlIG1hdGNoaW5nLgo+ID4gCj4gPiBGaXhlczogYjU5M2MyNmQw
ODFhICgiUENJOiBlc3dpbjogQWRkIEVTV0lOIFBDSWUgUm9vdCBDb21wbGV4IGRyaXZlciIpCj4g
PiBTaWduZWQtb2ZmLWJ5OiBocHAuaXNjYXMgPGhwcGlzY2FzQDE2My5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWVzd2luLmMgfCAxICsKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZXN3aW4uYwo+ID4gaW5kZXggY2U4ZDY0Zi4uMWJiNDQ2OSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYwo+ID4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1lc3dpbi5jCj4gPiBAQCAtMzg4LDYgKzM4OCw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGVzd2luX3BjaWVfb2ZfbWF0Y2hb
XSA9IHsKPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJlc3dpbixlaWM3NzAwLXBjaWUiLCAuZGF0YSA9
ICZlc3dpbl9laWM3NzAwX2RhdGEgfSwKPiA+ICAJe30KPiA+ICB9Owo+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIGVzd2luX3BjaWVfb2ZfbWF0Y2gpOwo+ID4gIAo+ID4gIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGVzd2luX3BjaWVfZHJpdmVyID0gewo+ID4gIAkucHJvYmUgPSBl
c3dpbl9wY2llX3Byb2JlLAo+ID4KPiBIaSBocHAuaXNjYXMKPiAKPiBTaW5jZSB0aGlzIGRyaXZl
ciB1c2VzIGBidWlsdGluX3BsYXRmb3JtX2RyaXZlcihlc3dpbl9wY2llX2RyaXZlcilgLCBpdAo+
IGFwcGVhcnMgdG8gYmUgYnVpbHQtaW4gb25seS4gSW4gdGhhdCBjYXNlLCBgTU9EVUxFX0RFVklD
RV9UQUJMRSgpYCBzZWVtcwo+IHVubmVjZXNzYXJ5Lgo+IAoKTm9wZS4gYnVpbHRpbl9wbGF0Zm9y
bV9kcml2ZXIoKSBvbmx5IHByZXZlbnRzIHJlbW92aW5nIHRoZSBkcml2ZXIgb25jZSBsb2FkZWQu
ClNpbmNlIHRoZSBkcml2ZXIgaXMgZGVmaW5lZCBhcyAndHJpc3RhdGUnIGluIEtjb25maWcsIGl0
IGNhbiBzdGlsbCBiZSBsb2FkZWQKZHluYW1pY2FsbHkuIFNvIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
KSB3b3VsZCBzdGlsbCBiZSBuZWNlc3NhcnkgZm9yIHVkZXYgdG8KYXV0b2xvYWQgdGhlIG1vZHVs
ZSBiYXNlZCBvbiBtb2RhbGlhcy4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+Cu
qeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
