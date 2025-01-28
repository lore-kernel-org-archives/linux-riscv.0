Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68090C02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 16:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvvxGFyDVe7rhM1LubTg7ayRPeQg/2KtHaFb2Se6OJE=; b=kgs3bBbkfcrBbN
	8m5rppdGg046k7mq9S2G5N5x9DxE/UFF44HwudKyyodD+N7KURweorkxPsr7DmCETiTj0kVcQlgqE
	gicfeXmqC6FS935eD7YtuObhTZp8e76n6RT6NDFtviu2lYFef5311kqBd/GPon1XyCfziUZ3wxBTr
	p+rrZhV07fanDq/xT0Or7qYuDjgH4649WYmyaKU+7iWCe5w5Llmr8v0T+5XpAFRkiNgiHDE5ZRrH4
	fb4sNtzQqrTCtSsbC7Wa2Y6Rk/nqP8adafXTSGh+rVKkaiBzzFC75iGtudhAW5SIkl7qdM8rljqEI
	r4pvXImmV6+SfWBm1rlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoup-00000005PCP-3rdl;
	Tue, 28 Jan 2025 16:58:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoun-00000005PBu-2fnP
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 16:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9F895C60FC
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 16:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F4EC4CEEC
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738083496;
	bh=y0G/CNUpOShOI21G2rXVvvmIYC7FYgCkYYNmc2IXvb0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jcnvgYKcqmBb61GSD68TxjoEjj0LXe3WZBmBGGn9fWCWJ8yanWHrpbCZ/5ELUrJIK
	 gAvjAwegHqkbQY4lSItbsbP9NVc6aZz1gJEVm/lqxykxYB9SE3ZpDzxqZiAOejT9W+
	 W806RdH6d+0khAyUdR0fhS38zNaPsDANx1zgvg3YZCetkQZdEtgtQom6WH9xQI0HLR
	 4gkGoI+d6WqXx2R17sK05xfQhjctLuID45bIv098Pakd5MCCeAKLCZ6DVgaqdTiL3X
	 pWCl1+sPXbO6L7gw4CWAAVdKsbunNw+rdFl2AZ7vc1i5bOJXOpLSHT76oBAi3aMo8x
	 1kKcltAko2eFw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e399e3310so6205509e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 08:58:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVgbgSJGILsq1CZdQ/uu28sTIXwSP9VuSPwf5Dc2/hGb1ctZiFj7M4kEgtap37/kjYh/BU2s5s07GLIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjxMamVEI+2yKEhlcm8I4YS9Ix03+PPxiObPxbB0/8JpcJRo3o
	qxHMdAMm0uDporGqbs35PZtbZ0ApA4rgeUbRl0hTqEHLgQVjFAxM3G2TWBehRoqH2ZTa1nMPJJg
	exEV3OEG/+cNIIhtXzIHUx8e+0Q==
X-Google-Smtp-Source: AGHT+IGZBJ5sNC4e/lfqrnbWISj/cWgnjLcnpHkbkXiOQn3yUrA0tM+/GVs4Jx8zNEw9eiDrE3RJVIQzxYNeXv8+DK8=
X-Received: by 2002:a05:6512:159b:b0:540:358e:36b9 with SMTP id
 2adb3069b0e04-5439c2807e3mr17546566e87.45.1738083494575; Tue, 28 Jan 2025
 08:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo> <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
In-Reply-To: <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 28 Jan 2025 10:58:01 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
X-Gm-Features: AWEUYZnuV1NO_CdVjSEHj4BGZlEY-zMnXERRyRsEZ22al7MVrBDW1ebcFa4k10c
Message-ID: <CAL_Jsq+f56DoH5YTV85ZqP52sMzkOtHtjWzQ7Tu4FhKSjTSpEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_085817_761956_523515EE 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMTA6MDPigK9BTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgNDox
N+KAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPgo+ID4gW1JvYl0KPiA+
ID4gSWYgTGludXggY2FuJ3QgaGFuZGxlIDEgbm9kZSBmb3IgTiBncGlvX2NoaXAncywgdGhlbiB0
aGF0J3MgYSBMaW51eAo+ID4gPiBwcm9ibGVtLiBNYXliZSBpdCBjYW4sIElESy4KPiA+Cj4gPiBJ
IGhhdmVuJ3Qgc2VlbiBzb210aGluZyBsaWtlIHRoaXMgdG8gcmVnaXN0ZXIgMSBub2RlIGZvciBt
dWx0aSBncGlvX2NoaXBzLi4KPiA+IFRvIGdwaW8vcGluY3RybCBtYWludGFpbmVyIChMaW51cyBX
YWxsZWlqKSwgZG8geW91IGhhdmUgc3VnZ2VzdGlvbiBvbiB0aGlzPwo+Cj4gRm9yIExpbnV4IHdl
IGNhbiBjYWxsIGJncGlvX2luaXQoKSB0aHJlZSB0aW1lcyBhbmQKPiBkZXZtX2dwaW9jaGlwX2Fk
ZF9kYXRhKCkgdGhyZWUgdGltZXMgb24gdGhlIHJlc3VsdCBhbmQgaWYgd2UgdXNlIHRoZQo+IGFw
cHJvYWNoIHdpdGggdGhyZWUgY2VsbHMgKHdoZXJlIHRoZSBzZWNvbmQgaXMgaW5zdGFuY2UgMCwx
LDIgYW5kIHRoZQo+IGxhc3Qgb25lIHRoZSBvZmZzZXQgMC4uMzEpIHRoZW4gaXQgd2lsbCB3b3Jr
IGFsbCBqdXN0IHRoZSBzYW1lIEkgZ3Vlc3M/Cj4KPiBmb28tZ3Bpb3MgPCZncGlvIDIgNyBHUElP
X0FDVElWRV9MT1c+Owo+Cj4gZm9yIG9mZnNldCA3IG9uIGJsb2NrIDIgZm9yIGV4YW1wbGUuCj4K
PiBXZSBuZWVkIGEgY3VzdG9tIHhsYXRlIGZ1bmN0aW9uIEkgc3VwcG9zZS4KPgo+IEl0IGp1c3Qg
aGFzIG5vdCBiZWVuIGRvbmUgdGhhdCB3YXkgYmVmb3JlLCBldmVyeWJvZHkganVzdCBkaWQKPiAy
LWNlbGwgR1BJT3MuCgpZb3UgY2FuIGRvIGVpdGhlciAzIGNlbGxzIG9yIDIgY2VsbHMgc3BsaXR0
aW5nIHRoZSAxc3QgY2VsbCBpbnRvCjxiYW5rPjxpbmRleD4uIEknbSBwcmV0dHkgc3VyZSB3ZSBo
YXZlIHNvbWUgY2FzZXMgb2YgdGhlIGxhdHRlci4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
