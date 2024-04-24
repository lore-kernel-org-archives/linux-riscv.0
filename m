Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4D6C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zmwXqX/cNotdZ9f749k7eNY4FvzaGwz96nV/T0csdZU=; b=shkTXZl7MBLGtTmc7cmP0IMt97
	GJdjCrKon9ANzc2K5y3llgbtM70PJakJgmG0AaOEaxn0nyHQY/eyyMz2YLdf/kK7WRiE6wuHjXjF3
	uiUCixgwDKsILC8nIFsYlpYJVZRnee7Qx8cO4soLLG/PZI1F4A+FGj7PQE0s0cyiwY99PRhiWC8Ap
	ucIcTxMp+U5K4wmuSyudaAA8U94A/V8iVYKOauQ9hODhuffsKo/DL8FvzeZfn06Sf8ijIH9qaM9MA
	2SrYUR0GWfnEhX7c7D6Rp7yYMz4Yysht35OWVA8MxbqpmTsqJsZ1jK5k0JEwLtoPSspGdgnUAe395
	hrU8WHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdQo-00000004RuZ-1ugx;
	Wed, 24 Apr 2024 14:17:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdQk-00000004Rsw-2KpL
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 14:17:04 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE1443FB6C
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713968213;
	bh=kJNCU9zhbbaFpDd41XCS9Fc/M34kxsFFT1gbausG2gE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TuxPvtIO0brHqwHupenTuDMEAdt6TDbxxeVM6bIKFTvd5cyxesUJysSSL64RP/TuC
	 DU5O7fMV5kwplidw7FwUzwo7k9JGlBQU8ojizqr/+y9A87XWq+aNZEZMftLNRurNI/
	 sKxaeTB9xS8B7783lhxvwg2kSC3/8De3srtJVWBTsXqq+910F1/aniu95W17xKMEx/
	 t/BdlFYF0OrkjpHaJzCYErrfYKuZYiDjQEUA0/uRzTL9ZOuogpF7Tm9Xw+uoqi03vG
	 q55EIzK2MDAgeUt8SFMCUCwRamVQke19RbGf6aKIDE01GcYSn+hpdRoeh4iU14saHu
	 6MlvvKQpiTvvA==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3c700dc69a9so8402334b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 07:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713968212; x=1714573012;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJNCU9zhbbaFpDd41XCS9Fc/M34kxsFFT1gbausG2gE=;
        b=g3kwnmRvQIoAc9F0rpkgdI0Alg4dXM1uOOrno+npFjO0Z9j83MdaM+SYWljtV4kT0c
         mdfy9VsfmzKkscgZ9LohbEufOUSx+7dUoVlXOiemB8dRMJlwdD82Vmim2t2LiG+8paHU
         fqEbPr1wSRXtwXkDy/TKzG6RH9z3zT/88HBwOe+vC8Gq4kGF2/D47z8ct+QZ89wqqcZm
         wE3OcF5SM5IJbvS0aolyElcAdjPAJOm3KaX+7zAHeS6IOM3ejYZ/b0veyYl6GtgA+9RP
         nuFQO1kzWPQqgQ11pPZckDZxIPjgOYPZWmX2fIdUct2MiPsjLA1oD/Un1noWY7ULtaDp
         kEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYpjh2jFuiY3SV5cXQUJM5EyXmYz16w4xUwsoQWU9F4eqacC4dghunRThMwZjzLUMd2IcIhNgk2m8HkYc0m4ciUC6rqX/Q6eM3/2Mox9AV
X-Gm-Message-State: AOJu0YxB/mOD1GegisQWMGBoiqVaKiILZFTXKb9n+oaOL18or0WQeFvI
	Z18X42LqxuL4IcEVCWblXY4vMxKIgDLAk9SBzZXe+a4SfRTBz4pa4MQKYUVSo/K8vgUPqg45Ogw
	N4GNCboa0pZ8Gax0462QQHxmCcNk30XFD82LVu13Q7K2LJGLtwdQeQ6Bt9FiasloBDgxPyfOzgl
	UtzFZ0tsL56w7sP4uwXPgM517wxi90AjrtawCvWy9xAklD7BqpZstjqsiV
X-Received: by 2002:a05:6808:1710:b0:3c3:ddef:cbfb with SMTP id bc16-20020a056808171000b003c3ddefcbfbmr2761522oib.44.1713968211988;
        Wed, 24 Apr 2024 07:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMI1QSebm1GMJUjaFXp6rpbt/+pc9Dt550W0+5oifIVAEgjReyIZIP4B46bcuH+K6tI2YRKNhPnJnltpk6+0=
X-Received: by 2002:a05:6808:1710:b0:3c3:ddef:cbfb with SMTP id
 bc16-20020a056808171000b003c3ddefcbfbmr2761500oib.44.1713968211677; Wed, 24
 Apr 2024 07:16:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 07:16:51 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <SH0PR01MB0841F8C45091E4A08020ADF2F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
 <20240424075856.145850-2-joshua.yeong@starfivetech.com> <CAJM55Z-C7XkFo4STk3rdLG4kvPfed-AfrHB1QJ-Tzt1LDoKw9w@mail.gmail.com>
 <SH0PR01MB0841F8C45091E4A08020ADF2F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 07:16:51 -0700
Message-ID: <CAJM55Z9NAeRb_3ZBJksXt+4fJMdcYw55bfAs0EpSnM8VWBKQag@mail.gmail.com>
Subject: RE: [PATCH v3 1/2] cache: Add StarFive StarLink cache management for
 StarFive JH8100
To: Joshua Yeong <joshua.yeong@starfivetech.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"conor@kernel.org" <conor@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_071703_078251_16E7394E 
X-CRM114-Status: GOOD (  19.33  )
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

Sm9zaHVhIFllb25nIHdyb3RlOgo+IEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+ID4gSm9z
aHVhIFllb25nIHdyb3RlOgo+ID4gPiBBZGQgU3RhckZpdmUgU3RhcmxpbmsgY2FjaGUgbWFuYWdl
bWVudCBkcml2ZXIgZm9yCj4gPiA+IEpIODEwMCBTb0MuIFRoaXMgZHJpdmVyIGVuYWJsZXMgUklT
Qy1WIG5vbi1zdGFuZGFyZCBjYWNoZSBvcGVyYXRpb24gb24KPiA+ID4gSkg4MTAwIHRoYXQgZG9l
cyBub3Qgc3VwcG9ydCBaaWNib20gZXh0ZW5zaW9uIGluc3RydWN0aW9ucy4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogSm9zaHVhIFllb25nIDxqb3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2NhY2hlL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgfCAgIDkgKysKPiA+ID4gIGRyaXZlcnMvY2FjaGUvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICB8ICAgNSArLQo+ID4gPiAgZHJpdmVycy9jYWNoZS9zdGFyZml2ZV9zdGFybGlua19jYWNoZS5j
IHwgMTM1Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlCj4gPiA+
IDEwMDY0NCBkcml2ZXJzL2NhY2hlL3N0YXJmaXZlX3N0YXJsaW5rX2NhY2hlLmMKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2FjaGUvS2NvbmZpZyBiL2RyaXZlcnMvY2FjaGUvS2Nv
bmZpZyBpbmRleAo+ID4gPiA5MzQ1Y2U0OTc2ZDcuLjkxODFjZDM5MWY1MyAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9jYWNoZS9LY29uZmlnCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2FjaGUvS2Nv
bmZpZwo+ID4gPiBAQCAtMTQsNCArMTQsMTMgQEAgY29uZmlnIFNJRklWRV9DQ0FDSEUKPiA+ID4g
IAloZWxwCj4gPiA+ICAJICBTdXBwb3J0IGZvciB0aGUgY29tcG9zYWJsZSBjYWNoZSBjb250cm9s
bGVyIG9uIFNpRml2ZSBwbGF0Zm9ybXMuCj4gPiA+Cj4gPiA+ICtjb25maWcgU1RBUkZJVkVfU1RB
UkxJTktfQ0FDSEUKPiA+ID4gKwlib29sICJTdGFyRml2ZSBTdGFyTGluayBDYWNoZSBjb250cm9s
bGVyIgo+ID4gPiArCWRlcGVuZHMgb24gUklTQ1YKPiA+ID4gKwlkZXBlbmRzIG9uIEFSQ0hfU1RB
UkZJVkUKPiA+ID4gKwlzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ICsJc2VsZWN0
IFJJU0NWX05PTlNUQU5EQVJEX0NBQ0hFX09QUwo+ID4gPiArCWhlbHAKPiA+ID4gKwkgIFN1cHBv
cnQgZm9yIHRoZSBTdGFyTGluayBjYWNoZSBjb250cm9sbGVyIG9uIFN0YXJGaXZlIHBsYXRmb3Jt
cy4KPiA+Cj4gPiBUaGlzIGlzIGEgYml0IG1pc2xlYWRpbmcuIFRoZSBKSDcxeDBzIGRvbid0IGhh
dmUgdGhpcy4gSXQncyBvbmx5IG9uIHRoZSBKSDgxMDAgc28KPiA+IGZhciwgYW5kIGhvcGVmdWxs
eSBsYXRlciBTb0NzIHdpbGwganVzdCBpbXBsZW1lbnQgUklTQy1WIHN0YW5kYXJkcyBmb3IgdGhp
cy4KPiA+IFNvIG1heWJlIHNvbWV0aGluZyBsaWtlCj4gPgo+ID4gIlN1cHBvcnQgZm9yIHRoZSBT
dGFyTGluayBjYWNoZSBjb250cm9sbGVyIG9uIHRoZSBTdGFyRml2ZSBKSDgxMDAgU29DLiIKPiA+
Cj4KPiBIaSBFbWlsLAo+Cj4gVGhlIFN0YXJMaW5rLTUwMCBjYWNoZSBjb250cm9sbGVyIGlzIG5v
dCBkZXNpZ25lZCBleGNsdXNpdmVseSBmb3IgSkg4MTAwIFNvQy4KPiBXaGlsZSBpdCBpcyB0cnVl
IHRoYXQgaXQgY3VycmVudGx5IGV4aXN0cyBvbiB0aGUgU3RhckZpdmUgcGxhdGZvcm0sIENQVS9T
b0MKPiB0aGF0IGRvZXMgbm90IGNvbWUgd2l0aCBaaWNib20gZXh0ZW5zaW9ucyBzdXBwb3J0ZWQg
d291bGQgbmVlZCB0byByZWx5Cj4gb24gdGhpcyBjYWNoZSBkcml2ZSB0byBkbyBjYWNoZSBtYW5h
Z2VtZW50IG9wZXJhdGlvbnMuIEkgdGhpbmsgd2UgZG9u4oCZdCBuZWVkCj4gdG8gbWVudGlvbmVk
ICdKSDgxMDAgU29DJyBoZXJlLgoKV2FpdCwgaW4gdGhlIHByZXZpb3VzIG1haWwgeW91IHNhaWQg
dGhhdCBmdXR1cmUgZGVzaWducyB3aWxsIGltcGxlbWVudCBaaWNib20KYW5kIG5vdCBuZWVkIHRo
aXMgd29yay1hcm91bmQsIGJ1dCBoZXJlIHlvdSdyZSB0YWxraW5nIGFib3V0IG90aGVyIFNvQ3Mg
dGhhdApkbyBuZWVkIGl0LiBTbyB3aGljaCBpcyBpdD8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
