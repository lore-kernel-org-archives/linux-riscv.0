Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC7BC2D0CD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 May 2025 06:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVlZDHzVfuEIlhudH7F7v5FBC3CYsbl+1Kh/cJ0QmXQ=; b=25IrLMjdIIlX1D
	0wV7fJ8dU3N3lNWrKyTTlF1bVvG2l8kOh7GHL0xxMvdxWyyrGxzQAbQCzrlFhwzaR9Bq/Eq7xrntn
	5ZAZyD4T0WWfoyeeL7Pjivlzbuw7J65yc9WVeAdCDgmSziag7FM5qlWKYTFiTVJa3pNt9f/adXRLB
	CDQzvk+kPTLdB64fYG/ovJrHiTFl5ELlbenhFHSFDz6BZlwI6AKKydqsgQvgGJ22agcpI6dOMMgYY
	kCsbwLgNacwoxtfCunSOnKuNHJIT6gOc7WipOVK1E65HyB6VeKUrfoC2/aRZH33a0DUdQSioNjnUp
	Fn/HILxLtufmr15HHhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHchB-0000000Euir-2Sif;
	Wed, 21 May 2025 06:12:53 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHch8-0000000EuiV-0VT1
	for linux-riscv@lists.infradead.org;
	Wed, 21 May 2025 06:12:51 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-550ee1cb0a3so6899056e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747807968; x=1748412768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC5bi9a3FPR1l0JcG/8Ssakf//mcFlido2AkIaD4UEU=;
        b=XGdnslJ4hhDSY+CwOQjtRhyA8jRmHw/2u0ZA8qYngreNLPNOEeAoh4OyGv0qKbtFNd
         gNOGEZylvrg2K8BXdZGC+0Ydm1RN6jOoV4k/C0YtUYrhsskWPAIfl0ycQDzl2YL9Kuu2
         m7mhWc0mM6hJdCFJwd4BOfpuD+r9rxLb395WV6lMwIMDB8oYrnRwY8rUsElVGKJPk9JY
         Q8In0TAWiuW8aVTcqKrbEdVwgO9Tb8a08IICMFWwEz6OaeDjCx5yExSJ3FehDF/MwbNR
         etJ/PVB+k4DAVNAYTgES2i1JAo2VK+fd18sen/U36OKHEZ4/W15lFF5Wi/A7e7MfNnZa
         xnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807968; x=1748412768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC5bi9a3FPR1l0JcG/8Ssakf//mcFlido2AkIaD4UEU=;
        b=NLk1Hbv+j9iaUW1xTQ52tgxi2un7Tdcdhop9CmYFFwfRznmWms1NuKo9QAoRjCwxo/
         GrpoOlYvMMhaW131hyqEY/9K30rA7OdTpDTph/+3J5zU8YAWfzQ6EbnAD11b5w1FXg6z
         gRSxLDIWt7qIOWxN0fiBXkJXT9rxL+gfAINRrHrSIyUQ42IpS+RcBWmD7q6VOpi4tVBK
         mxy4zdea3nu3aCnLPEGdESOxWgIkfeDkE6vB9je3q0v07TN/eSK6Gugs1YC2HPdBEEUO
         ia7A8NCde9uPNs/FvHMn2dSOswGFSU+plcNXw1Vs5GJfPvv9T0Nh4Dx0dNToUUudkFVQ
         tXvg==
X-Forwarded-Encrypted: i=1; AJvYcCWSQO8QX9ryAJCV7/E+2Dw2iL6Fij7FucOFZOt0fOZvaj89XHDi8Sb2wonoiY7HrphaXMyYFqmNd96y6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEKKXJRQvKNgf0dmD1sbE9UgZ47+e08QY5S0EFfysRlLWfdxld
	iMvhoefrtxXjsj+HjihEA3eLbxrpfMZ9R0KIN5gmoSGD+fW6qPoxjNixAMgDXkN6tfzM51BWpIm
	QOf1VqsMdO15n49wJTzLiKekIqtJ4TguV0WGWnSGuzw==
X-Gm-Gg: ASbGnctQ20TgnjwOT7BCq3VPSJQvPEdMed4dvb/wJ1I34CDe7KBKauISlhqQRJ3yCbK
	J3HcjpjlinG/5znWGPoZ14YI6RKIyNpia5nEp1rXbtI2SOS9wu3n9QMOb7pvYGLJhYCZu65YL6y
	01MAjCEu20EgaXFRa7CGmuafA2Y53HXP1npJxWpPUrbkh3
X-Google-Smtp-Source: AGHT+IFKARCQdM1HLrIEnihUfSXY0RLuVuHDtMwlKOriDZOtnH+UUzAZAnITsP1ZpOOH2Jp6UaEtHGhgljWO/FcWTzc=
X-Received: by 2002:a05:6512:2616:b0:54e:8194:9a72 with SMTP id
 2adb3069b0e04-550e71d276dmr5523061e87.28.1747807968079; Tue, 20 May 2025
 23:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-3-apatel@ventanamicro.com> <20250519172647.GA2603742-robh@kernel.org>
In-Reply-To: <20250519172647.GA2603742-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 11:42:37 +0530
X-Gm-Features: AX0GCFtJLAy00hbWeXR9faFUaINr454pMWu8LepI2bolOypLacOs_uVRABcxLNQ
Message-ID: <CAK9=C2XBkSebjLQJm+uZZfw9ffGGKeGTMxETCUa23RFkuzOdTg@mail.gmail.com>
Subject: Re: [PATCH v3 02/23] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_231250_166280_F6101514 
X-CRM114-Status: GOOD (  22.12  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTA6NTbigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDExLCAyMDI1IGF0IDA3OjA5OjE4UE0gKzA1
MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRo
ZSBjb21tb24gUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQKPiA+IEludGVyZmFjZSAoUlBNSSkg
c2hhcmVkIG1lbW9yeSB0cmFuc3BvcnQgYXMgYSBtYWlsYm94IGNvbnRyb2xsZXIuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAt
LS0KPiA+ICAuLi4vbWFpbGJveC9yaXNjdixycG1pLXNobWVtLW1ib3gueWFtbCAgICAgICAgfCAx
NDggKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0OCBpbnNlcnRpb25z
KCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tYWlsYm94L3Jpc2N2LHJwbWktc2htZW0tbWJveC55YW1sCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L3Jpc2N2LHJwbWkt
c2htZW0tbWJveC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxi
b3gvcmlzY3YscnBtaS1zaG1lbS1tYm94LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjMxOTRjMDY2ZDk1Mgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvcmlzY3YscnBt
aS1zaG1lbS1tYm94LnlhbWwKPiA+IEBAIC0wLDAgKzEsMTQ4IEBACj4gPiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwg
MS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tYWls
Ym94L3Jpc2N2LHJwbWktc2htZW0tbWJveC55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBSSVND
LVYgUGxhdGZvcm0gTWFuYWdlbWVudCBJbnRlcmZhY2UgKFJQTUkpIHNoYXJlZCBtZW1vcnkgbWFp
bGJveAo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUgUklTQy1W
IFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50ZXJmYWNlIChSUE1JKSBbMV0gZGVmaW5lcyBhIGNvbW1v
biBzaGFyZWQKPiA+ICsgIG1lbW9yeSBiYXNlZCBSUE1JIHRyYW5zcG9ydC4gVGhpcyBSUE1JIHNo
YXJlZCBtZW1vcnkgdHJhbnNwb3J0IGludGVncmF0ZXMgYXMKPiA+ICsgIG1haWxib3ggY29udHJv
bGxlciBpbiB0aGUgU0JJIGltcGxlbWVudGF0aW9uIG9yIHN1cGVydmlzb3Igc29mdHdhcmUgd2hl
cmVhcwo+ID4gKyAgZWFjaCBSUE1JIHNlcnZpY2UgZ3JvdXAgaXMgbWFpbGJveCBjbGllbnQgaW4g
dGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBhbmQKPiA+ICsgIHN1cGVydmlzb3Igc29mdHdhcmUuCj4g
PiArCj4gPiArICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4g
PiArICBSZWZlcmVuY2VzCj4gPiArICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Cj4gPiArCj4gPiArICBbMV0gUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50
ZXJmYWNlIChSUE1JKQo+ID4gKyAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNh
L3Jpc2N2LXJwbWkvcmVsZWFzZXMKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0
aWJsZToKPiA+ICsgICAgY29uc3Q6IHJpc2N2LHJwbWktc2htZW0tbWJveAo+ID4gKwo+ID4gKyAg
cmVnOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAt
IGRlc2NyaXB0aW9uOiBBMlAgcmVxdWVzdCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+ICsgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogUDJBIGFja25vd2xlZGdtZW50IHF1ZXVlIGJhc2UgYWRkcmVzcwo+
ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBQMkEgcmVxdWVzdCBxdWV1ZSBiYXNlIGFkZHJl
c3MKPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogQTJQIGFja25vd2xlZGdtZW50IHF1ZXVl
IGJhc2UgYWRkcmVzcwo+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBBMlAgZG9vcmJlbGwg
YWRkcmVzcwo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246
IEEyUCByZXF1ZXN0IHF1ZXVlIGJhc2UgYWRkcmVzcwo+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0
aW9uOiBQMkEgYWNrbm93bGVkZ21lbnQgcXVldWUgYmFzZSBhZGRyZXNzCj4gPiArICAgICAgICAg
IC0gZGVzY3JpcHRpb246IFAyQSByZXF1ZXN0IHF1ZXVlIGJhc2UgYWRkcmVzcwo+ID4gKyAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBBMlAgYWNrbm93bGVkZ21lbnQgcXVldWUgYmFzZSBhZGRyZXNz
Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogQTJQIHJl
cXVlc3QgcXVldWUgYmFzZSBhZGRyZXNzCj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IFAy
QSBhY2tub3dsZWRnbWVudCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+ICsgICAgICAgICAgLSBkZXNj
cmlwdGlvbjogQTJQIGRvb3JiZWxsIGFkZHJlc3MKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAg
ICAgICAgICAtIGRlc2NyaXB0aW9uOiBBMlAgcmVxdWVzdCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+
ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogUDJBIGFja25vd2xlZGdtZW50IHF1ZXVlIGJhc2Ug
YWRkcmVzcwo+ID4gKwo+ID4gKyAgcmVnLW5hbWVzOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAg
ICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBhMnAtcmVxCj4gPiArICAgICAgICAg
IC0gY29uc3Q6IHAyYS1hY2sKPiA+ICsgICAgICAgICAgLSBjb25zdDogcDJhLXJlcQo+ID4gKyAg
ICAgICAgICAtIGNvbnN0OiBhMnAtYWNrCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGEycC1kb29y
YmVsbAo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IGEycC1yZXEK
PiA+ICsgICAgICAgICAgLSBjb25zdDogcDJhLWFjawo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBw
MmEtcmVxCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGEycC1hY2sKPiA+ICsgICAgICAtIGl0ZW1z
Ogo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBhMnAtcmVxCj4gPiArICAgICAgICAgIC0gY29uc3Q6
IHAyYS1hY2sKPiA+ICsgICAgICAgICAgLSBjb25zdDogYTJwLWRvb3JiZWxsCj4gPiArICAgICAg
LSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogYTJwLXJlcQo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBwMmEtYWNrCj4KPiBUaGlzIGNhbiBhbGwgYmUganVzdDoKPgo+IG1pbkl0ZW1zOiAy
Cj4gaXRlbXM6Cj4gICAtIGNvbnN0OiBhMnAtcmVxCj4gICAtIGNvbnN0OiBwMmEtYWNrCj4gICAt
IGVudW06IFsgcDJhLXJlcSwgYTJwLWRvb3JiZWxsIF0KPiAgIC0gY29uc3Q6IGEycC1hY2sKPiAg
IC0gY29uc3Q6IGEycC1kb29yYmVsbAoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPgo+ID4gKwo+
ID4gKyAgaW50ZXJydXB0czoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsgICAgZGVzY3JpcHRp
b246Cj4gPiArICAgICAgVGhlIFJQTUkgc2hhcmVkIG1lbW9yeSB0cmFuc3BvcnQgc3VwcG9ydHMg
d2lyZWQgaW50ZXJydXB0IHNwZWNpZmllZCBieQo+ID4gKyAgICAgIHRoaXMgcHJvcGVydHkgYXMg
dGhlIFAyQSBkb29yYmVsbC4KPgo+ICJUaGUgUlBNSSBzaGFyZWQgbWVtb3J5IHRyYW5zcG9ydCBQ
MkEgZG9vcmJlbGwiCgpPa2F5LCBJIHdpbGwgdXBkYXRlLgoKPgo+Cj4gPiArCj4gPiArICBtc2kt
cGFyZW50Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBUaGUgUlBNSSBzaGFyZWQg
bWVtb3J5IHRyYW5zcG9ydCBzdXBwb3J0cyBQMkEgZG9vcmJlbGwgYXMgYSBzeXN0ZW0gTVNJCj4g
PiArICAgICAgYW5kIHRoaXMgcHJvcGVydHkgc3BlY2lmaWVzIHRoZSB0YXJnZXQgTVNJIGNvbnRy
b2xsZXIuCj4gPiArCj4gPiArICByaXNjdixzbG90LXNpemU6Cj4gPiArICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBtaW5pbXVtOiA2NAo+
ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBQb3dlci1vZi0yIFJQTUkgc2xvdCBzaXpl
IG9mIHRoZSBSUE1JIHNoYXJlZCBtZW1vcnkgdHJhbnNwb3J0Lgo+ID4gKwo+ID4gKyAgcmlzY3Ys
YTJwLWRvb3JiZWxsLXZhbHVlOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzIKPiA+ICsgICAgZGVmYXVsdDogMHgxCj4gPiArICAgIGRlc2NyaXB0
aW9uOgo+ID4gKyAgICAgIFZhbHVlIHdyaXR0ZW4gdG8gdGhlIDMyLWJpdCBBMlAgZG9vcmJlbGwg
cmVnaXN0ZXIuCj4gPiArCj4gPiArICByaXNjdixwMmEtZG9vcmJlbGwtc3lzbXNpLWluZGV4Ogo+
ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiA+
ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhlIFJQTUkgc2hhcmVkIG1lbW9yeSB0cmFu
c3BvcnQgc3VwcG9ydHMgUDJBIGRvb3JiZWxsIGFzIGEgc3lzdGVtIE1TSQo+ID4gKyAgICAgIGFu
ZCB0aGlzIHByb3BlcnR5IHNwZWNpZmllcyBzeXN0ZW0gTVNJIGluZGV4IHRvIGJlIHVzZWQgZm9y
IGNvbmZpZ3VyaW5nCj4gPiArICAgICAgdGhlIFAyQSBkb29yYmVsbCBNU0kuCj4gPiArCj4gPiAr
ICAiI21ib3gtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMQo+ID4gKyAgICBkZXNjcmlwdGlvbjoK
PiA+ICsgICAgICBUaGUgZmlyc3QgY2VsbCBzcGVjaWZpZXMgUlBNSSBzZXJ2aWNlIGdyb3VwIElE
Lgo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJlZwo+
ID4gKyAgLSByZWctbmFtZXMKPiA+ICsgIC0gcmlzY3Ysc2xvdC1zaXplCj4gPiArICAtICIjbWJv
eC1jZWxscyIKPiA+ICsKPiA+ICthbnlPZjoKPiA+ICsgIC0gcmVxdWlyZWQ6Cj4gPiArICAgICAg
LSBpbnRlcnJ1cHRzCj4gPiArICAtIHJlcXVpcmVkOgo+ID4gKyAgICAgIC0gbXNpLXBhcmVudAo+
ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gKwo+ID4gK2V4YW1wbGVz
Ogo+ID4gKyAgLSB8Cj4gPiArICAgIC8vIEV4YW1wbGUgMSAoUlBNSSBzaGFyZWQgbWVtb3J5IHdp
dGggb25seSAyIHF1ZXVlcyk6Cj4gPiArICAgIG1haWxib3hAMTAwODAwMDAgewo+ID4gKyAgICAg
ICAgY29tcGF0aWJsZSA9ICJyaXNjdixycG1pLXNobWVtLW1ib3giOwo+ID4gKyAgICAgICAgcmVn
ID0gPDB4MTAwODAwMDAgMHgxMDAwMD4sCj4gPiArICAgICAgICAgICAgICA8MHgxMDA5MDAwMCAw
eDEwMDAwPjsKPiA+ICsgICAgICAgIHJlZy1uYW1lcyA9ICJhMnAtcmVxIiwgInAyYS1hY2siOwo+
ID4gKyAgICAgICAgbXNpLXBhcmVudCA9IDwmaW1zaWNfbWxldmVsPjsKPiA+ICsgICAgICAgIHJp
c2N2LHNsb3Qtc2l6ZSA9IDw2ND47Cj4gPiArICAgICAgICAjbWJveC1jZWxscyA9IDwxPjsKPiA+
ICsgICAgfTsKPiA+ICsgIC0gfAo+ID4gKyAgICAvLyBFeGFtcGxlIDIgKFJQTUkgc2hhcmVkIG1l
bW9yeSB3aXRoIG9ubHkgNCBxdWV1ZXMpOgo+ID4gKyAgICBtYWlsYm94QDEwMDAxMDAwIHsKPiA+
ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1zaG1lbS1tYm94IjsKPiA+ICsgICAg
ICAgIHJlZyA9IDwweDEwMDAxMDAwIDB4ODAwPiwKPiA+ICsgICAgICAgICAgICAgIDwweDEwMDAx
ODAwIDB4ODAwPiwKPiA+ICsgICAgICAgICAgICAgIDwweDEwMDAyMDAwIDB4ODAwPiwKPiA+ICsg
ICAgICAgICAgICAgIDwweDEwMDAyODAwIDB4ODAwPiwKPiA+ICsgICAgICAgICAgICAgIDwweDEw
MDAzMDAwIDB4ND47Cj4gPiArICAgICAgICByZWctbmFtZXMgPSAiYTJwLXJlcSIsICJwMmEtYWNr
IiwgInAyYS1yZXEiLCAiYTJwLWFjayIsICJhMnAtZG9vcmJlbGwiOwo+ID4gKyAgICAgICAgbXNp
LXBhcmVudCA9IDwmaW1zaWNfbWxldmVsPjsKPiA+ICsgICAgICAgIHJpc2N2LHNsb3Qtc2l6ZSA9
IDw2ND47Cj4gPiArICAgICAgICByaXNjdixhMnAtZG9vcmJlbGwtdmFsdWUgPSA8MHgwMDAwODAw
MD47Cj4gPiArICAgICAgICAjbWJveC1jZWxscyA9IDwxPjsKPiA+ICsgICAgfTsKPiA+IC0tCj4g
PiAyLjQzLjAKPiA+CgpUaGFua3MsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
