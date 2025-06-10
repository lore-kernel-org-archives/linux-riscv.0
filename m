Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EDDC5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 06:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yvf2CCB1aWGowyt+jcLysYjCpTL/6oWxcnJB4fNJ5IU=; b=iq8z0Euyvua7N5
	JYjBDJmKOL5VcYLsifr27INkelh/0VWlCiEUEnF72jdY0K0vf36t5TSfS1cDcm6GNrLhapdQLZTTa
	5MLBn40CI1EpheQVYMprqiYXFyONHjcTHhntdzncxTzwReNsvz22sOpdZbiDlq3qaLVQ8XNNz2C5n
	x2EU2UqW4kpjMGmdRQwfphzddFf63ldgxFgJ0FVIHV2hOu0xaLXbKXQLAxKu9T8dphT51TudsUibi
	Vcu2eoK87OZ2x038IWtx8itbtH/V2zFYpNZeG98zM58FWGuKsnJDQ1AkrGUQFVtaQQRSWyB4kpipu
	EerI1ejVVhY+3ljDM28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsDn-00000005uC0-1CYz;
	Tue, 10 Jun 2025 06:12:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsBB-00000005tvt-0QiR
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 06:09:50 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5666769e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749535787; x=1750140587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=ChzwbtjpYdwNsdJx2YMfx+rl2MtfKgUtCIpWvbn8FYb0yx3CedV6pBaWJbZLeCqB7P
         yi+mTR8ZHlPPvKMTKKwcmRD6jLdMcnTOe1whhAvTFhPKptvy3FyPgMA5/2cBrGuE4OS9
         MUDPjietbFSvYP/SZviIzWFMDwst/SW57h6xgGIkKv4S0bn6+xxRLihzYnqojNsyFiua
         82olAcnYuxGH+fsEVhl911FGCW5Qgq3Qj8bBiBLjf1hOZBn5d3PoVJWy8mxIqwES+UdW
         lHwnZLRZQ2QKLq3F1Y/qnODmQVa6OLescAZkPmUZ7b1frf7C/BIAQEznsGoKfKj6zzpT
         G77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749535787; x=1750140587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=EnAG7W4lzA8hEYpDEqwTdxMlHKRw9YFOHBtzFwKSf8joqOABLB7EPbxy9naKomCba/
         ettCaSOCmdU+F+V321djlsyduL6rrjDhADkcd1DZOan8nO8QjEZghxd+jetgZNrDeVqt
         LwY37GL8cWGn8Cp8R981BmwHN1ts94KFdVTcx3YAS2jcV6AAbB8LenJDyE3kO+xxiBlq
         U7Nk4VyEd35q4aClXDzLcmNvmvLM4ugMVEuUfnH1glQp4VOUaL/H+7UCnGaGJ0OClqD4
         10erKdvXq/TWYoq5PVheK4QANYT3nuzvfaeCeZubBb5apUPVWKgnRorDK2kMAFSyQkJ2
         CGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWdUv8UAIEMilNINrzn1Yi+qD4JV5nEjjYvvaDmb7xGy77QHhmab1Bs5gk32J9dWC1wQWBnkVMYVxIKjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNTAwBqfSb245+qs1n4vTVwhOLOaMXhIP48m0ScMIuuvX6IYzI
	I5iAwMQwtaR+dwRJdgXhFeU3J6ax6Of2BIXlSLBUv7RTjLJeRdnY721NDTNxvAe4cAoIDI84Bsi
	RFvfWg6Ja4g5mfF2Yf1O9au9OGWA0vMdfeer/jqihMQ==
X-Gm-Gg: ASbGncucreTWyvLL3crTr/xcvH+O+HxrrRaSxXQwzJgkcqp9AI3aN18w6S5z/Y7rUQC
	UaYfUBZffmoFQ0A1v2fSSa7sasbUZgKC8y4p52gR1xvwe3CAougaDy7qFqIhZsnUCTgYAj9bRAy
	LzTExBRaAHvMKLA0oj8MwlmZFNruQUkixiswvVRXcggvPj
X-Google-Smtp-Source: AGHT+IGkcoUE3xlnQMYl1o7j1hnkz7cT7TnZBE2tt+E9xu1wPE99h1iWmlxxu85+hyVu269VB3sueRiisqT0j70UOq8=
X-Received: by 2002:a05:6512:1387:b0:553:2bf2:e30b with SMTP id
 2adb3069b0e04-55366be6735mr3903750e87.18.1749535787322; Mon, 09 Jun 2025
 23:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-12-apatel@ventanamicro.com> <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
In-Reply-To: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 11:39:35 +0530
X-Gm-Features: AX0GCFt-V6DR7WSCvS_15t_rjYO_PCMDY_MmyOZ2P-IZ0Vijw-NrT_XPrxpCJ90
Message-ID: <CAK9=C2V7E5dmJdMffadXOo839945XNRT_mMKcVfT7bTDz5fBZA@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
To: Atish Patra <atish.patra@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_230949_144545_DA6DB1E1 
X-CRM114-Status: GOOD (  24.79  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBKdW4gNywgMjAyNSBhdCA0OjI54oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPgo+IE9uIDUvMjUvMjUgMTo0NiBBTSwgQW51cCBQYXRlbCB3
cm90ZToKPiA+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFJQTUkgc3lzdGVtIE1T
SSBzZXJ2aWNlIGdyb3VwCj4gPiBiYXNlZCBtZXNzYWdlIHByb3h5IGltcGxlbWVudGVkIGJ5IHRo
ZSBTQkkgaW1wbGVtZW50YXRpb24gKG1hY2hpbmUKPiA+IG1vZGUgZmlybXdhcmUgb3IgaHlwZXJ2
aXNvcikuCj4gPgo+ID4gVGhlIFJQTUkgc3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIGlzIGRlZmlu
ZWQgYnkgdGhlIFJJU0MtVgo+ID4gcGxhdGZvcm0gbWFuYWdlbWVudCBpbnRlcmZhY2UgKFJQTUkp
IHNwZWNpZmljYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICAgLi4uL3Jpc2N2LHJwbWktbXB4eS1zeXN0
ZW0tbXNpLnlhbWwgICAgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2
LHJwbWktbXB4eS1zeXN0ZW0tbXNpLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LHJwbWkt
bXB4eS1zeXN0ZW0tbXNpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YscnBtaS1tcHh5LXN5c3RlbS1tc2kueWFtbAo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjZkZDEzNzMxMzUw
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YscnBtaS1tcHh5LXN5c3RlbS1tc2kueWFt
bAo+ID4gQEAgLTAsMCArMSw2NyBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaW50ZXJydXB0LWNvbnRyb2xsZXIv
cmlzY3YscnBtaS1tcHh5LXN5c3RlbS1tc2kueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogUklT
Qy1WIFJQTUkgc3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIGJhc2VkIG1lc3NhZ2UgcHJveHkKPiA+
ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJJU0MtViBQbGF0Zm9y
bSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYQo+ID4gKyAgbWVzc2Fn
aW5nIHByb3RvY29sIHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUuIFRoZSBzdXBlcnZp
c29yCj4gPiArICBzb2Z0d2FyZSBjYW4gc2VuZC9yZWNlaXZlIFJQTUkgbWVzc2FnZXMgdmlhIFNC
SSBNUFhZIGV4dGVuc2lvbiBbMl0KPiA+ICsgIG9yIHNvbWUgZGVkaWNhdGVkIHN1cGVydmlzb3It
bW9kZSBSUE1JIHRyYW5zcG9ydC4KPiA+ICsKPiA+ICsgIFRoZSBSUE1JIHNwZWNpZmljYXRpb24g
WzFdIGRlZmluZXMgc3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIHdoaWNoCj4gPiArICBhbGxvdyBh
cHBsaWNhdGlvbiBwcm9jZXNzb3JzIHRvIHJlY2VpdmUgTVNJcyB1cG9uIHN5c3RlbSBldmVudHMK
PiA+ICsgIHN1Y2ggYXMgUDJBIGRvb3JiZWxsLCBncmFjZWZ1bCBzaHV0ZG93bi9yZWJvb3QgcmVx
dWVzdCwgQ1BVIGhvdHBsdWcKPiA+ICsgIGV2ZW50LCBtZW1vcnkgaG90cGx1ZyBldmVudCwgZXRj
IGZyb20gdGhlIHBsYXRmb3JtIG1pY3JvY29udHJvbGxlci4KPiA+ICsgIFRoZSBTQkkgaW1wbGVt
ZW50YXRpb24gbWFjaGluZSBtb2RlIGZpcm13YXJlIG9yIGh5cGVydmlzb3IpIGNhbgo+IG5pdDoK
PiBUaGUgU0JJIGltcGxlbWVudGF0aW9uIGluIG1hY2hpbmUgbW9kZQoKQWN0dWFsbHkgdGhlcmUg
c2hvdWxkIGJlIGEgIigiIGp1c3QgYmVmb3JlICJtYWNoaW5lIG1vZGUgLi4uIi4gSSB3aWxsCnVw
ZGF0ZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KCj4gPiArICBpbXBsZW1lbnQgYW4gU0JJIE1QWFkg
Y2hhbm5lbCB0byBhbGxvdyBSUE1JIHN5c3RlbSBNU0kgc2VydmljZQo+ID4gKyAgZ3JvdXAgYWNj
ZXNzIHRvIHRoZSBzdXBlcnZpc29yIHNvZnR3YXJlLgo+ID4gKwo+ID4gKyAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKyAgUmVmZXJlbmNlcwo+ID4gKyAg
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gKwo+ID4gKyAg
WzFdIFJJU0MtViBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkKPiA+ICsgICAg
ICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1pL3JlbGVhc2VzCj4g
PiArCj4gPiArICBbMl0gUklTQy1WIFN1cGVydmlzb3IgQmluYXJ5IEludGVyZmFjZSAoU0JJKQo+
ID4gKyAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2Mv
cmVsZWFzZXMKPiA+ICsKPiBuaXQ6IFJlZmVyIHRoZSBsYXRlc3QgZnJvemVuIHZlcnNpb24gb2Yg
dGhlIHNwZWMgPwoKQWN0dWFsbHksIHdlIHNob3VsZCBzcGVjaWZ5IHRoZSBzcGVjIHZlcnNpb24g
bnVtYmVyIGluIHRoZSB0ZXh0CmFuZCBhdm9pZCBhIHNwZWNpZmljIGxpbmsgYmVjYXVzZSB0aGUg
bGluayBvZiB0aGUgZmluYWwgcmF0aWZpZWQgdmVyc2lvbgp3aWxsIGJlIGRpZmZlcmVudC4KCj4g
PiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgIEludGVuZGVkIGZvciB1c2UgYnkgdGhlIFNCSSBpbXBsZW1lbnRhdGlvbi4KPiA+
ICsgICAgY29uc3Q6IHJpc2N2LHJwbWktbXB4eS1zeXN0ZW0tbXNpCj4gPiArCj4gPiArICBtYm94
ZXM6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAg
IE1haWxib3ggY2hhbm5lbCBvZiB0aGUgdW5kZXJseWluZyBSUE1JIHRyYW5zcG9ydC4KPiA+ICsK
PiA+ICsgIHJpc2N2LHNiaS1tcHh5LWNoYW5uZWwtaWQ6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+
ICsgICAgICBUaGUgU0JJIE1QWFkgY2hhbm5lbCBpZCB0byBiZSB1c2VkIGZvciBwcm92aWRpbmcg
UlBNSSBhY2Nlc3MgdG8KPiA+ICsgICAgICB0aGUgc3VwZXJ2aXNvciBzb2Z0d2FyZS4KPiA+ICsK
PiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSBtYm94ZXMKPiA+ICsg
IC0gcmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZAo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIGludGVy
cnVwdC1jb250cm9sbGVyIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1t
cHh5LXN5c3RlbS1tc2kiOwo+ID4gKyAgICAgICAgbWJveGVzID0gPCZycG1pX3NobWVtX21ib3gg
MHgyPjsKPiA+ICsgICAgICAgIHJpc2N2LHNiaS1tcHh5LWNoYW5uZWwtaWQgPSA8MHgyMDAwPjsK
PiA+ICsgICAgfTsKPiA+ICsuLi4KPgo+IE90aGVyd2lzZSwgbGd0bS4KPgo+IFJldmlld2VkLWJ5
OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPgoKUmVnYXJkcywKQW51cAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
