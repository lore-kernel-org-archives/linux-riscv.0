Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FF7C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaH3Mup24R0zS3WQr2SZHuxixSUljzV4fS+YSqJrbxA=; b=CrlP1ZJ/pYHPwi
	56QIrWZs1+YguOb7ynclL7xXI1kxnnWlfWsqbjKFPsJ6AnX3V8ie09iuhbJkleJ+To2hFF7PW9Eo1
	+vRI1UcYTsGvB8OyLNskraAqYQn5EYP/FU6l4Ycm5Lff4b5w7MgZDqagzEmOz5PZrneSLH92IBqzl
	IKdN8b2QOtQbGLhoMYBPJNWlAqS1P7wm10y2e8OoZIc0d0hfGazEUFquwUE3ofz4eEk7epIYhjRr8
	7yzAuKVgnw2sJhsfCbDKKLwyohN1EZJq1o6uu7bco+MFBQ16u9Bq1kD8kwZNcUUMUHAOMIR7dKYBu
	Wi4hIPNfZyZ+gyw0JWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7aUK-00Cnyf-16;
	Fri, 09 Jun 2023 11:41:04 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7aUH-00Cnxh-2W
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 11:41:03 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-568928af8f5so24475047b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686310858; x=1688902858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJt3feXs6SxyQtoTGkEhwKTgAeqCp1KzPotYyZ8bIc4=;
        b=Y1My6pemRG3jJeTY2XZLEGCaA4W6dI+/ilaXi1H7/t5ar1Xt08MRq8dPmkoDStDMXm
         kT2xMT9WUoCFhPjjVnNLR8FpVjjfLYljLuWfy8+gOcf4qMNF/4Tck3DfURhGh74b+61z
         5GXCx94pwXORCfv023PbhMTxYlyvhBya7BIUcVnWvxxeGZcEgH5TX6NbHW18bpW1nuGw
         Zu7ssPlBukM6546UMTV8PcfcFD6llsNDuNBHHzOZtqi1Ok3QZgWECjoiRzVFRgFzyVHD
         DMbQV34S2wEd4j9azFOrRar6xAS/7Ve1/EQCLv7a1Gpoq0xRaDBwip/8ZWJP5a1jFG/J
         z5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686310858; x=1688902858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJt3feXs6SxyQtoTGkEhwKTgAeqCp1KzPotYyZ8bIc4=;
        b=B/TfbXci+HyRpLzs79jF3SXFNWvg0Ra/XcpGoWj5kChiJkCrW3HJKIxygBTR/YDpTz
         qSOfRj4h87RHpcoJlMy5q/VObCETR0Uho8dufVagGH6N9yuumN6gh8SN/n/XTculr/TC
         pkIVxnA5OIgsOwUJsDCnnkvsrBv/Fxb4oFFQFqPF+045zaos2CULo7ICOl98mOYMoqyd
         8jvh2bOssV1jB06/InM5HagAd2/ZWLNowX0x4r5XiOPSdLK/xjSvVna34Mqscca62VIk
         pJtnBuQncRtxRlf+jKPFXo7+HIlX5iTVn8Wq/nvMBYlSbEE67qbNZdHp/rI7h4grR86b
         iXVg==
X-Gm-Message-State: AC+VfDy2xJjUtsygxF7Y+mVUtqWnJTvbYnlrVR43oALHyTrgWBjMnZCn
	pGnlmtKVp4yjsz2PKz+4ZWXhSC+J1GUE/KgTk0DFEQ==
X-Google-Smtp-Source: ACHHUZ6tcnye369zFXBV2bBHJWRzfVKRU8NYtwA27HSSc5WJJxk9tivdQDX48v29djspGuooSVUxeE1q+GAIw2Q6QXE=
X-Received: by 2002:a81:4e4e:0:b0:568:ed48:21bb with SMTP id
 c75-20020a814e4e000000b00568ed4821bbmr1746710ywb.13.1686310857937; Fri, 09
 Jun 2023 04:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-3-apatel@ventanamicro.com> <20230608182828.GA3183987-robh@kernel.org>
 <CAGETcx_4OH=EmSUL2-rwKa=1uoOj+AH_xn4PoPsc0kt_aU0WOg@mail.gmail.com>
In-Reply-To: <CAGETcx_4OH=EmSUL2-rwKa=1uoOj+AH_xn4PoPsc0kt_aU0WOg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 Jun 2023 17:10:45 +0530
Message-ID: <CAK9=C2V1LH0739Nq5Ji7gGbgbyFtNAtBYR43fU7vr9omD5tKSA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the
 interrupt controller DT nodes
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_044101_823416_ED3AC730 
X-CRM114-Status: GOOD (  28.87  )
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

T24gRnJpLCBKdW4gOSwgMjAyMyBhdCAxOjM14oCvQU0gU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFu
YWtAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biA4LCAyMDIzIGF0IDExOjI44oCv
QU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gK1NhcmF2YW5h
Cj4gPgo+ID4gT24gTW9uLCBNYXkgMDgsIDIwMjMgYXQgMDc6NTg6MzNQTSArMDUzMCwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+ID4gVGhlIFJJU0MtViBBUExJQyBpbnRlcnJ1cHQgY29udHJvbGxlciBk
cml2ZXIgaXMgYSByZWd1bGFyIHBsYXRmb3JtCj4gPiA+IGRyaXZlciBzbyB3ZSBuZWVkIHRvIGVu
c3VyZSB0aGF0IGl0IGlzIHByb2JlZCBhcyBzb29uIGFzIHBvc3NpYmxlLgo+ID4gPiBUbyBhY2hp
ZXZlIHRoaXMsIHdlIG1hcmsgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGRldmljZSBub2RlcyB3
aXRoCj4gPiA+IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIChqdXN0IGxpa2UgY29uc29sZSBEVCBu
b2RlKS4KPiA+ID4KPiA+ID4gRml4ZXM6IDhmNDg2Y2FiMjYzYyAoImRyaXZlciBjb3JlOiBmd19k
ZXZsaW5rOiBBbGxvdyBmaXJtd2FyZSB0byBtYXJrIGRldmljZXMgYXMgYmVzdCBlZmZvcnQiKQo+
ID4KPiA+IEl0IGlzIGdvb2QgcHJhY3RpY2UgdG8gQ2MgdGhlIGNvbW1pdCBhdXRob3Igb2Ygd2hh
dCB5b3UgYXJlIGZpeGluZy4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvb2YvaXJxLmMg
fCAxMCArKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+
ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZlcnMvb2YvaXJx
LmMKPiA+ID4gaW5kZXggMTc0OTAwMDcyYzE4Li45NGUxZDkyNDVjZmYgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gKysrIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4gPiBA
QCAtNTM1LDYgKzUzNSwxNiBAQCB2b2lkIF9faW5pdCBvZl9pcnFfaW5pdChjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+ID4gPiAgICAgICBJTklUX0xJU1RfSEVBRCgmaW50Y19k
ZXNjX2xpc3QpOwo+ID4gPiAgICAgICBJTklUX0xJU1RfSEVBRCgmaW50Y19wYXJlbnRfbGlzdCk7
Cj4gPiA+Cj4gPiA+ICsgICAgIC8qCj4gPiA+ICsgICAgICAqIFdlIG5lZWQgaW50ZXJydXB0IGNv
bnRyb2xsZXIgcGxhdGZvcm0gZHJpdmVycyB0byB3b3JrIGFzIHNvb24KPiA+Cj4gPiBJZiBpdCdz
IHBsYXRmb3JtIGRyaXZlcnMvZGV2aWNlcyB5b3UgY2FyZSBhYm91dCwgdGhlbiBwZXJoYXBzIHRo
aXMKPiA+IHNob3VsZCBiZSBkb25lIHdoZW4gcGxhdGZvcm0gZGV2aWNlcyBhcmUgY3JlYXRlZC4K
PiA+Cj4gPiA+ICsgICAgICAqIGFzIHBvc3NpYmxlIHNvIG1hcmsgdGhlIGludGVycnVwdCBjb250
cm9sbGVyIGRldmljZSBub2RlcyB3aXRoCj4gPiA+ICsgICAgICAqIEZXTk9ERV9GTEFHX0JFU1Rf
RUZGT1JUIHNvIHRoYXQgZndfZGVsaW5rIGtub3dzIG5vdCB0byBkZWxheQo+ID4gPiArICAgICAg
KiB0aGUgcHJvYmUgb2YgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGRldmljZSBmb3Igc3VwcGxp
ZXJzCj4gPiA+ICsgICAgICAqIHdpdGhvdXQgZHJpdmVycy4KPiA+ID4gKyAgICAgICovCj4gPiA+
ICsgICAgIGZvcl9lYWNoX25vZGVfd2l0aF9wcm9wZXJ0eShucCwgImludGVycnVwdC1jb250cm9s
bGVyIikKPiA+Cj4gPiBUaGlzIGZ1bmN0aW9uIG9ubHkgb3BlcmF0ZXMgb24gbm9kZXMgbWF0Y2hp
bmcgJ21hdGNoZXMnLCBidXQgdGhpcwo+ID4gb3BlcmF0ZXMgb24gZXZlcnl0aGluZy4KPiA+Cj4g
PiBJdCBkb2VzIG1ha2Ugc2Vuc2UgdGhhdCBpZiB3ZSBpbml0IGFuIGludGVycnVwdCBjb250cm9s
bGVyIGhlcmUsIHRoZW4gd2UKPiA+IHdpbGwgc3VyZWx5IHdhbnQgdG8gcHJvYmUgaXRzIGRyaXZl
ciBsYXRlciBvbi4gU28gbWF5YmUganVzdCBtb3ZlCj4gPiBzZXR0aW5nIEZXTk9ERV9GTEFHX0JF
U1RfRUZGT1JUIHdpdGhpbgo+ID4gZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2goKSBi
ZWxvdy4KPiA+Cj4gPiA+ICsgICAgICAgICAgICAgbnAtPmZ3bm9kZS5mbGFncyB8PSBGV05PREVf
RkxBR19CRVNUX0VGRk9SVDsKPiA+ID4gKwo+Cj4gRGVmaW5pdGUgTmFjay4gWW91IGFyZSBwcmV0
dHkgbXVjaCBkaXNhYmxpbmcgZndfZGV2bGluayBmb3IgYWxsCj4gaW50ZXJydXB0IGNvbnRyb2xs
ZXJzLiBUaGVyZSBhcmUgcGxlbnR5IG9mIGV4YW1wbGVzIG9mIHRoZSBJUlEgZHJpdmVycwo+IGJl
aW5nIG5lZWRlZCB2ZXJ5IGVhcmx5IG9uIGFuZCBzdGlsbCBwcm9iaW5nIHByb3Blcmx5IHdpdGhv
dXQgdGhlIG5lZWQKPiBmb3IgdGhpcyBmbGFnLiBQbGVhc2UgZml4IHlvdXIgZHJpdmVyL0RULgoK
T2theSwgSSB3aWxsIHRyeSB0byBzZXQgRldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQgb25seSBmb3IK
QVBMSUMgZGV2aWNlX25vZGUgdmlhIElSUUNISVBfREVDTEFSRSgpLgoKUmVnYXJkcywKQW51cAoK
Cj4KPiAtU2FyYXZhbmEKPgo+Cj4gPiA+ICAgICAgIGZvcl9lYWNoX21hdGNoaW5nX25vZGVfYW5k
X21hdGNoKG5wLCBtYXRjaGVzLCAmbWF0Y2gpIHsKPiA+ID4gICAgICAgICAgICAgICBpZiAoIW9m
X3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImludGVycnVwdC1jb250cm9sbGVyIikgfHwKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIW9mX2RldmljZV9pc19hdmFpbGFibGUobnAp
KQo+ID4gPiAtLQo+ID4gPiAyLjM0LjEKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
