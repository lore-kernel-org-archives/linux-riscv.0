Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B4ECAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXDPezVXm8wpx3Euk6QvLQLx1xikzHYtw/VwmtN6re8=; b=ehviHcX8KgTFu+
	bCDadjxSIzvASMTwDKfQWgo6qdV5zGsMXsNI3u6Q0597qanF1tteIryNy/uepj/VXsqGyZUYTRAyp
	vfSzfJhOWxOLNvA8b2+5Su6yKv49FqLw9xRxriLpk4+quSDSysmxnlz8/tP4oKbCvqTqaaiz1M+af
	pA9C7dEzXkpk768+tqVqTAxS52vSkboP/uWVaF3QTvetZcRjt0iV3ZnhBo1tFjmwFeAw2JkSznm2Z
	8pqTyUhbW/z7D0N97mWeJ/K7ggXSpvC01fvj9GHhahx/jt6UPyvsJWkNg6PsBw10xeC6xglLegpIR
	gHIdf2jcdjM+2QWqjdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMG6-0000000E2Da-22VC;
	Sat, 13 Sep 2025 09:09:26 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxMG4-0000000E2BK-0wpB
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 09:09:25 +0000
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336b908cbaaso23792551fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 02:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757754559; x=1758359359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4M9q1sBtoJdbch2HX+0f+gEgUbmufQuxtOpAtokmLRw=;
        b=VqLdGc8sEvefb50LXqcDYVVq1eZEZTBAKgbHh/tjb7cEHN9VXc88SG9BZ3OkpGCJan
         Sm1WOHMuq8JZqJ8+oAE5r0Vlp0c8Ek/WoX/tAD4KLwWEcVkgAfSSwKG7FLjojgiqS9lE
         JCIjMaTcsTqsjQVYCrJs3P1mv7OQIyS7QqULDV0B+sYozarv+5ABpNECa91RfXuV6sy5
         bY09NJO9SkQ9J1Yxx09Bg0tFbAsQ52KAnrbmXnyfD/Mz30afBB+UUCUH1qLPhXD+Dy/K
         iqVgwWVFy1C+8SzH2ZCcZoPLNxmbLviKQYpvx/V1FB6tVq+6qYnoJdLisixC3gM3dlQx
         fDwg==
X-Forwarded-Encrypted: i=1; AJvYcCVcaZENONn9ptRilVYXLywbvzG2EuR/RHi6XcRL4uw01BxqpFJIKsijcm9Nc8wSxZXzb3o20dcNf2u5LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4UL6ye/d5458wl/GK15UvKrrZt7M6sBXjiPToOIn2/pMa0dQM
	FdDJhQgHUkAcXNZ+HzMRyQyNJQfgNEh5Sdws/CUC1Vc8uFQlzfsagJ5qfIRV0fk/
X-Gm-Gg: ASbGncsB5RgKxFA+HnS0tfTWTpfniXltxTjZVsJ4M1DwMoFd3fYIO3soUxKVFiHAyzF
	3JoDieqMIcDHxQ3z686ETa0OArfBYtadqsVZkr3wDL4bE8bftAUqL/A4MWcd1hxtv3UiM2DProM
	m4hwg4jRw0EzS2ACrwwAzWwnrj9hp4eik4gS4PlEDza0aSSqd/CbrzKCGazfp3dHU0cQs4EOgBP
	J5cuBV/Do9NROl8Bm4u6EAkASCFR4QzdcJJgbpdbJ0N8yXG6w53Qja+ISy9mQR3pWej5rw7WiVY
	KibEJGp/1tQn4iEcxoUNm91CEFZS272nEVIE5vMturV+5+3R47yTEl6lv0TaKPfB61esvchbqvC
	Uy5/pyv8+yllhthuSoiWu3Hzk3S8mGOn5Gu6vR9KjmFmaHx4SYJoIbio=
X-Google-Smtp-Source: AGHT+IH/nc9iHr4NCL/2a0RN0T/PstAAQwlBfXkQkJ15Quqkmhvh+oFXQH8j9TBesNA+Ix3q4PDtwQ==
X-Received: by 2002:a2e:a988:0:b0:352:46d5:e541 with SMTP id 38308e7fff4ca-35246d5e92amr12862291fa.0.1757754558877;
        Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f163f4c52sm12935751fa.22.2025.09.13.02.09.18
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-351f5cec42dso10572061fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 02:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZDwXHCbYZseUCsIC732YQkSkqjAFxk5GCzlWsLAd531/qCdAuovdUnoIscOjhb8tQ+v3EnTPvqtN8ng==@lists.infradead.org
X-Received: by 2002:a2e:bc13:0:b0:336:ed88:f3b1 with SMTP id
 38308e7fff4ca-3513a042fe1mr16058841fa.7.1757754557881; Sat, 13 Sep 2025
 02:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250831162536.2380589-1-lukas.schmid@netcube.li> <20250831162536.2380589-3-lukas.schmid@netcube.li>
In-Reply-To: <20250831162536.2380589-3-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:09:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
X-Gm-Features: Ac12FXypVtt3w9R-5_aPJlDVL7mEoeRUisSDiiTl2jorYCCDiG8XoTwLb6M_2sQ
Message-ID: <CAGb2v67fwg0x8HNE6Dp-M-LDyon1YipeonqvSvSY-BFH+f4E9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
 required by NetCube Systems Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_020924_274726_6291B353 
X-CRM114-Status: GOOD (  13.39  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMSwgMjAyNSBhdCAxMjoyNuKAr0FNIEx1a2FzIFNjaG1pZCA8bHVrYXMuc2No
bWlkQG5ldGN1YmUubGk+IHdyb3RlOgo+Cj4gQWRkZWQgdGhlIGZvbGxvd2luZyBwaW5jdHJsJ3Mg
dXNlZCBieSB0aGUgTmV0Q3ViZSBTeXN0ZW1zIE5hZ2FtaSBTb00KPiAgICogaTJjMl9waW5zCj4g
ICAqIGkyYzNfcGlucwo+ICAgKiBpMnMxX3BpbnMsIGkyczFfZGluX3BpbnMsIGkyczFfZG91dF9w
aW5zCj4gICAqIHNwaTFfcGlucywgc3BpMV9ob2xkX3Bpbiwgc3BpMV93cF9waW4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEx1a2FzIFNjaG1pZCA8bHVrYXMuc2NobWlkQG5ldGN1YmUubGk+Cj4gLS0tCj4g
IC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSAgICB8IDQ4ICsrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5k
dHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+
IGluZGV4IGU0MTc1YWRiMDI4ZGEuLmMwMDk5NmQ2Mjc1YzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiBAQCAtNzgsNiAr
NzgsMzYgQEAgZHNpXzRsYW5lX3BpbnM6IGRzaS00bGFuZS1waW5zIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gImRzaSI7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgfTsKPgo+ICsgICAgICAgICAgICAgICAgICAgICAgIC9vbWl0LWlmLW5vLXJlZi8KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpMmMyX3BpbnM6IGkyYzItcGlucyB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlBEMjAiLCAiUEQyMSI7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpMmMyIjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAvb21pdC1pZi1uby1y
ZWYvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaTJjM19waW5zOiBpMmMzLXBpbnMgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJQRzEwIiwgIlBHMTEiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiaTJjMyI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgfTsKCkJlY2F1c2UgaTJjMiBhbmQgaTJjMyBoYXZlIG11bHRpcGxl
IG9wdGlvbnMsIHRoZXkgc2hvdWxkIGJlIG5hbWVkCmFwcHJvcHJpYXRlbHksIGxpa2UgaTJjMi1w
ZC1waW5zIGFuZCBpMmMzLXBnLXBpbnMKCj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIC9v
bWl0LWlmLW5vLXJlZi8KPiArICAgICAgICAgICAgICAgICAgICAgICBpMnMxX3BpbnM6IGkyczEt
cGlucyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlBHMTIiLCAi
UEcxMyI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpMnMx
IjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAvb21pdC1pZi1uby1yZWYvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaTJzMV9kaW5f
cGluczogaTJzMS1kaW4tcGlucyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
aW5zID0gIlBHMTQiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24g
PSAiaTJzMV9kaW4iOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIC9vbWl0LWlmLW5vLXJlZi8KPiArICAgICAgICAgICAgICAgICAgICAg
ICBpMnMxX2RvdXRfcGluczogaTJzMS1kb3V0LXBpbnMgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGlucyA9ICJQRzE1IjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZ1bmN0aW9uID0gImkyczFfZG91dCI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsK
ClNob3VsZCBiZSAqZGluMCogYW5kICpkb3V0MCosIHNpbmNlIHlvdSBoYXZlIGRpbjEgYW5kIGRv
dXQxIG9uIHRoZSBzYW1lIHBpbnMKYnV0IHN3YXBwZWQgYXJvdW5kLgoKCkNoZW5ZdQoKPiArCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgL29taXQtaWYtbm8tcmVmLwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGxjZF9yZ2I2NjZfcGluczogbGNkLXJnYjY2Ni1waW5zIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEQwIiwgIlBEMSIsICJQRDIiLCAiUEQzIiwg
IlBENCIsICJQRDUiLAo+IEBAIC0xMjYsNiArMTU2LDI0IEBAIHNwaTBfcGluczogc3BpMC1waW5z
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gInNwaTAiOwo+
ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAgICAgICAgICAgICAv
b21pdC1pZi1uby1yZWYvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3BpMV9waW5zOiBzcGkx
LXBpbnMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGlucyA9ICJQRDEwIiwg
IlBEMTEiLCAiUEQxMiIsICJQRDEzIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZ1bmN0aW9uID0gInNwaTEiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIC9vbWl0LWlmLW5vLXJlZi8KPiArICAgICAgICAgICAgICAg
ICAgICAgICBzcGkxX2hvbGRfcGluOiBzcGkxLWhvbGQtcGluIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBpbnMgPSAiUEQxNCI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmdW5jdGlvbiA9ICJzcGkxIjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAvb21pdC1pZi1uby1yZWYvCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgc3BpMV93cF9waW46IHNwaTEtd3AtcGluIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEQxNSI7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmdW5jdGlvbiA9ICJzcGkxIjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9
Owo+ICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAvb21pdC1pZi1uby1yZWYvCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgdWFydDFfcGc2X3BpbnM6IHVhcnQxLXBnNi1waW5zIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEc2IiwgIlBHNyI7Cj4gLS0KPiAy
LjM5LjUKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
