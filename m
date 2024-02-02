Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82DBC4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1McW56ZRz0KqqNOZWKRboEUvPh7MYByI9g4CXHY3Os=; b=C5+gBmUsDtlSLr
	qDxgv9xQz/k+opTcVK/boIE6xvE6VTScyZF1X0u5bELUIRHkCyCMug7zsSI9jl5n796MAzU7MLSnN
	ZIFBWLyMQWEV59sxdOS1BDzDTDkAKCj5DIliMCnj6uVWjrD0VjRzvvYA45uyfoVwk+8AoKTaLdaD/
	AOg1GroDZBxxyZa7uipdfbNzPaIxn811zGWIDiqJ1EWpOE0Umud0ybKW0u/6+r43/Wj1oEwdqRKWR
	FaCJgDhpmK29yYc5Bg4fthV8UbHp99r9tndL6rth4fa7i8xCd2Y+c9GNmFWHrOBxcRtPsgv6cg8zh
	YQLgYB/S2zU+a36ekbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpl2-0000000AvtV-0r9R;
	Fri, 02 Feb 2024 09:22:48 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpkz-0000000Avqp-24dI
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 09:22:47 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4c01170654fso61322e0c.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706865763; x=1707470563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTowy/uYen+bsPWi2mCFz7Xlk53z/GMzvNwuHivQ8rg=;
        b=ZE/Mv/RAx/FoBCZ8sb2CoGRh69mMlHJsuUbSzeHqdbYwFGRUJkbnCBnTEndv0d32T0
         NFhyt4Dmi5n3o1NtDwiixoi818rXReMPQrURefTxIG5s8yd3tzOWo5Wp3GUMgWX32Ps9
         3cAteu5h1b8iW8tkyC+HM3SakwRNhsbvN2Udt+7KFAmNYWirQgzUjyabsg58kyNhMo/P
         t5laEnFfTwRjqP1Advfy4RtpVf9waO8NUG/mkta3tTb9yJROCJa5SQVMFNuBPc4lO29J
         CyIo/RNPMz+AQ8UfByxwGDa+KEXvKfVh88lqUk3kHGwTkUGbFZYj9mxV9r+oKZLnQ8oT
         vemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706865763; x=1707470563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTowy/uYen+bsPWi2mCFz7Xlk53z/GMzvNwuHivQ8rg=;
        b=HOANEDzulvCqd10/CZ78dWAcWTQ46sH27FGXjY+b7vcKd33BUvI0rufR3XOC5LDKwe
         K45PtgvKdSrS7BnFxWfP55UG4GPTo4MXADDgYEsAshjT+2sxtWLKN8ErHJEfvwEnq80f
         3HqkhvVAjubl3osicj3mMEpXYjBksqh0Y3i6S4eHj/ydG4LVnxIilbkYI5oZqZlV+Eq7
         YmeMA0btrgQjOdRIAYt9wkvfEVIFtFWlQKr5tVJkBGbPB5aITP3ej5TyO75pHKtWAZZA
         9x2l+Qeb8NOmvZsNIirCnqj9rqXuTMEUD03wRS203zh0iIY6SpOQYjSJp9LJvwXwcn2U
         KK9Q==
X-Gm-Message-State: AOJu0YwvKe08ZXl1XTLdl5YfzIK9jup+DdRrGgUF+gS3enfMHC+V5nd7
	gtR5pv3iubpOtdcA3aSBVaRdx7gsyUB9E1SiUcmELzOIAJ4oKe2mXQ0plbB7DnO3SfYXQDd5ygY
	339wCyl+dWGKQAcUAbeKA1DR0sYI=
X-Google-Smtp-Source: AGHT+IGJy4900r9IV66NBG3FMIrVGWh/BXiOJfbjfVz+Rjqi+YFKJ7X+ayy4EkCTsjxxktkPNaYZZiUrMvEslj1kFmw=
X-Received: by 2002:a05:6122:720:b0:4c0:d8c:66d7 with SMTP id
 32-20020a056122072000b004c00d8c66d7mr1064101vki.4.1706865762938; Fri, 02 Feb
 2024 01:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129-magical-unclaimed-e725e2491ccb@spud>
In-Reply-To: <20240129-magical-unclaimed-e725e2491ccb@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 Feb 2024 09:22:06 +0000
Message-ID: <CA+V-a8vQdT+Rav9SNUTE7iFP2xWh+dJ=ZnQRhBpXaQDHOfVEdQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_012245_567365_D1B1D1CB 
X-CRM114-Status: GOOD (  21.21  )
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

SGkgQ29ub3IsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBNb24sIEphbiAyOSwgMjAy
NCBhdCA1OjMw4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+
IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDAzOjE2OjE0UE0gKzAwMDAsIFByYWJoYWthciB3cm90
ZToKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiA+Cj4gPiBEb2N1bWVudCBSWi9GaXZlIChSOUEwN0cwNDNGKSBJUlFDIGJp
bmRpbmdzLiBUaGUgSVJRQyBibG9jayBvbiBSWi9GaXZlIFNvQwo+ID4gaXMgYWxtb3N0IGlkZW50
aWNhbCB0byBvbmUgZm91bmQgb24gdGhlIFJaL0cyTCBTb0Mgd2l0aCBiZWxvdyBkaWZmZXJlbmNl
cywKPiA+ICogQWRkaXRpb25hbCBCVVMgZXJyb3IgaW50ZXJydXB0Cj4gPiAqIEFkZGl0aW9uYWwg
RUNDUkFNIGVycm9yIGludGVycnVwdAo+ID4gKiBIYXMgYWRkaXRpb25hbCBtYXNrIGNvbnRyb2wg
cmVnaXN0ZXJzIGZvciBOTUkvSVJRL1RJTlQKPiA+Cj4gPiBIZW5jZSBuZXcgY29tcGF0aWJsZSBz
dHJpbmcgInJlbmVzYXMscjlhMDdnMDQzZi1pcnFjIiBpcyBhZGRlZCBmb3IgUlovRml2ZQo+ID4g
U29DLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9yZW5lc2FzLHJ6ZzJs
LWlycWMueWFtbCAgICAgICAgICAgICAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmVu
ZXNhcyxyemcybC1pcnFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvcmVuZXNhcyxyemcybC1pcnFjLnlhbWwKPiA+IGluZGV4IGQz
YjVhZWMwYTNmNy4uM2FiYzAxZTQ4OTM0IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3JlbmVzYXMscnpnMmwtaXJx
Yy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvcmVuZXNhcyxyemcybC1pcnFjLnlhbWwKPiA+IEBAIC0yMyw2ICsyMyw3
IEBAIHByb3BlcnRpZXM6Cj4gPiAgICBjb21wYXRpYmxlOgo+ID4gICAgICBpdGVtczoKPiA+ICAg
ICAgICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDNmLWlycWMgICAj
IFJaL0ZpdmUKPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtaXJxYyAgICMgUlov
RzJVTAo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LWlycWMgICAgIyBSWi9HMntM
LExDfQo+ID4gICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0LWlycWMgICAgIyBSWi9WMkwK
PiA+IEBAIC04OCw2ICs4OSwxMiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIC0gZGVzY3JpcHRp
b246IEdQSU8gaW50ZXJydXB0LCBUSU5UMzAKPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBHUElP
IGludGVycnVwdCwgVElOVDMxCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogQnVzIGVycm9yIGlu
dGVycnVwdAo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTAgVElFMSBpbnRlcnJ1cHQK
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0wIFRJRTIgaW50ZXJydXB0Cj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogRUNDUkFNMCBvdmVyZmxvdyBpbnRlcnJ1cHQKPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBFQ0NSQU0xIFRJRTEgaW50ZXJydXB0Cj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogRUNDUkFNMSBUSUUyIGludGVycnVwdAo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVD
Q1JBTTEgb3ZlcmZsb3cgaW50ZXJydXB0Cj4gPgo+ID4gICAgaW50ZXJydXB0LW5hbWVzOgo+ID4g
ICAgICBtaW5JdGVtczogNDEKPiA+IEBAIC0xMzQsNiArMTQxLDEyIEBAIHByb3BlcnRpZXM6Cj4g
PiAgICAgICAgLSBjb25zdDogdGludDMwCj4gPiAgICAgICAgLSBjb25zdDogdGludDMxCj4gPiAg
ICAgICAgLSBjb25zdDogYnVzLWVycgo+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTAtdGllMQo+
ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTAtdGllMgo+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3Jh
bTAtb3ZmCj4gPiArICAgICAgLSBjb25zdDogZWNjcmFtMS10aWUxCj4gPiArICAgICAgLSBjb25z
dDogZWNjcmFtMS10aWUyCj4gPiArICAgICAgLSBjb25zdDogZWNjcmFtMS1vdmYKPgo+IEkgdGhp
bmsgdGhlIHJlc3RyaWN0aW9ucyBhbHJlYWR5IGluIHRoZSBmaWxlIGJlY29tZSBpbmNvcnJlY3Qg
d2l0aCB0aGlzCj4gcGF0Y2g6Cj4gICAtIGlmOgo+ICAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAg
ICBjb21wYXRpYmxlOgo+ICAgICAgICAgICBjb250YWluczoKPiAgICAgICAgICAgICBlbnVtOgo+
ICAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtaXJxYwo+ICAgICAgICAgICAgICAg
LSByZW5lc2FzLHI5YTA4ZzA0NS1pcnFjCj4gICAgIHRoZW46Cj4gICAgICAgcHJvcGVydGllczoK
PiAgICAgICAgIGludGVycnVwdHM6Cj4gICAgICAgICAgIG1pbkl0ZW1zOiA0Mgo+ICAgICAgICAg
aW50ZXJydXB0LW5hbWVzOgo+ICAgICAgICAgICBtaW5JdGVtczogNDIKPiAgICAgICByZXF1aXJl
ZDoKPiAgICAgICAgIC0gaW50ZXJydXB0LW5hbWVzCj4KPiBUaGlzIHVzZWQgdG8gcmVxdWlyZSBh
bGwgNDIgaW50ZXJydXB0cyBmb3IgdGhlIHR3byBjb21wYXRpYmxlcyBoZXJlCj4gYW5kIGF0IGxl
YXN0IHRoZSBmaXJzdCA0MSBvdGhlcndpc2UuIE5vdyB5b3UndmUgaW5jcmVhc2VkIHRoZSBudW1i
ZXIgb2YKPiBpbnRlcnJ1cHRzIHRvIDQ4IHRoZXJlYnkgcmVtb3ZpbmcgdGhlIHVwcGVyIGxpbWl0
cyBvbiB0aGUgZXhpc3RpbmcKPiBkZXZpY2VzLgo+Cj4gR2l2ZW4gdGhlIGNvbW1pdCBtZXNzYWdl
LCBJIGZpZ3VyZSB0aGF0IHByb3ZpZGluZyA0OCBpbnRlcnJ1cHRzIGZvcgo+IChhdCBsZWFzdCBz
b21lIG9mKSB0aG9zZSBkZXZpY2VzIHdvdWxkIGJlIGluY29ycmVjdD8KPgpBZ3JlZWQsIEkgd2ls
bCBmaXggdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
