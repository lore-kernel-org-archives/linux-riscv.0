Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB101CF8854
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBrwp2PLwNXBCO40HfA3twIQr1qK5D4Vf5GeJ3H8k+Y=; b=SOyX+JwOLMJFHr
	Q5I8OIdFRhPht1vk9bjX00NCfpxgjba6KdFwbXC+es0OD12DFyw1KoxeEsD+Swf5SgOKCk0PevBPz
	+iqNXew/CfHtfPLV1s5XxoaxSO4HaHIc+LPuQc6DzMG45q0H51St4Gt4WMIDAsRWeyVk52cudhSwV
	zXvRv08/gIgQkjCC0bO7ELg2JSqzgva+5l9Hp2FrvK5snQyhVz7F2JB3qt8MevKWwQpkix6+12PFC
	zqU4hraLTcuuRYxvVJ+13yFpQ+lmSb3JbwccjzBviU8tvr/4mkWLPgzFnnMo+xDrA2hn3RpSvHfQh
	vnH0T1gI+u7vB57S61pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4A4-00000006gVh-42w4;
	Thu, 20 Nov 2025 12:53:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4A4-00000006gVb-02Ca
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 12:53:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27A6B60151;
	Thu, 20 Nov 2025 12:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4000C4CEF1;
	Thu, 20 Nov 2025 12:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763643198;
	bh=HY5APUpuR+sr77zB4EWBbolIME6/0akJx2Si3AryqfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6fzp58EAr3KWijSviIXyjHx1PGSNA2+wxqkh2rfr4aIIeurJD1xq6+ADlxU2TjEk
	 MbZYgtDUyXMPAY6mF2MvtABCTIKSd2ky+anxptouH8ldUeZdtf8zNf8daJdKpQacVX
	 zSTw3aGD+j5mIaa+heGzRGsZm2STyUkTf7SFRgAtXLLcQYX5OgVo7Ev1dRgDZweAcb
	 dDQEtUfvGgSq1FWLJr54UYqBuYvKFJqi3awpOlrBfKjRD0X35/5S53yEVD7qgJYJkD
	 NsDUASDFtHuiLHU4tjxq4JtVsf2SvIFX06zMWiE5YlQFK+xvvA54fxOjimAyBL3N5J
	 XcyD+goIIotvA==
Date: Thu, 20 Nov 2025 18:22:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: starfive,jh7110-pcie: Add
 enable-gpios property
Message-ID: <xxswzi4v6gpuqbe3cczj2yjmprhvln26fl5ligsp5vkiogrnwk@hpifxivaps6j>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
 <20251120082946.109378-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120082946.109378-2-hal.feng@starfivetech.com>
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

T24gVGh1LCBOb3YgMjAsIDIwMjUgYXQgMDQ6Mjk6NDJQTSArMDgwMCwgSGFsIEZlbmcgd3JvdGU6
Cj4gQWRkIGVuYWJsZS1ncGlvcyBwcm9wZXJ0eSBmb3IgY29udHJvbGxpbmcgdGhlIFBDSSBidXMg
ZGV2aWNlIHBvd2VyLgo+IFRoaXMgcHJvcGVydHkgaGFkIGJlZW4gc3VwcG9ydGVkIGluIHRoZSBk
cml2ZXIgYnV0IG5vdCBhZGRlZCBpbiB0aGUKPiBkdC1iaW5kaW5ncy4KPiAKPiBBY2tlZC1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBGaXhlczogMjJmZTMy
MjM5NzcwICgiZHQtYmluZGluZ3M6IFBDSTogQWRkIFN0YXJGaXZlIEpINzExMCBQQ0llIGNvbnRy
b2xsZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2gu
Y29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc3RhcmZpdmUsamg3MTEw
LXBjaWUueWFtbCAgICAgICAgIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sCj4gaW5kZXggMzNjODA2MjZl
OGVjLi4xZTM2ZjkyZWM4NTIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zdGFyZml2ZSxqaDcxMTAtcGNpZS55YW1sCj4g
QEAgLTU5LDYgKzU5LDEwIEBAIHByb3BlcnRpZXM6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiAgICAg
ICAgVGhlIHBoYW5kbGUgdG8gU3lzdGVtIFJlZ2lzdGVyIENvbnRyb2xsZXIgc3lzY29uIG5vZGUu
Cj4gIAo+ICsgIGVuYWJsZS1ncGlvczoKPiArICAgIGRlc2NyaXB0aW9uOiBHUElPIHVzZWQgdG8g
ZW5hYmxlIHRoZSBQQ0kgYnVzIGRldmljZSBwb3dlcgoKVGhpcyBmZWVscyB3cm9uZyB0byBtZS4g
SXMgdGhpcyBHUElPIGFzc29jaWF0ZWQgd2l0aCB0aGUgUENJZSBjb250cm9sbGVyPyBJIGJldAp0
aGlzIGlzIGp1c3QgY29udHJvbGxpbmcgc29tZSByZWd1bGF0b3IgdGhhdCBwb3dlcnMgdGhlIFZE
RCBvZiB0aGUgUENJZQpkZXZpY2Uvc2xvdC4gSWYgc28sIHRoaXMgc2hvdWxkIGJlIGFkZGVkIGFz
IGEgcGFydCBvZiB0aGUgcmVndWxhdG9yIG5vZGUgYW5kCnJlZmVyZW5jZWQgaW4gdGhlIFBDSWUg
bm9kZSB1c2luZyB0aGUgZXhpc3RpbmcgLXN1cHBseSBwcm9wZXJ0aWVzLgoKLSBNYW5pCgotLSAK
4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
