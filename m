Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66821C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Atxas2jArAHIzQOB+p+k2jStxVMb6Xt3N9BOJkCLB60=; b=18zWccHuiciKAk
	zRoyRLqz8J8KmzZ7ndVIK2u7MHxLAKhiEbXe4wpohpno0N1rIusfw8hfyNh5ua/+fGzvXHt/+5nVh
	AORpzbPgER6wqxrfgc9swo7Snn2xYqf9ip6OnGF7L8DrLCZvXixe0thndd7IW/uUM7gc2AO5YSR8w
	Jv6eEah2yuqaW8do5pBY2bze+Tkjzuwpoq1IllzZ++d/5d82rE+Yk4VUwP0zVO6qLd2w4o/cKQaXe
	FDYT5WzNTbciokhYzH+Q9re4RLvcB+CPT573FYIw1M5zkD+4KMZc5Zxl5dfft05Qsfr7ovVoRwtst
	EDrujYCU9FXVFByv49Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsinR-0000000BPDD-0XSh;
	Thu, 13 Mar 2025 13:40:25 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsill-0000000BP71-1LX2;
	Thu, 13 Mar 2025 13:38:42 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so426815e0c.3;
        Thu, 13 Mar 2025 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741873120; x=1742477920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIpqoek4eGSOylKbMTSFOVbyM/qGLYGplSwODZFoBwg=;
        b=QoghAx95tqUxMfwxkExPo1DMv8ZDyoSjGruNuzt9z3uVj7pANJ0LlLkbHd+oVSnopn
         D4EBsqmGrLxgdLGOj7tkfDtArQRfwyDfEf/W6qkD3kQRFfLw9BwqTlW5niRZVcG8JsR9
         LHERBLk00KhhnyRkEgXa9OurY7U0J4g6ZsilHQh4gs8onhMM30agJY18XyEXMdl+SVWq
         AsFkkvGh/P9h/S/iuWnXNeXmVEfSu98/RGy0vURj74qhl+rzUbmFF0nKy9IhJXqdHfOJ
         ciZWPbcQRYiBN6x0aBR+B1PAKa7tkwth40vsmPJcVNpmVKQol6b/Hy93uFTUk+Tr0wMs
         udZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873120; x=1742477920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIpqoek4eGSOylKbMTSFOVbyM/qGLYGplSwODZFoBwg=;
        b=pFhrkpt5k5ov7FwZp3iAnf5dkU4XNBw/RDOUlvl4eh3GWYisIFKbPkiMDDz6WJzWrF
         Sa/ySUiiaZ/ya/kBAH7rBhKFFG15b/JvezQPyB+575eoU9qjQouVxrNmlNnNNFAkio7z
         71EK6MKDzJ/a3Mk5o9J/QIPMd9zAHmeN5O73deAYot+LAECXcFtIB0W/oW4cTfe0nmJB
         t4v6PQ4FFnZfqWDpFw9iFDyAsBwBYhECZyKLAerWltyOJQ1+Gh2tzXhmLMDI5EgwSSOj
         fxGgM9GB6qEN6Y/ktLCpibTrER030FPUXSiobCyD9Q9EzhZoYOioOVO2LsCxBKz+pm4a
         x1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ag5ADvvUGu+t68H/QejuKnfQ0R0dK/fIrhLx9wKWtdofAIH9lk1ipZfXVOy0Rxifc+XhuycQSsOJivQ=@lists.infradead.org, AJvYcCXH2kee6imjUQlfZTedb/di0sZ9BXEEOW/nbzLs+PAvXLpkgx3ul5hRjcTqZxPDAzzbq2uiKLKXSZMS2kLkj/N8@lists.infradead.org
X-Gm-Message-State: AOJu0YwUoJnyWLPcnbbIg+fIV/4G44BP4le8hTlYCJHCc0w98w7Q+yHX
	Qm0rlap7yMU+2ZO5VEHM8CtdTKmPeQPyEfdHoF8q61pxEEnlfrkHxUk7rTeujjdb8HVfXI5KVhC
	7U8/uNtn2vUEUDLKBJiQGFMT1Puw=
X-Gm-Gg: ASbGnctD9++ZQvN5orfY7czMuU5mr//UHQck9ZZdwjpyYePlQpslDfQv7vZiGQsoFCU
	H1pcRdf7487+dzzl/hlIg323hxNLl3JQVwdkefGWuOd23YIhMRbWZHIsOnCLpLI6W/7DjZX1fos
	hGOwi0TH1AU+miew+tx+OOUtfFZ00mLEPz7z8jUizrBrr6kTjkIQIQho1lRTE=
X-Google-Smtp-Source: AGHT+IEcryLwmYP3TdsvEC/+UeCHlR3N+sWjCLCU1sbSkHGz1fjASLBhtHx+j6tuN07I1St0YxBKUyaqA22JoKt2WYU=
X-Received: by 2002:a05:6122:1d9f:b0:516:230b:eec with SMTP id
 71dfb90a1353d-523e4076cf3mr19762024e0c.5.1741873119552; Thu, 13 Mar 2025
 06:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk> <E1tsIUK-005vGk-H7@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tsIUK-005vGk-H7@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Mar 2025 13:38:12 +0000
X-Gm-Features: AQ5f1JqlA8hzG437O530Oq2Xdo4TAVMjVgaona5iqv0GCiHktSEod7myZxpXhN4
Message-ID: <CA+V-a8sasAGkwCWGnbBEjeMRVM79xVVzTq15uJQ_7Q+YwB1QpA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 7/7] net: stmmac: deprecate
 "snps,en-tx-lpi-clockgating" property
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, 
	netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_063841_360572_5C05975C 
X-CRM114-Status: GOOD (  13.02  )
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

T24gV2VkLCBNYXIgMTIsIDIwMjUgYXQgOTo1OOKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gV2hldGhlciB0aGUgTUlJIHRy
YW5zbWl0IGNsb2NrIGNhbiBiZSBzdG9wcGVkIGlzIHByaW1hcmlseSBhIHByb3BlcnR5Cj4gb2Yg
dGhlIFBIWSAodGhlcmUgaXMgYSBjYXBhYmlsaXR5IGJpdCB0aGF0IHNob3VsZCBiZSBjaGVja2Vk
IGZpcnN0LikKPiBXaGV0aGVyIHRoZSBNQUMgaXMgY2FwYWJsZSBvZiBzdG9wcGluZyB0aGUgdHJh
bnNtaXQgY2xvY2sgaXMgYSBzZXBhcmF0ZQo+IGlzc3VlLCBidXQgdGhpcyBpcyBhbHJlYWR5IGhh
bmRsZWQgYnkgdGhlIGNvcmUgRGVzaWduV2FyZSBNQUMgY29kZS4KPgo+IFRoZXJlZm9yZSwgc25w
cyxlbi10eC1scGktY2xvY2tnYXRpbmcgaXMgdGVjaG5pY2FsbHkgaW5jb3JyZWN0LCBhbmQKPiB0
aGlzIGNvbW1pdCBhZGRzIGEgd2FybmluZyBzaG91bGQgYSBEVCBiZSBlbmNvdW50ZXJlZCB3aXRo
IHRoZSBwcm9wZXJ0eQo+IHByZXNlbnQuCj4KPiBIb3dldmVyLCB3ZSBrZWVwIGJhY2t3YXJkcyBj
b21wYXRpYmlsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgpSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJz
LApQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
