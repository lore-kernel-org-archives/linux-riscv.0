Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2992AC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuY+A37eB97HwZUZ90iZ4zwJaZj3CYMZkcOTbcvf4nI=; b=G/YxJBQulkT3JK
	SVdcrhKqcwbLWEby2z8NyZyTEJgcDrJVVih44v8qDmN5QgjY3bBjTrcHaZ+1a4E5AT5B0bdyDvGF0
	QYWfrvrE8dV8QesZcHkrsX2KXdPRxecTWYPhwxh8FoM90wq8qB1OfMK0P4cx/Hr9XA02+fj4staLO
	ShuLjqWzoU+QMEPJ35vRHP/OYwllwRtnhbbXhEYglON7mcerWWtFFIpxCTR7N0xunObu9qhAlYXOr
	zrxTEBelgnh+98axC3XtvGanbzai4wvE9kqIu+mrh+18H5yaWxya3ubbVIoiLuPwfhsPEcXaJT4ak
	6s5y1NXJUGHmHWRnrAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDcA-007ELX-2l;
	Fri, 31 Mar 2023 12:12:18 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDc8-007EKk-1s
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:12:17 +0000
Received: by mail-il1-x135.google.com with SMTP id q5so6011826ilg.12
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680264735; x=1682856735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOa0WDEClE+kNIsNikxxp7PL+bWJ4DGdBDO+mmYy+aM=;
        b=F1QoNAEfg2cAj7U4wmA8PsIz83ZH1hMOPIj90UszYnqjjAXygAdESm02pWCWaLiN03
         +N26IGPZ6VAcXGOGtkaT3lmgpEPrZ7XYH1kH+HUdZG0zONOdhYJd40NsnSiaRvY+wCwQ
         SF2oSruQD3hw3pY5L2mFY94IuVdZmjRwXqF0fxVoGsTCIA+udLKqJlEuhhVxI/C+CS6j
         bKjm1Os3GsIJuKn+jlib5867fTgj3pMjjPFuCeDpy8SqeuSSgXCX6Kx1gInm/A6cxy2h
         MUkql7GaUJltCFPrGYzIY5a7/kVOl9NmjiG8G8UKkEt1BOS/RSl+EdUjg8kewmnrJPA6
         cLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264735; x=1682856735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOa0WDEClE+kNIsNikxxp7PL+bWJ4DGdBDO+mmYy+aM=;
        b=Heuoih6t2QFvGXJh8uIXuQ8qJo2Cl34f7Y2GcGzY9cQmX11cqm8k8mrlSt42QYQitZ
         /cDw6qVU4F55NVSb7OF0sxO7w3jaYbyTPmUMuxvKVMJtOCtFDILsD4wevYZ8MYU5xDOp
         dQxKz4gcAmX4OVUn6SQn6u27F2/GBYWNkhEpskjRB6Q8Lorv7IR4pVHac555Ei3GsVuy
         QjYgODuzVBt+ETNcGnjYwQ0i37SCe9455rpukpr6R+MS06lAZT/sj6cTTo/ZvRrbT/6q
         h2C4hSvcFkN69YviCOGN/Gh8qaGQRaOia/KAoPUGp98EalvmGywLt6+OBYGZZRaUTpov
         Yn+w==
X-Gm-Message-State: AAQBX9eXC4AyXMsRZJKTwtOMSsOXN+e6MdPaUh350d8cJYlSzNV81yA0
	B0tpuYRXd1EbT/PV14FaFIOQK6s+QwRMjTcNuGU=
X-Google-Smtp-Source: AKy350a6CpiHAw/8PBeQohWWJaeNroiWBab+H6eZzow8rf2zzcfKecGDt6RIbJ/ASWV/e1FauShuiLz6VaQ/PBseZ88=
X-Received: by 2002:a05:6e02:1047:b0:325:dd36:7451 with SMTP id
 p7-20020a056e02104700b00325dd367451mr12904804ilj.1.1680264735446; Fri, 31 Mar
 2023 05:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com> <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
 <1c441d20-951d-407b-90ba-4cda3b0505b2@app.fastmail.com>
In-Reply-To: <1c441d20-951d-407b-90ba-4cda3b0505b2@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 31 Mar 2023 13:11:49 +0100
Message-ID: <CA+V-a8t_kozAobT028-RN39uoXcd7-0oJAhAR24MEzmoLVKX8Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_051216_640780_FAEFAC8D 
X-CRM114-Status: GOOD (  24.83  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTE6NDXigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPgo+IE9uIEZyaSwgTWFyIDMxLCAyMDIzLCBhdCAxMjozNywgTGFkLCBQ
cmFiaGFrYXIgd3JvdGU6Cj4gPiBPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCAxMDozNOKAr1BNIEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4KPiA+PiBJdCBhbHNvIHNlZW1z
IHdyb25nIHRvIGhhdmUgdGhlIGZhbGxiYWNrIGJlIHRvIGRvIG5vdGhpbmcKPiA+PiB3aGVuIHRo
ZSBwb2ludGVyIGlzIE5VTEwsIHNpbmNlIHRoYXQgY2Fubm90IGFjdHVhbGx5IHdvcmsKPiA+PiB3
aGVuIGEgZGV2aWNlIGlzIG5vdCBjYWNoZSBjb2hlcmVudC4KPiA+Pgo+ID4gSWYgdGhlIGRldmlj
ZSBpcyBub24gY2FjaGUgY29oZXJlbnQgYW5kIGlmIGl0IGRvZXNuJ3Qgc3VwcG9ydCBaSUNCT00K
PiA+IElTQSBleHRlbnNpb24gdGhlIGRldmljZSB3b24ndCB3b3JrIGFueXdheS4gU28gbm9uLWNh
Y2hlIGNvaGVyZW50Cj4gPiBkZXZpY2VzIHVudGlsIHRoZXkgaGF2ZSB0aGVpciBDTU8gY29uZmln
IGVuYWJsZWQgd29uJ3Qgd29yayBhbnl3YXkuIFNvCj4gPiBJIGRpZG4ndCBzZWUgYW55IGJlbmVm
aXQgaW4gZW5hYmxpbmcgWklDQk9NIGJ5IGRlZmF1bHQuIFBsZWFzZSBsZXQgbWUKPiA+IGtub3cg
aWYgSSBhbSBtaXN1bmRlcnN0YW5kaW5nLgo+Cj4gVHdvIHRoaW5nczoKPgo+IC0gSGF2aW5nIGEg
YnJva2VuIG1hY2hpbmUgY3Jhc2ggd2l0aCBpbiBpbnZhbGlkIGluc3RydWN0aW9uCj4gICBleGNl
cHRpb24gaXMgYmV0dGVyIHRoYW4gaGF2aW5nIGl0IHJ1biBpbnRvIHNpbGVudCBkYXRhCj4gICBj
b3JydXB0aW9uLgo+Cj4gLSBhIGNvcnJlY3RseSBwcmVkaWN0ZWQgYnJhbmNoIGlzIHR5cGljYWxs
eSBmYXN0ZXIgdGhhbiBhbgo+ICAgaW5kaXJlY3QgZnVuY3Rpb24gY2FsbCwgc28gdGhlIGZhbGxi
YWNrIHRvIHppY2JvbSBtYWtlcyB0aGUKPiAgIGV4cGVjdGVkIChhdCBsZWFzdCBpbiB0aGUgZnV0
dXJlKSBjYXNlIHRoZSBmYXN0IG9uZS4KPgpPaywgdGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNh
dGlvbi4gSSdsbCBkZWZhdWx0IHRvIHppY2JvbS4KCj4gPiBAQCAtNDY1LDcgKzQ2Niw2IEBAIGNv
bmZpZyBSSVNDVl9JU0FfWklDQk9NCj4gPiAgICAgICAgIGRlcGVuZHMgb24gTU1VCj4gPiAgICAg
ICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPiA+ICAgICAgICAgZGVmYXVsdCB5Cj4g
PiAtICAgICAgIHNlbGVjdCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiA+ICAgICAgICAgaGVscAo+
ID4gICAgICAgICAgICBBZGRzIHN1cHBvcnQgdG8gZHluYW1pY2FsbHkgZGV0ZWN0IHRoZSBwcmVz
ZW5jZSBvZiB0aGUgWklDQk9NCj4gPiAgICAgICAgICAgIGV4dGVuc2lvbiAoQ2FjaGUgQmxvY2sg
TWFuYWdlbWVudCBPcGVyYXRpb25zKSBhbmQgZW5hYmxlIGl0cwo+ID4KPiA+IEJ1dCB3aGF0IGlm
IHRoZSBwbGF0Zm9ybSBkb2Vzbid0IGhhdmUgdGhlIFpJQ0JPTSBJU0EgZXh0ZW5zaW9uPwo+Cj4g
VGhlbiBpdCBuZWVkcyB0byByZWdpc3RlciBpdHMgY2FjaGUgb3BlcmF0aW9ucyBiZWZvcmUgdGhl
IGZpcnN0Cj4gRE1BLCB3aGljaCBpcyBzb21ldGhpbmcgdGhhdCBpdCBzaG91bGQgZG8gYW55d2F5
LiBXaXRoIHlvdXIKPiBjdXJyZW50IGNvZGUsIGl0IG1heSB3b3JrIGJ5IGFjY2lkZW50IGRlcGVu
ZGluZyBvbiB0aGUgc3RhdGUgb2YKPiB0aGUgY2FjaGUsIGJ1dCB3aXRoIHRoZSB2ZXJzaW9uIEkg
c3VnZ2VzdGVkLCBpdCB3aWxsIGVpdGhlciB3b3JrCj4gY29ycmVjdGx5IGFsbCB0aGUgdGltZSBv
ciBjcmFzaCBpbiBhbiBvYnZpb3VzIHdheSB3aGVuIG1pc2NvbmZpZ3VyZWQuCj4KT2theSwgYWdy
ZWVkLgoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
