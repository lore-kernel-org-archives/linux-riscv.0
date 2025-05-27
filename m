Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20BAC54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 04:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNtRzM9m2HfHmIUQXBMyGEsWKLwA6gHKbAWjGWQ+nMw=; b=IBwVKm7d9PyCGM
	23dhyMC9ECgQzvx/xaOHtM9ASQHb2ttZcSCH8ajip0yuO2HBrMsx6tJqGN/P/NOWC3qRk8b2mP1pW
	bCUHNQP7aUnN3kfsgrJFIIHESQGy3r6Lo58dl5LkIj+GMowYtvO8bKPKXzkyxPcPVFspIMQDzBTcO
	OpIxYe1C1j16dB90V7Wk7jHBcpGPZbAqGYRTUT6gd18xaT/1QkeEhy9REIPDb1g7JX5aevD8Eql7c
	6yWPr8DcusscTbxaApvDi1OiPxeLPMM5/r2Mm13GQnG7yhyJvrPTcbcVxJ2c2DIngbzhUs9w88dDr
	A3vbHUh4TAScAH2ygFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJm3T-00000009sc4-3pFJ;
	Tue, 27 May 2025 04:36:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJm3Q-00000009sbd-3fiM
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 04:36:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ad88105874aso126653466b.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 21:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748320603; x=1748925403; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff6UC8ZTNe+I+eItze3lLHep9njcdURbGAHAI1WTvXE=;
        b=JWQMpn/iZXa0ofTHyMaiH5WFWQTApo7AD00wtGBgMDmCVy7iD+aBSvf4Q1ViCt/bp5
         ibfLvEh3dYXRo1MEXmXT6BpH/kO7yqMi9LL8Aa67Rag31SL9LD416N18KZCS05xvefZB
         SnlmVxw451N/0dM6qG8ZxOXTvOCGSuY/FA4XfjO8m2k6QZ7lOFthKzDwcY7EOUvl+tFv
         JDQtRGrzaOpguh7gRxGHXW9cz0A+g/OysSqaP6omQ1trOBJLPMGuJ8NlDF5Z8m+Okvtd
         8WcFvH3lRdy06N36Q3xgf4Qmgq6iGqPvlnmdPPBsdmq7ye9dHNouMuOsVFpCsNGeXlzU
         d9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748320603; x=1748925403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ff6UC8ZTNe+I+eItze3lLHep9njcdURbGAHAI1WTvXE=;
        b=pwi2iU1YALaS1EdNKM7E7Mdf0PtwAgpTGs4YZArVhUKh0A6auvbOvcNEml+WCsQn/S
         2VDtySQ/g0f9lajh8levSekWNr3t8sJf88UyzNTHFofRTPsj70WdfPnBmwLWU+Cbys3r
         XdvSQOpdSAylqeTKsDndKWfNG4ogjyy2Mk1RymomXya6scjgIj+MEzGV07647DRi67dY
         SXZNOsyURF004SJSBQbYtaurwunHP1bwZDPanmQ2hPHZw3QXceQlpsWf0SkejWAu6jEE
         Qa/ZM5m/relY/ewMobXI5VYrv+w6IcjHQ32uaAHEsTQgXPBuVRE1qNrc4uo4v0O02ewd
         GDuw==
X-Forwarded-Encrypted: i=1; AJvYcCUJP2YnVEt070l+IsmX+IaETtqCX4fnF2OZVUz4ja/L4tJwkz0GtbABJrR4QyMZ64bb1G6/mB6MV2Eq3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEq2eoxW2Nrp8+1ibFA++cpCsWySSk8TBPVNnPPbZn+PrQpE+r
	/OGp5I1hv2gMKaRDrwmtJ5DAoUpFn0ZzJbODIPb2MhLxdEeSMfAcHwLv2CYaqHnZ5BWla/CNVdE
	iCEUNYV+VY6S9oL/O36OicPXTc65jdkRjTLtDeOBNJg==
X-Gm-Gg: ASbGncsRZljsfv900xtIJmiRO/JjXLaAbQb7rF/WfAw7SD0Aa24w4A7tPinHfdMi2/c
	nRGIOA4/SJr81PoQ/nSI0MW/k8KsjOnFFsGFhzrBXAkFRLXZbyZ0OXoFSzltQE5nbGEZek8jyzm
	lt/qziaVmX89sYkc4IfXf/mRTZfSf5BKsAHw==
X-Google-Smtp-Source: AGHT+IGo6E8NJmIu7lDX7Br9+8Vm3DHhMozHXP52l3uoUCX6XeCyxyt49ZP4sGWmptiI89VtoPx732i1dLPzVdepgQc=
X-Received: by 2002:a17:907:7faa:b0:ad8:9084:4ec0 with SMTP id
 a640c23a62f3a-ad89084517emr53114066b.35.1748320602960; Mon, 26 May 2025
 21:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com> <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo> <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
 <20250527032701-GYA55693@gentoo>
In-Reply-To: <20250527032701-GYA55693@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 12:36:31 +0800
X-Gm-Features: AX0GCFsJEcR3EmfV6Iyccb0DPbXPaPY_2_j3czeJ2Y8-ennyhBu-Ez1iIOffJ7g
Message-ID: <CAH1PCMatGM6y2AhQB5e=DMu9kD8nxJ3Xv9AYy7Y=E8JhMV=Z8Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
To: Yixun Lan <dlan@gentoo.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_213645_184490_575BA285 
X-CRM114-Status: GOOD (  18.78  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMTE6MjfigK9BTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24gMTA6NDggVHVlIDI3IE1heSAgICAg
LCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNTo1MuKAr0FN
IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgR3VvZG9u
ZywgVXdlLAo+ID4gPgo+ID4gPiBPbiAxODo1NCBNb24gMjYgTWF5ICAgICAsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgQXByIDI5LCAyMDI1IGF0IDA0OjUwOjQ2UE0g
KzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+ID4gPiA+ID4gaW5kZXggMjgzNjYzNjQ3YTg2Li4x
OTVlYjg4NzRmM2MgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gPiA+IEBAIC0yMCw0ICsyMCwxMSBAQCB1
YXJ0MC0yLXBpbnMgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0
aCA9IDwzMj47Cj4gPiA+ID4gPiAgICAgICAgICAgICB9Owo+ID4gPiA+ID4gICAgIH07Cj4gPiA+
ID4gPiArICAgcHdtMTRfMV9jZmc6IHB3bTE0LTEtY2ZnIHsKPiA+ID4gPiA+ICsgICAgICAgICAg
IHB3bTE0LTEtcGlucyB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxL
MV9QQURDT05GKDQ0LCA0KT47Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIGJpYXMtcHVs
bC11cCA9IDwwPjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGgg
PSA8MzI+Owo+ID4gPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gPiA+ICsgICB9Owo+ID4gPiA+
Cj4gPiA+ID4gVGhlcmUgaXMgYSBuZXdsaW5lIGV4cGVjdGVkIGJlZm9yZSB0aGUgcHdtMTQtMS1j
Zmcgbm9kZSwgaXNuJ3QgdGhlcmU/Cj4gPiA+ID4KPiA+ID4gUmlnaHQsIEkgY291bGQgYW1lbmQg
dGhpcyBhbmQgZml4IGl0IHdoaWxlIGFwcGx5aW5nIHRoaXMgcGF0Y2gKPiA+ID4gKHNvIGlmIHRo
ZXJlIGlzIG5vIG90aGVyIHNlcmlvdXMgaXNzdWUsIG5vIG5lZWQgdG8gcmVzZW5kKQo+ID4gPgo+
ID4KPiA+IFRoYW5rcywgWWl4dW4uCj4gPgo+ID4gQnkgdGhlIHdheSwgZG8geW91IHBsYW4gdG8g
dGFrZSBwYXRjaGVzIDMgYW5kIDQgb2YgdGhpcyBzZXJpZXMgaW50bwo+ID4geW91ciB0cmVlPyBU
aGV5IG9ubHkgYXBwbHkgaWYgdGhlIFNwYWNlbWlUIHJlc2V0IHBhdGNoc2V0IGlzIGFwcGxpZWQK
PiA+IGZpcnN0Lgo+ID4KPiBZZXMsIGV4YWN0bHkuIFRoZSBkdHMgcGF0Y2ggd2lsbCBnbyB0aHJv
dWdoIFNwYWNlbWlUIFNvQyB0cmVlLCBhbmQgd2UKPiBoYXZlIHRvIHdhaXQgdW50aWxsIHJlc2V0
IHBhdGNoIHNlcmllcyBhcHBsaWVkLgo+CgpBcHByZWNpYXRlIHlvdSB0YWtpbmcgY2FyZSBvZiB0
aGlzLCBhbmQgdGhhbmtzIGZvciB0aGUgdXBkYXRlLgoKPiAtLQo+IFlpeHVuIExhbiAoZGxhbikK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
