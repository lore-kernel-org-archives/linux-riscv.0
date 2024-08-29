Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD05C761AE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5DswoqVi0s23sEvaQS00GjwoSklWxl3e8R9OtZ0l2s=; b=yoW/58N1y/o7Yt
	4iISTsj/H0CoRAiEWdcXsUk5PP3o4Q4VjxdhUEJTtapCfWeGscflWwxJfLdcp+0dhhmbXMAMXkB3q
	K0+qSwranlRgoeL6IdDRVqCMCEv31FAUo+KPjbyfkjt+st4unEC+mt+XsRRTGPsHMhlVoWIVPXXcx
	GqI6QqcH0k5X8C7Voi9mtm3h8xIWSDoB14yzVzHiRhH8Wht1SOrZbe0idH9UouAC62u9+dwA/0cpd
	FQqx5T8Porh/Fcgojpu4AVawRhEs7V+0M7C33kv7hQXMgaoaHc73l3wsLC0NrDUcps5Pzqti9NK9P
	dWre5S9t/Qfgp50Wl5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYeK-00000000mEY-0KQK;
	Thu, 29 Aug 2024 06:28:52 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjYZ7-00000000kKO-3AXT
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 06:23:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-70f6118f1b5so121803a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724912608; x=1725517408; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We5m3+H3R8SKY6TgdOmuAhW7gddzpKBKIL3OWVnLm/o=;
        b=WbiCDcQP4SpXALleuBxaIW63le0kofjSQ6jWCQMmvl2NzYrO827va8tG19meHhDTjY
         eH6QM6xqflGwBcz83DPbVQz+BE8+XdCx99Pyzq6Jeq+9hAaym1IXzT3dJ5ieszK5lgb+
         EYYsYyScSiROlee7NbTEsnrIWEyDb6uIsxVxr1zqESoaf210bcZ9f+XyilfJ/U0caKy1
         cJvHVjGOCYgfPdjtQbGUvXSW3dp+3S75g3YPTtGpNQexdj0sphzpuAdDSi/xR6a67aFL
         uD5KtQtv0ycI2/QyFaPJUQX77sFU7ribyM9TlIWJdqS3oDAvcCeNQ7zzh8PXrFADdwmY
         +FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724912608; x=1725517408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We5m3+H3R8SKY6TgdOmuAhW7gddzpKBKIL3OWVnLm/o=;
        b=TIt0nFic9ayk4H9e61hGpWm01z5SYOYG405j6cvjrBt3CkKb8XEQsOgmfuae4yQexH
         q9GpioetRTgqJ2APL+S3XzMs7zyl+e521KB46vVHS2ss5GllyRMC75TUXDrhL4/73+Er
         Tk7xbMF49kFhNcW1sC77hf1u1Rj74Akg+lCELCo5yNnjVmvVnKLhdgCAXs9XecXyU5qD
         5QDK+5b8UpjtyXL5Hr+CUSwbF/BvKp/H8aP95K/tpT0V4ccd5e1hARcjkCkKFMIlV0+T
         Ln7JbtcmK5pOJLDRU4n1H1Ae7BSEOsR30melvHRg2sSuewHrQLyckPtm4fJ78Fm7tXwq
         eaHA==
X-Forwarded-Encrypted: i=1; AJvYcCWRTxJNj1zbD45bMUjkgYwqUrkwvPOlM5xuI57kgdI45kWv2mnotVFqR6owdw6XJRq/A53wvo5ZnSocIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxNqpm7K5myR8rAz3O6N7EA0djQOQ+nIfqo1Svg7f1eHRR3g2V
	cb0AXu9bYlAgv+jdstJVQpFOzhJVmwo2V2ihTMWK/TC28cF9EAKeyeU30174WhDe/TzhVXk0HNx
	YIz9UyaqvununaV8Zrhw72zcwvTYEwGe3VtD/8A==
X-Google-Smtp-Source: AGHT+IGx2qU3L4U5PKY484HvHyYBLh0VVe3B33vKeGxVNlqtt9Y75kBhD2f6+d1QQddZ4gxg4HMzb7nFa22jyhmjQaY=
X-Received: by 2002:a05:6808:30a1:b0:3d6:32d2:2c10 with SMTP id
 5614622812f47-3df05e350f0mr2073377b6e.31.1724912608433; Wed, 28 Aug 2024
 23:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-3-nick.hu@sifive.com>
 <CAK9=C2Xui8c0b55WrZxCZYqK=AFmiPT+nG8d_E0d7SpamwvO-Q@mail.gmail.com>
In-Reply-To: <CAK9=C2Xui8c0b55WrZxCZYqK=AFmiPT+nG8d_E0d7SpamwvO-Q@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 29 Aug 2024 14:23:17 +0800
Message-ID: <CAKddAkCoZy=uid5gVzUg-zwhBxX_EZCbFR18521N3142MPv=jw@mail.gmail.com>
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_232329_838356_2C86B84C 
X-CRM114-Status: GOOD (  23.17  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW51cAoKT24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMToxOOKAr1BNIEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDI5LCAyMDI0IGF0
IDk6MTDigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IFN0
b3AgdGhlIHN0aW1lY21wIHdoZW4gdGhlIGNwdSBpcyBnb2luZyB0byBiZSBvZmYgb3RoZXJ3aXNl
IHRoZSB0aW1lcgo+ID4gaW50ZXJydXB0IG1heSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcgcG93
ZXIgZG93biBvcGVyYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5o
dUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jIHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMKPiA+IGluZGV4IDQ4Y2U1MGM1ZjVlNi4uOWE2YWNhYThkZmIwIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gPiArKysgYi9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+IEBAIC0zMiwxNSArMzIsMTkgQEAKPiA+ICBzdGF0
aWMgREVGSU5FX1NUQVRJQ19LRVlfRkFMU0UocmlzY3Zfc3N0Y19hdmFpbGFibGUpOwo+ID4gIHN0
YXRpYyBib29sIHJpc2N2X3RpbWVyX2Nhbm5vdF93YWtlX2NwdTsKPiA+Cj4gPiArc3RhdGljIHZv
aWQgcmlzY3ZfY2xvY2tfc3RvcF9zdGltZWNtcCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgY3Ny
X3dyaXRlKENTUl9TVElNRUNNUCwgVUxPTkdfTUFYKTsKPiA+ICsgICAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1F
Q01QSCwgVUxPTkdfTUFYKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIHZvaWQgcmlzY3ZfY2xv
Y2tfZXZlbnRfc3RvcCh2b2lkKQo+ID4gIHsKPiA+IC0gICAgICAgaWYgKHN0YXRpY19icmFuY2hf
bGlrZWx5KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkpIHsKPiA+IC0gICAgICAgICAgICAgICBjc3Jf
d3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4gLSAgICAgICAgICAgICAgIGlmIChJ
U19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBjc3Jf
d3JpdGUoQ1NSX1NUSU1FQ01QSCwgVUxPTkdfTUFYKTsKPiA+IC0gICAgICAgfSBlbHNlIHsKPiA+
ICsgICAgICAgaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZyaXNjdl9zc3RjX2F2YWlsYWJsZSkp
Cj4gPiArICAgICAgICAgICAgICAgcmlzY3ZfY2xvY2tfc3RvcF9zdGltZWNtcCgpOwo+ID4gKyAg
ICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgICAgc2JpX3NldF90aW1lcihVNjRfTUFYKTsKPiA+
IC0gICAgICAgfQo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGludCByaXNjdl9jbG9ja19uZXh0X2V2
ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4gPiBAQCAtMTI2LDcgKzEzMCwxMSBAQCBzdGF0aWMg
aW50IHJpc2N2X3RpbWVyX3N0YXJ0aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4KPiA+ICBz
dGF0aWMgaW50IHJpc2N2X3RpbWVyX2R5aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gIHsK
PiA+IC0gICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKHJpc2N2X2Nsb2NrX2V2ZW50X2lycSk7Cj4g
PiArICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUp
KQo+ID4gKyAgICAgICAgICAgICAgIHJpc2N2X2Nsb2NrX3N0b3Bfc3RpbWVjbXAoKTsKPiA+ICsg
ICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgIGRpc2FibGVfcGVyY3B1X2lycShyaXNjdl9j
bG9ja19ldmVudF9pcnEpOwo+ID4gKwo+Cj4gTm90IGRpc2FibGluZyByaXNjdl9jbG9ja19ldmVu
dF9pcnEgaGVyZSBmb3IgU3N0YyB3b3VsZCBub3cKPiBjYXVzZSByaXNjdl90aW1lcl9zdGFydGlu
Z19jcHUoKSB0byB1bm5lY2Vzc2FyaWx5IGVuYWJsZSBpdAo+IHdoZW4gdGhlIENQVSBpcyBwb3dl
cmVkLXVwLgo+Cj4gSSB0aGluayB0aGUgYmVsb3cgY2hhbmdlIGlzIHN1ZmZpY2llbnQgZm9yIHRo
aXMgcGF0Y2g6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNj
di5jCj4gYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBpbmRleCA0OGNlNTBj
NWY1ZTYuLjU0NmZkMjQ4ZjRmZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBA
QCAtMTI3LDYgKzEyNywxMSBAQCBzdGF0aWMgaW50IHJpc2N2X3RpbWVyX3N0YXJ0aW5nX2NwdSh1
bnNpZ25lZCBpbnQgY3B1KQo+ICBzdGF0aWMgaW50IHJpc2N2X3RpbWVyX2R5aW5nX2NwdSh1bnNp
Z25lZCBpbnQgY3B1KQo+ICB7Cj4gICAgICAgICBkaXNhYmxlX3BlcmNwdV9pcnEocmlzY3ZfY2xv
Y2tfZXZlbnRfaXJxKTsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBTdG9wIHRoZSB0aW1lciB3
aGVuIHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UKPiArICAgICAgICAq
IHRoZSB0aW1lciBpbnRlcnJ1cHQgbWF5IGJlIHBlbmRpbmcgd2hpbGUgcGVyZm9ybWluZyBwb3dl
ci1kb3duLgo+ICsgICAgICAgICovCj4gKyAgICAgICByaXNjdl9jbG9ja19ldmVudF9zdG9wKCk7
Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ClRoZSBzYmlfZXhpdCgpIG9mIE9wZW5TQkkgd2ls
bCBkaXNhYmxlIG10aW1lY21wIHdoZW4Kc2JpX2hzbV9oYXJ0X3N0b3AoKSBzbyB0aGUgbXRpbWVj
bXAgd2lsbCBiZSBkaXNhYmxlZCB0d2ljZSBpZiB0aGVyZSBpcwpubyBTU1RDLgpIb3cgYWJvdXQg
YWRkaW5nIGEgU1NUQyBhdmFpbGFibGUgY2hlY2sgYmVmb3JlIHRoZSByaXNjdl9jbG9ja19ldmVu
dF9zdG9wPwoKICAvKgogICAqIFN0b3AgdGhlIHRpbWVyIHdoZW4gdGhlIGNwdSBpcyBnb2luZyB0
byBiZSBvZmZsaW5lIG90aGVyd2lzZQogICAqIHRoZSB0aW1lciBpbnRlcnJ1cHQgbWF5IGJlIHBl
bmRpbmcgd2hpbGUgcGVyZm9ybWluZyBwb3dlci1kb3duLgogICAqLwppZiAoc3RhdGljX2JyYW5j
aF9saWtlbHkoJnJpc2N2X3NzdGNfYXZhaWxhYmxlKSkKICAgIHJpc2N2X2Nsb2NrX2V2ZW50X3N0
b3AoKTsKCj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
