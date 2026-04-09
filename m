Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4F4E98FAF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 05:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0N3ImRCdf8uveokyEEBbGWICX06DbP2WkVQsE4b9AU=; b=pUEoHe3C3KvP4L
	ZvgsS5Lrg8aHnXA34+9xhP2e3Iq6w3mOS7gkkzvxDsRnXxBACqsfnM381zdb1GLwn25xDel0HtEKZ
	Dq3FwB4PUqNfysIw0fFjUeSe2FDOqyYfKeJfUUi5joE3VTxRVmnX/SpgHvSWXezxNWZSQZ8McqLB9
	snekPate4bzRiKpec8chHvE3GiaIRRmyKSJZUDol5GSDN44A8y9yD0E7JvEYTWYe20pEbqVF+yeJ7
	jl5SMcxpSjY9ZdTArxf8gXBk+On1R6a05JwG+A/iVgL4Jyi5d2ZXEYwlWtoPRCje1vPOBW1CSbK3t
	LHRhB6EWpVtTnmG8lMoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAi5a-00000009j0G-2teZ;
	Thu, 09 Apr 2026 05:38:02 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAi5X-00000009izt-1IKc
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 05:38:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-79a46260385so5280487b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Apr 2026 22:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775713078; cv=none;
        d=google.com; s=arc-20240605;
        b=KZyeSjk403oXKax3JxcwwWe2AZzmpXbAe5K8+Zs2JNudqUJlFv3ZkdLGDiGaHD85EK
         cEFA0HmPIAfHFGm7YOwCCebEA7DwfPP+oVahCpT+R8Mohxd3yiiGPb/XP6LfOszXNktc
         wLojj/wUoB2G8PHqSX+BbPb8b1UPhhIWfdyNKzbs9YYU8J7r5qTy4nLY1D7sH6hrzyWe
         2LWvExsaGI/PtsM4eT9JVct8IAM0A1+AfWNess0QIj/urV2zaMyAMuC03aX92oGmNIm5
         23qkuYYhi0oYUDu7lI3+jOnBYQf1+uQy2nXI8vFQWGX/uy+PPCPLVFUximY5woSkQv3b
         r/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        fh=ZVjOaBI1suWsIRvMWUVxJl2LZeptNCbGk6LAPm4tEpA=;
        b=OhX0J8g8xuO6HAfbfuJ1soZlczExfUzWBaTwSFCphQZWPgBjmAeDe1FiqaDCaE4LaG
         V1nMno6vOmc8x2Yp+e9SH30Z3yVtvz2MzjRrJyGFKw+j+zTdRadZYlIk8TCrSqLBjqcZ
         C4v7ZVELW0tDJ9ojoT+6EPhMrurS0jGj9UXffE1SYGobCxOvqwyoseorLBpcnGWpdKxO
         y3C6oNz02pui9RSWhh/SBsm5YzXqhSmdF7HI3Lfg/7YNM3XWfmNa+I6Ui8r+IwvXHqLc
         05jOtoOad8jsVG3aa4PFJb1DME8RNTdt4ypi6lyUOhh4iIZWBLCQRq/pjbtlcBEtcyml
         0y8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775713078; x=1776317878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        b=LArYHvJWRfalbnKe0s0kw5Hg9BtDArupgpPvx0zZERE4ZZM4ALBLkLr03w510XHdkK
         J5ESz8NDWDMGBsf2pP/7Tm3zFVK8w78V32PM3Qtt0gSwLK01igX/xiXZ0WEX4wkljYn5
         kC2wTsyRtz+eqodwTFquWiaviNpVNzGF++Qu6qO/lWG+CnvdegBvi1efLYy+j0MzyVy8
         Q8W/NhP71yP7ErnJAqF3drATfaM9sxh6bNKZxK96W9G0lH10IM5ahOUSciEQMXybss23
         9kGE/AtSJ3Bxl6Kxd8r8uwT9sGngywC6YOd5Ui1tKBh7wKOxKu6fIogT5XxGXYLA2Gn0
         aBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775713078; x=1776317878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3XyCP+obrtYFom9qmKraRyXOU/Ju05wWrz/nQcIo2w=;
        b=MhDITnUnjMEI131Yx/XgIa8msdWxS6Ip/rdQGMHnN9EHYvi/cZRNtNElK3Wm56bUom
         TnUDdJsbziien93QNFV8txZezug6mHI22QInXtZ1JogLAN0CNsZRgjJ9AWKvMQB6akOj
         GecRUoFq8MwBRyigpsSUWFsUey70S1jeG1OL6aRbUb/Cbp44sRcQdr7xl+0i/qFds1nV
         nUVpQfj3n2+RWiB09uRqHWGMV1GPzBn3YGGFjY+eBK8X3tuOg6XgJUfRE3LZ/uTMyjqv
         iufTjeF6jM8HWuL+tIJta7t3Hq+FsePyv7NEJm1j3D/tG/qTzj0ODL9Bch73X36Z2HnL
         /gCw==
X-Forwarded-Encrypted: i=1; AJvYcCUR14XnWfkyTvq1HfDl5RU1CnHTOiLT79XYKRzM+pyq1zzmKo+0UwOqtlwBFXIAbtNpapehFhcJC7PKlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFrhN8op46eEGtm/ruC4pJW91XFFmENgtikIZDK1EgCPepEbgp
	lzVbd57UXQl3zbFX9ZxsrAIlaqIkM+curu9bH9Jz2enLqpXoJydeO97RTr/hmRfubMRb5qJ6xkN
	pC5hMzra0jUym5fcs7FrB1NVIGpp2BtbaNmGwdtYNug==
X-Gm-Gg: AeBDieuz0hok6AcUQL+OWVpKDSeXSzAlNV5oeHGDu1YwZUw0n6Q0CNhnupri42/85+Z
	KFE/L3KKqMm/DHv/3FwOLW5IRf4VEZSaO4QMVxQ9qYIDRWv/D8B/Dy793FKs7jD9M2KP6DU4SYx
	qncdfFswGOqqSyCFAl5yLk++PsQsVR1eLEnxgxT7f5Zc80pJh/uDxUIsmgjhslLqsR0jsokc+bh
	DwxrnYwaA2LFc1HhDPrCrOikrxWAVKCdilfgoacLV7yuPhZunnCRG3cnk7njbZ/GspVsZmth/5B
	CCLRbyvX5w==
X-Received: by 2002:a05:690c:5c1a:b0:79a:b766:c034 with SMTP id
 00721157ae682-7a4d41b69aamr250652307b3.25.1775713078165; Wed, 08 Apr 2026
 22:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250321083507.25298-1-nick.hu@sifive.com> <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com> <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
In-Reply-To: <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 9 Apr 2026 13:37:46 +0800
X-Gm-Features: AQROBzBOMRLMyPW1IxjFIvzYLs1WKX-TeC10rrZj9pOqwnojeXqFrZDa0fuKyLU
Message-ID: <CAKddAkC-okFpyHcbFXQwTFmLfwBdBow=mAJBxirEdbcrYmOcyQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
To: Charles Perry <charles.perry@microchip.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_223759_354781_1811AC3E 
X-CRM114-Status: GOOD (  23.62  )
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

T24gV2VkLCBBcHIgOCwgMjAyNiBhdCAxMDo0MeKAr1BNIENoYXJsZXMgUGVycnkKPGNoYXJsZXMu
cGVycnlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciAwOCwgMjAyNiBhdCAw
MjoxNToxOVBNICswODAwLCBOaWNrIEh1IHdyb3RlOgo+ID4gT24gRnJpLCBNYXIgMjcsIDIwMjYg
YXQgNDo1NuKAr0FNIENoYXJsZXMgUGVycnkKPiA+IDxjaGFybGVzLnBlcnJ5QG1pY3JvY2hpcC5j
b20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE1hciAyMSwgMjAyNSBhdCAwNDozNTowNlBN
ICswODAwLCBOaWNrIEh1IHdyb3RlOgo+ID4gPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZyBhbmQg
cHJvcGVydHkgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjIuIFRoZSBTaUZpdmUKPiA+ID4gPiBDTElO
VCB2MiBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGUgU2lGaXZlIENMSU5UIHYwIGR1ZSB0byBkaWZm
ZXJlbmNlcwo+ID4gPiA+IGluIHRoZWlyIGNvbnRyb2wgbWV0aG9kcy4KPiA+ID4KPiA+ID4gSGVs
bG8gTmljaywKPiA+ID4KPiA+ID4gQ2FuIHlvdSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBpcyB0
aGlzIGRpZmZlcmVudCBjb250cm9sIG1ldGhvZD8gSSd2ZQo+ID4gPiBmb3VuZCB0aGF0IGJvdGgg
T3BlblNCSSBbMV0gYW5kIFUtQm9vdCBbMl0gdXNlIHRoZSBzYW1lIG1hdGNoIGRhdGEgaW4gdGhl
aXIKPiA+ID4gY2xpbnQgZHJpdmVyIHdoaWNoIHdvdWxkIGluZGljYXRlIHRoYXQgdGhleSBhcmUg
Y29tcGF0aWJsZS4KPiA+ID4KPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KPgo+IEhlbGxv
IE5pY2ssIG5vIHdvcnJpZXMuCj4KPiA+IFVubGlrZSB2MCwgdjIgcmVxdWlyZXMgYSB3cml0ZSB0
byB0aGUgbXRpbWUgcmVnaXN0ZXIgdG8ga2ljayB0aGUgdGltZXIuCj4KPiBBIGtpY2sgb25jZSBh
dCB0aGUgYmVnaW5uaW5nIG9yIGV2ZXJ5IHRpbWUgYSBtYWNoaW5lIHRpbWVyIGludGVycnVwdCBm
aXJlcz8KPgpBIGtpY2sgb25jZSBhdCB0aGUgYmVnaW5uaW5nCgo+ID4KPiA+ID4gQWxzbywgZG8g
eW91IGtub3cgaWYgdGhlcmUncyBhbiBlYXN5IHdheSB0byB0ZWxsIGlmIGEgc2lmaXZlIGNsaW50
IGlzIGEgdjAKPiA+ID4gb3IgdjI/Cj4gPiA+Cj4gPiBzaWZpdmUsY2xpbnQyIGludHJvZHVjZXMg
YWRkaXRpb25hbCBNTUlPIHJlZ2lzdGVycwo+Cj4gSXMgdGhhdCB0aGUgaGlnaCByZXNvbHV0aW9u
IHRpbWVycyAoSFJUKSBtZW50aW9ubmVkIGluIHRoZSBkZXNjcmlwdGlvbj8KPgo+IEFuZCBsYXN0
IHF1ZXN0aW9uLCB3b3VsZCB5b3UgaGFwcGVuIHRvIGtub3cgaWYgc2lmaXZlIG1hZGUgYSBjbGlu
dCB2MSB0aGF0Cj4gZG9lcyBOT1QgcmVxdWlyZSB0aGUgbXRpbWUga2ljayBidXQgZG9lcyBoYXZl
IHRoZSBIUlQ/Cj4KWWVzLCB0aGF0J3MgY29ycmVjdC4KCj4gSSdtIHRyeWluZyB0byBmaWd1cmUg
b3V0IHdoYXQgc2hvdWxkIGJlIHRoZSBjb21wYXRpYmxlIGZvciBQSUM2NC1IUFNDLgo+IFNvbWUg
Y29kZSBmcm9tIGEgcmVwb3NpdG9yeSBjYWxsZWQgIkZTRk0iIHVzZWQgInNpZml2ZSxjbGludDEi
IGZvciB0aGUKPiBjb21wYXRpYmxlLiBJJ20gd29uZGVyaW5nIGlmIEkgc2hvdWxkIGFkZCB0aGUg
Y2xpbnQgdjEgdG8gdGhpcyBmaWxlLgo+Cj4gVGhhbmtzLAo+IENoYXJsZXMKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
