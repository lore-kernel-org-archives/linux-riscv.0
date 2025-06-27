Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EE0C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3pSJy/GQmPDtQ7OZ9vpL87YhdagaKeUeeJCtEtZw9k=; b=ZccULiXFFqK1ZH
	KkZMnBqb7SCVTZwq5FEyJRge8csxAudWCaQxhBCUMRaRF6d/KPV+4PduKo4dft5Ic2pp9exhGCymw
	WKdkaaGrWMfZC90/v2l6Xnq6I027+SiKTCqn17jAuqiu9O+3jnW4gyWU1VoFoiAsXM9+gexTaFsTL
	VQEMxf5bISW34k0nUJfG9KxM4Kb56DgKH2PSqToFmRpnXVGGUo1vG6IZ09EsM3mkh4UI1FAo8b8OO
	wVZW0uDdGl9aSNW/vRL1slayOYUvyaLY24sJZTyHpN32XtxClZ7CyMEDMcGyYmY1gs+2Z5ka89wbc
	2t6Lq1tko4zpMha9I+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV97U-0000000Em1g-0ZrD;
	Fri, 27 Jun 2025 13:27:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8YB-0000000Eh22-0dWb
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 12:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9362B6111F;
	Fri, 27 Jun 2025 12:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1F4C4CEE3;
	Fri, 27 Jun 2025 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028686;
	bh=vkTWHdyY2LgTLEhdW6ywJcKCt9UErdA7gq50ddD4J7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EY1X793vtCOEYQVu60/1GWtMu/J/QR4ff5coXtHaO1S5KX6WWx1sz8cpC9H43vD92
	 PbDEyMg3DoFr6qAsB6Hc10WJTPqHvzt8umwtLBIX1gl2a5R3vaINtixLt9jZtacy38
	 WRbCMgIlkSnT8OWPnKsGZDgn/EziNXBzClIPsvxM+SEKHO8hwyCgtEOUvLC+qR7kYI
	 qBcNdQ127+NSLu3G/FW8GtY/PN5fOF5qObxDiUgfh4Tts28h32mOi4HzAABvUhHOJ1
	 Pw3p19wn+i9kRDjuDONH7oqhuXX5uPrkr7dQ135iWCKjcAab4aUXloJ+tnm9jz6Bya
	 gtHC0gMJMd1fQ==
Date: Fri, 27 Jun 2025 13:51:19 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250627125119.GF10134@google.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625164119.1068842-3-elder@riscstar.com>
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

T24gV2VkLCAyNSBKdW4gMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gRW5hYmxlIHN1cHBvcnQg
Zm9yIHRoZSBSVEMgYW5kIHJlZ3VsYXRvcnMgZm91bmQgaW4gdGhlIFNwYWNlbWlUIFAxCj4gUE1J
Qy4gIFN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgYnkgdGhlIHNpbXBsZSBJMkMgTUZEIGRyaXZlci4K
PiAKPiBUaGUgUDEgUE1JQyBpcyBub3JtYWxseSBpbXBsZW1lbnRlZCB3aXRoIHRoZSBTcGFjZW1p
VCBLMSBTb0MuICBUaGlzCj4gUE1JQyBwcm92aWRlcyA2IGJ1Y2sgY29udmVydGVycyBhbmQgMTIg
TERPIHJlZ3VsYXRvcnMuICBJdCBhbHNvCj4gaW1wbGVtZW50cyBhIHN3aXRjaCwgd2F0Y2hkb2cg
dGltZXIsIHJlYWwtdGltZSBjbG9jaywgYW5kIG1vcmUuCj4gSW5pdGlhbGx5IGl0cyBSVEMgYW5k
IHJlZ3VsYXRvcnMgYXJlIHN1cHBvcnRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVy
IDxlbGRlckByaXNjc3Rhci5jb20+Cj4gLS0tCj4gdjQ6IC0gQWRkIGEgZGVwZW5kZW5jeSBvbiBJ
MkMsIHRvIGF2b2lkIGEgQ1JPU1NfQ09NUElMRSBidWlsZCBlcnJvcgo+IAo+ICBkcml2ZXJzL21m
ZC9LY29uZmlnICAgICAgICAgIHwgMTEgKysrKysrKysrKysKPiAgZHJpdmVycy9tZmQvc2ltcGxl
LW1mZC1pMmMuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDI5
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2Ry
aXZlcnMvbWZkL0tjb25maWcKPiBpbmRleCA2ZmIzNzY4ZTNkNzFjLi4wMTgwNWMzZWVjNTdkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL21mZC9LY29u
ZmlnCj4gQEAgLTExODIsNiArMTE4MiwxNyBAQCBjb25maWcgTUZEX1FDT01fUlBNCj4gIAkgIFNh
eSBNIGhlcmUgaWYgeW91IHdhbnQgdG8gaW5jbHVkZSBzdXBwb3J0IGZvciB0aGUgUXVhbGNvbW0g
UlBNIGFzIGEKPiAgCSAgbW9kdWxlLiBUaGlzIHdpbGwgYnVpbGQgYSBtb2R1bGUgY2FsbGVkICJx
Y29tX3JwbSIuCj4gIAo+ICtjb25maWcgTUZEX1NQQUNFTUlUX1AxCj4gKwl0cmlzdGF0ZSAiU3Bh
Y2VtaVQgUDEgUE1JQyIKPiArCWRlcGVuZHMgb24gSTJDCj4gKwlzZWxlY3QgTUZEX1NJTVBMRV9N
RkRfSTJDCj4gKwloZWxwCj4gKwkgIFRoaXMgb3B0aW9uIHN1cHBvcnRzIHRoZSBJMkMtYmFzZWQg
U3BhY2VtaVQgUDEgUE1JQywgd2hpY2gKPiArCSAgY29udGFpbnMgcmVndWxhdG9ycywgYSBwb3dl
ciBzd2l0Y2gsIEdQSU9zLCBhbiBSVEMsIGFuZCBtb3JlLgo+ICsJICBUaGlzIG9wdGlvbiBpcyBz
ZWxlY3RlZCB3aGVuIGFueSBvZiB0aGUgc3VwcG9ydGVkIHN1Yi1kZXZpY2VzCj4gKwkgIGlzIGNv
bmZpZ3VyZWQuICBUaGUgYmFzaWMgZnVuY3Rpb25hbGl0eSBpcyBpbXBsZW1lbnRlZCBieSB0aGUK
PiArCSAgc2ltcGxlIE1GRCBJMkMgZHJpdmVyLgo+ICsKPiAgY29uZmlnIE1GRF9TUE1JX1BNSUMK
PiAgCXRyaXN0YXRlICJRdWFsY29tbSBTUE1JIFBNSUNzIgo+ICAJZGVwZW5kcyBvbiBBUkNIX1FD
T00gfHwgQ09NUElMRV9URVNUCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQt
aTJjLmMgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gaW5kZXggMjIxNTk5MTNiZWEw
My4uMDI2Y2Q5MmUyMGFkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWky
Yy5jCj4gKysrIGIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYwo+IEBAIC05MywxMiArOTMs
MzAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzaW1wbGVfbWZkX2RhdGEgbWF4aW1fbW9uX21heDc3
NzA1ID0gewo+ICAJLm1mZF9jZWxsX3NpemUgPSBBUlJBWV9TSVpFKG1heDc3NzA1X3NlbnNvcl9j
ZWxscyksCj4gIH07Cj4gIAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgc3Bh
Y2VtaXRfcDFfcmVnbWFwX2NvbmZpZyA9IHsKPiArCS5yZWdfYml0cyA9IDgsCj4gKwkudmFsX2Jp
dHMgPSA4LAo+ICsJLm1heF9yZWdpc3RlciA9IDB4YWEsCj4gK307CgpTdWdnZXN0IG1ha2luZyB0
aGlzIG1vcmUgd2lkZWx5IHVzZWZ1bCBieSBhZGRpbmcgdGhlICdtYXhfcmVnaXN0ZXInCmF0dHJp
YnV0ZSB0byAnc3RydWN0IHNpbXBsZV9tZmQnIGFuZCBjb25kaXRpb25hbGx5IG92ZXJyaWRpbmcK
cmVnbWFwX2NvbmZpZ184cl84didzIHZhbHVlIGR1cmluZyBwcm9iZS4KCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgbWZkX2NlbGwgc3BhY2VtaXRfcDFfY2VsbHNbXSA9IHsKPiArCXsgLm5hbWUgPSAi
c3BhY2VtaXQtcDEtcmVndWxhdG9yIiwgfSwKPiArCXsgLm5hbWUgPSAic3BhY2VtaXQtcDEtcnRj
IiwgfSwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2ltcGxlX21mZF9kYXRhIHNw
YWNlbWl0X3AxID0gewo+ICsJLnJlZ21hcF9jb25maWcgPSAmc3BhY2VtaXRfcDFfcmVnbWFwX2Nv
bmZpZywKPiArCS5tZmRfY2VsbCA9IHNwYWNlbWl0X3AxX2NlbGxzLAo+ICsJLm1mZF9jZWxsX3Np
emUgPSBBUlJBWV9TSVpFKHNwYWNlbWl0X3AxX2NlbGxzKSwKPiArfTsKPiArCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpbXBsZV9tZmRfaTJjX29mX21hdGNoW10gPSB7Cj4g
IAl7IC5jb21wYXRpYmxlID0gImtvbnRyb24sc2wyOGNwbGQiIH0sCj4gIAl7IC5jb21wYXRpYmxl
ID0gInNpbGVyZ3ksc3k3NjM2YSIsIC5kYXRhID0gJnNpbGVyZ3lfc3k3NjM2YX0sCj4gIAl7IC5j
b21wYXRpYmxlID0gIm1heGltLG1heDU5NzAiLCAuZGF0YSA9ICZtYXhpbV9tYXg1OTcwfSwKPiAg
CXsgLmNvbXBhdGlibGUgPSAibWF4aW0sbWF4NTk3OCIsIC5kYXRhID0gJm1heGltX21heDU5NzB9
LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJtYXhpbSxtYXg3NzcwNS1iYXR0ZXJ5IiwgLmRhdGEgPSAm
bWF4aW1fbW9uX21heDc3NzA1fSwKPiArCXsgLmNvbXBhdGlibGUgPSAic3BhY2VtaXQscDEiLCAu
ZGF0YSA9ICZzcGFjZW1pdF9wMSwgfSwKPiAgCXt9Cj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHNpbXBsZV9tZmRfaTJjX29mX21hdGNoKTsKPiAtLSAKPiAyLjQ1LjIKPiAKCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
