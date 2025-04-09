Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757EC369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkhMB+WelTf6rxYIgouUUdB+RKBYVXb3Dl/HelhRMUY=; b=UfUSewVhV6Wki6
	ysXVZMbJMo1/iT8Hip4Owbt6mtVvqid2h1uRZNEEe9kEDf3+4l6mfKCqvSV3vK8Et2QsioJ4FAKzz
	InTElWTpEK/jfs0xkXFpdVxDLFpXlLd6nCcbMMXWyHCQqJH5AaiT9eUbe33zH06rCQ4XH2Jf6V98K
	2dSM4tvEqsGHnDKVmxUnLloUh9c5mTHEZhUC1Z0TqzQO+dRvv3KAHQiB80ha0So47mUClPOSFfYSr
	F8X7JpE9fdh6s8+OKbwEkcMArcqMjJDIhwJg37vNvpw6hiEaoyq2Kqqrkru1y1TfHNTS2ATRiOutt
	Dhc1tLoB4Wx3q9gAU9Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Qmn-00000006ZpG-2yJC;
	Wed, 09 Apr 2025 08:27:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PVr-00000006N3p-3E1h
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 07:06:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22a976f3131so37513765ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744182379; x=1744787179; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=U2vCcACrmF143V/gOGvahmZxiiTGzCcyBi7b6aWSbZTW2y266YTyn/EYdNeR+HzYE2
         igW87gl/M+PJAqSNsfmHeXbehx8MfLpW0JRIccErdvkDZ8v41PJfZ9v7MnDVfMBpL9KJ
         OKhiyLxe4KuY0JPoUCkY4rVs1q9WnnvFoBoEBJghlR+umzQEusmFNRUwHjwoY00GABbw
         pM0+E0E6WPmhO9zw5bLbMWPpVf7wBui8OeHWCiCEUtoOioS6h9SXwsfCdSKT1q/X5Bmp
         kelyWYfXBCCBtLQPSVevb9foJtl/SrLnQD4c3dlyzNB1PeX13CC+CdXw+q9fddLehLR1
         a7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182379; x=1744787179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm7nG2cOghl5We3pl16VQKS1/9Lv238uk1E4idOp5vQ=;
        b=gxWo5FVX71e5KqSRYn6a3P1m0NcjTCPHR9B5S0cOr6aPuEH3g6OiRXqkbeV+yNU6Aw
         g/iNZSp5YU1TQ9TcppeGufKu9l4Ym6ebxyFQBMalfXUyxKc/oHz3wk8h2cZeVeCP+PvY
         hXRUUYrs9/PMXjMEjPlbEjRIzogxnSUBTZa52Hk4IQ2g0VQms+PAXmRM3/yoyEC508rv
         Dgx3WOpB0mt7P6dwgYtuj4rB3VP0L2AzkCb4r1/e1V7khKYzH4ZE7WrTHmyLHRCckhyN
         qTGhB4/j3LeEWx2nIF3iWlbpdHw0x/yqoo2HOgAqDLO+84zsAgFFB4j+tDMPiz2/zVyQ
         tQWA==
X-Forwarded-Encrypted: i=1; AJvYcCW1rYpZ5JDzWcFPFTkDk+zQ1LldHkb4q8PcmP1dlZwDQXZ/nxiWlqfZRm6xe2hx97msITN3zZqC869hFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcmEqUf6uvYdXnkw9WGoh+UcAwmeR9fccfQftbCR3hKP79691c
	9VBIjqExQMW2b19vRTvPu4ZtcehKI4AKR94BmcxLKehbnkqgxPCUBjox3uaITg==
X-Gm-Gg: ASbGncuFEZpWNYh8sc6qBPqKCUMQm1jc1q326K9awjXKfDbKrKI3Bc/phVbDktGvfvp
	e75tObFXDjAVWoM6mUMoG3ZyxHD3kZSRnKL/dl5YkZEPznb4Id+jiuPB8mDiyg8j/GpihJHEkHs
	h25FSWBcJM7sOvyhv6awlPSqglX2SmcEVDaUvCwtjplVVhiPdj/9Dj17hjEq5EFO3vm7O3S28fb
	rjR8WghMkNk7jKP66kD+tdGDBd5QPxLvAAAYBqNPB7GjU3WLiuvJmaxgnHwJQuWN0aMmGlYnoIh
	JMD1OYjgnyreVgXO7R01bu5jkkJcxLi52xtY3z3owGJP9jcrw7k=
X-Google-Smtp-Source: AGHT+IG2IBbUsP4jpyoBsAQl7I0S2iGdcUbnYfvvANGYcDIZAtyYHJ27CyPFx40ttshkAUckDfLO7g==
X-Received: by 2002:a17:903:3bc6:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22ac2a2991bmr35596635ad.41.1744182379003;
        Wed, 09 Apr 2025 00:06:19 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm4544815ad.170.2025.04.09.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:06:18 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:36:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include
 placement in DTS example
Message-ID: <3cfkeludmigojzadrgyxyidiydb3mx6yqjcvmgpbhdk75cflog@66i4zpvjcwzv>
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
 <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324125202.81986-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_000619_910727_D77906FC 
X-CRM114-Status: GOOD (  15.05  )
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

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgMDE6NTI6MDJQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBDb2Rpbmcgc3R5bGUgYW5kIGNvbW1vbiBsb2dpYyBkaWN0YXRlcyB0aGF0
IGhlYWRlcnMgc2hvdWxkIG5vdCBiZQo+IGluY2x1ZGVkIGluIGRldmljZSBub2Rlcy4gIE5vIGZ1
bmN0aW9uYWwgaW1wYWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBNYW5pdmFubmFu
IFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5pCgo+
IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0
MC1wY2llLnlhbWwgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwKPiBpbmRleCA4NDRmYzcxNDIz
MDIuLmQzNWZmODA3OTM2YiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwKPiBAQCAtODEs
MTAgKzgxLDEwIEBAIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiAgCj4gIGV4YW1wbGVz
Ogo+ICAgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3NpZml2ZS1mdTc0
MC1wcmNpLmg+Cj4gICAgICBidXMgewo+ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+IC0gICAgICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9zaWZpdmUtZnU3NDAtcHJjaS5oPgo+ICAKPiAgICAgICAgICBwY2llQGUwMDAw
MDAwMCB7Cj4gICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NzQwLXBjaWUiOwo+
IC0tIAo+IDIuNDMuMAo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTg
rr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
