Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A52D2E022
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3P3/NdC3M9Yc/8LylM18WlQ+FJES1EuIHhnlWN6/VPQ=; b=RX11XbAYy5N30s
	Hmz8/xE6LTZp+6tqvrSBHTmKHa4ukzf46/NulC4zzQbXp2CuFEk4IFTojYrYnNAozQsZTfSp5NABh
	b5OP2UyzZ0TpmT0RpMlRe9JIEomCfJSQMM43r3AjvH9b24rqXTq02gLhHqGjsaNM7I8o/8BKf4Ye/
	T7KHZijI/vHj6adp+YP8zrMAs/aDQsWUnCZWFK4aVxt4n7qhvEB+QPv9uwJiKvxBYe2mPMNqvac4I
	zVH2AUVNARklQz41h7PkOGAHn9ZULHy4rBCtYWJohd5wFtHfcHHYSSNa1qloU5cvu+epIvW/U7f2S
	7GlGIGzmxzq/5A7ksR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQlE-00000009C2V-1bAs;
	Fri, 05 Dec 2025 08:01:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQlB-00000009C1v-1P5H
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 08:01:50 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so3202574a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 00:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764921707; x=1765526507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZqjFJmgsvyAV8OLMiyLDL43e0L9PCAK+2slIeGx9Dk=;
        b=AxEJaVvMlo9sGaPLdqcGVlQoFiMGT/IXxj+HLLAlGJ2T4JgIy830bfHRbaFG9m7Jit
         eFwyLOCSccGXf2cTwCAEzTi0sazTo29kdCIfp0Pk6giyNJuZNdWoVLkMM0Bmn+X+FXV4
         Fhl3Exj+n2pGYD4L7Q2dhf0H/vXr/4W5l2CZBcqDPNMSkaxQRdKfHd/Hw4Wl/mMerj0d
         i6nJ6NwuMB7P7+UdPEWuTmrFfK128D9fM1jFm+UZ6ycaHKvupallEbokrN6cSaXmYOoM
         QUaIFp5S6MjKXMntvP3+rR2fmDowzp+2Hc/gwlp/TN74H/6zc2eZ9/CkgkfZu8MpMjKT
         6qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764921707; x=1765526507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZqjFJmgsvyAV8OLMiyLDL43e0L9PCAK+2slIeGx9Dk=;
        b=CmtybWtQVs5u6JdnMWBb/wo9w4GU2djvC8Arnn+EqHBb7hNm1n9RMRqIDHvnbYHn+o
         3HB4YIa45LlysKsx6hjezCwvBJowJqUEZty8ViYtwWTzEbePBkN7GGfGDD4tF9bR2DmU
         552xuB/J0UQWiJBf7BMh7OMJ+w+qaWJ6nitHBB1envAQPUzivAZ8O0DhrgBuLBLC+sNw
         WLf8qQLaU19qRsWAlk6NHBh4CG0SjcOpytCt1sr6iaehGhlWm9/96wt2T032u4MtBHQz
         6HjHs6uVGUwZ14YfuCaW1Il5S/aO0tBw0MxhO/f30dc6hyuncanWcAVeNSWIHbB+AnyZ
         nqpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXByqg0lI42CRR8p5grxbhu71uuTbbJu1FPEy0U5715bGKmd/N247djZcZt+83o19rEEJ3pnJ3br8OHzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuNpMzHxt9KIBgpPFWJlo4J8VOFapPS+qcoz2KZh08GAoRQYPY
	1NNYOWciG3bd3f136kXUgywf0hoLElZXTI5dcXlqj9reV5tUr/gNd3A94gMjVZeFYwIgtLFoxs6
	9Ro3ibk8Kd8nOXSSWOnZz7qgIj8VAtZ4=
X-Gm-Gg: ASbGncs9ifu57m7HyAFYorYLH1v3Jk4v6R7hf8NR3rcdUnNC1k77vhDknA+7zSp3M/j
	4a76ZOcB8T3tzEFDadSr23ZlbProfRTyVOg34dFEn1T/UjR6zQWx+DnTF63yaXIccadlV+r1H9b
	8B2ukYKwXFhlY3dU10DSDXtZvlaRwQgMQvTkFNYjqD/cf/znPQbFmvcpKx/QOfdHD9DsWtTemab
	80+eDVCCGToUZAtLEF/GNZ+CRNtKWjADZ6YafkRl1kutGl1fDdvwIkH76DIAVpd7XDj2A==
X-Google-Smtp-Source: AGHT+IFE6UJtYE9mIS1oruoEjp4qDr83WNERh/nzYDna+THuvhPLJ9HPxcLjvEK47v4D3XzW4tAm0F6Bv4lRC3CXaA8=
X-Received: by 2002:a05:6402:518b:b0:641:66cc:9d91 with SMTP id
 4fb4d7f45d1cf-6479c519e8bmr7371624a12.27.1764921707253; Fri, 05 Dec 2025
 00:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20251125075604.69370-1-hal.feng@starfivetech.com>
 <20251125075604.69370-5-hal.feng@starfivetech.com> <CANAwSgQSBB_yTw5rDz2w6utvjUueWJi9tWUY9oZcpNAT8Wm8iA@mail.gmail.com>
 <ZQ2PR01MB13076311CBBFE5B948F394FCE6A72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ2PR01MB13076311CBBFE5B948F394FCE6A72@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Dec 2025 13:31:30 +0530
X-Gm-Features: AQt7F2rB8dLMd_Fit7Ps6bUhIfDS-utXO0oh0y7DDayDYIxfnNEaF0b56EOtKqo
Message-ID: <CANAwSgTUqGcwcy_VBgttmzRs+v9Tp2fET43gFb=SiiFLxm2-Fg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] riscv: dts: starfive: Add common board dtsi for
 VisionFive 2 Lite variants
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_000149_403631_4FA78744 
X-CRM114-Status: GOOD (  20.51  )
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

SGkgSGFsLAoKT24gRnJpLCA1IERlYyAyMDI1IGF0IDEzOjExLCBIYWwgRmVuZyA8aGFsLmZlbmdA
c3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4KPiA+IE9uIDA1LjEyLjI1IDAxOjA1LCBBbmFuZCBN
b29uIHdyb3RlOgo+ID4gSGkgSGFsLAo+ID4KPiA+IE9uIFR1ZSwgMjUgTm92IDIwMjUgYXQgMTM6
MjcsIEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gQWRkIGEgY29tbW9uIGJvYXJkIGR0c2kgZm9yIHVzZSBieSBWaXNpb25GaXZlIDIgTGl0ZSBh
bmQgVmlzaW9uRml2ZSAyCj4gPiA+IExpdGUgZU1NQy4KPiA+ID4KPiA+ID4gQWNrZWQtYnk6IEVt
aWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+
ID4gPiBUZXN0ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICAuLi4vamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi1saXRlLmR0c2kg
ICAgfCAxNjEgKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYxIGlu
c2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gPiBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItbGl0ZS5kdHNpCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQKPiA+ID4gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItbGl0ZS5kdHNpCj4gPiA+IGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLWxpdGUuZHRz
aQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY4
Nzk3YTY2NmRiZgo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi1saXRlLmQKPiA+ID4g
KysrIHRzaQo+ID4gPiBAQCAtMCwwICsxLDE2MSBAQAo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCj4gPiA+ICsvKgo+ID4gPiArICogQ29weXJpZ2h0IChD
KSAyMDI1IFN0YXJGaXZlIFRlY2hub2xvZ3kgQ28uLCBMdGQuCj4gPiA+ICsgKiBDb3B5cmlnaHQg
KEMpIDIwMjUgSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+ICAqLwo+ID4gPiAr
Cj4gPiA+ICsvZHRzLXYxLzsKPiA+ID4gKyNpbmNsdWRlICJqaDcxMTAtY29tbW9uLmR0c2kiCj4g
PiA+ICsKPiA+ID4gKy8gewo+ID4gPiArICAgICAgIHZjY18zdjNfcGNpZTogcmVndWxhdG9yLXZj
Yy0zdjMtcGNpZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRv
ci1maXhlZCI7Cj4gPiA+ICsgICAgICAgICAgICAgICBlbmFibGUtYWN0aXZlLWhpZ2g7Cj4gPiA+
ICsgICAgICAgICAgICAgICBncGlvID0gPCZzeXNncGlvIDI3IEdQSU9fQUNUSVZFX0hJR0g+Owo+
ID4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAidmNjXzN2M19wY2llIjsKPiA+
ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+
ID4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47
Cj4gPiA+ICsgICAgICAgfTsKPiA+ID4gK307Cj4gPgo+ID4gVGhlIHZjY18zdjNfcGNpZSByZWd1
bGF0b3Igbm9kZSBpcyBjb21tb24gdG8gYWxsIEpINzExMCBkZXZlbG9wbWVudAo+ID4gYm9hcmRz
Lgo+ID4gYW5kIGl0IGlzIGVuYWJsZWQgdGhyb3VnaCB0aGUgUFdSRU5fSCBzaWduYWwgKFBDSUUw
X1BXUkVOX0hfR1BJTzMyKS4KPiA+Cj4gPiBWaXNpb25GaXZlIDIgUHJvZHVjdCBEZXNpZ24gU2No
ZW1hdGljcyBiZWxvdyBbMV0gaHR0cHM6Ly9kb2MtCj4gPiBlbi5ydnNwYWNlLm9yZy9WaXNpb25G
aXZlMi9QREYvU0NIX1JWMDAyX1YxLjJBXzIwMjIxMjE2LnBkZgo+ID4KPiA+IE1hcnNfSGFyZHdh
cmVfU2NoZW1hdGljcwo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9taWxrdi1tYXJzL21hcnMt
Cj4gPiBmaWxlcy9ibG9iL21haW4vTWFyc19IYXJkd2FyZV9TY2hlbWF0aWNzL01pbGstCj4gPiBW
X01hcnNfU0NIX1YxLjIxXzIwMjQtMDUxMC5wZGYKPgo+IE5vLCBHUElPMzIgaXMgY29ubmVjdGVk
IHRvIHRoZSBXQUtFIHBpbiwgaXQgaXMgbm90IHVzZWQgdG8gY29udHJvbCB0aGUgUENJZSBzbG90
IHBvd2VyLgo+Ck9rLCBHUElPMzIgaXMgdXNlZCBmb3IgcGNpZTAgKFBDSUUwX1BXUkVOX0hfR1BJ
TzMyKQpPbmx5IFBDSUUwIHN1cHBvcnRzIHBvd2VyIGZvciB0aGUgNC1wb3J0IFVTQiBwb3J0cy4K
CkFzIHBlciBWaXNpb25GaXZlIDIgU2luZ2xlIEJvYXJkIENvbXB1dGVyIFF1aWNrIFN0YXJ0IEd1
aWRlClVTQjMwIDQgw5cgVVNCIDMuMCBwb3J0cyAobXVsdGlwbGV4ZWQgd2l0aCBhIFBDSWUgMi4w
IDF4IGxhbmUpLgoKPiBCZXN0IHJlZ2FyZHMsCj4gSGFsCgpUaGFua3MKLUFuYW5kCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
