Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBEBC4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lZ5vOyPvqTf09Kc90/4p2aGmkUKTfbf9eka3Eyd/ZM=; b=hDcegnynUgpxJN
	dfF2KlAMhdAyS4kSiidj2bgO1YkxHty8dku4psBAynOMruyvyTQbA5qum+4DqwADrjD74CMbvLZPC
	VAJybKHZ50nX+nIX2hG2+YvzxvPZNnBfN9zjrBN+9KP/GF5CGtHJPGpJuQgb4Hdtg6AqvZimCfKoi
	hu4r9N2HTkR2Y/BA2LEnNfwTUBoLjlS1iywMoVp2TaUcCOwlCIUVCRI0/Yzn6hlug0jmTFV/PyoJ+
	RX4pPCTBkL3f1t46pH5EYfF3yTmpfnYiJyb3Yo4dozxhAaDsrJDumjus1HMBC1LD/rEKhoan3GoXr
	L2tq/3jV8Ldfw/9dJw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL7l-003RSc-2I;
	Fri, 12 Jan 2024 17:15:17 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL7j-003RSH-0k
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 17:15:16 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4b978e5e240so91010e0c.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 09:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705079713; x=1705684513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkseUqPo8OXQ3YOG2VTgeQHbmBTlfvlda5FttZ/w2HE=;
        b=S1In3ukAZxzc6HZycMIwL2bk0mFb3xFZXRhh4nd17M+XG98ZycWz3UjMt9JsBupZAd
         NxgUWOd2b4kUEsUXZ/O/awgT2VBJz/WfyqXhNmHJ/qtnuNsCIHg7MuLRX2ECN0YSmNuJ
         GS9Sia244SDP+cXPK6mo30J0iohX6gvqKgyCIJIWtc7xnXKYWRgPAfjqOPI+MBcDj343
         V/rZDdV57LreCxqAtNL6huFaT+eP9Ux781qPuA/+aS0jkpa61XyZ8DLGpyVUx361XY6h
         M5z8r2NS8S1Z+b8sd4Yr+HcsO3Y/f8+EnC03yHiSuD3P59arwyLK0MNYB5LHUZBwuDoy
         cUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705079713; x=1705684513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkseUqPo8OXQ3YOG2VTgeQHbmBTlfvlda5FttZ/w2HE=;
        b=JxNKhxRpiA+VvQkBDimv+u6vPzPuuZn6EOo6O9LXu2995rLRwjFfF6O2oDCTLzXwft
         J79akETETCznGlmxMFUEuqNPhwogi+OA8v1AmiKF/Z+cennAOFEyDqkOpns/eck1B6jK
         xH2e4XoYlbvSUI5gsHkGD4tWldtRy8TzUT06S6m/EHf5Nj084xvLtxbZgVFUPDoh2iS3
         B44wg3EwHSIrEvZkgBiw8ghzs+gyuqaSuJjNDMDhAWUdPtbvZRfK6BOz+w+Bbb/ETP94
         ONlLwdJzHhjnYeq45WifSeOLMzepKWzZdwBiw0zo05617VMVbxVoj4jr56hka7CFDZ7J
         PB2g==
X-Gm-Message-State: AOJu0YznZMBnQGDz4hSlTG8B080qkzqNnW9d0GWwzk6S3QzW5caqEWTV
	mpOWcXUpn3V/IDhHP7MdYfKVWkwn5bA/Dr5xAPU=
X-Google-Smtp-Source: AGHT+IEtyS+zRiryoiEol1GpjC1w298O0gfObrmREKMAHHDiKjWPg5utyGaAszkNnTgUD0jUCqxwBLwFcY9rn2/AIc0=
X-Received: by 2002:a05:6122:400f:b0:4b6:e339:31b3 with SMTP id
 ca15-20020a056122400f00b004b6e33931b3mr1348367vkb.27.1705079712913; Fri, 12
 Jan 2024 09:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240112142621.13525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB112699FAB53E6E4647893516B866F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CA+V-a8smkiub9ACDsqxv0z8yF_iLVEXG2OHwS7iJ+tmsdmTQ6g@mail.gmail.com> <TYCPR01MB11269F75A63DB020297DF21DA866F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269F75A63DB020297DF21DA866F2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jan 2024 17:14:46 +0000
Message-ID: <CA+V-a8tsxoaLfxCHmViyewYVbtZMkDAkYjUUYAoH_2MDi2ugBw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing
 port pins P19 to P28
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_091515_292254_02D32E8C 
X-CRM114-Status: GOOD (  15.66  )
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

T24gRnJpLCBKYW4gMTIsIDIwMjQgYXQgNToxMOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+ID4gRnJvbTogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPgo+
ID4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDEyLCAyMDI0IDU6MDYgUE0KPiA+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMy80XSBwaW5jdHJsOiByZW5lc2FzOiBwaW5jdHJsLXJ6ZzJsOiBBZGQgdGhl
Cj4gPiBtaXNzaW5nIHBvcnQgcGlucyBQMTkgdG8gUDI4Cj4gPgo+ID4gSGkgQmlqdSwKPiA+Cj4g
PiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gPgo+ID4gT24gRnJpLCBKYW4gMTIsIDIwMjQg
YXQgMjozMeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4KPiA+IHdy
b3RlOgo+ID4gPgo+ID4gPgo+ID4gPiBIaSBQcmFiaGFrYXIsCj4gPiA+Cj4gPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPgo+ID4gPiA+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAxMiwgMjAyNCAy
OjI2IFBNCj4gPiA+ID4gU3ViamVjdDogW1BBVENIIHY0IDMvNF0gcGluY3RybDogcmVuZXNhczog
cGluY3RybC1yemcybDogQWRkIHRoZQo+ID4gPiA+IG1pc3NpbmcgcG9ydCBwaW5zIFAxOSB0byBQ
MjgKPiA+ID4gPgo+ID4gPHNuaXA+Cj4gPiA+ID4KPiA+ID4gPiArLyoqCj4gPiA+ID4gKyAqIHN0
cnVjdCByemcybF92YXJpYWJsZV9waW5fY2ZnIC0gcGluIGRhdGEgY2ZnCj4gPiA+ID4gKyAqIEBj
Zmc6IHBvcnQgcGluIGNvbmZpZ3VyYXRpb24KPiA+ID4gPiArICogQHBvcnQ6IHBvcnQgbnVtYmVy
Cj4gPiA+ID4gKyAqIEBwaW46IHBvcnQgcGluCj4gPiA+ID4gKyAqLwo+ID4gPiA+ICtzdHJ1Y3Qg
cnpnMmxfdmFyaWFibGVfcGluX2NmZyB7Cj4gPiA+ID4gKyAgICAgdTMyIGNmZzoyMDsKPiA+ID4g
PiArICAgICB1OCBwb3J0OjU7Cj4gPiA+Cj4gPiA+ICB1MzIgPz8KPiA+IFRoaXMgaXMgZG9uZSBi
YXNlZCBvbiB0aGUgZmVlZGJhY2sgcHJvdmlkZWQgcHJldmlvdXNseSBieSBHZWVydCBbMF0uCj4g
Pgo+ID4gPiA+ICsgICAgIHU4IHBpbjo1Owo+ID4gPgo+ID4gPiAgdTMyID8/Cj4gPiA+Cj4gPiBk
aXR0by4KPiA+Cj4KPiBBcyBwZXJbMF0gc3VnZ2VzdGlvbiBpcywKPgo+IEFzIGNmZyBvbmx5IGNv
bnRhaW5zIHRoZSBsb3dlciBiaXRzIChQSU5fQ0ZHXyopLCBJIHRoaW5rIHlvdSBjYW4gZml0Cj4g
ZXZlcnl0aGluZyBpbiBhIHUzMjoKPgo+ICAgICB1MzIgY2ZnOiAyMDsKPiAgICAgdTMyIHBvcnQ6
IDU7Cj4gICAgIHUzMiBwaW46IDM7Cj4KT3VjaCBteSBiYWQsIGknbGwgc2VuZCBhIHY1IHdpdGgg
dGhpcyBjaGFuZ2UuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
