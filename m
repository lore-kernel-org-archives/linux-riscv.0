Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76FCC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csjIOmtLsgauXOpjZA5eRG8xjC4uxSharZKRd8Nh2iM=; b=MUqWP22p6rOo+p
	s28cnlQyFt0hwubYXW+zvZL0ye19rRxpMVyMPmhbMTrfvVQwfpNanWKP3vY/HVHJnvxJ+nrj/OzEL
	ITBRxqixuJBui+u2rjeER3dQU4h7xdZAuHCKalygBuyY5ePJRLsJOuwmv5CKe3tVVtcnphBCD7vmb
	i1m6TiCyezUV23aXe6fmdlIpOBeVuGvvqHi1LO0cEsfMDKmM/XxlqiahXcNSed1o7wJUcVYgTY0Mb
	KoI3hqEM+377o9+zmsYfSMChbpyLktjkyj5pC+rbvsFbtCuVyfsIetemC6mpwqqgLzFpQVxszTbCj
	agku1Wpa1AWe+AE+MJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q944s-008BKG-0a;
	Tue, 13 Jun 2023 13:28:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q944p-008BIy-20
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 13:28:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 024E963635
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 13:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A71FC43331
	for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686662929;
	bh=Tq282l+C2Dr1lf2RPS2aM+A8Oyr7+h44UW4Jg8xfhbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KcgaJ6b3WJUNmYRSAfZ6WsF8uW14i0pHGUqfQ8qbVrnwHv8mkwzliNY52bKdNkzyw
	 8oaUyvyCC780GZKnZH7KC9oC6otccI0eauPbGL9IgmQtnO3R5aSpv5ARer1rB32lkF
	 2d4uKUE5XCBpIUm5U4BSU4DCrQpbGaie4LwHbJj1Siu5+1zT/muUy+h3szYViKJAFw
	 oVzVrwW8F/o7VbqwygRlpxQFJUoAcazKCkvWPkHe6zjm75poQ3WFbTO3ZlMYb9/Dkz
	 pw/ooL9JV7uYkoyjm75SLOFnSjhj13q03rSWUvGniN9XsFR1qwltOw2Ujx5sQGuDZH
	 pj3hxljD5e64g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b1b72dc2feso67528821fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 06:28:48 -0700 (PDT)
X-Gm-Message-State: AC+VfDy0ZX5scaORzr4oE5PG5Gl3BROPiPPRLOekhKWhCNufgVLlIizh
	1KQZ+PmxdO9Swj+IHCRc0Jma8buv/FXPmmIpWg==
X-Google-Smtp-Source: ACHHUZ7xEzfSwXxw+hZJuk+2aAUcZRqN2kDCLuPdkshb6lV2DAnOexM7QB+9J/ErB3X9G0jVZAtdNv9Xt6ie8WSLIls=
X-Received: by 2002:a2e:9595:0:b0:2b3:3de8:7330 with SMTP id
 w21-20020a2e9595000000b002b33de87330mr747015ljh.29.1686662926823; Tue, 13 Jun
 2023 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy> <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy> <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud> <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org> <20230608-cobbler-giving-e0fac2185e11@spud>
 <20230612-relic-fetal-1beeae3455aa@spud>
In-Reply-To: <20230612-relic-fetal-1beeae3455aa@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jun 2023 07:28:34 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
Message-ID: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Sean Anderson <sean.anderson@seco.com>, 
	Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alistair Francis <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>, 
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_062851_870278_0278048F 
X-CRM114-Status: GOOD (  17.33  )
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMzoyM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSb2IsCj4gQmVmb3JlIEkgcHJlc3Mgb24gd2l0aCBtb3JlIHZl
cnNpb25zLi4uCj4KPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAwODozMDoyOFBNICswMTAwLCBD
b25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAwOCwgMjAyMyBhdCAwMToxNTozN1BN
IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gT24gVHVlLCBNYXkgMzAsIDIwMjMgYXQg
MDM6MTI6MTJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWF5
IDE4LCAyMDIzIGF0IDEwOjQyOjM0UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4g
PiA+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDAyOjMwOjUzUE0gLTA0MDAsIFNlYW4gQW5kZXJz
b24gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2h5IG5vdCBqdXN0IGhh
dmUgc29tZXRoaW5nIGxpa2UKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gbXljcHUgewo+ID4gPiA+
ID4gPiAgICAgICAuLi4KPiA+ID4gPiA+ID4gICAgICAgcmlzY3YsaXNhIHsKPiA+ID4gPiA+ID4g
ICAgICAgICAgICAgICBpOwo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIG07Cj4gPiA+ID4gPiA+
ICAgICAgICAgICAgICAgYTsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICB6aWNzcjsKPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICAuLi4KPiA+ID4KPiA+ID4gSSBwcmVmZXIgcHJvcGVydHkgbmFt
ZXMgYmUgZ2xvYmFsbHkgdW5pcXVlLiBUaGUgdG9vbHMgYXJlIGdlYXJlZCB0b3dhcmRzCj4gPiA+
IHRoYXQgdG9vLiBUaGF0J3MgbGFyZ2VseSBhIHN5bXB0b20gb2YgaGF2aW5nIDAgdHlwZSBpbmZv
cm1hdGlvbiBpbiB0aGUKPiA+ID4gRFQuCj4gPiA+Cj4gPiA+IEZvciBleGFtcGxlIGlmIHlvdSBo
YWQgYW4gZXh0ZW5zaW9uIGNhbGxlZCAncmVnJywgaXQgd291bGQgYmUgYSBwcm9ibGVtLgo+ID4K
PiA+IFBlciB0aGUgY3VycmVudCBJU0EgcnVsZXMsIHRoYXQnZCBub3QgYmUgdmFsaWQuIEJ1dCB0
aGVuIGFnYWluLCBJIGRvCj4gPiBoYXZlIHRydXN0IGlzc3VlcyAmIGl0J3Mgbm90IGxpa2UgInJl
ZyIgaXMgdGhlIG9ubHkgcHJvcGVydHkgbmFtZSBpbiBEVAo+ID4gbGFuZC4KPgo+IC4uLnlvdSBz
YXkgInByZWZlciIgaGVyZS4gSXMgdGhhdCBhIE5BSywgb3IgYSAieW91IGtlZXAgdGhlIHBpZWNl
cyI/CgpEb24ndCBkbyB0aGUgYWJvdmUgbm9kZS4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
