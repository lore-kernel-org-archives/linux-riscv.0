Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA59EC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nss6NOYUSc6qP5gxLSjiYMUb5piBGdIvUrS/Bn77V9I=; b=MfSffOVrbIObA0
	uh1mYP+hoqiy2rHblzhD5Kd6CB31w+wqrn0Zz5aMAARTSYkimSi3XYzHVnIFyzj5Wvg6r5lr0yWl7
	YbRoarq6Rs2Fglr7wAp+FMrmfEBQKoWUoo+VilrAnoOLsf/alUgFXOjhrHlVdWSNHD04OazKQfaLD
	g8ATbrRcY2FsJ/0ujfJQ5eGut5ydYjoEH3kV3YUint8EHQyd3VinRgwjZ+dJgnBlIKk6yY2rj7YMz
	SCemrg57JZgQGiU2Emhgv1cLtMuUpnBXYCWYyRZ0dYWZMJVTIauZo7EAl6PwKeXhzDiW0UQPCJZ/s
	1FhxOC/eelL0DH9mJiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDYC-00000004Yat-44Mo;
	Wed, 31 Jan 2024 16:35:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDY8-00000004YRY-3lmd;
	Wed, 31 Jan 2024 16:34:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a358ec50b7cso207431866b.0;
        Wed, 31 Jan 2024 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706718877; x=1707323677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkISyzoAojn//Mjk2EK2BnzD/RKHkw5boJQbVVV65z8=;
        b=P+9QpNC1MIx8iP/euTB3VLEWR+rbB7RkCiJc6hm+dkLjM8XzXI6lJgu0QegCOYRknP
         0+rjfoI3/b8PysqdiayEgGiwOiE+mqeOx1Ml1yzlyBnggcPHAZEw0CZPNMSanjvG08Wi
         upo/kz4/jhL/vpWK/4HJGYdQeEGwXWnfiYj5juxwC8CyvfV1vkDdbXLNyi1aUKbucnxa
         BCkFfQKL9bhX+is5s4FX6b+IiYMcAp+XtcAgTNWcLpSnm0nCOJeahGLa4UMS0STtZ2rq
         N9dwaWz1CiUlhFxBELFi9i43EpNRCUB+9yUqL7owA65Ib0AJYcLIgSnd9zP/sEDI2BPO
         FGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706718877; x=1707323677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkISyzoAojn//Mjk2EK2BnzD/RKHkw5boJQbVVV65z8=;
        b=MgUCAuNkH4KFF9etKWvrRZB2KrDOAD1WNCLuKYmyDcWMfYyK7UhLHDw6ANUjedfe3g
         Bup0CxxYM8UlQhnBrQN29PtsGw34AmRU8Xp60295ueYsoNPC6DgVIV2E0c77nHkzTALh
         3njY/6XP1oumaA5+1stMd2q0+0Qb2x4i/wgI/0Y7lAzzZTO2nb2ttFWWsC4F2R2uuD5I
         WODRzREOZyv+G+gs21MSNw+CvG4249dHWnzv7NDCUPD2Ne7vPeNnGoQDswzAJkUl5pEu
         GJ4gvXB7ABEFeiusazWODtuwryiuangCGTWdLu63fyp3qFeys8Fwv3lEYtWD/eCe0e3P
         y65Q==
X-Gm-Message-State: AOJu0Yx/XAE+UHbjpOqOafXXrblnzV1iYZBtfksvFC8UFYj5hIOHlk3r
	6XM2hp3d3SvV5YO/xNp2A7VUpQf8Vq1oNWnvc8Np4etl7go6RtH/03gZJRWQ24EKDmYQls+29Fy
	SMqfWlNE9+ZoP1J6cH7G35TnejoY=
X-Google-Smtp-Source: AGHT+IFYlD1g6oncACUWLgW/IS5NQxgKuyArc2mFdJsTASkUAWJlfEbLzj0KK+0uHYcKfDacVh1UqrmEF70G65ybS18=
X-Received: by 2002:a17:906:57d9:b0:a23:7633:59ae with SMTP id
 u25-20020a17090657d900b00a23763359aemr2193751ejr.9.1706718876708; Wed, 31 Jan
 2024 08:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20240131125920.2879433-1-privatesub2@gmail.com> <20240131125920.2879433-2-privatesub2@gmail.com>
In-Reply-To: <20240131125920.2879433-2-privatesub2@gmail.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 31 Jan 2024 19:34:25 +0300
Message-ID: <CALHCpMjkfvmN4i98FW1HxH+tNoOCsMJFwjwmLR6WqRvhizZGKg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: Aleksandr Shubin <privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_083456_961848_AB83183F 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxla3NhbmRyLAoK0YHRgCwgMzEg0Y/QvdCyLiAyMDI04oCv0LMuINCyIDE1OjU5LCBBbGVr
c2FuZHIgU2h1YmluIDxwcml2YXRlc3ViMkBnbWFpbC5jb20+Ogo+Cj4gQWxsd2lubmVyJ3MgRDEs
IFQxMTMtUzMgYW5kIFIzMjkgU29DcyBoYXZlIGEgbmV3IHB3bQo+IGNvbnRyb2xsZXIgd2l0Y2gg
aXMgZGlmZmVyZW50IGZyb20gdGhlIHByZXZpb3VzIHB3bS1zdW40aS4KPgo+IFRoZSBEMSBhbmQg
VDExMyBhcmUgaWRlbnRpY2FsIGluIHRlcm1zIG9mIHBlcmlwaGVyYWxzLAo+IHRoZXkgZGlmZmVy
IG9ubHkgaW4gdGhlIGFyY2hpdGVjdHVyZSBvZiB0aGUgQ1BVIGNvcmUsIGFuZAo+IGV2ZW4gc2hh
cmUgdGhlIG1ham9yaXR5IG9mIHRoZWlyIERULiBCZWNhdXNlIG9mIHRoYXQsCj4gdXNpbmcgdGhl
IHNhbWUgY29tcGF0aWJsZSBtYWtlcyBzZW5zZS4KPiBUaGUgUjMyOSBpcyBhIGRpZmZlcmVudCBT
b0MgdGhvdWdoLCBhbmQgc2hvdWxkIGhhdmUKPiBhIGRpZmZlcmVudCBjb21wYXRpYmxlIHN0cmlu
ZyBhZGRlZCwgZXNwZWNpYWxseSBhcyB0aGVyZQo+IGlzIGEgZGlmZmVyZW5jZSBpbiB0aGUgbnVt
YmVyIG9mIGNoYW5uZWxzLgo+Cj4gRDEgYW5kIFQxMTNzIFNvQ3MgaGF2ZSBvbmUgUFdNIGNvbnRy
b2xsZXIgd2l0aCA4IGNoYW5uZWxzLgo+IFIzMjkgU29DIGhhcyB0d28gUFdNIGNvbnRyb2xsZXJz
IGluIGJvdGggcG93ZXIgZG9tYWlucywgb25lIG9mCj4gdGhlbSBoYXMgOSBjaGFubmVscyAoQ1BV
WCBvbmUpIGFuZCB0aGUgb3RoZXIgaGFzIDYgKENQVVMgb25lKS4KPgo+IEFkZCBhIGRldmljZSB0
cmVlIGJpbmRpbmcgZm9yIHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2FuZHIgU2h1Ymlu
IDxwcml2YXRlc3ViMkBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gLi4uL2JpbmRpbmdzL3B3bS9hbGx3aW5u
ZXIsc3VuMjBpLXB3bS55YW1sIHwgODggKysrKysrKysrKysrKysrKysrKwo+IDEgZmlsZSBjaGFu
Z2VkLCA4OCBpbnNlcnRpb25zKCspCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxsd2lubmVyLHN1bjIwaS1wd20ueWFtbAo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxsd2lubmVy
LHN1bjIwaS1wd20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20v
YWxsd2lubmVyLHN1bjIwaS1wd20ueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi43MTZmNzU3NzYwMDYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hbGx3aW5uZXIsc3VuMjBpLXB3bS55YW1s
Cj4gQEAgLTAsMCArMSw4OCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9hbGx3aW5uZXIsc3VuMjBpLXB3bS55YW1sIwo+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
PiArCj4gK3RpdGxlOiBBbGx3aW5uZXIgRDEsIFQxMTMtUzMgYW5kIFIzMjkgUFdNCj4gKwo+ICtt
YWludGFpbmVyczoKPiArIC0gQWxla3NhbmRyIFNodWJpbiA8cHJpdmF0ZXN1YjJAZ21haWwuY29t
Pgo+ICsgLSBCcmFuZG9uIENoZW8gRnVzaSA8ZnVzaWJyYW5kb24xM0BnbWFpbC5jb20+Cj4gKwo+
ICtwcm9wZXJ0aWVzOgo+ICsgY29tcGF0aWJsZToKPiArIG9uZU9mOgo+ICsgLSBjb25zdDogYWxs
d2lubmVyLHN1bjIwaS1kMS1wd20KPiArIC0gaXRlbXM6Cj4gKyAtIGNvbnN0OiBhbGx3aW5uZXIs
c3VuMjBpLXIzMjktcHdtCgpBY2NvcmRpbmcgdG8gdGhlIGJzcCBzZGsgYW5kIG90aGVyIG1haW5s
aW5lIGRyaXZlcnMgZm9yClIzMjkgU29DLCB0aGUgc3VuNTBpIHByZWZpeCBzaG91bGQgYmUgdXNl
ZCBpbnN0ZWFkIHRoZSBzdW4yMGkKCj4gKyAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuMjBpLWQxLXB3
bQo+ICsKPiArIHJlZzoKPiArIG1heEl0ZW1zOiAxCj4gKwo+ICsgIiNwd20tY2VsbHMiOgo+ICsg
Y29uc3Q6IDMKPiArCj4gKyBjbG9ja3M6Cj4gKyBpdGVtczoKPiArIC0gZGVzY3JpcHRpb246IEJ1
cyBjbG9jawo+ICsgLSBkZXNjcmlwdGlvbjogMjQgTUh6IG9zY2lsbGF0b3IKPiArIC0gZGVzY3Jp
cHRpb246IEFQQjAgY2xvY2sKPiArCj4gKyBjbG9jay1uYW1lczoKPiArIGl0ZW1zOgo+ICsgLSBj
b25zdDogYnVzCj4gKyAtIGNvbnN0OiBob3NjCj4gKyAtIGNvbnN0OiBhcGIwCj4gKwo+ICsgcmVz
ZXRzOgo+ICsgbWF4SXRlbXM6IDEKPiArCj4gKyBhbGx3aW5uZXIscHdtLWNoYW5uZWxzOgo+ICsg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyBkZXNjcmlw
dGlvbjogVGhlIG51bWJlciBvZiBQV00gY2hhbm5lbHMgY29uZmlndXJlZCBmb3IgdGhpcyBpbnN0
YW5jZQo+ICsgZW51bTogWzYsIDldCj4gKwo+ICthbGxPZjoKPiArIC0gJHJlZjogcHdtLnlhbWwj
Cj4gKwo+ICsgLSBpZjoKPiArIHByb3BlcnRpZXM6Cj4gKyBjb21wYXRpYmxlOgo+ICsgY29udGFp
bnM6Cj4gKyBjb25zdDogYWxsd2lubmVyLHN1bjIwaS1yMzI5LXB3bQoKU2FtZSBoZXJlLgoKPiAr
IHRoZW46Cj4gKyByZXF1aXJlZDoKPiArIC0gYWxsd2lubmVyLHB3bS1jaGFubmVscwo+ICsKPiAr
IGVsc2U6Cj4gKyBwcm9wZXJ0aWVzOgo+ICsgYWxsd2lubmVyLHB3bS1jaGFubmVsczogZmFsc2UK
PiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK3JlcXVpcmVkOgo+ICsg
LSBjb21wYXRpYmxlCj4gKyAtIHJlZwo+ICsgLSAiI3B3bS1jZWxscyIKPiArIC0gY2xvY2tzCj4g
KyAtIGNsb2NrLW5hbWVzCj4gKyAtIHJlc2V0cwo+ICsKPiArZXhhbXBsZXM6Cj4gKyAtIHwKPiAr
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdW4yMGktZDEtY2N1Lmg+Cj4gKyAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcmVzZXQvc3VuMjBpLWQxLWNjdS5oPgo+ICsKPiArIHB3bTogcHdtQDIw
MDBjMDAgewo+ICsgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLXB3bSI7Cj4gKyBy
ZWcgPSA8MHgwMjAwMGMwMCAweDQwMD47Cj4gKyBjbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1BXTT4s
IDwmZGN4bz4sIDwmY2N1IENMS19BUEIwPjsKPiArIGNsb2NrLW5hbWVzID0gImJ1cyIsICJob3Nj
IiwgImFwYjAiOwo+ICsgcmVzZXRzID0gPCZjY3UgUlNUX0JVU19QV00+Owo+ICsgI3B3bS1jZWxs
cyA9IDwweDM+Owo+ICsgfTsKPiArCj4gKy4uLgo+IC0tCj4gMi4yNS4xCj4KCkJlc3QgcmVnYXJk
cywKTWFrc2ltCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
