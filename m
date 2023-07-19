Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A4CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMEBJC4H8Zx/yysDNIYw8oXHxgWIAUQ+pgHaj7IJGCo=; b=Lp2jq28wfmH0QA
	S8zhkQAkknUE5A3oxfA1DVxbLlBLzdjBM7Xmj2W+bBcIhW/WOYCD+30D5zutMjpLPQo0CaruKc1F3
	miLsP7/Db2zNU2ISUAqM257mzWqBsgThe5+3kteVXSd9+ydvGcvYzkskzPBz8vNbVV4twMnu6FctG
	a+6qCvwqfwab70CCf4fwWh1sUzi8unjIzHAxFoZQro87xJO/NcHkcf+JtGyUMXQut+TB5PmLmJg5F
	cMahjpoJA7qzFL3JjcZxjdBAw17YxGK2omCXoerSRaHfvwNWYBhGKY73mrSCesgvEkyZIdAR6My6H
	VeROfuSXVbGcdX3XtWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5NW-007DCT-0s;
	Wed, 19 Jul 2023 11:29:58 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5NU-007DAA-04
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:29:57 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-48147a5f0c0so1927417e0c.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689766193; x=1690370993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4VfGXDItiz3rOhUAQIyTNmCOzkfaYXWYp0bCIPaFY4=;
        b=Vgr2o6cI8lHX0NMfceh2+i/P1G842ozgB/a0J63s/W3gBktk1rCfXLxNTjs3gycu3E
         6A0j9h4au9zLjLIkBNppRbaf1zlPR7dabVZSOjeU1r5dAdIWLMN1F95sY+tGVH3XeOKD
         huVzBUUeonRnAEHlW/Ee8CILx7Lhx6AHjVJwF+M3OqhX3iGod20aaNTGyd9bR10k134x
         k68szYIS+ph8uAmeX/brp0j3hbmeUR8A2jg/PWjHipYIDk681KeC094elCrs5HI/QpTQ
         aheHT47OzZmfkFyAwxUGBSaSyO10LZqMQkFak/KYg9XWYmOHkUGbKSuLiI2XFjWBr8pi
         22wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766193; x=1690370993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4VfGXDItiz3rOhUAQIyTNmCOzkfaYXWYp0bCIPaFY4=;
        b=a16cWb4SDYBfJGMgG0E7e7l8bldu5Bmo95ZCti6qOe6NrRlbrPdVCsGqOa3x/gfHor
         3R14HS96GHvDynyw8sSdl80zISw8ytNIgn5eg/dbYOEc/CVceHToBoCP0aASIARGqE42
         OBF4nyg70PNitnK0a3GsudsCXaKtadlasBs7EmSwjF43qOp+8nyY/ZosWHjgQ3zsPsM8
         98Or1sug9NAsbAD1QkTzxBTdTg3SEsyEtjs+Tqquj5VXSFXwqKcbB05mD9kIGEgR+fLo
         i9DJVvMNnfRWgmzJcCcubZIGTDwlMPub/h+XhV8KaL33YRzY7yB4z0SbvOC0ABFzOPdQ
         vFMA==
X-Gm-Message-State: ABy/qLZxoBWO3cLJbXfyT2GQ8bKxK09KTPkpKkpnseWHwNRTVK/7LNWK
	I1/Eg91JifS0rLxmBLN/w2bwD+LZMR8BtJ/upRG1jA==
X-Google-Smtp-Source: APBJJlGhAN7cR3t34C3nRUgJY2UbNEIDk1e+PecKgQX1lein5M7EmL8XAFDWrh4b3tPGbEXDrbnagRCDx33hup8yQGc=
X-Received: by 2002:a1f:60d6:0:b0:471:7398:5af1 with SMTP id
 u205-20020a1f60d6000000b0047173985af1mr2313164vkb.10.1689766193751; Wed, 19
 Jul 2023 04:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230717205357.2779473-1-samuel.holland@sifive.com> <20230717205357.2779473-3-samuel.holland@sifive.com>
In-Reply-To: <20230717205357.2779473-3-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Jul 2023 13:29:43 +0200
Message-ID: <CAMRc=MdaS9PXE1xxSyBSxVhv-B6TNwot0+TLoF1-cNcLYaQ-WQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_042956_099975_1403FF74 
X-CRM114-Status: GOOD (  17.45  )
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

T24gTW9uLCBKdWwgMTcsIDIwMjMgYXQgMTA6NTTigK9QTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNhbiByZWR1Y2UgdGhlIGtlcm5l
bCBpbWFnZSBzaXplIGluIG11bHRpcGxhdGZvcm0gY29uZmlndXJhdGlvbnMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0K
Pgo+ICBkcml2ZXJzL2dwaW8vS2NvbmZpZyAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9ncGlvL2dw
aW8tc2lmaXZlLmMgfCA0ICsrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9k
cml2ZXJzL2dwaW8vS2NvbmZpZwo+IGluZGV4IGUzODJkZmViYWQ3Yy4uMWE4ZThhOGM4NWQ2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncGlvL0tj
b25maWcKPiBAQCAtNTY0LDcgKzU2NCw3IEBAIGNvbmZpZyBHUElPX1NBTUE1RDJfUElPQlUKPiAg
ICAgICAgICAgbWFpbnRhaW4gdGhlaXIgdmFsdWUgZHVyaW5nIGJhY2t1cC9zZWxmLXJlZnJlc2gu
Cj4KPiAgY29uZmlnIEdQSU9fU0lGSVZFCj4gLSAgICAgICBib29sICJTaUZpdmUgR1BJTyBzdXBw
b3J0Igo+ICsgICAgICAgdHJpc3RhdGUgIlNpRml2ZSBHUElPIHN1cHBvcnQiCj4gICAgICAgICBk
ZXBlbmRzIG9uIE9GX0dQSU8KPiAgICAgICAgIHNlbGVjdCBJUlFfRE9NQUlOX0hJRVJBUkNIWQo+
ICAgICAgICAgc2VsZWN0IEdQSU9fR0VORVJJQwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby1zaWZpdmUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jCj4gaW5kZXggNzQ1ZTVm
NjcyNTRlLi41OTQxYTgxNzQ5MWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tc2lm
aXZlLmMKPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwo+IEBAIC0yNzcsNCArMjc3
LDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc2lmaXZlX2dwaW9fZHJpdmVyID0g
ewo+ICAgICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBzaWZpdmVfZ3Bpb19tYXRjaCwK
PiAgICAgICAgIH0sCj4gIH07Cj4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKHNpZml2ZV9ncGlv
X2RyaXZlcikKPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzaWZpdmVfZ3Bpb19kcml2ZXIpCj4g
Kwo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7Cj4gLS0KPiAyLjQwLjEKPgoKVGhpcyBsb29rcyBn
b29kIGJ1dCBwbGVhc2UgZm9sbG93IEFuZHkncyBzdWdnZXN0aW9uIGFuZCBjb252ZXJ0IGFsbApv
Zl8qKCkgdXNlcyBpbiB0aGUgZHJpdmVyIHRvIGdlbmVyaWMgaGVscGVycywgdGhlbiBkcm9wIHBh
dGNoIDEuCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
