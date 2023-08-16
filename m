Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC5C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 02:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShvJO98tBr0OI5U9uwG/Em8RCDD5TXDX1s80Exo37HA=; b=Tt0SAjU9rHufcr
	VsA6t+BEwAbdnd/JDku7JD8Xgv3DobSh+bPmJEsSAPd4ixcsSODki0omQZCsp4WBX0TdIVxhbWxsh
	Bu+V5E9aABSUYe+vzscmpP4BVZvr7t4krbBP2IBkr0gQtypkK+UGu1NPd07vPYX9Jl9eX5ozdPHPD
	RSC1MjoCNBqGA87zkbhJr+uxa9kUnH23DHvywFRQ7jNO5H+4rLB2FylCEx/bIdpA1D1cYk75CvrEH
	6hrxXfEy1msSmQiXJ8il/tLxVygZ/Dvd/2A4nOkrC+gq7veAahrpLrVDnnGYXwtBBhQ3EW7jJFQT7
	TalUntB76QeHQRowP+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW65d-002zsq-0h;
	Wed, 16 Aug 2023 02:16:53 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW65a-002zs5-1c
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 02:16:51 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3497a6119abso19150435ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 19:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692152207; x=1692757007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5huse4n9suq/IRdDuONMgabd7JYMxtoLtQg6/wMeyM=;
        b=IscYDGR4az4TTZH0SjNN8xrwfiOJ3+5fCWmMPGTcsGwlqldoMp99VOy7NUfjYa0b1h
         OvNhjMP8ZCxAcM2mBpcSEJKYteHvo2dwg56cp91saAzxpsxkcXnsfxTMQab/VeKkpHq4
         Sfiz3/Ufi2biWbNcH00M1BuRC7ij5pfGk64GmXXdkmqt/I6IAnv13w4Dekp9hsTVmM+W
         oW4JnVGnUBzRtk4wSTvyWWR9dkY3EZjGjq5EE1N6pASrB5WNNDQOejcUqAq8sXeO0CCF
         0doLQk/SKkZ8R50scXnMLKF9OqmfuQz4BVNF2gF47Ydx/JJdJg5/whBDeMuker/9Kzne
         ofUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692152207; x=1692757007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5huse4n9suq/IRdDuONMgabd7JYMxtoLtQg6/wMeyM=;
        b=A5UTM79t+ZHPxNIaEf+Nv1xHWwIy1GMosX9ZIhnI6qVnCxV061dZxXxiR3DaMCrQ7N
         CrQPLZgomhQPiX44f1hyWgL0Gp8M+67seDJRD/gmj8RN64A7aGofuic/dQneYR7wW+1/
         ORETD4PLpo9ufyJVuQEQscf0NXKZl779yXNDDUFoJZj+zpA+18ebfBG9wIZe95engxdV
         Jng7dbGXu26/3ooBdAQxffBCG7BOBhjSBcCh2p7aCsScB2BYI8inf8OLSru/AfIzk+h3
         elHOWyLouY6bm0PJ085rsiy4ozxEhc7lvyDu9kS/IpE8p2d+yqFYl4CMO0ePrd3BArxv
         XG8g==
X-Gm-Message-State: AOJu0YyfEjmwfLep9iRQflT3p8YesXVB6keXcHtOmPlAh62Uop51ogCG
	gdJHuaCMRNoUsc79fA9aoX4exthaz8aZEA6F1/6fHA==
X-Google-Smtp-Source: AGHT+IH431ilN76iz617qfeJ/MYCKOhQ/JnGxm4Dea7qJyl3nVI1JisTa9E0HD2OrPtsfVR4zKyTC/1t/Hb8Kb3ObSs=
X-Received: by 2002:a05:6e02:1a2b:b0:349:8811:fc51 with SMTP id
 g11-20020a056e021a2b00b003498811fc51mr904026ile.20.1692152207491; Tue, 15 Aug
 2023 19:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com> <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca> <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
 <ZNOpbac4i5zfmHj4@ziepe.ca> <CANXhq0rzz1Sn8dKvNt7acvKN_g5yXFN9u6XPiRHr9ay7q2VbzA@mail.gmail.com>
 <ZNvGH91EmlOAaxBK@ziepe.ca>
In-Reply-To: <ZNvGH91EmlOAaxBK@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 16 Aug 2023 10:16:36 +0800
Message-ID: <CANXhq0pQ5wisNtbVjm031btUiO=y_MmA9rfbWwnMFo_1y2d50w@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_191650_572991_D118F979 
X-CRM114-Status: GOOD (  36.81  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMjozOOKAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDE1LCAyMDIzIGF0IDA5OjI4OjU0QU0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDEwOjU34oCvUE0g
SmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUs
IEp1bCAyNywgMjAyMyBhdCAxMDo0Mjo0N0FNICswODAwLCBab25nIExpIHdyb3RlOgo+ID4gPgo+
ID4gPiA+IFBlcmhhcHMgdGhpcyBxdWVzdGlvbiBjb3VsZCBiZSByZWxhdGVkIHRvIHRoZSBzY2Vu
YXJpb3MgaW4gd2hpY2gKPiA+ID4gPiBkZXZpY2VzIHdpc2ggdG8gYmUgaW4gYnlwYXNzIG1vZGUg
d2hlbiB0aGUgSU9NTVUgaXMgaW4gdHJhbnNsYXRpb24KPiA+ID4gPiBtb2RlLCBhbmQgd2h5IElP
TU1VIGRlZmluZXMvc3VwcG9ydHMgdGhpcyBjYXNlLiBDdXJyZW50bHksIEkgY291bGQKPiA+ID4g
PiBlbnZpc2lvbiBhIHNjZW5hcmlvIHdoZXJlIGEgZGV2aWNlIGlzIGFscmVhZHkgY29ubmVjdGVk
IHRvIHRoZSBJT01NVQo+ID4gPiA+IGluIGhhcmR3YXJlLCBidXQgaXQgaXMgbm90IGZ1bmN0aW9u
aW5nIGNvcnJlY3RseSwgb3IgdGhlcmUgYXJlCj4gPiA+ID4gcGVyZm9ybWFuY2UgaW1wYWN0cy4g
SWYgbW9kaWZ5aW5nIHRoZSBoYXJkd2FyZSBpcyBub3QgZmVhc2libGUsIGEKPiA+ID4gPiBkZWZh
dWx0IGNvbmZpZ3VyYXRpb24gdGhhdCBhbGxvd3MgYnlwYXNzIG1vZGUgY291bGQgYmUgcHJvdmlk
ZWQgYXMgYQo+ID4gPiA+IHNvbHV0aW9uLiBUaGVyZSBtaWdodCBiZSBvdGhlciBzY2VuYXJpb3Mg
dGhhdCBJIG1pZ2h0IGhhdmUgb3Zlcmxvb2tlZC4KPiA+ID4gPiBJdCBzZWVtcyB0byBtZSBzaW5j
ZSBJT01NVSBzdXBwb3J0cyB0aGlzIGNvbmZpZ3VyYXRpb24sIGl0IHdvdWxkIGJlCj4gPiA+ID4g
YWR2YW50YWdlb3VzIHRvIGhhdmUgYW4gYXBwcm9hY2ggdG8gYWNoaWV2ZSBpdCwgYW5kIERUIG1p
Z2h0IGJlIGEKPiA+ID4gPiBmbGV4aWJsZSB3YXkuCj4gPiA+Cj4gPiA+IFNvIGZhciB3ZSd2ZSB0
YWtlbiB0aGUgYXBwcm9hY2ggdGhhdCBicm9rZW4gaGFyZHdhcmUgaXMgcXVpcmtlZCBpbiB0aGUK
PiA+ID4ga2VybmVsIGJ5IG1hdGNoaW5nIE9GIGNvbXBhdGlibGUgc3RyaW5nIHBhdHRuZXJzLiBU
aGlzIGlzIEhXIHRoYXQgaXMKPiA+ID4gY29tcGxldGVseSBicm9rZW4gYW5kIHRoZSBJT01NVSBk
b2Vzbid0IHdvcmsgYXQgYWxsIGZvciBpdC4KPiA+ID4KPiA+ID4gSFcgdGhhdCBpcyBzbG93IG9y
IHdoYXRldmVyIGlzIG5vdCBxdWlya2VkIGFuZCB0aGlzIGlzIGFuIGFkbWluIHBvbGljeQo+ID4g
PiBjaG9pY2Ugd2hlcmUgdGhlIHN5c3RlbSBzaG91bGQgbGFuZCBvbiB0aGUgc2VjdXJpdHkvcGVy
Zm9ybWFuY2UKPiA+ID4gc3BlY3RydW0uCj4gPiA+Cj4gPiA+IFNvIEknbSBub3Qgc3VyZSBhZGRp
bmcgRFQgbWFrZXMgc2Vuc2UgaGVyZS4KPiA+ID4KPiA+Cj4gPiBIaSBKYXNvbiwKPiA+IFNvcnJ5
IGZvciBiZWluZyBsYXRlIGhlcmUsIEkgaGFkbid0IG5vdGljZWQgdGhpcyByZXBseSBlYXJsaWVy
LiBUaGUKPiA+IGFwcHJvYWNoIHNlZW1zIHRvIGFkZHJlc3MgdGhlIHNpdHVhdGlvbi4gQ291bGQg
eW91IGtpbmRseSBwcm92aWRlCj4gPiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbG9jYXRpb24gb2Yg
dGhlIHBhdGNoZXM/IEkgd2FzIHdvbmRlcmluZyBhYm91dAo+ID4gZnVydGhlciBkZXRhaWxzIHJl
Z2FyZGluZyB0aGlzIHBhcnRpY3VsYXIgaW1wbGVtZW50YXRpb24uIFRoYW5rcwo+Cj4gVGhlcmUg
YXJlIGEgY291cGxlIHZlcnNpb25zLCBlZwo+ICBhcm1fc21tdV9kZWZfZG9tYWluX3R5cGUoKQo+
ICBxY29tX3NtbXVfZGVmX2RvbWFpbl90eXBlKCkKPgoKSSB0aG91Z2h0IHdoYXQgeW91IG1lbnRp
b25lZCBlYXJsaWVyIGlzIHRoYXQgdGhlcmUgaXMgYSBuZXcgYXBwcm9hY2gKYmVpbmcgY29uc2lk
ZXJlZCBmb3IgdGhpcy4gSSB0aGluayB3aGF0IHlvdSBwb2ludCBvdXQgaXMgdGhlIHNhbWUgYXMK
QW51cCBtZW50aW9uZWQuIEhvd2V2ZXIsIGFzIEkgbWVudGlvbmVkIGVhcmxpZXIsIEkgYW0gZXhw
bG9yaW5nIGEgbW9yZQpmbGV4aWJsZSBhcHByb2FjaCB0byBhY2hpZXZlIHRoaXMgb2JqZWN0aXZl
LiBUaGlzIHdheSwgd2UgY2FuIGF2b2lkCmhhcmQgY29kaW5nIGFueXRoaW5nIChpLmUubGlzdCBj
b21wYXRpYmxlIHN0cmluZykgaW4gdGhlIGRyaXZlciBvcgpyZXF1aXJpbmcgYSBrZXJuZWwgcmVi
dWlsZCBldmVyeSB0aW1lIHdlIG5lZWQgdG8gY2hhbmdlIHRoZSBtb2RlIGZvcgpzcGVjaWZpYyBk
ZXZpY2VzLiBGb3IgZXhhbXBsZSwgdGhlIGRyaXZlciBjb3VsZCBwYXJzZSB0aGUgZGV2aWNlIG5v
ZGUKdG8gZGV0ZXJtaW5lIGFuZCByZWNvcmQgaWYgYSBkZXZpY2Ugd2lsbCBiZSBzZXQgdG8gYnlw
YXNzLCBhbmQgdGhlbgp0aGUgLmRlZl9kb21haW5fdHlwZSBjb3VsZCBiZSB1c2VkIHRvIHNldCB0
byBJT01NVV9ET01BSU5fSURFTlRJVFkgYnkKdGhlIHJlY29yZC4gSSdtIG5vdCBzdXJlIGlmIGl0
IG1ha2VzIHNlbnNlIGZvciBldmVyeW9uZSwgaXQgc2VlbXMgdG8KbWUgdGhhdCBpdCB3b3VsZCBi
ZSBncmVhdCBpZiB0aGVyZSBpcyBhIHdheSB0byBkbyB0aGlzLiA6KQoKPiBKYXNvbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
