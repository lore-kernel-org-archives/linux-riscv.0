Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D94C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SS6p4KGuMoz1ZbpciB/SfIVVYGlfNiL5822GETz8f34=; b=bYj5yna2hnlTpu
	W2H82PvaLsez4Y6Q2AUJyh9hlW5L1U0KHn7qeZIh+Yi+ZuGwZDeDzqqd15A1bX0TMmoIfDmKq/hzV
	RRsExpF0iTb8VCcu67nbAPEJbDubTNNRRAuwHoJVTPDuOivbATrL8qACVqpjzS5ywWEyTGmyqQ5QH
	tmPzNQLecASk+epYrt2Qyc39vn8VGGn9alNxZ1gmm8SxNNE9blF5KXManEk3dF61SgbJrz2IZ7vEi
	/tUmap6ecoBNtN0aHpODukqjC2OSlLV1KCOjjWYUXS6ZweDxKw8RygC1dBN78f359O5DhxEb2mbpw
	I/uMDfCk/pqmJ+Zl94Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgoxS-00000009tOg-13bL;
	Wed, 21 Aug 2024 17:17:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgoxP-00000009tOD-2FkI
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 17:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D79A4A41DAA;
	Wed, 21 Aug 2024 17:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB952C4AF13;
	Wed, 21 Aug 2024 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724260634;
	bh=TyLDjhy0ttfEqSAKwvAE+TyPIIdCunxanaRtbGipG5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qJTLsnpjPRqw2Ttkye4zhRT+sOXS+tl57VHKXelnWv3O7OBcK2j5giznTCNDhbh08
	 p3IeqfBKs7F4uCML5CV6CnX6DHasaRCEu5T4EJ/l0Z7S2OqkNQFbkMIY0vnObJU8mn
	 YNf8XF8pOJQqpP8tb9+QveomFi/RdyWwIkBPrw50iKGfUyItrnBZFZTP5sp3QJgxke
	 7/7iVj4GsMlKXWShUb+gUA0Q9rIew6ROkd5K5LSwJGuw2TsfZpya9yRr0Ggj5xCtFI
	 KyR5dop6W2A8B7veBSpMRvqsVWycCTgMHYnKw5ET2QvqLbvhPhFHqtzWYgS54A4elg
	 maLXDuhkXoYLA==
Date: Wed, 21 Aug 2024 12:17:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v8 2/3] PCI: microchip: Fix inbound address translation
 tables
Message-ID: <20240821171712.GA256242@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821130217.957424-3-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_101715_723936_629E8DD7 
X-CRM114-Status: GOOD (  19.32  )
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

T24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMDI6MDI6MTZQTSArMDEwMCwgZGFpcmUubWNuYW1hcmFA
bWljcm9jaGlwLmNvbSB3cm90ZToKPiBGcm9tOiBEYWlyZSBNY05hbWFyYSA8ZGFpcmUubWNuYW1h
cmFAbWljcm9jaGlwLmNvbT4KPiAKPiBPbiBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQyB0aGUgUENJ
ZSBSb290IFBvcnQgY2FuIGJlIGJlaGluZCBvbmUgb2YgdGhyZWUKPiBnZW5lcmFsIHB1cnBvc2Ug
RmFicmljIEludGVyZmFjZSBDb250cm9sbGVyIChGSUMpIGJ1c2VzIHRoYXQgZW5jYXBzdWxhdGVz
Cj4gYW4gQVhJLVMgYnVzLiBEZXBlbmRpbmcgb24gd2hpY2ggRklDKHMpIHRoZSBSb290IFBvcnQg
aXMgY29ubmVjdGVkCj4gdGhyb3VnaCB0byBDUFUgc3BhY2UsIGFuZCB3aGF0IGFkZHJlc3MgdHJh
bnNsYXRpb24gaXMgZG9uZSBieSB0aGF0IEZJQywKPiB0aGUgUm9vdCBQb3J0IGRyaXZlcidzIGlu
Ym91bmQgYWRkcmVzcyB0cmFuc2xhdGlvbiBtYXkgdmFyeS4KPiAKPiBGb3IgYWxsIGN1cnJlbnQg
c3VwcG9ydGVkIGRlc2lnbnMgYW5kIGFsbCBmdXR1cmUgZXhwZWN0ZWQgZGVzaWducywKPiBpbmJv
dW5kIGFkZHJlc3MgdHJhbnNsYXRpb24gZG9uZSBieSBhIEZJQyBvbiBQb2xhckZpcmUgU29DIHZh
cmllcwo+IGRlcGVuZGluZyBvbiB3aGV0aGVyIFBvbGFyRmlyZSBTb0MgaW4gb3BlcmF0aW5nIGlu
IGNvaGVyZW50IERNQSBtb2RlIG9yCj4gbm9uY29oZXJlbnQgRE1BIG1vZGUuCgpzL2luIG9wZXJh
dGluZy9pcyBvcGVyYXRpbmcvCgo+IFRoZSBzZXR1cCBvZiB0aGUgb3V0Ym91bmQgYWRkcmVzcyB0
cmFuc2xhdGlvbiB0YWJsZXMgaW4gdGhlIFJvb3QgUG9ydAo+IGRyaXZlciBvbmx5IG5lZWRzIHRv
IGhhbmRsZSB0aGVzZSB0d28gY2FzZXMuCj4gCj4gU2V0dXAgdGhlIGluYm91bmQgYWRkcmVzcyB0
cmFuc2xhdGlvbiB0YWJsZXMgdG8gb25lIG9mIHR3byBhZGRyZXNzCj4gdHJhbnNsYXRpb25zLCBk
ZXBlbmRpbmcgb24gd2hldGhlciB0aGUgcm9vdHBvcnQgaXMgYmVpbmcgdXNlZCB3aXRoIGNvaGVy
ZW50Cj4gRE1BIG9yIG5vbmNvaGVyZW50IERNQS4KCnMvcm9vdHBvcnQvUm9vdCBQb3J0LyB0byBt
YXRjaCBhYm92ZQoKPiArc3RhdGljIHZvaWQgbWNfcGNpZV9zZXR1cF9pbmJvdW5kX2F0cihpbnQg
d2luZG93X2luZGV4LCB1NjQgYXhpX2FkZHIsIHU2NCBwY2llX2FkZHIsIHU2NCBzaXplKQoKTW9z
dCBvZiB0aGlzIGZpbGUgZml0cyBpbiA4MCBjb2x1bW5zLCBtYXliZSB0aGVzZSBuZXcgZGVjbHMg
Y291bGQsIHRvby4KCj4gK3N0YXRpYyBpbnQgbWNfcGNpZV9zZXR1cF9pbmJvdW5kX3Jhbmdlcyhz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgbWNfcGNpZSAqcG9ydCkKCj4gQEAg
LTUyNSwxMyArNTI5LDIwIEBAIHZvaWQgcGxkYV9wY2llX3NldHVwX3dpbmRvdyh2b2lkIF9faW9t
ZW0gKmJyaWRnZV9iYXNlX2FkZHIsIHUzMiBpbmRleCwKPiAgCXZhbCA9IHVwcGVyXzMyX2JpdHMo
cGNpX2FkZHIpOwo+ICAJd3JpdGVsKHZhbCwgYnJpZGdlX2Jhc2VfYWRkciArIChpbmRleCAqIEFU
Ul9FTlRSWV9TSVpFKSArCj4gIAkgICAgICAgQVRSMF9BWEk0X1NMVjBfVFJTTF9BRERSX1VEVyk7
Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwocGxkYV9wY2llX3NldHVwX3dpbmRvdyk7CgpJIHRo
aW5rIHRoZSBjYWxsZXIgdGhhdCBuZWVkcyB0aGlzIGV4cG9ydCBpcyBpbiBhIHByZXZpb3VzIHBh
dGNoPwoKSSB3aXNoIHdlIGRpZG4ndCBuZWVkIHRvIGV4cG9ydCBzeW1ib2xzIGxpa2UgdGhlc2Ug
c2luY2UgdGhleSdyZQpyZWFsbHkgcHJpdmF0ZSB0byB0aGUgZHJpdmVyLCBidXQgSSBkaWRuJ3Qg
bG9vayBpbnRvIHRoZSBtb2R1bGUKc3RydWN0dXJlIGhlcmUuCgpBbHNvLCBJIGdldCB0aGlzIGVy
cm9yIHdoZW4gYnVpbGRpbmcgYWZ0ZXIgYm90aCBwYXRjaCAxLzMgYW5kIDIvMzoKCiAgZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWljcm9jaGlwLWhvc3QuYzo2MTc6NTogZXJyb3I6
IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbWNfcGNpZV9zZXR1cF9pb21lbXPigJkgWy1X
ZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQogICAgNjE3IHwgaW50IG1jX3BjaWVfc2V0dXBfaW9t
ZW1zKHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwKCXwgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+Cgo+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZl
LmMKPiBAQCAtMzU1LDYgKzM1NSwxMSBAQCBzdGF0aWMgaW50IHN0YXJmaXZlX3BjaWVfaG9zdF9p
bml0KHN0cnVjdCBwbGRhX3BjaWVfcnAgKnBsZGEpCj4gIAkgKi8KPiAgCXBsZGFfcGNpZV9zZXRf
cHJlZl93aW5fNjRiaXQocGxkYSk7Cj4gIAo+ICsJLyoKPiArCSAqIFNldHVwIHRoZSBpbmJvdW5k
IGFkZHJlc3MgdHJhbnNsYXRpb24KPiArCSAqLwoKQ291bGQgYmUgYSBzaW5nbGUtbGluZSBjb21t
ZW50OiAvKiBTZXR1cCB0aGUgLi4uICovCgo+ICsJcGxkYV9wY2llX3NldHVwX2luYm91bmRfYWRk
cmVzc190cmFuc2xhdGlvbihwbGRhKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
