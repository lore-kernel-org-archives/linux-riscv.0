Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D97C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yUZs3IRCKcE0wGe7uVZ+t/qbuRMDHx7zsbUHHqp10o=; b=FmNAONcMbFvDAW
	0sNukC4EdSmgBRIL9FVWXKmXGa2lk870xo1oE2HMOJ6Vbc8CD5P+Fqu8QC1i7Fz5q+DQPNz23I5Lz
	youeB1IFkX/vrOvGR1tSNy8eynMpfdgAYQvt8KChEVCn2KElB52FdIWEnckWUO0fdMnJigvW57oqZ
	xAL4EjNpOj4cqENaoQ4Ps1k1d91Yg6Der+Sdp7EXGSwYqklNFssFM7zc9kTQDRXLbQkSjhO9k9by5
	1Hx2F+M/inFqwVSZFeT/YZwYBk2LiTZmjg2XAhPY9GN3hIqp4WYuSIE24rESiPjPEAfhPSxxtoFwi
	Mt5DX1b9OVYRWKRsuK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKJOk-00000005ZsW-3Qe8;
	Thu, 20 Jun 2024 15:08:26 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKJOg-00000005ZqL-3leI
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 15:08:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52bbf73f334so841315e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718896101; x=1719500901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqbQ4/LSvNlTgwrSsCzQO6vX4yTeMNAEcNKnVo99eKc=;
        b=Y5PAWQtdde2awDIHdi2byPZQ2DBYj09bRTIpSBbB5rSGFJcBwDkAyzJHMzu3poX3oa
         ZP725ga06Ss7S6Jxx+P5Yoits4GTI5/EGSEttLogXHtcUuAkHSo/Zy64sYHHEapM4/JF
         WnU/ezO4F3yzVI79wBhvvcOC2BkqxKsbXdfC9cVlYprd+g2R1fMa75B4BBXOCRdMVvOm
         bl3Mnlj7TZeqWGFb5yVoQkf0MUOA/jgF0pOPT8sigsFggtWY1fxtrSlPyfM4yY8/Vb2r
         JYr4TmHT1exLegQWAunUgIhgXb+PXfj5V5/zlpcZi/h8ivHCO12hQeYxwVEGFCzBRWAh
         iExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896101; x=1719500901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqbQ4/LSvNlTgwrSsCzQO6vX4yTeMNAEcNKnVo99eKc=;
        b=wS7EE+prv2kevP5zFGPlV5lITRVLA7LW1RwR1llL+TLvDevPyEU9gZpAAkYiUxA/5K
         y0r2/9yg3IoIh0uAzOu83QFmBoAWTUgzsL0PTOawy+dSeRo7Ai/015O/Y4sOnkU0tNzq
         /+7doIdV4VkmqjUn1Ac8IwsMyJ9uCVWn4mbUZGaQs3TUhx8ow3sBPntAWy+pBxWrP4JM
         gu6ffUkVC1+dpxvGdpMFriMIWocAXm+/aZk5sJ7wgpQvgffvXxlJegLkRdTFUC2hY+KR
         hvTOEMAnjtV866Dm4xoIFyDwlL+T4STlXfQtz9HATq4TNtiudzIyAMaMVqwWgaXKxtH6
         rnRA==
X-Forwarded-Encrypted: i=1; AJvYcCU4+VnM5iHGaPPx+rxJfO4l7URQeb7AQarpH5LYIIKebjXaqNh+UVlM56XBwYorgV5DxP9Ee/CPAglMKlnFcqD5+HSBLaaB3Jczo7t377XG
X-Gm-Message-State: AOJu0Yw4j20aL2h/qwJPADdEnMmUO1jIFHb+2ZBKXDaCM9igsv6+Lh93
	AGEah+p4flNbTjms8lDiSHeeXvIYUR3trAWFge74HFQUAKc+GPIee0GmwsVaZFW5vRPVon0iKrx
	GW9llDxU/XBwS3nRUtqOtcKnkxLI5NkV0zNHCXw==
X-Google-Smtp-Source: AGHT+IHk5geEKnYo5/gFE32I0p9kd/apddmgSDY5fMi4jrRdd+DMk3xtL+dIfzBKUvGjuEK0uQvbBTZ0nLC+IZ8WU2I=
X-Received: by 2002:a19:5e49:0:b0:52c:a574:28f2 with SMTP id
 2adb3069b0e04-52ccaa5d013mr3420657e87.26.1718896100763; Thu, 20 Jun 2024
 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com>
 <CAK9=C2WP2+gKScUFuoE9782gjSfnDtcLAw01eCwram3LMAStBg@mail.gmail.com>
 <CAJM55Z8ti-ePT0t714h1Za9X3Ns3=Fw0pCu3NZ=7eT76JU_p5g@mail.gmail.com>
 <CAAhSdy1pesbdTfWnFURMJRcy2ujjX+cXtt-cfLDj2CQf2Ua_gw@mail.gmail.com> <CAJM55Z_=94+aMv=ywhih44eF0pR2WXiyx3FcrwRaX6tZto4gpQ@mail.gmail.com>
In-Reply-To: <CAJM55Z_=94+aMv=ywhih44eF0pR2WXiyx3FcrwRaX6tZto4gpQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Jun 2024 20:38:09 +0530
Message-ID: <CAK9=C2XWjtWtV1WbQrX4Cg8KyzjVevMjG18YTgQJbZxi61BFjg@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_080822_992978_52A0A7EC 
X-CRM114-Status: GOOD (  30.48  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgNjo0MOKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEFudXAgUGF0ZWwg
d3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAxMToxNuKAr1BNIEVtaWwgUmVubmVy
IEJlcnRoaW5nCj4gPiA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBKdW4gMTgsIDIw
MjQgYXQgNzowMOKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCj4gPiA+ID4gPGVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFudXAg
UGF0ZWwgd3JvdGU6Cj4gPiA+ID4gPiA+IFRoZSBQTElDIGRyaXZlciBkb2VzIG5vdCByZXF1aXJl
IHZlcnkgZWFybHkgaW5pdGlhbGl6YXRpb24gc28gY29udmVydAo+ID4gPiA+ID4gPiBpdCBpbnRv
IGEgcGxhdGZvcm0gZHJpdmVyLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBZnRlciBjb252ZXJz
aW9uLCB0aGUgUExJQyBkcml2ZXIgaXMgcHJvYmVkIGFmdGVyIENQVXMgYXJlIGJyb3VnaHQtdXAK
PiA+ID4gPiA+ID4gc28gc2V0dXAgY3B1aHAgc3RhdGUgYWZ0ZXIgY29udGV4dCBoYW5kbGVyIG9m
IGFsbCBvbmxpbmUgQ1BVcyBhcmUKPiA+ID4gPiA+ID4gaW5pdGlhbGl6ZWQgb3RoZXJ3aXNlIFBM
SUMgZHJpdmVyIGNyYXNoZXMgZm9yIHBsYXRmb3JtcyB3aXRoIG11bHRpcGxlCj4gPiA+ID4gPiA+
IFBMSUMgaW5zdGFuY2VzLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBI
aSBBbnVwLAo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSB0byB0
aGUgbWFpbGluZyBsaXN0LCBidXQgZXZlciBzaW5jZSA2Ljkgd2hlcmUgdGhpcyB3YXMKPiA+ID4g
PiA+IGFwcGxpZWQgbXkgQWxsd2lubmVyIEQxIGJhc2VkIGJvYXJkcyBubyBsb25nZXIgYm9vdC4g
VGhpcyBpcyB0aGUgbG9nIG9mIG15Cj4gPiA+ID4gPiBMaWNoZWVSViBEb2NrIGJvb3RpbmcgcGxh
aW4gNi4xMC1yYzQsIGxvY2tpbmcgdXAgYW5kIHRoZW4gcmVib290aW5nIGR1ZSB0byB0aGUKPiA+
ID4gPiA+IHRoZSB3YXRjaGRvZyB0aW1pbmcgb3V0Ogo+ID4gPiA+ID4KPiA+ID4gPiA+IGh0dHBz
Oi8vcGFzdGViaW4uY29tL3Jhdy9uc2J6Z0VLVwo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIDYuMTAt
cmM0IEkgY2FuIGJyaW5nIHRoZSBzYW1lIGJvYXJkIHRvIGJvb3QgYnkgcmV2ZXJ0aW5nIHRoaXMg
cGF0Y2ggYW5kIGFsbAo+ID4gPiA+ID4gcGF0Y2hlcyBidWlsZGluZyBvbiBpdC4gRWcuOgo+ID4g
PiA+ID4KPiA+ID4gPiA+ICAgZ2l0IHJldmVydCBlMzA2YTg5NGJkNTEgYTdmYjY5ZmZkN2NlIGFi
YjcyMDU3OTQ5MCBcCj4gPiA+ID4gPiAgICAgICAgICAgICAgOTU2NTIxMDY0NzgwIGExNTU4NzI3
N2EyNCA2YzcyNWYzM2Q2N2IgXAo+ID4gPiA+ID4gICAgICAgICAgICAgIGI2OGQwZmY1MjlhOSAy
NWQ4NjJlMTgzZDQgOGVjOTliMDMzMTQ3Cj4gPiA+ID4KPiA+ID4gPiBEb2VzIHlvdXIgYm9hcmQg
Ym9vdCB3aXRoIG9ubHkgU0JJIHRpbWVyIGRyaXZlciBlbmFibGVkID8KPiA+ID4KPiA+ID4gSSdt
IG5vdCAxMDAlIHN1cmUgdGhpcyBpcyB3aGF0IHlvdSBtZWFuLCBidXQgd2l0aCB0aGlzIGNoYW5n
ZSBJIGNhbiBkaXNhYmxlCj4gPiA+IENPTkZJR19TVU40SV9USU1FUjoKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNv
Y3MKPiA+ID4gaW5kZXggZjUxYmIyNGJjODRjLi4wMTQzNTQ1MzQ4ZWIgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zy5zb2NzCj4gPiA+IEBAIC0zOSw3ICszOSw2IEBAIGNvbmZpZyBBUkNIX1NVTlhJCj4gPiA+ICAg
ICAgICAgYm9vbCAiQWxsd2lubmVyIHN1bjIwaSBTb0NzIgo+ID4gPiAgICAgICAgIGRlcGVuZHMg
b24gTU1VICYmICFYSVBfS0VSTkVMCj4gPiA+ICAgICAgICAgc2VsZWN0IEVSUkFUQV9USEVBRAo+
ID4gPiAtICAgICAgIHNlbGVjdCBTVU40SV9USU1FUgo+ID4gPiAgICAgICAgIGhlbHAKPiA+ID4g
ICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBBbGx3aW5uZXIgc3VuMjBpIHBsYXRm
b3JtIGhhcmR3YXJlLAo+ID4gPiAgICAgICAgICAgaW5jbHVkaW5nIGJvYXJkcyBiYXNlZCBvbiB0
aGUgRDEgYW5kIEQxcyBTb0NzLgo+ID4gPgo+ID4gPgo+ID4gPiBCdXQgdW5mb3J0dW5hdGVseSB0
aGUgYm9hcmQgc3RpbGwgZG9lc24ndCBib290Ogo+ID4gPiBodHRwczovL3Bhc3RlYmluLmNvbS9y
YXcvQXdSeGNmZXUKPiA+Cj4gPiBJIHRoaW5rIHdlIHNob3VsZCBlbmFibGUgZGVidWcgcHJpbnRz
IGluIEREIGNvcmUgYW5kIHNlZQo+ID4gd2hpY2ggZGV2aWNlIGlzIG5vdCBnZXR0aW5nIHByb2Jl
ZCBkdWUgdG8gbGFjayBvZiBhIHByb3ZpZGVyLgo+ID4KPiA+IEp1c3QgYWRkICIjZGVmaW5lIERF
QlVHIiBhdCB0aGUgdG9wIGluIGRyaXZlcnMvYmFzZS9jb3JlLmMKPiA+IGFuZCBib290IGFnYWlu
IHdpdGggImxvZ2xldmVsPTgiIGtlcm5lbCBwYXJhbWV0ZXIgKGFsb25nIHdpdGgKPiA+IHRoZSBh
Ym92ZSBjaGFuZ2UpLgo+Cj4gV2l0aCB0aGUgYWJvdmUgY2hhbmdlcyB0aGlzIGlzIHdoYXQgSSBn
ZXQ6Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0pmUnJFYWhUCgpZb3Ugc2hvdWxkIHNlZSBw
cmludHMgbGlrZSBiZWxvdyB3aGljaCBzaG93IHByb2R1Y2VyIGNvbnN1bWVyCnJlbGF0aW9uOgoK
WyAgICAwLjIxNDU4OV0gL3NvYy9ydGNAMTAxMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1l
ciB0byAvc29jL3BsaWNAYzAwMDAwMApbICAgIDAuMjE0OTY2XSAvc29jL3NlcmlhbEAxMDAwMDAw
MCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8KL3NvYy9wbGljQGMwMDAwMDAKWyAgICAw
LjIxNTQ0M10gL3NvYy92aXJ0aW9fbW1pb0AxMDAwODAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29u
c3VtZXIKdG8gL3NvYy9wbGljQGMwMDAwMDAKWyAgICAwLjIxNjA0MV0gL3NvYy92aXJ0aW9fbW1p
b0AxMDAwNzAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIKdG8gL3NvYy9wbGljQGMwMDAw
MDAKWyAgICAwLjIxNjQ4Ml0gL3NvYy92aXJ0aW9fbW1pb0AxMDAwNjAwMCBMaW5rZWQgYXMgYSBm
d25vZGUgY29uc3VtZXIKdG8gL3NvYy9wbGljQGMwMDAwMDAKWyAgICAwLjIxNjg2OF0gL3NvYy92
aXJ0aW9fbW1pb0AxMDAwNTAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIKdG8gL3NvYy9w
bGljQGMwMDAwMDAKWyAgICAwLjIxNzQ3N10gL3NvYy92aXJ0aW9fbW1pb0AxMDAwNDAwMCBMaW5r
ZWQgYXMgYSBmd25vZGUgY29uc3VtZXIKdG8gL3NvYy9wbGljQGMwMDAwMDAKWyAgICAwLjIxNzk0
OV0gL3NvYy92aXJ0aW9fbW1pb0AxMDAwMzAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIK
dG8gL3NvYy9wbGljQGMwMDAwMDAKWyAgICAwLjIxODU5NV0gL3NvYy92aXJ0aW9fbW1pb0AxMDAw
MjAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIKdG8gL3NvYy9wbGljQGMwMDAwMDAKWyAg
ICAwLjIxOTI4MF0gL3NvYy92aXJ0aW9fbW1pb0AxMDAwMTAwMCBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIKdG8gL3NvYy9wbGljQGMwMDAwMDAKWyAgICAwLjIxOTkwOF0gL3NvYy9wbGljQGMw
MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvCi9jcHVzL2NwdUAwL2ludGVycnVw
dC1jb250cm9sbGVyClsgICAgMC4yMjA4MDBdIC9zb2MvcGxpY0BjMDAwMDAwIExpbmtlZCBhcyBh
IGZ3bm9kZSBjb25zdW1lciB0bwovY3B1cy9jcHVAMS9pbnRlcnJ1cHQtY29udHJvbGxlcgpbICAg
IDAuMjIxMzIzXSAvc29jL3BsaWNAYzAwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIg
dG8KL2NwdXMvY3B1QDIvaW50ZXJydXB0LWNvbnRyb2xsZXIKWyAgICAwLjIyMTgzOF0gL3NvYy9w
bGljQGMwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvCi9jcHVzL2NwdUAzL2lu
dGVycnVwdC1jb250cm9sbGVyClsgICAgMC4yMjIzNDddIC9zb2MvY2xpbnRAMjAwMDAwMCBMaW5r
ZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8KL2NwdXMvY3B1QDAvaW50ZXJydXB0LWNvbnRyb2xs
ZXIKWyAgICAwLjIyMjc2OV0gL3NvYy9jbGludEAyMDAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBj
b25zdW1lciB0bwovY3B1cy9jcHVAMS9pbnRlcnJ1cHQtY29udHJvbGxlcgpbICAgIDAuMjIzODY0
XSAvc29jL2NsaW50QDIwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvCi9jcHVz
L2NwdUAyL2ludGVycnVwdC1jb250cm9sbGVyClsgICAgMC4yMjQzNzBdIC9zb2MvY2xpbnRAMjAw
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8KL2NwdXMvY3B1QDMvaW50ZXJydXB0
LWNvbnRyb2xsZXIKWyAgICAwLjIyNTIxN10gL3NvYy9wY2lAMzAwMDAwMDAgTGlua2VkIGFzIGEg
Zndub2RlIGNvbnN1bWVyIHRvCi9zb2MvcGxpY0BjMDAwMDAwCgpUbyBnZXQgZnVydGhlciBwcmlu
dHMsIEkgc3VnZ2VzdCBlbmFibGluZyBTQklfSFZDIGNvbnNvbGUgYW5kIHVzZQoiY29uc29sZT1o
dmMwIiBhcyBrZXJuZWwgcGFyYW1ldGVyLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
