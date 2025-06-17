Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D01CC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU0MiwZ32cJ/HR7VMdBdBA7XgG21nZiMdyrDPFhYWYU=; b=UY+tTCa4Oq68Gh
	fbxChl0Vq2FIk90IujF5Bo+wytBr0IX4MdHr2pHDuo0hlYLr38vWl7ugWC+pDq7cxCO/ihjJy1RL1
	7uT79xgV0XLkj0qGoR1FifzmibxrBCqvkvP5oE7rTVRNU3Tht831jN01KyGg0a7rzDAonwK+4DNX8
	AQ9lgXM2TP2tDExXUNVXd6zq1pLnu3QohI8z5vG1vkruFS8U+tBEZ6XIORqy00aupswnaiDMIJeGW
	7ZlOihe+DbxS1vbGpov944cDWnhRUgRX8WE5VLLR0J+3xPvEobzRPeo+74jLktcXZ2rWfzMpowsGn
	WF3Cv/eDm6IdfvkwqZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQuc-00000006U7Y-2Pq4;
	Tue, 17 Jun 2025 07:39:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQuZ-00000006U62-0EpO
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:39:16 +0000
Date: Tue, 17 Jun 2025 09:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750145952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUjG6+JFxLZDStRNnT8ioKp8RqTOmg0bGcH75TxHJOo=;
	b=LQqR6ibEuyBEC7uwHHtnbVzvvooJNrTvO3oXqLrInJhDVXhZtr/gNdtPqVlrTxlenvdbRZ
	RnHN7iVlyBuYyZiSaE1AIArJAPtizX2fRnqAhJe6uiUXXlFZOQ729I9/gS4GVU7O7ePnd6
	Brh+HSm4WXshRLvZoWd5xxBzlMQKduMd/6lGt5nw6MqflQ2v4FTgWVregP7xTNLP+Yuzc+
	ybhMgXXRgjtX5mfxmcebXoLmfXe1IgbHqGynqe6AGe/XwzUdMLF35HWuR/RCpmEnyerE6H
	aO31q/Nd9xiou/f5+oOoRBHfBajKMQfD+n3V5gkOUNEUDwQTphRJe5Pr2eYMig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750145952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUjG6+JFxLZDStRNnT8ioKp8RqTOmg0bGcH75TxHJOo=;
	b=FHtGhuDpN/5Xuy91ovmc3tSQjnTi2R4gYX20+L0rJCOATaiEhbU7vlEdMIy3pGCokkZDf5
	Tyyjyt1nxeTJX1Ag==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 02/16] kbuild: userprogs: also inherit byte order and
 ABI from kernel
Message-ID: <20250617093523-e7f54d95-96d0-4411-92d6-dd80fe84ee98@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
 <CAK7LNATuk_tpDAq07e5oSU4FptRO_88Oxh2=W=3YmBotbGuU5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNATuk_tpDAq07e5oSU4FptRO_88Oxh2=W=3YmBotbGuU5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_003915_242424_09098FA2 
X-CRM114-Status: GOOD (  20.50  )
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMTE6NDk6NDFQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDQ6MzjigK9QTSBUaG9tYXMgV2Vpw59z
Y2h1aAo+IDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPiA+Cj4gPiBN
YWtlIHN1cmUgdGhlIGJ5dGUgb3JkZXIgYW5kIEFCSSBvZiB0aGUgdXNlcnByb2dzIG1hdGNoZXMg
dGhlIG9uZSBvZiB0aGUKPiA+IGtlcm5lbCwgc2ltaWxhciB0byBob3cgdGhlIGJpdCBzaXplIGlz
IGhhbmRsZWQuCj4gPiBPdGhlcndpc2UgdGhlIHVzZXJwcm9ncyBtYXkgbm90IGJlIGV4ZWN1dGFi
bGUuCj4gPiBUaGlzIGhhcHBlbnMgZm9yIGV4YW1wbGUgb24gcG93ZXJwYyBsaXR0bGUgZW5kaWFu
LCBvciByaXNjdjMyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0
aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgo+ID4gLS0tCj4gPiAgTWFrZWZpbGUgfCA0
ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gPiBpbmRleCBjNDI5
M2NmOTFlOTY4Y2E4ZWU2NDQ1Mjg0MWZiMjY2ZTI0ZGY2M2Y2Li5iOWFhMTA1ODMyMWRhYmQzYjNk
ZDU2MTBlNDVhMjgwN2RmYTI1N2Y0IDEwMDY0NAo+ID4gLS0tIGEvTWFrZWZpbGUKPiA+ICsrKyBi
L01ha2VmaWxlCj4gPiBAQCAtMTEyOSw4ICsxMTI5LDggQEAgaWZuZXEgKCQoQ09ORklHX0FSQ0hf
Vk1MSU5VWF9ORUVEU19SRUxPQ1MpLCkKPiA+ICBMREZMQUdTX3ZtbGludXggICAgICAgICs9IC0t
ZW1pdC1yZWxvY3MgLS1kaXNjYXJkLW5vbmUKPiA+ICBlbmRpZgo+ID4KPiA+IC0jIEFsaWduIHRo
ZSBiaXQgc2l6ZSBvZiB1c2Vyc3BhY2UgcHJvZ3JhbXMgd2l0aCB0aGUga2VybmVsCj4gPiAtVVNF
UkZMQUdTX0ZST01fS0VSTkVMIDo9IC1tMzIgLW02NCAtLXRhcmdldD0lCj4gPiArIyBBbGlnbiB0
aGUgYml0IHNpemUsIGJ5dGUgb3JkZXIgYW5kIGFyY2hpdGVjdHVyZSBvZiB1c2Vyc3BhY2UgcHJv
Z3JhbXMgd2l0aCB0aGUga2VybmVsCj4gPiArVVNFUkZMQUdTX0ZST01fS0VSTkVMIDo9IC1tMzIg
LW02NCAtbWxpdHRsZS1lbmRpYW4gLW1iaWctZW5kaWFuIC0tdGFyZ2V0PSUgLW1hcmNoPSUgLW1h
Ymk9JQo+ID4gIEtCVUlMRF9VU0VSQ0ZMQUdTICArPSAkKGZpbHRlciAkKFVTRVJGTEFHU19GUk9N
X0tFUk5FTCksICQoS0JVSUxEX0NQUEZMQUdTKSAkKEtCVUlMRF9DRkxBR1MpKQo+ID4gIEtCVUlM
RF9VU0VSTERGTEFHUyArPSAkKGZpbHRlciAkKFVTRVJGTEFHU19GUk9NX0tFUk5FTCksICQoS0JV
SUxEX0NQUEZMQUdTKSAkKEtCVUlMRF9DRkxBR1MpKQo+IAo+IAo+IFdoeSBkaWRuJ3QgeW91IGRv
IGxpa2UgdGhpcz8KPiAKPiBVU0VSRkxBR1NfRlJPTV9LRVJORUwgOj0gJChmaWx0ZXIgLW0zMiAt
bTY0IC1tbGl0dGxlLWVuZGlhbgo+IC1tYmlnLWVuZGlhbiAtLXRhcmdldD0lIC1tYXJjaD0lIC1t
YWJpPSUsICQoS0JVSUxEX0NQUEZMQUdTKQo+ICQoS0JVSUxEX0NGTEFHUykpCj4gS0JVSUxEX1VT
RVJDRkxBR1MgICs9ICQoVVNFUkZMQUdTX0ZST01fS0VSTkVMKQo+IEtCVUlMRF9VU0VSTERGTEFH
UyArPSAkKFVTRVJGTEFHU19GUk9NX0tFUk5FTCkKClRoZSBpZGVhIHdhcyB0byBrZWVwIHRoZSBV
U0VSRkxBR1NfRlJPTV9LRVJORUwgbGluZSBmcmVlIG9mIGNsdXR0ZXIsIGFzIGl0IGlzCnByb2Jh
Ymx5IGdvaW5nIHRvIGNoYW5nZSBtb3JlIG9mdGVuLiBUbyBpbXByb3ZlIHJldmlld2FiaWxpdHkg
YW5kIGdhaW4gc29tZQphdmFpbGFibGUgaG9yaXpvbnRhbCBzcGFjZSBpbiBjYXNlIGl0IHNob3Vs
ZCBiZSBuZWVkZWQgYXQgc29tZSBwb2ludC4KCklmIHlvdSBwcmVmZXIgdGhlIG90aGVyIGxheW91
dCBJJ2xsIGJlIGhhcHB5IHRvIHN3aXRjaCBpdCBhcm91bmQuCgoKVGhvbWFzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
