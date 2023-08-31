Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A312C83F37
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mEihwyLI2gTiVU8FtJPnciNZeWvMwqXoocsXkCODqo=; b=C0Rsv/6v8ippF7
	P+mirpBA51Dr8+joeJl+SJ/+BuCZZ8rGy0MCkCb3/RlU+FjgJISB7dKjNlz9/zrS9+19oY3pGxdv7
	nE9jDZJX7L6JdVa0zJZH/T3ID/ycnZd0DWjb11DCgxuHXEXayed3PKiUtoL35Hkg/WxpjLAk+i7aQ
	hw/Nsgfe0c0Km4doW2rvjFitenvByQYC+Lh3ZYWiqrHgKmQ9SgwEXK9W/nIk8H/Uq3PsZmlalYB52
	XK9VC0mMw6OIBlDIZrv/IWErWjNI/uh9B30hxEnuN37kALCHLuzu+bxnx5KYguNl+X7BRGIfMEsSd
	wl7Rqo3Ut+rvm5U4Mnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblWi-00Fdng-2L;
	Thu, 31 Aug 2023 17:32:16 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblWc-00FdnC-0o
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:32:14 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bdc2f95f10so910723a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693503126; x=1694107926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOKwlYH7i1heNTXclgxSw4cfzqUBiYhvQ+nxifYOcyg=;
        b=YMr1rQqubNG5Oq40TFoSxfW8+ZjdFEvMe7Hi7aWLFGXuYetjRV+1DZSd1wlKg/vRiF
         kZdsaAMX8zdlYZOWZXsCLGTvvgMtzgzGnwVwqXAbWouN7m3oXSdIpfotTvyHIM7ESG6/
         NEHhEFsJcgNuH5lIkCn9/t6VWpyt1GN+BXkNhfivmAsQUYceljljnhrT9qlOU011Ndp7
         gV3ixn4x8du1c9QVDCBVGH/1Hs2g3nHJS+zUjfdQzhbRyU38djOM12A/xEPPSnOwZO1d
         /xDlFg4ItBk2dwnGB1AeKDp1C4Vt4boTRAEw2nVzsDCcgzHslghj9PGewMi94xPq+dlI
         waMQ==
X-Gm-Message-State: AOJu0YxD5RyFClSfVwcADoqChszAVL4KKXV7OF8pVmU3ieDm4wg7c9Uv
	rK2O4RIx6pdZTe/LFmeSalQFrSK4pZ5fpw==
X-Google-Smtp-Source: AGHT+IGAOgStQhIU5CVlDGSk06IWgpQC7RGsxdeN5/RD8z3T/R0cVNMXeC4b/CJVwOOr+zBkslS1LA==
X-Received: by 2002:a05:6358:2491:b0:139:e7db:3f3f with SMTP id m17-20020a056358249100b00139e7db3f3fmr6363718rwc.10.1693503125635;
        Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id v139-20020a814891000000b0058c55d40765sm540445ywa.106.2023.08.31.10.32.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d7d15e6884dso801000276.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 10:32:05 -0700 (PDT)
X-Received: by 2002:a25:cc01:0:b0:d7b:8d0c:43ef with SMTP id
 l1-20020a25cc01000000b00d7b8d0c43efmr380934ybf.37.1693503125177; Thu, 31 Aug
 2023 10:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com> <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 19:31:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
Message-ID: <CAMuHMdUXS6o5n9vg7ctd-69X2B5ZuKqcT1t3b1gUbEk2UuT0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 serial NOR flash
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_103210_608800_4686E9C0 
X-CRM114-Status: GOOD (  20.20  )
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

SGkgQmlqdSwKCk9uIFRodSwgQXVnIDMxLCAyMDIzIGF0IDg6MzbigK9BTSBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOgo+IEVuYWJsZSBSZW5lc2FzIGF0MjVxbDEy
OGEgZmxhc2ggY29ubmVjdGVkIHRvIFFTUEkwLiBBbHNvIGRpc2FibGUKPiB0aGUgbm9kZSBmcm9t
IHJ6Zml2ZS1zbWFyYy1zb20gYXMgaXQgaXMgdW50ZXN0ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gdjEtPnYyOgo+ICAq
IEVuYWJsZWQgNC1iaXQgdHggc3VwcG9ydAoKVGhhbmtzIGZvciB0aGUgdXBkYXRlIQoKPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJjLXNvbS5kdHNpCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJ1bC1zbWFyYy1zb20uZHRzaQo+IEBA
IC0xNzksNiArMTc5LDE4IEBAIGV0aDFfcGluczogZXRoMSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCgxOCwgNSwgMSk+OyAvKiBJUlE3ICovCj4gICAgICAg
ICB9Owo+Cj4gKyAgICAgICBxc3BpMF9waW5zOiBxc3BpMCB7Cj4gKyAgICAgICAgICAgICAgIHFz
cGkwLWRhdGEgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUVNQSTBfSU8wIiwg
IlFTUEkwX0lPMSIsICJRU1BJMF9JTzIiLCAiUVNQSTBfSU8zIjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+
ICsgICAgICAgICAgICAgICBxc3BpMC1jdHJsIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBw
aW5zID0gIlFTUEkwX1NQQ0xLIiwgIlFTUEkwX1NTTCI7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcG93ZXItc291cmNlID0gPDE4MDA+Owo+ICsgICAgICAgICAgICAgICB9Owo+ICsgICAgICAg
fTsKCkZyb20gdGhlIHYxIHJldmlldyBjb21tZW50czoKCj4gPiBJIGd1ZXNzIHRoZXJlIGlzIG5v
IG5lZWQgZm9yIHRoZSBzdWJub2RlcywgYXMgYWxsIHBpbnMgdXNlIHRoZSBzYW1lIHBvd2VyLQo+
ID4gc291cmNlIHZhbHVlPwo+Cj4gT0ssIHdpbGwgcmVtb3ZlIHN1Ym5vZGUuCgpPb3BzLi4uCgpU
aGUgcmVzdCBMR1RNLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
