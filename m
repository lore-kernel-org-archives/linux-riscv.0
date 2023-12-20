Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0395DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29FMKdj4Jtx5gkI6OVRg2gw4hiq5kxlnLorulEOWK3M=; b=LW0CmZ+we/fI7wvdsbd3x0tGRD
	m0AEl//SkgUVRq8C+8gWYA4GeB+f1f+WMsuBc+nHpX7Rp1DSRDtLGQ5xDn68nZur/N2emeKjBr4C/
	UefkNVN1xraeD3BdVypxd2OpaZYMLDhjQJI5j0SG8a/nnuu/y3Jz8kV7KTPP9Op6ozLn9cGX8Ce5u
	N8u7nwYo6Be1BOWDClfcbOabYAnfSKwp13KZ5yoTGXTkp2eBtPOaW/zhdxaiJ0rbyXfhR5F4aAjP2
	cP7Sr1iGbiwzs//LhRKDk3wA1rJT7qpoJtQOkb0lB6eyUrK6ps107JfQ8WE8233tJyJx0Wph0oC62
	7oeQxj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsRl-00GfVY-00;
	Wed, 20 Dec 2023 09:00:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsRg-00GfTL-2i;
	Wed, 20 Dec 2023 09:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDEA06155D;
	Wed, 20 Dec 2023 09:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D58C433C7;
	Wed, 20 Dec 2023 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703062851;
	bh=aP+or2O2Amx3o066NoYjmEoMeqgvW6u+ehSxtWedg58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KF+fgMS9J85VBtFxE6C+CCleuJv2Zec2Xe4q/rr8qCPuNT4X6BnizX1N/UkQkN0Uj
	 nE3rnBnfP8GJp5JDIKnUtJT1EOslUeIc9Kz5N69A2/7m1+FIVrf69/71oD5mrDBFxI
	 booZixCOostTgj5lokin2FLDaIOi2WdnoU8GbPtNSt+sF2yj7AclNl2tQftWrRBS7l
	 JJyJBvH61E1GgPgIUr0Ld2sEUG0nbwpR+ldnI5O8jY1BRUmblOm5PXaKXgqHhgnQVW
	 mA1nuVNA29MagVh7YGOQLOafINsTUpneKa1N6i2cXp2CD1Sm33c1/4UTrwQyw4bBKL
	 qt8myFyRPxaTQ==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rFsRc-005chY-Hw;
	Wed, 20 Dec 2023 09:00:48 +0000
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 09:00:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James Morse
 <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, Mayuresh Chitale
 <mchitale@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, wchen
 <waylingii@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Heiko
 Stuebner <heiko@sntech.de>, Minda Chen <minda.chen@starfivetech.com>, Samuel
 Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, Sean
 Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu
 <likexu@tencent.com>, Vipin Sharma <vipinsh@google.com>, Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>, Aaron Lewis
 <aaronlewis@google.com>, Thomas Huth <thuth@redhat.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us
 in arch timer test
In-Reply-To: <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org>
 <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: xiaobo55x@gmail.com, haibo1.xu@intel.com, ajones@ventanamicro.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, pbonzini@redhat.com, shuah@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, anup@brainfault.org, atishp@atishpatra.org, guoren@kernel.org, mchitale@ventanamicro.com, greentime.hu@sifive.com, waylingii@gmail.com, conor.dooley@microchip.com, heiko@sntech.de, minda.chen@starfivetech.com, samuel@sholland.org, jszhang@kernel.org, seanjc@google.com, peterx@redhat.com, likexu@tencent.com, vipinsh@google.com, maciej.wieczor-retman@intel.com, aaronlewis@google.com, thuth@redhat.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_010052_967294_89775545 
X-CRM114-Status: GOOD (  19.24  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0xMi0yMCAwNjo1MCwgSGFpYm8gWHUgd3JvdGU6Cj4gT24gV2VkLCBEZWMgMjAsIDIw
MjMgYXQgMjoyMuKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAK
Pj4gT24gVHVlLCAxMiBEZWMgMjAyMyAwOTozMToyMCArMDAwMCwKPj4gSGFpYm8gWHUgPGhhaWJv
MS54dUBpbnRlbC5jb20+IHdyb3RlOgo+PiA+ID4gQEAgLTIxNiw2ICsyMjEsOSBAQCBzdGF0aWMg
Ym9vbCBwYXJzZV9hcmdzKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+ID4gICAgICAgICAgICAg
ICBjYXNlICdtJzoKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9hcmdzLm1pZ3JhdGlv
bl9mcmVxX21zID0gYXRvaV9ub25fbmVnYXRpdmUoIkZyZXF1ZW5jeSIsIG9wdGFyZyk7Cj4+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiA+ICsgICAgICAgICAgICAgY2FzZSAnZSc6
Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAgIHRlc3RfYXJncy50aW1lcl9lcnJfbWFyZ2luX3Vz
ID0gYXRvaV9ub25fbmVnYXRpdmUoIkVycm9yIE1hcmdpbiIsIG9wdGFyZyk7Cj4+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAKPj4gU28geW91ciBlcnJvciBtYXJnaW4gaXMgYWx3
YXlzIHVuc2lnbmVkLi4uCj4+IAo+IAo+IFRoZSBlcnJvciBtYXJnaW4gd2FzIHN1cHBvc2VkIHRv
IGJlIGEgbm9uLW5lZ2F0aXZlIFswLCBJTlRfTUFYXS4KPiAoTWF5IGJlIG5lZWQgdG8gZGVmaW5l
IGEgTWF4IGZvciB0aGUgaW5wdXQsIGluc3RlYWQgb2YgSU5UX01BWCkKPiAKPj4gPiAgICAgICAg
ICAgICAgIGNhc2UgJ28nOgo+PiA+ICAgICAgICAgICAgICAgICAgICAgICB0ZXN0X2FyZ3MuY291
bnRlcl9vZmZzZXQgPSBzdHJ0b2wob3B0YXJnLCBOVUxMLCAwKTsKPj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgdGVzdF9hcmdzLnJlc2VydmVkID0gMDsKPj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4+ID4gaW5kZXggOTY4MjU3Yjg5
M2E3Li5iMWQ0MDVlNzE1N2QgMTAwNjQ0Cj4+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc3Ry
dWN0IHRlc3RfYXJncyB7Cj4+ID4gICAgICAgaW50IG5yX2l0ZXI7Cj4+ID4gICAgICAgaW50IHRp
bWVyX3BlcmlvZF9tczsKPj4gPiAgICAgICBpbnQgbWlncmF0aW9uX2ZyZXFfbXM7Cj4+ID4gKyAg
ICAgaW50IHRpbWVyX2Vycl9tYXJnaW5fdXM7Cj4+IAo+PiAuLi4gZXhjZXB0IHRoYXQgeW91IGFy
ZSBzdG9yaW5nIGl0IGFzIGEgc2lnbmVkIHZhbHVlLiBTb21lIGNvbnNpc3RlbmN5Cj4+IHdvdWxk
bid0IGh1cnQsIHJlYWxseSwgYW5kIHdvdWxkIGF2b2lkIGlzc3VlcyB3aGVuIHBhc3NpbmcgbGFy
Z2UKPj4gdmFsdWVzLgo+PiAKPiAKPiBZZXMsIGl0J3MgbW9yZSBwcm9wZXIgdG8gdXNlIGFuIHVu
c2lnbmVkIGludCBmb3IgdGhlIG5vbi1uZWdhdGl2ZSBlcnJvciAKPiBtYXJnaW4uCj4gU3Rvcmlu
ZyBhcyBzaWduZWQgaGVyZSBpcyBqdXN0IHRvIGtlZXAgdGhlIHR5cGUgY29uc2lzdGVudCB3aXRo
IHRoYXQKPiBvZiB0aW1lcl9wZXJpb2RfbXMKPiBzaW5jZSB0aGVyZSB3aWxsIGJlICcrJyBvcGVy
YXRpb24gaW4gb3RoZXIgcGxhY2VzLgo+IAo+ICAgICAgICAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jCj4gICAgICAgICAvKiBTZXR1cCBhIHRpbWVvdXQg
Zm9yIHRoZSBpbnRlcnJ1cHQgdG8gYXJyaXZlICovCj4gICAgICAgICAgdWRlbGF5KG1zZWNzX3Rv
X3VzZWNzKHRlc3RfYXJncy50aW1lcl9wZXJpb2RfbXMpICsKPiAgICAgICAgICAgICAgdGVzdF9h
cmdzLnRpbWVyX2Vycl9tYXJnaW5fdXMpOwoKQnV0IHRoYXQncyBleGFjdGx5IHdoeSB1c2luZyBh
IHNpZ25lZCBxdWFudGl0eSBpcyB3cm9uZy4KV2hhdCBkb2VzIGl0IG1lYW4gdG8gaGF2ZSBhIGh1
Z2UgKm5lZ2F0aXZlKiBtYXJnaW4/CgpJIGRvbid0IHNlZSBob3cgeW91IGNhbiBqdXN0aWZ5IHRo
aXMuCgogICAgICAgICBNLgotLSAKSmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVu
bnkuLi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
