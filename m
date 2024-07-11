Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CDC3271E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 06:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WrPZGrttiIsd5hHNEIvycyCQo4CVFPa9S0rAcgK+qoA=; b=E+/epTnQnJQ3/kP/WmAr74bZ4D
	gwZuiNj38SwB0+I7DR4tGFbTyHxFn7OfTB8gGpxM8r/Ec74SqjpVE2RatGSXxOoh1YwLnvvzPdcx1
	oJLJcvihAP8nsdHSPtAi03GryV/8lVmmpmG2lE+x0dnTnrCvhUt1A09S1uqXRx3jznGp7mFWKgIHJ
	IdNQUb1YTFdVFlhHbFK7tto5Q+CURdiG2Su0W+/WReABfTCQOgQ6EqMwwJk85il2tIpdpkr0CzE56
	Gfq/3eSxvXy6k6tQRTZ/IDNxoNlkPiY9DpyB7+yKY1oYqleZycNfKiC+tnFQj0pLBdf9SdKsXvGN9
	1mUTHn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn0V-0000000CrAX-2Aqw;
	Thu, 11 Jul 2024 06:10:19 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRn0E-0000000Cr3w-3a2q
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 06:10:04 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-25e400d78b0so197328fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 23:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1720678195; x=1721282995; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3M3PfsAx3vPU+NiI8uq0uabDA7M3koOLeB2Wv0JEvM=;
        b=ACpFLCQKDpoleZ1+BnFga8VtHEsGMvh5tDN3NU1Xm99++L8CrAoKyQNJWuiiNWfPrd
         g461iwXp9Dfk2UOgMtM9KOtNqA4w88B/ojmK9Oe5CFQjznbllQRkA+uGrrFREY4Ny6uz
         kSo9ikjiDtn3Id+Za+nGRe/AQ4mp9iDu0ET5xaT20/RLotyc8p02/Fl81T43/sAhTSf0
         yozGW0x5cLTi7SyNutWJbI1trRxscMW2OmlM4Q9IaB29nf1DaMgWfEBEbJ1oHQMCDO53
         BwVDQ5uGlTiy6Li7NSRnc681yL/jtsFKPvFgezeg+uViUJg0aKeAx2XkdJQyf03kIntw
         WLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720678195; x=1721282995;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3M3PfsAx3vPU+NiI8uq0uabDA7M3koOLeB2Wv0JEvM=;
        b=UJVnSMLin+AjMwM1eXayG4oOPsqILbcnXjZIDE2riQG9vt2lgTfMLL1vU3xWTpP0Vb
         f1xtarLiiV1i3unTAgMk7N/9wuxytNhgiSL/ThmunnDIJUcoYORuSEOaw3MXlUeFCQp8
         ZUke5OB3Qbvbi67+Us8xLFQCK1pLglpXowQGA2V3cRI8XDPS6J8L4XJVgpJPZCVy4RJo
         BsiZ1BygedSR/i2r5E1ZZtD8iXsj/iiScAH5TD5RW4TyQgi4WdGzy/NsXH0Pszy91qwu
         zFUcy/1K/V4R1ZJIOJjIP8QiI/ZQ4EsFghkhWb8ZOxgYJOwyM5w5aZn5ljQf4fHwTZUn
         o9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ehNd0jc3YuIjkGpxeq8yFQaxQudBDCOWTB3ji1kE/zr5VU0AvhcGuoQJTdRGPOxZ9qbe+qfrmJT4KBMSlUVDAxtCGSa00vuW0y/RULGr
X-Gm-Message-State: AOJu0Yw0rQ3ghi4YPV/5wvS2G9IPYfiTobBi2bTv2poX2cAlPHJH3gl9
	nHQdUa25raPGdsmPbuvarT/nGUR7eVBllqpr2V09WIuAWKgZArWWYJExvcZpD69ktqKJCUz3q3V
	poOqdwc9YqL8tzj/7zMVFT5VFTAN0g910w9jLuQ==
X-Google-Smtp-Source: AGHT+IHcN2m9lFqoH4GP+4D/ntqMBI1+rK9QIx5yDML85z8OJGfON1bRuawj96Ajf6+pi5K2TF5PNmy5hlvmlangqPw=
X-Received: by 2002:a05:6870:658f:b0:25e:2956:4b8b with SMTP id
 586e51a60fabf-25eaec074damr5991249fac.39.1720678194836; Wed, 10 Jul 2024
 23:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240625030502.68988-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240625030502.68988-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 11 Jul 2024 14:09:43 +0800
Message-ID: <CAEEQ3wnrdRcBdevQDGQ-5dr3aO1ura13_VskMYm8ySTZJTiYhw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Randomize lower bits of stack address
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, andy.chiu@sifive.com, alexghiti@rivosinc.com, 
	conor.dooley@microchip.com, bjorn@rivosinc.com, sorear@fastmail.com, 
	cleger@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_231003_263526_F8FA773C 
X-CRM114-Status: GOOD (  15.57  )
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

QWRkIHB1bml0IGluIHRoZSBsb29wLgoKCk9uIFR1ZSwgSnVuIDI1LCAyMDI0IGF0IDExOjA14oCv
QU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSW1wbGVt
ZW50IGFyY2hfYWxpZ25fc3RhY2soKSB0byByYW5kb21pemUgdGhlIGxvd2VyIGJpdHMKPiBvZiB0
aGUgc3RhY2sgYWRkcmVzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1
aUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaCB8
IDggKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jICAgfCA5ICsrKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXhlYy5oCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9leGVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4ZWMuaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wN2Q5OTQyNjgyZTAK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9leGVjLmgKPiBA
QCAtMCwwICsxLDggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSAqLwo+ICsKPiArI2lmbmRlZiBfX0FTTV9FWEVDX0gKPiArI2RlZmluZSBfX0FTTV9FWEVDX0gK
PiArCj4gK2V4dGVybiB1bnNpZ25lZCBsb25nIGFyY2hfYWxpZ25fc3RhY2sodW5zaWduZWQgbG9u
ZyBzcCk7Cj4gKwo+ICsjZW5kaWYgLyogX19BU01fRVhFQ19IICovCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+
IGluZGV4IGU0YmM2MWM0ZTU4YS4uZTMxNDJkOGE2ZTI4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+
IEBAIC0xNSw2ICsxNSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC90aWNrLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9wdHJhY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L3BlcnNvbmFsaXR5Lmg+Cj4KPiAgI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KPiAg
I2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiBAQCAtMjYsNiArMjcsNyBAQAo+ICAjaW5jbHVk
ZSA8YXNtL2NwdWlkbGUuaD4KPiAgI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiAgI2luY2x1ZGUg
PGFzbS9jcHVmZWF0dXJlLmg+Cj4gKyNpbmNsdWRlIDxhc20vZXhlYy5oPgo+Cj4gICNpZiBkZWZp
bmVkKENPTkZJR19TVEFDS1BST1RFQ1RPUikgJiYgIWRlZmluZWQoQ09ORklHX1NUQUNLUFJPVEVD
VE9SX1BFUl9UQVNLKQo+ICAjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3IuaD4KPiBAQCAt
OTksNiArMTAxLDEzIEBAIHZvaWQgc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAg
ICAgICAgICAgICAgICBkdW1wX2JhY2t0cmFjZShyZWdzLCBOVUxMLCBLRVJOX0RFRkFVTFQpOwo+
ICB9Cj4KPiArdW5zaWduZWQgbG9uZyBhcmNoX2FsaWduX3N0YWNrKHVuc2lnbmVkIGxvbmcgc3Ap
Cj4gK3sKPiArICAgICAgIGlmICghKGN1cnJlbnQtPnBlcnNvbmFsaXR5ICYgQUREUl9OT19SQU5E
T01JWkUpICYmIHJhbmRvbWl6ZV92YV9zcGFjZSkKPiArICAgICAgICAgICAgICAgc3AgLT0gZ2V0
X3JhbmRvbV91MzJfYmVsb3coUEFHRV9TSVpFKTsKPiArICAgICAgIHJldHVybiBzcCAmIH4weGY7
Cj4gK30KPiArCj4gICNpZmRlZiBDT05GSUdfQ09NUEFUCj4gIHN0YXRpYyBib29sIGNvbXBhdF9t
b2RlX3N1cHBvcnRlZCBfX3JlYWRfbW9zdGx5Owo+Cj4gLS0KPiAyLjIwLjEKPgoKVGhhbmtzLApZ
dW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
