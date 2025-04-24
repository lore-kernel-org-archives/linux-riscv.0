Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DC8C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNunKowmRymEI4JJMB812asve2VOohf5TZggp1TFNzg=; b=QX1gUCHL+RDxvy
	373kHMaqhXyeEb4qFNBazKHn3cjsIavltccPZdUJ2M7ucCoBRguXKaHobDyIQL9XwnHeY/6O9wiZQ
	LhzNwmnqc7bZdu5l/eL3uPjqWE8cXVGlCMHhpgOfw67qekdS1RTtNv3kUWce7xAEzoR2JlJhVyaqI
	SHN7sNMz8NbVgqdxA/Q7v6cYk2FPcdOUap1JvvADLZafVEEEZf2KY1A8VnYFLSiR0+NmvkVJkoUTh
	5q7gYswMzQgnQl2rH8V1NZlsFMO2aUaIwUP7NOcjJSt8/nVTALXC/H8AHeDb7+HJwLyiSqFg2qRwm
	7CJoJwG94QU5u4lIzUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7p99-0000000Ct3C-2oEK;
	Thu, 24 Apr 2025 05:29:15 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7p7A-0000000CsuK-0H2r
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 05:27:13 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-aee773df955so1513767a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 22:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745472431; x=1746077231; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZUPcM2JRXU1EZUeYvnEV+B9VdnBQw7RuAghQfhbC98=;
        b=xfs1Eil6Bc+J6KA3CdvhWr3Rwqr2jwdM5fPqnLcaPM5HHlE4Fg/kItC+7MZjlhAwPP
         LSNuUKlW8bzhClbtNlX6tOehX92tIr+cNHR6al0IjaPaqikqQRHh1LqRTCxVkcGlUQmB
         n+XkN70TOcR9c7CDTwaKmfZgeuFL7smV6C9RoO7OfUCzNgiPqMMT7hScjIo5NuL0bQX4
         ntTciELWubJc9e0FFXEpPgyt2k4tl3pbMBb6vvxEfS9aBEHbkeiin6XiWfTrFAxZEDna
         Dyey4hM56EAiYGvhkoqiDq32a6+TOEykdLWf1gr0TiClUepcJeD+ePSBI31JL9K3+8jZ
         S/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745472431; x=1746077231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZUPcM2JRXU1EZUeYvnEV+B9VdnBQw7RuAghQfhbC98=;
        b=ctv04lmkQq4Eu3Y+iyNBVb0h/MzS/4Ya0xg1p4Yfjyj+KQThQ/jgOjE1GVXTdm7h+Y
         jvKP4Vy2eUlLmqnxLyMn5HR+iU5QhTMXY3JJC0jKUgb+qZCkBomoKPuXPxFPuiTW2kCP
         3/py0DfLG8LVE4+0vl9O7IYU7uuBY/DwGPoR/v/vO9TFFbaklSkuClB1X+/NNk+SX0N6
         24z1+dbEZZGtXg9vOAtRON0VceLFANwGa3q0U7cS+sZDlrYjRaWQiTrU0U6gblw3qzPA
         J0mHrKkJniBfJxkilSnDiQpyICdLoFI2ANgVXQrvR9806ipGHB8oZVfeW8FclHN+x6ef
         YQTw==
X-Forwarded-Encrypted: i=1; AJvYcCXRG6BJIzhTT1nLmsx6w2MfTYF3cFYN0R44HeropOfByPWJJEoPgnbmtK7RUjqFnwDe38dbbVj6WiqFsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiPhiHziooJ9IvAUhhGShyzY4QZjRvoP+6yC1XzUkQksh1hbIZ
	ffZiK5ANMwNdBUqOtYz8v+1c9gmBSd0uKb8dkEDoMxseuG9gQeR6cGsa+2MCuw==
X-Gm-Gg: ASbGncvGfbjQH15UX3+jep8TT/HpXStGAmqhEf6EXtOYp76OJi9Z6GTWryb+rb7XGe0
	f6VHLSRo1X7EtQqids0xEiNNh9X2l7o/YjBijxDFFtyxqx7GGS+7Mngdh+/sVLko/mlf89m7lDD
	nlahEB7v56TQKqKzylS/R63Sg7fPRfPvaBK0bcPbTmlXsYYF7sCpvcGNoH7H7tG/DrIcHm6Fchj
	ceJVpswRGZSUD0e3jBDOog16ckpHaJs51EMdY/kQKSSAUC09h6EcI3OaD3/zzygpuGE2J42IVS6
	5dFjJco627+IOHqLXWnmUGZhzHzzJ+hABCXK+1qbkqTVYWAgMwk=
X-Google-Smtp-Source: AGHT+IEwbpxTA4Qj4NM5rAHZdl1TYE4GZFHTARebZEX16BK4YArP6CGqoSYBRcTbYJYiLhgXJ62sqw==
X-Received: by 2002:a17:90b:45:b0:2f9:d0cd:3403 with SMTP id 98e67ed59e1d1-309ee3b5de0mr1568292a91.16.1745472430905;
        Wed, 23 Apr 2025 22:27:10 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1385d2sm347425a91.41.2025.04.23.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:27:10 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:57:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <mr5kunnsv5syckqbclcw2xi6es36fnsnfvrvughqlmv2kblxof@tltliisb5upf>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
 <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_222712_121358_E82E706E 
X-CRM114-Status: GOOD (  45.71  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTA6NDE6MjRBTSArMDUzMCwgS3Jpc2huYSBDaGFpdGFu
eWEgQ2h1bmRydSB3cm90ZToKPiAKPiAKPiBPbiA0LzI0LzIwMjUgMTA6MzAgQU0sIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDE4LCAyMDI1IGF0IDA4OjExOjQ3
QU0gKzA1MzAsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4gPiA+IAo+ID4gPiAK
PiA+ID4gT24gNC8xNy8yMDI1IDEwOjQ2IFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gdmlhIEI0
IFJlbGF5IHdyb3RlOgo+ID4gPiA+IEZyb206IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZh
bm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+Cj4gPiA+ID4gCj4gPiA+ID4gVGhlIFBDSWUgbGlu
ayBjYW4gZ28gZG93biB1bmRlciBjaXJjdW1zdGFuY2VzIHN1Y2ggYXMgdGhlIGRldmljZSBmaXJt
d2FyZQo+ID4gPiA+IGNyYXNoLCBsaW5rIGluc3RhYmlsaXR5LCBldGMuLi4gV2hlbiB0aGF0IGhh
cHBlbnMsIHRoZSBQQ0llIHNsb3QgbmVlZHMgdG8KPiA+ID4gPiBiZSByZXNldCB0byBtYWtlIGl0
IG9wZXJhdGlvbmFsIGFnYWluLiBDdXJyZW50bHksIHRoZSBkcml2ZXIgaXMgbm90Cj4gPiA+ID4g
aGFuZGxpbmcgdGhlIGxpbmsgZG93biBldmVudCwgZHVlIHRvIHdoaWNoIHRoZSB1c2VycyBoYXZl
IHRvIHJlc3RhcnQgdGhlCj4gPiA+ID4gbWFjaGluZSB0byBtYWtlIFBDSWUgbGluayBvcGVyYXRp
b25hbCBhZ2Fpbi4gU28gZml4IGl0IGJ5IGRldGVjdGluZyB0aGUKPiA+ID4gPiBsaW5rIGRvd24g
ZXZlbnQgYW5kIHJlc2V0dGluZyB0aGUgc2xvdC4KPiA+ID4gPiAKPiA+ID4gPiBTaW5jZSB0aGUg
UWNvbSBQQ0llIGNvbnRyb2xsZXJzIHJlcG9ydCB0aGUgbGluayBkb3duIGV2ZW50IHRocm91Z2gg
dGhlCj4gPiA+ID4gJ2dsb2JhbCcgSVJRLCBlbmFibGUgdGhlIGxpbmsgZG93biBldmVudCBieSBz
ZXR0aW5nIFBBUkZfSU5UX0FMTF9MSU5LX0RPV04KPiA+ID4gPiBiaXQgaW4gUEFSRl9JTlRfQUxM
X01BU0sgcmVnaXN0ZXIuCj4gPiA+ID4gCj4gPiA+ID4gVGhlbiBpbiB0aGUgY2FzZSBvZiB0aGUg
ZXZlbnQsIGNhbGwgcGNpX2hvc3RfaGFuZGxlX2xpbmtfZG93bigpIEFQSQo+ID4gPiA+IGluIHRo
ZSBoYW5kbGVyIHRvIGxldCB0aGUgUENJIGNvcmUgaGFuZGxlIHRoZSBsaW5rIGRvd24gY29uZGl0
aW9uLgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBBUEkgd2lsbCBpbnRlcm5hbGx5IGNhbGwsICdwY2lf
aG9zdF9icmlkZ2U6OnJlc2V0X3Nsb3QoKScgY2FsbGJhY2sgdG8KPiA+ID4gPiByZXNldCB0aGUg
c2xvdCBpbiBhIHBsYXRmb3JtIHNwZWNpZmljIHdheS4gU28gaW1wbGVtZW50IHRoZSBjYWxsYmFj
ayB0bwo+ID4gPiA+IHJlc2V0IHRoZSBzbG90IGJ5IGZpcnN0IHJlc2V0dGluZyB0aGUgUENJZSBj
b3JlLCBmb2xsb3dlZCBieSByZWluaXRpYWxpemluZwo+ID4gPiA+IHRoZSByZXNvdXJjZXMgYW5k
IHRoZW4gZmluYWxseSBzdGFydGluZyB0aGUgbGluayBhZ2Fpbi4KPiA+ID4gPiAKPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZh
bUBsaW5hcm8ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL0tjb25maWcgICAgIHwgIDEgKwo+ID4gPiA+ICAgIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtcWNvbS5jIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQo+ID4gPiA+ICAgIDIgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvS2NvbmZpZyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiA+ID4g
PiBpbmRleCBkOWYwMzg2Mzk2ZWRmNjZhZDBlNTE0YTBmNTQ1ZWQyNGQ4OWZjYjZjLi5jZTA0ZWU2
ZmJkOTljYmNjZTVkMmYzYTc1ZWJkNzJhMTcwNzBiN2I3IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiA+ID4gPiArKysgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiA+ID4gQEAgLTI5Niw2ICsyOTYsNyBAQCBjb25m
aWcgUENJRV9RQ09NCj4gPiA+ID4gICAgCXNlbGVjdCBQQ0lFX0RXX0hPU1QKPiA+ID4gPiAgICAJ
c2VsZWN0IENSQzgKPiA+ID4gPiAgICAJc2VsZWN0IFBDSUVfUUNPTV9DT01NT04KPiA+ID4gPiAr
CXNlbGVjdCBQQ0lfSE9TVF9DT01NT04KPiA+ID4gPiAgICAJaGVscAo+ID4gPiA+ICAgIAkgIFNh
eSBZIGhlcmUgdG8gZW5hYmxlIFBDSWUgY29udHJvbGxlciBzdXBwb3J0IG9uIFF1YWxjb21tIFNv
Q3MuIFRoZQo+ID4gPiA+ICAgIAkgIFBDSWUgY29udHJvbGxlciB1c2VzIHRoZSBEZXNpZ25XYXJl
IGNvcmUgcGx1cyBRdWFsY29tbS1zcGVjaWZpYwo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS5jCj4gPiA+ID4gaW5kZXggZGM5OGFlNjMzNjJkYjA0MjIzODRiMTg3OWEy
YjlhN2RjNTY0ZDA5MS4uNmIxOGEyNzc1ZTdmY2RlMWQ2MzRiM2Y1ODMyN2VjYzdkMDI4ZTRlYyAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20u
Ywo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS5jCj4g
PiA+ID4gQEAgLTM0LDYgKzM0LDcgQEAKPiA+ID4gPiAgICAjaW5jbHVkZSA8bGludXgvdW5pdHMu
aD4KPiA+ID4gPiAgICAjaW5jbHVkZSAiLi4vLi4vcGNpLmgiCj4gPiA+ID4gKyNpbmNsdWRlICIu
Li9wY2ktaG9zdC1jb21tb24uaCIKPiA+ID4gPiAgICAjaW5jbHVkZSAicGNpZS1kZXNpZ253YXJl
LmgiCj4gPiA+ID4gICAgI2luY2x1ZGUgInBjaWUtcWNvbS1jb21tb24uaCIKPiA+ID4gPiBAQCAt
NTUsNiArNTYsNyBAQAo+ID4gPiA+ICAgICNkZWZpbmUgUEFSRl9JTlRfQUxMX1NUQVRVUwkJCTB4
MjI0Cj4gPiA+ID4gICAgI2RlZmluZSBQQVJGX0lOVF9BTExfQ0xFQVIJCQkweDIyOAo+ID4gPiA+
ICAgICNkZWZpbmUgUEFSRl9JTlRfQUxMX01BU0sJCQkweDIyYwo+ID4gPiA+ICsjZGVmaW5lIFBB
UkZfU1RBVFVTCQkJCTB4MjMwCj4gPiA+ID4gICAgI2RlZmluZSBQQVJGX1NJRF9PRkZTRVQJCQkJ
MHgyMzQKPiA+ID4gPiAgICAjZGVmaW5lIFBBUkZfQkRGX1RSQU5TTEFURV9DRkcJCQkweDI0Ywo+
ID4gPiA+ICAgICNkZWZpbmUgUEFSRl9EQklfQkFTRV9BRERSX1YyCQkJMHgzNTAKPiA+ID4gPiBA
QCAtMTMwLDggKzEzMiwxMSBAQAo+ID4gPiA+ICAgIC8qIFBBUkZfTFRTU00gcmVnaXN0ZXIgZmll
bGRzICovCj4gPiA+ID4gICAgI2RlZmluZSBMVFNTTV9FTgkJCQlCSVQoOCkKPiA+ID4gPiArI2Rl
ZmluZSBTV19DTEVBUl9GTFVTSF9NT0RFCQkJQklUKDEwKQo+ID4gPiA+ICsjZGVmaW5lIEZMVVNI
X01PREUJCQkJQklUKDExKQo+ID4gPiA+ICAgIC8qIFBBUkZfSU5UX0FMTF97U1RBVFVTL0NMRUFS
L01BU0t9IHJlZ2lzdGVyIGZpZWxkcyAqLwo+ID4gPiA+ICsjZGVmaW5lIFBBUkZfSU5UX0FMTF9M
SU5LX0RPV04JCQlCSVQoMSkKPiA+ID4gPiAgICAjZGVmaW5lIFBBUkZfSU5UX0FMTF9MSU5LX1VQ
CQkJQklUKDEzKQo+ID4gPiA+ICAgICNkZWZpbmUgUEFSRl9JTlRfTVNJX0RFVl8wXzcJCQlHRU5N
QVNLKDMwLCAyMykKPiA+ID4gPiBAQCAtMTQ1LDYgKzE1MCw5IEBACj4gPiA+ID4gICAgLyogUEFS
Rl9CREZfVE9fU0lEX0NGRyBmaWVsZHMgKi8KPiA+ID4gPiAgICAjZGVmaW5lIEJERl9UT19TSURf
QllQQVNTCQkJQklUKDApCj4gPiA+ID4gKy8qIFBBUkZfU1RBVFVTIGZpZWxkcyAqLwo+ID4gPiA+
ICsjZGVmaW5lIEZMVVNIX0NPTVBMRVRFRAkJCQlCSVQoOCkKPiA+ID4gPiArCj4gPiA+ID4gICAg
LyogRUxCSV9TWVNfQ1RSTCByZWdpc3RlciBmaWVsZHMgKi8KPiA+ID4gPiAgICAjZGVmaW5lIEVM
QklfU1lTX0NUUkxfTFRfRU5BQkxFCQkJQklUKDApCj4gPiA+ID4gQEAgLTE2OSw2ICsxNzcsNyBA
QAo+ID4gPiA+ICAgIAkJCQkJCVBDSUVfQ0FQX1NMT1RfUE9XRVJfTElNSVRfU0NBTEUpCj4gPiA+
ID4gICAgI2RlZmluZSBQRVJTVF9ERUxBWV9VUwkJCQkxMDAwCj4gPiA+ID4gKyNkZWZpbmUgRkxV
U0hfVElNRU9VVF9VUwkJCTEwMAo+ID4gPiA+ICAgICNkZWZpbmUgUUNPTV9QQ0lFX0NSQzhfUE9M
WU5PTUlBTAkJKEJJVCgyKSB8IEJJVCgxKSB8IEJJVCgwKSkKPiA+ID4gPiBAQCAtMjc0LDExICsy
ODMsMTQgQEAgc3RydWN0IHFjb21fcGNpZSB7Cj4gPiA+ID4gICAgCXN0cnVjdCBpY2NfcGF0aCAq
aWNjX2NwdTsKPiA+ID4gPiAgICAJY29uc3Qgc3RydWN0IHFjb21fcGNpZV9jZmcgKmNmZzsKPiA+
ID4gPiAgICAJc3RydWN0IGRlbnRyeSAqZGVidWdmczsKPiA+ID4gPiArCWludCBnbG9iYWxfaXJx
Owo+ID4gPiA+ICAgIAlib29sIHN1c3BlbmRlZDsKPiA+ID4gPiAgICAJYm9vbCB1c2VfcG1fb3Bw
Owo+ID4gPiA+ICAgIH07Cj4gPiA+ID4gICAgI2RlZmluZSB0b19xY29tX3BjaWUoeCkJCWRldl9n
ZXRfZHJ2ZGF0YSgoeCktPmRldikKPiA+ID4gPiArc3RhdGljIGludCBxY29tX3BjaWVfcmVzZXRf
c2xvdChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsCj4gPiA+ID4gKwkJCQkgIHN0cnVj
dCBwY2lfZGV2ICpwZGV2KTsKPiA+ID4gPiAgICBzdGF0aWMgdm9pZCBxY29tX2VwX3Jlc2V0X2Fz
c2VydChzdHJ1Y3QgcWNvbV9wY2llICpwY2llKQo+ID4gPiA+ICAgIHsKPiA+ID4gPiBAQCAtMTI2
Myw2ICsxMjc1LDggQEAgc3RhdGljIGludCBxY29tX3BjaWVfaG9zdF9pbml0KHN0cnVjdCBkd19w
Y2llX3JwICpwcCkKPiA+ID4gPiAgICAJCQlnb3RvIGVycl9hc3NlcnRfcmVzZXQ7Cj4gPiA+ID4g
ICAgCX0KPiA+ID4gPiArCXBwLT5icmlkZ2UtPnJlc2V0X3Nsb3QgPSBxY29tX3BjaWVfcmVzZXRf
c2xvdDsKPiA+ID4gPiArCj4gPiA+ID4gICAgCXJldHVybiAwOwo+ID4gPiA+ICAgIGVycl9hc3Nl
cnRfcmVzZXQ6Cj4gPiA+ID4gQEAgLTEzMDAsNiArMTMxNCw3MyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGR3X3BjaWVfaG9zdF9vcHMgcWNvbV9wY2llX2R3X29wcyA9IHsKPiA+ID4gPiAgICAJLnBv
c3RfaW5pdAk9IHFjb21fcGNpZV9ob3N0X3Bvc3RfaW5pdCwKPiA+ID4gPiAgICB9Owo+ID4gPiA+
ICtzdGF0aWMgaW50IHFjb21fcGNpZV9yZXNldF9zbG90KHN0cnVjdCBwY2lfaG9zdF9icmlkZ2Ug
KmJyaWRnZSwKPiA+ID4gPiArCQkJCSAgc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiA+ID4gK3sK
PiA+ID4gPiArCXN0cnVjdCBwY2lfYnVzICpidXMgPSBicmlkZ2UtPmJ1czsKPiA+ID4gPiArCXN0
cnVjdCBkd19wY2llX3JwICpwcCA9IGJ1cy0+c3lzZGF0YTsKPiA+ID4gPiArCXN0cnVjdCBkd19w
Y2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fcHAocHApOwo+ID4gPiA+ICsJc3RydWN0IHFjb21f
cGNpZSAqcGNpZSA9IHRvX3Fjb21fcGNpZShwY2kpOwo+ID4gPiA+ICsJc3RydWN0IGRldmljZSAq
ZGV2ID0gcGNpZS0+cGNpLT5kZXY7Cj4gPiA+ID4gKwl1MzIgdmFsOwo+ID4gPiA+ICsJaW50IHJl
dDsKPiA+ID4gPiArCj4gPiA+ID4gKwkvKiBXYWl0IGZvciB0aGUgcGVuZGluZyB0cmFuc2FjdGlv
bnMgdG8gYmUgY29tcGxldGVkICovCj4gPiA+ID4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxf
dGltZW91dChwY2llLT5wYXJmICsgUEFSRl9TVEFUVVMsIHZhbCwKPiA+ID4gPiArCQkJCQkgdmFs
ICYgRkxVU0hfQ09NUExFVEVELCAxMCwKPiA+ID4gPiArCQkJCQkgRkxVU0hfVElNRU9VVF9VUyk7
Cj4gPiA+ID4gKwlpZiAocmV0KSB7Cj4gPiA+ID4gKwkJZGV2X2VycihkZXYsICJGbHVzaCBjb21w
bGV0aW9uIGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiA+ID4gKwkJZ290byBlcnJfaG9zdF9kZWlu
aXQ7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJLyogQ2xlYXIgdGhlIEZMVVNIX01P
REUgdG8gYWxsb3cgdGhlIGNvcmUgdG8gYmUgcmVzZXQgKi8KPiA+ID4gPiArCXZhbCA9IHJlYWRs
KHBjaWUtPnBhcmYgKyBQQVJGX0xUU1NNKTsKPiA+ID4gPiArCXZhbCB8PSBTV19DTEVBUl9GTFVT
SF9NT0RFOwo+ID4gPiA+ICsJd3JpdGVsKHZhbCwgcGNpZS0+cGFyZiArIFBBUkZfTFRTU00pOwo+
ID4gPiA+ICsKPiA+ID4gPiArCS8qIFdhaXQgZm9yIHRoZSBGTFVTSF9NT0RFIHRvIGNsZWFyICov
Cj4gPiA+ID4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dChwY2llLT5wYXJmICsg
UEFSRl9MVFNTTSwgdmFsLAo+ID4gPiA+ICsJCQkJCSAhKHZhbCAmIEZMVVNIX01PREUpLCAxMCwK
PiA+ID4gPiArCQkJCQkgRkxVU0hfVElNRU9VVF9VUyk7Cj4gPiA+ID4gKwlpZiAocmV0KSB7Cj4g
PiA+ID4gKwkJZGV2X2VycihkZXYsICJGbHVzaCBtb2RlIGNsZWFyIGZhaWxlZDogJWRcbiIsIHJl
dCk7Cj4gPiA+ID4gKwkJZ290byBlcnJfaG9zdF9kZWluaXQ7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4g
Kwo+ID4gPiA+ICsJcWNvbV9wY2llX2hvc3RfZGVpbml0KHBwKTsKPiA+ID4gPiArCj4gPiA+ID4g
KwlyZXQgPSBxY29tX3BjaWVfaG9zdF9pbml0KHBwKTsKPiA+ID4gPiArCWlmIChyZXQpIHsKPiA+
ID4gPiArCQlkZXZfZXJyKGRldiwgIkhvc3QgaW5pdCBmYWlsZWRcbiIpOwo+ID4gPiA+ICsJCXJl
dHVybiByZXQ7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJcmV0ID0gZHdfcGNpZV9z
ZXR1cF9yYyhwcCk7Cj4gPiA+ID4gKwlpZiAocmV0KQo+ID4gPiA+ICsJCWdvdG8gZXJyX2hvc3Rf
ZGVpbml0Owo+ID4gPiA+ICsKPiA+ID4gPiArCS8qCj4gPiA+ID4gKwkgKiBSZS1lbmFibGUgZ2xv
YmFsIElSUSBldmVudHMgYXMgdGhlIFBBUkZfSU5UX0FMTF9NQVNLIHJlZ2lzdGVyIGlzCj4gPiA+
ID4gKwkgKiBub24tc3RpY2t5Lgo+ID4gPiA+ICsJICovCj4gPiA+ID4gKwlpZiAocGNpZS0+Z2xv
YmFsX2lycSkKPiA+ID4gPiArCQl3cml0ZWxfcmVsYXhlZChQQVJGX0lOVF9BTExfTElOS19VUCB8
IFBBUkZfSU5UX0FMTF9MSU5LX0RPV04gfAo+ID4gPiA+ICsJCQkgICAgICAgUEFSRl9JTlRfTVNJ
X0RFVl8wXzcsIHBjaWUtPnBhcmYgKyBQQVJGX0lOVF9BTExfTUFTSyk7Cj4gPiA+IGRvIHdlIG5l
ZWQgdG8gZW5hYmxlIGxpbmt1cCBhZ2FpbiBoZXJlLCBzaW5jZSBhbGwgdGhlIGRldmljZXMgYXJl
Cj4gPiA+IGVudW1lcmF0ZWQgcHJldmlvdXNseSwgdGhlIGxpbmt1cCBpcnEgd2lsbCBkbyBhIHJl
c2NhbiBhZ2FpbiB3aGljaCBpcwo+ID4gPiBub3QgbmVlZGVkLgo+ID4gCj4gPiBSaWdodC4gSSB3
YXMgdHJ5aW5nIHRvIGtlZXAgdGhlIGlycSBlbmFibGVtZW50IG9uIHBhciB3aXRoIHByb2JlKCks
IGJ1dCBMSU5LX1VQCj4gPiBpcyBzdHJpY3RseSBub3QgbmVlZGVkLiBJIHdpbGwgZHJvcCBpdC4K
PiA+IAo+ID4gPiBJbnN0ZWFkIG9mIGxpbmt1cCB3ZSB1cGRhdGUgaWNjICYgb3BwIGJhbmR3aWR0
aHMgYWZ0ZXIKPiA+ID4gZHdfcGNpZV93YWl0X2Zvcl9saW5rKCkgaW4gdGhlIGJlbG93Lgo+ID4g
PiAKPiA+IAo+ID4gV2h5IGRvIHdlIG5lZWQgdG8gdXBkYXRlIElDQyBhbmQgT1BQPwo+IEFmdGVy
IGxpbmsgcmV0cmFpbiwgaWYgdGhlIGxpbmsgZGF0YSByYXRlIGhhcyByZWR1Y2VkIGR1ZSB0byBz
b21lCj4gZWxlY3RyaWNhbCBpc3N1ZSBvciBzb21lIG90aGVyIHJlYXNvbiB3ZSBtYXkgbmVlZCB0
byB1cGRhdGUgdGhlIGljYyBhbmQKPiBvcHAgdm90aW5ncyBoZXJlLgo+IAoKSG1tLCBJIHdhcyBu
b3QgZXhwZWN0aW5nIGl0IHRvIGdldCBjaGFuZ2VkLCBidXQgY29uc2lkZXJpbmcgdGhlIGZhY3Qg
dGhhdCB0aGUKbGluayBkb3duIG1pZ2h0IGJlIGhhcHBlbmluZyBkdWUgdG8gYW55IGxpbmsgc3Rh
YmlsaXR5IGlzc3VlcywgaXQgaXMgcGxhdXNpYmxlLgoKSSB3aWxsIGFkZCBhIGNhbGwgdG8gcWNv
bV9wY2llX2ljY19vcHBfdXBkYXRlKCkuCgotIE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43g
rqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
