Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AEAC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9w4G5LZsiR54w++mzMNwIjqj7h6SJ/Na6CGMDhUjVw=; b=Nar4bCD4iUKW/S
	niUX3DkprRbw594NggauBKD87UXuoBvS2H7tHo0KWDxpQRk2katS0QrBgsqu756l+P+gwFcp+n/Th
	kT9RZNswRj1pJ8DjbkVB2CgdTvaxYpjYxHtFt+SYLNCHferznUdhDdhIRKnol1Q/Gz97w1X9+QkbX
	lu1Ix/GrJWeUohJcvyhNRPx04wkBmJEDtz76mrtSGFpy9B9DqRE/qxbyrjili2uXcxygvsiw7eurc
	zshzgNwyU0DyyQ4yj7FUf2kqIOTblM8zbhiSdgKnDa1UEpedoZxkKmyOM+RnOgrSqelVcpEZYVpd2
	3A8CsU5qiY5+eK1o2JvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNXo-00G1rY-1I;
	Mon, 03 Apr 2023 17:00:36 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNXl-00G1qc-1e
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 17:00:34 +0000
Received: by mail-io1-xd2d.google.com with SMTP id d22so12101428iow.12
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680541231; x=1683133231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nf1Z/1629BSjtPERMC0xegxmYOylmoUX4r5kQI3Zb4=;
        b=afZSs2OWGE0NO12jOYZZiTTElaK97bfx4375BKXFjikdA8n0hir3GyRGXNuXs1UnzL
         5lg2tgzlu/ihguK+7ws1V4VP+Ka/6E+KU4xzIGpJmSb3wVON495DEAv0vWks7ObDMy0B
         QeN2khJBAeNmAYfBLjn/xfcGpDlC+jhTxnD3qH+o8D4xdkBt2Tt8tws9PK3V3TU7DoYg
         Ub7icz4RPADSd1ONMIXOz3/ZZoK9OBeDmv8mJhSioQmNb3a47+nWiZsG8DR3zS1X4IoF
         wz3YoMCBH6X9N2Sm8lpmJnI8G0EwYsYAf7foI5TI7Ph7SQ3uZHPejgFzF9MMjC+4xI/V
         pwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680541231; x=1683133231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nf1Z/1629BSjtPERMC0xegxmYOylmoUX4r5kQI3Zb4=;
        b=dhCv9ZsaqROUXixG2Fsbw2F4qpvnD4lTkJTcBLK7uy6qBQ2FXNnSoiB1nKLsG4Vc/F
         3C/v2MffOk4zv7JCwCN7EVGr2g6KNaRr5SNnb2jzZxl5/ABMFSJbn5TAWTcHzJJSXpH/
         8truJtTCWgTISOHaYHaiUGnHFrB1ENXkefTYd9d+SnNsr1NQ/2IaiezvaxShk6MBrKur
         5JLrbuxdupaM1sX4pzfl62GMukd80e02PLHNWjD1g+n2YIfHMX1un1azOdkq1YooNWX1
         xlPfMbm/A/MqXsC9O2mUOMIdkcBl6Sgvd8r0zwUQsvZTgm1FgQrOOvOgBkfLL5bbp8O0
         sNcw==
X-Gm-Message-State: AAQBX9cz9uV8+6yAjk/FcfQtww5RrZbSRx98YGsOzkfgMU2BravRQjl/
	Pkf5xmiqUPCca9xZwT+aKvGQnIAvN68CibN+fwM=
X-Google-Smtp-Source: AKy350Y/yLdfzY2ZvtkWGRk2SOZ/N5p31WZSenKJhc7loZKG0LwU+ujjt2tYneg/fN/rDMA3AWrQzzlpaYBPirIuotA=
X-Received: by 2002:a02:7359:0:b0:3a7:e46e:ab64 with SMTP id
 a25-20020a027359000000b003a7e46eab64mr17031jae.1.1680541231305; Mon, 03 Apr
 2023 10:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com> <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
 <1c441d20-951d-407b-90ba-4cda3b0505b2@app.fastmail.com>
In-Reply-To: <1c441d20-951d-407b-90ba-4cda3b0505b2@app.fastmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Apr 2023 18:00:04 +0100
Message-ID: <CA+V-a8t-j6DRpcv5oGREHVUaQpafcHiW8M_mRWAK4dC6PAsbcg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230403_100033_564151_C8C6AB87 
X-CRM114-Status: GOOD (  27.50  )
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

SGkgQXJuZCwKCk9uIEZyaSwgTWFyIDMxLCAyMDIzIGF0IDExOjQ14oCvQU0gQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAzMSwgMjAyMywgYXQgMTI6
MzcsIExhZCwgUHJhYmhha2FyIHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMTA6
MzTigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+Cj4gPj4gSXQg
YWxzbyBzZWVtcyB3cm9uZyB0byBoYXZlIHRoZSBmYWxsYmFjayBiZSB0byBkbyBub3RoaW5nCj4g
Pj4gd2hlbiB0aGUgcG9pbnRlciBpcyBOVUxMLCBzaW5jZSB0aGF0IGNhbm5vdCBhY3R1YWxseSB3
b3JrCj4gPj4gd2hlbiBhIGRldmljZSBpcyBub3QgY2FjaGUgY29oZXJlbnQuCj4gPj4KPiA+IElm
IHRoZSBkZXZpY2UgaXMgbm9uIGNhY2hlIGNvaGVyZW50IGFuZCBpZiBpdCBkb2Vzbid0IHN1cHBv
cnQgWklDQk9NCj4gPiBJU0EgZXh0ZW5zaW9uIHRoZSBkZXZpY2Ugd29uJ3Qgd29yayBhbnl3YXku
IFNvIG5vbi1jYWNoZSBjb2hlcmVudAo+ID4gZGV2aWNlcyB1bnRpbCB0aGV5IGhhdmUgdGhlaXIg
Q01PIGNvbmZpZyBlbmFibGVkIHdvbid0IHdvcmsgYW55d2F5LiBTbwo+ID4gSSBkaWRuJ3Qgc2Vl
IGFueSBiZW5lZml0IGluIGVuYWJsaW5nIFpJQ0JPTSBieSBkZWZhdWx0LiBQbGVhc2UgbGV0IG1l
Cj4gPiBrbm93IGlmIEkgYW0gbWlzdW5kZXJzdGFuZGluZy4KPgo+IFR3byB0aGluZ3M6Cj4KPiAt
IEhhdmluZyBhIGJyb2tlbiBtYWNoaW5lIGNyYXNoIHdpdGggaW4gaW52YWxpZCBpbnN0cnVjdGlv
bgo+ICAgZXhjZXB0aW9uIGlzIGJldHRlciB0aGFuIGhhdmluZyBpdCBydW4gaW50byBzaWxlbnQg
ZGF0YQo+ICAgY29ycnVwdGlvbi4KPgo+IC0gYSBjb3JyZWN0bHkgcHJlZGljdGVkIGJyYW5jaCBp
cyB0eXBpY2FsbHkgZmFzdGVyIHRoYW4gYW4KPiAgIGluZGlyZWN0IGZ1bmN0aW9uIGNhbGwsIHNv
IHRoZSBmYWxsYmFjayB0byB6aWNib20gbWFrZXMgdGhlCj4gICBleHBlY3RlZCAoYXQgbGVhc3Qg
aW4gdGhlIGZ1dHVyZSkgY2FzZSB0aGUgZmFzdCBvbmUuCj4KPiA+IEBAIC00NjUsNyArNDY2LDYg
QEAgY29uZmlnIFJJU0NWX0lTQV9aSUNCT00KPiA+ICAgICAgICAgZGVwZW5kcyBvbiBNTVUKPiA+
ICAgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+ID4gICAgICAgICBkZWZhdWx0
IHkKPiA+IC0gICAgICAgc2VsZWN0IFJJU0NWX0RNQV9OT05DT0hFUkVOVAo+ID4gICAgICAgICBo
ZWxwCj4gPiAgICAgICAgICAgIEFkZHMgc3VwcG9ydCB0byBkeW5hbWljYWxseSBkZXRlY3QgdGhl
IHByZXNlbmNlIG9mIHRoZSBaSUNCT00KPiA+ICAgICAgICAgICAgZXh0ZW5zaW9uIChDYWNoZSBC
bG9jayBNYW5hZ2VtZW50IE9wZXJhdGlvbnMpIGFuZCBlbmFibGUgaXRzCj4gPgo+ID4gQnV0IHdo
YXQgaWYgdGhlIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSB0aGUgWklDQk9NIElTQSBleHRlbnNpb24/
Cj4KPiBUaGVuIGl0IG5lZWRzIHRvIHJlZ2lzdGVyIGl0cyBjYWNoZSBvcGVyYXRpb25zIGJlZm9y
ZSB0aGUgZmlyc3QKPiBETUEsIHdoaWNoIGlzIHNvbWV0aGluZyB0aGF0IGl0IHNob3VsZCBkbyBh
bnl3YXkuIFdpdGggeW91cgo+IGN1cnJlbnQgY29kZSwgaXQgbWF5IHdvcmsgYnkgYWNjaWRlbnQg
ZGVwZW5kaW5nIG9uIHRoZSBzdGF0ZSBvZgo+IHRoZSBjYWNoZSwgYnV0IHdpdGggdGhlIHZlcnNp
b24gSSBzdWdnZXN0ZWQsIGl0IHdpbGwgZWl0aGVyIHdvcmsKPiBjb3JyZWN0bHkgYWxsIHRoZSB0
aW1lIG9yIGNyYXNoIGluIGFuIG9idmlvdXMgd2F5IHdoZW4gbWlzY29uZmlndXJlZC4KPgpZb3Ug
d2VyZSByaWdodCwgZGVmYXVsdGluZyB0byBaSUNCT00gaXMgZ2l2aW5nIG1lIGEgY3Jhc2guIFNv
IEkgbmVlZAp0byBzd2l0Y2ggdG8gc29tZXRoaW5nIGVsc2UgcmF0aGVyIHRoYW4gdXNpbmcgYXJj
aF9pbml0Y2FsbCgpLgoKSSB0cmllZCBlYXJseV9pbml0Y2FsbCgpIGJ1dCB0aGlzIGRvZXNuJ3Qg
bGV0IG1lIHJlZ2lzdGVyIGEgcGxhdGZvcm0KZHJpdmVyLiBJIHNob3VsZCBiZSBhYmxlIHRvIGFj
Y2VzcyB0aGUgcmVzb3VyY2VzIGFuZCBEVCBmcm9tIGluaXQKY2FsbGJhY2sgYW5kIHRoZW4gcmVn
aXN0ZXIgQ01PIGNhbGxiYWNrcyAoSSBoYXZlbnQgdHJpZWQgdGhpcyB5ZXQpIGJ1dAppdCB3b250
IGJlIGEgcGxhdGZvcm0gZHJpdmVyLiBTaG91bGQgdGhpcyBiZSBPSz8KCkNoZWVycywKUHJhYmhh
a2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
