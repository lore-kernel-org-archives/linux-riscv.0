Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D0BC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YKSyVxj9xGk8wXBrywWJFD1F3h1y2pPaMMFjO2COTi4=; b=zNclFytbpOVMknRTrlyskKR+Z7
	+WeQ0J+YCNzQE3enCNP3DLeOD7QM5ldFs96x2tmxuJWQ+DwdRn1xWg8E80c96fE2yoRxZhDD2qJpx
	DmAUNfTzKiksUW2oKjpd7XvOcMkx5QY7CL1o28puDeWykQqncziuIP9hNRw1fxekCelCFkz3C1QKY
	ITzcndd/omCfvAwBZ1afBa7R7/DNZGmYpk3eQcpdBBrOmK6kdni+iS4eXf9i3ki8pwctBHi65chDa
	1jWB9DVd81k/tvyUwIlUioR9Cx+bvjNdJgPWZhMQnJvx7bGvAL3pEIgT7IDw+QNovCEZTbunS4JMR
	AvDKYxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKHYM-000000056cm-3f41;
	Thu, 20 Jun 2024 13:10:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKHYI-000000056b1-3C6e
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 13:10:13 +0000
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C76B54124D
	for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718889008;
	bh=cBEqkA9XFFNYFCNoxH+x9nm8QNcAohLnExcrRCNI8yQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fo83X6luHOIkjwhW78HOr2pOle9mmbchR+WoB++/r7LUNUul/8UthMTAVXuM/4hJ2
	 pUXWpOcTOZSRwhSHKS1yeZ0f2oKGyYRX0dldcPhivm8h1CmGLSA9qXIzzAsf0dO3T0
	 9IjY0vzTeOgXye7o1+4r93DBeE4Z4BxMl7o9w5x5PztH2SJNStAKV6tSsIyxKGt9az
	 tPrYnDt5q9W7fkc6Q3otZTWSp4ITLeMxut0aqqT7uB2FYAjtJV+VbgisqSmSLq7Tnj
	 qez/QyH1cc19kEQqhEmfqAclS8W7QytIZaKE7JgEZad3xq3yqeVUUHiQgKvLARY8Z4
	 Qz8IKUT4OQ3tA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6f9810627daso1011627a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 06:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718889006; x=1719493806;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cBEqkA9XFFNYFCNoxH+x9nm8QNcAohLnExcrRCNI8yQ=;
        b=w8BTYAl965SQsgqOwLZ+0Nvt+h39oIE3j7ccCDLApax6XGTZUX9Zg4Xu19T+TUeJc4
         fYwV9jB7AXrd2jonJVjpD0oxs4zjKNWAqPcAdlLSV14qShP67ivhF8OHby+1n/s4QKMv
         d1sNuvGnShbkbKtLnVBk4QxkQUBlJEEivSx+VFQK8W9hGRA86xTuYoSW+vYRNiZ8H6Fj
         G/KnVRD0uffMbfjDtCP51R88bhwnNa3Wf4xB07nomj/Rr/9LGknQK563c2Rg4+8V8a2S
         g/Qh8Q2wUfw8QpfQNSxZSMzveekQ4mHOywUGGjg01nTFZimBGtQvGsb+pmAhNcImpzsJ
         wGZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFNmOSZiYq6uv//7rN0B2EtXKmdh1+1RaWd+OP6UpunzyAgfGRTG8JF/HdklqL4nnj8HhdbJz/xpYBdlutobcFVS5eeXlpT32vCeJ1tNut
X-Gm-Message-State: AOJu0YyjZy/OMRnWB8fM+/WSLwk6mDOA2gbsL8QF47OIOrmE0eCRX9fs
	GmZ8ylVGfV5PdGcl4dA0KKgl2j+eNMMZdP0WteJ23wuzGKWb0RhJa4rOe1JFQ8SEScaaoe0PbFt
	+Atw0DyESkejCj5hyWwTj9XNHZlwAuA0JNetBDLA/aWYMxgy2erWribUNx+3JaJtuKUhnn9D7Hv
	bWWHaweFUBNblTqqVv7JoEeQzC6N6PBOkhEi2V9pidLeO6oaRVX7PhOTmj
X-Received: by 2002:ac8:588f:0:b0:43e:26c1:1244 with SMTP id d75a77b69052e-444a7ac0548mr57767851cf.50.1718888532600;
        Thu, 20 Jun 2024 06:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6eCTjNnfu3F3ib5NWq3b3KdavDTGolKno6eVMzl+GyjWyJmaYOBj8Y4jy7Y1eGgGWaRGa2dTIwgT8Nu1YTM8=
X-Received: by 2002:ac8:588f:0:b0:43e:26c1:1244 with SMTP id
 d75a77b69052e-444a7ac0548mr57767431cf.50.1718888532107; Thu, 20 Jun 2024
 06:02:12 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Jun 2024 08:02:11 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAAhSdy1pesbdTfWnFURMJRcy2ujjX+cXtt-cfLDj2CQf2Ua_gw@mail.gmail.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com>
 <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com>
 <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com> <CAAhSdy1pesbdTfWnFURMJRcy2ujjX+cXtt-cfLDj2CQf2Ua_gw@mail.gmail.com>
Mime-Version: 1.0
Date: Thu, 20 Jun 2024 08:02:11 -0500
Message-ID: <CAJM55Z_=94+aMv=ywhih44eF0pR2WXiyx3FcrwRaX6tZto4gpQ@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Anup Patel <anup@brainfault.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_061011_293876_B7E052AC 
X-CRM114-Status: GOOD (  25.95  )
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

QW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAxMToxNuKAr1BNIEVt
aWwgUmVubmVyIEJlcnRoaW5nCj4gPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+
IHdyb3RlOgo+ID4KPiA+IEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVuIDE4LCAy
MDI0IGF0IDc6MDDigK9QTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo+ID4gPiA8ZW1pbC5yZW5uZXIu
YmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gPiA+ID4gVGhlIFBMSUMgZHJpdmVyIGRvZXMgbm90IHJlcXVpcmUgdmVyeSBl
YXJseSBpbml0aWFsaXphdGlvbiBzbyBjb252ZXJ0Cj4gPiA+ID4gPiBpdCBpbnRvIGEgcGxhdGZv
cm0gZHJpdmVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFmdGVyIGNvbnZlcnNpb24sIHRoZSBQTElD
IGRyaXZlciBpcyBwcm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11cAo+ID4gPiA+ID4gc28g
c2V0dXAgY3B1aHAgc3RhdGUgYWZ0ZXIgY29udGV4dCBoYW5kbGVyIG9mIGFsbCBvbmxpbmUgQ1BV
cyBhcmUKPiA+ID4gPiA+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQTElDIGRyaXZlciBjcmFzaGVz
IGZvciBwbGF0Zm9ybXMgd2l0aCBtdWx0aXBsZQo+ID4gPiA+ID4gUExJQyBpbnN0YW5jZXMuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gPiA+ID4KPiA+ID4gPiBIaSBBbnVwLAo+ID4gPiA+Cj4gPiA+ID4gU29y
cnkgZm9yIHRoZSBsYXRlIHJlcGx5IHRvIHRoZSBtYWlsaW5nIGxpc3QsIGJ1dCBldmVyIHNpbmNl
IDYuOSB3aGVyZSB0aGlzIHdhcwo+ID4gPiA+IGFwcGxpZWQgbXkgQWxsd2lubmVyIEQxIGJhc2Vk
IGJvYXJkcyBubyBsb25nZXIgYm9vdC4gVGhpcyBpcyB0aGUgbG9nIG9mIG15Cj4gPiA+ID4gTGlj
aGVlUlYgRG9jayBib290aW5nIHBsYWluIDYuMTAtcmM0LCBsb2NraW5nIHVwIGFuZCB0aGVuIHJl
Ym9vdGluZyBkdWUgdG8gdGhlCj4gPiA+ID4gdGhlIHdhdGNoZG9nIHRpbWluZyBvdXQ6Cj4gPiA+
ID4KPiA+ID4gPiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvbnNiemdFS1cKPiA+ID4gPgo+ID4g
PiA+IE9uIDYuMTAtcmM0IEkgY2FuIGJyaW5nIHRoZSBzYW1lIGJvYXJkIHRvIGJvb3QgYnkgcmV2
ZXJ0aW5nIHRoaXMgcGF0Y2ggYW5kIGFsbAo+ID4gPiA+IHBhdGNoZXMgYnVpbGRpbmcgb24gaXQu
IEVnLjoKPiA+ID4gPgo+ID4gPiA+ICAgZ2l0IHJldmVydCBlMzA2YTg5NGJkNTEgYTdmYjY5ZmZk
N2NlIGFiYjcyMDU3OTQ5MCBcCj4gPiA+ID4gICAgICAgICAgICAgIDk1NjUyMTA2NDc4MCBhMTU1
ODcyNzdhMjQgNmM3MjVmMzNkNjdiIFwKPiA+ID4gPiAgICAgICAgICAgICAgYjY4ZDBmZjUyOWE5
IDI1ZDg2MmUxODNkNCA4ZWM5OWIwMzMxNDcKPiA+ID4KPiA+ID4gRG9lcyB5b3VyIGJvYXJkIGJv
b3Qgd2l0aCBvbmx5IFNCSSB0aW1lciBkcml2ZXIgZW5hYmxlZCA/Cj4gPgo+ID4gSSdtIG5vdCAx
MDAlIHN1cmUgdGhpcyBpcyB3aGF0IHlvdSBtZWFuLCBidXQgd2l0aCB0aGlzIGNoYW5nZSBJIGNh
biBkaXNhYmxlCj4gPiBDT05GSUdfU1VONElfVElNRVI6Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiA+IGluZGV4
IGY1MWJiMjRiYzg0Yy4uMDE0MzU0NTM0OGViIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MKPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gPiBAQCAtMzks
NyArMzksNiBAQCBjb25maWcgQVJDSF9TVU5YSQo+ID4gICAgICAgICBib29sICJBbGx3aW5uZXIg
c3VuMjBpIFNvQ3MiCj4gPiAgICAgICAgIGRlcGVuZHMgb24gTU1VICYmICFYSVBfS0VSTkVMCj4g
PiAgICAgICAgIHNlbGVjdCBFUlJBVEFfVEhFQUQKPiA+IC0gICAgICAgc2VsZWN0IFNVTjRJX1RJ
TUVSCj4gPiAgICAgICAgIGhlbHAKPiA+ICAgICAgICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBm
b3IgQWxsd2lubmVyIHN1bjIwaSBwbGF0Zm9ybSBoYXJkd2FyZSwKPiA+ICAgICAgICAgICBpbmNs
dWRpbmcgYm9hcmRzIGJhc2VkIG9uIHRoZSBEMSBhbmQgRDFzIFNvQ3MuCj4gPgo+ID4KPiA+IEJ1
dCB1bmZvcnR1bmF0ZWx5IHRoZSBib2FyZCBzdGlsbCBkb2Vzbid0IGJvb3Q6Cj4gPiBodHRwczov
L3Bhc3RlYmluLmNvbS9yYXcvQXdSeGNmZXUKPgo+IEkgdGhpbmsgd2Ugc2hvdWxkIGVuYWJsZSBk
ZWJ1ZyBwcmludHMgaW4gREQgY29yZSBhbmQgc2VlCj4gd2hpY2ggZGV2aWNlIGlzIG5vdCBnZXR0
aW5nIHByb2JlZCBkdWUgdG8gbGFjayBvZiBhIHByb3ZpZGVyLgo+Cj4gSnVzdCBhZGQgIiNkZWZp
bmUgREVCVUciIGF0IHRoZSB0b3AgaW4gZHJpdmVycy9iYXNlL2NvcmUuYwo+IGFuZCBib290IGFn
YWluIHdpdGggImxvZ2xldmVsPTgiIGtlcm5lbCBwYXJhbWV0ZXIgKGFsb25nIHdpdGgKPiB0aGUg
YWJvdmUgY2hhbmdlKS4KCldpdGggdGhlIGFib3ZlIGNoYW5nZXMgdGhpcyBpcyB3aGF0IEkgZ2V0
OgpodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvSmZSckVhaFQKCi9FbWlsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
