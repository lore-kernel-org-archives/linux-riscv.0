Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C3CC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNOQTqCrtT9TnU1ldQ03eh9u4lYL5b6TWThRlEZjo5w=; b=us2G4Yvt7wOc5y
	TeR0jEBdSRViLEmKpyxmIxbLuI8DUBTS2g3Ls1ugsWWryiMsp5+Bn/nftgxZM3HysREMKCxU8FSoj
	a5ug5WVB+4BL2Y3g28I7rxbUlyVJlzX200VGhVh38EUMIVqLMZg4keCrR/lcAuql7oPevjdbHQ9Gl
	HqxmUsLX/QEDk9LxKlTZfBUI6vbmCcUJSegH4ZisA/PXXpO+Ge8xGky49zYDoxyjuCZ/CDYevLD07
	HXPNzUFCP3pV3dhgu3y3AB18MaYzhAb1Tt+zth7eTJDT6hBzCQ5wYWWqTKXnPLTp+Fl36G8wCJvo7
	rq+Q2dYalO2GyDDj1wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXH4-000000087X2-2vX7;
	Thu, 01 Feb 2024 13:38:38 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWpv-00000007vsk-3ZR9
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 13:10:38 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4bdace590deso1032409e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706793033; x=1707397833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwqkQIF71vpcy9N9j4GerjRpbbfKrzc/uUzrxwJJGYo=;
        b=HDWJR4cJ33dYeQAFOw/6cGU38baiFdlKAgO7Cu9nsk5S71Th9mRsEvfW1YWUEZqqSz
         eWFaMw7Y6ifHpLJeNDxI7gzo62Rv2hpWYqwLcsSB2DfL1H2D+v51cyfxmjlaR32pJuiM
         Ulqq6gjY4FN/4TJb64nDwQyEgRE4a7QiLQONtG5QcHjOEl6DcWXe8tgqC3BhDEd+XVtV
         VEUaybYpuYXn5Q1H4NFYS5JPFC5sFYWibUNnDZcgCSuRxlHnwFlSxWCPYzhhaiMEaogH
         cF4wMVSDQchj1Fjnh/mtaB0yQjXx2IQpFO0NmnKfEpZKVzeCyv6NgRJSLdo++YKfhCBv
         TyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706793033; x=1707397833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwqkQIF71vpcy9N9j4GerjRpbbfKrzc/uUzrxwJJGYo=;
        b=P6jNuy/ne65+PMPB8bZWJGpoljiGeoEXF3ADDxZYv7ISfTiU613mh3wE9Tl/LC+J7d
         lvo11pssMkxVWYwf6yQbtYB6zd67/AxIR92dqsvFPtQVQG54enSNUjjIpX+iEPmZxezy
         GQKl2AeotEC+vfOnFZfXZlLcwN9kBheXQqdW/6k1UfJLBD8+pjqCHn++mppedBAWFKec
         2lPY4h25NbO0sk5E2S1e/0SaxT7Ar2K1GlktapDHb5QitxcGxcarB7YOnul52tAeq19w
         dWgxKxbB+hter5FMfS+ydiXrpcUWQdjTurr0TgN4262VVXOjm+kzVd95VYRFMlgOOIca
         v0vQ==
X-Gm-Message-State: AOJu0YxwAsi4gUvGYt1E6Dwt7uR49CnRih85v2uMhPj7DW6tT5D2en7k
	8WSOO+hrxMw68R6GlFwWHWxQgFAIEGVe5e8kxOAmk3mbW/m/J//yfHzXwqQnqSz7tzp+56pZ+1v
	NVFiI6PRwHjSBdLhMoCi4ndnb2eA=
X-Google-Smtp-Source: AGHT+IGsf+rRSEKnjNQAqd67Fb46xfvPvSc/YPD5cESPQuN63qNLUZEqMRkqhla21Oa+2++defXTos7E//YR0ZZoJDQ=
X-Received: by 2002:a05:6122:cb:b0:4b6:e3b6:41ea with SMTP id
 h11-20020a05612200cb00b004b6e3b641eamr2291081vkc.4.1706793033217; Thu, 01 Feb
 2024 05:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV=E5VDZn0QjiGQL73j135LiA1QNrYH-hCve1Yk0PqJ=A@mail.gmail.com>
In-Reply-To: <CAMuHMdV=E5VDZn0QjiGQL73j135LiA1QNrYH-hCve1Yk0PqJ=A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Feb 2024 13:09:58 +0000
Message-ID: <CA+V-a8tJfJTEOkSP-F1B3Q7EO6Cu9ij88ceGJcXCQjTFneWxUA@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: renesas: r9a07g043f: Add IRQC node to
 RZ/Five SoC DTSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_051035_991684_A8A85839 
X-CRM114-Status: GOOD (  26.53  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIEphbiAzMCwgMjAy
NCBhdCAxMToyNeKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDox
NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4g
RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4KPiA+IEFkZCB0aGUgSVJRQyBub2RlIHRvIFJaL0ZpdmUgKFI5QTA3RzA0M0YpIFNv
QyBEVFNJLgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4K
PiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+IEBA
IC01MCw2ICs1MCw4MiBAQCAmc29jIHsKPiA+ICAgICAgICAgZG1hLW5vbmNvaGVyZW50Owo+ID4g
ICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKPiA+Cj4gPiArICAgICAgIGlycWM6
IGludGVycnVwdC1jb250cm9sbGVyQDExMGEwMDAwIHsKPiA+ICsgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzZi1pcnFjIiwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInJlbmVzYXMscnpnMmwtaXJxYyI7Cj4gPiArICAgICAgICAgICAgICAgcmVn
ID0gPDAgMHgxMTBhMDAwMCAwIDB4MjAwMDA+Owo+ID4gKyAgICAgICAgICAgICAgICNpbnRlcnJ1
cHQtY2VsbHMgPSA8Mj47Cj4gPiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MD47
Cj4gPiArICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gPiArICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEoMCkgSVJRX1RZUEVfTEVWRUxf
SElHSD4sCj4KPiBBcyB0aGlzIGlzIHRoZSBSWi9GaXZlLXNwZWNpZmljIC5kdHNpIGZpbGUsIGFu
ZCBub3QgdGhlIGNvbW1vbiBiYXNlCj4gLmR0c2ksIHlvdSBjb3VsZCBhdm9pZCB1c2luZyBTT0Nf
UEVSSVBIRVJBTF9JUlEoKSBoZXJlLgo+IEkgYW0gbm90IHN1cmUgd2hhdCBpcyBtb3N0IHJlYWRh
YmxlLi4uCj4KT2ssIGlsbCBzd2l0Y2ggdG8gdGhlIHVzdWFsIHdheSBoZXJlLi4KCj4rICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxTT0NfUEVSSVBIRVJBTF9JUlEoMjUpIElSUV9UWVBFX0VE
R0VfUklTSU5HPiwKSW4gUlovRml2ZSBIVyBtYW51YWwgdGhpcyBpcyBkb2N1bWVudGVkIGFzIExF
VkVMX0hJR0ggYW5kIFJaL0cyVUwgdGhpcwppcyBkb2N1bWVudGVkIGFzIEVER0UuIEkgdmUgaW50
ZXJuYWxseSBhc2tlZCBmb3IgY2xhcmlmaWNhdGlvbiB3aXRoCnRoZSBIVyB0ZWFtLiBJZiBpdCdz
IHRoZSBzYW1lIGZvciBib3RoIHRoZSBTb0NzIEknbGwgbW92ZSB0aGlzIG5vZGUgdG8KY29tbW9u
IFNvQyBkdHNpIGFuZCBqdXN0IHVwZGF0ZSB0aGUgY29tcGF0IHN0cmluZyBpbiByei9maXZlIHNw
ZWNpZmljCmR0c2kuCgpDaGVlcnMsClByYWJoYWthcgoKPiBUaGUgcmVzdCBMR1RNIChwZW5kaW5n
IGludGVycnVwdCBuYW1lcyByZXZpZXcgY29tbWVudHMpLgo+Cj4gR3J7b2V0amUsZWV0aW5nfXMs
Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCj4KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
