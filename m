Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97324CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 19:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/HBEzIb++K7ytQ2YqRFcjAxlIJUJBl+7S4y24EE6cA=; b=LEMBWAAdg41aAg
	WFHV6liyiPLYDW/KU1RgRdjHoBb3aSUUIS65Vc4QorREkjgcp5kqkvVH9TfqG3ReTchlKc/elS0u2
	YHey/EHad9rZhU6+RPKQq3wEfi1E2YLfzecVGWAw8f6x3e/hMZtd4AQkhiBr88Qnz/8ilCbtaQ54s
	FQdn+dhaimdQ7oIHPB0MWkAvME409p2RRU870JjJa0ztL0JOi68RYdneKKgYKJKHw27xtNcAkc24X
	qXhCkYDXVrpsl7nzqzmYOUHgG5MEE6clw+6J9S5lfngMq8lH/eKNFLlT1DQkV7STP2v8LA32QD8X8
	rLLShr9gVy8NLHEhN1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18im-0000000Efhz-3Nuc;
	Tue, 23 Sep 2025 19:30:40 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18ik-0000000Efhf-2Adc
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 19:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=sgmjEyjMA0qGIjylSrBYpm5Nywd0hmlcKcjCfl2hwTQ=; b=QHEOfqnSlEwD3ePlCOEjn3yC2y
	5Svz442J0yi94kyTZQYgWld+xcrqqrO4FwA48ETMWguVNynk7P1bIPFkG59mmefqglXNl3xARFwCA
	jaYPfEfnwlAQjzJNZwFD98+b8dQgKVi3x5+SEK1bu5I9QjLYM0YBW3yVU2QhS1vuD0qaYLuVLccNw
	YGd/TeJ413MNkLKJ90RDauoVMM+mUposnA9vnZ3dJKUJQWaHFFS5oVlt0TbntN1zvMGi6njfhhZ+G
	jhhe/yxo1xe2UsZ27lRdu/UsbC0KdyqExdoASjtB0AMV604nTpYkbbxFdByTO1L2sRHQJsU2URbQt
	Ud6+aSQw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v18ia-00CAf4-2d;
	Tue, 23 Sep 2025 21:30:28 +0200
Date: Tue, 23 Sep 2025 21:30:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <aNL1VDm77voAHJlX@aurel32.net>
Mail-Followup-To: Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
 <54a959f7-a2e6-4622-97fa-18408afa0998@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54a959f7-a2e6-4622-97fa-18408afa0998@iscas.ac.cn>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_123038_557954_19D84E30 
X-CRM114-Status: GOOD (  25.46  )
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

SGkgVml2aWFuLAoKT24gMjAyNS0wOS0yMyAxNDozMiwgVml2aWFuIFdhbmcgd3JvdGU6Cj4gSGkg
QXVyZWxpZW4sCj4gCj4gT24gOS8yMi8yNSAwNTowMSwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4g
PiBUaGUgQlBJLUYzIGNvbnRhaW5zIGEgMjRjMDIgZWVwcm9tLCB0aGF0IGNvbnRhaW5zIGFtb25n
IG90aGVyIHRoaW5ncyB0aGUKPiA+IE1BQyBhZGRyZXNzZXMgb2YgdGhlIHR3byBuZXR3b3JrIGlu
dGVyZmFjZXMuIEZvciB0aGlzIHJlYXNvbiwgbWFyayBpdCBhcwo+ID4gcmVhZC1vbmx5Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMu
ZHRzIHwgMTEgKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtYmFuYW5hcGktZjMuZHRzCj4gPiBpbmRleCAzYjZlNGY1MmU5YWFkLi41NzRkMTBmZGY5
YjgyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFu
YW5hcGktZjMuZHRzCj4gPiBAQCAtMTE1LDYgKzExNSwxNSBAQCAmaTJjMiB7Cj4gPiAgCXBpbmN0
cmwtMCA9IDwmaTJjMl8wX2NmZz47Cj4gPiAgCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4g
PiAgCXN0YXR1cyA9ICJva2F5IjsKPiA+ICsKPiA+ICsJZWVwcm9tQDUwIHsKPiA+ICsJCWNvbXBh
dGlibGUgPSAiYXRtZWwsMjRjMDIiOwo+ID4gKwkJcmVnID0gPDB4NTA+Owo+ID4gKwkJdmNjLXN1
cHBseSA9IDwmdmNjMXY4X3N5cz47Cj4gPiArCQlwYWdlc2l6ZSA9IDwxNj47Cj4gPiArCQlyZWFk
LW9ubHk7Cj4gPiArCQlzaXplID0gPDI1Nj47Cj4gPiArCX07Cj4gPiAgfTsKPiA+ICAKPiAKPiBJ
IHdvbmRlciBpZiBpdCB3b3VsZCBwb3NzaWJseSBtYWtlIHNlbnNlIHRvIHNwZWNpZnkgYSBudm1l
bS1sYXlvdXQgaGVyZS4KPiBUaGUgQlBJLUYzIEkgaGF2ZSBoZXJlIGhhcyB0aGlzIGluIHRoZSAy
NGMwMjoKPiAKPiAwMDAwMDAwMMKgIDU0IDZjIDc2IDQ5IDZlIDY2IDZmIDAwwqAgMDEgMDAgMjAg
MjQgMDYgZmUgZmUgZmXCoCB8VGx2SW5mby4uLiAkLi4uLnwKPiAwMDAwMDAxMMKgIFhYIFhYIFhY
IDJhIDAyIDAwIDAyIDIzwqAgMGMgWFggWFggWFggWFggWFggWFggWFjCoCB8Li4uKi4uLiMuWFhY
WFhYWHwKPiAwMDAwMDAyMMKgIFhYIFhYIFhYIFhYIFhYIGZlIDA0IFhYwqAgWFggWFggWFggZmYg
ZmYgZmYgZmYgZmbCoCB8WFhYWFguLlhYWFguLi4uLnwKPiAwMDAwMDAzMMKgIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmwqAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4u
LnwKPiAqCj4gMDAwMDAxMDAKPiAKPiAoLi4uIHdpdGggdmFyaWFibGUgcGFydHMgcmVwbGFjZWQg
d2l0aCBYKQo+IAo+IEFuZCwgQUZBSUNULCB0aGlzIGlzIGEgIm9uaWUsdGx2LWxheW91dCIgd2l0
aCBmaWVsZHM6Cj4gCj4gMHgyNCBtYWMtYWRkZHJlc3MKPiAweDJhIG51bS1tYWNzCj4gMHgyMyBz
ZXJpYWwtbnVtYmVyCj4gMHhmZSBjcmMzMgo+IAo+IEFzIHlvdSBjYW4gc2VlIHRoZSBtYWMtYWRk
cmVzcyBhc3NpZ25tZW50IGxvb2tzIGJvZ3VzIHdpdGggZmU6ZmU6ZmUgKGl0Cj4gaXMgdXNlZCBi
eSB2ZW5kb3IgY29kZSB0aG91Z2gsIHNvIGF0IGxlYXN0IGl0IHNlZW1zIHRvIGJlIGludGVuZGVk
KS4gSXQKPiBkb2VzIGFwcGVhciBhdCBsZWFzdCB0byBoYXZlIHVzZWZ1bCBpbmZvcm1hdGlvbi4K
ClRoZSByZWFzb24gSSBpbml0aWFsbHkgdHJpZWQgdG8gZHVtcCB0aGUgY29udGVudCBvZiB0aGUg
ZWVwcm9tIHdhcyB0byAKY2hlY2sgdGhlIE1BQyBhZGRyZXNzZXMgcHJvdmlkZWQgdG8gdGhlIGtl
cm5lbCBieSB1LWJvb3QgYXQgdGhleSBsb29rZWQKc3RyYW5nZSB0byBtZSBzdGFydGluZyB3aXRo
IGZlOmZlOmZlLi4uIEJ1dCBhdCBsZWFzdCB0aGV5IG1hdGNoLgoKPiBDYW4geW91IGNvbmZpcm0g
b24geW91ciBoYXJkd2FyZT8gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpczogc2hvdWxkCj4g
d2UgYWRkIGl0IG5vdyBvciBhZGQgaXQgd2hlbiB3ZSBoYXZlIHVzZXJzPwoKSSBhbHNvIGhhdmUg
dGhlIFRsdkluZm8gZGF0YSBvbiBteSBib2FyZCwgYnV0IGl0IG1pc3NlcyB0aGUgCnNlcmlhbC1u
dW1iZXIgZmllbGQuCgpUaGlzIGlzIGEgZ29vZCBpZGVhIHRvIHVzZSB0aGUgIm9uaWUsdGx2LWxh
eW91dCIgbGF5b3V0LCBJJ2xsIGRvIHRoYXQgaW4gCnRoZSBWMi4KCkF1cmVsaWVuCgotLSAKQXVy
ZWxpZW4gSmFybm8gICAgICAgICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIK
YXVyZWxpZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5u
ZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
