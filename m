Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689BECD98F2
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGamRT/KeGWnROK3IOVA3pWaRmNVq8Rq3vC3/gSLn2g=; b=kcHmosK7k0QAbM
	TXEobsdxTCjLY+IVLrserZSvxHGNveEGz1Bu52uszoSHiTAn5j+0apCBN70RGdP2N14ABxim0ahqu
	gl0vdicrDj/HlXTNmzPs3qyHw354z9k0fZ7ebfwu2jbzLJoK2hT8eaFi+NqkQ9ZRzar+TOzLiHIKU
	ghv9wRMShKoKNEqX2q2AF2hEBk8dG7oogcb79vuKjLm9Ja2oXB6koVd1JoGDT1zLlO0qgwpxUiuB0
	ByIP1Op1xOlT5ZKLCNTV84e80ABalQ8tRznViM2BS7O2WGDDlO+Agni5GKVIyMsvteElqkM9mLdCw
	2GJw0CWdx5BzkjCfHRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbI0u-00000003x7S-3OZB;
	Sun, 21 Jun 2026 13:15:04 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbI0r-00000003x6b-1nCg
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 13:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=b+7H29dkhVMGO3TYR7p0AjHCtsPqiNAR3VmqxDlgg4k=; b=YNyrsNRJGh7cNXixVSGLbXkyEk
	T2/vIARUjYirxMyH2xW4s2iHF1+SyuVXCAhsx17kSaGPIt9VCEuhS7RZHOLUoqMPRRG/APRk6ZMJi
	sz7ka3/uEhDz1YzflamAKg4DTOUVCnMYeFdxW8PjHiMRzxxm3miJFfNJL0WFLUtt2WLkioGyj7liw
	BH8K8gporiEqUMXxArI8SON95X2V7JP66KqR6so/4uxrR99r3WPeX+hqwZlrLI+vZRA2Ryvvy+yW0
	3ZoeEK0h0NrIALxny7BBN8wSUdQFvSfTm4+Y+67MVh8BapQ8XdARoRG1yAGXvGTM3SeE745RLoQ7i
	KCQQOSLg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wbI0h-00000001gBd-1xzv;
	Sun, 21 Jun 2026 15:14:51 +0200
Date: Sun, 21 Jun 2026 15:14:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3
 Pico-ITX board
Message-ID: <ajfjyvSCVBVgr-UO@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-3-aurelien@aurel32.net>
 <20260620062948.0A1161F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260620062948.0A1161F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_061501_490809_D6A8492E 
X-CRM114-Status: GOOD (  15.40  )
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

Qm90aCBpc3N1ZXMgcmVwb3J0ZWQgYnkgU2FzaGlrbyBBSSAoc2VlIGJlbG93KSBhcmUgdmFsaWQs
IEknbGwgc3VibWl0IGEgCnYyIGZpeGluZyB0aGVtLCBidXQgSSdsbCBmaXJzdCBsZWF2ZSBhIGZl
dyBtb3JlIGRheXMgZm9yIGh1bWFucyB0byBhbHNvIApoYXZlIGEgbG9vayBhdCB0aGUgcGF0Y2hl
cy4KClJlZ2FyZHMKQXVyZWxpZW4KCk9uIDIwMjYtMDYtMjAgMDY6MjksIHNhc2hpa28tYm90QGtl
cm5lbC5vcmcgd3JvdGU6Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Cj4gLSBb
TG93XSBUaGUgcGluY3RybCBzdWJub2RlIGlzIG5hbWVkIGBpMmMyLTAtcGluc2AgYnV0IGJlbG9u
Z3MgdG8gdGhlIGBpMmMyLTEtY2ZnYCBwYXJlbnQgbm9kZS4KPiAtIFtMb3ddIE1pc3Npbmcgc3Bh
Y2UgYmVmb3JlIHRoZSBhc3NpZ25tZW50IG9wZXJhdG9yIGluIGBiaWFzLXB1bGwtdXA9IDwwPjtg
Lgo+IC0tCj4gCj4gY29tbWl0IDRkYzZjOTJkNDI4MzFlODViMzhmMzM1MGMxNTcwN2QwZTJiM2Fm
MTgKPiBBdXRob3I6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiAKPiBy
aXNjdjogZHRzOiBzcGFjZW1pdDogZW5hYmxlIHRoZSBpMmMyIGFkYXB0ZXIgb24gSzMgUGljby1J
VFggYm9hcmQKPiAKPiBUaGlzIGNvbW1pdCBkZWZpbmVzIHRoZSBJMkMyIHBpbmN0cmwgcHJvcGVy
dGllcyBhbmQgZW5hYmxlcyB0aGUgYWRhcHRlcgo+IG9uIHRoZSBLMyBQaWNvLUlUWCBib2FyZC4g
SXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSAyNGMwMiBlZXByb20uCj4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1waW5jdHJsLmR0c2kgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpbmN0cmwuZHRzaQo+ID4gaW5kZXggMjM4OTlkM2YzMDhh
MC4uYzlmZTljMmU1YWVlZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazMtcGluY3RybC5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2szLXBpbmN0cmwuZHRzaQo+IAo+IFsgLi4uIF0KPiAKPiA+IEBAIC00NSw2ICs0NSwxNyBA
QCBnbWFjMC1waHktMC1waW5zIHsKPiA+ICAJCX07Cj4gPiAgCX07Cj4gPiAgCj4gPiArCS9vbWl0
LWlmLW5vLXJlZi8KPiA+ICsJaTJjMl8xX2NmZzogaTJjMi0xLWNmZyB7Cj4gPiArCQlpMmMyLTAt
cGlucyB7Cj4gCj4gW1NldmVyaXR5OiBMb3ddCj4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHNob3Vs
ZCB0aGlzIHN1Ym5vZGUgYmUgbmFtZWQgaTJjMi0xLXBpbnMgdG8gbWF0Y2gKPiB0aGUgaTJjMi0x
LWNmZyBwYXJlbnQgbm9kZT8gSXQgc2VlbXMgdG8gZGl2ZXJnZSBmcm9tIHRoZSBzdGFuZGFyZCBu
YW1pbmcKPiBwYXR0ZXJuIHdoZXJlIHRoZSBzdWZmaXggb2YgdGhlIHBhcmVudCBhbmQgY2hpbGQg
bWF0Y2hlcy4KPiAKPiA+ICsJCQlwaW5tdXggPSA8SzNfUEFEQ09ORig0NiwgNSk+LAkvKiBpMmMy
IHNjbCAqLwo+ID4gKwkJCQkgPEszX1BBRENPTkYoNDcsIDUpPjsJLyogaTJjMiBzZGEgKi8KPiA+
ICsKPiA+ICsJCQliaWFzLXB1bGwtdXA9IDwwPjsKPiAKPiBbU2V2ZXJpdHk6IExvd10KPiBUaGlz
IGlzbid0IGEgYnVnLCBidXQgdGhlcmUgaXMgYSBtaXNzaW5nIHNwYWNlIGJlZm9yZSB0aGUgZXF1
YWxzIHNpZ24KPiBoZXJlLCB3aGljaCBkaXZlcmdlcyBmcm9tIHRoZSBzcGFjaW5nIHVzZWQgaW4g
dGhlIHN1cnJvdW5kaW5nIGNvZGUuCj4gCj4gPiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MjU+Owo+
ID4gKwkJfTsKPiA+ICsJfTsKPiAKPiAtLSAKPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjAwNjIyMzguMzE5OTEwOC0xLWF1cmVsaWVu
QGF1cmVsMzIubmV0P3BhcnQ9Mgo+IAoKLS0gCkF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAg
ICAgICAgICAgICBHUEc6IDQwOTZSLzFEREQ4QzlCCmF1cmVsaWVuQGF1cmVsMzIubmV0ICAgICAg
ICAgICAgICAgICAgICAgaHR0cDovL2F1cmVsMzIubmV0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
