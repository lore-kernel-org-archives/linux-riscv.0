Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24057C47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+NACwjccqVAb3bxCp2OaBajpuELkFyagJmW8CfJ6S8=; b=PpMiUkmcqctfFI
	y6Jd+rMN5Iv2deDArDamGYradeFPkmy/e8Qy/cLIQN/PrkTVBx23IdJbYQ9R5HUw7u+U4JOuNmDch
	OHvFOZnGzpg36zFD5QTklqWdacPASIKIpQpxiWn0+qWqSnXb4r3/TKkB/vBeEsH9MvnKcUJ6E7GJ6
	BRJCvdcoc+AZHYO/eCW20O0iyNxZSpXCYZBeRLs9Nkyg/yhr3LivwghKWpOJO5GhobPeFdJCMqCuY
	rxptSKNuQWH7iXko9XeQvTifD3NeG7ra+gkTv3DcQPmEUerpJ+ZA8tV4NfhfJHUXkiQihwG4S7ap5
	B+ogedGyeKmeIbwF1NvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqXs-0000000HH2V-2jag;
	Tue, 30 Jan 2024 16:01:08 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqXq-0000000HH0G-1Hw6
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:01:07 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4bd87fd64c1so1138546e0c.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706630461; x=1707235261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8xU4bZ3PfIAed/M9W8X66NuCwYyPT1QQmLa1y80Xgc=;
        b=AQidF3nRIqLklgEXgdJCTCDfSmgIDNPRYInqh1f6Hwip5M/m85jbIFn0NKr92DrdkQ
         BMS91jlRtHYrwBDiBE1YYTZoIhP4TvmSbTWWcfSZTYa+wOOG9Ptv0/tHoJ1hxN2JR8dF
         rjI8D6xXQj8at3iZwr+8UQG90529AeDgqKlXh6LDWqSN4ETRzcNuic5JY2U1up5ni1mB
         +K1aSFTro+NwlkvED0FXqbOtAtIK8gIgibwE+VEco/7ZPwuUZFUPy0wTpJg0NZ9gJMht
         r77wIcuhlQ3STcdCEksBERsJcvmemAOV7082Z0/HOyXL9Cn6/iKmsUlRrYommBZKvQ5W
         86KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706630461; x=1707235261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8xU4bZ3PfIAed/M9W8X66NuCwYyPT1QQmLa1y80Xgc=;
        b=ApEBuj07BRiDB3rR5G7j4SGu1jCphZIcWUPpSFYUABoaA/WZy89XV4Sm4gFjpl3HD0
         KWxfjJbbVL/tjmNjD8wdtumiaX7utRCsQAcgOy1PWBuQfOPKYHT4RejldlGr7ea9HAAI
         vidBLsenL0kbHFBp3LbTWwm086YZNnbAo+ZBDSvSgUXf+yRtf4QNi0kJo1uNyInldssL
         UBr+Ul00wMHkh/l6x9fddyFiagwemwOWVuBvoKzeQIoikPwFOmkkzpiOox0+d1xBVFFF
         se6US2ZlOHJEEtig4gHcgPrI29WK5NJvA2jEyZy+Es/Xj9pY5MfCN0qJN2rux9cRu8OP
         NgtQ==
X-Gm-Message-State: AOJu0YyYlKd9G/o5kEPrkeZw4/r0EKvX5/edGU0/dbARdfL7oiiXHnT0
	jWzYIOlXbmBkrYOhCc0n8zXhnMzIk9Ky0FOPaLrK45Bo+FAQWrUJHGb+0I25zLr28bja43kqYsb
	buVoOH00+mYTNlebgEHfjw3W++wc=
X-Google-Smtp-Source: AGHT+IFxY/bjVN7x1nzWnlimAtCL47cP/CvQzpmRUgU9h7PfNyufHAQiBN6nyFGDIyEPsMFy8AJAN4wg/4Ve7rcZrUk=
X-Received: by 2002:a05:6122:4b1b:b0:4b6:c3ae:97f6 with SMTP id
 fc27-20020a0561224b1b00b004b6c3ae97f6mr4553861vkb.0.1706630460417; Tue, 30
 Jan 2024 08:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129-magical-unclaimed-e725e2491ccb@spud> <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
 <CA+V-a8v0tdr-xh__5rcK=xL-yYG1qLtSrAUjPcS_-ZVYy8p9pQ@mail.gmail.com> <CAMuHMdVu+VNW56VYkJs2w-S=1372_ZL6K2LQGKoR9vugpR+Z-w@mail.gmail.com>
In-Reply-To: <CAMuHMdVu+VNW56VYkJs2w-S=1372_ZL6K2LQGKoR9vugpR+Z-w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Jan 2024 16:00:29 +0000
Message-ID: <CA+V-a8vtqUP0M0A-UP1dXBb8Hwejyn39Ah_zd1bRKpEQreuLDw@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_080106_468588_B048D660 
X-CRM114-Status: GOOD (  29.58  )
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

SGkgR2VlcnQsCgpPbiBUdWUsIEphbiAzMCwgMjAyNCBhdCAxOjA24oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUdWUsIEphbiAzMCwgMjAyNCBhdCAxOjU54oCvUE0gTGFkLCBQcmFiaGFrYXIKPiA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCBKYW4gMzAsIDIwMjQg
YXQgMTE6MTPigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPiA+IDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDY6MzDigK9QTSBDb25vciBE
b29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgSmFuIDI5LCAy
MDI0IGF0IDAzOjE2OjE0UE0gKzAwMDAsIFByYWJoYWthciB3cm90ZToKPiA+ID4gPiA+IEZyb206
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBEb2N1bWVudCBSWi9GaXZlIChSOUEwN0cwNDNGKSBJUlFDIGJp
bmRpbmdzLiBUaGUgSVJRQyBibG9jayBvbiBSWi9GaXZlIFNvQwo+ID4gPiA+ID4gaXMgYWxtb3N0
IGlkZW50aWNhbCB0byBvbmUgZm91bmQgb24gdGhlIFJaL0cyTCBTb0Mgd2l0aCBiZWxvdyBkaWZm
ZXJlbmNlcywKPiA+ID4gPiA+ICogQWRkaXRpb25hbCBCVVMgZXJyb3IgaW50ZXJydXB0Cj4gPiA+
ID4gPiAqIEFkZGl0aW9uYWwgRUNDUkFNIGVycm9yIGludGVycnVwdAo+ID4gPiA+ID4gKiBIYXMg
YWRkaXRpb25hbCBtYXNrIGNvbnRyb2wgcmVnaXN0ZXJzIGZvciBOTUkvSVJRL1RJTlQKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBIZW5jZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgInJlbmVzYXMscjlhMDdn
MDQzZi1pcnFjIiBpcyBhZGRlZCBmb3IgUlovRml2ZQo+ID4gPiA+ID4gU29DLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4KPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZW5lc2FzLHJ6ZzJs
LWlycWMueWFtbAo+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwtaXJxYy55YW1sCj4gPiA+ID4g
PiBAQCAtMTM0LDYgKzE0MSwxMiBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gICAgICAgIC0gY29u
c3Q6IHRpbnQzMAo+ID4gPiA+ID4gICAgICAgIC0gY29uc3Q6IHRpbnQzMQo+ID4gPiA+ID4gICAg
ICAgIC0gY29uc3Q6IGJ1cy1lcnIKPiA+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLXRp
ZTEKPiA+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLXRpZTIKPiA+ID4gPiA+ICsgICAg
ICAtIGNvbnN0OiBlY2NyYW0wLW92Zgo+ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEt
dGllMQo+ID4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEtdGllMgo+ID4gPiA+ID4gKyAg
ICAgIC0gY29uc3Q6IGVjY3JhbTEtb3ZmCj4gPiA+Cj4gPiA+IFdoeSBub3QgdXNlIHRoZSBuYW1p
bmcgZnJvbSB0aGUgZG9jcyAoYWxsIDYgaW5jbHVkZSAidGkiKT8KPiA+ID4gRUM3VElFMV8wLCBF
QzdUSUUyXzAsIEVDN1RJT1ZGXzAsIEVDN1RJRTFfMSwgRUM3VElFMl8xLCBFQzdUSU9WRl8xCj4g
PiA+ID0+IGVjN3RpZTEtMCwgZWM3dGllMi0wLCBlYzd0aW92Zi0wLCAuLi4/Cj4gPiA+Cj4gPiBB
Z3JlZWQuCj4gPgo+ID4gPiA+IEkgdGhpbmsgdGhlIHJlc3RyaWN0aW9ucyBhbHJlYWR5IGluIHRo
ZSBmaWxlIGJlY29tZSBpbmNvcnJlY3Qgd2l0aCB0aGlzCj4gPiA+ID4gcGF0Y2g6Cj4gPiA+ID4g
ICAtIGlmOgo+ID4gPiA+ICAgICAgIHByb3BlcnRpZXM6Cj4gPiA+ID4gICAgICAgICBjb21wYXRp
YmxlOgo+ID4gPiA+ICAgICAgICAgICBjb250YWluczoKPiA+ID4gPiAgICAgICAgICAgICBlbnVt
Ogo+ID4gPiA+ICAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtaXJxYwo+ID4gPiA+
ICAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA4ZzA0NS1pcnFjCj4gPiA+ID4gICAgIHRoZW46
Cj4gPiA+ID4gICAgICAgcHJvcGVydGllczoKPiA+ID4gPiAgICAgICAgIGludGVycnVwdHM6Cj4g
PiA+ID4gICAgICAgICAgIG1pbkl0ZW1zOiA0Mgo+ID4gPiA+ICAgICAgICAgaW50ZXJydXB0LW5h
bWVzOgo+ID4gPiA+ICAgICAgICAgICBtaW5JdGVtczogNDIKPiA+ID4gPiAgICAgICByZXF1aXJl
ZDoKPiA+ID4gPiAgICAgICAgIC0gaW50ZXJydXB0LW5hbWVzCj4gPiA+ID4KPiA+ID4gPiBUaGlz
IHVzZWQgdG8gcmVxdWlyZSBhbGwgNDIgaW50ZXJydXB0cyBmb3IgdGhlIHR3byBjb21wYXRpYmxl
cyBoZXJlCj4gPiA+ID4gYW5kIGF0IGxlYXN0IHRoZSBmaXJzdCA0MSBvdGhlcndpc2UuIE5vdyB5
b3UndmUgaW5jcmVhc2VkIHRoZSBudW1iZXIgb2YKPiA+ID4gPiBpbnRlcnJ1cHRzIHRvIDQ4IHRo
ZXJlYnkgcmVtb3ZpbmcgdGhlIHVwcGVyIGxpbWl0cyBvbiB0aGUgZXhpc3RpbmcKPiA+ID4gPiBk
ZXZpY2VzLgo+ID4gPgo+ID4gPiBJJ20gZ29ubmEgcmVwZWF0IChhbmQgZXh0ZW5kKSBteSBxdWVz
dGlvbiBmcm9tIFsxXTogSG93IGNvbWUgd2UgdGhvdWdodAo+ID4gPiBSWi9HMkwgYW5kIFJaL1Yy
TCBkbyBub3QgaGF2ZSB0aGUgYnVzIGVycm9yIGFuZCBFQ0NSQU0gaW50ZXJydXB0cz8KPiA+ID4K
PiA+IEhtbSBub3Qgc3VyZSBob3cgdGhpcyB3YXMgbWlzc2VkIGVhcmxpZXIuCj4gPgo+ID4gPiBM
b29rcyBsaWtlIG1vc3Qgb2YgdGhlIGNvbmRpdGlvbmFsIGhhbmRsaW5nIGNhbiBiZSByZW1vdmVk
IChzZWUgYmVsb3cpLgo+ID4gPgo+ID4gPiA+IEdpdmVuIHRoZSBjb21taXQgbWVzc2FnZSwgSSBm
aWd1cmUgdGhhdCBwcm92aWRpbmcgNDggaW50ZXJydXB0cyBmb3IKPiA+ID4gPiAoYXQgbGVhc3Qg
c29tZSBvZikgdGhvc2UgZGV2aWNlcyB3b3VsZCBiZSBpbmNvcnJlY3Q/Cj4gPiA+Cj4gPiA+IExv
b2tzIGxpa2UgYWxsIG9mIFJaL0cyTHssQ30sIFJaL1YyTCwgUlovRzJVTCwgYW5kIFJaL0ZpdmUg
c3VwcG9ydAo+ID4gPiBhbGwgNDggaW50ZXJydXB0cy4gIFJaL0czUyBsYWNrcyB0aGUgZmluYWwg
dGhyZWUgZm9yIEVDQ1JBTTEuCj4gPiA+Cj4gPiBBZ3JlZWQgZm9yIFJaL0cyTHssQ30sIFJaL1Yy
TCwgUlovRzJVTCwgYW5kIFJaL0ZpdmUsIGJ1dCBmb3IgUlovRzNTIGl0Cj4gPiBiZWNvbWVzIHRy
aWNreSB0aGUgaW50ZXJydXB0cyBmb3IgRUNDUkFNMC8xIGFyZSBjb21iaW5lZCBoZW5jZSB0aGV5
Cj4gPiBoYXZlIGp1c3QgMyBpbnRlcnJ1cHRzLiBIb3cgZG8geW91IHByb3Bvc2UgdGhlIGFib3Zl
IGludGVycnVwdCBuYW1pbmc/Cj4KPiBJIGd1ZXNzIGl0IGRvZXNuJ3QgaHVydCB0byBoYXZlIGFu
IGluZGV4IDAgb24gYSBwYXJ0IHRoYXQgaGFzIG9ubHkgYQo+IHNpbmdsZSBzZXQ/Cj4KTGV0J3Mg
Z28gd2l0aCB0aGlzIG9wdGlvbi4uLgoKPiBBbHRlcm5hdGl2ZXMgd291bGQgYmUgdG8KPiAgIDEu
IERyb3AgdGhlIGluZGV4IGNvbXBsZXRlbHkgb24gUlovRzNTLCBjb21wbGljYXRpbmcgYmluZGlu
Z3MgYW5kCj4gICAgICBkcml2ZXIsCj4gICAxLiBEcm9wIHRoZSBpbmRleCBmb3IgdGhlIGZpcnN0
IHNldCwgYW5kIHVzZSBpbmRleCAyIGZvciB0aGUgc2Vjb25kIHNldCwKPiAgICAgIGNhdXNpbmcg
dGhlIG5hbWVzIHRvIGRpZmZlciBldmVuIG1vcmUgb24gcGFydHMgd2l0aCAyIHNldHMuCj4KLi4u
aW5zdGVhZCBvZiBjb21wbGljYXRpbmcuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
