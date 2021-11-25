Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EC1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Nov 2021 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hYhw8L9QTVr34B5PSMFXAK8h1EDqoxDzOUqH+HPzAY=; b=w2S1vyJZxOvOY+
	IikjqX+/Pi+h2OH/s4gXxMxBdRJf57VtByrnCUaeE5nUFQtrgenOAl6uYZjBDF2IC0NOX6x6xRPw7
	/tajCy13Ic07nIplIxx5l5I88EC7eMMmgb6wD58L7GGnYIt691cvQcO0PtBrcGJZyyu9E7B5CXoSp
	xnewwn8QyW6jisRnSLG6AngCVvrua8rsm52FxnzdCv9Aq0EkYGXaoFBvC/iWmfG09pG3Lrw8nIBpZ
	8AxEwq8s3FYjz35SMfJigTnp36N6C5M6oMOH0Gtt+PMUkT18junoigoJAjDZRIz8LA+qC3O0ORtyq
	RVQ7Kvgre/7RHEvtOuCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqHIG-008CaN-7C; Thu, 25 Nov 2021 16:08:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqHID-008CUn-IW
 for linux-riscv@lists.infradead.org; Thu, 25 Nov 2021 16:08:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id u18so12693383wrg.5
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 08:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BBIjRQcQTe/p8MPuV8+84d+JQi/ynOVnTogY5pdUch4=;
 b=U5U0b+/ziFIlFc/ux3ZoOEDrb8zzXm42loeB46lAIDLcsnt8g6LWZdNab9N8LgYlBs
 L2mRETMzguDlzF40i7NiRt7NjZuiBifM2pDWQRDEHu/u6BhpIYjfFvSPeGIPTvoe6JBC
 MksqgkSQoO3GHgQTEW4TYyslTwW6c2ieEypd6eiUTfOaAJsQotX2Ec6VSsM0qH9g0sDq
 dA2AbPP3uBCQRuL5gelcz6ZFqlqJgVbKAnIeQZX2KkK7uqcclGI6+bPHg7ItfYie/Gf9
 3yq6kV28i+vJ4C8D1fR+x82AGaUYttYQOL1pBf19OiLJE6pGTrtxUY61ixIQIfnZI8bU
 BoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BBIjRQcQTe/p8MPuV8+84d+JQi/ynOVnTogY5pdUch4=;
 b=BPPX0iCdzAVZqwVKHka/B4a+FTRYaPKyuLT+OBLpraT9n8vck3/EKyoObAFrzvRInL
 jl7RolCSgvDf1iYr5GY65AdgUwvmNM2RJyLYyHEVZN7/NbexcGDSvmoIFx5hV8Rwio8G
 XxcLb/tOc2D93xdQsEdbc3KJw6VLaV9ZkAar28dciJnJ/2D4lyGIInv8Ba6iL4fjgf5Y
 1uqgpwdjj0Y+R35Zo3fohkGDHShXYaqLCScxhVDMIvKJxXiQ5XpxbI3XnSZK3QYVFpxs
 L4ce1TuIHaVtruITWgSA0LeTjAbP2U2df54I3vRaaV3laI3QrtC/uKupa2v9hK8tF8ow
 N7eg==
X-Gm-Message-State: AOAM533O96VcaJvBmHYF+gF4TJ4Q2iaZ40PHwR711BjJhNSIgaGKI9Xy
 7gjNcDjFJIp5TOWxhRaWttUDug==
X-Google-Smtp-Source: ABdhPJxkfPB4Sn6d4awiD0RuzY3zDfpzeOlG0sL9DlrmFmkTSBbPNNh9f/BRCMQorDtbL8Bv6xl9lA==
X-Received: by 2002:adf:ea8c:: with SMTP id s12mr7622120wrm.535.1637856484276; 
 Thu, 25 Nov 2021 08:08:04 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id l15sm3313235wme.47.2021.11.25.08.08.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Nov 2021 08:08:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive, plic: Fix
 number of interrupts
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20211125152233.162868-1-geert@linux-m68k.org>
Date: Thu, 25 Nov 2021 16:08:03 +0000
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Message-Id: <161F972E-7972-4001-BE19-C88F81EF8047@jrtc27.com>
References: <20211125152233.162868-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_080813_673700_552932E8 
X-CRM114-Status: GOOD (  20.95  )
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

T24gMjUgTm92IDIwMjEsIGF0IDE1OjIyLCBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiB3cm90ZToKPiAKPiBUbyBpbXByb3ZlIGh1bWFuIHJlYWRhYmlsaXR5IGFuZCBl
bmFibGUgYXV0b21hdGljIHZhbGlkYXRpb24sIHRoZSB0dXBsZXMKPiBpbiAiaW50ZXJydXB0cy1l
eHRlbmRlZCIgcHJvcGVydGllcyBzaG91bGQgYmUgZ3JvdXBlZCB1c2luZyBhbmdsZQo+IGJyYWNr
ZXRzLiAgQXMgdGhlIERUIGJpbmRpbmdzIGxhY2sgYW4gdXBwZXIgYm91bmQgb24gdGhlIG51bWJl
ciBvZgo+IGludGVycnVwdHMsIHRodXMgYXNzdW1pbmcgb25lLCBwcm9wZXIgZ3JvdXBpbmcgaXMg
Y3VycmVudGx5IGZsYWdnZWQgYXMKPiBhbiBlcnJvci4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcg
dGhlIG1pc3NpbmcgIm1heEl0ZW1zIiwgbGltaXRpbmcgaXQgdG8gOSBpbnRlcnJ1cHRzCj4gKG9u
ZSBpbnRlcnJ1cHQgZm9yIGEgc3lzdGVtIG1hbmFnZW1lbnQgY29yZSwgYW5kIHR3byBpbnRlcnJ1
cHRzIHBlciBjb3JlCj4gZm9yIG90aGVyIGNvcmVzKSwgd2hpY2ggc2hvdWxkIGJlIHN1ZmZpY2ll
bnQgZm9yIG5vdy4KClRoaXMgaXMgU2lGaXZl4oCZcyBJUCwgc28gaXMgdGhpcyBhY3R1YWxseSB0
cnVlPyBJIHdvdWxkIGltYWdpbmUgaXTigJlzCmp1c3QgcGFyYW1ldGVyaXNlZCBhbmQgY291bGQg
YmUgZ2VuZXJhdGVkIHdpdGggYXMgbWFueSB0YXJnZXRzIGFzIGZpdAppbiB0aGUgTU1JTyBzcGFj
ZSwgYW5kIHRoYXQgdGhpcyBpcyB0aHVzIGluYWNjdXJhdGUuIEJlc2lkZXMsIHN1Y2ggYQpmdW5j
dGlvbiBjaGFuZ2Ugc2hvdWxkIGJlIG1hZGUgc2VwYXJhdGVseSBmcm9tIHRoZSBncm91cGluZyBj
aGFuZ2UuCgpUaGUgc2FtZSBnb2VzIGZvciB5b3VyIGVxdWl2YWxlbnQgc2lmaXZlLGNsaW50MCBw
YXRjaC4KCkplc3MKCj4gR3JvdXAgdGhlIHR1cGxlcyBpbiB0aGUgZXhhbXBsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IC0t
LQo+IC4uLi9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAg
fCAxMiArKysrKystLS0tLS0KPiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUs
cGxpYy0xLjAuMC55YW1sCj4gaW5kZXggMDhkNWE1N2NlMDBmZjQ0Ni4uMTk4YjM3M2Y5ODRmMzQz
OCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0x
LjAuMC55YW1sCj4gQEAgLTYxLDYgKzYxLDcgQEAgcHJvcGVydGllczoKPiAKPiAgIGludGVycnVw
dHMtZXh0ZW5kZWQ6Cj4gICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczogOQo+ICAgICBk
ZXNjcmlwdGlvbjoKPiAgICAgICBTcGVjaWZpZXMgd2hpY2ggY29udGV4dHMgYXJlIGNvbm5lY3Rl
ZCB0byB0aGUgUExJQywgd2l0aCAiLTEiIHNwZWNpZnlpbmcKPiAgICAgICB0aGF0IGEgY29udGV4
dCBpcyBub3QgcHJlc2VudC4gRWFjaCBub2RlIHBvaW50ZWQgdG8gc2hvdWxkIGJlIGEKPiBAQCAt
ODksMTIgKzkwLDExIEBAIGV4YW1wbGVzOgo+ICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47
Cj4gICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUsZnU1NDAtYzAwMC1wbGljIiwgInNpZml2ZSxw
bGljLTEuMC4wIjsKPiAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiAtICAgICAgaW50ZXJy
dXB0cy1leHRlbmRlZCA9IDwKPiAtICAgICAgICAmY3B1MF9pbnRjIDExCj4gLSAgICAgICAgJmNw
dTFfaW50YyAxMSAmY3B1MV9pbnRjIDkKPiAtICAgICAgICAmY3B1Ml9pbnRjIDExICZjcHUyX2lu
dGMgOQo+IC0gICAgICAgICZjcHUzX2ludGMgMTEgJmNwdTNfaW50YyA5Cj4gLSAgICAgICAgJmNw
dTRfaW50YyAxMSAmY3B1NF9pbnRjIDk+Owo+ICsgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0g
PCZjcHUwX2ludGMgMTE+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHUxX2lu
dGMgMTE+LCA8JmNwdTFfaW50YyA5PiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y3B1Ml9pbnRjIDExPiwgPCZjcHUyX2ludGMgOT4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwdTNfaW50YyAxMT4sIDwmY3B1M19pbnRjIDk+LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcHU0X2ludGMgMTE+LCA8JmNwdTRfaW50YyA5PjsKPiAgICAgICByZWcg
PSA8MHhjMDAwMDAwIDB4NDAwMDAwMD47Cj4gICAgICAgcmlzY3YsbmRldiA9IDwxMD47Cj4gICAg
IH07Cj4gLS0gCj4gMi4yNS4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
