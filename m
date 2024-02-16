Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C559C48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsKXdO8rLUHhzNXv6QIBTjmmDI2bDtYlwCk7NLbKZc8=; b=W0Q0/jf1i2OckZ
	6jOX4g2i6QQ32gyi6Qp3j7PFmNlmvMMVw9G7pp68HILJNMt/3kGK+KcFuEWkHHcS1W/RDC6syM5Bm
	oGV0ayMjvNHHdqTuZmm2cFNlpkCyv4r7LS2BNiDmoq4jUFXk2ibwAQRaTbETKGlZBRUJ5X78Qqpql
	3R6ceFgvAbdf5EkDjXDZNnmAukVz2STYSiFJO1jh5kXzv7B9o/m05jKkwTLddxoPCYQQziIRdhsCl
	Azt3hk8C3IPMkoZu+R9BaaQsR1ob7JhzcN2jZcJqJdmp5HnbV5EI1UBn11Ga/lvqxvwC0Bdyvk59k
	gkGTE0a+gwNPLcjyFoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raymr-00000002Vqj-3e0n;
	Fri, 16 Feb 2024 14:01:57 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raymp-00000002VpZ-1Eeb
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 14:01:56 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60777bcfed2so16153797b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092113; x=1708696913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOaw5LTfRS/Q6ec8RSqJC8wq4dxjMLwYAJ+OKRO1F48=;
        b=JxaD6QlmHiRrYBuwnmVt69YE1a5Ids0cIZD0A4CAlhbW8seYjknTtZbr+rhIfzhtzp
         fdKr628+dr5bWIWkimlCZ4HXVd5wVJAWV9h6cvS38jhPOxNZYC+sWVsRCTYZeuDqWpAN
         7l7tPMX7VvCNNJir4gJVJa+mTl3iXuqu/IQCXfXd+VvApCpYV8KZWH9tu6RykMx5v/lx
         6jHHcUGbmwMpWqVd3oq7RtyV2xPGa86Mzw/cx8TGZfHnzQn9ew1MsNg4XTzLRsbkIITV
         GbXCxw852XFBJA1eT0HDEn7eqw2aV2OxKL7x78m+jyiwbwL2q7jshVkeuFrbMJlDy/6q
         O4BA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4Qu/u9KNcvm1A3GKmn34+8+JknQ7ixSIZDCdOs1j5KFen9f2dRBblwO+6w+FMr3QPotzq0kod7jV9Sus+myQ4M7VuDkNovpdm7ISGs4m
X-Gm-Message-State: AOJu0YxG/YPnTcbRVUG2vfR6GuFS4Frp24UcEyHI2RQ6Jd8r9Vx2+VqL
	6fLyQxhj9USRUUWj4Tq/L77RLZZVbpGD6BiPJtkutvPLr2KyPpqTbJ3nh5M0YOY=
X-Google-Smtp-Source: AGHT+IHt7VuaCK86Q5zYSjIIcZ2DufFb4f+gCSiR0WNspYU6CdlkpWaCHfYy5sVZmiokQUZzy0ZWkw==
X-Received: by 2002:a0d:d5d7:0:b0:607:76c6:4ed9 with SMTP id x206-20020a0dd5d7000000b0060776c64ed9mr5668943ywd.41.1708092113205;
        Fri, 16 Feb 2024 06:01:53 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id c2-20020a81df02000000b00604a324fc41sm333096ywn.146.2024.02.16.06.01.52
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 06:01:52 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1994735276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 06:01:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8pCyMzyva9BZDWahB0+vxuQ7nsNOJ+Wr5ZPm61bo/jq3pGrLADap65949EyvkjtbblmPlaHxncz7RwUZK+6J/Ulv8ZdHgvKsffmZnQ4Xl
X-Received: by 2002:a05:6902:2501:b0:dc6:d7b6:cce9 with SMTP id
 dt1-20020a056902250100b00dc6d7b6cce9mr5776726ybb.57.1708092112512; Fri, 16
 Feb 2024 06:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com> <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 15:01:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
Message-ID: <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_060155_352309_9B9F5B99 
X-CRM114-Status: GOOD (  15.77  )
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

SGkgQ2xhdWRpdSwKCk9uIFRodSwgRmViIDgsIDIwMjQgYXQgMTo0M+KAr1BNIENsYXVkaXUgPGNs
YXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gd3JvdGU6Cj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQWRkIHBvd2VyIGRvbWFpbiBJRHMg
Zm9yIFJaL0cyVUwgKFI5QTA3RzA0MykgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBC
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgoKVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQoKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5YTA3ZzA0My1jcGcu
aAo+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcjlhMDdnMDQzLWNwZy5oCj4gQEAg
LTIwMCw1ICsyMDAsNTMgQEAKPiAgI2RlZmluZSBSOUEwN0cwNDNfQVg0NU1QX0NPUkUwX1JFU0VU
TiAgNzggICAgICAvKiBSWi9GaXZlIE9ubHkgKi8KPiAgI2RlZmluZSBSOUEwN0cwNDNfSUFYNDVf
UkVTRVROICAgICAgICAgNzkgICAgICAvKiBSWi9GaXZlIE9ubHkgKi8KPgo+ICsvKiBQb3dlciBk
b21haW4gSURzLiAqLwo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9BTFdBWVNfT04gICAgICAgICAw
Cj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX0dJQyAgICAgICAgICAgICAgIDEKCkFzIHRoaXMgZmls
ZSBpcyBzaGFyZWQgYmV0d2VlbiBSWi9HMlVMIGFuZCBSWi9GaXZlLCBSOUEwN0cwNDNfUERfR0lD
Cm5lZWRzIGFuICIvKiBSWi9HMlVMIE9ubHkgKi8iIGNvbW1lbnQKCj4gKyNkZWZpbmUgUjlBMDdH
MDQzX1BEX0lBNTUgICAgICAgICAgICAgIDIKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfTUhVICAg
ICAgICAgICAgICAgMwo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9DT1JFU0lHSFQgICAgICAgICA0
Cj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX1NZQyAgICAgICAgICAgICAgIDUKCkxpa2V3aXNlIGZv
ciB0aGUgZm91ciBhYm92ZS4KCj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX0RNQUMgICAgICAgICAg
ICAgIDYKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfR1RNMCAgICAgICAgICAgICAgNwo+ICsjZGVm
aW5lIFI5QTA3RzA0M19QRF9HVE0xICAgICAgICAgICAgICA4Cj4gKyNkZWZpbmUgUjlBMDdHMDQz
X1BEX0dUTTIgICAgICAgICAgICAgIDkKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfTVRVICAgICAg
ICAgICAgICAgMTAKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfUE9FMyAgICAgICAgICAgICAgMTEK
PiArI2RlZmluZSBSOUEwN0cwNDNfUERfV0RUMCAgICAgICAgICAgICAgMTIKPiArI2RlZmluZSBS
OUEwN0cwNDNfUERfU1BJICAgICAgICAgICAgICAgMTMKPiArI2RlZmluZSBSOUEwN0cwNDNfUERf
U0RISTAgICAgICAgICAgICAgMTQKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfU0RISTEgICAgICAg
ICAgICAgMTUKPiArI2RlZmluZSBSOUEwN0cwNDNfUERfSVNVICAgICAgICAgICAgICAgMTYKPiAr
I2RlZmluZSBSOUEwN0cwNDNfUERfQ1JVICAgICAgICAgICAgICAgMTcKPiArI2RlZmluZSBSOUEw
N0cwNDNfUERfTENEQyAgICAgICAgICAgICAgMTgKCkxpa2V3aXNlIGZvciB0aGUgdGhyZWUgYWJv
dmUuCgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TU0kwICAgICAgICAgICAgICAxOQo+ICsjZGVm
aW5lIFI5QTA3RzA0M19QRF9TU0kxICAgICAgICAgICAgICAyMAo+ICsjZGVmaW5lIFI5QTA3RzA0
M19QRF9TU0kyICAgICAgICAgICAgICAyMQo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TU0kzICAg
ICAgICAgICAgICAyMgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TUkMgICAgICAgICAgICAgICAy
Mwo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9VU0IwICAgICAgICAgICAgICAyNAo+ICsjZGVmaW5l
IFI5QTA3RzA0M19QRF9VU0IxICAgICAgICAgICAgICAyNQo+ICsjZGVmaW5lIFI5QTA3RzA0M19Q
RF9VU0JfUEhZICAgICAgICAgICAyNgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9FVEhFUjAgICAg
ICAgICAgICAyNwo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9FVEhFUjEgICAgICAgICAgICAyOAo+
ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9JMkMwICAgICAgICAgICAgICAyOQo+ICsjZGVmaW5lIFI5
QTA3RzA0M19QRF9JMkMxICAgICAgICAgICAgICAzMAo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9J
MkMyICAgICAgICAgICAgICAzMQo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9JMkMzICAgICAgICAg
ICAgICAzMgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0lGMCAgICAgICAgICAgICAzMwo+ICsj
ZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0lGMSAgICAgICAgICAgICAzNAo+ICsjZGVmaW5lIFI5QTA3
RzA0M19QRF9TQ0lGMiAgICAgICAgICAgICAzNQo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0lG
MyAgICAgICAgICAgICAzNgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0lGNCAgICAgICAgICAg
ICAzNwo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0kwICAgICAgICAgICAgICAzOAo+ICsjZGVm
aW5lIFI5QTA3RzA0M19QRF9TQ0kxICAgICAgICAgICAgICAzOQo+ICsjZGVmaW5lIFI5QTA3RzA0
M19QRF9JUkRBICAgICAgICAgICAgICA0MAo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9SU1BJMCAg
ICAgICAgICAgICA0MQo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9SU1BJMSAgICAgICAgICAgICA0
Mgo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9SU1BJMiAgICAgICAgICAgICA0Mwo+ICsjZGVmaW5l
IFI5QTA3RzA0M19QRF9DQU5GRCAgICAgICAgICAgICA0NAo+ICsjZGVmaW5lIFI5QTA3RzA0M19Q
RF9BREMgICAgICAgICAgICAgICA0NQo+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9UU1UgICAgICAg
ICAgICAgICA0Ngo+Cj4gICNlbmRpZiAvKiBfX0RUX0JJTkRJTkdTX0NMT0NLX1I5QTA3RzA0M19D
UEdfSF9fICovCgpJbiBhZGRpdGlvbiwgeW91IG5lZWQgZGVmaW5pdGlvbnMgZm9yIHRoZSBtb2R1
bGVzIHRoYXQgYXJlIG9ubHkKcHJlc2VudCBvbiBSWi9GaXZlLCBlLmcuCgogICAgI2RlZmluZSBS
OUEwN0cwNDNfUERfUExJQyAgICAgICAgICAgICAgIDQ3ICAgIC8qIFJaL0ZpdmUgT25seSAqLwoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
