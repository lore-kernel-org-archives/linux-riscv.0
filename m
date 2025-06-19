Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF55C7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgsmtwMTTYHCoNW74Oxrklh6RoVzKaZwC3ichJ5Z/9g=; b=PC1UU5MuJQhtTa
	IL1J0cy3/f0vW6riYDtPIqUWCdUjDU0Tm3kVimsYRauQDJe3drVZq8njfcVs8dJ3qIhvu2/LYGNUV
	vd92q80kHvEbkeXu7BgU4NKrHpHWCnSDS1Vq6X7F3jhIcSS08JmqnNjs2+OLcpUZwdVyAG9NcxP9Q
	cX0q5ux1zBOTO5V1CzG2sh7AlqH/UFJyQgG39ozUPPEtd2wNhZCDD2ZQWYaLLNvta8Df7Z7pP5pJi
	Q012+auPzx4XypevQ9CtEVKlpUJZqVMg68+P4aGbYtHVYw8iqBqmNqfv5w9AjB0foArimWjvBJGC3
	Y6aS0f+7R1WL+Ld89vfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7N-0000000DtMM-18TL;
	Thu, 19 Jun 2025 18:36:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGSg-0000000DIcl-2Zxk
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 14:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D8815C5666;
	Thu, 19 Jun 2025 14:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7222EC4CEEA;
	Thu, 19 Jun 2025 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344113;
	bh=9FjL7jXN7+I+9siWGEmJXJzuW18Q3lpA7eWXzplUB2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivAw6wtrYKgkzWLYkf2Hp+qnnUqbKbOFmACm8FbuOwTPxq6h/KixDqlZCvtLU6fQx
	 G/tqyvalqNt4FjgKdn02u+4neUnD0S6pad7GvwyyxSP2rkUZfDwn/AIixoCzSXovsP
	 ckad/x+2+vVjSLzVrmZJIWmDVOC4zjxEtSieNfP6n52my/DhwaeOPeyaJhAh7qDLYv
	 7v0pLwICmCVACwSrLI+8EnJw/YA9cFy5rnt8z7wSmlE/PtW1IBBMOwMEa4GYSXyIkl
	 ROWKwASDP3wTCyLN1VfdIIix74mfC6ApDdGfCC4ha7y+x0ZH+Bu1grKvcr1O6GdyeZ
	 7B3+jBXQc7uyA==
Date: Thu, 19 Jun 2025 15:41:47 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250619144147.GH795775@google.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250619144023.GG795775@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_074154_694543_64BE5C48 
X-CRM114-Status: GOOD (  17.16  )
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

T24gVGh1LCAxOSBKdW4gMjAyNSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBGcmksIDEzIEp1biAy
MDI1LCBBbGV4IEVsZGVyIHdyb3RlOgo+IAo+ID4gQWRkIHN1cHBvcnQgZm9yIFNwYWNlbWlUIFBN
SUNzLiBJbml0aWFsbHkgb25seSB0aGUgUDEgUE1JQyBpcyBzdXBwb3J0ZWQKPiA+IGJ1dCB0aGUg
ZHJpdmVyIGlzIHN0cnVjdHVyZWQgdG8gYWxsb3cgc3VwcG9ydCBmb3Igb3RoZXJzIHRvIGJlIGFk
ZGVkLgo+ID4gCj4gPiBUaGUgUDEgUE1JQyBpcyBjb250cm9sbGVkIGJ5IEkyQywgYW5kIGlzIG5v
cm1hbGx5IGltcGxlbWVudGVkIHdpdGggdGhlCj4gPiBTcGFjZW1pVCBLMSBTb0MuICBUaGlzIFBN
SUMgcHJvdmlkZXMgc2l4IGJ1Y2sgY29udmVydGVycyBhbmQgMTIgTERPCj4gCj4gc2l4IG9yIDEy
LiAgUGxlYXNlIHBpY2sgYSBmb3JtYXQgYW5kIHJlbWFpbiBjb25zaXN0ZW50Lgo+IAo+ID4gcmVn
dWxhdG9ycy4gIEl0IGFsc28gaW1wbGVtZW50cyBhIHN3aXRjaCwgd2F0Y2hkb2cgdGltZXIsIHJl
YWwtdGltZSBjbG9jaywKPiA+IGFuZCBtb3JlLCBidXQgaW5pdGlhbGx5IHdlIHdpbGwgb25seSBz
dXBwb3J0IGl0cyByZWd1bGF0b3JzLgo+IAo+IFlvdSBoYXZlIHRvIHByb3ZpZGUgc3VwcG9ydCBm
b3IgbW9yZSB0aGFuIG9uZSBkZXZpY2UgZm9yIHRoaXMgdG8gYmUKPiBhY2NlcHRlZCBpbnRvIE1G
RC4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICB8IDExICsrKysrCj4gPiAg
ZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgIHwgIDEgKwo+ID4gIGRyaXZlcnMvbWZkL3NwYWNl
bWl0LXBtaWMuYyB8IDkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
ICAzIGZpbGVzIGNoYW5nZWQsIDEwMyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbWZkL3NwYWNlbWl0LXBtaWMuYwoKUmlnaHQgbm93LCBpdCBsb29rcyBsaWtl
IGFsbCB5b3UgbmVlZCBpczoKCmRyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMKCi0tIApMZWUg
Sm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
