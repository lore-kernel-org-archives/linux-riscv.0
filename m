Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB5FEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 06:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUfOkNCc5bAW1y0AWJlkbuvVnYiMULtEao8QHE3gTaU=; b=DRmkbv7k6qcFqG
	ltU0Kspox/oNklsFvTzgcILqk7Nf/vSHZR9VQA+S6wtce6bqJ2NfFE3m45SOWcgRDJUODVg54RF93
	vyPewv+2SAizaYu4Y663+jlLA/kVScaomKR4rC8vnqSop2pKXcp+VSGmVkpkvKXlWhiEsIkuykCFQ
	2eiNCM5ikCyUYmjsMP8BhXW19WHsCD3JGTY8lhXcG+9O8TLG0dQ6wVGheMoSzn6lei4z+Hkg2GOet
	MtDP0X3uuHY6RPKR/4G1W9xYJcOwoEAUFJfoGckzucIJPmnryxkDZNr/P8Dp5LG+4QHdxdAYPrcrX
	i0f++h32VoGsOM16eigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHIto-000iDB-2k;
	Thu, 06 Jul 2023 06:55:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHItl-000iCF-1E
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 06:55:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fba74870abso363803e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688626525; x=1691218525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIWuZ4QjmJeFmnk76baX9ZdxXV9vrusq9Mf9jFE8ve0=;
        b=aHYGgcWXcjnUyBoSgqcUlmMYoz6SVQE+Zc2KoE5+MR8W87NF2VYIRITvNq0nXK8Zw5
         IHre5XvZi6OeQT5Zk/aUVx75x2M/ViPm6MEz7BZ34h3Rwu/hiz5ziJBXHQdD0XGXEo/K
         LcSwWb5k5AA1ggnyZm/RDdE0sZBHKIR9y/pLt+72wWl84x/RAXTY6B7zKoO7eFaL+XaE
         f6GARDNNCN4JRti2n5Byl1EcJEETKRrnoa/0ul7SDO00jjCMChHyhHCXGVNwJBKwqIci
         bPMOszxdkVdpt8bmZWktV+vQCdueiYGr1jtAeeY+wPialubWoXssS7qaFSoE3k23Np6R
         qxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688626525; x=1691218525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIWuZ4QjmJeFmnk76baX9ZdxXV9vrusq9Mf9jFE8ve0=;
        b=lfnE4NRoDCi6ECsIQOgy9fiazzSkk8QNOhpU92K590RMTL2ZgAH0bK6AZJobvIroer
         ob+Xq8n6i7y0TBn4xKRDhL1fM51z7iVDduPaU8Hr/1RCMCQ18Bf0/kVCgkYrHAQPz+KD
         MD0FF9NCNktJEqt/fIh/uL6tm7f26XWHGgtnc7xRYiRrYkGINeeGMyb28P26CAmBm81O
         O6EqU3dC/VKxD3BzXn3/1H9yFccM1uL+kH+llwaxy7B1X9rbM5AQ5CzA+bF4PMemcFnY
         899dnaL8sWnorv/IzgT6dM0y9FvpwVHfGPjIM2UBc0LIx/iFFvIcirtN9iy2VuYQkRke
         0gaw==
X-Gm-Message-State: ABy/qLbCicpF3/xo2lGDFOrj7dfBeF7v64GfIPOTUL9MvHikPsd3mlIk
	/MGzdu8RqwUS59XPt09Q+77RfkA9x2ikBc7HaDCytg==
X-Google-Smtp-Source: APBJJlGJYnknpmC9Qq3WbZ7UUCJ6LFuD0JCKZFeaAAuo/1MAE66QYPEZ54lv3/+/BUGQMF/UQxBgzxELpSIcGO6IS7Q=
X-Received: by 2002:a05:6512:2098:b0:4f9:5711:2eb6 with SMTP id
 t24-20020a056512209800b004f957112eb6mr693785lfr.28.1688626525145; Wed, 05 Jul
 2023 23:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230705114251.661-1-cuiyunhui@bytedance.com> <20230705114251.661-5-cuiyunhui@bytedance.com>
 <20230705-oblivious-unstuffed-8e028a5b243c@spud> <CAEEQ3wmG1OiE3GFqQp9SP+oKUbTfuTPx=rNGd-sjKsW7vv3bew@mail.gmail.com>
 <07f88065-b9ca-5233-4048-5e61e1cdbe0c@linaro.org> <CAEEQ3wmY3YrdBEZ_V0+rC-3zbMLRgnL3xt-RtwzPxev5P2h48g@mail.gmail.com>
 <df87a707-ed17-0629-308a-d9435ebd3227@linaro.org>
In-Reply-To: <df87a707-ed17-0629-308a-d9435ebd3227@linaro.org>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Thu, 6 Jul 2023 14:55:14 +0800
Message-ID: <CAEEQ3wnbKHkoTUcd4n9mKF4c4bxqU23uMTexeSTY9d=owLgtEQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 4/4] dt-bindings: firmware: Document
 ffitbl binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_235529_437440_53D68C51 
X-CRM114-Status: GOOD (  29.00  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLAoKCk9uIFRodSwgSnVsIDYsIDIwMjMgYXQgMjo0MeKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBP
biAwNi8wNy8yMDIzIDA4OjI0LCDov5DovonltJQgd3JvdGU6Cj4gPiBIaSBLcnp5c3p0b2YsCj4g
Pgo+ID4gT24gVGh1LCBKdWwgNiwgMjAyMyBhdCAyOjAx4oCvUE0gS3J6eXN6dG9mIEtvemxvd3Nr
aQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBP
biAwNi8wNy8yMDIzIDA1OjQzLCDov5DovonltJQgd3JvdGU6Cj4gPj4+IEhpIENvbm9yLAo+ID4+
Pgo+ID4+PiBBZGRlZCBkdHMgTWFpbnRhaW5lcnMsCj4gPj4+Cj4gPj4+IE9uIFdlZCwgSnVsIDUs
IDIwMjMgYXQgMTE6MDfigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4+Pj4KPiA+Pj4+IEhleSwKPiA+Pj4+Cj4gPj4+PiBPbiBXZWQsIEp1bCAwNSwgMjAyMyBh
dCAwNzo0Mjo1MVBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4+Pj4+IEFkZCB0aGUgZGVz
Y3JpcHRpb24gZm9yIGZmaXRibCBzdWJub2RlLgo+ID4+Pj4+Cj4gPj4+Pj4gU2lnbmVkLW9mZi1i
eTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPj4+Pj4gLS0tCj4gPj4+
Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQgICB8IDI3ICsr
KysrKysrKysrKysrKysrKysKPiA+Pj4+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKykKPiA+Pj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9maXJtd2FyZS9mZml0YmwudHh0Cj4gPj4+Pj4KPiA+Pj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvZmZpdGJsLnR4
dAo+ID4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5jNDIzNjg2MjYxOTkKPiA+Pj4+PiAtLS0gL2Rldi9udWxsCj4gPj4+Pj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2ZmaXRibC50eHQKPiA+Pj4+Cj4g
Pj4+PiBGaXJzdGx5LCBuZXcgZHQtYmluZGluZ3MgbmVlZCB0byBiZSBkb25lIGluIHlhbWwsIG5v
dCBpbiB0ZXh0IGZvcm0uCj4gPj4+PiBTZWNvbmRseSwgeW91IGRpZG4ndCByZS1ydW4gZ2V0X21h
aW50YWluZXIucGwgYWZ0ZXIgYWRkaW5nIHRoaXMgYmluZGluZywKPiA+Pj4+IHNvIHlvdSBoYXZl
IG5vdCBDQ2VkIGFueSBvZiB0aGUgb3RoZXIgZHQtYmluZGluZyBtYWludGFpbmVycyBub3IgdGhl
Cj4gPj4+PiBkZXZpY2V0cmVlIG1haWxpbmcgbGlzdC4KPiA+Pj4KPiA+Pj4gUmUtcnVuIGdldF9t
YWludGFpbmVyLnBsIGFuZCBhZGRlZCBtYWludGFpbmVycyBpbnRvIHRoZSBtYWlsbGlzdC4KPiA+
Pgo+ID4+Cj4gPj4gVGhpcyBkb2VzIG5vdCB3b3JrIGxpa2UgdGhpcy4KPiA+Pgo+ID4+IFBsZWFz
ZSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgdG8gZ2V0IGEgbGlzdCBvZiBuZWNlc3Nh
cnkgcGVvcGxlCj4gPj4gYW5kIGxpc3RzIHRvIENDLiAgSXQgbWlnaHQgaGFwcGVuLCB0aGF0IGNv
bW1hbmQgd2hlbiBydW4gb24gYW4gb2xkZXIKPiA+PiBrZXJuZWwsIGdpdmVzIHlvdSBvdXRkYXRl
ZCBlbnRyaWVzLiAgVGhlcmVmb3JlIHBsZWFzZSBiZSBzdXJlIHlvdSBiYXNlCj4gPj4geW91ciBw
YXRjaGVzIG9uIHJlY2VudCBMaW51eCBrZXJuZWwuCj4gPj4KPiA+PiBZb3UgbWlzc2VkIGF0IGxl
YXN0IERUIGxpc3QgKG1heWJlIG1vcmUpLCBzbyB0aGlzIHdvbid0IGJlIHRlc3RlZCBieSBvdXIK
PiA+PiB0b29scy4gUGVyZm9ybWluZyByZXZpZXcgb24gdW50ZXN0ZWQgY29kZSBtaWdodCBiZSBh
IHdhc3RlIG9mIHRpbWUsIHRodXMKPiA+PiBJIHdpbGwgc2tpcCB0aGlzIHBhdGNoIGVudGlyZWx5
IHRpbGwgeW91IGZvbGxvdyB0aGUgcHJvY2VzcyBhbGxvd2luZyB0aGUKPiA+PiBwYXRjaCB0byBi
ZSB0ZXN0ZWQuCj4gPj4KPiA+PiBQbGVhc2Uga2luZGx5IHJlc2VuZCBhbmQgaW5jbHVkZSBhbGwg
bmVjZXNzYXJ5IFRvL0NjIGVudHJpZXMuCj4gPgo+ID4gVGhpcyBzZXQgb2YgcGF0Y2hlcyBpcyBh
cHBsaWVkIG9uIHRoZSB0YWcgbmV4dC0yMDIzMDcwNiwgYW5kIHRvCj4gPiBnZW5lcmF0ZSB0aGUg
bWFpbCBsaXN0IGJ5IHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIG9uIHRoZSB0YWcKPiA+Cj4g
PiAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwKPiA+IC4uL3Jpc2N2L2xpbnV4L3YzLTAwMDQt
ZHQtYmluZGluZ3MtZmlybXdhcmUtRG9jdW1lbnQtZmZpdGJsLWJpbmRpbmcucGF0Y2gKPiA+IFl1
bmh1aSBDdWkgY3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20gKG1haW50YWluZXI6RkRUIEZJUk1XQVJF
IElOVEVSRkFDRSAoRkZJKSkKPiA+IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+ICht
YWludGFpbmVyOk9QRU4gRklSTVdBUkUgQU5ECj4gPiBGTEFUVEVORUQgREVWSUNFIFRSRUUgQklO
RElOR1MpCj4gPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxp
bmFyby5vcmc+Cj4gPiAobWFpbnRhaW5lcjpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVW
SUNFIFRSRUUgQklORElOR1MpCj4gPiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+
IChtYWludGFpbmVyOk9QRU4gRklSTVdBUkUgQU5ECj4gPiBGTEFUVEVORUQgREVWSUNFIFRSRUUg
QklORElOR1MpCj4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyAob3BlbiBsaXN0Ok9QRU4g
RklSTVdBUkUgQU5EIEZMQVRURU5FRAo+ID4gREVWSUNFIFRSRUUgQklORElOR1MpCj4gPiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3QpCj4gPgo+ID4gV2hhdCBhbSBJIG1p
c3NpbmcgPwo+Cj4gSSBkaWQgbm90IHJlY2VpdmUgdGhlIG9yaWdpbmFsIHBhdGNoLiBOZWl0aGVy
IGRpZCBQYXRjaHdvcmsuIFlvdSBjYW5ub3QKPiBqdXN0IHJlcGx5IHRvIHNvbWUgY29tbWVudCBh
bmQgaG9wZSBpdCB3aWxsIGZpeCBzb21ldGhpbmcuIFdlIGRvbid0IGhhdmUKPiB0aGlzIHBhdGNo
IHNpbXBseS4KCk9oLCBJIHNlZSwgeW91IG9ubHkgcmVjZWl2ZWQgdGhlIG1pZGRsZSBtYWlsLCBh
bmQgZGlkIG5vdCByZWNlaXZlIHRoZSBwYXRjaC4KT2theSwgSSdsbCBwb3N0IGl0IGFmdGVyIHRo
ZSBuZXh0IHZlcnNpb24gaXMgdXBkYXRlZC4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9m
Cj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
