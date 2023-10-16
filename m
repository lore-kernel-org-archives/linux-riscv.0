Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E3CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3Q7XgOdk6oiORBAzwef7tK1ehDX9x8+i8yLnk0972A=; b=EyaiaK7p5FZWWr
	8L3rJuKZaNPqo987xoRG+KUKkxhePENl+sNHFOEMX/qub1ThzuS3xBPv/yAiAAIUvLZUgP5X1MDHi
	L1FwK/9sWqJIXETNH3CpSp6tOztRHl93WgW2NuhMUHjCZnJhrE6oGHp4bruzWQYoCpkhIb2e//nuT
	pEVXU0VwUxcPDRNtc6AfOId90DTocE5kmrTLRoU1THljkymhesfzePSCHYOibvzOB2feK23QUEOca
	cX7YLE53U/5iaekjrr82yhc7OeNNtXKxValkwUTnwsKeIDIigzfvOErRzC/fM/0DoYJjQsY55Gahm
	h3K6Jj8pKuJISjL+umwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHqz-008cXg-0O;
	Mon, 16 Oct 2023 07:17:29 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHqt-008cUv-1S
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 07:17:27 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a82f176860so29813957b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 00:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697440636; x=1698045436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/hJao9N8LKEsymdGe3XcTumREOueGROCRui0e9bORI=;
        b=ZJ02sNKxcqrBUsFZqLP+c+JLeQGQp/s6bc8rJw8vHyEhDgwZSy8g0GZ6f+bilZOr39
         cZFVRb6RA18Y27G8/Bk1Nfv6rhaJNhg0sWgJ+bAPgkUy4M/ywqb2ZiOmt6/wiAhyXo7q
         pWLhClom5Fcrtgs6Z5UBvdGzMDXKG9GMAMImPv+Pt+ymamA4Ykt8t2v/3t2eeENyBLFE
         /OINz5l1+gynmWy4CVauCK2A69r3mpgfvWJNZbk/QFOgsszV9X4i5ryqo1Hu2Ca6vfXy
         42eHe9ZM5wBWRhkJlAme88TUYLEJokjpNrKJy86FHGeK00SGYJF5JBu0fIsHNMeAiXcp
         tk8Q==
X-Gm-Message-State: AOJu0Yy3E1z9ClzPcoG0AAPHizv1ZPZVIx5d9Z+Nca1w8nYl5GEpDGZb
	6VMxPZuOHI0ZA3g2plfONyCs7geljNfBwg==
X-Google-Smtp-Source: AGHT+IGivDmRLPJ9aMBzKmMrkZYeN0HDPArMR1Gfsi0gfT8CsQFy55b/WI3q0taSapndoH1TrT8RDg==
X-Received: by 2002:a5b:18f:0:b0:d9a:3dbd:1f0 with SMTP id r15-20020a5b018f000000b00d9a3dbd01f0mr18868514ybl.21.1697440636190;
        Mon, 16 Oct 2023 00:17:16 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id p125-20020a257483000000b00d8674371317sm2495798ybc.36.2023.10.16.00.17.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:17:14 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a82f176860so29813597b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 00:17:14 -0700 (PDT)
X-Received: by 2002:a81:47c6:0:b0:59b:1f6d:1958 with SMTP id
 u189-20020a8147c6000000b0059b1f6d1958mr31275633ywa.46.1697440633941; Mon, 16
 Oct 2023 00:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231009-smog-gag-3ba67e68126b@wendy> <ZSzTqgVNSD9Q7V6H@APC323>
In-Reply-To: <ZSzTqgVNSD9Q7V6H@APC323>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2023 09:17:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV3bJmqWysPak4085ZXCn7x7fZOnfnceGxWrdC7cB3pw@mail.gmail.com>
Message-ID: <CAMuHMdUV3bJmqWysPak4085ZXCn7x7fZOnfnceGxWrdC7cB3pw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.indradead.org, 
	conor@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_001723_489762_40C558F8 
X-CRM114-Status: GOOD (  22.73  )
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

SGkgWXUtQ2hpZW4sCgpPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCA4OjEw4oCvQU0gWXUtQ2hpZW4g
UGV0ZXIgTGluCjxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiBPbiBNb24sIE9jdCAw
OSwgMjAyMyBhdCAxMDozNzo0OEFNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBDb252
ZXJ0IHRoZSBSWi9GaXZlIGRldmljZXRyZWVzIHRvIHVzZSB0aGUgbmV3IHByb3BlcnRpZXMKPiA+
ICJyaXNjdixpc2EtYmFzZSIgJiAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLgo+ID4gRm9yIGNvbXBh
dGliaWxpdHkgd2l0aCBvdGhlciBwcm9qZWN0cywgInJpc2N2LGlzYSIgcmVtYWlucy4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQz
Zi5kdHNpIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gPiBpbmRl
eCBiMDc5NjAxNWUzNmIuLmViMzAxZDhlYjJiMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+IEBAIC0yNCw2ICsyNCw5IEBAIGNwdTA6
IGNwdUAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwPjsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJp
c2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixp
c2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAi
emljc3IiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InppZmVuY2VpIiwgInppaHBtIjsKPgo+IFdlIGRvIGhhdmUgemlocG0sIGFuZCBPcGVuU0JJIGNh
biBhbHNvIHByb2JlIGl0cyBleGlzdGVuY2UuCj4KPiBCb290IEhBUlQgSVNBIEV4dGVuc2lvbnMg
IDogemlocG0KPiBCb290IEhBUlQgTUhQTSBJbmZvICAgICAgIDogNCAoMHgwMDAwMDA3OCkKClRo
YW5rIHlvdSwgSSBoYWRuJ3QgZGlnZXN0ZWQgdGhlIGZ1bGwgb3V0cHV0IGZyb20gT3BlblNCSSB5
ZXQsIGFuZApJIGNhbiBjb25maXJtIHRoaXMgaXMgcHJlc2VudCBpbiB0aGF0IG91dHB1dC4KCkFj
a2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
