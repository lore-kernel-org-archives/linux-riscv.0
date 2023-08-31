Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D296AC83F2E
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gke9IWyIsuUwa24jdBxu98Ny1aQloBDshsAVJyc/NA=; b=DsJJRiWpmcq7jr
	qRGXvgbta14qDKfD87bkzo2HGTvpg9U0QhiW+JPC9iKcU4gbDivN7XYlftwBhJBMbk2HVgeHxqDPe
	nDWTjfsSpw/o59wxMWCONAucpm+BzeWmpLfX4Y5WMjEEpPUcAg9Zq0SERt6jL0+BiObEPFIqWJZ6L
	ztoBIk8J+SNlRg1k2cxqeqdLranYtbboesiEgHoy2Hz+T55JCB/CKJVL8LiLiSQegUSj8uUhzwveS
	6GiK1r0hy2soMMvklJkSe85fMHDTFB2FmpZAksZM9SNHbVt87Osxz7WeXobZzCovs3yVNzOQbL/Ln
	DX0AF76sOUDoAKY3+ybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkD1-00FYDJ-1G;
	Thu, 31 Aug 2023 16:07:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbkCx-00FYCA-2I
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 16:07:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-56f84dd2079so758903a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 31 Aug 2023 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693498062; x=1694102862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt+9EjvduU5MHNDAuSvAQ3bNBgQszfIiKkzKEcdHNCE=;
        b=cvkYO8KfXbb7pG36BHJ++c5pFIBGTYZAr7oe9nEQIRZl1KnRkcLs0DK0RGNitCjQ9l
         wRVrSPIroWgKHgqNExf3BqZD/3y0F1fvxmkKPIMCIbK1nBS0YqtY1LL/44KvVv2W3CWQ
         wEYqTkhcgyGMlccwVib+y3r99o9Gg45SdOLAYu53I1BxaVRBKSAMP4w393XMKqS3BX5x
         i7ajOc4t9eS+RPD7IHTQ5XrHK2o8m/xYNYUVPkLHSRTuovRS1fY2AAYyT/YrNGuEO1vS
         5YrBxU8eGZPlXUGmMGxwiyK3MFqjQnttBSO4OXWLf9lrdaRI4ZhHcKaagx0kOlTPkBDY
         eZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693498062; x=1694102862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt+9EjvduU5MHNDAuSvAQ3bNBgQszfIiKkzKEcdHNCE=;
        b=LZZLAV/SC/oEPcXeyq8yWX1FEcuQkh0aBgxu0MXNl0j6coLJ2gt8V2HO+TSMIPQ0Ds
         NaKT2w+AOAdracTOBiTzqkUPOgEYiNQlxwD8CEiQzmLCE3V/MbegI5gUSn04jX2Nfaho
         bQPyd3qvfQ6oOA32R4QVaSM7e6+DWfvv9+Q0z3G8CJOG3qvRQ653wCq6LNLQQ1fKUCAS
         Xl9dTDRpQfH0HlFHmbzfDWFSdYxDrexKRjMaPirNvSg3ZIsok+p0672ZuCeLJp7QRnDL
         LUTVY7rtRjXVGwY31kq7SibC0hLiY1ESkGaJsByJ8mTSmPLKNSP3+zWtYWkspaUA9efx
         cUWQ==
X-Gm-Message-State: AOJu0YyCDYOm5YP75HiC7W5bCliwJSLlXJHEu7nxumEgDBTgItE40TTV
	UDevf6J0NVvVyW4fBOrm4DC1ArXxz3utTMVdgfW92w==
X-Google-Smtp-Source: AGHT+IFt6g5apacYzh41nAGLXuzY3wp2OZedNRsJ9t+ZlewDMLKiSlOv0TsmobMtse+QKI+IUKH0jyY7uAazI5diPLY=
X-Received: by 2002:a17:90a:e2ca:b0:268:c5c7:f7ed with SMTP id
 fr10-20020a17090ae2ca00b00268c5c7f7edmr5255644pjb.30.1693498062492; Thu, 31
 Aug 2023 09:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAAhSdy2_djw2JX+8tmF2V190+x9KLvt7u8rCX-TaGCKQrUVOYQ@mail.gmail.com>
 <DM8PR11MB57512001CAFA07EC58203A7BB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20230830-breeze-washboard-ef496d5c9d5a@wendy> <DM8PR11MB575116E5EE183D7D41361B74B8E5A@DM8PR11MB5751.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB575116E5EE183D7D41361B74B8E5A@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 31 Aug 2023 21:37:30 +0530
Message-ID: <CAK9=C2XTS539ew_rty6_MOwyZkdBBbGBCzxp33u1UpMP5STAqQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ardb@kernel.org" <ardb@kernel.org>, 
	"Li, Haicheng" <haicheng.li@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_090747_750447_5A086BE5 
X-CRM114-Status: GOOD (  36.39  )
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

K0FuZHJldwoKT24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgOToyOeKAr1BNIFdhbmcsIFhpYW8gVyA8
eGlhby53LndhbmdAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDMwLCAyMDIzIDI6NTkgUE0KPiA+IFRvOiBX
YW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGludGVsLmNvbT4KPiA+IENjOiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPjsgcGF1bC53YWxtc2xleUBzaWZpdmUuY29tOwo+ID4gcGFsbWVy
QGRhYmJlbHQuY29tOyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7IGFyZGJAa2VybmVsLm9yZzsgTGks
IEhhaWNoZW5nCj4gPiA8aGFpY2hlbmcubGlAaW50ZWwuY29tPjsgbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgtCj4gPiBlZmlAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBSSVNDLVY6IE9wdGlt
aXplIGJpdG9wcyB3aXRoIFpiYiBleHRlbnNpb24KPiA+Cj4gPiBPbiBXZWQsIEF1ZyAzMCwgMjAy
MyBhdCAwNjoxNDoxMkFNICswMDAwLCBXYW5nLCBYaWFvIFcgd3JvdGU6Cj4gPiA+IEhpLAo+ID4g
Pgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gRnJvbTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBBdWd1c3Qg
MjksIDIwMjMgNzowOCBQTQo+ID4gPiA+IFRvOiBXYW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGlu
dGVsLmNvbT4KPiA+ID4gPiBDYzogcGF1bC53YWxtc2xleUBzaWZpdmUuY29tOyBwYWxtZXJAZGFi
YmVsdC5jb207Cj4gPiA+ID4gYW91QGVlY3MuYmVya2VsZXkuZWR1OyBhcmRiQGtlcm5lbC5vcmc7
IExpLCBIYWljaGVuZwo+ID4gPiA+IDxoYWljaGVuZy5saUBpbnRlbC5jb20+OyBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPiA+ID4gPiBlZmlAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRD
SF0gUklTQy1WOiBPcHRpbWl6ZSBiaXRvcHMgd2l0aCBaYmIgZXh0ZW5zaW9uCj4gPiA+ID4KPiA+
ID4gPiBPbiBTdW4sIEF1ZyA2LCAyMDIzIGF0IDg6MDnigK9BTSBYaWFvIFdhbmcgPHhpYW8udy53
YW5nQGludGVsLmNvbT4KPiA+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgcGF0Y2gg
bGV2ZXJhZ2VzIHRoZSBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gdG8gZHluYW1pY2FsbHkgb3B0aW1p
emUKPiA+ID4gPiA+IGJpdG9wcyAoaW5jbHVkaW5nIF9fZmZzLCBfX2ZscywgZmZzLCBmbHMpIHdp
dGggWmJiIGluc3RydWN0aW9ucy4gV2hlbgo+ID4gPiA+ID4gWmJiIGV4dCBpcyBub3Qgc3VwcG9y
dGVkIGJ5IHRoZSBydW50aW1lIENQVSwgbGVnYWN5IGltcGxlbWVudGF0aW9uIGlzCj4gPiA+ID4g
PiB1c2VkLiBJZiBaYmIgaXMgc3VwcG9ydGVkLCB0aGVuIHRoZSBvcHRpbWl6ZWQgdmFyaWFudHMg
d2lsbCBiZSBzZWxlY3RlZAo+ID4gPiA+ID4gdmlhIGFsdGVybmF0aXZlIHBhdGNoaW5nLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFRoZSBsZWdhY3kgYml0b3BzIHN1cHBvcnQgaXMgdGFrZW4gZnJvbSB0
aGUgZ2VuZXJpYyBDIGltcGxlbWVudGF0aW9uIGFzCj4gPiA+ID4gPiBmYWxsYmFjay4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBJZiB0aGUgcGFyYW1ldGVyIGlzIGEgYnVpbGQtdGltZSBjb25zdGFudCwg
d2UgbGV2ZXJhZ2UgY29tcGlsZXIgYnVpbHRpbiB0bwo+ID4gPiA+ID4gY2FsY3VsYXRlIHRoZSBy
ZXN1bHQgZGlyZWN0bHksIHRoaXMgYXBwcm9hY2ggaXMgaW5zcGlyZWQgYnkgeDg2IGJpdG9wcwo+
ID4gPiA+ID4gaW1wbGVtZW50YXRpb24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gRUZJIHN0dWIgcnVu
cyBiZWZvcmUgdGhlIGtlcm5lbCwgc28gYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHNob3VsZCBub3Qg
YmUKPiA+ID4gPiA+IHVzZWQgdGhlcmUsIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG1hY3JvIEVG
SV9OT19BTFRFUk5BVElWRSBmb3IgdGhpcwo+ID4gPiA+ID4gcHVycG9zZS4KPiA+ID4gPgo+ID4g
PiA+IEkgYW0gZ2V0dGluZyB0aGUgZm9sbG93aW5nIGNvbXBpbGUgZXJyb3Igd2l0aCB0aGlzIHBh
dGNoOgo+ID4gPiA+Cj4gPiA+ID4gICBHRU4gICAgIE1ha2VmaWxlCj4gPiA+ID4gICBVUEQgICAg
IGluY2x1ZGUvY29uZmlnL2tlcm5lbC5yZWxlYXNlCj4gPiA+ID4gICBVUEQgICAgIGluY2x1ZGUv
Z2VuZXJhdGVkL3V0c3JlbGVhc2UuaAo+ID4gPiA+ICAgQ0MgICAgICBrZXJuZWwvYm91bmRzLnMK
PiA+ID4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LQo+ID4g
PiA+IHRlc3QvbGludXgvaW5jbHVkZS9saW51eC9iaXRtYXAuaDo5LAo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgZnJvbQo+ID4gPiA+IC9ob21lL2FudXAvV29yay9yaXNjdi0KPiA+IHRlc3QvbGlu
dXgvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmg6OSwKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgIGZyb20KPiA+ID4gPiAvaG9tZS9hbnVwL1dvcmsvcmlzY3YtdGVzdC9saW51eC9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmg6OTAsCj4gPiA+Cj4gPiA+Cj4gPiA+IEl0IGxv
b2tzIHRoZXJlJ3MgYSBjeWNsaWMgaGVhZGVyIGluY2x1ZGluZywgd2hpY2ggbGVhZHMgdG8gdGhp
cyBidWlsZCBlcnJvci4KPiA+ID4gSSBjaGVja2VkIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlz
Y3YvbGludXgvdHJlZS9tYXN0ZXIgYW5kCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC90cmVlL21hc3RlciwgYnV0IEkgZG9uJ3Qgc2VlCj4gPiA+ICJhc20vY3B1ZmVhdHVy
ZS5oIiBpcyBpbmNsdWRlZCBpbiBhc20vaHdjYXAuaDo5MCwgbWF5YmUgSSBtaXNzCj4gPiBzb21l
dGhpbmcsCj4gPiA+IGNvdWxkIHlvdSBoZWxwIHBvaW50IG1lIHRvIHRoZSByZXBvL2JyYW5jaCBJ
IHNob3VsZCB3b3JrIG9uPwo+ID4KPiA+IEZyb20gTUFJTlRBSU5FUlM6Cj4gPiAgICAgICBSSVND
LVYgQVJDSElURUNUVVJFCj4gPiAgICAgICAuLi4KPiA+ICAgICAgIFQ6ICAgICAgZ2l0IGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQK
PiA+Cj4gPiBUaGUgZm9yLW5leHQgYnJhbmNoIHRoZXJlIGlzIHdoYXQgeW91IHNob3VsZCBiZSBi
YXNpbmcgd29yayBvbiB0b3Agb2YuCj4gPiBBRkFJQ1QsIHlvdSd2ZSBtYWRlIGJpdG9wcy5oIGlu
Y2x1ZGUgaHdjYXAuaCB3aGlsZSBjcHVmZWF0dXJlLmggaW5jbHVkZXMKPiA+IGJvdGggYml0b3Bz
LmggKGluZGlyZWN0bHkpIGFuZCBod2NhcC5oLgo+Cj4gVGhhbmtzIGZvciB0aGUgaW5mbywgYnV0
IEkgY2FuJ3QgcmVwcm9kdWNlIEFudXAncyBidWlsZCBlcnJvciB3aXRoIHRoaXMgZm9yLW5leHQg
YnJhbmNoLCBjcHVmZWF0dXJlLmggaXMgbm90IGluY2x1ZGVkIGJ5IGh3Y2FwLmggdGhlcmUuCj4g
TWF5YmUgQW51cCBjb3VsZCBoZWxwIGRvdWJsZSBjaGVjayB0aGUgdGVzdCBlbnZpcm9ubWVudD8K
CkkgZmlndXJlZCB0aGF0IGNwdWZlYXR1cmUuaCBpbmNsdWRlZCBpbiBod2NhcC5oIGlzIGFkZGVk
IGJ5CkRyZXcncyBwYXRjaCAiUklTQy1WOiBFbmFibGUgY2JvLnplcm8gaW4gdXNlcm1vZGUiCgpJ
IGhhZCB0cmllZCB0aGlzIHBhdGNoIG9uLXRvcC1vZiBkZXYtdXBzdHJlYW0gYnJhbmNoIG9mCmh0
dHBzOi8vZ2l0aHViLmNvbS92ZW50YW5hbWljcm8vbGludXguZ2l0CgpSZWdhcmRzLApBbnVwCgo+
Cj4gQlJzLAo+IFhpYW8KPgo+Cj4gPgo+ID4gSG9wZSB0aGF0IGhlbHBzLAo+ID4gQ29ub3IuCj4g
Pgo+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJvbQo+ID4gPiA+IC9ob21lL2FudXAvV29yay9y
aXNjdi10ZXN0L2xpbnV4L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmg6MjYsCj4gPiA+
ID4gICAgICAgICAgICAgICAgICBmcm9tCj4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LXRl
c3QvbGludXgvaW5jbHVkZS9saW51eC9iaXRvcHMuaDo2OCwKPiA+ID4gPiAgICAgICAgICAgICAg
ICAgIGZyb20gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LXRlc3QvbGludXgvaW5jbHVkZS9saW51eC9s
b2cyLmg6MTIsCj4gPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2FudXAvV29yay9y
aXNjdi10ZXN0L2xpbnV4L2tlcm5lbC9ib3VuZHMuYzoxMzoKPiA+ID4gPiAvaG9tZS9hbnVwL1dv
cmsvcmlzY3YtdGVzdC9saW51eC9pbmNsdWRlL2xpbnV4L2ZpbmQuaDogSW4gZnVuY3Rpb24KPiA+
ID4gPiAnZmluZF9uZXh0X2JpdCc6Cj4gPiA+ID4gL2hvbWUvYW51cC9Xb3JrL3Jpc2N2LXRlc3Qv
bGludXgvaW5jbHVkZS9saW51eC9maW5kLmg6NjQ6MzA6IGVycm9yOgo+ID4gPiA+IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdfX2ZmcycKPiA+ID4gPiBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiA+ID4gPiAgICA2NCB8ICAgICAgICAgICAgICAgICBy
ZXR1cm4gdmFsID8gX19mZnModmFsKSA6IHNpemU7Cj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+
ID4gPiA+IEFudXAKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogWGlhbyBXYW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JpdG9wcy5oICAgICAgIHwgMjY2Cj4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gPiA+ID4gIGRyaXZlcnMvZmlybXdhcmUvZWZp
L2xpYnN0dWIvTWFrZWZpbGUgfCAgIDIgKy0KPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI2
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2JpdG9wcy5oCj4gPiA+ID4gYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2JpdG9wcy5oCj4gPiA+ID4gPiBpbmRleCAzNTQwYjY5MDk0NGIuLmY3
MjdmNjQ4OWNkNSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Yml0b3BzLmgKPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmgK
PiA+ID4gPiA+IEBAIC0xNSwxMyArMTUsMjczIEBACj4gPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9i
YXJyaWVyLmg+Cj4gPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9iaXRzcGVybG9uZy5oPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
