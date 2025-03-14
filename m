Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8C4C282DE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 02:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZckQrA1uaIzCvseVCvNHCEpxtkD52FcImYvsYfz2eDI=; b=D9uXMPSjAXpeZG
	bP2JAQ6W0LnZjRJFVU+KpikSL7Pbrf83YUS2NGT7lcNxtXKLbxcM2iq0BwkbpFf+cjh8Zg5nXHc2M
	uIhvZ7l5DI/nULvRqwtjutxg1ibhYXeqcbix0ZgtM6yfpRiLQHoohPuFOKB3zTz/ozgsEstlodD+M
	h1153ujqf23lCpalbxcn0GE4EHGXFALdxOQTUqtD0edr3deskzKHxHFpPpZka9L0+yVI2wQCkfx1G
	mrm28M92OTgIjXZqiL3D8m9UMY+ZCSOQz9ZVTml76Za+jl/AeqpdJ7C/7uM3tUo+9LXoTd2NRx0LU
	z95oFL3/aqBeywvTWeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsua8-0000000Cw2l-1jda;
	Fri, 14 Mar 2025 02:15:28 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsua6-0000000Cw2R-3r96
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 02:15:28 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e6341e4d0b4so2420463276.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 19:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741918526; x=1742523326; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T99dV3Uq7aEWaCkVGWwvQtt3V/o9AKuRHiK8eGHc9PU=;
        b=LNswLnBoIFV5pqzmqz+IiY1DoIN/AJHRkfcOmrKaNzhT7+4pbPst5S67KCgIgR/xD2
         lPsXX4PdsWzx1xEXcpsXq9cwfqletSH0nQdvDhFi4LR+vFg1mvfvQ+X59M2FXvfwmrNe
         wt13FRkm6y8e4htFpT+US7w8G+NyR05pxKvwrKJka59NFD4HzYLwaPPHPJQjyE5qgyYv
         E+8J+3ZvQqBcON16DmJ+gCMybeh2rP8Cr0Z06T10PBYeVKF2x4WCcLDdyURz89eEO39C
         MZtHsXqgmJElbQvNajT9JypuS88iEkosvsPYUwYdjAVcoQVFhJRnPPYBFT3rvXshKc+Y
         n+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741918526; x=1742523326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T99dV3Uq7aEWaCkVGWwvQtt3V/o9AKuRHiK8eGHc9PU=;
        b=b3baqo0iBEjvl79Jqxm5BponDYpUuP/Ld/RZH9M4dxARMH4gHuVMjRgPdFmXVuq29s
         qrIvgfaMQAWTKcDTeC3R2OApCE59XvdAdxKHDGaWwdbyRDRZMtsiBMhuca/mW7OcKhmk
         qMRNDAsOZjjQSVvN8TNwvxBDCekIIkXNvOjjCApamLVNjNKMPigy8tdlsMPFyeazd2g5
         kGPKosnJqNH6reDKjjuX7n3UncNlSWFjz4TT0IRCTIwZPDMHEI+kPjcXZm8dHmC4buAj
         dCpzTB+gNgvHEYQctqUqkfLNYM8jWStOgr+j1Ekm6NCMQvoyyJrwIAUyoSKZQ0ZCYNWy
         y/lw==
X-Forwarded-Encrypted: i=1; AJvYcCU9V0bzGjT0iGRbQwFjEU3jJrazbAhaGaOkyFoGFQkiHmESAEVJrWbwvMra81U5BJfIMkfsg7yy9Bsc3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmDBoco4h8kLHgjtkWnSbI33xGW0VM31HfM+8SyMWgm5NcRakB
	On2TDGKOhJZv/IS/roqzPFtPCAqV6RXDGl83xfl8ILOfwLFxcsfuYCbPm5wbp3Q5zxy7VVfLNDo
	qVcehDeAK9ptqNiPuTekWJddEH8dKER1IN4cKUw==
X-Gm-Gg: ASbGncs/3kisxfLc6qq/Pe9dzEwWrUKGrVQ/0fXr/IQO4UI1QhxGB051ElVYLVE8Kic
	NZ/2jtw4dOCmSKRerIyEB8EWld3uJLAbp/zl7+CzjEg/iEG/gZjtNaasRuA1B5MtI+PjhsYUThF
	9hf3XvhBe+50+QKXuC2RkAY+5d5eUW
X-Google-Smtp-Source: AGHT+IHZJIA2sGuuLpw4nu/kd5eWiOVpCXCqNzwuBqabCwda6Hqeys5Dm5JRzxWzQFqS/5g8VYhcKp6/4iL47c09Ssc=
X-Received: by 2002:a05:6902:2741:b0:e63:f497:6c56 with SMTP id
 3f1490d57ef6-e63f870c84fmr758036276.5.1741918525736; Thu, 13 Mar 2025
 19:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250311051903.3825-1-nick.hu@sifive.com> <20250311195953.GA14239-robh@kernel.org>
 <20250311-erasure-rival-f68525c21742@spud> <CAKddAkBwkVQS7UtVvXCdLxEz6bz1=_X1u1CGUPm-OHiyAD4Dsw@mail.gmail.com>
 <20250313-kimono-passport-496a312a849c@spud>
In-Reply-To: <20250313-kimono-passport-496a312a849c@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 14 Mar 2025 10:15:15 +0800
X-Gm-Features: AQ5f1JqO6TLaKc51TXJ4bdfuCtPc_Kic86Fu4xccYBge3lE03TGoc4P7PcGLanE
Message-ID: <CAKddAkCb+wAT3EcvmpoD57LFYGd8LOOUDEreFvdTnRtDjynD=g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Add SiFive CLINT2
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_191526_981928_65052DF3 
X-CRM114-Status: GOOD (  33.60  )
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

SGkgQ29ub3IKCk9uIEZyaSwgTWFyIDE0LCAyMDI1IGF0IDY6MzTigK9BTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMDM6
NTg6MDVQTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+IEhpIFJvYiBhbmQgQ29ub3IKPiA+Cj4g
PiBUaGFua3MgdG8gYWxsIHlvdXIgZmVlZGJhY2suCj4gPgo+ID4gT24gV2VkLCBNYXIgMTIsIDIw
MjUgYXQgNDo0NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFR1ZSwgTWFyIDExLCAyMDI1IGF0IDAyOjU5OjUzUE0gLTA1MDAsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgTWFyIDExLCAyMDI1IGF0IDAxOjE5OjAzUE0g
KzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiA+ID4gPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgYW5k
IHByb3BlcnR5IGZvciB0aGUgU2lGaXZlIENMSU5UIHYyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gPiA+IFJldmll
d2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+ID4g
PiA+IC0tLQo+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCAg
ICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwK
PiA+ID4gPiA+IGluZGV4IDc2ZDgzYWVhNGUyYi4uOTNkNzRjNTA0YjVmIDEwMDY0NAo+ID4gPiA+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxj
bGludC55YW1sCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+ID4gPiA+IEBAIC0zNiw2ICszNiw5IEBAIHBy
b3BlcnRpZXM6Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1jbGlu
dCAgICMgU3RhckZpdmUgSkg3MTEwCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAtIHN0YXJmaXZl
LGpoODEwMC1jbGludCAgICMgU3RhckZpdmUgSkg4MTAwCj4gPiA+ID4gPiAgICAgICAgICAgIC0g
Y29uc3Q6IHNpZml2ZSxjbGludDAgICAgICAgICMgU2lGaXZlIENMSU5UIHYwIElQIGJsb2NrCj4g
PiA+ID4KPiA+ID4gPiBOb3RpY2UgdGhhdCB3ZSBkb24ndCBhbGxvdyBjbGludDAgYnkgaXRzZWxm
LiBXZSBzaG91bGRuJ3Qgc3RhcnQgbm93Lgo+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAgLSBpdGVt
czoKPiA+ID4gPgo+ID4gPiA+IElmIHlvdSBkb24ndCBoYXZlIGEgc3BlY2lmaWMgb25lIHlldCwg
dGhlbiBhZGQgJy0ge30nIGZvciB0aGUgZmlyc3QKPiA+ID4gPiBlbnRyeS4KPiA+ID4gPgo+ID4g
RG8geW91IHN1Z2dlc3Qgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZz8KPiA+ICAgICAgLSBp
dGVtczoKPiA+ICAgICAgICAgICAtIHt9Cj4gPiAgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNs
aW50MiAgICAgICAgIyBTaUZpdmUgQ0xJTlQgdjIgSVAgYmxvY2sKPiA+ICAgICAgICAgZGVzY3Jp
cHRpb246IFNpRml2ZSBDTElOVCB2MiBpcyB0aGUgSFJUIHRoYXQgc3VwcG9ydHMgdGhlIFppY250
cgo+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50MiAgICAgICAg
IyBTaUZpdmUgQ0xJTlQgdjIgSVAgYmxvY2sKPiA+ID4gPiA+ICsgICAgICAgIGRlc2NyaXB0aW9u
OiBTaUZpdmUgQ0xJTlQgdjIgaXMgdGhlIEhSVCB0aGF0IHN1cHBvcnRzIHRoZSBaaWNudHIKPiA+
ID4gPiA+ICAgICAgICAtIGl0ZW1zOgo+ID4gPiA+ID4gICAgICAgICAgICAtIGVudW06Cj4gPiA+
ID4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQKPiA+ID4gPiA+
IEBAIC02Miw2ICs2NSwyMiBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gICAgICBtaW5JdGVtczog
MQo+ID4gPiA+ID4gICAgICBtYXhJdGVtczogNDA5NQo+ID4gPiA+ID4KPiA+ID4gPiA+ICsgIHNp
Zml2ZSxmaW5lLWN0ci1iaXRzOgo+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIHdpZHRo
IGluIGJpdHMgb2YgdGhlIGZpbmUgY291bnRlci4KPiA+ID4gPgo+ID4gPiA+IG1heGltdW06IDE1
Cj4gPiA+ID4KPiA+ID4gPiBVbmxlc3MgeW91IGtub3cgb2YgYSBkaWZmZXJlbnQgbWF4aW11bSBp
biB3aGljaCBjYXNlIHdoeSBhcmVuJ3QgeW91Cj4gPiA+ID4gZG9jdW1lbnRpbmcgdGhhdCB0b28/
Cj4gPiA+Cj4gPiBZb3UgYXJlIHJpZ2h0LiBJdCdzIG15IGJhZC4gVGhlIG1heGltdW0gd2lkdGgg
c2hvdWxkIGFsd2F5cyBiZSAxNSBpbgo+ID4gc2lmaXZlLGNsaW50Mi4KPiA+IEkgc2hvdWxkIHVw
ZGF0ZSB0bzoKPiA+ICBzaWZpdmUsZmluZS1jdHItYml0czoKPiA+ICAgICBtYXhpbXVtOiAxNQo+
ID4gICAgIGRlc2NyaXB0aW9uOiBUaGUgd2lkdGggaW4gYml0cyBvZiB0aGUgZmluZSBjb3VudGVy
Lgo+ID4KPiA+IGlmOgo+ID4gICBub3Q6Cj4gPiAgICAgcHJvcGVydGllczoKPiA+ICAgICAgIGNv
bXBhdGlibGU6Cj4gPiAgICAgICAgIGNvbnRhaW5zOgo+ID4gICAgICAgICAgIGNvbnN0OiBzaWZp
dmUsY2xpbnQyCj4gPiB0aGVuOgo+ID4gICBwcm9wZXJ0aWVzOgo+ID4gICAgIHNpZml2ZSxmaW5l
LWN0ci1iaXRzOiBmYWxzZQo+Cj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBpbnZlcnRlZCwgdG8K
Pgo+IGlmOiBwcm9wZXJ0aWVzOiBjb21wYXRpYmxlOiBjb250YWluczogY29uc3Q6IHNpZml2ZSxj
bGludDIKPiB0aGVuOiByZXF1aXJlZDogLSBzaWZpdmUsZmluZS1jb3VudGVyLWJpdHMKPiBlbHNl
OiBzaWZpdmUsZmluZS1jb3VudGVyLWJpdHM6IGZhbHNlCj4KPiBzaW5jZSB0aGUgcHJvcGVydHkg
aGFzIG5vIGRlZmF1bHQuCj4KV2lsbCB1cGRhdGUgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4gVGhh
bmtzIGZvciB0aGUgYWR2aWNlLgoKPiA+Cj4gPiA+IEknbSBjdXJpb3VzIHdoeSB0aGlzIGlzIG5v
dCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgZGlzY2VybmVkIGZyb20gdGhlCj4gPiA+IGNvbXBhdGli
bGUuIEl0J3MgbWF4IDE1LCBidXQgYXJlIHRoZXJlIGFjdHVhbGx5IHZlcnNpb25zIG9mIHRoaXMg
d2l0aCBhCj4gPiA+IGxlc3MtdGhhbi0xNS1iaXQgd2lkdGg/Cj4gPiA+Cj4gPiBUaGUgd2lkdGgg
bWF5IGJlIHZhcmlvdXMgb24gZGlmZmVyZW50IHBsYXRmb3JtcyBzbyBpdCBpcyBwb3NzaWJsZSB0
bwo+ID4gaGF2ZSBhIGxlc3MtdGhhbi0xNS1iaXQgd2lkdGguCj4gPgo+ID4gPiA+Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiAraWY6Cj4gPiA+ID4gPiArICBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gKyAg
ICBjb21wYXRpYmxlOgo+ID4gPiA+ID4gKyAgICAgIGNvbnRhaW5zOgo+ID4gPiA+ID4gKyAgICAg
ICAgY29uc3Q6IHNpZml2ZSxjbGludDIKPiA+ID4gPiA+ICt0aGVuOgo+ID4gPiA+ID4gKyAgcHJv
cGVydGllczoKPiA+ID4gPiA+ICsgICAgc2lmaXZlLGZpbmUtY3RyLWJpdHM6Cj4gPiA+ID4gPiAr
ICAgICAgbWF4aW11bTogMTUKPiA+ID4gPiA+ICtlbHNlOgo+ID4gPiA+ID4gKyAgcHJvcGVydGll
czoKPiA+ID4gPiA+ICsgICAgc2lmaXZlLGZpbmUtY3RyLWJpdHM6IGZhbHNlCj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+ID4gPgo+ID4gPiA+
ID4gIHJlcXVpcmVkOgo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuMTcuMQo+ID4gPiA+ID4KPiA+
Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPiBOaWNrCgpCZXN0IFJlZ2FyZHMsCk5pY2sKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
