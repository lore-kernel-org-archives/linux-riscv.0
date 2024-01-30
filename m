Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE852C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ax+fL84++jJEU4r5bqvf1b6ixpk/iVkjxXNZAja3Wr4=; b=vQoZpyjCzXsI68
	UvcRdbCtlaguplOZo0Kjt0P2Y9SZBf0DxLaStKsIoqgLV2vkf1Zgy0spya6iqUwz1LslHAkI08qnA
	nvyhIgk255xmar1ldPXS34FFLpGxgodbnH0wquMaj2Sbd6PeZFePGUDDGBVgJvxvy1Nr6MmoM4Zfe
	ZAzLdqMsXG/Nw/kWo4de9/FRrub0Uz7Tu+Mp9XukPVOlh7bL3c23085Em9MFi3zwdHIXMkWIxV97D
	3HRPHztmsrkO/+ip3uAHdtMG3JBAAs4uSSLQhohM7hRbzMashf2cHn3/GP0oqQxuhs4ETIq6j8Io5
	N8jOOzUNMjoyDnxgarvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnoU-0000000Gmw2-3hEr;
	Tue, 30 Jan 2024 13:06:06 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnoR-0000000GmvA-23Wi
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:06:06 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc24f395c84so3245635276.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 05:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706619960; x=1707224760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQ8MCplEFGaJPsYTH50sxtg3Pn4u8Wq5BnVFPQWC7E8=;
        b=KSgizMSc3e6xHCktUkW7FmYk09XVLmMvV48ImtMIjQvHAqbT9ljwBl5NajHo3FUirk
         DLBDM+KdWvodXMIAq+YrQWKlV+ISK7aq5crcrUaIr+ZhSp//ZmZdyKdv7H3t8dj4AANo
         MKUE/oS1KTmv1ibQwGV1gTqZ5p0QE4KFSoeaHkxV5EEu3eNtWeYrbps1eIb30CSQE+xh
         l0GxeRYUCqsF43f4x1l8VZxaz/4ENQFv/b2bTs/oLCEac96OKqKddBkkZZnkc8vqtOWi
         1c15LFnAeo9KOMeuUxubPs5waT+4jwa5mf3fEOOo3lkxh08Rj/KPwplNV+n0q/BUdcmK
         Gi+Q==
X-Gm-Message-State: AOJu0YxMX7eUsReO7aopPoN0vygYNeeG3fPpcrWBK3vwJKYAPcdLmtyE
	6mSj2KnJ2zmSKTP4ncSykOnLENjX2hLQXOjd2JEc/D3WPAnOlLJyAoJcVFPddiE=
X-Google-Smtp-Source: AGHT+IFKh02DrN5FSGWhcVQ9cfBKuGGo4jFFJyWJY1bU7gsHWk55lUM2XQaV+2MUrALfIbq3N+RRJw==
X-Received: by 2002:a05:6902:1368:b0:dc2:3667:3fbc with SMTP id bt8-20020a056902136800b00dc236673fbcmr595783ybb.48.1706619960449;
        Tue, 30 Jan 2024 05:06:00 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id z34-20020a25ada2000000b00dc256eab936sm2953804ybi.52.2024.01.30.05.06.00
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 05:06:00 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-602c714bdbeso29645307b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 05:06:00 -0800 (PST)
X-Received: by 2002:a81:b3c7:0:b0:602:a429:72d2 with SMTP id
 r190-20020a81b3c7000000b00602a42972d2mr740057ywh.22.1706619959106; Tue, 30
 Jan 2024 05:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129-magical-unclaimed-e725e2491ccb@spud> <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
 <CA+V-a8v0tdr-xh__5rcK=xL-yYG1qLtSrAUjPcS_-ZVYy8p9pQ@mail.gmail.com>
In-Reply-To: <CA+V-a8v0tdr-xh__5rcK=xL-yYG1qLtSrAUjPcS_-ZVYy8p9pQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 14:05:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVu+VNW56VYkJs2w-S=1372_ZL6K2LQGKoR9vugpR+Z-w@mail.gmail.com>
Message-ID: <CAMuHMdVu+VNW56VYkJs2w-S=1372_ZL6K2LQGKoR9vugpR+Z-w@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_050603_553172_226CDD5C 
X-CRM114-Status: GOOD (  34.61  )
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

SGkgUHJhYmhha2FyLAoKT24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTo1OeKAr1BNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MzAsIDIwMjQgYXQgMTE6MTPigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNjozMOKAr1BNIENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDI5
LCAyMDI0IGF0IDAzOjE2OjE0UE0gKzAwMDAsIFByYWJoYWthciB3cm90ZToKPiA+ID4gPiBGcm9t
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
Cj4gPiA+ID4KPiA+ID4gPiBEb2N1bWVudCBSWi9GaXZlIChSOUEwN0cwNDNGKSBJUlFDIGJpbmRp
bmdzLiBUaGUgSVJRQyBibG9jayBvbiBSWi9GaXZlIFNvQwo+ID4gPiA+IGlzIGFsbW9zdCBpZGVu
dGljYWwgdG8gb25lIGZvdW5kIG9uIHRoZSBSWi9HMkwgU29DIHdpdGggYmVsb3cgZGlmZmVyZW5j
ZXMsCj4gPiA+ID4gKiBBZGRpdGlvbmFsIEJVUyBlcnJvciBpbnRlcnJ1cHQKPiA+ID4gPiAqIEFk
ZGl0aW9uYWwgRUNDUkFNIGVycm9yIGludGVycnVwdAo+ID4gPiA+ICogSGFzIGFkZGl0aW9uYWwg
bWFzayBjb250cm9sIHJlZ2lzdGVycyBmb3IgTk1JL0lSUS9USU5UCj4gPiA+ID4KPiA+ID4gPiBI
ZW5jZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgInJlbmVzYXMscjlhMDdnMDQzZi1pcnFjIiBpcyBh
ZGRlZCBmb3IgUlovRml2ZQo+ID4gPiA+IFNvQy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KPiA+Cj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwtaXJxYy55YW1sCj4gPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jl
bmVzYXMscnpnMmwtaXJxYy55YW1sCj4gPiA+ID4gQEAgLTEzNCw2ICsxNDEsMTIgQEAgcHJvcGVy
dGllczoKPiA+ID4gPiAgICAgICAgLSBjb25zdDogdGludDMwCj4gPiA+ID4gICAgICAgIC0gY29u
c3Q6IHRpbnQzMQo+ID4gPiA+ICAgICAgICAtIGNvbnN0OiBidXMtZXJyCj4gPiA+ID4gKyAgICAg
IC0gY29uc3Q6IGVjY3JhbTAtdGllMQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLXRp
ZTIKPiA+ID4gPiArICAgICAgLSBjb25zdDogZWNjcmFtMC1vdmYKPiA+ID4gPiArICAgICAgLSBj
b25zdDogZWNjcmFtMS10aWUxCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEtdGllMgo+
ID4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0xLW92Zgo+ID4KPiA+IFdoeSBub3QgdXNlIHRo
ZSBuYW1pbmcgZnJvbSB0aGUgZG9jcyAoYWxsIDYgaW5jbHVkZSAidGkiKT8KPiA+IEVDN1RJRTFf
MCwgRUM3VElFMl8wLCBFQzdUSU9WRl8wLCBFQzdUSUUxXzEsIEVDN1RJRTJfMSwgRUM3VElPVkZf
MQo+ID4gPT4gZWM3dGllMS0wLCBlYzd0aWUyLTAsIGVjN3Rpb3ZmLTAsIC4uLj8KPiA+Cj4gQWdy
ZWVkLgo+Cj4gPiA+IEkgdGhpbmsgdGhlIHJlc3RyaWN0aW9ucyBhbHJlYWR5IGluIHRoZSBmaWxl
IGJlY29tZSBpbmNvcnJlY3Qgd2l0aCB0aGlzCj4gPiA+IHBhdGNoOgo+ID4gPiAgIC0gaWY6Cj4g
PiA+ICAgICAgIHByb3BlcnRpZXM6Cj4gPiA+ICAgICAgICAgY29tcGF0aWJsZToKPiA+ID4gICAg
ICAgICAgIGNvbnRhaW5zOgo+ID4gPiAgICAgICAgICAgICBlbnVtOgo+ID4gPiAgICAgICAgICAg
ICAgIC0gcmVuZXNhcyxyOWEwN2cwNDN1LWlycWMKPiA+ID4gICAgICAgICAgICAgICAtIHJlbmVz
YXMscjlhMDhnMDQ1LWlycWMKPiA+ID4gICAgIHRoZW46Cj4gPiA+ICAgICAgIHByb3BlcnRpZXM6
Cj4gPiA+ICAgICAgICAgaW50ZXJydXB0czoKPiA+ID4gICAgICAgICAgIG1pbkl0ZW1zOiA0Mgo+
ID4gPiAgICAgICAgIGludGVycnVwdC1uYW1lczoKPiA+ID4gICAgICAgICAgIG1pbkl0ZW1zOiA0
Mgo+ID4gPiAgICAgICByZXF1aXJlZDoKPiA+ID4gICAgICAgICAtIGludGVycnVwdC1uYW1lcwo+
ID4gPgo+ID4gPiBUaGlzIHVzZWQgdG8gcmVxdWlyZSBhbGwgNDIgaW50ZXJydXB0cyBmb3IgdGhl
IHR3byBjb21wYXRpYmxlcyBoZXJlCj4gPiA+IGFuZCBhdCBsZWFzdCB0aGUgZmlyc3QgNDEgb3Ro
ZXJ3aXNlLiBOb3cgeW91J3ZlIGluY3JlYXNlZCB0aGUgbnVtYmVyIG9mCj4gPiA+IGludGVycnVw
dHMgdG8gNDggdGhlcmVieSByZW1vdmluZyB0aGUgdXBwZXIgbGltaXRzIG9uIHRoZSBleGlzdGlu
Zwo+ID4gPiBkZXZpY2VzLgo+ID4KPiA+IEknbSBnb25uYSByZXBlYXQgKGFuZCBleHRlbmQpIG15
IHF1ZXN0aW9uIGZyb20gWzFdOiBIb3cgY29tZSB3ZSB0aG91Z2h0Cj4gPiBSWi9HMkwgYW5kIFJa
L1YyTCBkbyBub3QgaGF2ZSB0aGUgYnVzIGVycm9yIGFuZCBFQ0NSQU0gaW50ZXJydXB0cz8KPiA+
Cj4gSG1tIG5vdCBzdXJlIGhvdyB0aGlzIHdhcyBtaXNzZWQgZWFybGllci4KPgo+ID4gTG9va3Mg
bGlrZSBtb3N0IG9mIHRoZSBjb25kaXRpb25hbCBoYW5kbGluZyBjYW4gYmUgcmVtb3ZlZCAoc2Vl
IGJlbG93KS4KPiA+Cj4gPiA+IEdpdmVuIHRoZSBjb21taXQgbWVzc2FnZSwgSSBmaWd1cmUgdGhh
dCBwcm92aWRpbmcgNDggaW50ZXJydXB0cyBmb3IKPiA+ID4gKGF0IGxlYXN0IHNvbWUgb2YpIHRo
b3NlIGRldmljZXMgd291bGQgYmUgaW5jb3JyZWN0Pwo+ID4KPiA+IExvb2tzIGxpa2UgYWxsIG9m
IFJaL0cyTHssQ30sIFJaL1YyTCwgUlovRzJVTCwgYW5kIFJaL0ZpdmUgc3VwcG9ydAo+ID4gYWxs
IDQ4IGludGVycnVwdHMuICBSWi9HM1MgbGFja3MgdGhlIGZpbmFsIHRocmVlIGZvciBFQ0NSQU0x
Lgo+ID4KPiBBZ3JlZWQgZm9yIFJaL0cyTHssQ30sIFJaL1YyTCwgUlovRzJVTCwgYW5kIFJaL0Zp
dmUsIGJ1dCBmb3IgUlovRzNTIGl0Cj4gYmVjb21lcyB0cmlja3kgdGhlIGludGVycnVwdHMgZm9y
IEVDQ1JBTTAvMSBhcmUgY29tYmluZWQgaGVuY2UgdGhleQo+IGhhdmUganVzdCAzIGludGVycnVw
dHMuIEhvdyBkbyB5b3UgcHJvcG9zZSB0aGUgYWJvdmUgaW50ZXJydXB0IG5hbWluZz8KCkkgZ3Vl
c3MgaXQgZG9lc24ndCBodXJ0IHRvIGhhdmUgYW4gaW5kZXggMCBvbiBhIHBhcnQgdGhhdCBoYXMg
b25seSBhCnNpbmdsZSBzZXQ/CgpBbHRlcm5hdGl2ZXMgd291bGQgYmUgdG8KICAxLiBEcm9wIHRo
ZSBpbmRleCBjb21wbGV0ZWx5IG9uIFJaL0czUywgY29tcGxpY2F0aW5nIGJpbmRpbmdzIGFuZAog
ICAgIGRyaXZlciwKICAxLiBEcm9wIHRoZSBpbmRleCBmb3IgdGhlIGZpcnN0IHNldCwgYW5kIHVz
ZSBpbmRleCAyIGZvciB0aGUgc2Vjb25kIHNldCwKICAgICBjYXVzaW5nIHRoZSBuYW1lcyB0byBk
aWZmZXIgZXZlbiBtb3JlIG9uIHBhcnRzIHdpdGggMiBzZXRzLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
