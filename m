Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA1CC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubR/5hn2wiH4FBDGauXbKqJsUQqdtqj5AAKp11lUKNA=; b=fgVHvufLGqY759
	nbyineIZ4PKEkAoJhBJd7k/sUvRUIw1VwRZeJcrXiGLa/wGUUj8nqmwIZyv9bmk4502mUN39soN4b
	ZUEzY8swzpUADgcS2Pt35F8TY8Tu9wqRVCFnegXYC3GaShZByXzmi94BIY0OwQDxN9LzqQQdC3vhi
	X6KbJ7VkxlZbLGgphruW+MWwguQ1HwQArOFNiVHttiIM2zgzGQdJsiIfCDGyqytpdMMf1MY2arHL+
	CqCqev21S4H9JdjqxdDMiDuGSeUjx8DoWJspM4SW1sIuCGR0G7IyPEX2zYLycxT0sb77zCWBpfVgg
	dZf9HqYOX5NIl0V7WwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayv2-00000002YgD-49K1;
	Fri, 16 Feb 2024 14:10:24 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rayv0-00000002Yeb-1ufL
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:10:24 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3650b558a8cso1985225ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092618; x=1708697418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW9Q5Vje3u6JbOgMeYVD/UJCDJh5KQkLlQ9cs+fUFoQ=;
        b=SeeAmauxj5fJ4trXYX4WRbxok3cR583QfQdOLxMVKRGUqelGo8xahZXEjNNluELgJk
         5g+XeB9HLuJXfqFONlMWZ/3MtUy+vL26/9EhX6uAKFK6WrB9Rh+pV/wT8X3m9cGILgzE
         J8YsEPF6SSohboytH/U7Af86I28nfHWTKbFQZINCD4H7rx0oUrEP2t5sNRc11nMU0MN3
         anhkG/R9JiivtuSPlFPIgzq8KIS7BwLDr/CUde64vYeO/LFg/3YQmSFLHQLRtCO9TlV7
         heE02jJSnOC33TogXSD4e2PMWxRtx9NwcgjJXpKWja2y5SuWMC5CxFtLrOmlCsJhXa/w
         uJxw==
X-Forwarded-Encrypted: i=1; AJvYcCXJrVWx4y4axNwP+xUSwGQt9iMYEmVgFGQtorpt/xpDVPHXKphY/U6UklWf0R9FR8TKiiZPiGhlI9gtFhvjL7CqmmEV9A3ACD059H8EQYjL
X-Gm-Message-State: AOJu0YwNhO4noGMbwcPlzNmwhAjacIIsl3xmfOfCqmHz6W67eE6DByxX
	O7wuRcWZ50of8CuU//Q2j71bMtLDqG0dEjAE4vV7Kb+mB+P1HZXvMlHt1Ds5s9E=
X-Google-Smtp-Source: AGHT+IE3bKv9gSt7yuA4gNPRH/3FIidc6LdMvFnhuzTijeQEFXDn8INSWKTWNqLzSBvjH9FLMU2qGw==
X-Received: by 2002:a92:de07:0:b0:363:e7c8:2180 with SMTP id x7-20020a92de07000000b00363e7c82180mr1808039ilm.12.1708092618021;
        Fri, 16 Feb 2024 06:10:18 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id c2-20020a81df02000000b00604a324fc41sm335901ywn.146.2024.02.16.06.10.17
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:10:17 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so2139466276.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRZ0ZQZ4GyKB3kqQNEQ5aoUexNnOXyJ9c2U2mgKD4yT6tdLRtDPyvfjp/A1lKtZXAYnfmJoMHeROPtkA2cMCAqEM/Q2tdqXP12BS6BD6u1
X-Received: by 2002:a5b:ed0:0:b0:dbd:120e:f337 with SMTP id
 a16-20020a5b0ed0000000b00dbd120ef337mr4834256ybs.30.1708092616773; Fri, 16
 Feb 2024 06:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:10:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
Message-ID: <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
Subject: Re: [PATCH 10/17] clk: renesas: r9a08g045: Add support for power domains
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061022_529271_2F640139 
X-CRM114-Status: GOOD (  17.64  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0NOKAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gSW5zdGFudGlhdGUgcG93ZXIgZG9t
YWlucyBmb3IgdGhlIGN1cnJlbnRseSBlbmFibGVkIElQcyBvZiBSOUEwOEcwNDUgU29DLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVz
YXMuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5l
c2FzL3I5YTA4ZzA0NS1jcGcuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ1
LWNwZy5jCj4gQEAgLTI0MCw2ICsyNDAsMjggQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBy
OWEwOGcwNDVfY3JpdF9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gewo+ICAgICAgICAgTU9EX0NM
S19CQVNFICsgUjlBMDhHMDQ1X0RNQUNfQUNMSywKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJ6ZzJsX2NwZ19wbV9kb21haW5faW5pdF9kYXRhIHI5YTA4ZzA0NV9wbV9kb21haW5zW10g
PSB7Cj4gKyAgICAgICBERUZfUEQoImFsd2F5cy1vbiIsICAgICBSOUEwOEcwNDVfUERfQUxXQVlT
X09OLCAwLCAwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlpHMkxfUERfRl9Q
QVJFTlQgfCBSWkcyTF9QRF9GX0FMV0FZU19PTiksCj4gKyAgICAgICBERUZfUEQoImdpYyIsICAg
ICAgICAgICBSOUEwOEcwNDVfUERfR0lDLCBNU1RPUChBQ1BVLCBCSVQoMykpLCBQV1JETihJUDEs
IDIpLAoKTXkgZG9jcyBkb2N1bWVudCBvbmx5IGJpdCAwIG9mIHRoZSBDUEdfQlVTX0FDUFVfTVNU
T1AgcmVnaXN0ZXIuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlpHMkxfUERf
Rl9BTFdBWVNfT04pLAo+ICsgICAgICAgREVGX1BEKCJpYTU1IiwgICAgICAgICAgUjlBMDhHMDQ1
X1BEX0lBNTUsIE1TVE9QKFBFUklfQ1BVLCBCSVQoMTMpKSwgUFdSRE4oSVAxLCAzKSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJaRzJMX1BEX0ZfQUxXQVlTX09OKSwKPiArICAg
ICAgIERFRl9QRCgiZG1hYyIsICAgICAgICAgIFI5QTA4RzA0NV9QRF9ETUFDLCBNU1RPUChSRUcx
LCBHRU5NQVNLKDMsIDApKSwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJa
RzJMX1BEX0ZfQUxXQVlTX09OKSwKPiArICAgICAgIERFRl9QRCgiZGRyIiwgICAgICAgICAgIFI5
QTA4RzA0NV9QRF9ERFIsIE1TVE9QKFBFUklfRERSLCBCSVQoMSkpLCBQV1JETihJUDIsIDApLAoK
T25seSBCSVQoMSk/IE15IGRvY3Mgc3VnZ2VzdCBHRU5NQVNLKDEsIDApLgoKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFJaRzJMX1BEX0ZfQUxXQVlTX09OKSwKPiArICAgICAgIERF
Rl9QRCgidHpjZGRyIiwgICAgICAgIFI5QTA4RzA0NV9QRF9UWkNERFIsIE1TVE9QKFRaQ0REUiwg
R0VOTUFTSygyLCAwKSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQV1JETihJ
UDIsIDEpLCBSWkcyTF9QRF9GX0FMV0FZU19PTiksCj4gKyAgICAgICBERUZfUEQoIm90ZmRlX2Rk
ciIsICAgICBSOUEwOEcwNDVfUERfT1RGREVfRERSLCAwLCBQV1JETihJUDIsIDIpLCBSWkcyTF9Q
RF9GX0FMV0FZU19PTiksCgpNU1RPUChQRVJJX0NQVTIsIEJJVCgyKSk/Cgo+ICsgICAgICAgREVG
X1BEKCJzZGhpMCIsICAgICAgICAgUjlBMDhHMDQ1X1BEX1NESEkwLCBNU1RPUChQRVJJX0NPTSwg
QklUKDApKSwgUFdSRE4oSVAxLCAxMyksIDApLAo+ICsgICAgICAgREVGX1BEKCJzZGhpMSIsICAg
ICAgICAgUjlBMDhHMDQ1X1BEX1NESEkxLCBNU1RPUChQRVJJX0NPTSwgQklUKDEpKSwgUFdSRE4o
SVAxLCAxNCksIDApLAo+ICsgICAgICAgREVGX1BEKCJzZGhpMiIsICAgICAgICAgUjlBMDhHMDQ1
X1BEX1NESEkyLCBNU1RPUChQRVJJX0NPTSwgQklUKDExKSksIFBXUkROKElQMSwgMTUpLCAwKSwK
PiArICAgICAgIERFRl9QRCgiZXRoMCIsICAgICAgICAgIFI5QTA4RzA0NV9QRF9FVEhFUjAsIE1T
VE9QKFBFUklfQ09NLCBCSVQoMikpLCBQV1JETihJUDEsIDExKSwgMCksCj4gKyAgICAgICBERUZf
UEQoImV0aDEiLCAgICAgICAgICBSOUEwOEcwNDVfUERfRVRIRVIxLCBNU1RPUChQRVJJX0NPTSwg
QklUKDMpKSwgUFdSRE4oSVAxLCAxMiksIDApLAo+ICsgICAgICAgREVGX1BEKCJzY2lmMCIsICAg
ICAgICAgUjlBMDhHMDQ1X1BEX1NDSUYwLCBNU1RPUChNQ1BVMiwgQklUKDEpKSwgMCwgMCksCj4g
K307Cj4gKwoKVGhlIHJlc3QgTEdUTS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
