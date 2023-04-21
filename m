Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61D3C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZrKJlwo1m/aP6A0jbSGtWv/Fp/Xn+dot2UcSqHZvt0=; b=ubHHTC4wQ079EQ
	O+LeKo/vBbj0L8i9wMGSUfny/7G6tsnCGAgTALmQro2FdQFJQFgXLvWnCxEj5UOrhVzowmTQCUvaC
	5DYVmy3zMR15jtHEyHTY+NbWn8NsfyFP3iN2LA53H6KYRPlOWHGCn5uaLHc5Wvx/C2QcJi80yeAR7
	fvlhrUOUol8RPMv675zYp5ApAI2VbK98oBaFjevW0QOkH1/dKsn7pHZzmoykGOVRRlZfAbXkJfI1b
	z9QiZKzluujrWbalX+b0nf9RrbHSgo0b2LnJ9M/I+djw+N2FMkQ+VdfJyQDgjfgERy4orPueF5tuV
	iQ2MRn2xPoETdix0AC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnih-00ARCL-2r;
	Fri, 21 Apr 2023 10:10:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnie-00AR6s-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 10:10:22 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E25C744279
	for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682071808;
	bh=5YumTTaZigtajWfQ+JzNYvW7LQCQxaN5lHA7qa2E8us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=j+e5NGC3uObO1sCdZ3zBW0dpGcGl5FoILA/RMy5wDW6IACxM21o/VbVMg7rbBe7q6
	 zK0l86sU1QVJin5DVy6DQLjKSDSoYf2hPK9uX9iST2ZA8zbUumPISquieCjYPj3BbD
	 wIAbtOtysVw8gYxuy9VJAbzDThEBqdHnUhiwmkWjAqMqJqtXx0AAzOQXLeuJMQol5Z
	 yaSq4dUqitE/himCEOSNZR1BOV0N/esdBqccQx0nXcGzGI5JKJAB+GMvAxln0maaWe
	 SaCRTC+BeQinNcdariLql6YHI/ptfOOuFGL4JSfKF/BeglRnOfjUybpHFgx8Xe5PuB
	 TYpySvIBIWGuQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-3e6996bd4a2so10916221cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 03:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071804; x=1684663804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YumTTaZigtajWfQ+JzNYvW7LQCQxaN5lHA7qa2E8us=;
        b=gbIlUnYlj+uV75f7ukbT2kK+qpSiOBmRLFFL6m6zSRoAMESFgZwpGLsN8qYpFQhCqS
         /nhMfvQnGh05socDFnqfQXpHikKDKqtuVDr0FDzRUbUqNnHEExLcJoGlqdqHyVGq0h56
         5/A2nKwGjEiO250y9ml679HZz185pBiItGnNMahEjr2PzqvYJeIVvM47Tzyrrf/wzO8J
         TIu+3fymMITdS4kFXQQ4UPSt6/CDgXEHOdQoXYNn0GAIHxp3GlvZHK9hV4ceOWyCf5uV
         ubwmfRrlsvGVrQUsecCBcyvWar5/JFm7v7u4G/8Vm5NRJlmcr8Y+0x1kl9JecdCcFw6b
         sTKw==
X-Gm-Message-State: AAQBX9cJcgkmDgtGzRralJIFAPybhqUdeAVIKelCToiXXdY3wXSlvSl+
	yR4gdOIbqT4UMeXiXYonEqlcz5Bkd9L4QpSDzIxnBTZQHtFIN6KdbsWpXbZlILFiYG+QzyOL5/Y
	+eOCT9ry7Z42leR+AreDn1Ci16rh1EYhJ6mbWmiDAY2/45afSiIb5Xg3tOzhXQQ==
X-Received: by 2002:a05:622a:1817:b0:3ec:48a3:d597 with SMTP id t23-20020a05622a181700b003ec48a3d597mr7349133qtc.60.1682071804362;
        Fri, 21 Apr 2023 03:10:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y2Ct3bKH9HpK7ssNl4cHQnZUXUWvdVJwevDhOvPemPOTtXGlc1hhOeSveMf1sjnhPC6kLUdb+2WAHj2K+Quqc=
X-Received: by 2002:a05:622a:1817:b0:3ec:48a3:d597 with SMTP id
 t23-20020a05622a181700b003ec48a3d597mr7349024qtc.60.1682071803038; Fri, 21
 Apr 2023 03:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230420093457.18936-1-nylon.chen@sifive.com> <20230420093457.18936-3-nylon.chen@sifive.com>
 <CAJM55Z-smXpgL+QyTSeAWt=B-RS_qtbrFZtJpP-cQS0gsQnDSw@mail.gmail.com>
 <CAHh=Yk86AV542Y7wG6rkHTc4va1Gof3uXtj84zzK5m+khL_Aiw@mail.gmail.com>
 <CAJM55Z9TPVyJyWwWAS2FznSc8FvnR7qMxQ412eMzBkD=5abp6g@mail.gmail.com> <CAHh=Yk9mBDtFM4TRKEknNgrMN9qK4XtmPWLAT2E2P3RHwVh6ww@mail.gmail.com>
In-Reply-To: <CAHh=Yk9mBDtFM4TRKEknNgrMN9qK4XtmPWLAT2E2P3RHwVh6ww@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 21 Apr 2023 12:09:47 +0200
Message-ID: <CAJM55Z_2HX6ja8axLWR+tiBbw=cUHXwaRwf=pE35dWLWV6pcGQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, geert+renesas@glider.be, 
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_031020_928858_0A62E97C 
X-CRM114-Status: GOOD (  33.77  )
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

T24gRnJpLCAyMSBBcHIgMjAyMyBhdCAwODoxNiwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZp
dmUuY29tPiB3cm90ZToKPgo+IEhpIEVtaWwsCj4KPiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1p
bC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4g5pa8IDIwMjPlubQ05pyIMjDml6UKPiDp
gLHlm5sg5LiL5Y2INjo0NuWvq+mBk++8mgo+ID4KPiA+IE9uIFRodSwgMjAgQXByIDIwMjMgYXQg
MTI6NDEsIE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IEhpLCBFbWlsCj4gPiA+Cj4gPiA+IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5l
ci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiDmlrwgMjAyM+W5tDTmnIgyMOaXpSDpgLHlm5sg5LiL
5Y2INjowNOWvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gT24gVGh1LCAyMCBBcHIgMjAyMyBhdCAx
MTozNSwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBUaGUgYGZyYWNgIHZhcmlhYmxlIHJlcHJlc2VudHMgdGhlIHB1bHNlIGluYWN0
aXZlIHRpbWUsIGFuZCB0aGUgcmVzdWx0IG9mCj4gPiA+ID4gPiB0aGlzIGFsZ29yaXRobSBpcyB0
aGUgcHVsc2UgYWN0aXZlIHRpbWUuIFRoZXJlZm9yZSwgd2UgbXVzdCByZXZlcnNlIHRoZQo+ID4g
PiA+ID4gcmVzdWx0Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSByZWZlcmVuY2UgaXMgU2lGaXZl
IEZVNzQwLUMwMDAgTWFudWFsWzBdCj4gPiA+ID4gPgo+ID4gPiA+ID4gTGluazogaHR0cHM6Ly9z
aWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzFhODJlNjAwLTFmOTMtNGY0MS1iMmQ4LTg2ZWQ4
YjE2YWNiYV9mdTc0MC1jMDAwLW1hbnVhbC12MXA2LnBkZiBbMF0KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+
ID4gPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZp
dmUuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNo
ZW5Ac2lmaXZlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvcHdtL3B3bS1z
aWZpdmUuYyB8IDkgKysrKysrLS0tCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+
ID4gPiBpbmRleCAzOTNhNGI5N2ZjMTkuLmQ1ZDVmMzZkYTI5NyAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCj4gPiA+ID4gPiBAQCAtMTMyLDEzICsxMzIsMTMgQEAgc3RhdGljIGludCBw
d21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2Ug
KnB3bSwKPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBwd21fc2lmaXZlX2Rk
YXRhICpkZGF0YSA9IHB3bV9zaWZpdmVfY2hpcF90b19kZGF0YShjaGlwKTsKPiA+ID4gPiA+ICAg
ICAgICAgc3RydWN0IHB3bV9zdGF0ZSBjdXJfc3RhdGU7Cj4gPiA+ID4gPiAtICAgICAgIHVuc2ln
bmVkIGludCBkdXR5X2N5Y2xlOwo+ID4gPiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgZHV0eV9j
eWNsZSwgcGVyaW9kOwo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcgbnVtOwo+
ID4gPiA+ID4gICAgICAgICBib29sIGVuYWJsZWQ7Cj4gPiA+ID4gPiAgICAgICAgIGludCByZXQg
PSAwOwo+ID4gPiA+ID4gICAgICAgICB1MzIgZnJhYzsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAg
ICAgIGlmIChzdGF0ZS0+cG9sYXJpdHkgIT0gUFdNX1BPTEFSSVRZX0lOVkVSU0VEKQo+ID4gPiA+
ID4gKyAgICAgICBpZiAoc3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xBUklUWV9OT1JNQUwgJiYg
c3RhdGUtPnBvbGFyaXR5ICE9IFBXTV9QT0xBUklUWV9JTlZFUlNFRCkKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIGN1
cl9zdGF0ZSA9IHB3bS0+c3RhdGU7Cj4gPiA+ID4gPiBAQCAtMTU0LDEwICsxNTQsMTMgQEAgc3Rh
dGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3
bV9kZXZpY2UgKnB3bSwKPiA+ID4gPiA+ICAgICAgICAgICogY2FsY3VsYXRpbmcgdGhlIHJlZ2lz
dGVyIHZhbHVlcyBmaXJzdCBhbmQgdGhlbiB3cml0aW5nIHRoZW0KPiA+ID4gPiA+ICAgICAgICAg
ICogY29uc2VjdXRpdmVseQo+ID4gPiA+ID4gICAgICAgICAgKi8KPiA+ID4gPiA+ICsgICAgICAg
cGVyaW9kID0gbWF4KHN0YXRlLT5wZXJpb2QsIGRkYXRhLT5hcHByb3hfcGVyaW9kKTsKPiA+ID4g
Pgo+ID4gPiA+IEhpIE55bG9uLAo+ID4gPiA+Cj4gPiA+ID4gSSBkb24ndCB1bmRlcnN0YW5kIHRo
aXMgcGF0Y2guIFlvdSBpbnRyb2R1Y2UgdGhpcyBuZXcgdmFyaWFibGUsCj4gPiA+ID4gcGVyaW9k
LCBhbmQgc2V0IGl0IGhlcmUgYnV0IHlvdSBuZXZlciBzZWVtIHRvIHVzZSBpdC4gSWYgeW91IHBs
YW5uZWQKPiA+ID4gPiB0byB1c2UgaXQgaW5zdGVhZCBvZiBzdGF0ZS0+cGVyaW9kIGJlbG93LCB3
aHkgc2hvdWxkIGl0IGJlIHRoZSBtYXggb2YKPiA+ID4gPiB0aGUgb2xkIHBlcmlvZCBhbmQgd2hh
dCBpcyByZXF1ZXN0ZWQ/IFdoYXQgaGFwcGVucyBpZiB0aGUgY29uc3VtZXIKPiA+ID4gPiB3YW50
cyB0byBsb3dlciB0aGUgcGVyaW9kPwo+ID4gPiBTb3JyeSB0aGlzIHdhcyBhbiBvdmVyc2lnaHQg
b24gbXkgcGFydCwgdGhlcmUgd2FzIGEgbGluZSBjb3JyZWN0aW9uIHRoYXQgZGlkbid0IGNoYW5n
ZSB0bwo+ID4gPiAtIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChudW0sIHN0YXRlLT5w
ZXJpb2QpOwo+ID4gPiArIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xPU0VTVChudW0sIHBlcmlv
ZCk7Cj4gPgo+ID4gSSBzZWUsIHNvIHRoZW4gbXkgc2Vjb25kIHF1ZXN0aW9uIHdhcyB3aHkgcGVy
aW9kIG5lZWRzIHRvIGJlIHRoZQo+ID4gbGFyZ2VyIG9mIHRoZSBwcmV2aW91cyBwZXJpb2QgYW5k
IHRoZSByZXF1ZXN0ZWQgcGVyaW9kLgo+ID4KPiA+IFdoYXQgaGFwcGVucyBpZiB0aGUgcmVxdWVz
dGVkIHBlcmlvZCwgc3RhdGUtPnBlcmlvZCwgaXMgbG93ZXIgdGhhbiB0aGUKPiA+IG9sZCBwZXJp
b2QsIGRkYXRhLT5hcHByb3hfcGVyaW9kPyBUaGVuIHRoZSBwZXJpb2Qgd2lsbCBiZSBjaGFuZ2Vk
IHRvCj4gPiBzdGF0ZS0+cGVyaW9kIGJlbG93LCBidXQgdGhlIGNhbGN1bGF0aW9ucyB3aWxsIGJl
IG1hZGUgdXNpbmcgcGVyaW9kID0KPiA+IGRkYXRhLT5hcHByb3hfcGVyaW9kLCByaWdodD8KPgo+
IFlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBBY2NvcmRpbmcgdG8gdGhlIG5ldyBhbGdv
cml0aG0gcHJvcG9zZWQKPiBieSBVd2UsIHRoZSBnb2FsIGlzIHRvOgo+IFBpY2sgdGhlIGJpZ2dl
c3QgcGVyaW9kIGxlbmd0aCBwb3NzaWJsZSB0aGF0IGlzIG5vdCBiaWdnZXIgdGhhbiB0aGUKPiBy
ZXF1ZXN0ZWQgcGVyaW9kLgoKUmlnaHQsIGFuZCB0byBiZSBjbGVhcjogdGhpcyBwYXRjaCBkb2Vz
bid0IGRvIHRoYXQuCgpJZiB0aGUgcHJldmlvdXMgcGVyaW9kIGluIGRkYXRhLT5hcHByb3hfcGVy
aW9kIGlzIGJpZ2dlciB0aGFuIHRoZQpyZXF1ZXN0ZWQgcGVyaW9kIGluIHN0YXRlLT5wZXJpb2Qs
IGl0IHdpbGwgZG8gdGhlIGZyYWMgY2FsY3VsYXRpb25zCndpdGggdGhlIG9sZCBwZXJpb2QsIGJ1
dCBzdGlsbCBzZXQgdGhlIHBlcmlvZCB0byB0aGUgc2hvcnRlciByZXF1ZXN0ZWQKcGVyaW9kLgoK
PiA+ID4gPgo+ID4gPiA+IEFsc28gYWJvdmUgeW91IG5vdyBhbGxvdyBib3RoIFBXTV9QT0xBUklU
WV9OT1JNQUwgYW5kCj4gPiA+ID4gUFdNX1BPTEFSSVRZX0lOVkVSU0VEIGJ1dCB5b3UgdHJlYXQg
Ym90aCBjYXNlcyB0aGUgc2FtZS4KPiA+ID4gSSBtYXkgaGF2ZSBtaXN1bmRlcnN0b29kIHdoYXQg
VXdlIG1lYW5zIGhlcmUsIEkgd2lsbCBjb25maXJtIGFnYWluIGhlcmUKPiA+ID4gPgo+ID4gPiA+
IC9FbWlsCj4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgbnVtID0gKHU2NClkdXR5X2N5Y2xlICog
KDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpOwo+ID4gPiA+ID4gICAgICAgICBmcmFjID0gRElW
NjRfVTY0X1JPVU5EX0NMT1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiA+ID4gPiA+IC0gICAg
ICAgLyogVGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhIDEwMCUgZHV0eSBjeWNsZSAqLwo+
ID4gPiA+ID4gICAgICAgICBmcmFjID0gbWluKGZyYWMsICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJ
RFRIKSAtIDEpOwo+ID4gPiA+ID4gKyAgICAgICAvKiBUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVy
YXRlIGEgMTAwJSBkdXR5IGN5Y2xlICovCj4gPiA+ID4gPiArICAgICAgIGZyYWMgPSAoMVUgPDwg
UFdNX1NJRklWRV9DTVBXSURUSCkgLSAxIC0gZnJhYzsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+Cj4g
PiA+ID4gPiAgICAgICAgIG11dGV4X2xvY2soJmRkYXRhLT5sb2NrKTsKPiA+ID4gPiA+ICAgICAg
ICAgaWYgKHN0YXRlLT5wZXJpb2QgIT0gZGRhdGEtPmFwcHJveF9wZXJpb2QpIHsKPiA+ID4gPiA+
IC0tCj4gPiA+ID4gPiAyLjQwLjAKPiA+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
