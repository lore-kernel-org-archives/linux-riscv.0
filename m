Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E8C021B2
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaNZqJ1TqxGw8c0y1ehxgr6c28mKgOaGON90l2SiIwQ=; b=FLjvL504ANooam
	sX6htEXF2PAPwot40XlFkG2zhvEqYscfoUtBlLxjIbNYQs0Qrtxd8iXyRTSVR+wpTa/Ib+HlkLA2g
	NUPR0QlcpAapIOC6B1Z0uJQqO+4MH4D38a/Wg+k4aX+bVQpia+c8rP+RukTJ+L9b/isC1wkkF5ocF
	iweGc7iOrUvi5D9LmUiPykPR0w6U2iJ53q81Ga3PWf2hq6DP+ILyZo+cr+90HdvIHXpVMjKfcSK6u
	I+VYnnWQUw5m6p6cVxiaTHO79XhgcQsfZ6aRO8PAZWwFez2U1Di8jKtZSI0TM5qHLJkFSMXmD3hP/
	v2ND6dP6YBdMyfKwqZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy44-00000000QNY-09s8;
	Tue, 25 Feb 2025 16:45:48 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxiS-00000000CUl-3WYV
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 16:23:30 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30761be8fcfso53027101fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500607; x=1741105407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=OJqD0o9M22g9Cla2XEsyRE4flPqaEskMl+C41MhrytYiPqddoaq5ZdhZ/YTXv8+UXW
         HpZRF4TZOfFMGw08qH7leuSbV9Rxqznj5hbvVZaACCLz04A82r1IHiZfT8b14Z6b9Scz
         mCvkp7JXJRZ7aMFZWDFPMqXxVgje5nodNOsIfqdg2eRGddXdY/1yEz1vS4CPOHMgxFht
         mS460vd92kY61EOVmmyC3p5jlPPrzzhszK9WyspfLUvFIHuVW82lOqftEORBv0/b3/V6
         eyelziEQUrSc6NWzYp/aUFoBnDWTFYmMmKIyW4H5u8bIyzzKLSt0CGwvnPb+fk7HVdDK
         f3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500607; x=1741105407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=pvaikOLGlHTnk5Q9zw+TFHHJ8Pd6TZpqrhdnFqs5l3BeF7xOEJMQ1tHliKFVDRscU9
         znh9Hdw3g430bG3PmqMJ1E9pxApBBftHRrlStKHqAG9oCc6tbFpG5EYPfqJt5OnpKTNG
         ihYf39GE+RxJlu0rzWeLU24RLb2NU2HfIg2B9M852YpN/PKqBHaGi1Yj6J6B9BxdVwyT
         gUxr5izbT2UcuhOYU80j20SYQ+PNwEGATjAyW80u8vBq1XdLKvoLoUO3wApGyZuLRQSJ
         x+vJieF4xa11LR3xeikY2Q1GAZl5LxOzUxyMOZvZDpfAm8/Zk21rIF+OdYvbO5SQYMuG
         gKnA==
X-Forwarded-Encrypted: i=1; AJvYcCVFxERHnkYDp3HrzvYCQWvzyftOICslGcdF4i+QDiXcyaqll6P+RCjBfao65m70BsqP0+M9Hp1oazGVAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yylcnodn6iNSj7tXpITNsxrHVFeiKWMmYw3LnXaCqtu/eq7FXBI
	R26uImAwn+b45w7djk7vRi6IG3CAxPwGqC9P+JH4Lzbe2bw1CLuwHp2mrnIEqOr9Ge56BKu/Bfh
	MT3Q3v2P6q1kis0AUcxsC7MDtwc8dCfQNTGuccw==
X-Gm-Gg: ASbGncvKZydMrF9rsJrQIanfXLgQ+TQYm+XMXosm9mPF8xLLxaZDqUWfElPagumna2u
	9IiO80sbcKPy177i+04r796gh0hyjjqbWKwLRZT8SQ+4j/0hNy+IBB1mhzVbcj3PRvyWPYaDqzu
	mAIU7+N2w=
X-Google-Smtp-Source: AGHT+IH1cSBiJaqWZBQz+1oq5/PChixqiVALnH9bhFgTe0md4+MN+IzZ3AEODUq6QzG1w0FaEprZGS9Czr6Kk3AzBSQ=
X-Received: by 2002:a2e:9ad3:0:b0:308:fd11:770e with SMTP id
 38308e7fff4ca-30a80c0f167mr16005611fa.5.1740500607109; Tue, 25 Feb 2025
 08:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org> <20250223120638-GYA39613@gentoo>
In-Reply-To: <20250223120638-GYA39613@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:23:16 +0100
X-Gm-Features: AWEUYZlkLTGEHvbrZyxHu4Q2yRspVFfhcab6__rjgENXWUAEaf3SKXErwl_alg0
Message-ID: <CACRpkdZLAtxOdF5TkGtdrbXB+S2jV8Lh_47vMdiwUt74Hez7OQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_082328_882661_E006EF99 
X-CRM114-Status: GOOD (  12.22  )
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

T24gU3VuLCBGZWIgMjMsIDIwMjUgYXQgMTowNuKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gSGkgTGludXMgV2FsbGVpajoKPgo+IE9uIDA4OjMxIFR1ZSAxOCBGZWIg
ICAgICwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gUGluY3RybCBpcyBhbiBlc3NlbnRpYWwgZHJpdmVy
IGZvciBTcGFjZW1pVCdzIFNvQywKPiA+IFRoZSB1YXJ0IGRyaXZlciByZXF1aXJlcyBpdCwgc2Ft
ZSBhcyBzZCBjYXJkIGRyaXZlciwKPiA+IHNvIGxldCdzIGVuYWJsZSBpdCBieSBkZWZhdWx0IGZv
ciB0aGlzIFNvQy4KPiA+Cj4gPiBUaGUgQ09ORklHX1BJTkNUUkxfU1BBQ0VNSVRfSzEgaXNuJ3Qg
ZW5hYmxlZCB3aGVuIHVzaW5nCj4gPiAnbWFrZSBkZWZjb25maWcnIHRvIHNlbGVjdCBrZXJuZWwg
Y29uZmlndXJhdGlvbiBvcHRpb25zLgo+ID4gVGhpcyByZXN1bHQgaW4gYSBicm9rZW4gdWFydCBk
cml2ZXIgd2hlcmUgZmFpbCBhdCBwcm9iZSgpCj4gPiBzdGFnZSBkdWUgdG8gbm8gcGlucyBmb3Vu
ZC4KPiA+Cj4KPiBDYW4geW91IHRha2UgdGhpcyBwYXRjaCB2aWEgcGluY3RybCBmaXhlcyB0cmVl
PyBpZiBwb3NzaWJsZSBpbiB0aGlzIGN5Y2xlCgpPSyEKClBhdGNoIGFwcGxpZWQgZm9yIGZpeGVz
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
