Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C757C001DB
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUm6TzabAJf4figBHZVxT5jiXE2havSTTnN+1qsB9DY=; b=QaLn0eU082314J
	aAEpyHAea7R/DvVpcx6yv6QIgbMm7P7M1tbO6r0SEn0aWKLblYJRyUg3j1Q1IUlIUXB/mHsHN5rm3
	p+BcXghIxcxfwzdIqnnN7h+bSkYj2TXOAzQyNDt+DjNpQGs8znNCisIGpdtn3Ln4srIjL1AE/ZZCb
	KGA8IdQrwNbglk4p30xn/mjVSB9jgGYovx/Z/5Pv+Szp+EbL6X8o+TBpq1rOpPc6W/RMkA3mn/ZMK
	chWubcZNPSna0J3XeU3rTU8WmTwFcLTtiXWNDDviisky953oGJfM1C1TZmf7e1pdb3d2/bgHRQu7+
	jZdVcfHy99N936Iyc8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2Tz-00ER37-1I;
	Sun, 13 Aug 2023 04:13:39 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV2Tv-00ER2U-13;
	Sun, 13 Aug 2023 04:13:37 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso3138966b3a.3;
        Sat, 12 Aug 2023 21:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691900013; x=1692504813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI593M9zMN8epqOMj2ahalMMsfEOiEZNyKM6XMUdoUI=;
        b=AXXXNIPBWnwDYQqGiyOzDaPCFOas1nRp+FmfElytUhuRwPmltvpweqGpSIu82RcQjp
         IfdHXcu2h9nkqAdSOIjpdNIZmUTxEFBJqACGxVl7kPJfd3DKnJk1DscfbSspz73s90Cd
         WRnjIXGDZZd8K+LkL5BtHEk7axuKjEdDi/5PEJMyGle1ppsLjQWd1mnMecQ8qCjJQwj1
         Rr6moKPgfbb/1Y4dRG16JQpeTGAaRXznu3vGOC2I532glEShpO8ITutpy8ae41pfVqb+
         UxWotWB62n/bKu08wl6oGqYJ9eNB0VDyFtdof7kSLyHgc8lj171pbjVEzqcRH66Udm6L
         e77g==
X-Gm-Message-State: AOJu0YyZfRdPuO7ycFN2/ztdY+06Q7PXh2+TjtTaXxnUeTqUgQATrF/g
	Wld93sYp+o1CwU/f4fdCybfETG1nt4pmLQ==
X-Google-Smtp-Source: AGHT+IE/biwGOU1YZ9YQ+O+R2mMxZOBrhve/urDOl+JPNcjYct74G18UvpXTgtEcjqZ/WeUnGJWaAQ==
X-Received: by 2002:a05:6a20:394a:b0:137:23a2:2b3c with SMTP id r10-20020a056a20394a00b0013723a22b3cmr8844885pzg.49.1691900012706;
        Sat, 12 Aug 2023 21:13:32 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id h27-20020a63385b000000b005641fadb844sm5922672pgn.49.2023.08.12.21.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 21:13:22 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bdca7cc28dso7927065ad.1;
        Sat, 12 Aug 2023 21:13:21 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:1bb:8e13:deba with SMTP id
 p1-20020a170902e74100b001bb8e13debamr7297585plf.11.1691900000803; Sat, 12 Aug
 2023 21:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230731023701.2581713-1-contact@jookia.org> <3248110.44csPzL39Z@jernej-laptop>
In-Reply-To: <3248110.44csPzL39Z@jernej-laptop>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 12:13:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66g1On2uy0_15ZA5-uXcrLSg7V-tsw8zLo=tUY_HUW00g@mail.gmail.com>
Message-ID: <CAGb2v66g1On2uy0_15ZA5-uXcrLSg7V-tsw8zLo=tUY_HUW00g@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_211335_367053_2BBAD2BF 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, mkl@pengutronix.de, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA0OjU54oCvQU0gSmVybmVqIMWga3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gL2NjIE1hcmMKPgo+IERuZSBwb25lZGVsamVr
LCAzMS4ganVsaWogMjAyMyBvYiAwNDozNjo1OSBDRVNUIGplIEpvaG4gV2F0dHMgbmFwaXNhbChh
KToKPiA+IFRoZXJlIGFyZSBvbmx5IG9uZSBzZXQgb2YgQ0FOIHBpbnMgYXZhaWxhYmxlIG9uIHRo
ZXNlIGNoaXBzLgo+ID4gU3BlY2lmeSB0aGVzZSBhcyB0aGUgZGVmYXVsdCB0byBhdm9pZCByZWR1
bmRhbmN5IGluIGJvYXJkIGRldmljZSB0cmVlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IFdhdHRzIDxjb250YWN0QGpvb2tpYS5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpIHwgNCArKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gPiBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgaW5kZXgKPiA+IDQwODZjMGNjMGY5
ZC4uYjI3YzNmYzEzYjBkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4gQEAgLTg5OCw2ICs4OTgsOCBAQCBjYW4w
OiBjYW5AMjUwNDAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxT
T0NfUEVSSVBIRVJBTF9JUlEoMjEpCj4gSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19DQU4wPjsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICByZXNldHMgPSA8JmNjdSBSU1RfQlVTX0NBTjA+Owo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcGluY3RybC0wID0gPCZjYW4wX3BpbnM+Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAgICAgIH07Cj4KPiBwaW5jdHJs
LW5hbWVzIGFuZCBwaW5jdHJsLTAgYXJlIHVzdWFsbHkgYXQgdGhlIHRvcC4gSG93ZXZlciwgc2lu
Y2UgdGhlcmUgaXMgbm8KPiBoYXJkIHJ1bGUgKEkndmUgc2VlbiBpdCBtaXhlZCksIEknbSBmaW5l
IHdpdGggaXQuCgpBRkFJSyB0aGlzIG9ubHkgYXBwbGllcyB0byBib2FyZCBmaWxlcyB3aGVyZSB0
aGVyZSBhcmUgbW9zdGx5IG5vbmUgb2YgdGhlCnJlc291cmNlIChjbG9ja3MsIHJlZywgcmVzZXRz
LCBpbnRlcnJ1cHRzKSBwcm9wZXJ0aWVzLiBPT1RIIHRoZSBjb21wYXRpYmxlCnByb3BlcnR5IGlz
IGFsd2F5cyB0aGUgZmlyc3QgcHJvcGVydHkuIEkgd291bGQgbm9ybWFsbHkgcHV0IHRoZSBwaW5j
dHJsCnN0dWZmIGFmdGVyIHRoZSBpbnRlcm5hbCByZXNvdXJjZXMsIHNpbmNlIGl0IGlzIGFuIGV4
dGVybmFsIHByb3BlcnR5LgpJbiB0aGUgU29DIGR0c2kgZmlsZXMsIHRoZXkgd291bGQgZW5kIHVw
IGFmdGVyIHRoZSByZXNvdXJjZSBwcm9wZXJ0aWVzCkkgbWVudGlvbmVkIGFib3ZlLCBhbmQgYmVm
b3JlIHRoZSAic3RhdHVzIiBwcm9wZXJ0eS4KCkNoZW5ZdQoKPiBBY2tlZC1ieTogSmVybmVqIFNr
cmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KPgo+IFNpbmNlIG9yaWdpbmFsIERUIG5v
ZGUgZW50cnkgZ29lcyB0aHJvdWdoIG5ldGRldiB0cmVlLCB0aGlzIHNob3VsZCBiZSBwaWNrZWQK
PiB0aGVyZSBvciBpdCBjYW4gYmUgZHJvcHBlZCB0aGVyZSBhbmQgSSBwaWNrIGJvdGggcGF0Y2hl
cyBvciBJIGNhbiBwaWNrIHBhdGNoCj4gZm9yIGxhdGVyIGtlcm5lbCB2ZXJzaW9uLgo+Cj4gQmVz
dCByZWdhcmRzLAo+IEplcm5lago+Cj4gPgo+ID4gQEAgLTkwNyw2ICs5MDksOCBAQCBjYW4xOiBj
YW5AMjUwNDQwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxTT0Nf
UEVSSVBIRVJBTF9JUlEoMjIpCj4gSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19DQU4xPjsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICByZXNldHMgPSA8JmNjdSBSU1RfQlVTX0NBTjE+Owo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcGluY3RybC0wID0gPCZjYW4xX3BpbnM+Owo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICB9Owo+
Cj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
