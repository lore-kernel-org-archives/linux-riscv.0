Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26EDEE49A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1F2c/M8LVN8GKr/NyJx/v0lZ/t5hBUnda4BCWcMAvRc=; b=tfg2q2cN8DJlJM
	C/+tHz10XIZdNk3lYXUS+ManVhBUu5SK7VgM6sMwO0TLJPC6Ch/qwpBHOPKXcNL5cZrW5ypIVrcgl
	SqzFIuwXg0+4r6eRVxcNqaL8lIBVdWuW50Eai6fixcZS/xWF2P76gS3G4ct6ZS3iW58MccfGXexCr
	4diCW12q0/6+ot6S24b2I2XA5YDeIcCRPfVJmOF7syBPqWwv8kCXC4ShgcvCdb7cxxKMFRZnLMMMR
	LOsdGhLZYZqTFrxsfZaadGkWuKsl10Nw4GYRgUTjIV9KqieMsh8uoa1U+yIMrC+DVT7QkDTTKJCmx
	FTYyikx4TFYSGpv8a+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhnj-00HQ94-13;
	Wed, 23 Aug 2023 06:57:11 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhnf-00HQ7Q-0Q;
	Wed, 23 Aug 2023 06:57:08 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76d931f48acso275059485a.3;
        Tue, 22 Aug 2023 23:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692773823; x=1693378623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU2P7dRQQgULo0zZUicyqjAPcRU7CHBoeG/KFxBvPnQ=;
        b=BuZpCsDOlAM+aE0fTt7Ucc7gTdMZlb5mOUWyF+6FjgFnAftjnH5Z0c/li7ci7qdlgn
         1AlFT35OzajBuWYkKoZGT0ZrivpGRegZTdX8+CRomLSch9aBgIgsig6Ckm6QpmcV/e7R
         a96RU9OZ1xr6CnsR6RXuiQEXIuxFWlEHi/+D/1AZqdycR+NcRzeQ8nJnikqej0pPqhwR
         dWHaRTuWR0hrWtjmoPtDxFjgOnyG39qMX9zGZI8XowC59mV8AxyQRXgvxW38C17rmBtU
         Lw/zFRz3vJAbKfQbAKaJ7BP679d5e9Dt3nxKwAHpRcZLEOGjegNFpSLvMPnciJUberZI
         eSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692773823; x=1693378623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU2P7dRQQgULo0zZUicyqjAPcRU7CHBoeG/KFxBvPnQ=;
        b=HZF3Ja8Q4JKFz8g40AOnUVjsyAreIfHjunB3etmU5lKHYD/KrytQ6pfWlgoc+G+YAE
         ABVVQFvLFJXeAwtDagEfRW965cXmXnLY+fVqWVB2cLW8VEWyCjVsGEzJo0M8i27J6e5H
         D1Z2bQAZPDhE8/U7uun4iUx9eMb99PSzqe6qqysJ+JkRqLENEhIEdKdkc0/zJAhSwFjI
         95pEmDbnMgDcrIZfHoPPbwWuNo1I4Y8gv5ucVA0h5tdHP1dE+s7/pCGwGoy4vhe/PpT1
         /cxqSFBEhTBUeyC5YON3+iHBWe44s9bQcvn3UW61jfn/ryG976QZbkOtJ6vNL/nfxvRi
         sOaw==
X-Gm-Message-State: AOJu0Yzq7TUhRm26vYqjrwTYEGRg+lxV7cG1gC/qNYEOvtKYIh9Bfi42
	QFBDFQ5Xms0ViAOG4WGBu0tXFEnak0empwM0sg==
X-Google-Smtp-Source: AGHT+IF2q9OyYV9NokpELU//pPqZcjhwdA9Z63NepXCLXLHLtLKOm8Ykp1Yzc2qZP7WiwxItaA8Weintu1FaRM8d4rU=
X-Received: by 2002:a05:620a:25d1:b0:76c:e6b6:58d3 with SMTP id
 y17-20020a05620a25d100b0076ce6b658d3mr11713139qko.22.1692773822809; Tue, 22
 Aug 2023 23:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230814133238.741950-1-privatesub2@gmail.com>
 <20230814133238.741950-2-privatesub2@gmail.com> <20230822104854.1fa5f1aa@donnerap.manchester.arm.com>
In-Reply-To: <20230822104854.1fa5f1aa@donnerap.manchester.arm.com>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Wed, 23 Aug 2023 09:57:07 +0300
Message-ID: <CAF4idNneb1=40mQC=593Tmy8_OUAGiL4ROjK2XyL2BA35vM_WA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: Andre Przywara <andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_235707_173932_6C51559D 
X-CRM114-Status: GOOD (  26.82  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW5kcmUsCgrQstGCLCAyMiDQsNCy0LMuIDIwMjPigK/Qsy4g0LIgMTI6NDksIEFuZHJlIFBy
enl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPjoKPgo+IE9uIE1vbiwgMTQgQXVnIDIwMjMg
MTY6MzI6MTYgKzAzMDAKPiBBbGVrc2FuZHIgU2h1YmluIDxwcml2YXRlc3ViMkBnbWFpbC5jb20+
IHdyb3RlOgo+Cj4gSGkgQWxla3NhbmRyLAo+Cj4gPiBBbGx3aW5uZXIncyBEMSwgVDExMy1TMyBh
bmQgUjMyOSBTb0NzIGhhdmUgYSBuZXcgcHdtCj4gPiBjb250cm9sbGVyIHdpdGNoIGlzIGRpZmZl
cmVudCBmcm9tIHRoZSBwcmV2aW91cyBwd20tc3VuNGkuCj4gPgo+ID4gVGhlIEQxIGFuZCBUMTEz
IGFyZSBpZGVudGljYWwgaW4gdGVybXMgb2YgcGVyaXBoZXJhbHMsCj4gPiB0aGV5IGRpZmZlciBv
bmx5IGluIHRoZSBhcmNoaXRlY3R1cmUgb2YgdGhlIENQVSBjb3JlLCBhbmQKPiA+IGV2ZW4gc2hh
cmUgdGhlIG1ham9yaXR5IG9mIHRoZWlyIERULiBCZWNhdXNlIG9mIHRoYXQsCj4gPiB1c2luZyB0
aGUgc2FtZSBjb21wYXRpYmxlIG1ha2VzIHNlbnNlLgo+ID4gVGhlIFIzMjkgaXMgYSBkaWZmZXJl
bnQgU29DIHRob3VnaCwgYW5kIHNob3VsZCBoYXZlCj4gPiBhIGRpZmZlcmVudCBjb21wYXRpYmxl
IHN0cmluZyBhZGRlZCwgZXNwZWNpYWxseSBhcyB0aGVyZQo+ID4gaXMgYSBkaWZmZXJlbmNlIGlu
IHRoZSBudW1iZXIgb2YgY2hhbm5lbHMuCj4gPgo+ID4gRDEgYW5kIFQxMTNzIFNvQ3MgaGF2ZSBv
bmUgUFdNIGNvbnRyb2xsZXIgd2l0aCA4IGNoYW5uZWxzLgo+ID4gUjMyOSBTb0MgaGFzIHR3byBQ
V00gY29udHJvbGxlcnMgaW4gYm90aCBwb3dlciBkb21haW5zLCBvbmUgb2YKPiA+IHRoZW0gaGFz
IDkgY2hhbm5lbHMgKENQVVggb25lKSBhbmQgdGhlIG90aGVyIGhhcyA2IChDUFVTIG9uZSkuCj4g
Pgo+ID4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlbS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbGVrc2FuZHIgU2h1YmluIDxwcml2YXRlc3ViMkBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICAuLi4vYmluZGluZ3MvcHdtL2FsbHdpbm5lcixzdW4yMGktcHdtLnlhbWwgICAgfCA4NSAr
KysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKykK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3B3bS9hbGx3aW5uZXIsc3VuMjBpLXB3bS55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxsd2lubmVyLHN1bjIwaS1wd20ueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxsd2lubmVyLHN1bjIw
aS1wd20ueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uOTUxMmQ0YmVkMzIyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2FsbHdpbm5lcixzdW4yMGktcHdtLnlhbWwKPiA+IEBA
IC0wLDAgKzEsODUgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9hbGx3aW5uZXIsc3VuMjBpLXB3bS55YW1s
Iwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBBbGx3aW5uZXIgRDEsIFQxMTMtUzMgYW5kIFIzMjkgUFdN
Cj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEFsZWtzYW5kciBTaHViaW4gPHByaXZh
dGVzdWIyQGdtYWlsLmNvbT4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJs
ZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBjb25zdDogYWxsd2lubmVyLHN1bjIwaS1k
MS1wd20KPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBhbGx3aW5u
ZXIsc3VuMjBpLXIzMjktcHdtCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW4y
MGktZDEtcHdtCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4g
PiArICAiI3B3bS1jZWxscyI6Cj4gPiArICAgIGNvbnN0OiAzCj4gPiArCj4gPiArICBjbG9ja3M6
Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IDI0IE1IeiBvc2NpbGxh
dG9yCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQnVzIENsb2NrCj4KPiBUaGUgbWFudWFsIHRl
bGxzIG1lIHRoYXQgdGhlIG5ldyBQV01zIGNhbiBhbHNvIHVzZSBBUEIwIGFzIHRoZQo+IGlucHV0
IGNsb2NrLCB3aGljaCAoZmluYWxseSEpIGFsbG93cyBQV00gZnJlcXVlbmNpZXMgYWJvdmUgMjQg
TUh6Lgo+IFNvIHdlIHNob3VsZCBoYXZlIGFuIGV4cGxpY2l0IHJlZmVyZW5jZSB0byB0aGF0IGNs
b2NrIC0gZXZlbiBpZiB0aGUgYnVzCj4gY2xvY2sgaGFwcGVucyB0byBiZSBnYXRlZCB2ZXJzaW9u
IG9mIEFQQjAuCgpTaG91bGQgSSBjaGFuZ2UgaXQgdG8gc29tZXRoaW5nIGxpa2UgdGhpczoKICAg
IHB3bTogcHdtQDIwMDBjMDAgewogICAgICBjb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGkt
ZDEtcHdtIjsKICAgICAgcmVnID0gPDB4MDIwMDBjMDAgMHg0MDA+OwogICAgICBjbG9ja3MgPSA8
JmNjdSBDTEtfQlVTX1BXTT4sIDwmZGN4bz4sIDwmY2N1IENMS19BUEIwPjsKICAgICAgY2xvY2st
bmFtZXMgPSAiYnVzIiwgImhvc2MiLCAiYXBiMCI7CiAgICAgIHJlc2V0cyA9IDwmY2N1IFJTVF9C
VVNfUFdNPjsKICAgICAgI3B3bS1jZWxscyA9IDwweDM+OwogICAgfTsKCj4KPiBDaGVlcnMsCj4g
QW5kcmUKPgo+ID4gKwo+ID4gKyAgY2xvY2stbmFtZXM6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAg
ICAgIC0gY29uc3Q6IGhvc2MKPiA+ICsgICAgICAtIGNvbnN0OiBidXMKPiA+ICsKPiA+ICsgIHJl
c2V0czoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGFsbHdpbm5lcixwd20tY2hh
bm5lbHM6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIG51bWJlciBvZiBQV00gY2hhbm5lbHMgY29u
ZmlndXJlZCBmb3IgdGhpcyBpbnN0YW5jZQo+ID4gKyAgICBlbnVtOiBbNiwgOV0KPiA+ICsKPiA+
ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogcHdtLnlhbWwjCj4gPiArCj4gPiArICAtIGlmOgo+ID4g
KyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAgICAgICAg
ICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBjb25zdDogYWxsd2lubmVyLHN1bjIwaS1yMzI5
LXB3bQo+ID4gKwo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHJlcXVpcmVkOgo+ID4gKyAgICAg
ICAgLSBhbGx3aW5uZXIscHdtLWNoYW5uZWxzCj4gPiArCj4gPiArICAgIGVsc2U6Cj4gPiArICAg
ICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIGFsbHdpbm5lcixwd20tY2hhbm5lbHM6IGZhbHNl
Cj4gPiArCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK3JlcXVp
cmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJlZwo+ID4gKyAgLSAiI3B3bS1jZWxs
cyIKPiA+ICsgIC0gY2xvY2tzCj4gPiArICAtIGNsb2NrLW5hbWVzCj4gPiArICAtIHJlc2V0cwo+
ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9zdW4yMGktZDEtY2N1Lmg+Cj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9yZXNldC9zdW4yMGktZDEtY2N1Lmg+Cj4gPiArCj4gPiArICAgIHB3bTogcHdtQDIwMDBjMDAg
ewo+ID4gKyAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMS1wd20iOwo+ID4g
KyAgICAgIHJlZyA9IDwweDAyMDAwYzAwIDB4NDAwPjsKPiA+ICsgICAgICBjbG9ja3MgPSA8JmRj
eG8+LCA8JmNjdSBDTEtfQlVTX1BXTT47Cj4gPiArICAgICAgY2xvY2stbmFtZXMgPSAiaG9zYyIs
ICJidXMiOwo+ID4gKyAgICAgIHJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfUFdNPjsKPiA+ICsgICAg
ICAjcHdtLWNlbGxzID0gPDB4Mz47Cj4gPiArICAgIH07Cj4gPiArCj4gPiArLi4uCj4KCkNoZWVy
cywKQWxla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
