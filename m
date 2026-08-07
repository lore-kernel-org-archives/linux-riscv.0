Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F32C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09bqsIVvUVij0Y2vJZQkHtKqYhZw0jbiDpHqpm0svV4=; b=gIonZ56YKo9i2J
	2iUe14HDszHAQ3zzOta0mNteQTa7BRJ/z6r7TTYX956bk3bDPvtqOzvLjnbwtU8q/D38RlM0nmwQh
	AWATVDDYZM8RUfiklMelwcANffS5DhI57a5rzv9OBJrt6joM1jdSGsUrX+f4lbFhvmxg1UmIFf3ZE
	jh9n90IrpK0S6tAvXq8gsOHfoXIKTn/moXdi69MHO4TL65XVB5TnDIWT0JUUOFTWdqX+CLKqCe0e+
	xsLfFQo95AuxLzkEMm1KbFx7Y6IBAtsyECNMH/sxZgF2ns8TTcwRgeTYoVG10QSDHancIHjUptEhh
	KrfGI5K5K3MWCymx7sXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFM4-00000007IkY-1Ukr;
	Fri, 07 Aug 2026 07:51:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFM2-00000007Ijz-0T1X;
	Fri, 07 Aug 2026 07:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2486260AB0;
	Fri,  7 Aug 2026 07:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB981F000E9;
	Fri,  7 Aug 2026 07:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786089056;
	bh=F9Z+y9mwvwTE/vqgn10FR4pH6LkQapgkAfJrJp6N+o0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RkXrBrlsARtc2+B/RyGqAGrmllcUeLy/WCgkwA5eobUGMbF1vmSoSCLaDElxasA6L
	 1nE+3Ue8uE+lDmiYKwQMozGpclUMd/R9yqzUAqvbkP1b94lkSWe2NChET5xzWRu8UX
	 nC6HMIvPaF1o/nkPmTflob/gOHENUjR/uKwJAUHZM+gcrVtMP9NrLAOOG0juJlwsa8
	 qT0zfl++dkDqx2lJAnCpmaAZ16xfE54tewWe4WhNWsL9kJ/XqschYcDnEcPEAq0Bfm
	 5JYzBrrF5bk1Oq1EliolvCSLwK7x/ESwmxXa4e+2+AgDeBPG/6nEPm3aY+2E73zI2N
	 rdwQkYSH8454g==
Message-ID: <d2bd6eb7-6fed-4827-bbf0-0f1dfcdf6d21@kernel.org>
Date: Fri, 7 Aug 2026 09:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
To: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>,
 joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-2-joaopeixoto@osyx.tech>
 <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
 <a42446a5-ec45-4323-b35c-34d882b86a74@osyx.tech>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <a42446a5-ec45-4323-b35c-34d882b86a74@osyx.tech>
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

T24gMDcvMDgvMjAyNiAwOTo0MSwgSm/Do28gUGVpeG90byB3cm90ZToKPj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwK
Pj4+IGluZGV4IGM3NTkxYjJhZWMyYS4uYzA0N2ZiZDZiOTFhIDEwMDY0NAo+Pj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwKPj4+IEBAIC0yMjMsNiArMjIzLDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4+PiAgICAgICBk
ZXNjcmlwdGlvbjogU2hlbnpoZW4gQVpXIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4+PiAgICAgIl5i
YWlrYWwsLioiOgo+Pj4gICAgICAgZGVzY3JpcHRpb246IEJBSUtBTCBFTEVDVFJPTklDUywgSlND
Cj4+PiArICAiXmJhbywuKiI6Cj4+PiArICAgIGRlc2NyaXB0aW9uOiBCYW8gSHlwZXJ2aXNvcgo+
PiBWZW5kb3IgcHJlZml4ZXMgYXJlIGZvciBjb21wYW5pZXMuIFdoYXQgaXMgdGhlIGNvbXBhbnkg
aGVyZT8gV2hhdCBpcwo+PiBzdG9jayB0aWNrZXIgb3Igd2Vic2l0ZT8KPj4KPj4KPj4+ICAgICAi
XmJhbmFuYXBpLC4qIjoKPj4+ICAgICAgIGRlc2NyaXB0aW9uOiBCSVBBSSBLRUpJIExJTUlURUQK
Pj4+ICAgICAiXmJlYWNvbiwuKiI6Cj4gImJhbyIgaXMgdGhlIEJhbyBQcm9qZWN0LCBhbiBvcGVu
LXNvdXJjZSBzdGF0aWMtcGFydGl0aW9uaW5nIGh5cGVydmlzb3IKPiAoaHR0cHM6Ly9naXRodWIu
Y29tL2Jhby1wcm9qZWN0KSwgbm90IGEgc2luZ2xlIGNvbXBhbnkgLSBhbmFsb2dvdXMgdG8gdGhl
Cj4gZXhpc3RpbmcgInFlbXUiIGFuZCAidmlydGlvIiBwcmVmaXhlcywgd2hpY2ggbGlrZXdpc2Ug
bmFtZSBhIHNvZnR3YXJlCj4gaW50ZXJmYWNlIHJhdGhlciB0aGFuIGEgdmVuZG9yLiBJIGhhdmUg
dXBkYXRlZCB0aGUgdmVuZG9yLXByZWZpeGVzIGVudHJ5Cj4gYWNjb3JkaW5nbHkuIElmIHlvdSB3
b3VsZCByYXRoZXIgbmFtZXNwYWNlIHRoaXMgdW5kZXIgdGhlIG1haW50YWluaW5nIAoKU29mdHdh
cmUgY29tcG9uZW50cyBkbyBub3QgZ2V0IGJpbmRpbmdzLCBzbyBlbnRpcmUgYmluZGluZyBpcyBu
b3QKYXBwbGljYWJsZSByZWFsbHkuCgpZb3UgY29udHJvbCB5b3VyIGh5cGVydmlzb3IgYW5kIGRy
aXZlciBzbyB1c2UgZnVsbHkgU1cgY29tbXVuaWNhdGlvbgpjaGFubmVscyBpbnN0ZWFkIG9mIGVt
YmVkZGluZyBTVyBpbnRvIERULgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
