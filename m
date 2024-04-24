Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vpZBVSPn8M1wGKT9Wv6iXlMmbcyJWyYQ/UMY4L7BbiU=; b=Bynhb/IscKse/QnLBmd7rBNZt6
	riQVvYYESqY5ZldtmRnAg9TU8vm/5vfzo6ShIhKbbHMNJ39U4g3rktByPhwc9cd3ukmj10Xhg6OE+
	oqBKnPpRR0Edm4RQTFZ2VdgY/M8+FNDbTE6NFeDwdt7piMVp3aodHLo6TtUg/AM+hwCvZuW0oG3nC
	PmAlI8EwnFcQn4OpsjfMXVJh8QlzuzcT0Ud8H/uKSwOZFxe0+UMH/+yK3KZ4Dhaf7dbA1NMhLXBpM
	u+dr3/wsltExrlwIaIRV6D6zx+n+B4hMP+eE6pmDqHyI9mEHifbKkWhGH7Yp2P5i9hHEyIz4TKYe5
	dhMmoDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rze4K-00000004bCa-1H6G;
	Wed, 24 Apr 2024 14:57:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rze4D-00000004bAT-1AC1
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 14:57:54 +0000
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7C5033FE52
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713970667;
	bh=5esocC9ZFW0Dfcow+sGknBU1wI/0vCj6NFX+zWkQdjU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WWch21RS3g/xt+hIJXV4p41PaJO75QtbqeQ1TqZ/kUAQCqiONqc4z/GZcSMCVaFzA
	 Aa2QbV3X8zgONxMVQmSEMIOBMLII0njmqjFAtPYERtFZ+lFa+5CHR4NU5ERTnJcdvE
	 8/F2atgXinywu+jGJHW83A7le3AuaBXe3rmWhZLB3rTRrRUKQTTHddOqjaRuXAYNGe
	 iM89x48WRqHIxmpq32BBAhE2hfS/AuEaEGydUU4B/LfzMlF2UAMkbV/MCnpaZennPJ
	 vu8dlK0kIeb2tdGDRZ4v0EEBzmHloc4M8hi0/Rw2YJ+HtfgXcM+aE28wz3lRGrDGdo
	 Uiu+j8Z54z8Hg==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6150e36ca0dso114861137b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 07:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970663; x=1714575463;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5esocC9ZFW0Dfcow+sGknBU1wI/0vCj6NFX+zWkQdjU=;
        b=dleNw3ohk7xeVroCAC7/EKYumUFg9iarXTMV6xqiisAOjAHa6Rk2hh+Zcm+LMdfUyx
         6v12umz8b9wTD6CQk5h3eoNB/A3OU9sObrCsTFdH/1bWo3BFwQx5d9evfFPQZRzsW+Uj
         Oidr4pytB9RCiyPOGhD5029LdKm5SrnWgbVhNUJ3gJfxp/oOqgV/fLO6GQVxyNxeOskY
         HtJdYOlMsbX4+AabT/r66jRtDqrU7zju0L1yzSo5AzDV+ucy3S7Vb76mxLJRXBe8KDaz
         ACVNXBKF4g+I9QvALgCsbiOVlq0OX2+FfhlZCdZx5GlTW8z9lw69JZnVB7IVLPUVpn7C
         l0dw==
X-Forwarded-Encrypted: i=1; AJvYcCV768nAaMO2IUWLjuwV2OAHvZWTq2B3cGzzFTqnLCMcOflP6XVJ0Qu4IyfeWAf8gO6tf6xXskMkuSzjz2V4ActoYWibxxVzitFSvoNtkyRy
X-Gm-Message-State: AOJu0YyJIKxF75q/2HZAIr2MuYgvf2UZ+cNBaDL4E54QFURgq2681lkJ
	6fP2a3l3qJVNim5D/WFbl9g/boG6CzmgnQ6+N+R6R4sBVx0b82G5cUZqXXAmnG2eUKaexx8FOKl
	f8L4YuDPlkZFQBLjDtokqdv59Gz2Bn9cemMK9gep0ermLCbaYAGyVHNgbQAcFXNHNhx1zwkr7fc
	Ck8mekRILiyIRrpqiYbkbueqepwjgKnG43m1LOwVWpEWt51R9ap9x9Xvii
X-Received: by 2002:a05:690c:3612:b0:609:ff22:1a88 with SMTP id ft18-20020a05690c361200b00609ff221a88mr3109061ywb.44.1713970663322;
        Wed, 24 Apr 2024 07:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLj6vN82/lNMO93VtWofH8pTU6lK+eyGAXCYtefLHp0CWoW2WPTI12S+Ss5a+rfru0ns+AgDrPBoEFC+mLT9w=
X-Received: by 2002:a05:690c:3612:b0:609:ff22:1a88 with SMTP id
 ft18-20020a05690c361200b00609ff221a88mr3109036ywb.44.1713970662973; Wed, 24
 Apr 2024 07:57:42 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 07:57:42 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <SH0PR01MB08410B2FCAE1D9AA754865BFF910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
 <20240424075856.145850-2-joshua.yeong@starfivetech.com> <CAJM55Z-C7XkFo4STk3rdLG4kvPfed-AfrHB1QJ-Tzt1LDoKw9w@mail.gmail.com>
 <SH0PR01MB0841F8C45091E4A08020ADF2F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9NAeRb_3ZBJksXt+4fJMdcYw55bfAs0EpSnM8VWBKQag@mail.gmail.com>
 <SH0PR01MB08415B9CDDFB1A4FAB0FC4A9F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z_G5EKSjHztCQ+gXDGwfpziZTE=HsHmwydJWB-uorMOqA@mail.gmail.com> <SH0PR01MB08410B2FCAE1D9AA754865BFF910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 07:57:42 -0700
Message-ID: <CAJM55Z-6vqSjL3GPT7GqC1k01zH8+zexSpcOFFUpuZELAQxARw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240424_075749_608101_18E59307 
X-CRM114-Status: GOOD (  29.88  )
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
aHVhIFllb25nIHdyb3RlOgo+ID4gPgo+ID4gPgo+ID4gPiBFbWlsIFJlbm5lciBCZXJ0aGluZyB3
cm90ZToKPiA+ID4gPiBKb3NodWEgWWVvbmcgd3JvdGU6Cj4gPiA+ID4gPiBFbWlsIFJlbm5lciBC
ZXJ0aGluZyB3cm90ZToKPiA+ID4gPiA+ID4gSm9zaHVhIFllb25nIHdyb3RlOgo+ID4gPiA+ID4g
PiA+IEFkZCBTdGFyRml2ZSBTdGFybGluayBjYWNoZSBtYW5hZ2VtZW50IGRyaXZlciBmb3IKPiA+
ID4gPiA+ID4gPiBKSDgxMDAgU29DLiBUaGlzIGRyaXZlciBlbmFibGVzIFJJU0MtViBub24tc3Rh
bmRhcmQgY2FjaGUKPiA+ID4gPiA+ID4gPiBvcGVyYXRpb24gb24KPiA+ID4gPiA+ID4gPiBKSDgx
MDAgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IFppY2JvbSBleHRlbnNpb24gaW5zdHJ1Y3Rpb25zLgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIFllb25nIDxq
b3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ID4gPiAgZHJpdmVycy9jYWNoZS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgICA5ICsrCj4g
PiA+ID4gPiA+ID4gIGRyaXZlcnMvY2FjaGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAg
NSArLQo+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2NhY2hlL3N0YXJmaXZlX3N0YXJsaW5rX2NhY2hl
LmMgfCAxMzUKPiA+ID4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+
ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkg
IGNyZWF0ZQo+ID4gPiA+ID4gPiA+IG1vZGUKPiA+ID4gPiA+ID4gPiAxMDA2NDQgZHJpdmVycy9j
YWNoZS9zdGFyZml2ZV9zdGFybGlua19jYWNoZS5jCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jYWNoZS9LY29uZmlnIGIvZHJpdmVycy9jYWNoZS9LY29u
ZmlnCj4gPiA+ID4gPiA+ID4gaW5kZXgKPiA+ID4gPiA+ID4gPiA5MzQ1Y2U0OTc2ZDcuLjkxODFj
ZDM5MWY1MyAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2NhY2hlL0tjb25maWcK
PiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2NhY2hlL0tjb25maWcKPiA+ID4gPiA+ID4gPiBA
QCAtMTQsNCArMTQsMTMgQEAgY29uZmlnIFNJRklWRV9DQ0FDSEUKPiA+ID4gPiA+ID4gPiAgCWhl
bHAKPiA+ID4gPiA+ID4gPiAgCSAgU3VwcG9ydCBmb3IgdGhlIGNvbXBvc2FibGUgY2FjaGUgY29u
dHJvbGxlciBvbiBTaUZpdmUKPiA+IHBsYXRmb3Jtcy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+ICtjb25maWcgU1RBUkZJVkVfU1RBUkxJTktfQ0FDSEUKPiA+ID4gPiA+ID4gPiArCWJvb2wg
IlN0YXJGaXZlIFN0YXJMaW5rIENhY2hlIGNvbnRyb2xsZXIiCj4gPiA+ID4gPiA+ID4gKwlkZXBl
bmRzIG9uIFJJU0NWCj4gPiA+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIEFSQ0hfU1RBUkZJVkUKPiA+
ID4gPiA+ID4gPiArCXNlbGVjdCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiA+ID4gPiA+ID4gPiAr
CXNlbGVjdCBSSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPiA+ID4gPiA+ID4gPiArCWhlbHAK
PiA+ID4gPiA+ID4gPiArCSAgU3VwcG9ydCBmb3IgdGhlIFN0YXJMaW5rIGNhY2hlIGNvbnRyb2xs
ZXIgb24gU3RhckZpdmUKPiA+IHBsYXRmb3Jtcy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhp
cyBpcyBhIGJpdCBtaXNsZWFkaW5nLiBUaGUgSkg3MXgwcyBkb24ndCBoYXZlIHRoaXMuIEl0J3Mg
b25seQo+ID4gPiA+ID4gPiBvbiB0aGUgSkg4MTAwIHNvIGZhciwgYW5kIGhvcGVmdWxseSBsYXRl
ciBTb0NzIHdpbGwganVzdAo+ID4gPiA+ID4gPiBpbXBsZW1lbnQgUklTQy1WCj4gPiA+ID4gc3Rh
bmRhcmRzIGZvciB0aGlzLgo+ID4gPiA+ID4gPiBTbyBtYXliZSBzb21ldGhpbmcgbGlrZQo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiAiU3VwcG9ydCBmb3IgdGhlIFN0YXJMaW5rIGNhY2hlIGNvbnRy
b2xsZXIgb24gdGhlIFN0YXJGaXZlIEpIODEwMCBTb0MuIgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEhpIEVtaWwsCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIFN0YXJMaW5rLTUwMCBj
YWNoZSBjb250cm9sbGVyIGlzIG5vdCBkZXNpZ25lZCBleGNsdXNpdmVseSBmb3IgSkg4MTAwCj4g
PiBTb0MuCj4gPiA+ID4gPiBXaGlsZSBpdCBpcyB0cnVlIHRoYXQgaXQgY3VycmVudGx5IGV4aXN0
cyBvbiB0aGUgU3RhckZpdmUKPiA+ID4gPiA+IHBsYXRmb3JtLCBDUFUvU29DIHRoYXQgZG9lcyBu
b3QgY29tZSB3aXRoIFppY2JvbSBleHRlbnNpb25zCj4gPiA+ID4gPiBzdXBwb3J0ZWQgd291bGQg
bmVlZCB0byByZWx5IG9uIHRoaXMgY2FjaGUgZHJpdmUgdG8gZG8gY2FjaGUKPiA+ID4gPiA+IG1h
bmFnZW1lbnQgb3BlcmF0aW9ucy4gSSB0aGluayB3ZSBkb27igJl0IG5lZWQgdG8gbWVudGlvbmVk
ICdKSDgxMDAKPiA+IFNvQycgaGVyZS4KPiA+ID4gPgo+ID4gPiA+IFdhaXQsIGluIHRoZSBwcmV2
aW91cyBtYWlsIHlvdSBzYWlkIHRoYXQgZnV0dXJlIGRlc2lnbnMgd2lsbAo+ID4gPiA+IGltcGxl
bWVudCBaaWNib20gYW5kIG5vdCBuZWVkIHRoaXMgd29yay1hcm91bmQsIGJ1dCBoZXJlIHlvdSdy
ZQo+ID4gPiA+IHRhbGtpbmcgYWJvdXQgb3RoZXIgU29DcyB0aGF0IGRvIG5lZWQgaXQuIFNvIHdo
aWNoIGlzIGl0Pwo+ID4gPgo+ID4gPiBJZiB5b3UgdmlzaXQgdGhlIGNvbXBhbnkgd2Vic2l0ZSBh
bmQgbG9vayBmb3IgU3RhckxpbmstNTAwLCB5b3Ugd2lsbAo+ID4gPiBmaW5kIHRoYXQgaXQgaXMg
YSBzdGFuZGFsb25lIElQIHRoYXQgdGhlIGNvbXBhbnkgaXMgc2VsbGluZyBhcyBhbgo+ID4gPiBp
bnRlcmNvbm5lY3QuIEFueW9uZSB3aG8gaW50ZWdyYXRlcyBTdGFyTGluayB3aXRob3V0IFppY2Jv
bSBleHRlbnNpb25zCj4gPiA+IG1heSB1dGlsaXplIHRoZSBjYWNoZSBtYW5hZ2VtZW50IG9wZXJh
dGlvbiBmcm9tIHRoaXMgSVAuCj4gPgo+ID4gU28gdGhlbiB0aGUgIm9uIFN0YXJGaXZlIHBsYXRm
b3JtcyIgcGFydCBpcyB3cm9uZz8gT3Igd2lsbCB0aGlzIGFsd2F5cyBnbwo+ID4gdG9nZXRoZXIg
d2l0aCB0aGUgRHViaGUgY29yZXM/Cj4KPiBJdCB3b3VsZCBiZSAnb24gU3RhckZpdmUgcGxhdGZv
cm0nIHdpdGhvdXQgJ0pIODEwMCBTb0MnIHRoYXQgeW91IHN1Z2dlc3RlZC4KPiBTdGFyRml2ZSdz
IG5ld2VyIGNvcmVzIHRoYXQgd2lsbCBoYXZlIFppY2JvbSBleHRlbnNpb25zIHN1cHBvcnRlZC4g
VGhvc2UKPiBDUFUgY29yZSB3aWxsIG5vdCBuZWVkIHRvIGhhdmUgdGhpcyBjYWNoZSBjb250cm9s
bGVyIGVuYWJsZWQuCgpObywgd2hhdCBJIG1lYW50IHdhcyB0aGF0IGlmIHlvdSdyZSBzZWxsaW5n
IHRoZSAiU3RhckxpbmstNTAwIiBJUCB0byBvdGhlciBTb0MKbWFudWZhY3R1cm9ycyB0aGVuIGl0
IHdpbGwgbm90IGJlIHJlc3RyaWN0ZWQgdG8gU3RhckZpdmUgcGxhdGZvcm1zLiBTbyB0aGVuCiJT
dXBwb3J0IGZvciB0aGUgU3RhckxpbmsgY2FjaGUgY29udHJvbGxlciBfb24gU3RhckZpdmUgcGxh
dGZvcm1zXyIgaXMgbm8gbG9uZ2VyCnRydWUsIHJpZ2h0PwoKL0VtaWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
