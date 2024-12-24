Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A82E7718B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 03:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jUnjbgeAaz0LL+QMWA/usQUXaN0kJH7x7oCz8eIZaQ=; b=2ho5dXsbENVZeq
	o1IMoCyTLctHphO/iMi3ZmL/tYyK6hjek9VHxcQF+MI4XorEF91Q5P7bXCySx4k4LQropbX/D4qlY
	RfeHAJkgLqV/fSUHJRVTfKXMNrEHEpf3JDx+i0tTb7yi153oqiSIq22FuKoljydyw4/DClS3tAx1+
	ypyIv0JCFMMp0SVCcgnTIVzDVUWv+i165ThpQv837sr+M8JkKrCeM8vVasPoFi8KT8Pdjf5X+gZoh
	MYRS/NEeh+5Aj1zuQIiZL5KXpf9JyIDUx3jArmfv7MI8b0r6nmc4jW6tet1VTNI9hUO0V9SZ8Me2P
	W9Z+5V8CIyKgoxhjo9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvH1-0000000B9nX-49sI;
	Tue, 24 Dec 2024 03:07:55 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPvGz-0000000B9mb-27N9
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 03:07:54 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso390650939f.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 19:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735009672; x=1735614472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCGvf1sK2UK6+mlC2GdD8ZGpaisHOo2mW9F63kmNJXo=;
        b=i0/2gZU7eG2q7TnL2WQbXeXbBwV0cz0zGU49/bbvyw7AokHDLK8dDMIKvwPpSGMRsW
         W+kwWHtU4Y8Hhg89wgNbUoTxL/lPc0X/+R7qr+LjHFc2JZI86SeZrdFx8WZ0PptMmwMc
         UVFMs3g3g9mJj0GATXpxbkUBSIFcFyE1TvsHKHdcUZWjY+CkqhgoPCvaA3hDXvhhbNGP
         Q2z8EFj1bar3NVLHJVSm+FdPxH1ftbRM99FMXkEh8m27LbMfE+MTdPVxua7TCbR/TqZp
         LeXFRKaLtE4L7KLW+kEOqIaRBlfxGBiRpuHvbv+2Mp0Cue79E0oZn8nCz8wddgvxAMNg
         6AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735009672; x=1735614472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCGvf1sK2UK6+mlC2GdD8ZGpaisHOo2mW9F63kmNJXo=;
        b=Ue93KjutoB5pJ+75uTGEXeM6b8TrOpODW+L3AWYN3RKaMuj2C2H2qKXA/S8/Gij1t0
         G60J1laL7nvjOvEprPuxRSTj0ePg4xOSXdZXLNXGCLkaQl52hk5fuXoleiuSkmSDJ7d4
         X5Ozwgy7EVI248qj/SUWcMMpONs/QlavN9H4muvP8hzKiCWS4clkHgwAAKSTlywWLKNw
         xJ+TyqJ4iMrlQwz5rZcrjGhD0kmcdTKeV0+IzOYaXTQdguIKLzhtEi1Ibo5xQkZg8VWD
         knUo+enjIh2DaMcPftadPPzTA9uytJJh7M4T4V9zuqKg5G8mxlDaN/CSsE/rID03780J
         KJTA==
X-Forwarded-Encrypted: i=1; AJvYcCX3fnWKc4CYFtmWpOSvvgXVG/HDEKxlusDBpbAKuwDJ7bHokOCp7FFy5psbQwTguxjTIFxrmfXeaqqsRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHbLkt8b9JScvKEPWmOsCmH2o4QrATHWC/ZiOH8qu+y5vJuHQ1
	lRa1zwG+o5kVaUJCYMx5K2spFgcFRvzPmXgz9bx9yWwqLnNYilgpt6tZ8h5z64EYl+r4i6Nqaqh
	3lUE+S50ndlOgZ5Def43kgygl3QUvBEjUhdKOJw==
X-Gm-Gg: ASbGnct+tV/cfhb85qEbybyUcNk40HbFcaFLQ4/TH5oUXjmHifXq/J0FjW4J4h7YtXr
	Pn6aJwiItLG55ghRov+mZuOyJQr+5OR1JMsIHvV/7
X-Google-Smtp-Source: AGHT+IESeLQDngUv9XeyadvfXJX/o5ptn+fUq1pwDN5RxkHnom78SMZJoHAwT/GCPME6gOfPJ9XBAS33rEOarEHZH5Y=
X-Received: by 2002:a05:6e02:b24:b0:3ab:1b7a:5932 with SMTP id
 e9e14a558f8ab-3c2d514f756mr118213445ab.18.1735009671734; Mon, 23 Dec 2024
 19:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-3-apatel@ventanamicro.com> <ZQZPR01MB097924AF0A246677CCA17CDF8A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQZPR01MB097924AF0A246677CCA17CDF8A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Dec 2024 08:37:39 +0530
X-Gm-Features: AbW1kvbK1Ge7yIHB59I44qUzyMXdhtcYAtj6nRedcxDEk_JvPGB-pTTor0edyOk
Message-ID: <CAAhSdy3n5HrYUUcA8QRUU96kCzFn8zkAZL+LQ7Up6Bk+68-cFQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_190753_830056_2ADD004F 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMjQsIDIwMjQgYXQgNzo0OeKAr0FNIExleWZvb24gVGFuCjxsZXlmb29uLnRh
bkBzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiBGcm9tOiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+
IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTYsIDIwMjQgNDo0OCBQTQo+ID4gVG86IE1pY2hhZWwg
VHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT47IFN0ZXBoZW4gQm95ZAo+ID4gPHNi
b3lkQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9m
IEtvemxvd3NraQo+ID4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47IEphc3NpIEJyYXIKPiA+IDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+
Cj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT47IFBhdWwgV2FsbXNs
ZXkKPiA+IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBTdW5pbCBWIEwgPHN1bmlsdmxAdmVu
dGFuYW1pY3JvLmNvbT47IFJhaHVsCj4gPiBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1pY3JvLmNv
bT47IExleWZvb24gVGFuCj4gPiA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNvbT47IEF0aXNo
IFBhdHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+Owo+ID4gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT47IEFudXAgUGF0ZWwKPiA+IDxhbnVwQGJyYWluZmF1bHQub3JnPjsg
bGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsKPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPiA+IGtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gU3Vi
amVjdDogW1JGQyBQQVRDSCAyLzhdIGR0LWJpbmRpbmdzOiBtYWlsYm94OiBBZGQgYmluZGluZ3Mg
Zm9yIFJQTUkgc2hhcmVkCj4gPiBtZW1vcnkgdHJhbnNwb3J0Cj4gPgo+IFsuLi5dCj4KPiA+ICsK
PiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICAvLyBFeGFtcGxlIDEgKFJQTUkgc2hh
cmVkIG1lbW9yeSB3aXRoIG9ubHkgMiBxdWV1ZXMpOgo+ID4gKyAgICBtYWlsYm94QDEwMDgwMDAw
IHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1zaG1lbS1tYm94IjsKPiA+
ICsgICAgICAgIHJlZyA9IDwweDAwIDB4MTAwODAwMDAgMHgwMCAweDEwMDAwPiwKPiA+ICsgICAg
ICAgICAgICAgIDwweDAwIDB4MTAwOTAwMDAgMHgwMCAweDEwMDAwPiwKPiA+ICsgICAgICAgICAg
ICAgIDwweDAwIDB4MTAwYTAwMDAgMHgwMCAweDQ+Owo+ID4gKyAgICAgICAgcmVnLW5hbWVzID0g
ImEycC1yZXEiLCAicDJhLWFjayIsICJkYi1yZWciOwo+ID4gKyAgICAgICAgbXNpLXBhcmVudCA9
IDwmaW1zaWNfbWxldmVsPjsKPiA+ICsgICAgICAgIHJpc2N2LHNsb3Qtc2l6ZSA9IDw2ND47Cj4g
PiArICAgICAgICAjbWJveC1jZWxscyA9IDwxPjsKPiA+ICsgICAgfTsKPiA+ICsgIC0gfAo+ID4g
KyAgICAvLyBFeGFtcGxlIDIgKFJQTUkgc2hhcmVkIG1lbW9yeSB3aXRoIG9ubHkgNCBxdWV1ZXMp
Ogo+ID4gKyAgICBtYWlsYm94QDEwMDAxMDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAi
cmlzY3YscnBtaS1zaG1lbS1tYm94IjsKPiA+ICsgICAgICAgIHJlZyA9IDwweDAwIDB4MTAwMDEw
MDAgMHgwMCAweDgwMD4sCj4gPiArICAgICAgICAgICAgICA8MHgwMCAweDEwMDAxODAwIDB4MDAg
MHg4MDA+LAo+ID4gKyAgICAgICAgICAgICAgPDB4MDAgMHgxMDAwMjAwMCAweDAwIDB4ODAwPiwK
PiA+ICsgICAgICAgICAgICAgIDwweDAwIDB4MTAwMDI4MDAgMHgwMCAweDgwMD4sCj4gPiArICAg
ICAgICAgICAgICA8MHgwMCAweDEwMDAzMDAwIDB4MDAgMHg0PjsKPiA+ICsgICAgICAgIHJlZy1u
YW1lcyA9ICJhMnAtcmVxIiwgInAyYS1hY2siLCAiZGItcmVnIjsKPgo+IHJlZyBoYXMgNSBlbnRy
aWVzLCBtaXNzaW5nIDIgcmVnLW5hbWVzPwoKY29weS1wYXN0ZSBlcnJvciwgdGhhbmtzIGZvciBj
YXRjaGluZy4KClJlZ2FyZHMsCkFudXAKCj4KPiA+ICsgICAgICAgIG1zaS1wYXJlbnQgPSA8Jmlt
c2ljX21sZXZlbD47Cj4gPiArICAgICAgICByaXNjdixzbG90LXNpemUgPSA8NjQ+Owo+ID4gKyAg
ICAgICAgcmlzY3YsZGItbWFzayA9IDwweDAwMDA4MDAwPjsKPiA+ICsgICAgICAgIHJpc2N2LGRi
LXZhbHVlID0gPDB4MDAwMDgwMDA+Owo+ID4gKyAgICAgICAgI21ib3gtY2VsbHMgPSA8MT47Cj4g
PiArICAgIH07Cj4gPiAtLQo+ID4gMi40My4wCj4KPiBSZWdhcmRzCj4gTGV5IEZvb24KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
