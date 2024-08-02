Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF6FC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkS9U/u7Z5CHcBZPDcv6jA6FHuN93qX/lyLDIHbrqy4=; b=LEk97Aq8Nk9mQL
	HFRjvQF/WrDgWRUcJZhvAh+d915VIru72sGRANZJtiErmuLPeDLgVVFsCH4O6OxtGRpBC5jPxoYQM
	cTnwnTP3j6di7aq5T0jRn1Z+UeIV6oWmRB2lKG5tQ9c6B43P3jIQ7AcKBK922XobFkQ44njN6b4az
	GsJZrSOCVOlLBj+PV4EzTLrz23NW/iAGDh4jCOPfCjjdrUdXBOUigqUMbdZnGgthK+kfYTRXQKN1T
	vG7zCCzs3nj6hry5mPGmkC92DUh55ODQiYwxqBXIH1RL1Cii/MmZCp4E1UuZpSAEmjZ+LPEy/RXbG
	Dt2eMVjrtb9XwLEQGX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZq3t-00000008c2j-3sK2;
	Fri, 02 Aug 2024 11:03:05 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZq3q-00000008c1F-2dRO
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 11:03:04 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-38f69f73966so14315835ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1722596581; x=1723201381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwUaUssVs29PUTspR4BzI9XA6uViKQGq2HqZKYi3CTc=;
        b=AefyZ+cm3CgfEIFpO1hUg3hBI0UCrESuX7WvqT74DL57LhwIGwXReeLbSAM/R8XNf9
         apZ0kgMVC1uytEaeh5Tet9OmcWmmJYyyFkg/dowcHkVnsMqMTF8jlgFPrm2O+Hm5xM1b
         MFcTGosJvSXlSafJ1+CJ+T6Tcdbb0ao3i0sTMohFnoeXQZvWxZvWPXl9t4VxdtH1EXza
         mLGK+jeUIceReDIgLwEsCOTqIEfqzyomUg2YGaaMinWjCY8N+/kdKRiUhvLpnksQ67fn
         8PG0Dx6SkSei3oelVHngzh/Vb3LxgtbmFsSR3c5aU2il/cM0gL6/0tMp2Dhi8lSUDTjc
         B/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596581; x=1723201381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwUaUssVs29PUTspR4BzI9XA6uViKQGq2HqZKYi3CTc=;
        b=bb3k/xUDD69xqZwGYfLyLfvBbFWtpbJvoNgTrivVDeppGWxgPBuCUj7XeWUW1cm5qh
         uWMxTqKuaFdq8wwNUfvecPdoIDAluXAtyTzOqAweyOJcAX7K6Pr9pVnwyWG/GYqop80Z
         7gpjV1beIVMdXpItOb+jVdql1k0ONlxubQiYcBdrD7qlv6VnbhQiNstKGh8k47gpYod9
         66DqxX6P7hozSED5PgFwxc2m7+xqKffcdfcNCmhoUYEkmE08Sn7+Nux2MU34nUIKi3uJ
         sb6lSpocBOsL/XQFAOpHI8+4VMb9zCUHg82k06v03j+OVBbJrpbstdxYUjTleT/O0kRZ
         G3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW05sDb5V56vrqT4bq+hUmma/Bm5uMVIDPWQGfvmud6Fm2zb3gZHToYE0PBGQp4nU2mI5E2ZbRNO12cgp/n2lXIWmgmsLbX+bUeiUGRn+H
X-Gm-Message-State: AOJu0YwoMETwiMT0UrOTuxlNBQvF70OSmMZouBttkfalDTOYksExvYob
	ZiMipFJAGTKNy0M2hyjLKJKQYj2iRtL9yp1gvQKM7rFZC9Ot0eC8QNMmZ/WHeDv3FuF+5Y5l6PU
	RpI0y1+C9+rsNoZeMqS4Kx7o2zybrmnsRK83DKfV9Rg+5s+nt
X-Google-Smtp-Source: AGHT+IH43E7Mfc6q5x718I3ZcYVbr40JWGwdK4O48RfeKEf97bzGFtbKMl5FOuQjZpif1eAkLPoTxnfBQkNOJQTgESk=
X-Received: by 2002:a92:6b08:0:b0:375:dc39:cfd2 with SMTP id
 e9e14a558f8ab-39b1fb92548mr37783595ab.11.1722596580822; Fri, 02 Aug 2024
 04:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240802075741.316968-1-vincent.chen@sifive.com>
In-Reply-To: <20240802075741.316968-1-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Aug 2024 16:32:48 +0530
Message-ID: <CAAhSdy3yx=mm3M6U_Q+_WdMs12SGCypPgNkBAVc9Kwn9jgev6g@mail.gmail.com>
Subject: Re: [PATCH] irqchip: let the probe of APLIC be earlier than IMSIC
To: Vincent Chen <vincent.chen@sifive.com>
Cc: tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_040302_877516_17EE1C32 
X-CRM114-Status: GOOD (  18.59  )
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxOjI34oCvUE0gVmluY2VudCBDaGVuIDx2aW5jZW50LmNo
ZW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHRoZSBkZWJ1ZyBtZXNzYWdlIG9mIGRyaXZl
ci9iYXNlL2RkLmMgaXMgZW5hYmxlZCwgdGhlIGZvbGxvd2luZwo+IGVycm9yIG1lc3NhZ2VzIGFy
ZSBwcmVzZW50IGluIHRoZSBib290IGxvZzoKPgo+IFsgICAgMC4yMDc5NDFdIHBsYXRmb3JtIGQw
MDAwMDAuYXBsaWM6IGVycm9yIC1FUFJPQkVfREVGRVI6IHN1cHBsaWVyCj4gMjgwMDAwMDAuaW1z
aWNzIG5vdCByZWFkeQo+IFsgICAgMC4yMDgxMTVdIHBsYXRmb3JtIGQwMDAwMDAuYXBsaWM6IEFk
ZGVkIHRvIGRlZmVycmVkIGxpc3QKCldlIGFyZSByZWx5aW5nIG9uIGZ3X2RldmxpbmsgaW1wbGVt
ZW50ZWQgYnkgTGludXggREQgY29yZSB0byBkbyB0aGUKcHJvYmUgb3JkZXJpbmcuIFRoZSBhYm92
ZSBwcm9iZXIgZGVmZXIgbWVzc2FnZSBpbXBsaWVzIHRoYXQgdGhlCkxpbnV4IEREIGNvcmUgaXMg
ZG9pbmcgaXRzIGpvYiBjb3JyZWN0bHkuCgo+Cj4gVGhlIHJlYXNvbiBmb3IgdGhpcyBlcnJvciBt
ZXNzYWdlIGlzIHRoYXQgdGhlIHByb2JlIG9mIEFQTElDIGlzIGV4ZWN1dGVkCj4gZWFybGllciB0
aGFuIElNU0lDLiBUaGlzIGVycm9yIGFsc28gY2F1c2VzIGFsbCB0aGUgcGxhdGZvcm0gZGV2aWNl
cwo+IGNvbm5lY3RlZCB0byB0aGUgQVBMSUMgdG8gYmUgYWRkZWQgdG8gdGhlIGRlZmVycmVkIGxp
c3QuIEJlY2F1c2UgYm90aAo+IEFQTElDIGFuZCBJTVNJQyBhcmUgcmVnaXN0ZXJlZCBieSBkZXZp
Y2VfaW5pdGNhbGwsIHRoaXMgcGF0Y2ggYWRqdXN0cyB0aGUKPiBjb21waWxlIG9yZGVyIG9mIEFQ
TElDIGFuZCBJTVNJQyB0byBlbnN1cmUgdGhhdCB0aGUgcHJvYmUgb2YgSU1TSUMgaXMKPiBleGVj
dXRlZCBlYXJsaWVyIHRoYW4gdGhlIHByb2JlIG9mIEFQTElDLgo+Cj4gU2lnbmVkLW9mZi1ieTog
VmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9p
cnFjaGlwL01ha2VmaWxlIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUg
Yi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiBpbmRleCAxNTYzNTgxMmIyZDYuLjNjMDk2NjY1
NjlkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiArKysgYi9kcml2
ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiBAQCAtOTYsOSArOTYsOSBAQCBvYmotJChDT05GSUdfUUNP
TV9NUE0pICAgICAgICAgICAgICAgICAgICAgICAgKz0gaXJxLXFjb20tbXBtLm8KPiAgb2JqLSQo
Q09ORklHX0NTS1lfTVBJTlRDKSAgICAgICAgICAgICAgKz0gaXJxLWNza3ktbXBpbnRjLm8KPiAg
b2JqLSQoQ09ORklHX0NTS1lfQVBCX0lOVEMpICAgICAgICAgICAgKz0gaXJxLWNza3ktYXBiLWlu
dGMubwo+ICBvYmotJChDT05GSUdfUklTQ1ZfSU5UQykgICAgICAgICAgICAgICArPSBpcnEtcmlz
Y3YtaW50Yy5vCj4gK29iai0kKENPTkZJR19SSVNDVl9JTVNJQykgICAgICAgICAgICAgICs9IGly
cS1yaXNjdi1pbXNpYy1zdGF0ZS5vIGlycS1yaXNjdi1pbXNpYy1lYXJseS5vIGlycS1yaXNjdi1p
bXNpYy1wbGF0Zm9ybS5vCj4gIG9iai0kKENPTkZJR19SSVNDVl9BUExJQykgICAgICAgICAgICAg
ICs9IGlycS1yaXNjdi1hcGxpYy1tYWluLm8gaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5vCj4gIG9i
ai0kKENPTkZJR19SSVNDVl9BUExJQ19NU0kpICAgICAgICAgICs9IGlycS1yaXNjdi1hcGxpYy1t
c2kubwo+IC1vYmotJChDT05GSUdfUklTQ1ZfSU1TSUMpICAgICAgICAgICAgICArPSBpcnEtcmlz
Y3YtaW1zaWMtc3RhdGUubyBpcnEtcmlzY3YtaW1zaWMtZWFybHkubyBpcnEtcmlzY3YtaW1zaWMt
cGxhdGZvcm0ubwoKRmlyc3Qgb2YgYWxsIHRoZXJlIGlzIG5vIGlzc3VlIGhlcmUuCgpTZWNvbmRs
eSwgY2hhbmdpbmcgY29tcGlsYXRpb24gb3JkZXIgaW4gTWFrZWZpbGUgdG8gaW5mbHVlbmNlCnRo
ZSBwcm9iZSBvcmRlciB3aWxsIG5vdCBoZWxwIGluIGFueSB3YXkuCgo+ICBvYmotJChDT05GSUdf
U0lGSVZFX1BMSUMpICAgICAgICAgICAgICArPSBpcnEtc2lmaXZlLXBsaWMubwo+ICBvYmotJChD
T05GSUdfU1RBUkZJVkVfSkg4MTAwX0lOVEMpICAgICArPSBpcnEtc3RhcmZpdmUtamg4MTAwLWlu
dGMubwo+ICBvYmotJChDT05GSUdfSU1YX0lSUVNURUVSKSAgICAgICAgICAgICArPSBpcnEtaW14
LWlycXN0ZWVyLm8KPiAtLQo+IDIuMzQuMQo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
