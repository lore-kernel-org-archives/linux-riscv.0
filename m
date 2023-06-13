Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B74C7EE29
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCdVb66HhRr5+2aGncAfpyTTydvGThTyjni1c/uqO6g=; b=bZ91JTNHF2F0Ue
	CwxSE9DNqtBR1WjrmvQY4v8SwgSivyeIxJ2aGeJe/cB82JU4VXUUSctCdAFnc5ThwEoxrPWt5LkOx
	WolVASKIdTrlNOt1cWpdQdpwNDW4nQ3CSnHCC1T4bNbRNGAvDkj3gix1ZqGayIcZl/k0T4sgGGbx8
	1yHE5cnKBdk8k6DcRvP+1m9bz4Mn5Z7SgfFsZc99U9DEgOnJIgwQKmC7Kn+nJMGk/2gEP5yIDFnRl
	f0Ui4uyV/keiIZ/sOAKJyLzq6LtHiSzRsPzmD40ixWf+PvCH4aieCl08i0VacperQmtakBXYah0Ps
	vPHoqLpVvZFmmToFzA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ysf-007I9N-2o;
	Tue, 13 Jun 2023 07:55:57 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ysd-007I8z-1v
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 07:55:57 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bc4ed01b5d4so2023376276.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686642953; x=1689234953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqkMTpZSPTrtiBwrlg2HB9jORG0uNI2X+Q54yKxHyHA=;
        b=X1lH0zTSm/2trYaS1XeQ55Q9hA/9/r0gKILDhIP3BM1V9j/9FcNnlTg8C6eqes6MhY
         kEEujrjfs/bXMw2MXXaDIEhSffQ3ZxmyyehIWQMaGdQ83t9lijLU+cai3uaF5ZNQ3hJ1
         U4h+mNKlmJ4enUA0b9qIy8BcA850nZF9q8DNphIsqHIDVsbimRdE1m2LdXqy6pRLVSor
         CuNaeb3ZHWvaqWp2UlX8SxpNaeTb54BL1Y6A72HUI8F4MxEPteEgE7OxPWAGRl2KwREW
         FSjlxEtmon50dMqJgkzch8RTCiRJz+wMgeMWSkqDFbH4doZHuoKH0L9GHXdRo8TV+x0S
         4DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642953; x=1689234953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqkMTpZSPTrtiBwrlg2HB9jORG0uNI2X+Q54yKxHyHA=;
        b=hIGlexXfH86winYEVDjyoIUbC2CdVVXekpA21bznHy2UJVoFLsPPK1RLlWFtxcyzc3
         aBmZJjjwfqN3CmvwmznlInLkrAwiqu0Zoma+j+GSnrDaD30SZMaGNib2j8kGzHU/fE7H
         sxUWr41o/sH2YfRNYEwsgiTmwn8PdOolGHaQeIEq21LEaPOaKayJa7z2U2jkAocud14d
         OCZPl2r2GGA0YrITXjourHdNMXl4zA5kgkeXo0MU5kOmtqC8+CddS5EXoUEaUIl897i/
         zl9J+ObrTpx5caCF5p8LK/OTOo85N4ifeeVSrbaJ/5K79eantFnI5iPKcqjH7L7vTha5
         Jdyw==
X-Gm-Message-State: AC+VfDzC4KUXPq7KmMvGwwDRCfi3x/qkkyYz5V8WdYnQuxjhIbyYCYiH
	rkFZfo9Rm4jRbi7gxHdYp1YX5uvdD+Mwhu28zTwS+A==
X-Google-Smtp-Source: ACHHUZ7O4IuL4c5Qy6TEcv499ftciQaYRXdKcvbuS5ivN5I0ThoFAm05aH64SAu17/J52IMOAeGVAiqoO7kjJSXAUJs=
X-Received: by 2002:a0d:fd83:0:b0:56d:4014:dd20 with SMTP id
 n125-20020a0dfd83000000b0056d4014dd20mr982407ywf.30.1686642952928; Tue, 13
 Jun 2023 00:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-8-apatel@ventanamicro.com> <ZGIrOKIT8uHcNqbQ@nvidia.com>
In-Reply-To: <ZGIrOKIT8uHcNqbQ@nvidia.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 13 Jun 2023 13:25:41 +0530
Message-ID: <CAK9=C2V9o4FsFXAfRHLGSuJaDubwM_HSL7keTYeWb_vFDNLd7g@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] irqchip/riscv-imsic: Improve IOMMU DMA support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	iommu@lists.linux.dev, Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_005555_664529_E74562AF 
X-CRM114-Status: GOOD (  24.33  )
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

T24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgNjoyM+KAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDc6NTg6MzhQTSAr
MDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFdlIGhhdmUgYSBzZXBhcmF0ZSBSSVNDLVYgSU1T
SUMgTVNJIGFkZHJlc3MgZm9yIGVhY2ggQ1BVIHNvIGNoYW5naW5nCj4gPiBNU0kgKG9yIElSUSkg
YWZmaW5pdHkgcmVzdWx0cyBpbiByZS1wcm9ncmFtbWluZyBvZiBNU0kgYWRkcmVzcyBpbgo+ID4g
dGhlIFBDSWUgKG9yIHBsYXRmb3JtKSBkZXZpY2UuCj4gPgo+ID4gQ3VycmVudGx5LCB0aGUgaW9t
bXVfZG1hX3ByZXBhcmVfbXNpKCkgaXMgY2FsbGVkIG9ubHkgb25jZSBhdCB0aGUKPiA+IHRpbWUg
b2YgSVJRIGFsbG9jYXRpb24gc28gSU9NTVUgRE1BIGRvbWFpbiB3aWxsIG9ubHkgaGF2ZSBtYXBw
aW5nCj4gPiBmb3Igb25lIE1TSSBwYWdlLiBUaGlzIG1lYW5zIGlvbW11X2RtYV9jb21wb3NlX21z
aV9tc2coKSBjYWxsZWQKPiA+IGJ5IGltc2ljX2lycV9jb21wb3NlX21zaV9tc2coKSB3aWxsIGFs
d2F5cyB1c2UgdGhlIHNhbWUgTVNJIHBhZ2UKPiA+IGlycmVzcGVjdGl2ZSB0byB0YXJnZXQgQ1BV
IE1TSSBhZGRyZXNzLiBJbiBvdGhlciB3b3JkcywgY2hhbmdpbmcKPiA+IE1TSSAob3IgSVJRKSBh
ZmZpbml0eSBmb3IgZGV2aWNlIHVzaW5nIElPTU1VIERNQSBkb21haW4gd2lsbCBub3QKPiA+IHdv
cmsuCj4gPgo+ID4gVG8gYWRkcmVzcyBhYm92ZSBpc3N1ZSwgd2UgZG8gdGhlIGZvbGxvd2luZzoK
PiA+IDEpIE1hcCBNU0kgcGFnZXMgZm9yIGFsbCBDUFVzIGluIGltc2ljX2lycV9kb21haW5fYWxs
b2MoKQo+ID4gICAgdXNpbmcgaW9tbXVfZG1hX3ByZXBhcmVfbXNpKCkuCj4gPiAyKSBBZGQgYSBu
ZXcgaW9tbXVfZG1hX3NlbGVjdF9tc2koKSBBUEkgdG8gc2VsZWN0IGEgc3BlY2lmaWMKPiA+ICAg
IE1TSSBwYWdlIGZyb20gYSBzZXQgb2YgYWxyZWFkeSBtYXBwZWQgTVNJIHBhZ2VzLgo+ID4gMykg
VXNlIGlvbW11X2RtYV9zZWxlY3RfbXNpKCkgdG8gc2VsZWN0IGEgc3BlY2lmaWMgTVNJIHBhZ2UK
PiA+ICAgIGJlZm9yZSBjYWxsaW5nIGlvbW11X2RtYV9jb21wb3NlX21zaV9tc2coKSBpbgo+ID4g
ICAgaW1zaWNfaXJxX2NvbXBvc2VfbXNpX21zZygpLgo+Cj4gSXMgdGhlcmUgYW4gaW9tbXUgZHJp
dmVyIHNvbWV3aGVyZSBpbiBhbGwgdGhpcz8gSSBkb24ndCBvYnZpb3VzbHkgc2VlCj4gb25lPwoK
U29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLgoKVGhlIFJJU0MtViBJT01NVSBzcGVjaWZp
Y2F0aW9uIGlzIGZyb3plbiBhbmQgd2lsbCBiZSByYXRpZmllZC9yZWxlYXNlZAphbnl0aW1lIHRo
aXMgbW9udGggb3IgbmV4dC4KaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Yt
aW9tbXUvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC1yYzYvcmlzY3YtaW9tbXUucGRmCgpUaGUgUklT
Qy1WIElPTU1VIGRyaXZlciB3aWxsIGJlIHNlbmQtb3V0IG9uIExLTUwgcHJldHR5IHNvb24KaHR0
cHM6Ly9naXRodWIuY29tL3RqZXpuYWNoL2xpbnV4L3RyZWUvdGplem5hY2gvcmlzY3YtaW9tbXUK
d2hpY2ggY2FuIGJlIHRlc3RlZCBvbiBRRU1VCmh0dHBzOi8vZ2l0aHViLmNvbS90amV6bmFjaC9x
ZW11L3RyZWUvdGplem5hY2gvcmlzY3YtaW9tbXUKCj4KPiBUaGVyZSBzaG91bGQgYmUgbm8gcmVh
c29uIHRvIHVzZSB0aGUgZG1hLWlvbW11LmMgc3R1ZmYganVzdCB0byBtYWtlCj4gaW50ZXJydXB0
cyB3b3JrLCB0aGF0IGlzIG9ubHkgbmVjZXNzYXJ5IGlmIHRoZXJlIGlzIGFuIGlvbW11LCBhbmQg
dGhlCj4gcGxhdGZvcm0gYXJjaGl0ZWN0dXJlIHJlcXVpcmVzIHRoZSBpb21tdSB0byBoYXZlIHRo
ZSBNU0kgcmVnaW9uCj4gcHJvZ3JhbW1lZCBpbnRvIElPUFRFcy4KPgo+IEFuZCBJJ2QgYmUgbXVj
aCBoYXBwaWVyIGlmIHdlIGNvdWxkIGNsZWFuIHRoaXMgZGVzaWduIHVwIGJlZm9yZSByaXNjLXYK
PiBzdGFydHMgdXNpbmcgaXQgdG9vIDpcCj4KClN1cmUsIEkgd2lsbCBzZW5kLW91dCB2NCBpbiB0
aGUgbmV4dCBmZXcgZGF5cy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
