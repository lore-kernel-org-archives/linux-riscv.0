Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCE3C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 19:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKtOokdXc88yqfbjxFpdqc56ZrtInQ7XoCUVIsB1Qg0=; b=OnfBim/lrhCuzU
	XJ8mVHpkRT7S6hXySFaT1VWavHYjDYgQGyWln/FtyQHTr+HvPK/LjrYv/7fLAMM6DVDWlwZnuAxeU
	SDfZ+Q92MExh+FgH6kPdfTMd6oLrZHpAnflQDcx5No0yM74OBMT2yntMG3XlwdLRtDKmGwUg5APCD
	pXqxDW7i640boXo2zDH3Z+Oux/DGi5SvKnpnO4Ei10IpOB2X1Wt4m6avP+fxVlPxR++baPCR8N7qh
	/rxKz8rbrsS2n/2GFLd7I3BD8aVnE76a4+u7HCkj0dQi0RlXVdVDI9lBRLJ/f/9KAR4ZcQvNOir0o
	ESnoOOtWzXHCZg1YVk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG2Bx-000ksF-23;
	Wed, 20 Dec 2023 19:25:17 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG2Bv-000krE-1R
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 19:25:16 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d33574f64eso494877b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703100309; x=1703705109; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNmCP+oe3oSMVeft7bEuEgPHXSe736/+Mn6NnLSCe2I=;
        b=FVVchjXFrB5EOfJnKsvBRox9l2uUsAv9eDezMEbI/LoqNfpVv7BjE91bUyrMH7zlPL
         GBwryx+RPq2xF3zwrW0s2lP1djS4JMcdXa5TMxvYqCkaTNIsH1fGUE+MnizcZNL3ZgHz
         Cu3oQzR/d7nH3MSoRxkr/fnn3dHG25YjiO5ahYyyY51oB4HNq+Czh7yUFyvg+xnbJARq
         +5vbqtwe+1db8GworNk9EuCsi0vOMDOjwUqYHbYv0RCx7+tJ7jf8dg5zv+GYiRvLcmkO
         1JvMW7OHWzgm4g8tRE4YuujFK0zZXmH7mMNcuUNfd0iQFR7tD6rwOyMXGShabKlg6e+D
         Ridw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703100309; x=1703705109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNmCP+oe3oSMVeft7bEuEgPHXSe736/+Mn6NnLSCe2I=;
        b=ANZSKBiQ6l5Qqr6BHMSKLmx1H2IMIZFn+fY5upuRPVlS9ZvAotST2qeXsb+uXSm7E+
         rvdbLtPtLVBFUj+IKcCksbe8u7sjlJupeDov6pwCYU1QEX7VN0NnMy1qaA/oxnGUdp4x
         rBBbDBLxDcqgdxA5Nd+Dj/hspX3TJAvS5Dpbt+jXNLHHeBzRGfRmoRvOAmB8sJZWqz74
         sZtcx0J7sy3Kvd/CLPpwHRQUeqYeqNuzgoRAi5IyKiMsMI5jnZNXA0/yesKIUb9taixA
         4qMHPWU/bfDlOjizMDpmCHGMrTBrkciQ7zPFoKLX83YtjpApT7RlqlfIi9OtU6ld6ROE
         /qcg==
X-Gm-Message-State: AOJu0YwHyRLB3SLugMb1pYRVER/9bWsy6+cczlqX57mF5UUYY+Hwupp8
	5tygA7aT7haZGQbKGK1fNSV5UEI8ErfjOOcRnwr5SA==
X-Google-Smtp-Source: AGHT+IHKQoxOSx/75Yu3bPfICRilkmmatfOTZGCwh6ZIG0MIHwmi1SgmuqkGllO5XCdAmaUsxQDOtWdj3LD1JcBG/pk=
X-Received: by 2002:a0d:d80a:0:b0:5e2:a469:71b6 with SMTP id
 a10-20020a0dd80a000000b005e2a46971b6mr258824ywe.4.1703100309747; Wed, 20 Dec
 2023 11:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
 <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
 <20231215202137.GA317624-robh@kernel.org> <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
In-Reply-To: <CAJM55Z9pBpYfwpxPH7bUumuosVDn9DHLSBngW6CtG7aK_z+_bQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 20:24:58 +0100
Message-ID: <CACRpkdYT+jf4=dk3Y9cwa_=aYCihVq93N-iT0RUbtT2-+PX69w@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_112515_490431_72096DC7 
X-CRM114-Status: GOOD (  11.66  )
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

T24gU2F0LCBEZWMgMTYsIDIwMjMgYXQgMjo1N+KAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKCj4gPiA+ICsgICAgICAg
ICAgdGhlYWQsc3Ryb25nLXB1bGwtdXA6Cj4gPiA+ICsgICAgICAgICAgICBvbmVPZjoKPiA+ID4g
KyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuCj4gPiA+ICsgICAgICAgICAgICAgIC0gJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiA+ICsgICAgICAg
ICAgICAgICAgZW51bTogWyAwLCAyMTAwIF0KPiA+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9u
OiBFbmFibGUgb3IgZGlzYWJsZSBzdHJvbmcgMi4xa09obSBwdWxsLXVwLgo+ID4KPiA+IGJpYXMt
cHVsbC11cCBjYW4gYWxyZWFkeSBzcGVjaWZ5IHRoZSBzdHJlbmd0aCBpbiBPaG1zLgo+Cj4gVGhl
IHN0cm9uZyBwdWxsIHVwIGlzIGEgc2VwYXJhdGUgYml0IHRoYXQgY2FuIGJlIGVuYWJsZWQgaW5k
ZXBlbmRlbnRseSBmcm9tIHRoZQo+IHJlZ3VsYXIgcHVsbC11cC9kb3duLCBzbyBpbiB0aGVvcnkg
eW91IGNvdWxkIGVuYWJsZSBib3RoIHRoZSByZWd1bGFyIHB1bGwtdXAKPiBhbmQgdGhlIHN0cm9u
ZyBwdWxsLXVwIGF0IHRoZSBzYW1lIHRpbWUsIG9yIGV2ZW4gdGhlIHJlZ3VsYXIgcG9sbC1kb3du
IGFuZCB0aGUKPiBzdHJvbmcgcHVsbC11cCB3aGljaCBpcyBwcm9iYWJseSBub3QgYWR2aXNlZC4K
CmJpYXMtcHVsbC11cDsgPC0gSnVzdCByZWd1bGFyIHB1bGxpbmcgdXAgdGhlIG9yZGluYXJ5CmJp
YXMtcHVsbC11cCA9IDwxMDA+OyA8LSBTYW1lIHRoaW5nIGlmIHRoZSBvcmRpbmFyeSBpcyAxMDAg
T2htIChmaWd1cmUgb3V0IHdoYXQKICByZXNpc3RhbmNlIGl0IGFjdHVhbGx5IGlzLi4uLikKYmlh
cy1wdWxsLXVwID0gPDIxMDAwMDAwPjsgPC0gc3Ryb25nIHB1bGwgdXAKYmlhcy1wdWxsLXVwID0g
PDIxMDAwMTAwPjsgPC0gYm90aCBhdCB0aGUgc2FtZSB0aW1lCgo+IFNvIHRoZSBpZGVhIGhlcmUg
d2FzIGp1c3QgdG8gbWFrZSBzdXJlIHRoYXQgeW91IGNhbiBkbyBlZy4KPgo+ICAgICAgICAgdGhl
YWQsc3Ryb25nLXB1bGwtdXAgPSA8MD47Cj4KPiB0byBtYWtlIHN1cmUgdGhlIGJpdCBpcyBjbGVh
cmVkLgoKTm8gdXNlIGJpYXMtZGlzYWJsZTsgZm9yIHRoaXMuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
