Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A5ECFB43F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBXcQjVWpUlo4ai5j19HtTOgr16+/qVVd0gOwrjkRTA=; b=bPu3Ong6cwz3ur
	QZFWN6MGiOU5q6D1PFO/U8LNshrueJi+QBb2rm/c1HfmXLLtlm91EhMV29KJjw01CqLUutuvmxQp7
	wKGOH6c/P6Pt4r0/2ZReNv6R/zTSKmGdofmeg4NZ2yqYarQ+WLkGI+USGLLqixHi7A8XSyhUwR5nx
	ZmoWM55UTCf2n0/oDpI0Vh7bMad6XFgc8JLH+wzqEVfxA+kOxvhwu4mQReser3Pbg3SUMfU4xh4pW
	6g9b2Uqfsy+22Xz3aTDH88EreplBvbJTy8CbjqZGoot4gzHTfsiep6wz0Uqge0PMHCaf6cXn3+qcZ
	KnV4NPBViFKGgvlIXLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmTf-00000002G84-0hor;
	Mon, 07 Oct 2024 12:04:39 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmTc-00000002G7c-1aWX
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 12:04:37 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2e41bd08bso12551987b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 05:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302674; x=1728907474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHR+VjwhqLd7anH5JbP5AfAXaIeHrCmlq5Jd4+j8LMo=;
        b=vUBVsDmOAI9XWTuEFfQB5cTHBaenHJinC3g4JL2tZKtZexHYhUsJIO8fMRTPvoW7jJ
         gip41t84dHMGl6MzEbcuwr6DLoT+GbgdX5pdYSoNnHvcs1Otr/6wqI8q3lfW6vHDmSuQ
         Br0iNaHjNZPyygB7JyovMfxiKdCj2aRVRKUg3s8Q+JMw3qJPTBKHtCODJ8Crr1xJsw7b
         nFVDobjgw+IApO0yhy9Fd3GxXP4nqjDDXAvS2o4mWlsTV2DM62Tx693XBOf4OPsfAuYz
         z6Ra1RDQYID47o/Xo8BTHb7Ulvm+dX6f2Lw0LKyYNIchNYjUZwH6WvW/F7Xb6oGhgP2k
         nkXA==
X-Forwarded-Encrypted: i=1; AJvYcCUVs9ka9wIBjlLnBanTsG+O3Wz6v2msHhqTrq+aHurcbxjHPElbvDlkZKXfTBcDfXu2sCz8e1w1RQxfQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4jsEjjRFkNi+PAVJ2k4HVG7SUfqEQcTUpnvNTskmAkwckUvIQ
	CE3cahwYcExlSyDWFEcQwoDrKGF2j29KEThSXToaUdl0rujlmS1VVn3fpTCR
X-Google-Smtp-Source: AGHT+IG8odMdpHH2Smo2L7wmwS4z1Ofh+OUJyskZ6C5MGGqWv5la2NFaCdtV3jyOQx1Rqvl/zzfKhQ==
X-Received: by 2002:a05:690c:ec5:b0:6e2:c13e:208b with SMTP id 00721157ae682-6e2c6fdeb41mr100111867b3.8.1728302673791;
        Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d927f55csm10075117b3.47.2024.10.07.05.04.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e214c3d045so31849587b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Oct 2024 05:04:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2CQv5wO2yiuzEScujAqCjV3Bv1FaKFEw8sVK94C/NehkwgnjvBMPNywAIj1rGYP7bjFyf+BAXyMDnMA==@lists.infradead.org
X-Received: by 2002:a05:690c:2a41:b0:699:7d04:c7b4 with SMTP id
 00721157ae682-6e2c7295014mr63104137b3.31.1728302673050; Mon, 07 Oct 2024
 05:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com> <20241004173235.74307-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241004173235.74307-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:04:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiHAfZ8=USSiC+mwG7czcBHizCc16GMmrJ0R6EUNihdQ@mail.gmail.com>
Message-ID: <CAMuHMdWiHAfZ8=USSiC+mwG7czcBHizCc16GMmrJ0R6EUNihdQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_050436_437226_C00DA39E 
X-CRM114-Status: GOOD (  15.83  )
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

T24gRnJpLCBPY3QgNCwgMjAyNCBhdCA3OjMy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToKPiBFbmFibGUgUmVuZXNhcyBhdDI1cWwxMjhhIGZsYXNoIGNv
bm5lY3RlZCB0byBRU1BJMC4gQWxzbyBkaXNhYmxlCj4gdGhlIG5vZGUgZnJvbSByemZpdmUtc21h
cmMtc29tIGFzIGl0IGlzIHVudGVzdGVkLgo+Cj4gVGVzdGVkIHRoZSBmbGFzaCBieSBmbGFzaGlu
ZyBib290bG9hZGVyczoKPiBmbGFzaF9lcmFzZSAvZGV2L210ZDAgIDAgMAo+IGZsYXNoX2VyYXNl
IC9kZXYvbXRkMSAgMCAwCj4gbXRkX2RlYnVnIHdyaXRlIC9kZXYvbXRkMCAwICR7QkwyX0ZJTEVf
U0laRX0gJHtCTDJfSU1BR0V9Cj4gbXRkX2RlYnVnIHdyaXRlIC9kZXYvbXRkMSA1MTIgJHtGSVBf
RklMRV9TSVpFfSAke0ZJUF9JTUFHRX0KPgo+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiB2NC0+djU6Cj4gICogVXBkYXRlZCBibDIg
c2l6ZSB0byAweDFkMDAwCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4KaS5lLiB3aWxsIHF1ZXVlIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY2
LjEzLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
