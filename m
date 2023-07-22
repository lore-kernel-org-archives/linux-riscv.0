Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138E9C001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFfhIbIKSXJUt91T4Ii3Snu0/rzIAeswswoBXom8oug=; b=GRcKNkEWHPj2AL
	nFw+F0SPmktwGs6AUEu6m/gmmH1TIK5jl4iwOdKT+OM1TH0T66kAVrm+wSG5lsqGddvkk414rpDAj
	GEpM+F/YmHkf8DjVLjrduFHcvXpXs+ZG8GtOYM0J8D/r+PjiN38NOjs9Fza+AuzHKnkhnZeTA87nq
	rnvtYqi2hVzuDnCbPe2bVHl2a/zszZCwQEP4rmmFt7zI9ME8ok99XYgga+DASQGV2UHT12DjQ6rBf
	s37Lif2bNb5goP/F4ysdNULYujNCHz1lr0YiM4wPpT6uJgC5ByiSsOe3AdRme6r0MEXlwdstF9F+t
	x89PRT+u5X5W2t+ZVkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLcu-00HSAG-2w;
	Sat, 22 Jul 2023 23:03:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLcr-00HS9F-0L
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 23:03:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B06360BCC
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C38C433C8
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690066978;
	bh=oxydY8zP9vTYei9N9QKOKvEqr0CBZuoc4IFd+3PE0fM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hKIqXzH4yK5OcIOMiU8Mtl3M0SnI2Z9Twm6sjPQzvk45eAkj2MIz7VzuceLFhCtNv
	 wDQ8DmL7D1abre6aU5kA0fL2Q/12073n0q24H24LpkzkPDxcoEChwa3aPydLcSW5Mw
	 sqzsIfC44bvYhdhRjZ13eh+kVwkfn7L2g2vCl3GV48mU2jtHz8JlWZ5YVtIyF5bekX
	 6Du5G8GGWugDEg5Zvk3Xmv/TZF8x5O2EXKfU9Xyb3SRhkGm5iURrG7Lxh+86pRcYfA
	 GRB2rPJUZoi4PqCCjwB0ZOEY//qEyaJD6J1u4mI8FrjPkUKAIhBfntqAxAK0gAtiMX
	 PxNlLltp6dNYQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5216f713f8bso4526428a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 16:02:58 -0700 (PDT)
X-Gm-Message-State: ABy/qLasbc9vLpFBHQmh0UZtAU54DzrNee/VtJ0QlMXKYQRY+5upWItf
	ZSWa1gteXRpVvgwP2XGTBleK1wRpmqbuANE5edA=
X-Google-Smtp-Source: APBJJlH099m3nlcMvsJUawIkWH6RZSsbUIsNu72XyBUcZHbHfeYgp2+/9vP02KU1K1e2wTWOyV/5p0uIX/ThDId0vrE=
X-Received: by 2002:a17:906:8451:b0:994:1fd2:cf96 with SMTP id
 e17-20020a170906845100b009941fd2cf96mr5911842ejy.0.1690066977024; Sat, 22 Jul
 2023 16:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-2-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-2-ccda511357f4@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 23 Jul 2023 07:02:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTMTDjAjTL=93nuDxamfegwFfiBXB+WU2GbcnVFhBAGqA@mail.gmail.com>
Message-ID: <CAJF2gTTMTDjAjTL=93nuDxamfegwFfiBXB+WU2GbcnVFhBAGqA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: riscv: Add BeagleV Ahead board compatibles
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
	Jason Kridner <jkridner@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_160301_330230_5E4D74C5 
X-CRM114-Status: GOOD (  13.99  )
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

T24gU3VuLCBKdWwgMjMsIDIwMjMgYXQgNTo1NuKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IERvY3VtZW50IHRoZSBjb21wYXRpYmxlIHN0cmluZ3Mg
Zm9yIHRoZSBCZWFnbGVWIEFoZWFkIGJvYXJkIHdoaWNoIHVzZXMKPiB0aGUgVC1IZWFkIFRIMTUy
MCBTb0MuCj4KPiBMaW5rOiBodHRwczovL2JlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkCj4g
U2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUBiYXlsaWJyZS5jb20+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sIHwg
NSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvdGhlYWQueWFtbAo+IGluZGV4
IGU2MmY2ODIxMzcyZS4uM2I4YjI0ODEyYTI0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFkLnlhbWwKPiBAQCAtMjQsNiArMjQsMTEg
QEAgcHJvcGVydGllczoKPiAgICAgICAgICAgIC0gY29uc3Q6IHNpcGVlZCxsaWNoZWUtbW9kdWxl
LTRhCj4gICAgICAgICAgICAtIGNvbnN0OiB0aGVhZCx0aDE1MjAKPgo+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBCZWFnbGVWIEFoZWFkIHNpbmdsZSBib2FyZCBjb21wdXRlcgo+ICsgICAgICAgIGl0
ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDogYmVhZ2xlLGJlYWdsZXYtYWhlYWQKPiArICAgICAg
ICAgIC0gY29uc3Q6IHRoZWFkLHRoMTUyMApSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cgo+ICsKPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKPgo+ICAuLi4KPgo+
IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
