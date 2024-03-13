Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0EFC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTmJNevATF+VUQVew7ijEDn9FO8+Q1DiZHeKbthg0B8=; b=Uq1Oobfxr0sc4f
	/m86w9AVOtUuh+CTVGfD2e7Hz7s++C7NoK7fUHalXA9JayC3GfS/ijOAoOlNNH3DLz/icVJbBlF3l
	Y8hgzh9sejNkV9awMM1zQSnyO0AUZVpAV5j++rnPQFNYscgN4DLEWxIgKMjrgNzQhGMnAudCscpdy
	qT7+YXnoR8nNi9YepFJ6HoDqOdZUhE0SGVedpgXZlRpW1/bGXaHanw29ZIHjSXSfE0VTEw39IVcWI
	uKYspRQNP7DXN50afrBZKubx+mw8ue38yjWBFB3p5XFSWRl7+avcMmAAUcCDcCobYamg2Ns4DaX7S
	OJakadsHmYyPRBl3SaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRuQ-0000000At9l-3Ep6;
	Wed, 13 Mar 2024 16:56:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRuN-0000000At7s-2c8h
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 16:56:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so1943468a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710349007; x=1710953807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnASLn79U4WGz9JzJ9spFueWfH+H8v408Rks+XnoEx0=;
        b=ifPIjvFe5WYQ7rTZ9cuez9Sd+p4zLY9fSUlq4csCl+9hHtBQEUUp5ES5L2Y67sp0v8
         cKDfprv/NXKDJs0diiCh+h2otvQS7duhZeyc/aS+mCeqiUiimmsT46euIHxGZJLt5yTQ
         uFdeD6dsKotpMlAEK0jHYV3wmwEsR3ajg9jstFaCEP/LsP9lW6hDm9t+5wFKZ2gZK/AJ
         J19VxYRl+n/IS3Ax2nGhQTWJg9ibgydSWeqPVfzLtys+dL4pVYrJ3rmYshVvhxXzTH8R
         li/1Ch3TpefwIitJQvSIcdfli9XsIW+mBTDzDWtJN53edDiccpdoui7T3Jz6m56qI9cQ
         t7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710349007; x=1710953807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnASLn79U4WGz9JzJ9spFueWfH+H8v408Rks+XnoEx0=;
        b=BnhgbeTHwUUg3k1/cZRkneCiutT6+fJ8ZqUvxGc3pvKWMEw8DrbwkFDsCvJOlU6QfT
         bHJMbvp5xBqYZNC9/lsBirVzDaTBFknqx2eE192NjGCcQN9NrJrkK4w8saCd0rltf2mf
         RXJyiTZHT3fMIGYQSEbNjFtoKh3b8yr/6R8mufhub+7gJNoYw9AiC8iPYVpTzljU56IL
         i3sRrNVCU3/HcVYwwRF+QKn7c3NOCtrDE3GwOFLOdYeDHfGhPbBjjoVuaugyF0pijEUb
         l+noliPe5Ogd1+iCG+fDk0Ke+2h+Es3ACxWCmxlhxqO+kf1h55Um0uwrqgjBCJdmyNXo
         fOKg==
X-Forwarded-Encrypted: i=1; AJvYcCVqey4Ov1QTPiww/bGF/zlF42xNo9eynlfo/N/PtAssCcyUmt97O7PLPWHP93boPV8bW2luDyfTjprGf48ugTZemG3DyT/ZIJN7JpiAR4v7
X-Gm-Message-State: AOJu0YxH+09Z8lJ0roKhAcFIi/gXHSq5NlUZEBjeCP7kEYdmXzl/3wnf
	DjYzmFJFwAcjFqRPMrIgCypLYuRTOU+lmkUIPtqdBDOw0J27UP59wIvbz4CK7rGkTUUIo4rL/N9
	nSvKg5m+StaJQULsmqS7z6wJ/hqfxtegYZ7qwZA==
X-Google-Smtp-Source: AGHT+IGAWCdriqwQt4fquJ5lVPudGaCw84ttjE5f4cmiXdhI+Vq9G5yeSx/uppOW3n2GUCQumVwuspfbuTrqt1TjipA=
X-Received: by 2002:a17:906:5945:b0:a45:7936:d09e with SMTP id
 g5-20020a170906594500b00a457936d09emr2761316ejr.19.1710349007188; Wed, 13 Mar
 2024 09:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240312193306.1814593-1-samuel.holland@sifive.com>
In-Reply-To: <20240312193306.1814593-1-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Mar 2024 22:26:34 +0530
Message-ID: <CAK9=C2Vsq0iN5FW=zC7+2GHe115TPJOEEPcDCLs_40yBGpbVdw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-riscv: Drop extra CSR write
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_095651_682900_1CC0F753 
X-CRM114-Status: GOOD (  16.34  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMTowM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIHJpc2N2MzIsIHRoZSB0aW1lIGNvbXBh
cmF0b3IgdmFsdWUgaXMgc3BsaXQgYWNyb3NzIHR3byBDU1JzLiBXZSB3cml0ZQo+IGJvdGggd2hl
biBzdG9wcGluZyB0aGUgdGltZXIsIGJ1dCByZWFsaXN0aWNhbGx5IHRoZSB0aW1lIGlzIGp1c3Qg
YXMKPiB1bmxpa2VseSB0byByZWFjaCAweGZmZmZmZmZmMDAwMDAwMDAgYXMgMHhmZmZmZmZmZmZm
ZmZmZmZmLCBzbyB0aGVyZSBpcwo+IG5vIG5lZWQgdG8gd3JpdGUgdGhlIGxvdyBDU1IuCgpFdmVu
IHRob3VnaCB1bmxpa2VseSwgdGhlcmUgaXMgc3RpbGwgYSB0aGVvcmV0aWNhbCBwb3NzaWJpbGl0
eSBvZgpjb3VudGVyIHJlYWNoaW5nIHZhbHVlIDB4ZmZmZmZmZmYwMDAwMDAwMC4KClRoZSBnb29k
IHRoaW5nIGFib3V0IHZhbHVlIDB4ZmZmZmZmZmZmZmZmZmZmZiBpcyB0aGF0IHRoZSBjb3VudGVy
IHdpbGwKaW1tZWRpYXRlbHkgd3JhcCBhcm91bmQgYWZ0ZXIgcmVhY2hpbmcgaXQuCgpSZWdhcmRz
LApBbnVwCgoKPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgo+IC0tLQo+Cj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3Yu
YyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9k
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBpbmRleCBlNjZkY2JkNjY1NjYuLmVh
YWYwMWYzYzM0YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2
LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiBAQCAtMzUsOSAr
MzUsMTAgQEAgc3RhdGljIGJvb2wgcmlzY3ZfdGltZXJfY2Fubm90X3dha2VfY3B1Owo+ICBzdGF0
aWMgdm9pZCByaXNjdl9jbG9ja19ldmVudF9zdG9wKHZvaWQpCj4gIHsKPiAgICAgICAgIGlmIChz
dGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3Zfc3N0Y19hdmFpbGFibGUpKSB7Cj4gLSAgICAgICAg
ICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIFVMT05HX01BWCk7Cj4gICAgICAgICAgICAg
ICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlKENTUl9TVElNRUNNUEgsIFVMT05HX01BWCk7Cj4gKyAgICAgICAgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBV
TE9OR19NQVgpOwo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgc2JpX3NldF90
aW1lcihVNjRfTUFYKTsKPiAgICAgICAgIH0KPiAtLQo+IDIuNDMuMQo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
