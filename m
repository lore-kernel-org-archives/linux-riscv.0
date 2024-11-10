Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2B8D5E39B
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Nov 2024 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOxW6H1wMdHkd93PS1F6dS85QoW4AQ9kU3siUfbi2Wk=; b=BExCqR/Nu91ijY
	WNbohs4itLO8DS4nKSjCRpROHheXyJjW/DeQO3KUHUeVRbByXaKfM/JhFHxsE9tj+cx/9tq1jAjm3
	rTuSpUm8hDftHhSJ5FmUf+12DRduBUFf4xIxiCtbbC4W83l5jINXZ4+tyJTjpqkU6UoR0tVCFEQkv
	iNSV5e8h0R6fONb0vMFDn5BJPuEA35AhtFe02O8rXCaGupAl4oNgWk96kCCE6T4K9M3UbzTXq7HhU
	eyh1d8LvySnc6PcavJE0cGkObYqjP0KPHLpn+nxBGIGcoroSV9Z1roMhG19CYxWzydCrQdPXd28uF
	V/e7odwUHdAooFkR1u+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA5xs-0000000ElWr-38VI;
	Sun, 10 Nov 2024 11:18:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA5vv-0000000ElIt-3qHZ;
	Sun, 10 Nov 2024 11:16:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720d01caa66so3407313b3a.2;
        Sun, 10 Nov 2024 03:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731237402; x=1731842202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWLoy1wYXdVgZ3Zzo/mgTNAnxY3fZNEXmyBhaGh3Xds=;
        b=jYQOJq/PCK0H8Q+gSU20HgBAplCYAgft3ojwGHj0F37sNhUbY9JXWsViSAq/8q+um5
         lPNvt+KhZ8TWGAZGUgrW5ugvf7gTpyNgEQ5Zs/FVXmqKm8ShgExf/1+iLvO50/PtDu1c
         OVEJyKekm9upKAVC2kRvi/kS4vIWl+CzeVSRptgyjECPk1/3yjPqedSVld8F/egGyN46
         VE9Mw2dzBOEJ8lplBXxIGOqdUkJtu28bYTFgBB6qh1pTF0CKh9Zsd2dq+lSvUfXa9MnU
         TapuMNjCsx3xulvRvhSgal+ZgxTr+QxiBWNbr0fy2bcEz+rYDCnx41gnsyhB7qOJI0jG
         YDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731237402; x=1731842202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWLoy1wYXdVgZ3Zzo/mgTNAnxY3fZNEXmyBhaGh3Xds=;
        b=nTwvL1K3vfm4pMnWD/zHCKknrTgSjkuaPbrWp6ggXjGR0xcfa0ZmSSMjWjdIhk6f0p
         4QFpyZz00qqMh1eMCFTjro6jlsOhGxD1rzjNYMbLbi38I9PtC/43OKpJWF8Lndn4T6M/
         UiLoqPhwKPETpm+xAREagI6V9QbVITbMKD0ddyU31rVewjbCknMdRlE3cPkGUVBa7iBX
         rGnKFO5TBqpgB8/z0Wpgu+AgURbq8qSSKYQWBU0UroKkMtV3yjZHu7TqekXOe9azIox9
         um43swm9Bgg1uyY+K64Naod44W/BpHqDS1FeqVlGNX91pHFasnuOO2o4WRQIstL+xoJt
         Cz4A==
X-Forwarded-Encrypted: i=1; AJvYcCVDcOx98dzE1J/45lw0R25jGqB8h6Q43QCkDbd2Xa8uBGsu/jUKxaRTeBScKTmVkuyU0JSlg0LEDhnFixS8AxGy@lists.infradead.org, AJvYcCXYUInJQKYyzQ4BbPwAINbZm4tH8r/QQeGJlSop8+iRs+g2QnCEQYDBFYFxxjEqXkOMz0+dcb6gJiIYnHw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVRC/Hn2fBHL3rjXlWe0G042CRMhLquKHm1FqwjX+ULQVDBlhF
	FiGyGqQ4pqhK6PMhSlHNUAop4I+U1UZxn1CChFw0xIHq6sRZn95Z1sQO4Y8P7mn5rZmaz5N6H9f
	pWu1BVvwHmpPA0TN9QtvK9YDqKQ==
X-Google-Smtp-Source: AGHT+IGasTpM/6LzeFT5yJG2TU6X3TKSkJ385a+2Pbzh0IgAuKC/AoNByQH4zEUJkFnY3DZ/d/AESg6jv7LXg1ObLTE=
X-Received: by 2002:a17:90b:4a91:b0:2e2:a3aa:6509 with SMTP id
 98e67ed59e1d1-2e9b1697bf5mr11996579a91.14.1731237402258; Sun, 10 Nov 2024
 03:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20241011102751.153248-1-privatesub2@gmail.com>
 <20241011102751.153248-2-privatesub2@gmail.com> <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
In-Reply-To: <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Sun, 10 Nov 2024 14:16:31 +0300
Message-ID: <CAF4idNmDMQpFppUvCBbC1=SNMQBrTOqmFO60SMvKvaHvNJy=Bg@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_031643_977898_722BA8BB 
X-CRM114-Status: GOOD (  13.40  )
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

SGVsbG8gVXdlLAoKSSBhcHByZWNpYXRlIHlvdXIgc3VnZ2VzdGlvbiB0byB1c2UgYSBtb3JlIHN0
YW5kYXJkaXplZApwcm9wZXJ0eSBuYW1lIGxpa2UgInB3bS1udW1iZXIiIGluc3RlYWQgb2YgdmVu
ZG9yLXNwZWNpZmljIG5hbWVzLgoKU2luY2UgdGhlIG5hbWUgInB3bS1udW1iZXIiIGlzIHByZXNl
bnQgaW4gdHdvIGRyaXZlcnMsCndlIGNvdWxkIGNvbnNpZGVyIHVzaW5nIHRoaXMgbmFtZSBoZXJl
IGFzIGFuIG9wdGlvbi4KT3IgcGVyaGFwcyB3ZSBzaG91bGQgY2hvb3NlIGEgbmV3IGNvbW1vbiBu
YW1lICJucHdtcyIKYXMgeW91IHN1Z2dlc3RlZD8KClBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHlv
dSB0aGluayBhYm91dCB0aGlzLgoKQmVzdCByZWdhcmRzLApBbGVrc2FuZHIuCgrQstGCLCAyOSDQ
vtC60YIuIDIwMjTigK/Qsy4g0LIgMTE6NTYsIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAYmF5bGlicmUuY29tPjoKPgo+IEhlbGxvLAo+Cj4gT24gRnJpLCBPY3QgMTEsIDIwMjQg
YXQgMDE6Mjc6MzJQTSArMDMwMCwgQWxla3NhbmRyIFNodWJpbiB3cm90ZToKPiA+ICsgIGFsbHdp
bm5lcixwd20tY2hhbm5lbHM6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIG51bWJlciBvZiBQV00g
Y2hhbm5lbHMgY29uZmlndXJlZCBmb3IgdGhpcyBpbnN0YW5jZQo+ID4gKyAgICBlbnVtOiBbNiwg
OV0KPgo+IEkgd29uZGVyIGlmIHRoZSBudW1iZXIgb2YgY2hhbm5lbHMgaXMgYSBwcm9wZXJ0eSBj
b21tb24gZW5vdWdoIHRoYXQgd2UKPiBjYW4gdXNlICJudW0tcHdtLWNoYW5uZWxzIiBoZXJlIGlu
c3RlYWQgb2YgYSB2ZW5kb3Igc3BlY2lmaWMgcHJvcGVydHkuCj4gT3Igd291bGQgeW91IHN1Z2dl
c3QgYSBkaWZmZXJlbnQgbmFtZT8gZ3Bpby1jb250cm9sbGVyIG5vZGVzIGhhdmUKPiAibmdwaW9z
Iiwgc28gbWF5YmUgIm5wd21zIj8KPgo+IEEgcXVpY2sgZ3JlcCBzdWdnZXN0cyB3ZSBhbHJlYWR5
IGhhdmU6Cj4KPiAgICAgICAgIGZzbCxwd20tbnVtYmVyIGluIG14cy1wd20ueWFtbAo+ICAgICAg
ICAgc3QscHdtLW51bS1jaGFuIGluIHB3bS1zdC50eHQKPiAgICAgICAgIHNucHMscHdtLW51bWJl
ciBpbiBzbnBzLGR3LWFwYi10aW1lcnMtcHdtMi55YW1sCj4KPiBBcyBhIGZvbGxvdyB1cCB0aGlz
IGNvdWxkIHRoZW4gYmUgdXNlZCBieSBwd21jaGlwX2FsbG9jKCkgdG8gZGV0ZXJtaW5lCj4gdGhl
IG51bWJlciBvZiBjaGFubmVscyBpZiB0aGUgcGFzc2VkIG5wd20gdmFsdWUgaXMgMC4KPgo+IEJl
c3QgcmVnYXJkcwo+IFV3ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
