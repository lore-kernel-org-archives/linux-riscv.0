Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6529BE75457
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQyXM2jJxMFGckj8aenlgsX1RbRU3JN9EXxmLGSbmwU=; b=op/ZSrI3936NuG
	k0FL+rJcqnjyHR5EksrOnc5q3O6UBQiRdtxzGT5k/O5ushJnIkQFnTac5VApP8CULSPraukwqbakS
	l2HCLI6rs6vDShks3DBnYFkUuUODF7Jk1y3DDpoQbRIAM1iHAA+P+/tBJsjKLXkkk+a4yM4G1YjF+
	EzuGNPjAIXDiGYkVCq12k8hefAyIl3iWvchrPjmPC40rYJK4vBjaGZE7SZyO//KxwUQo7trDkh+ly
	dlA+PcFqg9kIuW0QRD8fY4tkzGTuAC7yBE48qJ+CleJx56d6VSrdtPaIfUKBhI1Ii/y9536/wHlMu
	kYZUajPioclq+4VMajQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnefT-00Ed5b-1j;
	Tue, 03 Oct 2023 12:38:27 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnefQ-00Ed55-2u
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 12:38:26 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49aa8518df8so535251e0c.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696336702; x=1696941502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKzlt+BVfLvIxh6PYh+kinEoKPnd+lX03sFhitHZpJ4=;
        b=XmfkX0v2p35Io9gZY+x3aG+USNVsfV9GECcakwESkvLGrQN6EO29gq7tUlA8v5P+rV
         Y+KMeXuZyTjFcRUf5vR3tdiX24eVieJd/jGdHsTOPYsYQYzfrufAI5LAGy9Dt/sTDZz+
         wUqBgFkX/D060ipsOldFuWbbcKDsAWYbvJBQFDrGx3qEWH9M860wlyQ5a+Yjz8LGiS1a
         VwkYMACgs8KKvMnvO8KOYzys9fnqka7P9XO79GnlAUtXa6V5K3pcDOYRgnUl+JwwzGuo
         Bg3Kk3uAEJTmYPaiyuQ+klS4cylK+PJuqpxHHR7UVWm5tGnfFOEuqWBhGwLXab3/TG/i
         2oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696336702; x=1696941502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKzlt+BVfLvIxh6PYh+kinEoKPnd+lX03sFhitHZpJ4=;
        b=JmPDuKHXCtNofumMjSvWPM/bmTllp8qwfdkDTTTe6aj14mOaL+YOMC6pKJl7r1iTcR
         sH/PMASBGbDYmi4EuLeuPiwiOirxSkRInDhiFtjeB2lesB04A+//QQUvg4iutIZ1vSze
         X9AemKK5f5N1iMvjEayraSy1ayMX5fz2+VW3Efw2VgCzDZD1vc9Y9cPEObCoXmWVyW1e
         b/LpYGvCduFWMtPLZoFKAz4ZIrStrzEpAdZRALW24apwBZxx6V+NHWsR7uF4YPGv896r
         vUupJfQMVcGXdvzfP5lk3d4rIBx0UDtll94kLxglBJcGX22cuttwqrw2FkTpk8+UnPWk
         yYaw==
X-Gm-Message-State: AOJu0YxBdVpLDzwKRfEoVBDHkh9JDI+bgVb1F69Y6k/O9j4bYnzjw0by
	iXqFgj46gO5o+Sg8BgbaIDrmjwWSF5rphTSEDKU=
X-Google-Smtp-Source: AGHT+IHedkT3obXGyb9nsJv3EFRBFDAeX3iUNPTid2i0eAkHBAV7M3TivHtMpjze3qSf2rSGD9Yh21SNWfYtAWWzG7I=
X-Received: by 2002:a1f:4804:0:b0:49a:9f99:bb03 with SMTP id
 v4-20020a1f4804000000b0049a9f99bb03mr1206148vka.1.1696336702438; Tue, 03 Oct
 2023 05:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230929000704.53217-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWq8R0QtDxNRkask3kipnSXmOzR_TjV3Hy0bkF0378CyQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWq8R0QtDxNRkask3kipnSXmOzR_TjV3Hy0bkF0378CyQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 Oct 2023 13:37:29 +0100
Message-ID: <CA+V-a8vcpMuwwSakBD_8HRueFatkPew40_LThv1yjxi2=5f3+w@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: renesas: rzfive-smarc: Enable the blocks
 which were explicitly disabled
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_053824_946114_28B3761E 
X-CRM114-Status: GOOD (  22.99  )
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

SGkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIE9jdCAzLCAyMDIz
IGF0IDE6MjjigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3
cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPgo+IE9u
IEZyaSwgU2VwIDI5LCAyMDIzIGF0IDI6MDfigK9BTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2Vu
Z2dAZ21haWwuY29tPiB3cm90ZToKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBOb3cgdGhhdCBub25jb2hlcmVu
dCBkbWEgc3VwcG9ydCBpcyBhZGRlZCBmb3IgUlovRml2ZSBTb0MgZW5hYmxlCj4gPiB0aGUgSVAg
YmxvY2tzIHdoaWNoIHdlcmUgZGlzYWJsZWQgb24gUlovRml2ZSBTTUFSQy4gTm93IHdpdGggdGhp
cwo+ID4gcGF0Y2ggd2UgZ2V0IHN1cHBvcnQgZm9yIHRoZSBiZWxvdyBwZXJpcGhlcmFsczoKPiA+
ICogRE1BQwo+ID4gKiBTREhJCj4gPiAqIFVTQgo+ID4gKiBSU1BJCj4gPiAqIFNTSQo+Cj4gYW5k
IEV0aGVybmV0PyA7LSkKPgpPb3BzLCBJIG1pc3NlZCB0aGF0IQoKPiA+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
Pgo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPgo+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2Ni43LCB3aXRoICJF
dGhlcm5ldCIgYWRkZWQuCj4KVGhhbmtzIGZvciB0YWtpbmcgY2FyZSBvZiBpdC4KCkNoZWVycywK
UHJhYmhha2FyCgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQKPgo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
