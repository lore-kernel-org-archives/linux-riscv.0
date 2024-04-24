Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFF4C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mFhFm9fDGSHi9utqjFPLiJXjsB0tQi0wSlZ1qVEPcHw=; b=MmmpGFoM/mot+J2tiSJSeTRgWx
	m9f3Pb2usZaDSCM1ZCJrEkno66lZsQ1W4EzzFUrwtrP3yxKIczKmtvJRP87A1Pw9m4v17zt/FlZmi
	WtfMs0tEm8Qj2d6lMTxAR05yMDTxzNbDtfPkY48+cPN7jLWWwv6glVmS0VBXB35C19TXYTfr6tvPT
	7YF/OrUY77moUp4YcPv1kW2NyfIQMGmcyjTfX1T92NV7JuT6pkYu8lWzss14o+O4DjSUsZucpuoSK
	z9brZMqklU3GTHmXkT321yNYn7Mdkt2ucN4VCYT7Vzhr6X2KB1zNH955IQVeynoPzbC4/YhmSMczv
	ut/6NYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdrM-00000004XaX-1XI8;
	Wed, 24 Apr 2024 14:44:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzdrF-00000004XXZ-2E22
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 14:44:27 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2C69E3FB77
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 14:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713969859;
	bh=cDX/Ta7sZiIBn1XBmkDtAtlryH2vK9PZZdp/V3uN0rM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HR7/TzOMqAItlCvAFhWa4AG1DFo15ykSiDYiVzH3sIbL8XWuAMBKJ3Olj7Ta9YxIO
	 mYwXlxf2Q9YxOVQ3EaO8NCyuPsl3cScvpuhmyyrja4Fzed1/qfXJiDXfy/J5L5fFT+
	 FM0ki+/45j+0AgjOErJQXqQDJvu43ziAzmYM8U6s7yD+TbpXDSvr7VHM85Jw2GEX+F
	 Y8cLGlRD/gK+B4gwCSs8OTzHXjkeJu1BxgWV+FO6dWbTAE0l2nzkSAkV7DQl8oC1V7
	 5z2fYFGycG6KN+zOCoZ5GonUpukzXqqO6++6umMX2BPJm49YdDx6jAgY81kJlk+17v
	 eQsE/xkD9m6aw==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-61b2abd30f9so113466957b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969858; x=1714574658;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDX/Ta7sZiIBn1XBmkDtAtlryH2vK9PZZdp/V3uN0rM=;
        b=dPs6k/JUl1S8iri5hCwyFkp1ViIRsJxam9aJm480lWyRj1vYRPQ5j5pzHg/B9buGif
         KNClGQsTeEysOc+E6QlTf/A8sJWCodjIdg8aiOt8j6+XptkZa9sY7io+HJ2V/c9/1i8P
         uMRltZLwax7u7DmsZ5b7FI6mUVvBchw8kvawjGhrq4HSh6moEZsYt5tqTBdtizDJjPB/
         diesVmDM4u+vMqh7LOQNm9jk/JVjtAn43ExGgD7wgz/3YOQIuhXSDicICplK4HWxRjyO
         auyHeXwYN8ipxegN6dEaLqbOCH033tIzHGwpc9Y2X2a3Za47Y77dFsz1bQWNnMV0PbLd
         qCMg==
X-Forwarded-Encrypted: i=1; AJvYcCURUZI7t9IfklUkyajb/xbr2bTLrMrdUUzXLNWDF9g9Z4qlCA44U8qncWPNZuosn02fiP2qWS3C02wYrUSM2fcLL32WEMYJZrykIeOlzdXE
X-Gm-Message-State: AOJu0Yx0AkmiCqZBik9QJRpjCsql4B/UETWQ6fV4TMEPWjpzXcdnr5dq
	Wbb2VBRKzwNvsiryLiGJ09mxRtykO2FDrlAfnpAZLV4LX1LNG+t9QmNUVa1FWjLK03Mble/OtiE
	DHotsFdzBnznrPreAEc+eZnN5Jb6lPuRG6WozBUcfxB3+AqfII8lXO+W5/eqmUBYtYnyGzc01+E
	pOYdIUZo+JizFZY4Gkf8vnvJIBm0dovImf+v3IVs+wuXLUyyrZ84hyDl5U
X-Received: by 2002:a05:690c:7484:b0:61a:ae0a:1f4d with SMTP id jv4-20020a05690c748400b0061aae0a1f4dmr2670992ywb.17.1713969857841;
        Wed, 24 Apr 2024 07:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAnkvq38wN8yqT3TvahJf1BBokL9ppAftSGKph8yTZ41xJ8L68lNa9+ahDLaDOVmyJ5hmuy3djep2ZQx+2DTg=
X-Received: by 2002:a05:690c:7484:b0:61a:ae0a:1f4d with SMTP id
 jv4-20020a05690c748400b0061aae0a1f4dmr2670968ywb.17.1713969857512; Wed, 24
 Apr 2024 07:44:17 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 07:44:16 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <SH0PR01MB08415B9CDDFB1A4FAB0FC4A9F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
 <20240424075856.145850-2-joshua.yeong@starfivetech.com> <CAJM55Z-C7XkFo4STk3rdLG4kvPfed-AfrHB1QJ-Tzt1LDoKw9w@mail.gmail.com>
 <SH0PR01MB0841F8C45091E4A08020ADF2F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9NAeRb_3ZBJksXt+4fJMdcYw55bfAs0EpSnM8VWBKQag@mail.gmail.com> <SH0PR01MB08415B9CDDFB1A4FAB0FC4A9F910A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 07:44:16 -0700
Message-ID: <CAJM55Z_G5EKSjHztCQ+gXDGwfpziZTE=HsHmwydJWB-uorMOqA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240424_074425_857421_9C92298F 
X-CRM114-Status: GOOD (  27.29  )
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

Sm9zaHVhIFllb25nIHdyb3RlOgo+Cj4KPiBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+
IEpvc2h1YSBZZW9uZyB3cm90ZToKPiA+ID4gRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4g
PiA+ID4gSm9zaHVhIFllb25nIHdyb3RlOgo+ID4gPiA+ID4gQWRkIFN0YXJGaXZlIFN0YXJsaW5r
IGNhY2hlIG1hbmFnZW1lbnQgZHJpdmVyIGZvcgo+ID4gPiA+ID4gSkg4MTAwIFNvQy4gVGhpcyBk
cml2ZXIgZW5hYmxlcyBSSVNDLVYgbm9uLXN0YW5kYXJkIGNhY2hlCj4gPiA+ID4gPiBvcGVyYXRp
b24gb24KPiA+ID4gPiA+IEpIODEwMCB0aGF0IGRvZXMgbm90IHN1cHBvcnQgWmljYm9tIGV4dGVu
c2lvbiBpbnN0cnVjdGlvbnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9z
aHVhIFllb25nIDxqb3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+ID4gPiA+IC0tLQo+
ID4gPiA+ID4gIGRyaXZlcnMvY2FjaGUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgOSAr
Kwo+ID4gPiA+ID4gIGRyaXZlcnMvY2FjaGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAg
NSArLQo+ID4gPiA+ID4gIGRyaXZlcnMvY2FjaGUvc3RhcmZpdmVfc3RhcmxpbmtfY2FjaGUuYyB8
IDEzNQo+ID4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2Rl
Cj4gPiA+ID4gPiAxMDA2NDQgZHJpdmVycy9jYWNoZS9zdGFyZml2ZV9zdGFybGlua19jYWNoZS5j
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2FjaGUvS2NvbmZpZyBi
L2RyaXZlcnMvY2FjaGUvS2NvbmZpZyBpbmRleAo+ID4gPiA+ID4gOTM0NWNlNDk3NmQ3Li45MTgx
Y2QzOTFmNTMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2NhY2hlL0tjb25maWcKPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvY2FjaGUvS2NvbmZpZwo+ID4gPiA+ID4gQEAgLTE0LDQgKzE0
LDEzIEBAIGNvbmZpZyBTSUZJVkVfQ0NBQ0hFCj4gPiA+ID4gPiAgCWhlbHAKPiA+ID4gPiA+ICAJ
ICBTdXBwb3J0IGZvciB0aGUgY29tcG9zYWJsZSBjYWNoZSBjb250cm9sbGVyIG9uIFNpRml2ZSBw
bGF0Zm9ybXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gK2NvbmZpZyBTVEFSRklWRV9TVEFSTElOS19D
QUNIRQo+ID4gPiA+ID4gKwlib29sICJTdGFyRml2ZSBTdGFyTGluayBDYWNoZSBjb250cm9sbGVy
Igo+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIFJJU0NWCj4gPiA+ID4gPiArCWRlcGVuZHMgb24gQVJD
SF9TVEFSRklWRQo+ID4gPiA+ID4gKwlzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+
ID4gPiArCXNlbGVjdCBSSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPiA+ID4gPiA+ICsJaGVs
cAo+ID4gPiA+ID4gKwkgIFN1cHBvcnQgZm9yIHRoZSBTdGFyTGluayBjYWNoZSBjb250cm9sbGVy
IG9uIFN0YXJGaXZlIHBsYXRmb3Jtcy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgaXMgYSBiaXQgbWlz
bGVhZGluZy4gVGhlIEpINzF4MHMgZG9uJ3QgaGF2ZSB0aGlzLiBJdCdzIG9ubHkgb24KPiA+ID4g
PiB0aGUgSkg4MTAwIHNvIGZhciwgYW5kIGhvcGVmdWxseSBsYXRlciBTb0NzIHdpbGwganVzdCBp
bXBsZW1lbnQgUklTQy1WCj4gPiBzdGFuZGFyZHMgZm9yIHRoaXMuCj4gPiA+ID4gU28gbWF5YmUg
c29tZXRoaW5nIGxpa2UKPiA+ID4gPgo+ID4gPiA+ICJTdXBwb3J0IGZvciB0aGUgU3Rhckxpbmsg
Y2FjaGUgY29udHJvbGxlciBvbiB0aGUgU3RhckZpdmUgSkg4MTAwIFNvQy4iCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSGkgRW1pbCwKPiA+ID4KPiA+ID4gVGhlIFN0YXJMaW5rLTUwMCBjYWNoZSBjb250
cm9sbGVyIGlzIG5vdCBkZXNpZ25lZCBleGNsdXNpdmVseSBmb3IgSkg4MTAwIFNvQy4KPiA+ID4g
V2hpbGUgaXQgaXMgdHJ1ZSB0aGF0IGl0IGN1cnJlbnRseSBleGlzdHMgb24gdGhlIFN0YXJGaXZl
IHBsYXRmb3JtLAo+ID4gPiBDUFUvU29DIHRoYXQgZG9lcyBub3QgY29tZSB3aXRoIFppY2JvbSBl
eHRlbnNpb25zIHN1cHBvcnRlZCB3b3VsZCBuZWVkCj4gPiA+IHRvIHJlbHkgb24gdGhpcyBjYWNo
ZSBkcml2ZSB0byBkbyBjYWNoZSBtYW5hZ2VtZW50IG9wZXJhdGlvbnMuIEkgdGhpbmsKPiA+ID4g
d2UgZG9u4oCZdCBuZWVkIHRvIG1lbnRpb25lZCAnSkg4MTAwIFNvQycgaGVyZS4KPiA+Cj4gPiBX
YWl0LCBpbiB0aGUgcHJldmlvdXMgbWFpbCB5b3Ugc2FpZCB0aGF0IGZ1dHVyZSBkZXNpZ25zIHdp
bGwgaW1wbGVtZW50IFppY2JvbQo+ID4gYW5kIG5vdCBuZWVkIHRoaXMgd29yay1hcm91bmQsIGJ1
dCBoZXJlIHlvdSdyZSB0YWxraW5nIGFib3V0IG90aGVyIFNvQ3MgdGhhdAo+ID4gZG8gbmVlZCBp
dC4gU28gd2hpY2ggaXMgaXQ/Cj4KPiBJZiB5b3UgdmlzaXQgdGhlIGNvbXBhbnkgd2Vic2l0ZSBh
bmQgbG9vayBmb3IgU3RhckxpbmstNTAwLCB5b3Ugd2lsbCBmaW5kIHRoYXQKPiBpdCBpcyBhIHN0
YW5kYWxvbmUgSVAgdGhhdCB0aGUgY29tcGFueSBpcyBzZWxsaW5nIGFzIGFuIGludGVyY29ubmVj
dC4gQW55b25lCj4gd2hvIGludGVncmF0ZXMgU3Rhckxpbmsgd2l0aG91dCBaaWNib20gZXh0ZW5z
aW9ucyBtYXkgdXRpbGl6ZSB0aGUgY2FjaGUKPiBtYW5hZ2VtZW50IG9wZXJhdGlvbiBmcm9tIHRo
aXMgSVAuCgpTbyB0aGVuIHRoZSAib24gU3RhckZpdmUgcGxhdGZvcm1zIiBwYXJ0IGlzIHdyb25n
PyBPciB3aWxsIHRoaXMgYWx3YXlzIGdvCnRvZ2V0aGVyIHdpdGggdGhlIER1YmhlIGNvcmVzPwoK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
