Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3589CE7A88
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Sep 2023 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2hrnKKSNAbpdjSwFJs2so0ntlFc0TlzDaVyblBMb6OA=; b=vqDsYt/GCkyMM5UALx+3Y9a+Js
	OXPzQrF3sqCmefCK6D+KxjuYCDd33b7M/6zQ8Vp58LajbsZaeqRBp+vKZ6ocb+IMBapqG6n9mDtX7
	/Gd+JrtWCXou+DIC1dMb1w/7PI4eynhM/Axg4om/8L2ZQwrgBoySdQ8DiRuhd+hsdpax/o7Qkpocy
	POxLt3do9EaG28v/XFGf2Bh0j5R1JnyQiHEMdBoEssztVlQpsiSQkumfLaQI6KOjEKvCRQLI/hxCc
	KaFdWb0I9YBdiYijoz8IGfpiLrJDHJuC0s9yLcwcwLxhhOMCmRQOhV218ZAqZLhsyhzULYyDa1QPZ
	p8YDT/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkO8g-00CFTQ-2T;
	Sun, 24 Sep 2023 12:23:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkO8d-00CFRy-1t
	for linux-riscv@lists.infradead.org;
	Sun, 24 Sep 2023 12:23:05 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8170F3F18B
	for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695558179;
	bh=jfhJ/0WF4K0ac4kOBJQChSkyfixsrhUS+n4MUiLhPoU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=aTEPH7AG51ll6ZckyjDCqAmu3aq3nMWmiVmJzkk7PTqiw2y0W+rLRl66nnfL9i3i5
	 jkEEyAfV3KSAxOh3DT7WLvRHjDsNkhtC9il1j7sDPhbcFLcrvK7lNcuMLruNlZzJ/A
	 nUKLL1rvNWLeb8sBx3OwRLq5ozqbnfQqANR9TN55/pcFCmmAER8NAQse78cot8d3lj
	 ZIpmA8QD+EA7xqEXrDsjF6NPcYFyPHG1kImo3ge57dSw8cHxnQTLLdbdD9vwpohxNl
	 nqxhcyFpTBqrwAL23/T0yf1i0019l5KsR5SguyCso12mYwrZ0K/9Mq16F9FadLFUbQ
	 /ghXVdUgAqFjQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41360d145b1so79571181cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Sep 2023 05:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695558178; x=1696162978;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jfhJ/0WF4K0ac4kOBJQChSkyfixsrhUS+n4MUiLhPoU=;
        b=hxxlD+zA7+9taxSN2lXqhqQzr6VYwDWCcNNhS1xHP2X1MCG4etCZz6mH4vCmZ5N8mq
         SRpYnocMXZAwi5t4iwPYLpihL6/81N9E8ZM1gG3VBGkBTgPhL4czzj4WNz7qUi+Lx+v0
         dXlmL6KmoJAVcvkQt26/fgwgrWEXYEtTGSnTnAbao04parQD6iNUALhgeDquNl3avZBh
         osDx4AELEWVUwqHW9xKB2iW+QrmUecjaPGBNhoSsgviwuUXZNk7eSr57vCyUnKlpwXiI
         EhHUzlnjh+7kACfI/6rxTNDhspAynQ2tmRRDF+TZ5bsqTckDZzYZYWspjvkjDC6mus5P
         9mxg==
X-Gm-Message-State: AOJu0YwxlL3NaUjsPzRnVog0DcJZSc5CTthiRka+qGfgjPIe68LF456G
	DJ0NZWirJ7PTRSnmz0Rjm1CtEEV2TDig3BjUXwR1kgAGUUN/0HS6RFOcLu3hyFQUfLV9B99nXUa
	VZze+lueA0zXfryYL1DbJ7bVqAMKRpy0uOuT64/U8crJbCdRB+Amvd8WA+Fbliw==
X-Received: by 2002:a05:622a:11d0:b0:417:a2f9:bba6 with SMTP id n16-20020a05622a11d000b00417a2f9bba6mr5214596qtk.60.1695558178535;
        Sun, 24 Sep 2023 05:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiwHHrokfnfsvNrp6NSrWblhXYjJGcMv/JbnJDQvm95NLPbJFdb6zEXKfDaz8fBlIbETJ1BPCcccjlv+akHoc=
X-Received: by 2002:a05:622a:11d0:b0:417:a2f9:bba6 with SMTP id
 n16-20020a05622a11d000b00417a2f9bba6mr5214484qtk.60.1695558175223; Sun, 24
 Sep 2023 05:22:55 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 Sep 2023 12:22:54 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230923152653.3371216-1-cyrevolt@gmail.com>
References: <20230923152653.3371216-1-cyrevolt@gmail.com>
Mime-Version: 1.0
Date: Sun, 24 Sep 2023 12:22:54 +0000
Message-ID: <CAJM55Z8hfZ3+-=Gea9o_0yRH6-kD1dVMfXHOu-k2GxghK2RwJw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: Add VisionFive 2 PHY supplies
To: Daniel Maslowski <cyrevolt@googlemail.com>, Walker Chen <walker.chen@starfivetech.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Daniel Maslowski <cyrevolt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_052303_988470_3A754046 
X-CRM114-Status: GOOD (  23.68  )
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

RGFuaWVsIE1hc2xvd3NraSB3cm90ZToKPiBJIGNoZWNrZWQgdGhlIHNjaGVtYXRpY3MgdG8gc2Vl
IHdoYXQgcG93ZXIgc3VwcGxpZXMgYXJlIG5lZWRlZC4KPiBUaGlzIGFsbG93cyBmb3IgdXNpbmcg
ZXRoZXJuZXQgd2l0aG91dCBvdGhlciBkcml2ZXJzIGVuYWJsZWQKPiB0aGF0IHdvdWxkIGNvaW5j
aWRlbnRhbGx5IGVuYWJsZSB0aGUgc2FtZSBwb3dlciBzdXBwbHkuIOKaoQo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIE1hc2xvd3NraSA8Y3lyZXZvbHRAZ21haWwuY29tPgo+IC0tLQo+ICAuLi4v
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4zYi5kdHMg
ICAgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25m
aXZlLTItdjEuM2IuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3Rh
cmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNiLmR0cwo+IGluZGV4IGQ0ZWE0YTJjMGI5Yi4uYmMxYWMx
MmJjNzFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4zYi5kdHMKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuM2IuZHRzCj4gQEAg
LTE2LDEyICsxNiwxNCBAQCAmZ21hYzAgewo+ICAJc3RhcmZpdmUsdHgtdXNlLXJnbWlpLWNsazsK
PiAgCWFzc2lnbmVkLWNsb2NrcyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBfVFg+Owo+
ICAJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmYW9uY3JnIEpINzExMF9BT05DTEtfR01BQzBf
Uk1JSV9SVFg+Owo+ICsJcGh5LXN1cHBseSA9IDwmdmNjXzN2Mz47Cj4gIH07Cj4KPiAgJmdtYWMx
IHsKPiAgCXN0YXJmaXZlLHR4LXVzZS1yZ21paS1jbGs7Cj4gIAlhc3NpZ25lZC1jbG9ja3MgPSA8
JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX0dNQUMxX1RYPjsKPiAgCWFzc2lnbmVkLWNsb2NrLXBhcmVu
dHMgPSA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX0dNQUMxX1JNSUlfUlRYPjsKPiArCXBoeS1zdXBw
bHkgPSA8JnZjY18zdjM+Owo+ICB9OwoKSGkgRGFuaWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2ghIEkndmUgbG9va2VkIGludG8gdGhpcyBhIGJpdCBub3cgYW5kIEkgZm91bmQgMyB0aGluZ3M6
CgoxKSBUaGUgdmNjXzN2MyByZWd1bGF0b3IgKERDREMxIG9uIHRoZSBQTUlDKSBhbHJlYWR5IGhh
cyB0aGUKICAgcmVndWxhdG9yLWFsd2F5cy1vbiBwcm9wZXJ0eSwgc28gc2hvdWxkIG5ldmVyIGJl
IHR1cm5lZCBvZmYgZXZlbiBpZiB0aGVyZQogICBhcmUgbm8gY29uc3VtZXJzLgoKMikgQXMgZmFy
IGFzIEkgY2FuIHRlbGwgdGhlIHNjaGVtYXRpYyBmb3IgYm90aCB0aGUgMS4yQSBhbmQgMS4zQiBz
YXlzIHRoZSBQSFlzCiAgIGFyZSBwb3dlcmVkIGJ5IERDREM2IChhbmQgbm90IERDREMxKSBvbiB0
aGUgUE1JQyB2aWEgdGhlIFZERDMzX0lPIGxpbmUuCgozKSBUaGVyZSBkb2Vzbid0IHNlZW0gdG8g
YmUgYW55IGdlbmVyaWMgY29kZSBpbiB0aGUgZHdtYWMgZHJpdmVyIGhhbmRsaW5nIHRoZQogICBw
aHktc3VwcGx5IHByb3BlcnR5LCBvbmx5IHRoZSBSb2NrY2hpcCB3cmFwcGVyIChkd21hYy1yay5j
KSBkb2VzIHRoYXQuCgpTbyBhbGwgaW4gYWxsIEknbSBhIGxpdHRsZSBjb25mdXNlZCBob3cgdGhp
cyBjaGFuZ2UgY2FuIG1ha2UgYSBkaWZmZXJlbmNlIGZvcgp5b3UuCgpAV2Fsa2VyIGRvZXMgdGhl
IGFib3ZlIGFuZCAyKSBpbiBwYXJ0aWN1bGFyIHNlZW0gY29ycmVjdCB0byB5b3U/CgpJJ2QgZXhw
ZWN0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgaW5zdGVhZCAoYWx0aG91Z2ggc3BsaXQg
aW4gMyBwYXRjaGVzKS4KRGFuaWVsLCBkb2VzIHRoaXMgd29yayBmb3IgeW91PwoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEw
LWR3bWFjLnlhbWwKYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJm
aXZlLGpoNzExMC1kd21hYy55YW1sCmluZGV4IDVlN2NmYmJlYmNlNi4uOWNlODc3NzgyNDE5IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZl
LGpoNzExMC1kd21hYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKQEAgLTU0LDYgKzU0LDkgQEAgcHJvcGVy
dGllczoKICAgICBtaW5JdGVtczogMwogICAgIG1heEl0ZW1zOiAzCgorICBwaHktc3VwcGx5Ogor
ICAgIGRlc2NyaXB0aW9uOiBQSFkgcmVndWxhdG9yCisKICAgcmVzZXRzOgogICAgIGl0ZW1zOgog
ICAgICAgLSBkZXNjcmlwdGlvbjogTUFDIFJlc2V0IHNpZ25hbC4KZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNp
CmIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2
ZS0yLmR0c2kKaW5kZXggMjIwOWQ1MzQ4OTI4Li42NjMzYzhkMjliZTcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5k
dHNpCisrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtMi5kdHNpCkBAIC0xMDEsNiArMTAxLDcgQEAgJnRkbV9leHQgewogJmdtYWMwIHsK
IAlwaHktaGFuZGxlID0gPCZwaHkwPjsKIAlwaHktbW9kZSA9ICJyZ21paS1pZCI7CisJcGh5LXN1
cHBseSA9IDwmdmRkMzNfaW8+OwogCXN0YXR1cyA9ICJva2F5IjsKCiAJbWRpbyB7CkBAIC0xMTcs
NiArMTE4LDcgQEAgcGh5MDogZXRoZXJuZXQtcGh5QDAgewogJmdtYWMxIHsKIAlwaHktaGFuZGxl
ID0gPCZwaHkxPjsKIAlwaHktbW9kZSA9ICJyZ21paS1pZCI7CisJcGh5LXN1cHBseSA9IDwmdmRk
MzNfaW8+OwogCXN0YXR1cyA9ICJva2F5IjsKCiAJbWRpbyB7CkBAIC0xODIsNiArMTg0LDEzIEBA
IHZkZF9jcHU6IGRjZGMyIHsKIAkJCQlyZWd1bGF0b3ItbmFtZSA9ICJ2ZGQtY3B1IjsKIAkJCX07
CgorCQkJdmRkMzNfaW86IGRjZGM2IHsKKwkJCQlyZWd1bGF0b3ItYm9vdC1vbjsKKwkJCQlyZWd1
bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA9IDwzMzAwMDAwPjsKKwkJCQlyZWd1bGF0b3ItbmFtZSA9ICJ2ZGQzM19pbyI7CisJCQl9
OworCiAJCQllbW1jX3ZkZDogYWxkbzQgewogCQkJCXJlZ3VsYXRvci1ib290LW9uOwogCQkJCXJl
Z3VsYXRvci1hbHdheXMtb247CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdGFyZml2ZS5jCmIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtc3RhcmZpdmUuYwppbmRleCA5Mjg5YmI4N2MzZTMuLjJjZTM0OTQyMTk4
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
c3RhcmZpdmUuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1zdGFyZml2ZS5jCkBAIC0xMiw2ICsxMiw3IEBACiAjaW5jbHVkZSA8bGludXgvcHJvcGVydHku
aD4KICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFw
Lmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CgogI2luY2x1ZGUgInN0
bW1hY19wbGF0Zm9ybS5oIgoKQEAgLTk3LDYgKzk4LDcgQEAgc3RhdGljIGludCBzdGFyZml2ZV9k
d21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBwbGF0X3N0
bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7CiAJc3RydWN0IHN0bW1hY19yZXNvdXJjZXMgc3RtbWFj
X3JlczsKIAlzdHJ1Y3Qgc3RhcmZpdmVfZHdtYWMgKmR3bWFjOworCXN0cnVjdCByZWd1bGF0b3Ig
KnJlZ19waHk7CiAJc3RydWN0IGNsayAqY2xrX2d0eDsKIAlpbnQgZXJyOwoKQEAgLTEyNCw2ICsx
MjYsMTEgQEAgc3RhdGljIGludCBzdGFyZml2ZV9kd21hY19wcm9iZShzdHJ1Y3QKcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJS
KGNsa19ndHgpLAogCQkJCSAgICAgImVycm9yIGdldHRpbmcgZ3R4IGNsb2NrXG4iKTsKCisJcmVn
X3BoeSA9IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVfb3B0aW9uYWwoJnBkZXYtPmRldiwgInBo
eSIpOworCWlmIChJU19FUlIocmVnX3BoeSkpCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2
LT5kZXYsIFBUUl9FUlIocmVnX3BoeSksCisJCQkJICAgICAiZXJyb3IgZ2V0dGluZyBwaHkgcmVn
dWxhdG9yXG4iKTsKKwogCS8qIEdlbmVyYWxseSwgdGhlIHJnbWlpX3R4IGNsb2NrIGlzIHByb3Zp
ZGVkIGJ5IHRoZSBpbnRlcm5hbCBjbG9jaywKIAkgKiB3aGljaCBuZWVkcyB0byBtYXRjaCB0aGUg
Y29ycmVzcG9uZGluZyBjbG9jayBmcmVxdWVuY3kgYWNjb3JkaW5nCiAJICogdG8gZGlmZmVyZW50
IHNwZWVkcy4gSWYgdGhlIHJnbWlpX3R4IGNsb2NrIGlzIHByb3ZpZGVkIGJ5IHRoZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
