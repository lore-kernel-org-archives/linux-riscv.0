Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8442CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MITRf4vKb60GnFkwjqgZD4MmahZQUMsdLbFs3zdzmlk=; b=DAZ8SoYZbiytUO
	B7B7xWUXsE7f0bK2AB9KTxYKjczK2cZ345FXyoQy+v7SwbQmR1qC2QgFAKWx/nithjTApBhFHOgVW
	GerPVDAYoIh5t96seWuOyKx2fHmiFSvINhLyatsLiLcjmcQHJSRjkxXQjH9qoCSSQvVm3e4+daaJ0
	8D4iLcUfKrXYjAAz56dAvIHnPez0Ww5OS1/DIehGtFLDI+hg2EuaOlF062tMUhViU/nPf04G0mEZ8
	7oL2tnMS8qCFsK0yVuPzwE7syeaEJiLGb3/zxguP1FrDEVgk/t+kMdwfw/XeWOjMjtCV7x99QeocH
	GdqqFRiADi4vzBKUtbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shFcC-0000000EOaW-2lFq;
	Thu, 22 Aug 2024 21:45:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shFbP-0000000EOQ2-1Djz;
	Thu, 22 Aug 2024 21:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5ABA6125B;
	Thu, 22 Aug 2024 21:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396D8C32782;
	Thu, 22 Aug 2024 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724363057;
	bh=wouLQ1NMCmEgVtTZfpizED4KYxY6busZQVGhvu31U9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Xs2zFAA9+v+tdLOs3jXLguv9xMVkhnYJ59w6LWKQLse0VkgpY4n3M9GfnAqMgUxgg
	 mNQgmv2j5woLX2DsJDcZWJtxsWxnZVNLcQR3pLujkDw/ccz0d5tabsnuK/iD6TBGsB
	 t6sXdIdz+6bLGcQqNRCzCRhpIqLFDYniLxrB8/L+wpQtGPGmvs+j/2iANc7GyIs+Hl
	 cDGTOu9lQTSkUNeYComLCaJ5NUiIQBlMmJScKnb/2i64YGpmxy1cQVdiCZjBJd6vtr
	 O+bq13w1mDVy67a72wMbT+OsLDdhhGwPMprv02UfNs2rIRUeKc3Sl1v8pgSefHlAsE
	 01Ok7tLTOSowg==
Date: Thu, 22 Aug 2024 16:44:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v8 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <20240822214415.GA351762@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240812005929.113499-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_144419_439375_D194BCE6 
X-CRM114-Status: GOOD (  22.72  )
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

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDY6Mjk6MjBBTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IFJJU0MtViBwbGF0Zm9ybXMgbmVlZCB0byB1c2UgZGVwZW5kZW5jaWVzIGJldHdlZW4gUENJ
IGhvc3QgYnJpZGdlLCBMaW5rCj4gZGV2aWNlcyBhbmQgdGhlIGludGVycnVwdCBjb250cm9sbGVy
cyB0byBlbnN1cmUgcHJvYmUgb3JkZXIuIFRoZQo+IGRlcGVuZGVuY3kgaXMgbGlrZSBiZWxvdy4K
PiAKPiBJbnRlcnJ1cHQgY29udHJvbGxlciA8LS0gTGluayBEZXZpY2UgPC0tIFBDSSBIb3N0IGJy
aWRnZS4KPiAKPiBJZiB0aGVyZSBpcyBubyBkZXBlbmRlbmN5IGJldHdlZW4gTGluayBkZXZpY2Ug
YW5kIFBDSSBIb3N0IEJyaWRnZSwKPiB0aGVuIFBDSSBkZXZpY2VzIG1heSBiZSBwcm9iZWQgcHJp
b3IgdG8gTGluayBkZXZpY2VzLiAgSWYgYSBQQ0kKPiBkZXZpY2UgaXMgcHJvYmVkIGJlZm9yZSBp
dHMgTGluayBkZXZpY2UsIHdlIHdvbid0IGJlIGFibGUgdG8gZmluZAo+IGl0cyBJTlR4IG1hcHBp
bmcuCgpUaGlzIHNlZW1zIHRvIGV4cGxhaW4gd2h5IHdlIHdhbnQgdGhlc2UgZGVwZW5kZW5jaWVz
LCB3aGljaCBpcyB1c2VmdWwsCmJ1dCAqdGhpcyogcGF0Y2ggb25seSByZW1vdmVzIHRoZSBkZXBl
bmRlbmNpZXMuCgpNYXliZSB0aGlzIGRlc2NyaXB0aW9uIHNob3VsZCBiZSBpbiB0aGUgcGF0Y2gg
dGhhdCAqYWRkcyogdGhlCmRlcGVuZGVuY2llcywgZS5nLiwgIkFDUEk6IFJJU0MtVjogSW1wbGVt
ZW50IGZ1bmN0aW9uIHRvIGFkZCBpbXBsaWNpdApkZXBlbmRlbmNpZXMiPwoKPiBTbywgYWRkIHRo
ZSBsaW5rIGRldmljZSdzIEhJRCB0byBkZXBlbmRlbmN5IGhvbm9yIGxpc3QgYW5kIGNsZWFyIHRo
ZQo+IGRlcGVuZGVuY3kgYWZ0ZXIgcHJvYmUgaXMgZG9uZSBzbyB0aGF0IHRoZSBkZXBlbmRlbnQg
ZGV2aWNlcyBhcmUKPiB1bmJsb2NrZWQgdG8gcHJvYmUuCgpUaGlzIHN0aWxsIGNsYWltcyB0aGlz
IHBhdGNoIGFkZHMgSElELCB3aGljaCBJIGRvbid0IHRoaW5rIGl0IGRvZXMuCgo+IFNpZ25lZC1v
ZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+IFRlc3RlZC1ieTog
QmrDg8K2cm4gVMODwrZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9h
Y3BpL3BjaV9saW5rLmMgfCAyICsrCj4gIGRyaXZlcnMvYWNwaS9zY2FuLmMgICAgIHwgMSArCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9wY2lfbGluay5jIGIvZHJpdmVycy9hY3BpL3BjaV9saW5rLmMKPiBpbmRleCBhYTEw
MzhiOGFlYzQuLmI3MjdkYjk2OGYzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvcGNpX2xp
bmsuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9wY2lfbGluay5jCj4gQEAgLTc0OCw2ICs3NDgsOCBA
QCBzdGF0aWMgaW50IGFjcGlfcGNpX2xpbmtfYWRkKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNl
LAo+ICAJaWYgKHJlc3VsdCkKPiAgCQlrZnJlZShsaW5rKTsKPiAgCj4gKwlhY3BpX2Rldl9jbGVh
cl9kZXBlbmRlbmNpZXMoZGV2aWNlKTsKPiArCj4gIAlyZXR1cm4gcmVzdWx0IDwgMCA/IHJlc3Vs
dCA6IDE7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2
ZXJzL2FjcGkvc2Nhbi5jCj4gaW5kZXggMjhhMjIxZjk1NmQ3Li43NTM1MzlhMWYyNmIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3NjYW4uYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMK
PiBAQCAtODYzLDYgKzg2Myw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgYWNwaV9ob25v
cl9kZXBfaWRzW10gPSB7Cj4gIAkiSU5UQzEwQ0YiLCAvKiBJVlNDIChNVEwpIGRyaXZlciBtdXN0
IGJlIGxvYWRlZCB0byBhbGxvdyBpMmMgYWNjZXNzIHRvIGNhbWVyYSBzZW5zb3JzICovCj4gIAki
UlNDVjAwMDEiLCAvKiBSSVNDLVYgUExJQyAqLwo+ICAJIlJTQ1YwMDAyIiwgLyogUklTQy1WIEFQ
TElDICovCj4gKwkiUE5QMEMwRiIsICAvKiBQQ0kgTGluayBEZXZpY2UgKi8KPiAgCU5VTEwKPiAg
fTsKPiAgCj4gLS0gCj4gMi40My4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
