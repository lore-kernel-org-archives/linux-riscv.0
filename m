Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D33EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buNrBbUeEvpTYntesD/d7GwMZ/FI5Ynq5rG2OHiqmBo=; b=VHfhs97tZEGeS2
	DUQgv+dmhuOG2RMJV1dE/IP655eRvFkWGhHcuRU01Wt+QoWohl/3v/CpGqhMIv1QtWgpAKeJGNHS1
	oMGG+ZUYWClJjfxKhnmammJ703k6fjMhhXr+5giMDThx4IAHzYspA+ozOr2jS/tpYxYNwZkZYtVIY
	k6+j8yzokn6aBq2hFLK0KvLgKvZSznxX7mk1NIi+PESS827jJb90zl8TvqLCrJzFPHXwLiX19rMAr
	pcGMuQwRkqAIw2DdOedxLld+1nWFbNZXqJS7XU5ky78KnnYrKP0dqRtkFmYVEfQiZ1hHuXLM7GYrA
	lyPSOaCQHaVx8rV5eJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrek-00BqtX-2z;
	Mon, 10 Jul 2023 14:14:26 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrei-00Bqrz-1l
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 14:14:25 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-577412111f0so58825167b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688998462; x=1691590462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1SoVYt/eXkCUju2ZrXSBXhCNBA/PkoSDQudNUVgxBk=;
        b=h1oV1yyhUmgi9+RPim/kmFUfwMJrU2A63EDgvZAXweigl2CTHwcDUtVVgDjzgrnizj
         iIphHFFZrGd/YMCsEEhDLtvyXPOvBdtvqW1s8b/G+4eEum88AYwrMO+NgBJ+DDDlS8ee
         pdEjE1eqBmgo6zrZ1lBiLU1vHlWmEq1uWBIZ3KlgYBe8wWu3MfRJuHZCvDY/9cp5LgC5
         CqslVDpqGPrdB7on9Eil8NXZ97MNsIGVkG1noNqGVEIIbx3XQl6Rqa1yWUAwiMqBL5+r
         iyyPqrK19TykUNXASFTrN+dCLoE/Fx5Y+Rv19pCeYEnVLmch4kZbqf6OaJ0ZLVcYs22e
         je4Q==
X-Gm-Message-State: ABy/qLYk20tQuS+cjiVk7eOadIMcISBopD1tGq5oUJMemYw+qLNvih+c
	FFOwCGVcflwp5QARZder/seagqdT/FQHTQ==
X-Google-Smtp-Source: APBJJlGlI0Ch9WTBYtmr3Nq3VXxe6DWXG3Ke2VbDX2p7IJddb/n9P5wOdag0t8qUBwsVUHw1U/JClw==
X-Received: by 2002:a0d:f104:0:b0:577:3666:bb4e with SMTP id a4-20020a0df104000000b005773666bb4emr15676649ywf.36.1688998461941;
        Mon, 10 Jul 2023 07:14:21 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id q8-20020a815c08000000b00570589c5aedsm3088491ywb.7.2023.07.10.07.14.21
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 07:14:21 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-c2cf4e61bc6so5762390276.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:14:21 -0700 (PDT)
X-Received: by 2002:a25:68ca:0:b0:c85:a84:d87e with SMTP id
 d193-20020a2568ca000000b00c850a84d87emr2850225ybc.10.1688998461286; Mon, 10
 Jul 2023 07:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB592217C4028606B67B39C6858629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8sXcHP2AYYLLONLLBDVctMb=fnU=D4+6hNoHGx5Dk2O3Q@mail.gmail.com> <OS0PR01MB592285AB361A6C25CEDC21F68629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592285AB361A6C25CEDC21F68629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 16:14:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoDVMczVRt98GgimZviAHWy3c=P84+nrKOpxtaLVc4RQ@mail.gmail.com>
Message-ID: <CAMuHMdVoDVMczVRt98GgimZviAHWy3c=P84+nrKOpxtaLVc4RQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
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
X-CRM114-CacheID: sfid-20230710_071424_582452_EEE61153 
X-CRM114-Status: GOOD (  37.52  )
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

SGkgQmlqdSwKCk9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgNDoxM+KAr1BNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+ID4gRnJvbTogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29t
Pgo+ID4gU2VudDogTW9uZGF5LCBKdWx5IDMsIDIwMjMgMTo0MyBQTQo+ID4gVG86IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4KPiA+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFnbnVzIERhbW0KPiA+IDxtYWdudXMuZGFtbUBn
bWFpbC5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mCj4g
PiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IExpbnVzIFdh
bGxlaWoKPiA+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBsaW51eC1yZW5lc2FzLXNvY0B2
Z2VyLmtlcm5lbC5vcmc7Cj4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtCj4gPiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgUHJhYmhha2FyIE1haGFkZXYKPiA+IExhZCA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gU3ViamVjdDogUmU6
IFtSRkMgUEFUQ0ggMS80XSBwaW5jdHJsOiByZW5lc2FzOiByemcybDogSW5jbHVkZSBwaW5tYXAg
aW4KPiA+IFJaRzJMX0dQSU9fUE9SVF9QQUNLKCkgbWFjcm8KPiA+Cj4gPiBPbiBNb24sIEp1bCAz
LCAyMDIzIGF0IDEyOjQy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pgo+ID4gd3JvdGU6Cj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBG
cm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPgo+ID4gPiA+IFNlbnQ6
IEZyaWRheSwgSnVuZSAzMCwgMjAyMyAxOjA1IFBNCj4gPiA+ID4gVG86IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbQo+ID4gPiA+IDxtYWdu
dXMuZGFtbUBnbWFpbC5jb20+Cj4gPiA+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA+ID4gPGtyenlzenRvZi5rb3psb3dza2kr
ZHRAbGluYXJvLm9yZz47IExpbnVzIFdhbGxlaWoKPiA+ID4gPiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOwo+ID4gPiA+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0KPiA+ID4gPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIua2Vy
bmVsLm9yZzsgQmlqdSBEYXMKPiA+ID4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBQ
cmFiaGFrYXIKPiA+ID4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+OyBQcmFiaGFrYXIg
TWFoYWRldiBMYWQKPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4gPiA+IFN1YmplY3Q6IFtSRkMgUEFUQ0ggMS80XSBwaW5jdHJsOiByZW5lc2FzOiBy
emcybDogSW5jbHVkZSBwaW5tYXAgaW4KPiA+ID4gPiBSWkcyTF9HUElPX1BPUlRfUEFDSygpIG1h
Y3JvCj4gPiA+ID4KPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+ID4KPiA+ID4gPiBDdXJyZW50bHkgd2UgYXNz
dW1lIGFsbCB0aGUgcG9ydCBwaW5zIGFyZSBzZXF1ZW50aWFsIGllIGFsd2F5cyBQWF8wCj4gPiA+
ID4gdG8gUFhfbiAobj0xLi43KSBleGlzdCwgYnV0IG9uIFJaL0ZpdmUgU29DIHdlIGhhdmUgYWRk
aXRpb25hbCBwaW5zCj4gPiA+ID4gUDE5XzEgdG8KPiA+ID4gPiBQMjhfNSB3aGljaCBoYXZlIGhv
bGVzIGluIHRoZW0sIGZvciBleGFtcGxlIG9ubHkgb25lIHBpbiBvbiBwb3J0MTkKPiA+ID4gPiBp
cyBhdmFpbGFibGUgYW5kIHRoYXQgaXMgUDE5XzEgYW5kIG5vdCBQMTlfMC4KPiA+ID4gPgo+ID4g
PiA+IFNvIHRvIGhhbmRsZSBzdWNoIGNhc2VzIGluY2x1ZGUgcGlubWFwIGZvciBlYWNoIHBvcnQg
d2hpY2ggd291bGQKPiA+ID4gPiBpbmRpY2F0ZSB0aGUgcGluIGF2YWlsYWJpbGl0eSBvbiBlYWNo
IHBvcnQuIFdpdGggdGhpcyB3ZSBhbHNvIGdldAo+ID4gPiA+IGFkZGl0aW9uYWwgcGluIHZhbGlk
YXRpb24sIGZvciBleGFtcGxlIG9uIHRoZSBSWi9HMkwgU09DIFAwIGhhcyB0d28KPiA+ID4gPiBw
aW5zCj4gPiA+ID4gUDBfMSBhbmQgUDBfMCBidXQgd2l0aCBEVC9TWVNGUyBjb3VsZCB1c2UgdGhl
IFAwXzItUDBfNy4KPiA+ID4gPgo+ID4gPiA+IFdoaWxlIGF0IGl0LCB1cGRhdGUgcnpnMmxfdmFs
aWRhdGVfZ3Bpb19waW4oKSB0byB1c2UgdGhlIHBvcnQgcGlubWFwCj4gPiA+ID4gdG8gdmFsaWRh
dGUgdGhlIGdwaW8gcGluLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJo
YWthcgo+ID4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
YyB8IDE2Nwo+ID4gPiA+ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4g
PiA+ID4gYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ID4gPiBp
bmRleCA5NTExZDkyMDU2NWUuLmEwYzJlNTg1ZTc2NSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ID4gPiBAQCAtNjcsMTAgKzY3LDEy
IEBACj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUElOX0NG
R19GSUxDTEtTRUwpCj4gPiA+ID4KPiA+ID4gPiAgLyoKPiA+ID4gPiAtICogbiBpbmRpY2F0ZXMg
bnVtYmVyIG9mIHBpbnMgaW4gdGhlIHBvcnQsIGEgaXMgdGhlIHJlZ2lzdGVyIGluZGV4Cj4gPiA+
ID4gLSAqIGFuZCBmIGlzIHBpbiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQu
Cj4gPiA+ID4gKyAqIG0gaW5kaWNhdGVzIHRoZSBiaXRtYXAgb2Ygc3VwcG9ydGVkIHBpbnMsIG4g
aW5kaWNhdGVzIG51bWJlcgo+ID4gPiA+ICsgKiBvZiBwaW5zIGluIHRoZSBwb3J0LCBhIGlzIHRo
ZSByZWdpc3RlciBpbmRleCBhbmQgZiBpcyBwaW4KPiA+ID4gPiArICogY29uZmlndXJhdGlvbiBj
YXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ID4gPiA+ICAgKi8KPiA+ID4gPiAtI2RlZmluZSBSWkcy
TF9HUElPX1BPUlRfUEFDSyhuLCBhLCBmKSAgICAgICAgKCgobikgPDwgMjgpIHwgKChhKSA8PAo+
ID4gMjApIHwKPiA+ID4gPiAoZikpCj4gPiA+ID4gKyNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BB
Q0sobSwgbiwgYSwgZikgICAgICgoVUwobSkgPDwgMzIpIHwKPiA+IChVTChuKSA8PCAyOCkKPiA+
ID4gPiB8ICgoYSkgPDwgMjApIHwgKGYpKQo+ID4gPgo+ID4gPiBJIGd1ZXNzLCB5b3UgY2FuIHN0
aWxsIGFjaGlldmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikgd2l0aAo+ID4gPiAoKFVM
KFBJTk1BUChuKSkgPDwgMzIpIHwgKFVMKG4pIDw8IDI4KSB8ICgoYSkgPDwgMjApIHwgKGYpKQo+
ID4gPgo+ID4gPiAjZGVmaW5lIFBJTk1BUChuKSBHRU5NQVNLKG4sMCkgPz8gVGhlbiB5b3UgZG9u
J3QgbmVlZCB0byBtb2RpZnkKPiA+IHJ6ZzJsX2dwaW9fY29uZmlncy4KPiA+ID4KPiA+IEdvb2Qg
cG9pbnQsIGJ1dCB0aGlzIHdvdWxkIHdvcmsgaWYgcG9ydCBwaW5zIGRpZG4ndCBoYXZlIGFueSBo
b2xlcy4KPiA+IEZvciBleGFtcGxlIG9uIFJaL0ZpdmUgcG9ydCBQMTkgd2UgaGF2ZSBQMTlfMSBw
aW4gb25seSBhbmQgUDE5XzAgaXMgbm90Cj4gPiBhdmFpbGFibGUgKGFuZCBzaW1pbGFybHkgZm9y
IHBvcnQgUDI1IHdlIGhhdmUgUDI1XzEpLgo+Cj4gTWF5YmUgaW50cm9kdWNlIGEgaGVscGVyIG1h
Y3JvIHRvIGFkZHJlc3MgdGhpcyBjYXNlLgo+Cj4gI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfUEFD
S19XSVRIX0hPTEVTKG0sIG4sIGEsIGYpIGZvciB0aGVzZSAyIGNhc2VzCgoic3BhcnNlIiBpcyB0
aGUgdGVyc2UgdGVybS4KCiNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0tfU1BBUlNFKG0sIGEs
IGYpCmFzICJuIiBjYW4gYmUgZGVyaXZlZCBmcm9tICJtIgoKPiBhbmQgdXNlIFJaRzJMX0dQSU9f
UE9SVF9QQUNLKG4sIGEsIGYpIGZvciB0aGUgb25lIHdpdGhvdXQgaG9sZXMuCgpFeGFjdGx5LgoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
