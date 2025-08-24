Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88CACA0EFC
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIocU+Gi9ko/8R2cPPir+iytv8I3SwndmDoh2FOlo+o=; b=hnnfDHvFFCasWT
	hY8DISlbYj2r/k5jD+ft3hJ2Qz6J/S9WgE1oyongjatwDzPY+DUhpm4WNADvQzt1/VRj9R6n7AWFj
	OApY4kbeNGhfXV3zLx5xh3F6rq5N9AQceNNHmNiQxYoL4YhceFq2wBerdtQ4T0N+JRWb/091snhT9
	5XhOt7HJYceHorOkMZrPZOB9nLM2T6QaG/VuLrh9Spq484TdVcOASuWfXWl9ZFRBdYiltnjesHq3j
	3mq/UHvw7MzmpfBC5310hVectPDbQ1f0gPRZ5GpSnSceeuD9k65KzA7n36bJafQi367BemLLih5h9
	bvN5SLXZKTcPJfPLJ6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqEIe-00000006OEn-2KdW;
	Sun, 24 Aug 2025 17:14:36 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqEIc-00000006ODE-1Es2
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 17:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756055668; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F5L+s6CtEJaU9st9+VBI3Sh4QXHcapPHcLRjBgsWbp+hccafZgx5b7OSEAtf0KYDnw1sXInhBM9mE3L9DA1e69OKM0SHkX2lYfI5oFvcqVrorgmVf6xbXAJ9m7JbCnm3szzC+zBOh/JAA8N4JO/DIXIT2Ta7ZGLasDVHlvWublM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756055668; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R1gD2jfyb4BmBrjWz3o7hpNYbWv/+2jGzDA7n8rOWsk=; 
	b=Ztt95mkmsb6Gp87jZOZoBCDhf2GD85YBUF4p1sPYxSjXVLyl9el957W7VDqbaFvodrKrcAV2RXwcGH+Vyj2Rwh+f9zOOd6t/83mZsC655MAtRLy+uW7XNWOMSHh2vdG4c9H7a+WhNvJOD/LhKbwuSeYlTO8AaFoMw5Ax3VhBfFI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756055667;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=R1gD2jfyb4BmBrjWz3o7hpNYbWv/+2jGzDA7n8rOWsk=;
	b=eqoTznau3WYQR8oWtCsVoWN9qkYRcnVzUzUCsxzSyspwSuUbtPoMAmFKpodWzGBs
	atUGeCifFvL+TolR+fD83bU3uijOtT41dXvm39vNmQJGR/Tlv+GDpMh4l9vSxJGX6pb
	/AMLRRRp2MgLphGlmlQQppI7/a1FrXF1Fs81fwCuTc+3yYZfhx12t90kFOsaU4y6H7o
	L9M091EDnCfut8qUw+rJNfc0azGPF68jbq0opYxXm5fqqi2b+q5r7f1vc4jEtI/fwaR
	31UNeIkCE9eu0ttE7fBjfj2xkRV/d4S8vIaxrYKsIACavfbxKPyzLmMbP43t+JKG9LJ
	TgYVe1fRLQ==
Received: by mx.zohomail.com with SMTPS id 1756055665959275.19546769364956;
	Sun, 24 Aug 2025 10:14:25 -0700 (PDT)
Message-ID: <3c2b62e219e50555319da369cafa9a8f79eb71e8.camel@icenowy.me>
Subject: Re: [RFC 1/3] dt-bindings: riscv: Add StarFive JH7110S SoC and
 VisionFive 2 Lite board
From: Icenowy Zheng <uwu@icenowy.me>
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley
 <conor+dt@kernel.org>,  Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 25 Aug 2025 01:14:18 +0800
In-Reply-To: <20250821100930.71404-2-hal.feng@starfivetech.com>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
	 <20250821100930.71404-2-hal.feng@starfivetech.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_101434_406989_7C16F250 
X-CRM114-Status: GOOD (  11.32  )
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

5ZyoIDIwMjUtMDgtMjHmmJ/mnJ/lm5vnmoQgMTg6MDkgKzA4MDDvvIxIYWwgRmVuZ+WGmemBk++8
mgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFN0YXJGaXZlIEpINzExMFMgU29D
Cj4gYW5kIHRoZSBWaXNpb25GaXZlIDIgTGl0ZSBib2FyZCBlcXVpcHBlZCB3aXRoIGl0Lgo+IAo+
IEpINzExMFMgU29DIGlzIGFuIGluZHVzdHJpYWwgU29DIHdoaWNoIGNhbiBydW4gYXQgLTQwfjg1
IGRlZ3JlZXMKPiBjZW50aWdyYWRlCj4gYW5kIHVwIHRvIDEuMjVHSHouIEl0cyBDUFUgY29yZXMg
YW5kIHBlcmlwaGVyYWxzIGFyZSBtb3N0bHkgc2ltaWxhcgo+IHRvCj4gdGhvc2Ugb2YgdGhlIEpI
NzExMCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZl
dGVjaC5jb20+Cj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc3RhcmZpdmUueWFtbCB8IDUgKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L3N0YXJmaXZlLnlhbWwKPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9zdGFyZml2ZS55YW1sCj4gaW5kZXggN2VmODUxNzQzNTNkLi5hMjk1MjQ5MDcwOWYg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3N0
YXJmaXZlLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc3RhcmZpdmUueWFtbAo+IEBAIC0zMyw2ICszMywxMSBAQCBwcm9wZXJ0aWVzOgo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBzdGFyZml2ZSx2aXNpb25maXZlLTItdjEuM2IKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdGFyZml2ZSxqaDcxMTAKPiDCoAo+ICvCoMKg
wqDCoMKgIC0gaXRlbXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gc3RhcmZpdmUsdmlzaW9uZml2ZS0yLWxpdGUKPiArwqDCoMKg
wqDCoMKgwqDCoMKgIC0gY29uc3Q6IHN0YXJmaXZlLGpoNzExMHMKCkkgc3VnZ2VzdCBhZGRpbmcg
c3RhcmZpdmUsamg3MTEwIGFzIGEgZmFsbGJhY2sgaGVyZSwgYXMgaXQncyB0aGUgU29DCmJlc3Qg
a25vd24gdG8gbW9zdCBzb2Z0d2FyZXMsIGFuZCBKSDcxMTBTIHNob3VsZG4ndCBoYXZlIGFueSBk
aWZmZXJlbmNlCnRvIEpINzExMCBvdGhlciB0aGFuIGJpbm5pbmcuCgo+ICsKPiDCoGFkZGl0aW9u
YWxQcm9wZXJ0aWVzOiB0cnVlCj4gwqAKPiDCoC4uLgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
