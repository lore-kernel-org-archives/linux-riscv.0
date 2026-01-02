Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04258EEE265
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 03:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajxXlxITcip16oTCGoJz2tGdKqdLPV9PZD7ihqfJNLI=; b=iOvSUFI2tKRp89
	pNTl8x/FRi9yLHVgZ073ezA9P6iriUCz4aCEc9euDRQSYr/zWiIR29i0beGj3wggL4qyRB4c1Ngc3
	7nHk973YI15QaqKTxhTqjTCgNC850n9o6qABCffeqyjBvlTH0IRCXIq+gVpmm8U0P46q8pPgsFc8c
	XXWxfcVcRfd3S8SETPmKIAp9WJXfMG3683tBhNGaPV8bLm37MZbJjlK9oZfaYCigqQe6CDXXiLv+P
	ET2V51lRjSvkaos253lVIL1+Wbf6xJ8DcC5uriyXJO5AWELKJJtS4w6P1NjbNQ2+lLJ/9yX5jIMck
	KMzgRaVgKuiNmxJcePXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbVio-00000007kAs-2nFy;
	Fri, 02 Jan 2026 03:21:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbVim-00000007kAT-1nq7
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 03:21:01 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7FBAB341EDE;
	Fri, 02 Jan 2026 03:20:56 +0000 (UTC)
Date: Fri, 2 Jan 2026 11:20:52 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
Message-ID: <20260102032052-GYA2053787@gentoo.org>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
 <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_192100_493957_68AE247B 
X-CRM114-Status: GOOD (  17.54  )
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

SGkgTGludXMsIEtyenlzenRvZiwgCgpPbiAyMzo0OSBUaHUgMDEgSmFuICAgICAsIExpbnVzIFdh
bGxlaWogd3JvdGU6Cj4gSGkgWWl4dW4sCj4gCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoZXMhCj4g
Cj4gT24gRnJpLCBEZWMgMjYsIDIwMjUgYXQgMTo1OOKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50
b28ub3JnPiB3cm90ZToKPiAKPiA+IFRoaXMgc2VyaWVzIGF0dGVtcHQgdG8gYWRkIHBpbmN0cmwg
c3VwcG9ydCBmb3IgU3BhY2VtaVQgSzMgU29DLAo+ID4KPiA+IEkndmUgcmVtb3ZlZCB0aGUgUkZD
IHRhZyBhcyB0aGUgZHJpdmVyIGlzIHRlc3RlZCBvbiBLMyBTb0MuCj4gPgo+ID4gVGhlIEszIHBp
bmN0cmwgSVAgc2hhcmVzIGFsbW9zdCBzYW1lIGxvZ2ljIHdpdGggcHJldmlvdXMgSzEgU29DIGdl
bmVyYXRpb24sCj4gPiBidXQgaGFzIGRpZmZlcmVudCByZWdpc3RlciBvZmZzZXQgYW5kIHBpbiBj
b25maWd1cmF0aW9uLCBJJ3ZlIGludHJvZHVjZWQKPiA+IGEgcGluX3RvX29mZnNldCgpIGZ1bmN0
aW9uIHRvIGhhbmRsZSB0aGUgZGlmZmVyZW5jZSBvZiByZWdpc3RlciBvZmZzZXQuCj4gPiBmb3Ig
dGhlIGRyaXZlIHN0cmVuZ3RoIGFuZCBzY2htaXR0ZXIgdHJpZ2dlciBzZXR0aW5ncywgdGhleSBh
cmUgYWxzbyBjaGFuZ2VkLgo+ID4KPiA+IFRoZSBwYXRjaCAjMSB0cnkgdG8gYWRkIHBpbiBzdXBw
b3J0IHdoaWNoIHNob3VsZCBoYW5kbGUgcGluIG11eCwgd2hpbGUgcGF0Y2ggIzIKPiA+IGFkanVz
dCBkcml2ZSBzdHJlbmd0aCBhbmQgc2NobWl0dGVyIHRyaWdnZXIgc2V0dGluZ3MgYWNjb3JkaW5n
bHkgZm9yIG5ldyBTb0MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGdl
bnRvby5vcmc+Cj4gCj4gQXMgS3J6eXN6dG9mIG1lbnRpb25lZCwgdHJ5IHRvIHVzZSBhbiBleHBs
aWNpdCBkZXZpY2UgdHJlZSBzY2hlbWEgdG8KPiBlbmZvcmNlIHRoZSBsZWdhbCBkcml2ZSBzdHJl
bmd0aCB2YWx1ZXMgYXMgZS5nLiBlbnVtcy4KPiAKT2ssIEkgd2lsbCBhZGRyZXNzIHRoaXMgaW4g
djMKCj4gT3RoZXIgdGhhbiB0aGlzIHRoZSBjb2RlIGxvb2tzIGZpbmUgc28gb25jZSB0aGUgYmlu
ZGluZ3MgYXJlCj4gQUNLOmVkIEknbSByZWFkeSB0byBtZXJnZSB0aGlzLgo+IApUaGFua3MKCi0t
IApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
