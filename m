Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D8EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCSQTzpw45HsOTZPAj/hdNpv/GnSzD0zBtNNB/5iA20=; b=xZ0tWA8KnKBJyo
	DtwIVdMmrp9lZmrW5KGksyfxF+sob0fXlCBtK1EQJLuW8l0LknZutDhYVDEF46tHEc/laPp9tcavC
	LKsvRSvEPzZ3C46pUBoJ0qQ1IfTELnHsC1cMdRpe2yv7hla3tOjqaXk00f7Q4vrkFo6GgrG5fnwv+
	ZeOMvemzkRiT3UA/OdIiFB9WAw7em0545TwuGVqMAvd3ku1ZbJTei26IorrlDE8UPMTQkWf43tl5s
	EfJdJXasGg0LfZIcOz5aNYXbtMklPm92RkEXeHL8yYRhxVQefyg+bCl7nzLDc9pZb5DSk8dcztyt4
	YEdwUIvTM4KDjkodwavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbhl-00CcDL-1U;
	Tue, 04 Jul 2023 08:48:13 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbhj-00CcCk-0X
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 08:48:12 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-77a62a84855so214199039f.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688460489; x=1691052489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FthdFNqIrNBSp4Ff+7I5wf7NZtageiCvQNjA6zok5uo=;
        b=FWmDAOGksUr/QGz4CDArxktNgIPvc38M0/lTa2VYxzTVeVXDKhc0qoUYZD0sOXLih9
         j6RAkMSJEozSwhuSUUcBY81gGKJ8sobh71Guq2n/+i7QmSzIAf1Z83n747otQ4Rjj/kz
         2abUbgxbKbr3lra+9jHftNgHXBX7YBPK3dbY7bkTrj4QwJt1EpllB8rHiDAsrrVKsSNn
         uOGMFcoxSYxPV6fzWJ457wh3zqEXEYfCXheAyQCCWLIH/ShD4N/SdmUVJjxL+359KNfF
         VhkR0XPPey0Gp5aUvWqes8X9AwQy++ZJsuctYxSjkmNZLErWsCdv0Co/HAyqvW0sXoTi
         6YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688460489; x=1691052489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FthdFNqIrNBSp4Ff+7I5wf7NZtageiCvQNjA6zok5uo=;
        b=OuiX5AemnGiUUgA9oNeP59rM9S9NfloiTsshV9WD4kZSycbd5EU5C5eriGrK3fOK9f
         xGCGs1TclOaTx/PvF5U8YXB7uZHUadGJsbww/TVGPzm4rUT3gH0EiGMSNy9ncERjPixe
         FDz6YWTyPX3chbkI9NolXeJ+dSVvGx8SDU5C37IdLPpQ3ebp+IH2H50vrNGXv1KQtFBk
         sCwf4mo5srAFRIHFExMZRhj1ml8VItXViXZi3br/76ESXaEjg2t562IxxMmOntUJbpiV
         q9N6QMtqslMr0lXmhAM3oKBIKQscaXpMlSFzjqaQdhHSBN4izUBmOsys4m5jaRfD7nrk
         Eelg==
X-Gm-Message-State: AC+VfDx/ByFcldsoMz9zDYu7o5oIuwjcOUP7VPoDVZdn7Rv0HxCBae5G
	MY0Pe/6BNTHIf+5goRrrREBFRuhLvil/VuSwTYU=
X-Google-Smtp-Source: ACHHUZ6jPnIKynBJ0oBa8Pc4sTNHuq++xhfssqh0qa7MHJnSLGSiG5AVhvinJsEW9ITj1tJfYUv+P6Ll5u31M9KK3a8=
X-Received: by 2002:a5e:8b03:0:b0:76c:56fb:3c59 with SMTP id
 g3-20020a5e8b03000000b0076c56fb3c59mr13828031iok.10.1688460489189; Tue, 04
 Jul 2023 01:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB59223E030DAE587A49C9D0FE862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8um0xQ2FJyrHs=5Pc2PNvgW6B6z31zyFQ6zAYhi6=zgvQ@mail.gmail.com> <OS0PR01MB5922BFC7C34062876E53BBB7862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922BFC7C34062876E53BBB7862EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Jul 2023 09:47:43 +0100
Message-ID: <CA+V-a8t3PveWo==GQNPWV3cTAQebtsgKwrFvc5qJVc_RsBKcGA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_014811_207496_E0352276 
X-CRM114-Status: GOOD (  37.74  )
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

T24gVHVlLCBKdWwgNCwgMjAyMyBhdCA5OjQy4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbT4KPiA+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgNCwgMjAyMyA5OjM2IEFNCj4gPiBU
bzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+ID4gQ2M6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbQo+ID4gPG1h
Z251cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBL
cnp5c3p0b2YKPiA+IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
PjsgTGludXMgV2FsbGVpago+ID4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IGxpbnV4LXJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsKPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPiA+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBQcmFiaGFrYXIgTWFoYWRl
dgo+ID4gTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiBT
dWJqZWN0OiBSZTogW1JGQyBQQVRDSCAxLzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbmNs
dWRlIHBpbm1hcCBpbgo+ID4gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNybwo+ID4KPiA+IEhp
IEJpanUsCj4gPgo+ID4gT24gVHVlLCBKdWwgNCwgMjAyMyBhdCA5OjMw4oCvQU0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+ID4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFBy
YWJoYWthciwKPiA+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+
IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+Cj4gPiA+ID4gU2Vu
dDogRnJpZGF5LCBKdW5lIDMwLCAyMDIzIDE6MDUgUE0KPiA+ID4gPiBUbzogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tCj4gPiA+ID4gPG1h
Z251cy5kYW1tQGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4gPiA8a3J6eXN6dG9mLmtvemxvd3Nr
aStkdEBsaW5hcm8ub3JnPjsgTGludXMgV2FsbGVpago+ID4gPiA+IDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7Cj4gPiA+ID4gZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LQo+ID4gPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWdwaW9Admdlci5r
ZXJuZWwub3JnOyBCaWp1IERhcwo+ID4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47
IFByYWJoYWthcgo+ID4gPiA+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT47IFByYWJoYWth
ciBNYWhhZGV2IExhZAo+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+Cj4gPiA+ID4gU3ViamVjdDogW1JGQyBQQVRDSCAxLzRdIHBpbmN0cmw6IHJlbmVzYXM6
IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbgo+ID4gPiA+IFJaRzJMX0dQSU9fUE9SVF9QQUNLKCkg
bWFjcm8KPiA+ID4gPgo+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEN1cnJlbnRseSB3ZSBh
c3N1bWUgYWxsIHRoZSBwb3J0IHBpbnMgYXJlIHNlcXVlbnRpYWwgaWUgYWx3YXlzIFBYXzAKPiA+
ID4gPiB0byBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mgd2UgaGF2ZSBh
ZGRpdGlvbmFsIHBpbnMKPiA+ID4gPiBQMTlfMSB0bwo+ID4gPiA+IFAyOF81IHdoaWNoIGhhdmUg
aG9sZXMgaW4gdGhlbSwgZm9yIGV4YW1wbGUgb25seSBvbmUgcGluIG9uIHBvcnQxOQo+ID4gPiA+
IGlzIGF2YWlsYWJsZSBhbmQgdGhhdCBpcyBQMTlfMSBhbmQgbm90IFAxOV8wLgo+ID4gPiA+Cj4g
PiA+ID4gU28gdG8gaGFuZGxlIHN1Y2ggY2FzZXMgaW5jbHVkZSBwaW5tYXAgZm9yIGVhY2ggcG9y
dCB3aGljaCB3b3VsZAo+ID4gPiA+IGluZGljYXRlIHRoZSBwaW4gYXZhaWxhYmlsaXR5IG9uIGVh
Y2ggcG9ydC4gV2l0aCB0aGlzIHdlIGFsc28gZ2V0Cj4gPiA+ID4gYWRkaXRpb25hbCBwaW4gdmFs
aWRhdGlvbiwgZm9yIGV4YW1wbGUgb24gdGhlIFJaL0cyTCBTT0MgUDAgaGFzIHR3bwo+ID4gPiA+
IHBpbnMKPiA+ID4gPiBQMF8xIGFuZCBQMF8wIGJ1dCB3aXRoIERUL1NZU0ZTIGNvdWxkIHVzZSB0
aGUgUDBfMi1QMF83Lgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUgYXQgaXQsIHVwZGF0ZSByemcybF92
YWxpZGF0ZV9ncGlvX3BpbigpIHRvIHVzZSB0aGUgcG9ydCBwaW5tYXAKPiA+ID4gPiB0byB2YWxp
ZGF0ZSB0aGUgZ3BpbyBwaW4uCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJh
Ymhha2FyCj4gPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
PiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcy
bC5jIHwgMTY3Cj4gPiA+ID4gKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMK
PiA+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gPiA+
IGluZGV4IDk1MTFkOTIwNTY1ZS4uYTBjMmU1ODVlNzY1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gPiA+IEBAIC02NywxMCArNjcs
MTIgQEAKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQSU5f
Q0ZHX0ZJTENMS1NFTCkKPiA+ID4gPgo+ID4gPiA+ICAvKgo+ID4gPiA+IC0gKiBuIGluZGljYXRl
cyBudW1iZXIgb2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0aGUgcmVnaXN0ZXIgaW5kZXgKPiA+
ID4gPiAtICogYW5kIGYgaXMgcGluIGNvbmZpZ3VyYXRpb24gY2FwYWJpbGl0aWVzIHN1cHBvcnRl
ZC4KPiA+ID4gPiArICogbSBpbmRpY2F0ZXMgdGhlIGJpdG1hcCBvZiBzdXBwb3J0ZWQgcGlucywg
biBpbmRpY2F0ZXMgbnVtYmVyCj4gPiA+ID4gKyAqIG9mIHBpbnMgaW4gdGhlIHBvcnQsIGEgaXMg
dGhlIHJlZ2lzdGVyIGluZGV4IGFuZCBmIGlzIHBpbgo+ID4gPiA+ICsgKiBjb25maWd1cmF0aW9u
IGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiA+ID4gICAqLwo+ID4gPiA+IC0jZGVmaW5lIFJa
RzJMX0dQSU9fUE9SVF9QQUNLKAo+Cj4gLCBhLCBmKSAgICAgICAgKCgobikgPDwgMjgpIHwgKChh
KSA8PAo+ID4gMjApIHwKPiA+ID4gPiAoZikpCj4gPiA+ID4gKyNkZWZpbmUgUlpHMkxfR1BJT19Q
T1JUX1BBQ0sobSwgbiwgYSwgZikgICAgICgoVUwobSkgPDwgMzIpIHwKPiA+IChVTChuKSA8PCAy
OCkKPiA+ID4gPiB8ICgoYSkgPDwgMjApIHwgKGYpKQo+ID4gPiA+ICsjZGVmaW5lIFJaRzJMX0dQ
SU9fUE9SVF9HRVRfUElOTUFQKHgpICAgICAgICAoKCh4KSAmIEdFTk1BU0soMzksCj4gPiAzMikp
ID4+IDMyKQo+ID4gPiA+ICAjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9HRVRfUElOQ05UKHgpICAg
ICAgICAoKCh4KSAmIEdFTk1BU0soMzAsCj4gPiAyOCkpID4+IDI4KQo+ID4gPiA+ICAjZGVmaW5l
IFJaRzJMX0dQSU9fUE9SVF9HRVRfSU5ERVgoeCkgKCgoeCkgJiBHRU5NQVNLKDI2LCAyMCkpID4+
Cj4gPiA+ID4gMjApICAjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9HRVRfQ0ZHUyh4KSAgKCh4KSAm
IEdFTk1BU0soMTksIDApKSBAQAo+ID4gPiA+IC0xMjksNyArMTMxLDcgQEAgc3RydWN0IHJ6ZzJs
X2RlZGljYXRlZF9jb25maWdzIHsKPiA+ID4gPgo+ID4gPiA+ICBzdHJ1Y3QgcnpnMmxfcGluY3Ry
bF9kYXRhIHsKPiA+ID4gPiAgICAgICBjb25zdCBjaGFyICogY29uc3QgKnBvcnRfcGluczsKPiA+
ID4gPiAtICAgICBjb25zdCB1MzIgKnBvcnRfcGluX2NvbmZpZ3M7Cj4gPiA+ID4gKyAgICAgY29u
c3QgdTY0ICpwb3J0X3Bpbl9jb25maWdzOwo+ID4gPgo+ID4gPiBDYW4gdGhpcyBiZSBTb0Mgc3Bl
Y2lmaWM/IE9ubHkgZm9yIFJaL0ZpdmUgeW91IG5lZWQgdGhpcyBjaGFuZ2VzLgo+ID4gPiBPdGhl
cnMgU29DcyBsaWtlIFJaL3tHMkwsRzJMQyxWMkwgYW5kIEcyVUwpIHN0aWxsIHdvcmsgd2l0aCB1
MzIqIGFzCj4gPiA+IHRoZXJlIGlzIG5vIGhvbGVzLiBXaXRoIHRoaXMgY2hhbmdlIG1lbW9yeSB1
c2FnZSBpcyBkb3VibGVkIGFzIHdlCj4gPiA+IGNoYW5nZSBmcm9tCj4gPiA+IHUzMi0+dTY0Lgo+
ID4gPgo+ID4gVGhpcyBpcyB0byBhdm9pZCB3cml0aW5nIHRvIHVuZG9jdW1lbnRlZCByZWdpc3Rl
cnMgc28gSSBoYXZlIGFkZGVkIGZvcgo+ID4gYWxsIHRoZSBTb0NzLiBGb3IgZXhhbXBsZSBvbiB0
aGUgUlovRzJMIFNPQyBQMCBoYXMgdHdvIHBpbnMgUDBfMSBhbmQKPiA+IFAwXzAgYnV0IERUL1NZ
U0ZTIGNvdWxkIHVzZSB0aGUgUDBfMi1QMF83LiBUaGlzIHBhdGNoIHJlc3RyaWN0cyB1c2VycyB0
bwo+ID4gdXNlIG9ubHkgYXZhaWxhYmxlIEdQSU8gcGlucy4KPgo+IEkgZ3Vlc3MgdGhhdCBzdGls
bCBjYW4gYmUgYWNoaWV2ZWQsIGFzIHRoZSBiZWxvdyBtYWNybyBoYXMgdmFsaWQKPiBwaW5zIGlu
Zm8/Pwo+Cj4gI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSAgICgoKHgpICYg
R0VOTUFTSygzMCwgMjgpKSA+PiAyOCkKPgo+IGlmICghKEJJVChiaXQpICYgR0VOTUFTSyhSWkcy
TF9HUElPX1BPUlRfR0VUX1BJTkNOVCh4KSwgMCkpCj4gcmV0dXJuIC1FSU5WQUw7Cj4KQWdyZWVk
LCBJZiBHZWVydCBpcyBPSyB0byBoYXZlIFNvQyBzcGVjaWZpYyBjaGVja3MgYXJvdW5kIEknbGwg
ZG8gdGhlIGFib3ZlLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
