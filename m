Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D48C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGYtv7QA1/hXMeV3agRGoxOaphcoOhxgEt3M2Px8ioc=; b=ROVJFJshCafX9G
	Zp81YxkmvFcZFJL37iuExeIWeg9slkAvybb7hfWiGufleRjpGaRveomslw88xslAibTHW7rQtgk9R
	wLvMHKBZPg1VW18jJEKVE1lsovdi5csxOECrAoEUhJFVbo5oDcfOpLwCOa2v5+sfTyEy4ywUOGY/7
	SiMeoouz63ubk86RLaSRnKBvaM1UcTNcsODRLJOTZyqpfa3edfmz/LLno2XWhOAwDARjxvi/VvFWw
	NB5unZTYSjWsm8LLmRFfaddN0jfWmRJ8MAhD6ZSJMfIksuSDpRgYCBLc0uubjZ99HqMexIFCPTrVP
	gRf6iMpzYoGiAJrPBDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8yE-00AuCI-DX; Wed, 01 Feb 2023 08:59:58 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8yC-00AuBh-9w
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:59:57 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4fd37a1551cso236596627b3.13
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 00:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC1Teq7XfaidJwL0w/SdzFX7XLaiTcmzfle7ylS8rkM=;
        b=jqBJ/Wy2ccQVFxo6tA6/JjU7nOnDtBg6NU7moAmy2SQWIwT5grBWro9bQ7KJesWUVk
         EtTKNDu0IbecZ/dYauIEPpv/WGVkVLiFqPrdMBIvYhYHDxxOoWXyaOKHPQFwbP+UIuNS
         CD2Hq/3Wukx+tOyTxQbler6OZHdDSY+2xG7Cbl8kt8IYlrLqCo2/MCrJYJAY74G219mn
         XLiMmp0TnTANvC1pGv6h0ZQCTMLZaXHeThsSdCGZGQNbXqnaV6+y4moko61zH8Nx22E2
         JobhaKWj2Xg9k+DCtWZQrfXPLzD7vWBgMyefqzM7wxRelBGgBwLXMe0flBbdYnI5BCzC
         pDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC1Teq7XfaidJwL0w/SdzFX7XLaiTcmzfle7ylS8rkM=;
        b=BSFJezYzQ/9DlWHHN9DNdL9mTAA6VSVdyCIYGYr/DpBi068swsYsEeHhtBLAXgap9A
         suQ7w9eFBezGUi7rh3V+JcZt+X6LRq1ntWlhQbGa6uspzS8QW+GR5SQRY/xaRPV+O3gU
         ipoLUDEhWGd4wcHT6lTVbhDeOTbVkvFKWFGfDMJTVNSzLB4e4xSy/Eb7dgbvO/OrhOTP
         i7S7UrOXJLkEWROFNSTSK2YB0uxzon7/M7PbQJQEeE8oRQFAy4dRdCbGuM7JlE6pKPjI
         BzEEmpR5V0wao7Gmgj/mK6OpXkhuNtC5PEpckZWcsSZznZpvAODFqWBEZKcSbKfRdTLw
         YWbw==
X-Gm-Message-State: AO0yUKUPUsqAJcMNHz/X05xlPW94WEsifPgXSXiYlDG2e88JriMXvy9C
	ZtAR0SxB/Ke9ATuq7pykwefF1t4WBDPk6LNEZF8ERA==
X-Google-Smtp-Source: AK7set+z1Sq/bReNxuGLJvSaXuf+C9wc9S9RP/PcrOXVL2vHdpyUdGOLcIV6A6Swpl/aJQNAD3xQDjok58MVZ9iLBHQ=
X-Received: by 2002:a81:8ac5:0:b0:506:8253:3444 with SMTP id
 a188-20020a818ac5000000b0050682533444mr173887ywg.436.1675241994924; Wed, 01
 Feb 2023 00:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-2-nylon.chen@sifive.com>
 <Y9len4GinXQ101xr@spud>
In-Reply-To: <Y9len4GinXQ101xr@spud>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 1 Feb 2023 16:59:40 +0800
Message-ID: <CAHh=Yk8NA2r-NH8EEVrEwr_Mcoz5hdkwDWxpG66Oo+uphgD59A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
To: Conor Dooley <conor@kernel.org>
Cc: aou@eecs.berkeley.edu, emil.renner.berthing@canonical.com, 
	geert+renesas@glider.be, heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_005956_372226_0299D30B 
X-CRM114-Status: GOOD (  19.25  )
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

SGkgQ29ub3IsCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCgpDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IOaWvCAyMDIz5bm0MuaciDHml6Ug6YCx5LiJIOS4iuWNiDI6MzLlr6vpgZPvvJoK
Cj4KPiBIZXkgTnlsb24sCj4KPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwNTozMjoyOFBNICsw
ODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gVGhpcyByZW1vdmVzIHRoZSBhY3RpdmUtbG93IHBy
b3BlcnRpZXMgb2YgdGhlIFBXTS1jb250cm9sbGVkIExFRHMgaW4KPiA+IHRoZSBIaUZpdmUgVW5t
YXRjaGVkIGRldmljZSB0cmVlLgo+ID4KPiA+IFRoZSByZWZlcmVuY2UgaXMgaGlmaXZlLXVubGVh
c2hlZC1hMDAucGRmWzBdIGFuZCBoaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmWzFd
Lgo+ID4KPiA+IFswXTogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlL2M1MmE4
ZTMyLTA1Y2UtNGFhZi05NWM4LTdiZjg0NTNmODY5OF9oaWZpdmUtdW5sZWFzaGVkLWEwMC1zY2hl
bWF0aWNzLTEucGRmCj4gPiBbMV06IGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2
ZS82YTA2ZDZjMC02ZTY2LTQ5YjUtOGU5ZS1lNjhjZTc2ZjQxOTJfaGlmaXZlLXVubWF0Y2hlZC1z
Y2hlbWF0aWNzLXYzLnBkZgo+Cj4gSWRlYWxseSB0aGVzZSB3b3VsZCBiZToKPiBMaW5rOiBodHRw
czovL3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvYzUyYThlMzItMDVjZS00YWFmLTk1Yzgt
N2JmODQ1M2Y4Njk4X2hpZml2ZS11bmxlYXNoZWQtYTAwLXNjaGVtYXRpY3MtMS5wZGYgWzBdCj4g
c28gdGhhdCB0aGV5IGludGVncmF0ZSBuaWNlIHdpdGggdGhlIGdpdCB0cmFpbGVycyBtZWNoYW5p
c20uCj4gSWYgeW91IHJlc2VuZCwgcGxlYXNlIHVwZGF0ZSB0aGVtIHRvIHJlZ3VsYXIgbGluayB0
YWdzLgo+Ckkgd2lsbCBmaXggdGhpcyBpc3N1ZS4KPiBJIGNoZWNrZWQgb3V0IHRoZSBjaXJjdWl0
cyBsYXN0IHRpbWUgYXJvdW5kIGFuZCBhZ3JlZWQgdGhhdCB0aGV5IHNob3VsZAo+IG5vdCBiZSBh
Y3RpdmUtbG93Lgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gSSBleHBlY3QgdGhhdCBib3RoIHBhdGNoZXMgd2lsbCBnbyB0aHJvdWdo
IHRoZSBQV00gdHJlZSB0b2dldGhlciwgc286Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29u
b3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBUaGFua3MsCj4gQ29ub3IuCj4KVGhhbmtzIGEg
bG90LgoKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2
ZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5s
ZWFzaGVkLWEwMC5kdHMgfCA0IC0tLS0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9o
aWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgfCA0IC0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDgg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lm
aXZlL2hpZml2ZS11bmxlYXNoZWQtYTAwLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZl
L2hpZml2ZS11bmxlYXNoZWQtYTAwLmR0cwo+ID4gaW5kZXggOTAwYTUwNTI2ZDc3Li43YTlmMzM2
YTM5MWMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUt
dW5sZWFzaGVkLWEwMC5kdHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bmxlYXNoZWQtYTAwLmR0cwo+ID4gQEAgLTUwLDcgKzUwLDYgQEAgbGVkLWNvbnRyb2xs
ZXIgewo+ID4KPiA+ICAgICAgICAgICAgICAgbGVkLWQxIHsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBwd21zID0gPCZwd20wIDAgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4g
LSAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZS1sb3c7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVOPjsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBtYXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGxhYmVs
ID0gImQxIjsKPiA+IEBAIC01OCw3ICs1Nyw2IEBAIGxlZC1kMSB7Cj4gPgo+ID4gICAgICAgICAg
ICAgICBsZWQtZDIgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMSA3
ODEyNTAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4gPiAtICAgICAgICAgICAgICAgICAgICAg
YWN0aXZlLWxvdzsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb2xvciA9IDxMRURfQ09MT1Jf
SURfR1JFRU4+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIG1heC1icmlnaHRuZXNzID0gPDI1
NT47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiZDIiOwo+ID4gQEAgLTY2LDcg
KzY0LDYgQEAgbGVkLWQyIHsKPiA+Cj4gPiAgICAgICAgICAgICAgIGxlZC1kMyB7Cj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAyIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lO
VkVSVEVEPjsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICBsYWJlbCA9ICJkMyI7Cj4gPiBAQCAtNzQsNyArNzEsNiBAQCBsZWQtZDMgewo+ID4K
PiA+ICAgICAgICAgICAgICAgbGVkLWQ0IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBwd21z
ID0gPCZwd20wIDMgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIGFjdGl2ZS1sb3c7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29sb3Ig
PSA8TEVEX0NPTE9SX0lEX0dSRUVOPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBtYXgtYnJp
Z2h0bmVzcyA9IDwyNTU+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gImQ0IjsK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRj
aGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVk
LWEwMC5kdHMKPiA+IGluZGV4IDA3Mzg3ZjljMTM1Yy4uMTFmMDhhNTQ1ZWU2IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRz
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEw
MC5kdHMKPiA+IEBAIC01Miw3ICs1Miw2IEBAIGxlZC1jb250cm9sbGVyLTEgewo+ID4KPiA+ICAg
ICAgICAgICAgICAgbGVkLWQxMiB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcHdtcyA9IDwm
cHdtMCAwIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsKPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBhY3RpdmUtbG93Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIGNvbG9yID0gPExF
RF9DT0xPUl9JRF9HUkVFTj47Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbWF4LWJyaWdodG5l
c3MgPSA8MjU1PjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJkMTIiOwo+ID4g
QEAgLTY5LDE5ICs2OCwxNiBAQCBtdWx0aS1sZWQgewo+ID4KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBsZWQtcmVkIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8
JnB3bTAgMiA3ODEyNTAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX1JFRD47Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgfTsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgbGVkLWdyZWVuIHsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMSA3ODEyNTAwIFBXTV9QT0xB
UklUWV9JTlZFUlRFRD47Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3RpdmUt
bG93Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVEX0NPTE9S
X0lEX0dSRUVOPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBsZWQtYmx1ZSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwd21zID0gPCZwd20wIDMgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlLWxvdzsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9CTFVFPjsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICB9Owo+ID4gICAgICAgICAgICAgICB9Owo+ID4gLS0KPiA+IDIuMzYuMQo+
ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
