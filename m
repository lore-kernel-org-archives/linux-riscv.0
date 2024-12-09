Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F2E7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr2sWEWRVtgPgWhU3nL8NbkVu4G5kplCn9l9+0+vrto=; b=bcsaeUdhjD3XMV
	xCgUm0U/hEk/nzoPHaF/quEjqdYgaN+jqr5Qa1439xLv0ie9dnOq2Qk6Rh3nqRk4dpTqwqS+vNdqo
	tcjjlhXPOHNBQZv3kK+WllXaLuJHPvQIL0hw0rqsoXkyA23XlDcGKo+Lp6FbrQaRQ8kun2Q6kfRoY
	Mulil6CEbil8U+aXU9tU038TBx8ohoAvKT1lDucKoU9sBmXyo/NIgSX6WJ3irZxntUwXgVYSROrQy
	527l1/0X2YzzL9X0bUcI9wj5T/rAYVotam2O5+GIkbjM5sBbgst8Db88QSZpPmwEqnNxjQkCKmLwj
	F97dw3C3/zaUhz6odK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhI8-00000008gNy-0j14;
	Mon, 09 Dec 2024 17:11:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhGD-00000008fza-3MKY
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 17:09:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53f757134cdso2045498e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733764167; x=1734368967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dQoNlSLU0HPpFMCspBWlxi64Lg9FL6brLFfxEcaxG8=;
        b=Ek/0EOM9qurHo9zXAW59ikeV5jWk0vZmYDTFA6E/tZpxuPaWuVety1cFAOciuNd/go
         WoE1b9wyK+qc1GPOLJgMecjS3kx4gDGR0OHVYN1oNSTVCCrZputFf7ZTqQwjEEZqTnSA
         btZZact9WNDYWW7PAejSIWWPVFmnQX7PAQr2Al/j7k3QBm4saIpviiRjeGMPaOkTS/pH
         CCjXWOw90SqLQJPmgqBTvcDDZ21R1nJEAT33B2OYssjM902DfLD9dzkrx1A90UUnAHjz
         tcwv25vkcC9emt9C4jxtOI2G7EGRPwBQiGN5wIXe2/RFMsE/aZFxpYeTjwfaErK5MhpT
         P/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764167; x=1734368967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dQoNlSLU0HPpFMCspBWlxi64Lg9FL6brLFfxEcaxG8=;
        b=mprQwJ1XyHnmPUDnNR9CWXk74sEtWRs4uHGpypmHcSlvT4YMTzvg1uLZ3To3Uvjepc
         SLyeT49znzO7uew1/IhWM/ECjm+FMhLID8pNVjsfed1C7JK0XN0rpYXrW6UkRE/qFQyc
         T3JYtI/w+V5XkcE2a6VC3vkgFEevJd2yQR8guWST1PIJ+HkmZ0pBRIMta5yyx8J5rgjU
         IvunfekqqVFBX6I9V8uftSMBOT/qALTz4SU+2EHG0UEURm0fMDP+vm0Lu1tgxU4u6KTd
         yqYRrANYC2Dy5Keg5N6r5oNU9v+nOvdMvuq3hZ36hgaHAdi13Xtr/ZNCUTvSHSeI5IgZ
         Faqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8yZ93WLbUy2HWplX9WvrBC5nY8r8YnPCiqnv28T7TtiJC3xntwq9tE19KanNC4pZGN7BrmpdSCyAv2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VICPBvwI1xjwJpD7gsiFrPUtQ7IggpXEMhRwMlz6OnNd1xpc
	dQiGdfmcx5GiMgyEkUmCzGG8PPBZtI3VUK8a6UMWTE3HB2bjsFH7QOrVPTem2aK1vlS6ZbXtsy9
	CqH25GclZXCed2FzZA1hw/cS6yz48cJDlck2bXg==
X-Gm-Gg: ASbGncsUDaTPJt8vN74u+DdLHrg66LY8jZDtdRHkd+pzekSubMypMY91p00OLNEwHDf
	VA6if9XUryh/j4OhsFB3VxJXr+suFI9MrBQ==
X-Google-Smtp-Source: AGHT+IG6uSRDfPHJzHiWWjwtpQy8M4+4XudoroPlj5CXYPC49kBjcmD0V2caDVBsCTaJa23u6C6/4BVZxa5RJ8VB4hc=
X-Received: by 2002:a05:6512:acc:b0:53e:3740:4a8d with SMTP id
 2adb3069b0e04-53e37404c0emr3635765e87.3.1733764167141; Mon, 09 Dec 2024
 09:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com> <87r06gq2di.ffs@tglx>
In-Reply-To: <87r06gq2di.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Dec 2024 22:39:16 +0530
Message-ID: <CAK9=C2UZKgkA_xZPs2=RBo7bUDKpeY2gBA2j3+S4i4xSLqC5BQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090929_848557_A34AC173 
X-CRM114-Status: GOOD (  39.67  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgOSwgMjAyNCBhdCA5OjIz4oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQW51cCEKPgo+IE9uIE1vbiwgRGVjIDA5IDIwMjQgYXQg
MTc6MzgsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyA5LCAyMDI0IGF0IDE6NDTi
gK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPj4gVGhl
cmUgaXMgbm8gZ3VhcmFudGVlIHRoYXQgc2V0X2FmZmluaXR5KCkgcnVucyBvbiB0aGUgb3JpZ2lu
YWwgdGFyZ2V0Cj4gPj4gQ1BVIChDUFUgMSkuIFlvdXIgc2NoZW1lIG9ubHkgd29ya3MsIHdoZW4g
Q1BVMSB2ZWN0b3IgMHgyMCBpcyBub3QgdXNlZAo+ID4+IGJ5IHNvbWUgb3RoZXIgZGV2aWNlLiBJ
ZiBpdCdzIHVzZWQsIHlvdSBsb3N0IGFzIENQVTEgd2lsbCBjb25zdW1lIHRoZQo+ID4+IHZlY3Rv
ciBhbmQgeW91ciBwZW5kaW5nIGNoZWNrIGlzIG5vdCBzZWVpbmcgYW55dGhpbmcuCj4gPj4KPiA+
PiB4ODYgZW5zdXJlcyBDUFUgbG9jYWxpdHkgYnkgZGVmZXJyaW5nIHRoZSBhZmZpbml0eSBtb3Zl
IHRvIHRoZSBuZXh0Cj4gPj4gZGV2aWNlIGludGVycnVwdCBvbiB0aGUgb3JpZ2luYWwgdGFyZ2V0
IENQVSAoQ1BVMSBpbiB0aGUgYWJvdmUKPiA+PiBleGFtcGxlKS4gU2VlIENPTkZJR19HRU5FUklD
X0lSUV9QRU5ESU5HLgo+ID4KPiA+IEkgYWdyZWUgd2l0aCB5b3UuCj4gPgo+ID4gVGhlIElNU0lD
IGRyaXZlciBtdXN0IGRvIHRoZSBhZmZpbml0eSBtb3ZlIHVwb24gdGhlIG5leHQgZGV2aWNlCj4g
PiBpbnRlcnJ1cHQgb24gdGhlIG9sZCBDUFUuIEkgd2lsbCB1cGRhdGUgdGhpcyBwYXRjaCBpbiB0
aGUgbmV4dCByZXZpc2lvbi4KPiA+Cj4gPiBCVFcsIEkgZGlkIG5vdCBmaW5kIENPTkZJR19HRU5F
UklDX0lSUV9QRU5ESU5HLiBJcyB0aGUKPiA+IG5hbWUgY29ycmVjdCA/Cj4KPiBDT05GSUdfR0VO
RVJJQ19QRU5ESU5HX0lSUSBpcyBjbG9zZSBlbm91Z2ggOikKPgo+ID4+IFRoZSBpbnRlcnJ1cHQg
ZG9tYWlucyB3aGljaCBhcmUgbm90IGFmZmVjdGVkIChyZW1hcCkgc2V0IHRoZQo+ID4+IElSUV9N
T1ZFX1BDTlRYVCBmbGFnIHRvIGF2b2lkIHRoYXQgZGFuY2UgYW5kIGRvbid0IHVzZSB0aGF0IGFm
ZmluaXR5Cj4gPj4gc2V0dGVyIGNvZGUgcGF0aCBhdCBhbGwuCj4gPgo+ID4gWWVzLCBzZXR0aW5n
IHRoZSBJUlFfTU9WRV9QQ05UWFQgZmxhZyBpbiB0aGUgcmVtYXAgZG9tYWluCj4gPiBtYWtlcyBw
ZXJmZWN0IHNlbnNlLgo+ID4KPiA+IEkgc3VnZ2VzdCBhZGRpbmcgSVJRX01PVkVfUENOVFhUIHVz
YWdlIGFzIHBhcnQgb2YgRHJldydzCj4gPiBpcnFieXBhc3Mgc2VyaWVzIHdoaWNoIGFkZHMgYSBy
ZW1hcCBkb21haW4gaW4gdGhlIElPTU1VCj4gPiBkcml2ZXIuIFVubGVzcyB5b3UgaW5zaXN0IG9u
IGhhdmluZyBpdCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzID8KPgo+IFlvdSBuZWVkIHRvIGxvb2sg
YXQgdGhlIG90aGVyIFJJU0MtViBjb250cm9sbGVycy4gVGhvc2Ugd2hpY2ggZG8gbm90Cj4gbmVl
ZCB0aGlzIHNob3VsZCBzZXQgaXQuIFRoYXQncyBoaXN0b3JpY2FsbHkgYmFja3dhcmRzLgoKSSB3
aWxsIHVwZGF0ZSB0aGUgUklTQy1WIEFQTElDIE1TSS1tb2RlIGRyaXZlciBpbiB0aGUgbmV4dCBy
ZXZpc2lvbi4KVGhpcyBkcml2ZXIgaXMgYSBnb29kIGNhbmRpZGF0ZSB0byB1c2UgSVJRX01PVkVf
UENOVFhUIGFuZApJUlFDSElQX01PVkVfREVGRVJSRUQuCgo+Cj4gSSB0aGluayB3ZSBjYW4gcmV2
ZXJzZSB0aGUgbG9naWMgaGVyZS4gQXMgdGhpcyBuZWVkcyBiYWNrcG9ydGluZywgSQo+IGNhbid0
IG1ha2UgYSBmdWxsIGNsZWFudXAgb2YgdGhpcywgYnV0IGZvciB5b3VyIHByb2JsZW0gdGhlIHBh
dGNoIGJlbG93Cj4gc2hvdWxkIGp1c3Qgd29yay4KPgo+IFNlbGVjdCBHRU5FUklDX1BFTkRJTkdf
SVJRIGFuZCBHRU5FUklDX1BFTkRJTkdfSVJRX0NISVBGTEFHUyBhbmQgc2V0IHRoZQo+IElSUUNI
SVBfTU9WRV9ERUZFUlJFRCBmbGFnIG9uIHlvdXIgaW50ZXJycnVwdCBjaGlwIGFuZCB0aGUgY29y
ZSBsb2dpYwo+IHRha2VzIGNhcmUgb2YgdGhlIFBDTlRYVCBiaXRzLgoKU3VyZSwgSSB3aWxsIHVw
ZGF0ZS4KClRoYW5rcywKQW51cAoKCj4KPiBJJ2xsIGNvbnZlcnQgeDg2IGluIGEgc2VwZXJhdGUg
c3RlcCBhbmQgcmVtb3ZlIHRoZSBQQ05UWFQgbGVmdG92ZXJzIGFuZAo+IHRoZSBuZXcgY29uZmln
IGtub2Igb25jZSB0aGUgZHVzdCBoYXMgc2V0dGxlZC4KPgo+IFRoYW5rcywKPgo+ICAgICAgICAg
dGdseAo+IC0tLQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaXJxLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L2lycS5oCj4gQEAgLTU2Nyw2ICs1NjcsNyBAQCBzdHJ1Y3QgaXJxX2NoaXAgewo+ICAgKiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluIHRoZSBzdXNwZW5kIHBhdGggaWYg
dGhleSBhcmUgaW4gZGlzYWJsZWQgc3RhdGUKPiAgICogSVJRQ0hJUF9BRkZJTklUWV9QUkVfU1RB
UlRVUDogICAgICBEZWZhdWx0IGFmZmluaXR5IHVwZGF0ZSBiZWZvcmUgc3RhcnR1cAo+ICAgKiBJ
UlFDSElQX0lNTVVUQUJMRTogICAgICAgICAgICAgICAgRG9uJ3QgZXZlciBjaGFuZ2UgYW55dGhp
bmcgaW4gdGhpcyBjaGlwCj4gKyAqIElSUUNISVBfTU9WRV9ERUZFUlJFRDogICAgICAgICAgICBN
b3ZlIHRoZSBpbnRlcnJ1cHQgaW4gYWN0dWFsIGludGVycnVwdCBjb250ZXh0Cj4gICAqLwo+ICBl
bnVtIHsKPiAgICAgICAgIElSUUNISVBfU0VUX1RZUEVfTUFTS0VEICAgICAgICAgICAgICAgICA9
ICgxIDw8ICAwKSwKPiBAQCAtNTgxLDYgKzU4Miw3IEBAIGVudW0gewo+ICAgICAgICAgSVJRQ0hJ
UF9FTkFCTEVfV0FLRVVQX09OX1NVU1BFTkQgICAgICAgID0gKDEgPDwgIDkpLAo+ICAgICAgICAg
SVJRQ0hJUF9BRkZJTklUWV9QUkVfU1RBUlRVUCAgICAgICAgICAgID0gKDEgPDwgMTApLAo+ICAg
ICAgICAgSVJRQ0hJUF9JTU1VVEFCTEUgICAgICAgICAgICAgICAgICAgICAgID0gKDEgPDwgMTEp
LAo+ICsgICAgICAgSVJRQ0hJUF9NT1ZFX0RFRkVSUkVEICAgICAgICAgICAgICAgICAgID0gKDEg
PDwgMTIpLAo+ICB9Owo+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFkZXNjLmg+Cj4gLS0tIGEva2Vy
bmVsL2lycS9LY29uZmlnCj4gKysrIGIva2VybmVsL2lycS9LY29uZmlnCj4gQEAgLTMxLDYgKzMx
LDEwIEBAIGNvbmZpZyBHRU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZGX01BU0sKPiAgY29uZmlnIEdF
TkVSSUNfUEVORElOR19JUlEKPiAgICAgICAgIGJvb2wKPgo+ICsjIERlZHVjZSBkZWxheWVkIG1p
Z3JhdGlvbiBmcm9tIHRvcC1sZXZlbCBpbnRlcnJ1cHQgY2hpcCBmbGFncwo+ICtjb25maWcgR0VO
RVJJQ19QRU5ESU5HX0lSUV9DSElQRkxBR1MKPiArICAgICAgIGJvb2wKPiArCj4gICMgU3VwcG9y
dCBmb3IgZ2VuZXJpYyBpcnEgbWlncmF0aW5nIG9mZiBjcHUgYmVmb3JlIHRoZSBjcHUgaXMgb2Zm
bGluZS4KPiAgY29uZmlnIEdFTkVSSUNfSVJRX01JR1JBVElPTgo+ICAgICAgICAgYm9vbAo+IC0t
LSBhL2tlcm5lbC9pcnEvY2hpcC5jCj4gKysrIGIva2VybmVsL2lycS9jaGlwLmMKPiBAQCAtNDcs
NiArNDcsMTMgQEAgaW50IGlycV9zZXRfY2hpcCh1bnNpZ25lZCBpbnQgaXJxLCBjb25zdAo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgZGVzYy0+aXJxX2RhdGEu
Y2hpcCA9IChzdHJ1Y3QgaXJxX2NoaXAgKikoY2hpcCA/OiAmbm9faXJxX2NoaXApOwo+ICsKPiAr
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX1BFTkRJTkdfSVJRX0NISVBGTEFH
UykgJiYgY2hpcCkgewo+ICsgICAgICAgICAgICAgICBpZiAoY2hpcC0+ZmxhZ3MgJiBJUlFDSElQ
X01PVkVfREVGRVJSRUQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaXJxZF9jbGVhcigmZGVz
Yy0+aXJxX2RhdGEsIElSUURfTU9WRV9QQ05UWFQpOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgaXJxZF9zZXQoJmRlc2MtPmlycV9kYXRhLCBJUlFEX01P
VkVfUENOVFhUKTsKPiArICAgICAgIH0KPiAgICAgICAgIGlycV9wdXRfZGVzY191bmxvY2soZGVz
YywgZmxhZ3MpOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEZvciAhQ09ORklHX1NQQVJTRV9J
UlEgbWFrZSB0aGUgaXJxIHNob3cgdXAgaW4KPiBAQCAtMTExNCwxNiArMTEyMSwyMSBAQCB2b2lk
IGlycV9tb2RpZnlfc3RhdHVzKHVuc2lnbmVkIGludCBpcnEsCj4gICAgICAgICB0cmlnZ2VyID0g
aXJxZF9nZXRfdHJpZ2dlcl90eXBlKCZkZXNjLT5pcnFfZGF0YSk7Cj4KPiAgICAgICAgIGlycWRf
Y2xlYXIoJmRlc2MtPmlycV9kYXRhLCBJUlFEX05PX0JBTEFOQ0lORyB8IElSUURfUEVSX0NQVSB8
Cj4gLSAgICAgICAgICAgICAgICAgIElSUURfVFJJR0dFUl9NQVNLIHwgSVJRRF9MRVZFTCB8IElS
UURfTU9WRV9QQ05UWFQpOwo+ICsgICAgICAgICAgICAgICAgICBJUlFEX1RSSUdHRVJfTUFTSyB8
IElSUURfTEVWRUwpOwo+ICAgICAgICAgaWYgKGlycV9zZXR0aW5nc19oYXNfbm9fYmFsYW5jZV9z
ZXQoZGVzYykpCj4gICAgICAgICAgICAgICAgIGlycWRfc2V0KCZkZXNjLT5pcnFfZGF0YSwgSVJR
RF9OT19CQUxBTkNJTkcpOwo+ICAgICAgICAgaWYgKGlycV9zZXR0aW5nc19pc19wZXJfY3B1KGRl
c2MpKQo+ICAgICAgICAgICAgICAgICBpcnFkX3NldCgmZGVzYy0+aXJxX2RhdGEsIElSUURfUEVS
X0NQVSk7Cj4gLSAgICAgICBpZiAoaXJxX3NldHRpbmdzX2Nhbl9tb3ZlX3BjbnR4dChkZXNjKSkK
PiAtICAgICAgICAgICAgICAgaXJxZF9zZXQoJmRlc2MtPmlycV9kYXRhLCBJUlFEX01PVkVfUENO
VFhUKTsKPiAgICAgICAgIGlmIChpcnFfc2V0dGluZ3NfaXNfbGV2ZWwoZGVzYykpCj4gICAgICAg
ICAgICAgICAgIGlycWRfc2V0KCZkZXNjLT5pcnFfZGF0YSwgSVJRRF9MRVZFTCk7Cj4KPiArICAg
ICAgIC8qIEtlZXAgdGhpcyBhcm91bmQgdW50aWwgeDg2IGlzIGNvbnZlcnRlZCBvdmVyICovCj4g
KyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfUEVORElOR19JUlFfQ0hJUEZM
QUdTKSkgewo+ICsgICAgICAgICAgICAgICBpcnFkX2NsZWFyKCZkZXNjLT5pcnFfZGF0YSwgSVJR
RF9NT1ZFX1BDTlRYVCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChpcnFfc2V0dGluZ3NfY2FuX21v
dmVfcGNudHh0KGRlc2MpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlycWRfc2V0KCZkZXNj
LT5pcnFfZGF0YSwgSVJRRF9NT1ZFX1BDTlRYVCk7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAg
dG1wID0gaXJxX3NldHRpbmdzX2dldF90cmlnZ2VyX21hc2soZGVzYyk7Cj4gICAgICAgICBpZiAo
dG1wICE9IElSUV9UWVBFX05PTkUpCj4gICAgICAgICAgICAgICAgIHRyaWdnZXIgPSB0bXA7Cj4K
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
