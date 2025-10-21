Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F37CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hWdbnFcauV0z8XSi6GRaWOV/KbYNruza7FTyd/6apI=; b=X7GAOXDV46vYrS
	eGo8CwAwTaIoXg5TPFYcAulZpwB5Zi0203i27CB6G5JVsBG+WXQUCV8m/kpoSkcWtEBRpkkJxdcUS
	ll/2+5eZTzMlVBBlHMG0ug8jF+GljTRfzoM1jZsxslXdUbQQL4/wWjhmcLHHZSoI0Z35WxP2wQeqz
	1bOWmPkMpXoTa6OgU4hSebN9xIC4wCW9a3iWIbbmKIeVGuHIuNTJUiehdJEK1nw1ZfNLYAnPD4DCJ
	2DAgEzOv7G7SsIenXDY7PzynvvEEV4qZIpehaFyJnBd5iU6BuR/+I5kDZdQZh4Y0bZhrqLxje6jyi
	sxpBWJOMHgNB1Hn1HZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH1i-00000000Klo-2TgS;
	Tue, 21 Oct 2025 18:24:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH1g-00000000Kki-1IhI
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 18:24:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761071039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsB5rMhwuhp8pA17tWoe/hsQh2JLMaKKsffP1S6G2jk=;
	b=q7dCUf8Qvn7NfXlik7h4bBI9b/ZtUrH8mHy0eWjPMgEOrvF6SQv6v4uC/nBhedp/j4dGyO
	3baeSimlOvyiucac5Wa1cSWBLd4jcJ6mLQyTpoGOk3xwGocbOUHJNYdwWk8sLRRSxNCPof
	QdlGLZCpbpUX+FcJ7lde0enTbNE2m6MU7P6y9xSbjpU/JZLU1DRg4wq8XqD3RZ2fEv0JGo
	3zWMGsQEWeywU78g6LApl+4KmKf52sNEgeuClE5BA011GmDTM2gY3etA7j6y5vPTn3pFNf
	6x7oKRDetnfHNHj6x08QpFPMe0yBkleowiNdMDSD7hMJi77yYS0d1GJIPpDscg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761071039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsB5rMhwuhp8pA17tWoe/hsQh2JLMaKKsffP1S6G2jk=;
	b=wr1DZ8xomQztHUwIWV70tnSbYbqyS2AHPDlohzIs/i9hS+QRmBCECsOTm5fVSlckICQyI3
	izw2ohDKSceGkTDw==
To: Troy Mitchell <troy.mitchell@linux.dev>, Troy Mitchell
 <troy.mitchell@linux.dev>, Paul Walmsley <pjw@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip/sifive-plic: use hartid as context_id in OF to
 fix AMP conflicts
In-Reply-To: <aPbeb1SEZr7CG2eN@kernel.org>
References: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
 <87bjm1zcvc.ffs@tglx> <aPbeb1SEZr7CG2eN@kernel.org>
Date: Tue, 21 Oct 2025 20:23:58 +0200
Message-ID: <87y0p4xge9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_112404_486186_073416BF 
X-CRM114-Status: GOOD (  15.74  )
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

T24gVHVlLCBPY3QgMjEgMjAyNSBhdCAwOToxNCwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiBPbiBN
b24sIE9jdCAyMCwgMjAyNSBhdCAwNzo0NDo1NVBNICswMjAwLCBUaG9tYXMgR2xlaXhuZXIgd3Jv
dGU6Cj4+IE9uIE1vbiwgT2N0IDIwIDIwMjUgYXQgMTE6NDksIFRyb3kgTWl0Y2hlbGwgd3JvdGU6
Cj4+ID4gSW4gYXN5bW1ldHJpYyBtdWx0aS1wcm9jZXNzaW5nIChBTVApIHNjZW5hcmlvcywgdGhl
IG9yaWdpbmFsIFBMSUMKPj4gPiBkcml2ZXIgdXNlZCB0aGUgY29udGV4dCBsb29wIGluZGV4ICdp
JyBhcyBjb250ZXh0X2lkIGZvciBPRiAoZGV2aWNlCj4+IAo+PiBXaGljaCBvcmlnaW5hbCBkcml2
ZXIgYW5kIHdoZW4gZGlkIGl0IHN0b3AgdG8gdXNlIHRoZSBjb250ZXh0IGxvb3AgaW5kZXg/Cj4+
IAo+PiA+IHRyZWUpIHBsYXRmb3Jtcy4gVGhpcyBjYXVzZWQgbXVsdGlwbGUgY29udGV4dHMgZnJv
bSBkaWZmZXJlbnQgaGFydHMKPj4gPiAoZS5nLiwgY29yZTAgYW5kIGNvcmU0KSB0byBzaGFyZSB0
aGUgc2FtZSBlbmFibGVfYmFzZSwgbGVhZGluZyB0bwo+PiA+IGNvbmZsaWN0cyB3aGVuIGluaXRp
YWxpemluZyB0aGUgUExJQy4KPj4gCj4+IFdoZW4gZGlkIGl0IHN0b3AgdG8gY2F1c2UgdGhlIGlz
c3Vlcz8gQW5kIGlmIHRoZSBpc3N1ZXMgaGF2ZSBiZWVuCj4+IGFscmVhZHkgcmVzb2x2ZWQsIHdo
YXQgaXMgdGhpcyBwYXRjaCBhYm91dD8KPiBUaGUgaXNzdWUgc3RpbGwgZXhpc3RzIGluIHRoZSBj
dXJyZW50IGRyaXZlci4KPiBUaGUgUExJQyBkcml2ZXIgZm9yIE9GLWJhc2VkIHBsYXRmb3JtcyBh
c3NpZ25zIGNvbnRleHRfaWQgPSBpIGluc2lkZQo+IHRoZSBjb250ZXh0IGxvb3AsIHdoaWNoIGFz
c3VtZXMgdGhhdCBhbGwgaGFydHMgYXJlIG51bWJlcmVkIGNvbnRpZ3VvdXNseQo+IHN0YXJ0aW5n
IGZyb20gMC4KPgo+IEluIEFNUCBzeXN0ZW1zIChlLmcuLCB3aGVuIExpbnV4IGJvb3RzIGZyb20g
aGFydDQgd2hpbGUgaGFydDAgcnVucyBhbm90aGVyIE9TKSwKPiB0aGlzIGFzc3VtcHRpb24gYnJl
YWtzIOKAlCBtdWx0aXBsZSBjb250ZXh0cyBmcm9tIGRpZmZlcmVudCBjbHVzdGVycyBzaGFyZSB0
aGUgc2FtZQo+IGVuYWJsZV9iYXNlKGUuZy4sIGNvcmU0J3MgZW5hYmxlX2Jhc2UgPSBjb3JlMCdz
IGVuYWJsZV9iYXNlKSwgY2F1c2luZyBjb25mbGljdHMuCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRo
ZSBwcm9ibGVtIGJ5IGFzc2lnbmluZyBjb250ZXh0X2lkIGJhc2VkIG9uIHRoZSBhY3R1YWwgaGFy
dGlkLAo+IGVuc3VyaW5nIHRoYXQgZWFjaCBoYXJ0IGNvbnRleHQgbWFwcyB0byBhIHVuaXF1ZSBl
bmFibGUgcmVnaW9uLAo+IHdoaWxlIHByZXNlcnZpbmcgYmVoYXZpb3Igb24gU01QIGFuZCBVUCBz
eXN0ZW1zLgo+Cj4gRG9lcyBpdCBtYWtlIHNlbnNlPyBJJ2xsIHVwZGF0ZSBteSBjb21taXQgbWVz
c2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKWWVzLiBUaG91Z2ggdGhpcyBzdGlsbCBhcHBsaWVz
OgogCj4+ICMgZ2l0IGdyZXAgJ1RoaXMgcGF0Y2gnIERvY3VtZW50YXRpb24vcHJvY2Vzcy8KClRo
YW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
