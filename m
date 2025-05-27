Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0734C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/1tU7yYmPNCk8sSy2Z0rAFAmz/qgxp8W01AOcpo3ow=; b=q0gvvfuBGHl8V6
	YbnCkmIYjkFbLTkVbni3TeLZmx4542OR1HxkeK36WgyolCIJIyHXW1DZszuGB4IIOv3JhuntzxM16
	cs5dGcBq6u4kjN/GeQf7UsW8lnZos51ylbnk6a1ZTYYRNQMod4M1YoMfROMPs8R9ZJgyaWtggjvpC
	5bstZY1wLKELRUhXuwO5um8udHFf2wq6ylxsfSmkBhu27FLe6gXHLUnFlUiYIelX4INBsGoDzEwOD
	Fh8kSANqSa7wf+41lDIXqi/i6r6iuo38w1s3ZCpJvKR5/II9kiEXVN/H1iTlwPxF+U8YWI1/9SoQ5
	1BenUpSaMjBWbBPJbe4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxqt-0000000BEj2-3syR;
	Tue, 27 May 2025 17:12:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxqs-0000000BEir-0b6V
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 17:12:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 969D1614BF
	for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 17:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408E4C4CEF3
	for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748365953;
	bh=WUiE6mOkGokIBRawwt92IgfGldTiF8TXF/+mVf5m/OA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VK6np2KHaEtjJdmxd5jsELKYx+XF0TAK3SX22xrcVROJu2TxVJ1Zd5Lv0RyqITPeK
	 Gv1sLAibJ52uHX/mtiUNAy8hDLds9us7IB3VN/h3F/I6bEidtQ+ujrRjrHhKGRjvMO
	 1VUcF5yS7FPXXb9mp0r3M/EB0OikLF9juqISLi5kmEiQhiMmLXUDgD6UPxGdlbG+RM
	 12g9F8kJZVpO5l+SCOAufOcn06seqrYnX67KkgkJOI7boxWJRkc3B3zBknheG4OVtN
	 fbdhYayqm9fXJ24zh6+rLdFZo591yVi/fe7ncUF5+eG437iwUwqg6oWGkC9gZgoXnd
	 MLP8krrmVzizg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad574992fcaso695907466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 10:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs4LUvGgCEiZdfDT1msPiszjmy+c/BF5VNmkaO3hfrzBg3gKVl/OoBQWKQE2DZUQpGrtUnu7Yhd+dbOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvEB78Kmw4vEBvJxx/DJQ5L93dqyIo4Tbwal2Jqs5G/KZJ1UkY
	Wd2RFDUWHK8f32MJBUAdI9AlwLztBQ+0weyUfOsdrfMc+M5XFCJwLAFSO8xGyHppouq+h19qt/T
	9vQDEyodsrEo1yp3bFUbvnR/oirAihA==
X-Google-Smtp-Source: AGHT+IEj0d2acVTcohj3NhA/pN4kp2Zkm+nnVAoR6tAiRDN91qU4TP+KWNsFVTc7BJ0txLXvs3sXC60T0GPWvmWnF+Y=
X-Received: by 2002:a17:906:c153:b0:ad5:55db:e40d with SMTP id
 a640c23a62f3a-ad85b12060fmr1137001666b.34.1748365951845; Tue, 27 May 2025
 10:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn> <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain> <20250527162539.GA423198-robh@kernel.org> <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
In-Reply-To: <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 May 2025 12:12:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKyXBaoYWrAsnyr6ytbvKMA3BaC=CmcgzgNtNvfabnEhg@mail.gmail.com>
X-Gm-Features: AX0GCFsGD9ubX4QqSo6FWt5M75Qo_NKyPFKbJhGfwS1yKHN5rUKKtSNDwBGxVPs
Message-ID: <CAL_JsqKyXBaoYWrAsnyr6ytbvKMA3BaC=CmcgzgNtNvfabnEhg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
To: Ze Huang <huangze@whut.edu.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMTE6NDLigK9BTSBaZSBIdWFuZyA8aHVhbmd6ZUB3aHV0
LmVkdS5jbj4gd3JvdGU6Cj4KPiBPbiA1LzI4LzI1IDEyOjI1IEFNLCBSb2IgSGVycmluZyB3cm90
ZToKPiA+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDA3OjEzOjA1UE0gKzA4MDAsIFplIEh1YW5n
IHdyb3RlOgo+ID4+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDA4OjUxOjE5QU0gKzAyMDAsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgTWF5IDI2LCAyMDI1IGF0IDEw
OjQwOjE4UE0gR01ULCBaZSBIdWFuZyB3cm90ZToKPiA+Pj4+IFNvbWUgZGV2aWNlcyBvbiB0aGUg
U3BhY2VtaVQgSzEgU29DIHBlcmZvcm0gRE1BIHRocm91Z2ggYSBtZW1vcnkgYnVzCj4gPj4+PiAo
TUJVUykgdGhhdCBpcyBub3QgdGhlaXIgaW1tZWRpYXRlIHBhcmVudCBpbiB0aGUgZGV2aWNlIHRy
ZWUuIFRoaXMgYnVzCj4gPj4+PiB1c2VzIGEgZGlmZmVyZW50IGFkZHJlc3MgbWFwcGluZyB0aGFu
IHRoZSBDUFUuCj4gPj4+Pgo+ID4+Pj4gVG8gZXhwcmVzcyB0aGlzIHRvcG9sb2d5IHByb3Blcmx5
LCBkZXZpY2VzIGFyZSBleHBlY3RlZCB0byB1c2UgdGhlCj4gPj4+PiBpbnRlcmNvbm5lY3RzIHdp
dGggbmFtZSAiZG1hLW1lbSIgdG8gcmVmZXJlbmNlIHRoZSBNQlVTIGNvbnRyb2xsZXIuCj4gPj4+
IEkgZG9uJ3QgZ2V0IGl0LCBzb3JyeS4gRGV2aWNlcyBwZXJmb3JtaW5nIERNQSB0aHJvdWdoIGZv
by1iYXIgc2hvdWxkIHVzZQo+ID4+PiBkbWFzIHByb3BlcnR5IGZvciBmb28tYmFyIERNQSBjb250
cm9sbGVyLiBJbnRlcmNvbm5lY3RzIGlzIG5vdCBmb3IgdGhhdC4KPiA+Pj4KPiA+PiBIaSBLcnp5
c3p0b2YsCj4gPj4KPiA+PiBTb3JyeSBmb3Igbm90IGNsYXJpZnlpbmcgdGhpcyBlYXJsaWVyIC0g
bGV0IG1lIHByb3ZpZGUgc29tZSBjb250ZXh0Lgo+ID4+Cj4gPj4gVGhlIHB1cnBvc2Ugb2YgdGhp
cyBub2RlIGlzIHRvIGRlc2NyaWJlIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIHVzZWQgZm9yIERN
QQo+ID4+IGRldmljZSB0byBtZW1vcnkgdHJhbnNhY3Rpb25zLiBJ4oCZbSB1c2luZyB0aGUgImlu
dGVyY29ubmVjdHMiIHByb3BlcnR5IHdpdGggdGhlCj4gPj4gcmVzZXJ2ZWQgbmFtZSAiZG1hLW1l
bSIgWzFdIGluIGNvbnN1bWVyIGRldmljZXMgdG8gZXhwcmVzcyB0aGlzIHJlbGF0aW9uc2hpcC4K
PiA+PiBUaGUgYWN0dWFsIHRyYW5zbGF0aW9uIGlzIGhhbmRsZWQgYnkgdGhlIGBvZl90cmFuc2xh
dGVfZG1hX2FkZHJlc3MoKWAgWzJdLgo+ID4+IFRoaXMgc3VwcG9ydCB3YXMgaW50cm9kdWNlZCBp
biB0aGUgc2VyaWVzIGxpbmtlZCBpbiBbM10uCj4gPj4KPiA+PiBUaGlzIHNldHVwIGlzIHNpbWls
YXIgdG8gd2hhdCB3ZSBzZWUgb24gcGxhdGZvcm1zIGxpa2UgQWxsd2lubmVyIHN1bjVpLAo+ID4+
IHN1bjhpLXI0MCwgYW5kIE5WSURJQSBUZWdyYS4gWzRdWzVdCj4gPj4KPiA+PiBJIGNvbnNpZGVy
ZWQgcmV1c2luZyB0aGUgZXhpc3RpbmcgQWxsd2lubmVyIE1CVVMgZHJpdmVyIGFuZCBiaW5kaW5n
cy4KPiA+PiBIb3dldmVyLCB0aGUgQWxsd2lubmVyIE1CVVMgaW5jbHVkZXMgYWRkaXRpb25hbCBm
dW5jdGlvbmFsaXR5IHN1Y2ggYXMKPiA+PiBiYW5kd2lkdGggbW9uaXRvcmluZyBhbmQgZnJlcXVl
bmN5IGNvbnRyb2wgLSBmZWF0dXJlcyB0aGF0IGFyZSBlaXRoZXIKPiA+PiBhYnNlbnQgb3IgdW5k
b2N1bWVudGVkIG9uIHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4gPiBUaGUgaW50ZXJjb25uZWN0IGJp
bmRpbmcgaXMgZm9yIHdoZW4geW91IGhhdmUgdGhvc2Ugc29mdHdhcmUgY29udHJvbHMuCj4gPiBJ
ZiB5b3Ugb25seSBoYXZlIGFkZHJlc3MgdHJhbnNsYXRpb24sIHRoZW4gJ2RtYS1yYW5nZXMnIGlu
IGEgcGFyZW50IG5vZGUKPiA+IGlzIGFsbCB5b3UgbmVlZC4KPiA+Cj4gPiBSb2IKPgo+IERpZmZl
cmVudCBkZXZpY2VzIG9uIHRoZSBTb0MgbWF5IGhhdmUgZGlzdGluY3QgRE1BIGFkZHJlc3MgdHJh
bnNsYXRpb25zLgo+IEEgY29tbW9uIGRtYS1yYW5nZXMgaW4gdGhlIHBhcmVudCBub2RlIG1heSBu
b3QgcmVwcmVzZW50IHRoaXMgYWNjdXJhdGVseS4KClRoYXQgaXMgc29sdmVkIHdpdGggZGlmZmVy
ZW50IHBhcmVudCBidXMgbm9kZXMgd2hpY2ggd291bGQgYmUgYSBtb3JlCmFjY3VyYXRlIHJlcHJl
c2VudGF0aW9uIG9mIHRoZSBoL3cuIElmIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGlzCmRpZmZl
cmVudCB0aGVuLCB0aGUgZGV2aWNlcyBoYXZlIHRvIGJlIG9uIGRpZmZlcmVudCBidXNlcy4KCllv
dSBjYW4gdXNlIGludGVyY29ubmVjdCBiaW5kaW5nLCBidXQgeW91IG5lZWQgdG8gYWNjdXJhdGVs
eSBkZXNjcmliZQp0aGUgaW50ZXJjb25uZWN0IHByb3ZpZGVyLgoKUm9iCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
