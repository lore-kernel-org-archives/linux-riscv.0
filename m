Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26282C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RM55ztSVKTI3aYYW6XG4cWPkJff2DjV/FiURJAhh1s=; b=sbnXsAZU151hfF
	+UN7KLNQMsRXaixq5287WhaffoyfRCJiZprx/q9KNMMsNvno8ArgM10/sqCEq6XrkFtD0HXlZ4hR6
	h9v9r6nkOPSz0tGwk6x98x7sZHVljDnS2BwRmdYkM7vFL49KonQ1o/C9ZgW0m6uy9oU0k+Xe7gVul
	1QJUAgiwgZUvJKvXPFKGZwNjCMo8UVxRx6sWyoRBQAJns4djzuze9WgTjY3FS3KwIMzncCyBz3719
	KtTCHVPbiwptNkkL+IXQy6174rAIR3S8nwbsR6BffFqhfW1/Hkxw9YqgGc3Ej6n6uK4qs3rVUJIUM
	t7oyLFbLYEwJXck2CsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dlG-00AMvv-0r;
	Thu, 30 Nov 2023 09:55:10 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8dlD-00AMuf-0b
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 09:55:08 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5d34d85e610so4119747b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 01:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701338104; x=1701942904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kl3Cyom3VKHlW1GdXvF57049dn4ixhhiJNdSH5QXH4=;
        b=RQD+y5DKu1VGG9NaBmVxlox9Jy0j95NlfUYlXejEY3PsfG2SyP6Gcig/S8K8rstkhL
         aREqBjTwgroLNYI9FECzawoan0piIVo6oN+du6Oe8i8d7vq8yrxdJA4CmKdd7+3J27VN
         gyGIuL4yUfbQexZSrd36dI+4Le38yNhJKvAd0MU71nEvzeQqCuOQqUQ97ol2DIgCtivK
         rulP1LX/bmeHZW0+ecUNOYraw8pclNzEME2N/7q+xulHexqFdKSs8E3nK4IDRgLJyAkF
         itUACxinv59hZlkRZdyPWLozkY6fVcErt1mas7hVg2ZjT7oQhkG7p4AkG1jPVkDOH1mP
         lAyw==
X-Gm-Message-State: AOJu0Yzv2Jc0XMEzL4GrzRnfRvSc3X45qWpver65ruOJ3IlX+Uh2XYJx
	44toBwnoCcenlcQa5zuCpAD9JsmWNrR1rQ==
X-Google-Smtp-Source: AGHT+IG8+mgarVSy9NNvDdmHjwIWa9ql3e7/8tHGSAxFE/3dlYPBr3ixKD7TliQjj76oOunEjNYTCg==
X-Received: by 2002:a0d:fcc2:0:b0:59f:b0d9:5df2 with SMTP id m185-20020a0dfcc2000000b0059fb0d95df2mr22836517ywf.0.1701338104524;
        Thu, 30 Nov 2023 01:55:04 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g188-20020a0df6c5000000b005a7daa09f43sm255539ywf.125.2023.11.30.01.55.03
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:55:03 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5d3687a6574so2911187b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 01:55:03 -0800 (PST)
X-Received: by 2002:a81:92d7:0:b0:5ca:e49:c98b with SMTP id
 j206-20020a8192d7000000b005ca0e49c98bmr23203204ywg.8.1701338103524; Thu, 30
 Nov 2023 01:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
 <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com> <CA+V-a8tjy2Ttp_TbZT63PC_UY12J8FLcziCtef-D-jgw_CmKaA@mail.gmail.com>
In-Reply-To: <CA+V-a8tjy2Ttp_TbZT63PC_UY12J8FLcziCtef-D-jgw_CmKaA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 10:54:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcUXY+J36X6iG_jtT1mQhXFbEdF57oOT4DFZAridp2_A@mail.gmail.com>
Message-ID: <CAMuHMdVcUXY+J36X6iG_jtT1mQhXFbEdF57oOT4DFZAridp2_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_015507_229236_3603FC58 
X-CRM114-Status: GOOD (  26.08  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgOTo0OOKAr0FNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBOb3Yg
MjksIDIwMjMgYXQgMzozMuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjksIDIwMjMgYXQgMzo0NOKAr1BNIExhZCwg
UHJhYmhha2FyCj4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBP
biBUdWUsIE9jdCAxNywgMjAyMyBhdCAxMTo0N+KAr0FNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGludGVuZHMg
dG8gaW5jb3Jwb3JhdGUgdGhlIGFic2VudCBwb3J0IHBpbnMgUDE5IHRvIFAyOCwKPiA+ID4gPiB3
aGljaCBhcmUgZXhjbHVzaXZlbHkgYXZhaWxhYmxlIG9uIHRoZSBSWi9GaXZlIFNvQy4KPiA+ID4g
Pgo+ID4gPiA+IENoZWVycywKPiA+ID4gPiBQcmFiaGFrYXIKPiA+ID4gPgo+ID4gPiA+IFJGQyAt
PiB2MjoKPiA+ID4gPiAqIEZpeGVkIHJldmlldyBjb21tZW50cyBwb2ludGVkIGJ5IEdlZXJ0ICYg
QmlqdQo+ID4gPiA+Cj4gPiA+ID4gUkZDOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMwNjMwMTIwNDMzLjQ5NTI5LTMtcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tL1QvCj4gPiA+ID4KPiA+ID4gPiBMYWQgUHJhYmhha2FyICgzKToKPiA+ID4gPiAgIHBpbmN0
cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbiBSWkcyTF9HUElPX1BPUlRfUEFD
SygpCj4gPiA+ID4gICAgIG1hY3JvCj4gPiA+ID4gICBwaW5jdHJsOiByZW5lc2FzOiBwaW5jdHJs
LXJ6ZzJsOiBBZGQgdGhlIG1pc3NpbmcgcG9ydCBwaW5zIFAxOSB0byBQMjgKPiA+ID4gPiAgIHJp
c2N2OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0M2Y6IFVwZGF0ZSBncGlvLXJhbmdlcyBwcm9wZXJ0
eQo+ID4gPiA+Cj4gPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNm
LmR0c2kgfCAgIDQgKwo+ID4gPiA+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6
ZzJsLmMgICAgIHwgMjYzICsrKysrKysrKysrKysrKysrKy0tCj4gPiA+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjQyIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+IEdl
bnRsZSBwaW5nLgo+ID4KPiA+IEFzIHRoZSBrZXJuZWwgdGVzdCByb2JvdCByZXBvcnRlZCBhIGJ1
aWxkIGlzc3VlIGZvciBQQVRDSCAxLzMsIEkgaGFkCj4gPiByZW1vdmVkIHRoaXMgc2VyaWVzIGZy
b20gbXkgcmV2aWV3IHF1ZXVlLgo+IFN0cmFuZ2UgcGF0Y2h3b3JrIHN0YXR1cyBkaWRudCBtZW50
aW9uIGl0IGFzICJyZWplY3RlZCIuCgpBY3R1YWxseSBJIGRvIG5vdCB1c2UgcGF0Y2h3b3JrIHRo
YXQgbXVjaC4uLgoKPiA+IERvIHlvdSBzdGlsbCB3YW50IG1lIHRvIHJldmlldyB2Miwgb3IgZG8g
eW91IHdhbnQgdG8gc2VuZCBhIHYzIGZpcnN0Pwo+ID4KPiBObyB3b3JyaWVzLCBJJ2xsIHNlbmQg
YSB2MyBhbmQgd2UgY2FuIGdvIGZyb20gdGhlcmUuCgpPSy4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
