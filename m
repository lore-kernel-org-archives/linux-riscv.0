Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C419C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iZxEAdUxntixvj0jSt3GEfUyUD+PRBSOw1DExvzcVg=; b=lOnnTUchf1LDCN
	ibr4o6K0RHs4ZLGq5kjV8B0VGkB6/k2IR3Qx5xu54/ALklHFvv5/mBpnTau0pdxGDYiu7TzjD0CFr
	JjNpFwrzG5mabM5C1KkQB8K1dL7F5yTrtMzanGBeA/g/Hsjx4sn3lDk0aA1nKXpyT1yaxhCx+bWmr
	NhpXNWpja0MwAkJhZkbtQxLUJzHjLeG4zbn6Lq53JGpB2TAACuEBYlsDh3VkHt16cnOCEep5SO8X8
	bMojaB1EutaDoKr7/EuU0m73KnMeAe8oeH32Zpo2dlP5XncJSbqXJX1GlZ9ftXqS68HQtCHhQupmO
	fFUR494FbBla0geXyK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUha8-0000000Asrp-2cHJ;
	Thu, 26 Jun 2025 08:03:40 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhRh-0000000Armk-3IRh
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 07:54:59 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso535576276.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 00:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750924496; x=1751529296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1dn70L9Gl0okqRnxfuMbiMavX+Tx3Hoii+vZ39ERk4=;
        b=Ot1pO0nEYYNep2sK2yNIQ1GodhSEnamxEsbJ7i+Nfufwn7zVsmVuOquSGXadXTl79J
         4qszc8RzuN7OD6TsQ2YMWs0CBVN+sQqQXLt/+Ml7/j1xcRw59NXBisuO2ZtV+jesWXSj
         wPRuvKX+/UHe9w/vAfiJFGKp9/xx/hc2J/fNLwqpLjTf9x9vuK6qYH0B5yiZQsRwNDYm
         iu76H6tLFb/DgU1kEraqeuJTpUCRc1d86/IjK6WHtH2ACgTHS75I1uneuZg4sCLD4qj0
         L9Gd4TN8iNSZ7mCtKxKkrbnMRdT+iVwwJp3ZHW6ySvPasrJxUc8DnF3ubCflUFqsk4n4
         51NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924496; x=1751529296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1dn70L9Gl0okqRnxfuMbiMavX+Tx3Hoii+vZ39ERk4=;
        b=SwEUf58vyQJapB2CGVhEVjqhj5WKk6BAoxLBXj9SEcgOPuXmqG4hLFTFGaUd85DjVl
         FGu6Ug1/DKRYpnCx1TwLVUwPKZh3RRaeUU8M0dj1arYwQn674JS3xNIyoTUCS1Xa2zpW
         PVlUKCpels0Hu+uvyemnXz8AkP3NNc4VubCeWZ3Bcs+orj/gWqLqal/uf6qo+grhC1hD
         LHLvddDgHfP8+CVWxiOib4zbj9bxgeFqyeeNLqt7WF7QMNx+abGaDFbunJb8I3I+zbjG
         gpSWEpi9LtJ+TGpRbkMfc9woytGPjEbOL1rh24ZtXPOagUXJcMxqpwtW0zKHeKLgrFCz
         45xg==
X-Forwarded-Encrypted: i=1; AJvYcCVF/d4Udu4TYriUm0XM+o2eSDGp36K2pR0h7wg8B02JDSbdzsFUBWSWwDTP3JvxK2vf0g6R0kEJkWtmQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YykWU2V9ios3NkCk4tIYOxRloQlg0jfc8soY8YTm1DNByGY1kV1
	oLmQp+TrwANq90VOzK+YpQvCwMItreI9c9TLIMTlq/xnXhnDhMEsfJnxZeKxzy5ltttbcUNMfej
	HSywbqhIY1KlqFJn1gWTkIQOgUtNvqH0eKOMfjOQKFA==
X-Gm-Gg: ASbGnctX+6LClruh3bXDmngqKDX5tQVPJpnt4fgI3//9oIdchOWty/rShnyP8nhaWX3
	dj/nfJSEZW5WrvA3coVO6GdF5ujnKPk4tFdiAuK56Ldnl61/OljxZhlKUJG4ttXbl1XvaS9lWaN
	npqBug/Upr26qteyi65PDzOkAZVTDQ87qQqM7BJyiLegc=
X-Google-Smtp-Source: AGHT+IFC7YL8EIIVDJy1BW5Otvm9vL5iJJX+MLNQi9AgPU+F0jT+Q6hOqkXPvsv54gH4IrAoTdOn98vPQafvJJOUmGc=
X-Received: by 2002:a05:690c:4c04:b0:712:c14a:a36a with SMTP id
 00721157ae682-71406dd9041mr88924747b3.20.1750924496096; Thu, 26 Jun 2025
 00:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn> <20250623-k1-dma-buses-rfc-wip-v1-1-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-1-c0144082061f@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 26 Jun 2025 15:54:43 +0800
X-Gm-Features: Ac12FXyAYMUSOHBFtbXxToArhHLgz9bWR5U78R9veUVEDJrTHtLo4Yw0VDlqbVc
Message-ID: <CAH1PCMYbP1mV_bO8f94qTbjqwairV3LQ1r1=B1Rmuphs-6VjxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: Add DMA translation buses for K1
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_005458_064375_4E1F511D 
X-CRM114-Status: GOOD (  14.52  )
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgNjowNOKAr1BNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2Fu
Z0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBUaGUgU3BhY2VtaVQgSzEgaGFzIHZhcmlvdXMgc3Rh
dGljIHRyYW5zbGF0aW9ucyBvZiBETUEgYWNjZXNzZXMuIEFkZAo+IHRoZXNlIGFzIHNpbXBsZS1i
dXMgbm9kZXMgd2l0aCBkbWEtcmFuZ2VzLiBEZXZpY2VzIGFjdHVhbGx5IHVzaW5nIHRoZXNlCj4g
dHJhbnNsYXRpb25zIHdpbGwgYmUgYWRkZWQgdG8gb3IgbW92ZWQgaW5zaWRlIHRoZSBidXMgbm9k
ZXMgaW4gbGF0ZXIKPiBwYXRjaGVzLgo+Cj4gVGhlIGJ1cyBuYW1lcyBhcmUgYXNzaWduZWQgYWNj
b3JkaW5nIHRvIGNvbnNlbnN1cyB3aXRoIFNwYWNlbWlUIFsxXS4KPgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvQ0FIMVBDTWFDK2ltY01aQ0ZZdFJkbUg2Z2U9ZFBnbkFObl9HcVZm
c0dSUz0rWWh5SkN3QG1haWwuZ21haWwuY29tIFsxXQo+IFNpZ25lZC1vZmYtYnk6IFZpdmlhbiBX
YW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS5kdHNpIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS5kdHNpCj4gaW5kZXggMTQwOTdmMWY2ZjQ0N2JkMzNmZjNhYWEwNzM4MmQy
N2NhOGU1OWE0OC4uOTljNzY5OTdiMzY3ZjczM2M5ZGRhMmMzMGRkODU4MTcyOTRlZjliNyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kKPiBAQCAtNTcxLDUgKzU3MSw1OCBA
QCBzZWNfdWFydDE6IHNlcmlhbEBmMDYxMjAwMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmVnLWlvLXdpZHRoID0gPDQ+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJy
ZXNlcnZlZCI7IC8qIGZvciBURUUgdXNhZ2UgKi8KPiAgICAgICAgICAgICAgICAgfTsKPiArCj4g
KyAgICAgICAgICAgICAgIGNhbWVyYS1idXMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmFuZ2Vz
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGRtYS1yYW5nZXMgPSA8MHgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDAwMDAgMHgwIDB4
ODAwMDAwMDA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgwIDB4
ODAwMDAwMDAgMHgxIDB4MDAwMDAwMDAgMHgxIDB4ODAwMDAwMDA+Owo+ICsgICAgICAgICAgICAg
ICB9Owo+ICsKPiArICAgICAgICAgICAgICAgZG1hLWJ1cyB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiArICAgICAgICAgICAgICAgICAgICAg
ICByYW5nZXM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZG1hLXJhbmdlcyA9IDwweDAgMHgwMDAwMDAwMCAweDAgMHgwMDAwMDAw
MCAweDAgMHg4MDAwMDAwMD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwweDEgMHgwMDAwMDAwMCAweDEgMHg4MDAwMDAwMCAweDMgMHgwMDAwMDAwMD47Cj4gKyAgICAg
ICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBtdWx0aW1lZGlhLWJ1cyB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hLXJhbmdlcyA9IDwweDAgMHgwMDAwMDAw
MCAweDAgMHgwMDAwMDAwMCAweDAgMHg4MDAwMDAwMD4sCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwweDAgMHg4MDAwMDAwMCAweDEgMHgwMDAwMDAwMCAweDMgMHg4MDAw
MDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICBuZXR3b3Jr
LWJ1cyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVz
IjsKPiArICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI3Np
emUtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hLXJhbmdlcyA9IDww
eDAgMHgwMDAwMDAwMCAweDAgMHgwMDAwMDAwMCAweDAgMHg4MDAwMDAwMD4sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHg4MDAwMDAwMCAweDEgMHgwMDAwMDAw
MCAweDAgMHg4MDAwMDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAg
ICAgICBwY2llLWJ1cyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJz
aW1wbGUtYnVzIjsKPiArICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hLXJh
bmdlcyA9IDwweDAgMHgwMDAwMDAwMCAweDAgMHgwMDAwMDAwMCAweDAgMHg4MDAwMDAwMD4sCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHhiODAwMDAwMCAweDEg
MHgzODAwMDAwMCAweDMgMHg0ODAwMDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICsg
ICAgICAgICAgICAgICBzdG9yYWdlLWJ1cyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiArICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZG1hLXJhbmdlcyA9IDwweDAgMHgwMDAwMDAwMCAweDAgMHgwMDAwMDAwMCAweDAgMHg4
MDAwMDAwMD47Cj4gKyAgICAgICAgICAgICAgIH07CgpUaGlzIGxvb2tzIGdvb2QgdG8gbWUuCgpS
ZXZpZXdlZC1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cgo+ICAgICAgICAg
fTsKPiAgfTsKPgo+IC0tCj4gMi40OS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
