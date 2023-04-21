Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6CC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 06:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ii+FNIZWpH6FtfiJBy40jfhdyVzPFvU/TARmxxoNLrU=; b=tIUOez66O03W7s
	RzN8cGsG+BiKFZ5keBmTyOye9kcDotz32zN4UszSD4zA9ZEcj3jtQiVa2I/Yh1CUP/9p1W4b64187
	BwZbVFTBYm3B6XsVjeuIjw2nHapmNPVmTYxX/kFVZzX15xWxOnuxGzgL3l39xQ9NiIgdgAo7wMeme
	oLiYbP+hI1ng/gUpoe8EGSCPLKxAC093+ypGYYHCl8/hiUhMowANuj5At7fA2SFICqJ76LvUHoXjf
	kLzt+4HrlU0ZMa+dvD895Roos9nSYoiluyJDZ+a64XYFEzAmw9uM8QCzVbYgqfsRTPZ0Lvlbibhjg
	nryNkh0dTAlbuKj27bAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppk4a-009n5C-2k;
	Fri, 21 Apr 2023 06:16:44 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppk4W-009n4K-36
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 06:16:42 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b991e510fbcso452960276.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 23:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682057799; x=1684649799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5ffUiM3M7NTUSgdHiwJ5XZXqrjEjLlNt36O7ostYWk=;
        b=JB6iEZoqs5uLEzGwULGqVV4cERqxyNBtzx7gNRZ1bSE1KMivgF0Fn7pTjSfSLh/v5x
         ted6xSS2RGuVwdR0XrqxiNV0nDm6TMXe3iJ0XOJLlbPJ2NXmlZS27pE4/gGcUkjGHDGR
         yCclIpmnbAqom8URegkT3f/ZPV21ZZ1UnnWNkiWN9wauicAbh/xE4DI9Nye5YfNfRoif
         c7VUtVEq1235OLz58UjZCGOlLrm6ftcAdTh6ilMsacMV9Z57NY9IgE9vWzpvmr0oQvMW
         4/SWqvQKDnZmENVsZhwQ619HlrLODLmsOOGbxOWlV9gYmvuLvG/HhqSOOSmMWyKQhsHV
         J2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682057799; x=1684649799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5ffUiM3M7NTUSgdHiwJ5XZXqrjEjLlNt36O7ostYWk=;
        b=FhZP9vkki3ss0SawuA1fnBfJfCyoAek156PtIVDeYVCQhvSsUsFVoa91w3a6GohKLY
         fvLvCE88VFNfACde0blSYwbyLbLyaJqyFwsbocTdHK0JaVtMMe6hL0jXthG/KjfRPiVP
         QtrtWffdNQcTME2MTnnldvNKP5vHNE4CcL7WUDbZrbJrqxNkmIkmxI1S17noHEtrEGmQ
         ga7OUKgeEmWfm/azJ/kjSxi2fzJFz9zdJHe+k1cQG84ilfy0SD7qwRsUCw4lIoPE+AtO
         waOLqoS8l4O11rJAnYUVGAbNcs9nGaHs1I79Nd15Zy1DcrwaUiwriVp2wuRvLIJwo7NM
         6Niw==
X-Gm-Message-State: AAQBX9dUgs8j/beCYTCJ3Y77tJZiEQ3hHHR6WpuG3O69wnpDqE3CdO/7
	xU8/WBWK4W7MS87eWDKupi15fsLt/c1tRMRiMhWcnw==
X-Google-Smtp-Source: AKy350ZexKT0FdkSUu7TV2c7ttWACVFUUKWEIojp3MuZ+qD5tK1QUFURvuyY/kflECcD05OtJMczaJGwujJYMNpQTZ0=
X-Received: by 2002:a25:245:0:b0:b92:2a33:c00 with SMTP id 66-20020a250245000000b00b922a330c00mr1663080ybc.24.1682057798787;
 Thu, 20 Apr 2023 23:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093457.18936-1-nylon.chen@sifive.com> <20230420093457.18936-3-nylon.chen@sifive.com>
 <CAJM55Z-smXpgL+QyTSeAWt=B-RS_qtbrFZtJpP-cQS0gsQnDSw@mail.gmail.com>
 <CAHh=Yk86AV542Y7wG6rkHTc4va1Gof3uXtj84zzK5m+khL_Aiw@mail.gmail.com> <CAJM55Z9TPVyJyWwWAS2FznSc8FvnR7qMxQ412eMzBkD=5abp6g@mail.gmail.com>
In-Reply-To: <CAJM55Z9TPVyJyWwWAS2FznSc8FvnR7qMxQ412eMzBkD=5abp6g@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 21 Apr 2023 14:16:20 +0800
Message-ID: <CAHh=Yk9mBDtFM4TRKEknNgrMN9qK4XtmPWLAT2E2P3RHwVh6ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, geert+renesas@glider.be, 
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_231641_097703_ABBF0A75 
X-CRM114-Status: GOOD (  30.62  )
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

SGkgRW1pbCwKCkVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5v
bmljYWwuY29tPiDmlrwgMjAyM+W5tDTmnIgyMOaXpQrpgLHlm5sg5LiL5Y2INjo0NuWvq+mBk++8
mgo+Cj4gT24gVGh1LCAyMCBBcHIgMjAyMyBhdCAxMjo0MSwgTnlsb24gQ2hlbiA8bnlsb24uY2hl
bkBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwgRW1pbAo+ID4KPiA+IEVtaWwgUmVubmVy
IEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiDmlrwgMjAyM+W5
tDTmnIgyMOaXpSDpgLHlm5sg5LiL5Y2INjowNOWvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBUaHUs
IDIwIEFwciAyMDIzIGF0IDExOjM1LCBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGBmcmFjYCB2YXJpYWJsZSByZXByZXNlbnRzIHRo
ZSBwdWxzZSBpbmFjdGl2ZSB0aW1lLCBhbmQgdGhlIHJlc3VsdCBvZgo+ID4gPiA+IHRoaXMgYWxn
b3JpdGhtIGlzIHRoZSBwdWxzZSBhY3RpdmUgdGltZS4gVGhlcmVmb3JlLCB3ZSBtdXN0IHJldmVy
c2UgdGhlCj4gPiA+ID4gcmVzdWx0Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHJlZmVyZW5jZSBpcyBT
aUZpdmUgRlU3NDAtQzAwMCBNYW51YWxbMF0KPiA+ID4gPgo+ID4gPiA+IExpbms6IGh0dHBzOi8v
c2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS8xYTgyZTYwMC0xZjkzLTRmNDEtYjJkOC04NmVk
OGIxNmFjYmFfZnU3NDAtYzAwMC1tYW51YWwtdjFwNi5wZGYgWzBdCj4gPiA+ID4KPiA+ID4gPiBB
Y2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4g
PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZl
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgOSAr
KysrKystLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiBpbmRleCAzOTNhNGI5N2Zj
MTkuLmQ1ZDVmMzZkYTI5NyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiBAQCAt
MTMyLDEzICsxMzIsMTMgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ID4gPiAgewo+ID4gPiA+ICAg
ICAgICAgc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKmRkYXRhID0gcHdtX3NpZml2ZV9jaGlwX3Rv
X2RkYXRhKGNoaXApOwo+ID4gPiA+ICAgICAgICAgc3RydWN0IHB3bV9zdGF0ZSBjdXJfc3RhdGU7
Cj4gPiA+ID4gLSAgICAgICB1bnNpZ25lZCBpbnQgZHV0eV9jeWNsZTsKPiA+ID4gPiArICAgICAg
IHVuc2lnbmVkIGludCBkdXR5X2N5Y2xlLCBwZXJpb2Q7Cj4gPiA+ID4gICAgICAgICB1bnNpZ25l
ZCBsb25nIGxvbmcgbnVtOwo+ID4gPiA+ICAgICAgICAgYm9vbCBlbmFibGVkOwo+ID4gPiA+ICAg
ICAgICAgaW50IHJldCA9IDA7Cj4gPiA+ID4gICAgICAgICB1MzIgZnJhYzsKPiA+ID4gPgo+ID4g
PiA+IC0gICAgICAgaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBQV01fUE9MQVJJVFlfSU5WRVJTRUQp
Cj4gPiA+ID4gKyAgICAgICBpZiAoc3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xBUklUWV9OT1JN
QUwgJiYgc3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xBUklUWV9JTlZFUlNFRCkKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIGN1
cl9zdGF0ZSA9IHB3bS0+c3RhdGU7Cj4gPiA+ID4gQEAgLTE1NCwxMCArMTU0LDEzIEBAIHN0YXRp
YyBpbnQgcHdtX3NpZml2ZV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCj4gPiA+ID4gICAgICAgICAgKiBjYWxjdWxhdGluZyB0aGUgcmVnaXN0ZXIg
dmFsdWVzIGZpcnN0IGFuZCB0aGVuIHdyaXRpbmcgdGhlbQo+ID4gPiA+ICAgICAgICAgICogY29u
c2VjdXRpdmVseQo+ID4gPiA+ICAgICAgICAgICovCj4gPiA+ID4gKyAgICAgICBwZXJpb2QgPSBt
YXgoc3RhdGUtPnBlcmlvZCwgZGRhdGEtPmFwcHJveF9wZXJpb2QpOwo+ID4gPgo+ID4gPiBIaSBO
eWxvbiwKPiA+ID4KPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGF0Y2guIFlvdSBpbnRy
b2R1Y2UgdGhpcyBuZXcgdmFyaWFibGUsCj4gPiA+IHBlcmlvZCwgYW5kIHNldCBpdCBoZXJlIGJ1
dCB5b3UgbmV2ZXIgc2VlbSB0byB1c2UgaXQuIElmIHlvdSBwbGFubmVkCj4gPiA+IHRvIHVzZSBp
dCBpbnN0ZWFkIG9mIHN0YXRlLT5wZXJpb2QgYmVsb3csIHdoeSBzaG91bGQgaXQgYmUgdGhlIG1h
eCBvZgo+ID4gPiB0aGUgb2xkIHBlcmlvZCBhbmQgd2hhdCBpcyByZXF1ZXN0ZWQ/IFdoYXQgaGFw
cGVucyBpZiB0aGUgY29uc3VtZXIKPiA+ID4gd2FudHMgdG8gbG93ZXIgdGhlIHBlcmlvZD8KPiA+
IFNvcnJ5IHRoaXMgd2FzIGFuIG92ZXJzaWdodCBvbiBteSBwYXJ0LCB0aGVyZSB3YXMgYSBsaW5l
IGNvcnJlY3Rpb24gdGhhdCBkaWRuJ3QgY2hhbmdlIHRvCj4gPiAtIGZyYWMgPSBESVY2NF9VNjRf
Uk9VTkRfQ0xPU0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+ID4gKyBmcmFjID0gRElWNjRfVTY0
X1JPVU5EX0NMT1NFU1QobnVtLCBwZXJpb2QpOwo+Cj4gSSBzZWUsIHNvIHRoZW4gbXkgc2Vjb25k
IHF1ZXN0aW9uIHdhcyB3aHkgcGVyaW9kIG5lZWRzIHRvIGJlIHRoZQo+IGxhcmdlciBvZiB0aGUg
cHJldmlvdXMgcGVyaW9kIGFuZCB0aGUgcmVxdWVzdGVkIHBlcmlvZC4KPgo+IFdoYXQgaGFwcGVu
cyBpZiB0aGUgcmVxdWVzdGVkIHBlcmlvZCwgc3RhdGUtPnBlcmlvZCwgaXMgbG93ZXIgdGhhbiB0
aGUKPiBvbGQgcGVyaW9kLCBkZGF0YS0+YXBwcm94X3BlcmlvZD8gVGhlbiB0aGUgcGVyaW9kIHdp
bGwgYmUgY2hhbmdlZCB0bwo+IHN0YXRlLT5wZXJpb2QgYmVsb3csIGJ1dCB0aGUgY2FsY3VsYXRp
b25zIHdpbGwgYmUgbWFkZSB1c2luZyBwZXJpb2QgPQo+IGRkYXRhLT5hcHByb3hfcGVyaW9kLCBy
aWdodD8KCllvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBBY2NvcmRpbmcgdG8gdGhlIG5l
dyBhbGdvcml0aG0gcHJvcG9zZWQKYnkgVXdlLCB0aGUgZ29hbCBpcyB0bzoKUGljayB0aGUgYmln
Z2VzdCBwZXJpb2QgbGVuZ3RoIHBvc3NpYmxlIHRoYXQgaXMgbm90IGJpZ2dlciB0aGFuIHRoZQpy
ZXF1ZXN0ZWQgcGVyaW9kLgo+Cj4gPiA+Cj4gPiA+IEFsc28gYWJvdmUgeW91IG5vdyBhbGxvdyBi
b3RoIFBXTV9QT0xBUklUWV9OT1JNQUwgYW5kCj4gPiA+IFBXTV9QT0xBUklUWV9JTlZFUlNFRCBi
dXQgeW91IHRyZWF0IGJvdGggY2FzZXMgdGhlIHNhbWUuCj4gPiBJIG1heSBoYXZlIG1pc3VuZGVy
c3Rvb2Qgd2hhdCBVd2UgbWVhbnMgaGVyZSwgSSB3aWxsIGNvbmZpcm0gYWdhaW4gaGVyZQo+ID4g
Pgo+ID4gPiAvRW1pbAo+ID4gPgo+ID4gPiA+ICAgICAgICAgbnVtID0gKHU2NClkdXR5X2N5Y2xl
ICogKDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpOwo+ID4gPiA+ICAgICAgICAgZnJhYyA9IERJ
VjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiA+ID4gLSAgICAg
ICAvKiBUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVyYXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCj4g
PiA+ID4gICAgICAgICBmcmFjID0gbWluKGZyYWMsICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRI
KSAtIDEpOwo+ID4gPiA+ICsgICAgICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBh
IDEwMCUgZHV0eSBjeWNsZSAqLwo+ID4gPiA+ICsgICAgICAgZnJhYyA9ICgxVSA8PCBQV01fU0lG
SVZFX0NNUFdJRFRIKSAtIDEgLSBmcmFjOwo+ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+ICAgICAg
ICAgbXV0ZXhfbG9jaygmZGRhdGEtPmxvY2spOwo+ID4gPiA+ICAgICAgICAgaWYgKHN0YXRlLT5w
ZXJpb2QgIT0gZGRhdGEtPmFwcHJveF9wZXJpb2QpIHsKPiA+ID4gPiAtLQo+ID4gPiA+IDIuNDAu
MAo+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
