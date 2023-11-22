Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8723EC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBlrdO0pdp3UA12qQmJqwIPSlw9Va43BZfgctqpbkcM=; b=liBnHcuXCnTYKI
	d46CIYasppJcpU/R9IOE5ZfdXYeFME4mO6WN8ao/YJChgWoCLJjIX8BN9puY/Y88buXtSiOOfacVO
	6pAq7fYdZtbdHHjlK4iz4k8hxTiueJ7qDPL28kag4Vbq2BW+0WJfx+FvWnjIfIP8AQ0bYGvK/Smkg
	gfi5m4KOlGkH170inOdU6nDVHRBP1wvSPS4GunIMj7bfVkkiXMzOVBevqZftC2GuSLO/d0emcFw/p
	hzT1W7M4PZYD7WZzwiQ4Fck7Rl9cN2ln2V1kd8sGKUXnNHXvMPH2meuQ5njqhBazS9vdH/9KzkQMC
	DMC/me4D4B1L9F/mZF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uX0-00356V-1t;
	Wed, 22 Nov 2023 21:13:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uWw-00353b-0d;
	Wed, 22 Nov 2023 21:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2BB2DCE25E2;
	Wed, 22 Nov 2023 21:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AB4C433CB;
	Wed, 22 Nov 2023 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687583;
	bh=GuBVjZjV1gqDATE7AVDXVR6KbB06LDstoa1u5pJdd44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sb2CFkvVVYZXzOKMOH5EgfoH44/hh5lOLXw/8XpIpRRcBs3438ZP4qZwNBV6VgUt0
	 Ugm8EivgHtAgGie+ZZ1YLf8biVC40cXIejmrQk/Ux8zzfuocKyYNuNhxw+TzKtuB1O
	 oO66SFyRx1xp6ARG9adlEOp4W9wb6Cjj1IOltt8INourZq9xZiw+1gkdvIsAe2eJsE
	 xfvzOCQbDjt4JVmHrS4HzNqJe/C+ATyfBOQ8Nn5aUk47cRsP5sKfDJHv9+syvLP1iI
	 x3vCryPTt3wyel67HKW2rbGInsi5Uj1qC1sQtMoiVD/9RjsCCmuKnipvILIIgE4dJ9
	 3fjGVRs/7BNNg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50abbb23122so190427e87.3;
        Wed, 22 Nov 2023 13:13:03 -0800 (PST)
X-Gm-Message-State: AOJu0Yw3+xu4mSkkg9+SWqMBRXOy38uReA37QfRZYmmZeFnLfSZpwKR/
	xly3EPOffcJDgg6vD/k8+0AqpP5Q1dnT4P9AzJU=
X-Google-Smtp-Source: AGHT+IHWayR4EGGb4sgKiVHICBmTJo1MuoDmYLHsEjt2qHT1ekKZfpyAiACfEC6paYV5C6+kwxlRbJ1dqBHcL71+PtA=
X-Received: by 2002:a19:ac0b:0:b0:500:be57:ce53 with SMTP id
 g11-20020a19ac0b000000b00500be57ce53mr2345053lfc.42.1700687581392; Wed, 22
 Nov 2023 13:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-12-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-12-peterlin@andestech.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Nov 2023 05:12:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQdksCizkEtiE_wFAJGpyVOEUz4k2aCHi6mQiWieaMEnQ@mail.gmail.com>
Message-ID: <CAJF2gTQdksCizkEtiE_wFAJGpyVOEUz4k2aCHi6mQiWieaMEnQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] riscv: dts: allwinner: Add T-Head PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_131306_798506_B649FF86 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgODoxN+KAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiB4dGhlYWRwbXUgc3RhbmRzIGZvciBULUhl
YWQgUGVyZm9ybWFuY2UgTW9uaXRvciBVbml0IGV4dGVuc2lvbi4KPiBCYXNlZCBvbiB0aGUgYWRk
ZWQgVC1IZWFkIFBNVSBJU0Egc3RyaW5nLCB0aGUgU0JJIFBNVSBkcml2ZXIKPiB3aWxsIG1ha2Ug
dXNlIG9mIHRoZSBub24tc3RhbmRhcmQgaXJxIHNvdXJjZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1
IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiAtLS0KPiBDaGFuZ2Vz
IHYyIC0+IHYzOgo+ICAgLSBOZXcgcGF0Y2gKPiBDaGFuZ2VzIHYzIC0+IHY0Ogo+ICAgLSBObyBj
aGFuZ2UKPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5k
dHNpIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGkt
ZDFzLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kK
PiBpbmRleCA2NGMzYzJlNmNiZTAuLjdkY2JhODZjZmRkMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPiBAQCAtMjcsNyArMjcsNyBAQCBj
cHUwOiBjcHVAMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhID0gInJ2NjRp
bWFmZGMiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRp
IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwg
Im0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2VpIiwgInppaHBtIjsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNl
aSIsICJ6aWhwbSIsICJ4dGhlYWRwbXUiOwpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cgo+ICAgICAgICAgICAgICAgICAgICAgICAgICNjb29saW5nLWNlbGxzID0gPDI+
Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJv
bGxlciB7Cj4gLS0KPiAyLjM0LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
