Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B804C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKa21IraKVdNMb6hFd8BJVtUsYKr6PcagR/gJ40jZMU=; b=ecZNCcB0HH/3YL
	0TQyR5e7pwAp1E4aRdsxGRKFnTDXORXw+dJ5i4ypoyYbGp5Tr/gFqOUhNHygYW1Zs2f6QwdS+sxc3
	GooSMSR0A0ntcME8/azx9Bf4kuTYEn+JtXrKXp0tzjT28NqHq+DQL3ia+qMsbHaXKMXmoQ1XyykDp
	ZSgc1D27iCMJCh99LnmE5unXAFmj7UZcHoaD8GeFjOF3wEZtjn1+J0qwtCWuRX3EHrTf3jYHQOv5z
	0YjA5lFQNTqtUW4CrqF75cSQTVUT+h9EXZ6SHUqc5dbYtWLcXKMkvlB/EHbGkvfFlmWD9LKYNzqOi
	aN0xI9fBgJYSZcjcaj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vOW-0000000DyHQ-1w2N;
	Thu, 24 Apr 2025 12:09:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7trU-0000000Dgm6-0PPz
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=; b=XNd3vPkbJz/8rURWI0VPKMdglD
	UePeHa6wSI08ZXDCCFHg1VYABB09CyleGj/KQFlR5zr1Fzmsr1shzurYcY07fsZr7+8C2DhF4Q2QB
	YCXNiykudqCwgQbZBUELKys5VqdYYNZc6gf6uTkkHTuqSq/sgLDb7kbSHUpvnxd7CN3AiQ7EKK4n6
	9YtNWs7hpgm2LPBgOq3b77QMtUA2kKZ1CNNzxRqWLLyTujrgDmwiw/6fMylGhRA2nSGkBDB0lYZ9t
	/Hy5noSuy/tXax4ss4ebsX26blRJUI2QsURJ5HIskZX4n97P+Jn0NMCwDv7sVEm6uKVmynTjkPkK4
	vHROe3Lw==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7trR-0000000Bjv8-0R7W
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:31:18 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6ff0c9d1761so9847437b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745490674; x=1746095474; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=;
        b=iBJHTmuPIBKuSOPYaDnE/UrBG916ZnhflrHclnQpVwbueo4MTGvgLsqwYKJdzLFkgF
         CQJtjwQ4QHLLbpMlSaB2EUT5h+7cWKP9yfb4fTwwM95b76J6QoG4c+CSsK+X8UOytedf
         /Ykkmgk1JMqfq9sXvjXXVaqOELLkargjb4ltL1y6k6wKuDgSTAoOIkMjl9RTXbWx6dNP
         OlRkASYhtLE/4ApGummItIMngYC2DTiy1MWX+OsihsMvMGZCvtaflBei4TSzL3Qsyh7R
         DcEp8xSjVblA7moFFwyyuNJi8iwdbZ0QicSahsUaX3jImQSuRxvGGRUV/1DuI4AVF/XJ
         LKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490674; x=1746095474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veuDQajYZQmtwy5soBS8bgeTiDpHDVxRfRcmVV3dkkA=;
        b=pOeAWnKKAR4wdt/VGvhJBcXOvKQHphbFojAfKN0R8Ygt+mTBvJhgVBYbWLOkvpww4L
         ADIGwxuXA0aLoHx9U4ubwG30cSqkAnu+C8Qiqdrqm9kbLf1dcIfQVnWkkClAZEHieqto
         xdMTq5OIesIxwAzVkUwhQWb10QYZsko2ap1aYq06OCvps74YoYDiY3LCTFxvvZ8jcbTF
         Mf0uOTHl2PIjWz3HEFOISGQ0WultfJkqngK9OOyIv5zxJHhFoWfIpS2BN49zdOUdYWd/
         yLcnSXQtBN4UZhxHkYhY0Qx/vAfaJ67DjAld87Xt4cnDABSQK9TBX1dSsVATJGYOq7r8
         UOQg==
X-Forwarded-Encrypted: i=1; AJvYcCWNHq5dCEq6GcrdYuylut8mkW8UU1hcRCQESLr85U6/UQEzuzbH61TW9Jhlu0vudvVUWxGUMRHTDDcRAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXYDioEvL4QQPrRE4dCY2QN3u8P7vD4O47+FDQEG7wClQavTY
	98IgzN1vRiIeFm6mB7qerlpeZWvHEPM/S6WAu1bX3wO1X8K+Ag9bzqbb0T3jH58kI2UDQZt8h5u
	f1o1Wo2htKzVvsr6vj6356cm7uWTG7q6fOEgaMA==
X-Gm-Gg: ASbGnctvJAAg7gLOys0o7dAGMJzN80uJwb9HWwnOnCuDq0Dh795PQvH2J/wDsb/sZyv
	m62bF0LZPeKybn5llBt/l9tk6SEs1fhFB2SSK1ZrMcTOpQncg6X9NESBfREoDCCpz/xeiIVxl5G
	X77CKk7kYD/2EjoBaWJicAAQ==
X-Google-Smtp-Source: AGHT+IFaCgdi/D8Mz2g+4kwknyPmgE+BAWyWeosYJdPhAXZY/ccwJe6YGp50DFdsLuHQOqspxP6UrWYnj+YkNWqFGqY=
X-Received: by 2002:a05:690c:dd1:b0:6fb:46dc:d9c4 with SMTP id
 00721157ae682-7083ec4d087mr32192027b3.12.1745490673788; Thu, 24 Apr 2025
 03:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com> <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
In-Reply-To: <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 12:30:58 +0200
X-Gm-Features: ATxdqUHtrYzEaLg25kuj53TyY1Q41AznmucaPtZY25yhlzNHITgdvG43lqbYwqY
Message-ID: <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113117_262329_9B7FD165 
X-CRM114-Status: GOOD (  28.77  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTE6MzjigK9BTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4gd3JvdGU6Cj4g5ZyoIDIwMjUtMDQtMjTmmJ/mnJ/lm5vnmoQgMTA6NTEgKzAyMDDv
vIxMaW51cyBXYWxsZWlq5YaZ6YGT77yaCj4gPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCA4OjIw
4oCvQU0gSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+ID4KPiA+ID4gVGhl
IEpINzExMCBTb0MgY291bGQgc3VwcG9ydCBpbnRlcm5hbCBHUEkgc2lnbmFscyB0byBiZSByb3V0
ZWQgdG8KPiA+ID4gbm90Cj4gPiA+IGV4dGVybmFsIEdQSU8gYnV0IGludGVybmFsIGxvdy9oaWdo
IGxldmVscy4KPiA+ID4KPiA+ID4gQWRkIHR3byBtYWNyb3MsIFBBRF9JTlRFUk5BTF9MT1cgYW5k
IFBBRF9JTlRFUk5BTF9ISUdILCBhcyB0d28KPiA+ID4gdmlydHVhbAo+ID4gPiAicGFkcyIgdG8g
cmVwcmVzZW50IGludGVybmFsIEdQSSBzb3VyY2VzIHdpdGggZml4ZWQgbG93L2hpZ2gKPiA+ID4g
bGV2ZWxzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4KPiA+Cj4gPiBBcyBwZXIgbXkgb3RoZXIgcmVwbHkgaW4gdGhlIHByZXZpb3VzIHBv
c3QsIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUKPiA+IGhhbmRsZWQgaW50ZXJuYWwgaW4gdGhlIGtl
cm5lbCBpbnN0ZWFkIHVzaW5nIGEgdGlnaHRlciBpbnRlZ3JhdGlvbgo+ID4gYmV0d2Vlbgo+ID4g
dGhlIEdQSU8gYW5kIHBpbiBjb250cm9sIHBhcnRzIG9mIHRoZSBkcml2ZXIgYW5kIHV0aWxpemlu
ZyB0aGUKPiA+IGdwaW8tc3BlY2lmaWMgc3RydWN0IHBpbm11eF9vcHMgY2FsbGJhY2tzLgo+Cj4g
V2VsbCBJIGNhbm5vdCB1bmRlcnN0YW5kIHRoaXMgLS0gdGhlc2Ugc2lnbmFscyBhcmUgbm90IEdQ
SU9zLCB0b3RhbGx5Cj4gbm90IHJlbGF0ZWQgdG8gdGhlIEdQSU8gc3Vic3lzdGVtIChiZWNhdXNl
IHRoZXkncmUgb25seSBwaW5tdXgsIG5vdAo+IHJlbGF0ZWQgdG8gR1BJT3MpLiBUaGlzIGlzIGRl
c2NyaWJlZCBpbiBteSBwcmV2aW91cyBtYWlsLgoKT0sgc29ycnkgaWYgSSdtIGEgYml0IGR1bWIg
YXQgdGltZXMgOigKCkkgZ3Vlc3MgSSB3YXMgZmFsbGluZyBpbnRvIHRoZSBjb21tb24gY29uZnVz
aW9uIG9mICJzb21ldGhpbmcgbmFtZWQKZ2VuZXJhbCBwdXJwb3NlIiBzdWNoIGFzIHlvdXIgR1BJ
IGFuZCBHUE8gcmVnaXN0ZXJzLCBpcyBhbHNvCnJlbGF0ZWQgdG8gR1BJTyB3aGljaCBpdCBpcyBu
b3QsIGF0IGxlYXN0IG5vdCBhbHdheXMuCgo+IFRoZSBwaW4gbXV4IG9mIEpINzExMCBzdHJpY3Rs
eSByb3V0ZSBpdHMgaW5wdXRzIHRvIGl0cyBvdXRwdXRzLiBGb3IKPiBzaWduYWxzIGZyb20gb3Ro
ZXIgU29DIGJsb2NrcyAodG8gZXh0ZXJuYWwgcGlucyksIHRoZSByZWdpc3RlcnMgZGVmaW5lCj4g
aG93IE9VVC9PRW4gb2YgSU8gYnVmZmVycyAqYXJlIGRyaXZlbiBieSogdGhlIHNpZ25hbHM7IGhv
d2V2ZXIgZm9yCj4gc2lnbmFscyB0byBvdGhlciBTb0MgYmxvY2tzIChmcm9tIGV4dGVybmFsIHBp
bnMpLCB0aGUgcmVnaXN0ZXJzIGRlZmluZQo+IGhvdyBJTiBvZiBJTyBidWZmZXJzICpkcml2ZSog
dGhlIHNpZ25hbHMuIChUaGlzIGZvbGxvd3MgdGhlIGdlbmVyaWMKPiBzaWduYWwtZHJpdmluZyBy
dWxlIHRoYXQgb25lIHNpZ25hbCBjYW4gZHJpdmUgbXVsdGlwbGUgc2lnbmFscyBidXQKPiBjYW5u
b3QgYmUgbXVsdGktZHJpdmVuKS4KPgo+IEluIGFkZGl0aW9uIHRoZSBzaXR1YXRpb24gSSBhbSB0
cnlpbmcgdG8gaGFuZGxlIGhlcmUgaXMgYW4gYWRkaXRpb24gdG8KPiB0aGUgbGF0dGVyIHBhcnQg
b2YgdGhlIHByZXZpb3VzIHBhcmFncmFwaCAtLSBpbiBhZGRpdGlvbiB0byA2NCBpbnB1dHMKPiBj
b3JyZXNwb25kaW5nIHRvIDY0IEdQSU9zLCB0d28gZXh0cmEgaW5wdXRzLCBvbmUgYWx3YXlzIDAg
YW5kIGFub3RoZXIKPiBhbHdheXMgMSBhcmUgYXZhaWxhYmxlIHRvIHRoZSBwaW4gY29udHJvbGxl
ciBmb3IgZHJpdmluZyBvdGhlciBTb0MKPiBibG9ja3MnIGlucHV0IChhcyBvdXRwdXQgb2YgcGlu
IGNvbnRyb2xsZXIpLgoKT0sgLi4uIG1heWJlIEkgZ2V0IGl0IG5vdy4KCj4gPiBUaGlzIHNvbHV0
aW9uIGxvb2tzIGxpa2Ugc29mdHdhcmUgY29uZmlndXJhdGlvbiBkaXNndWlzZWQgYXMgaGFyZHdh
cmUKPiA+IGNvbmZpZ3VyYXRpb24uCj4KPiBXZWxsIHRoaXMgc29sdXRpb24gaGFuZGxlcyB0aGVz
ZSBpbnRlcm5hbCB3aXJlcyBpbiB0aGUgc2FtZSB3YXkgYXMKPiBzaWduYWxzIGZyb20gZXh0ZXJu
YWwgR1BJT3MsIGV4Y2VwdGluZyBzcGVjaWZ5aW5nIHNwZWNpYWwgR1BJTyBudW1iZXJzLgo+IElm
IHlvdSBhcmUgYWdhaW5zdCB0aGUgcHJpbmNpcGxlLCBtYXliZSB0aGUgY3VycmVudCBhbHJlYWR5
LWluY2x1ZGVkCj4gR1BJT01VWCBzeXN0ZW0gb2YgdGhlIFN0YXJGaXZlIHBpbmN0cmwgaXMgdG8g
YmUgYmxhbWVkIGluc3RlYWQgb2YgbXkKPiBzbWFsbCBleHRlbnNpb24gdG8gaXQuCj4KPiBJIG11
c3QgYWRtaXQgdGhhdCB0aGUgY3VycmVudCBHUElPTVVYIHN5c3RlbSBpc24ndCBhIGZhaXRoZnVs
Cj4gcmVwcmVzZW50YXRpb24gb2YgdGhlIGhhcmR3YXJlIGJlY2F1c2UgaXQncyBhIHBhZC1jZW50
cmljIHNldHVwIGluc3RlYWQKPiBvZiBhIHJlZ2lzdGVyLWZpZWxkLWNlbnRyaWMgb25lLCB3aGlj
aCBpc24ndCB2ZXJ5IG5hdHVyYWwgZm9yIGlucHV0Cj4gc2lnbmFscy4gSG93ZXZlciBjb25maWd1
cmF0aW5nIHRoZSBtdXggaW4gc3VjaCBhIHdheSBpcyBhZ2FpbnN0IHBlb3BsZQo+IHJlYWRpbmcs
IGFuZCB3ZSdyZSBub3QgYWJsZSB0byBicmVhayB0aGUgc3lzdGVtIGJlY2F1c2UgaXQncyBhbHJl
YWR5Cj4gdGhlcmUuCj4KPiBXZWxsIGluIHRoZSBzaXR1YXRpb24gdGhhdCBvbmUgR1BJTyB1c2Vk
IGFzIGlucHV0IGRyaXZlcyBtdWx0aXBsZQo+IGludGVybmFsIHNpZ25hbHMgdGhlIHBpbm11eCBs
b29rcyBhIGxpdHRsZSBjb25mdXNpbmcgdG9vLCBlLmcuIHRoZSBJMlMKPiBjbG9jayBzaXR1YXRp
b24gSSBtZW50aW9uZWQgaW4gbXkgcmVwbHkgaW4gdGhlIHByZXZpb3VzIHJldmlzaW9uIG9mIHRo
ZQo+IHBhdGNoc2V0LgoKSSBndWVzcyB3aGF0IHJ1YnMgbWUgdGhlIHdyb25nIHdheSBpcyB3aHkg
dGhlIGV4dGVybmFsIHVzZXJzCihkZXZpY2VzLCBkZXZpY2UgZHJpdmVycyBvciBldmVuIHBpbiBo
b2dzKSBjYW5ub3QgdHJpZ2dlciB0aGUgY2hhaW4gb2YKZXZlbnRzIGxlYWRpbmcgdG8gdGhpcyBj
b25maWd1cmF0aW9uLCBpbnN0ZWFkIG9mIGRpZmZlcmVudCAibWFnaWMiCmNvbmZpZ3VyYXRpb25z
IHRoYXQgYXJlIGp1c3Qgc2V0IHVwIGluIHRoZSBwaW4gY29udHJvbGxlciBpdHNlbGYuCgpCdXQg
aWYgeW91IGFyZSBwb3NpdGl2ZWx5IGNvbnZpbmNlZCB0aGF0IHRoZXJlIGlzIG5vIG90aGVyIHdh
eSwKSSBndWVzcyBJIGhhdmUgdG8gbGl2ZSB3aXRoIGl0LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
