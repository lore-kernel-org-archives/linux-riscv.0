Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B00CA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haZVcNdMh7mGtrpCB+pKONJrsfhaoDafvke/s0Z5lRw=; b=rQKVjjWGrWVUiG
	nPbChiJjOiErWuAKgsDK4Dhi1dDLsV3mBuCzEfzuT5Oz4wNhEQqwOjHcufRlUrKb13CbKhUDm3vMw
	pJYecaA5ZxtNCmT0JzfjaR/f+AZWeI21mNCvkO2XBovX2uHyfJA+oAnVBedF3cSKz6pX5m7au0Bw0
	ou3yMV4eHGHEnhsC0ca3cHQc6T2r2y9WyFMc+bUTItk/dVyA02AkLvurX8SofVMeqn0cwZuop4out
	MAt6hFIcQChmkNLTQ4PwEFrEpmGU8tKjyGpglXwsDTKDuxwm900ltjPzbYUEI6hTeg94nL+qT3AJv
	KdiuKKA/RWrKI0EBHiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxhA-00000006m4L-0f0A;
	Wed, 30 Sep 2026 17:02:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxh8-00000006m3s-1nEx
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 17:02:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3B7C41780;
	Wed, 30 Sep 2026 17:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD61F00899;
	Wed, 30 Sep 2026 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790787733;
	bh=kExIdmmHUDkx7q8lF/7jaDyfGg/4Py0IVS631gipGEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EexhOiGd1zY0qJR7a8EtS79ow7rKI/xnnaIc5uPgKXCYBwZnnbHkmjTr1oae9vWG5
	 hJCf6ZPtKgUJPYCaygBs4Og4wH38IumAu/UmBtRlU4R0rY8jF3TlKSfsAs69B0Up/5
	 auw/HyRT8v/M5CH2+dtQd/OE/2GfBaLqJnonVLM89AbJFhDLvIIBusFGz0pdoOKT6+
	 zGKVnV23M99oGDf+1PTW/szt647CIc8mc2dN8WKnslM+3DkRdnlwwt9tBjioINglgd
	 IN2yMYOK4EIVdlQ/XTy5ne4k16r73D4XnLE5oOzcwiX5Eibkmy7KB3n9SCZ1Wt7GM+
	 IX/2cybTnnRBQ==
Date: Wed, 30 Sep 2026 10:02:12 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <ar1AlKUs9gwTDWWR@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
 <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
 <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
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

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMTA6Mzc6MjhQTSArMDgwMCwgSGFuIEdhbyB3cm90ZToK
PiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCA3OjUx4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIFNlcCAyOSwgMjAyNiBhdCAw
NjoyMjo0NVBNICswODAwLCBIYW4gR2FvIHdyb3RlOgo+ID4gPiBEb2N1bWVudCB0aGUgTWlsay1W
IE1lbGVzIGJvYXJkIGNvbXBhdGlibGUgd2l0aCB0aGUgVEgxNTIwIGZhbGxiYWNrLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gPiA+IC0t
LQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlh
bWwgfCA0ICsrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ID4K
PiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di90aGVhZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Ro
ZWFkLnlhbWwKPiA+ID4gaW5kZXggMzAxOTEyZGNkMjkwZTYwZjgxNmQzODAxNTI1OTExMDZkZTk0
MTViNC4uNTM2MTAyMWI4ZGNjOTg5NzgwM2E1OTE1NjY1YzZiYjgzMzA5ZmU1MyAxMDA2NDQKPiA+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlh
bWwKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Ro
ZWFkLnlhbWwKPiA+ID4gQEAgLTIxLDYgKzIxLDEwIEBAIHByb3BlcnRpZXM6Cj4gPiA+ICAgICAg
ICAgIGl0ZW1zOgo+ID4gPiAgICAgICAgICAgIC0gY29uc3Q6IGJlYWdsZSxiZWFnbGV2LWFoZWFk
Cj4gPiA+ICAgICAgICAgICAgLSBjb25zdDogdGhlYWQsdGgxNTIwCj4gPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBNaWxrLVYgTWVsZXMgc2luZ2xlIGJvYXJkIGNvbXB1dGVyCj4gPiA+ICsgICAg
ICAgIGl0ZW1zOgo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IG1pbGt2LG1lbGVzCj4gPgo+ID4g
V2h5IGlzbid0IHRoaXMgZW51bSB3aXRoIHRoZSBwcmV2aW91cyBlbnRyeT8KPiAKPiBNZXJnaW5n
IHdpbGwgcmVzdWx0IGluIHRoZSBsb3NzIG9mIFNCQyBtYW51ZmFjdHVyZXIgaW5mb3JtYXRpb24u
Cj4gTWlsay1WIGlzIGFuIGluZGVwZW5kZW50IG1hbnVmYWN0dXJlci4KPiAKPiBUaGFua3MsCj4g
SGFuCgpJIHRoaW5rIHRoZSBmZWVkYmFjayBpcyB0aGF0IEJlYWdsZVYgQWhlYWQgYW5kIE1pbGst
ViBNZWxlcyBoYXZlIHRoZQpzYW1lIHBhdHRlcm4gYW5kIGl0IGNvdWxkIGJlIGNoYW5nZWQgdG86
CgogICAgICAtIGRlc2NyaXB0aW9uOiBUSDE1MjAgc2luZ2xlIGJvYXJkIGNvbXB1dGVycwogICAg
ICAgIGl0ZW1zOgogICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgIC0gYmVhZ2xlLGJlYWds
ZXYtYWhlYWQKICAgICAgICAgICAgICAtIG1pbGt2LG1lbGVzCiAgICAgICAgICAtIGNvbnN0OiB0
aGVhZCx0aDE1MjAKCklzIHRoYXQgcmlnaHQsIEtyenlzenRvZj8KClRoYW5rcywKRHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
