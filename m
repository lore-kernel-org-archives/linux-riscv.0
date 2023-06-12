Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FA6C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9RpjkPvK92qUUwOFeWdzwq6q+BHTScND4vMDCWp7EY=; b=LnhA33fts8GcHu
	Js+wzsTeklDuK2Yz7PJZrxJs7FIRDETnXiFJVNXgM9RXW+pZjG013JRPk19DR7WoLI+8819uZyMgP
	MCubGl3NMfR8wPHwmQcLrqDb3GPEsbQEn3uP8YdAneRx55CF8AHo7KUjFoOnQ9Nty89T3Z5DLHdZD
	bw0mkaKVfq2kyW4bzrNaJhs6xOc8c/3OwI34CwruQsNA2LY4O0NiOQ6GCjZPbdKfKbeLMhZVqDwUl
	kgi69tfcpMYd68jcLavB53BSYtUD1kBDNGU6irxrZFqhbiqDFdehZf7Y09WDXbf+BptomFKnNvtPL
	WgV6W/p91Uc2QO4RNNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mMr-004xmA-0B;
	Mon, 12 Jun 2023 18:34:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mMn-004xk7-2B;
	Mon, 12 Jun 2023 18:34:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-977c89c47bdso845425966b.2;
        Mon, 12 Jun 2023 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594849; x=1689186849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjxKYpDykfJHHAFMlYnHgt/KtNfNEauymoXHInEP4vM=;
        b=fdYVg3CrHfYmOH+yQnThlmPuy5K7Ec9e+rHetrmfAE8U3jCTdYy30Lz22r6JK/dUWO
         fGXiUbALgxdGn2lw2KSzhZYVZ1cEYH6M8+p8bbAR5d7mr/T2LqrOGv2cmf/Rt8SPBagW
         zIVLfGcnCEGk0C/e6R76r6ovMDsRaFgQmgmwLTtA1i3UzQHEfQHkqdSwYK6fLpm4xFgE
         mjrdut3xCamDSyzfp1xFRAs+hmGZ5wKc+D5rE7joQF4E8WiovvkeVt8Wq0Ce7QoKtd00
         f50SP5YRSF2zVFRDJ/jPYFMRfoITlONYXDYUSNMbdOm8fFNXBrZBWelj/LNME/yZlee8
         3uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594849; x=1689186849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjxKYpDykfJHHAFMlYnHgt/KtNfNEauymoXHInEP4vM=;
        b=OzUswkCGNalP9dwooQ/BQnZdAMTg3XH7g1tefYpYDs70WnhaIPDjekBvMgiLnQvBCy
         AESoEWXXlUoQ4rFXtFS/7KYU5vOa+op1lckOl0/0ZXZEsMwG47SwpSkdm9UFXQNLUjUm
         QCdFxw7JLzEG4X+5ix4WhiQ8xWWHrz0ZuRMldRbi3nV0Rqba6CSSicY2HSRXvLFDSU+u
         m/0+ILsZU8Jrnqw7Yvvh8wRBKLQaclOLUdaVdBGun/bN0GuzAVKCeyPNGpFr2Bc4wm9h
         KrID/Tw2+P7bYNBNWvrkyOFXH5d7Sf/gq+VEp/64BK9j+35mD3IxtlNept3mv6l9HDZA
         M+Ww==
X-Gm-Message-State: AC+VfDwtA88k/7fLpPzNwB/NDbFujNB4yTh7RiiEzGBnLuBWKemEuVTs
	hFFva4WnEqUAdD9bwzYfeAUBq3faTf3HH/1A/pk=
X-Google-Smtp-Source: ACHHUZ6HVJPNDxoxp2Cvdq8Nf48yX+kPMvxENdK/HbCk4P4iVuj89/INjrfgS3cZ3HvNthb6VJXM7cJI0toaf9QtkR0=
X-Received: by 2002:a17:907:320a:b0:975:942e:81d5 with SMTP id
 xg10-20020a170907320a00b00975942e81d5mr10759652ejb.1.1686594848974; Mon, 12
 Jun 2023 11:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230610203549.1127334-1-bigunclemax@gmail.com> <13282074.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <13282074.uLZWGnKmhe@jernej-laptop>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 21:33:57 +0300
Message-ID: <CALHCpMi9h_KGJKJ4qH44kypePsMpqjgDke-A1LiBgiSOnXjXLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_113413_715845_8D15B4F1 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

0L/QvSwgMTIg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDIxOjIyLCBKZXJuZWogxaBrcmFiZWMgPGpl
cm5lai5za3JhYmVjQGdtYWlsLmNvbT46Cj4KPiBEbmUgc29ib3RhLCAxMC4ganVuaWogMjAyMyBv
YiAyMjozNTo0MSBDRVNUIGplIE1ha3NpbSBLaXNlbGV2IG5hcGlzYWwoYSk6Cj4gPiBUaGlzIHNl
cmllcyBhZGRzIHN1cHBvcnQgZm9yIEFsbHdpbm5lciBEMS9UMTEzcyB0aGVybWFsIHNlbnNvciBj
b250cm9sbGVyLgo+ID4gVEhJUyBjb250cm9sbGVyIGlzIHNpbWlsYXIgdG8gdGhlIG9uZSBvbiBI
NiwgYnV0IHdpdGggb25seSBvbmUgc2Vuc29yIGFuZAo+ID4gdXNlcyBhIGRpZmZlcmVudCBzY2Fs
ZSBhbmQgb2Zmc2V0IHZhbHVlcy4KPiA+Cj4gPiB2MjoKPiA+IC0gRml4ZWQgU29CIHRhZwo+Cj4g
SXQgZG9lc24ndCBzZWVtcyB5b3UgZml4ZWQgdGhhdC4KClNvcnJ5IGZvciB0aGF0LiBJIGFjY2lk
ZW50YWxseSBzZW50IHRoZSB3cm9uZyB2ZXJzaW9uIG9mIHBhdGNoZXMgLiBBbmQKaW1tZWRpYXRl
bHkgYWZ0ZXIgdGhhdCBJIHNlbnQgdjMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
