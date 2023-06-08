Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E99AC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 20:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szbgF6J+dKAnD1RioJde/UhFP8MVplhH37O0u20bDiY=; b=BmPrF8CohMojAV
	SOmbaYonzwSbD1AtixuDZ03LP6JOk+L+aDmWtd2YVrFV/76t31abxnGAGRGQ2D25jCBeS9t64K7Wd
	TdK7B02VzN4DuzKzPzi1leeRfTePC6PjLw5b5+FWl9H+KGwC2YSWsfkoherKvLQzwevgIpWsr0qwn
	ZawqexB1DWJp3UH46dU6KAcqbn7UxXUVFMcXDRvJfzlCirS2Loj1lKrlc/NRO581ONNU4zKsN2RI+
	ub0VHiE7/JwWxPYcX2OrROUQDak9QjmUqngVovI4xgD3yPnntsOoBsVYbBislMbKU2iI7CNP9oHi2
	JwA+gjxt05LR9KdXEpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Lsm-00AU2G-0I;
	Thu, 08 Jun 2023 20:05:20 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Lsi-00AU0M-1o
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 20:05:17 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f9b7de94e7so287371cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686254712; x=1688846712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIV4LjcD36Raxv3M+Ag2LHAyDiN4jPlJxEgpmm5HAXE=;
        b=ryhL8UJia9g5S9RPy+hrb7vPPXgT9o8MGy4TCS9EOIibHpqUl2uXkfajgT51A5hk7b
         EujLBWke8ypBQlowkALAU04JjJuWEzsePXVfFMFlPxdzbTA3XKIammlwin6Hbl1yZoys
         zwrBxzzDu+QknfG0UbOV1BCdGegs8r2/66x1/vGXN2RglVQIomqGCqKVMOHKt2E7u6z1
         cFme/LVWAbnG/29F92z/pDPEOC+K7uUX6pjMBVpBC8BBL3QBNV1d9ViU7GhDcUAOMWom
         SmPnZ6L94/O7UuUJq3xNB1pizW4/wYbGHBDINxdO/eOmM6bu+sactlsQmtGPTtI58p5g
         Q+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686254712; x=1688846712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIV4LjcD36Raxv3M+Ag2LHAyDiN4jPlJxEgpmm5HAXE=;
        b=P7SUWXKYbQpeYYaGADbWmYUMwaoUHGI2GU4lKsC1O2VSGF03ZZ3kN+XowoPIMT6f0n
         7w69TyKHCU9gqncdeIKxdnzdmTNOEcWtHdhF9GHlnVd93Fk2mhQDaat+4PBRISF2+o8C
         rFwKWUKj9sMVqywKNKAfUGWK4WdQd1ibhStet4q0LCuRdU3bI12YDxXV1jotgq4GXRbw
         8HON0v+18EqEc6adT4pVSOc4e6LRsO9t24NYAwa1MR3F1FBSueFLf1wAtXYK9mok4yms
         +nwMCPcjrBA46z7YMJ7i1of3GolqqC9JJl2FyQRRQlqAYokoxa1VDZ3jhGEb+7/ilSqj
         XXIg==
X-Gm-Message-State: AC+VfDwnZXs8cuS4s8GX3dIUX40l9P82/uI9Gh60v5HPfw0/uSPmL5mX
	WQlHzq8wqMI6/qE9Jo3F227VT54FHH364MS0mxMutA==
X-Google-Smtp-Source: ACHHUZ4CIbONl7q3IxgWipvcRK0WIl5R4yl0ilwzDhwV1nhu8O2kmYKeF+sJyJtKS8kZQQ8bnUw8T5mHJeT9LNiKz7A=
X-Received: by 2002:ac8:4e85:0:b0:3f3:75c2:7466 with SMTP id
 5-20020ac84e85000000b003f375c27466mr170826qtp.8.1686254711773; Thu, 08 Jun
 2023 13:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-3-apatel@ventanamicro.com> <20230608182828.GA3183987-robh@kernel.org>
In-Reply-To: <20230608182828.GA3183987-robh@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 8 Jun 2023 13:04:35 -0700
Message-ID: <CAGETcx_4OH=EmSUL2-rwKa=1uoOj+AH_xn4PoPsc0kt_aU0WOg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the
 interrupt controller DT nodes
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_130516_604839_4D5FC1CD 
X-CRM114-Status: GOOD (  25.52  )
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

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCAxMToyOOKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gK1NhcmF2YW5hCj4KPiBPbiBNb24sIE1heSAwOCwgMjAyMyBhdCAw
Nzo1ODozM1BNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gVGhlIFJJU0MtViBBUExJQyBp
bnRlcnJ1cHQgY29udHJvbGxlciBkcml2ZXIgaXMgYSByZWd1bGFyIHBsYXRmb3JtCj4gPiBkcml2
ZXIgc28gd2UgbmVlZCB0byBlbnN1cmUgdGhhdCBpdCBpcyBwcm9iZWQgYXMgc29vbiBhcyBwb3Nz
aWJsZS4KPiA+IFRvIGFjaGlldmUgdGhpcywgd2UgbWFyayB0aGUgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgZGV2aWNlIG5vZGVzIHdpdGgKPiA+IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIChqdXN0IGxp
a2UgY29uc29sZSBEVCBub2RlKS4KPiA+Cj4gPiBGaXhlczogOGY0ODZjYWIyNjNjICgiZHJpdmVy
IGNvcmU6IGZ3X2Rldmxpbms6IEFsbG93IGZpcm13YXJlIHRvIG1hcmsgZGV2aWNlcyBhcyBiZXN0
IGVmZm9ydCIpCj4KPiBJdCBpcyBnb29kIHByYWN0aWNlIHRvIENjIHRoZSBjb21taXQgYXV0aG9y
IG9mIHdoYXQgeW91IGFyZSBmaXhpbmcuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9vZi9pcnEuYyB8
IDEwICsrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL2lycS5jIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4g
aW5kZXggMTc0OTAwMDcyYzE4Li45NGUxZDkyNDVjZmYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L29mL2lycS5jCj4gPiArKysgYi9kcml2ZXJzL29mL2lycS5jCj4gPiBAQCAtNTM1LDYgKzUzNSwx
NiBAQCB2b2lkIF9faW5pdCBvZl9pcnFfaW5pdChjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpt
YXRjaGVzKQo+ID4gICAgICAgSU5JVF9MSVNUX0hFQUQoJmludGNfZGVzY19saXN0KTsKPiA+ICAg
ICAgIElOSVRfTElTVF9IRUFEKCZpbnRjX3BhcmVudF9saXN0KTsKPiA+Cj4gPiArICAgICAvKgo+
ID4gKyAgICAgICogV2UgbmVlZCBpbnRlcnJ1cHQgY29udHJvbGxlciBwbGF0Zm9ybSBkcml2ZXJz
IHRvIHdvcmsgYXMgc29vbgo+Cj4gSWYgaXQncyBwbGF0Zm9ybSBkcml2ZXJzL2RldmljZXMgeW91
IGNhcmUgYWJvdXQsIHRoZW4gcGVyaGFwcyB0aGlzCj4gc2hvdWxkIGJlIGRvbmUgd2hlbiBwbGF0
Zm9ybSBkZXZpY2VzIGFyZSBjcmVhdGVkLgo+Cj4gPiArICAgICAgKiBhcyBwb3NzaWJsZSBzbyBt
YXJrIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBkZXZpY2Ugbm9kZXMgd2l0aAo+ID4gKyAgICAg
ICogRldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQgc28gdGhhdCBmd19kZWxpbmsga25vd3Mgbm90IHRv
IGRlbGF5Cj4gPiArICAgICAgKiB0aGUgcHJvYmUgb2YgdGhlIGludGVycnVwdCBjb250cm9sbGVy
IGRldmljZSBmb3Igc3VwcGxpZXJzCj4gPiArICAgICAgKiB3aXRob3V0IGRyaXZlcnMuCj4gPiAr
ICAgICAgKi8KPiA+ICsgICAgIGZvcl9lYWNoX25vZGVfd2l0aF9wcm9wZXJ0eShucCwgImludGVy
cnVwdC1jb250cm9sbGVyIikKPgo+IFRoaXMgZnVuY3Rpb24gb25seSBvcGVyYXRlcyBvbiBub2Rl
cyBtYXRjaGluZyAnbWF0Y2hlcycsIGJ1dCB0aGlzCj4gb3BlcmF0ZXMgb24gZXZlcnl0aGluZy4K
Pgo+IEl0IGRvZXMgbWFrZSBzZW5zZSB0aGF0IGlmIHdlIGluaXQgYW4gaW50ZXJydXB0IGNvbnRy
b2xsZXIgaGVyZSwgdGhlbiB3ZQo+IHdpbGwgc3VyZWx5IHdhbnQgdG8gcHJvYmUgaXRzIGRyaXZl
ciBsYXRlciBvbi4gU28gbWF5YmUganVzdCBtb3ZlCj4gc2V0dGluZyBGV05PREVfRkxBR19CRVNU
X0VGRk9SVCB3aXRoaW4KPiBmb3JfZWFjaF9tYXRjaGluZ19ub2RlX2FuZF9tYXRjaCgpIGJlbG93
Lgo+Cj4gPiArICAgICAgICAgICAgIG5wLT5md25vZGUuZmxhZ3MgfD0gRldOT0RFX0ZMQUdfQkVT
VF9FRkZPUlQ7Cj4gPiArCgpEZWZpbml0ZSBOYWNrLiBZb3UgYXJlIHByZXR0eSBtdWNoIGRpc2Fi
bGluZyBmd19kZXZsaW5rIGZvciBhbGwKaW50ZXJydXB0IGNvbnRyb2xsZXJzLiBUaGVyZSBhcmUg
cGxlbnR5IG9mIGV4YW1wbGVzIG9mIHRoZSBJUlEgZHJpdmVycwpiZWluZyBuZWVkZWQgdmVyeSBl
YXJseSBvbiBhbmQgc3RpbGwgcHJvYmluZyBwcm9wZXJseSB3aXRob3V0IHRoZSBuZWVkCmZvciB0
aGlzIGZsYWcuIFBsZWFzZSBmaXggeW91ciBkcml2ZXIvRFQuCgotU2FyYXZhbmEKCgo+ID4gICAg
ICAgZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZV9hbmRfbWF0Y2gobnAsIG1hdGNoZXMsICZtYXRjaCkg
ewo+ID4gICAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImludGVy
cnVwdC1jb250cm9sbGVyIikgfHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFv
Zl9kZXZpY2VfaXNfYXZhaWxhYmxlKG5wKSkKPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
