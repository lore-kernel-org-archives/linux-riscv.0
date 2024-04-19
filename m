Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D4C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 03:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYpWrEa4A10MgyC6/LhXBU/FkBe3sJJNw8CYnLljdGk=; b=QvepctgxBySL+Z
	sZKt0f8zuC0oxlkf6mmtW8VdeQe5CZKlHmj2CiMuaSmemrOoJQ5WWqf4j+WTNdCGqCEvWZQqGXQ8+
	ewQaI8aY20cauHpwwnyuLWnn7LDYqpdCXxa8rj6WZ8yR1PKX0yyMnl02AyTBtFyPgc8IMjz/WILzY
	fQfyBdFzvra0HPKDKCro8YeC3RWDFcTYN0ygR7LJb2O06By/6o5nRPxPILnYUXy7AjpekF4iAO8DB
	7Gj2KX5ck4Op64glNj0a0SB+8ndZRPmOiidL4J/sW7DjlXql4tDOsZkh2k/BkhaBAy5QYvtkxuX4s
	4fflGQRo2jLHdzpvz5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxfAy-00000004GXU-0KD0;
	Fri, 19 Apr 2024 03:44:36 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxfAv-00000004GVS-1zj0
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 03:44:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad2so22644381fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713498271; x=1714103071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59eYF0u+KHXci6ueGoBTWn76Rd/IwCXlgjf8EG+Fo2M=;
        b=AsnfohR3DXkKquavvAynIkHMekCczUPicMP/Ce7A4LjApsRz1d0waugPTNDcllY3nF
         LoSR3dhtZsiIKFhTDMsxE8ag93Egshz+YJLKfYp0In1zC9Nneyfw3llJWokpjjIoR9vn
         rl18iH7OCAYIbv3x85Sz68E+OKc/fTuhtv9YDTNSasVXF/2i0pBte6oAP/DUb31Wj2fe
         9SfG7D7+hSZI6yZdEBkEdV3ZofTqXTtiXj2wGYYgzhFmQvAy1X4uTd/BOefNQhKXQBg6
         uJw6as1w4oZNBjDWNmsMj60Y6ZwnYtVshb+HyjQrLzRvzH2qsn6boW8JoN+RFnIztX0H
         J6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713498271; x=1714103071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59eYF0u+KHXci6ueGoBTWn76Rd/IwCXlgjf8EG+Fo2M=;
        b=Z2IFvzWpBGuH/OMI7J/ZE6umHp5iLCRXKpV/d7Sg1zt7YRLalraHU0P5H/+1SQ+Wqd
         DLGv/6KufgngObJXm/qTJ4PBwlwt0Vz5LSMzgkY8YjT3bjUhHj32+ABKnFoDAZy3ThMs
         3FB5TcPj1NgA/iH8dtDXC9tfWGcS/gHHCcoN7QwU48gX4z3T5MFCfXZUlOfaIkXJe1zO
         GnM+u99YuOpq6Qv/iHlol0su9EJPjhFwiIXKYT9Uc+hmM5mvIgOFBCBhegZAVVelljBL
         5RG4aeO/+w3EsdBWBQaa7quy0M4BH8h5yXY47Aa40PAvZ2NhczsxmnFJiZevEZUMNjmZ
         dzYA==
X-Forwarded-Encrypted: i=1; AJvYcCXlme8TiWSTLJC2qJJr3kQNU7MiKSTi8vFsteffkTd99Tqmk7du8wfWUqgHk42YSRqJ9rQ4EF4NkQ6mdIj5KWy8UmUt5TABs/ujY1HJJDIf
X-Gm-Message-State: AOJu0Yxo01vAve7wLiv0EMJBXYSsaSQjAFvoslMHGebJVW4098Z9vAEH
	GGfqC/0NG4RFS47Aa+AJz2wa5itWWDcOWGCUiveagowNESYgocmNJ9bLNVt1FrtO9oQPM/Ingwf
	deJzv5w8bFQoc9Io/X+T0ttAmtSNaGFaaoJ6H0A==
X-Google-Smtp-Source: AGHT+IEQ1nOTIaXbh09m8UHlh64BO9dHozTEjgG2j/nOYUiToab5kcFClQw0X6CWz9u70VD9qgte/ljjyg+KRIaCWds=
X-Received: by 2002:a2e:9a99:0:b0:2d6:ff04:200f with SMTP id
 p25-20020a2e9a99000000b002d6ff04200fmr430328lji.33.1713498270564; Thu, 18 Apr
 2024 20:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240307140307.646078-1-apatel@ventanamicro.com>
 <20240307140307.646078-3-apatel@ventanamicro.com> <8738cb85-fac1-4a15-9666-eb05316f5368@gmail.com>
In-Reply-To: <8738cb85-fac1-4a15-9666-eb05316f5368@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Apr 2024 09:14:18 +0530
Message-ID: <CAK9=C2X+Aovid=AFXP-EOj3-f6xDYiGsMMNOqknFr58nu5dgbw@mail.gmail.com>
Subject: Re: [PATCH v16 2/9] irqchip: Add RISC-V incoming MSI controller early driver
To: Eric Cheng <eric.cheng.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_204433_608267_F569AE49 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgODo1M+KAr0FNIEVyaWMgQ2hlbmcgPGVyaWMuY2hlbmcu
bGludXhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDMvNy8yMDI0IDEwOjAzIFBNLCBBbnVwIFBh
dGVsIHdyb3RlOgo+Cj4gPiArc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICpnbG9iYWwsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiAqbnJfcGFyZW50X2lycXMsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiAqbnJfbW1pb3MpCj4gPiArewo+Cj4g
Li4uCj4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBGaW5kIGZpcnN0IGJpdCBwb3NpdGlvbiBv
ZiBncm91cCBpbmRleC4KPiA+ICsgICAgICAqIElmIG5vdCBzcGVjaWZpZWQgYXNzdW1lZCB0aGUg
ZGVmYXVsdCBBUExJQy1JTVNJQyBjb25maWd1cmF0aW9uLgo+ID4gKyAgICAgICovCj4gPiArICAg
ICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2RlKSwgInJpc2N2LGdy
b3VwLWluZGV4LXNoaWZ0IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmds
b2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQpOwo+ID4gKyAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAg
ICAgICBnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0ID0gSU1TSUNfTU1JT19QQUdFX1NISUZUICog
MjsKPiA+ICsKPiA+ICsgICAgIC8qIEZpbmQgbnVtYmVyIG9mIGludGVycnVwdCBpZGVudGl0aWVz
ICovCj4gPiArICAgICByYyA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHRvX29mX25vZGUoZndub2Rl
KSwgInJpc2N2LG51bS1pZHMiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
Z2xvYmFsLT5ucl9pZHMpOwo+Cj4gV2lsbCBoZXJlIGNoZWNrIGlmIHRoZSBwYXNzLWluIGludGVy
cnVwdCBpZGVudGl0eSBudW1iZXIgaXMgKG11bHRpLTY0IC0xKSAmJgo+IGJldHdlZW4gWzYzLCAy
MDQ3XT8KPiBQZXIgc3BlYyBBSUEgdjEuMCwgU2VjLiAzLjEgSW50ZXJydXB0IGZpbGVzIGFuZCBp
bnRlcnJ1cHQgaWRlbnRpdGllczoKPiAiVGhlIG51bWJlciBvZiBpbnRlcnJ1cHQgaWRlbnRpdGll
cyBzdXBwb3J0ZWQgYnkgYW4gaW50ZXJydXB0IGZpbGUgKGFuZCBoZW5jZQo+IHRoZSBudW1iZXIg
b2YgYWN0aXZlCj4gYml0cyBpbiBlYWNoIGFycmF5KSBpcyBvbmUgbGVzcyB0aGFuIGEgbXVsdGlw
bGUgb2YgNjQsIGFuZCBtYXkgYmUgYSBtaW5pbXVtIG9mCj4gNjMgYW5kIGEgbWF4aW11bQo+IG9m
IDIwNDcuIgoKVGhlcmUgaXMgYWxyZWFkeSBhIGNoZWNrIG9uIGdsb2JhbC0+bnJfaWRzIHRvIGVu
c3VyZSB0aGUgYWJvdmUgaXMgc2F0aXNmaWVkLgpQbGVhc2Ugc2VlIGZ1cnRoZXIgYmVsb3cgaW4g
aW1zaWNfcGFyc2VfZndub2RlKCkgZnVuY3Rpb24uCgo+Cj4gPiArICAgICBpZiAocmMpIHsKPiA+
ICsgICAgICAgICAgICAgcHJfZXJyKCIlcGZ3UDogbnVtYmVyIG9mIGludGVycnVwdCBpZGVudGl0
aWVzIG5vdCBmb3VuZFxuIiwgZndub2RlKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
ID4gKyAgICAgfQo+ID4gKwo+IC4uLgo+Cj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
