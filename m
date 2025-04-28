Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79BC369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6En1bN5ZuVyxXc3Ubetp8SyZtGfzvDLF3WZ7n6qopXc=; b=eo8VE+h0XxhLZm
	bQlY6s03rF1lHC02RoQwhEL7U3lNSuzk+n6pxHAKO5yGHW8m5l7ZLRNo2B6T+Jl/E2g+qXXTvuqJZ
	Ge8jIKw0ksEh5XjUu7BsNkepvo1meASECFVMSOlnYrnDviZwX3SnGLG4Djh/Oo4NUCuiaJa89YnO8
	KdwB0U6gYZLmNQtnLWhB4gSUZpfdQ8E2kf8zpM6UNeKJc6nGmrAuCi699m9dNHemSZk+FNLx+sRSX
	3Toj/i7o/xuaAkW1LPytqwHnGtg5IoFJWwdO6BuX2G5CC2fNdqCcuSUEnawweG2y4NcbXAFxqCyxI
	09um0h/+NjoxLta7LFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PJS-00000006caD-0fk9;
	Mon, 28 Apr 2025 14:18:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PJP-00000006cZq-3TaP
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 14:18:25 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54298ec925bso6342204e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 07:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745849902; x=1746454702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=YIA048gKy7kTM/AbDpuEaBnDhcnrtRZVwyNxJT9vf3/8sf0CGQeE8XHOLvXhXuOvAk
         z/GDOTOAPKnLtaFHR47SER8bXdLHgo9tMLKSmoJl5HbbE6L2+YoEaEOx7ZmIKszQtcE/
         AQ2j5UzAsu6Ftc7lhCNvyJ4sQyGbmeOB6YDcttyC9KSVRKKiMoSEAUk6Ps+nAz5JmxWU
         4KgNxFJAWxC56axMaF4LO2fHEScq/YnGCsPKqm2R+gBJwE+DhNfHW9nDDR44OQ7NY8JC
         XnzwVpb08VjdYQ+rssjC6HJY+XzOLlzKSY41u217rE6GqyZKFit6a0ispCIpM/c+Bxbo
         63aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849902; x=1746454702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXVvurz23J2+L5kt96WXTroBQ39jU0y6cCqiWeSQLFk=;
        b=ZQogXxHait74ZaiC0y4XDZHW67tgBvVKLPoNId9xK5/BS9didkKBwg7uqZ6XfM3xSq
         2lGYE7hUJC15mAYq9n4/UA7bcX8Eg6J5etbEweoh7ndFy12Li5FWDSbTiTmAtaJosfkW
         PMWrc26ViPKBzshZWgDCIUqvZQYll1dGHBZUtCZKEJWWMRBQz1pGIDohiIG1mKmCjQDN
         GkBOaMsF3fTKJzMLfm2LFGXb6gijJm5hPLQZ2FGLHkSozfqE2b9F4G9dIzP3B6hCV87E
         O73VmIg/R8d7tHF+vtV02hDCBrFI0BZZnWe5u8Jb2Dxfl6/de8yAnqKverxiDv395IAT
         PhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9hNMAz2fL8VSXZA+x4eZtwXCtGWwh0eTHgZZp7ZDwFHmvMarGXgd/mI9zKdnrbGS694HWcPxe/1BQsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyedXCc7YpBzvkp2ND8GXOOyjf3ZHw5ZGsfK+OR2YC49KBeCg8
	qPL9VvM2pon3Kjvdm8ZfPZ0B3IAf/yFumc1XY5jaF4H0DoWYu5hXFL76fec7A17Df9f/p+gESQi
	kX13lztRWlUPwdqa9JASYMQvk/ZQgCkvTmAoRLA==
X-Gm-Gg: ASbGncuUROZRY0LGz5A1YXhJRPfS3rnkgsBrAVIIEuTnFOtAGxjEhRiPp8s5ToVQlYY
	Z6PG4v6KwpqZh8oK7KgoepknOgdJkD12J79e0iIXmu5bbBNsU7srJxYG4JdH6KjbvVqKWBxTlPC
	TbFrdkiftL8eUfn6JS1jeUpQ==
X-Google-Smtp-Source: AGHT+IGvhJeqWQVl7wUSjEu9Tai7VZXnkdRdnljHuHSmsEW0zEOC9vXIPg78pJyadRV6QxI6VqKiX008Vk2HwfUHtNE=
X-Received: by 2002:a05:6512:108f:b0:549:6cac:6717 with SMTP id
 2adb3069b0e04-54e8cc0cb31mr3406763e87.53.1745849901807; Mon, 28 Apr 2025
 07:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
 <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
 <7e62e720ccc51fb5c7d023adae3eab35aecf0bba.camel@icenowy.me>
 <CACRpkdY0DXxDixZVhnRuKvSVbKQ6pSfLMiT2hf9818sbNG-4hg@mail.gmail.com> <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
In-Reply-To: <0606c146d97ff98ff1412b98f49e6da0071801d1.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 16:18:10 +0200
X-Gm-Features: ATxdqUFE5Aj3lBDc4lYvvht68VXq-83pWEXQcwlO7tgbNAkueD3gpN4Y7TmGwKM
Message-ID: <CACRpkdbPhKwjb0dkOom6HyzTrhPWvMPhX5M=nyxw1HBHNJa0fQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_071823_866678_2894566F 
X-CRM114-Status: GOOD (  15.07  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMjoyNuKAr1BNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKW01lXQo+ID4gSSBndWVzcyB3aGF0IHJ1YnMgbWUgdGhlIHdyb25nIHdh
eSBpcyB3aHkgdGhlIGV4dGVybmFsIHVzZXJzCj4gPiAoZGV2aWNlcywgZGV2aWNlIGRyaXZlcnMg
b3IgZXZlbiBwaW4gaG9ncykgY2Fubm90IHRyaWdnZXIgdGhlIGNoYWluCj4gPiBvZgo+ID4gZXZl
bnRzIGxlYWRpbmcgdG8gdGhpcyBjb25maWd1cmF0aW9uLCBpbnN0ZWFkIG9mIGRpZmZlcmVudCAi
bWFnaWMiCj4gPiBjb25maWd1cmF0aW9ucyB0aGF0IGFyZSBqdXN0IHNldCB1cCBpbiB0aGUgcGlu
IGNvbnRyb2xsZXIgaXRzZWxmLgo+Cj4gV2VsbCBJIGFtIGp1c3QgZXh0ZW5kaW5nIHdoYXQncyBh
bHJlYWR5IGluIHVzZS4uLgo+Cj4gQ3VycmVudGx5IGl0J3MgYWxyZWFkeSBzdXBwb3J0ZWQgdG8g
cm91dGUgR1BJT3MgdG8gR1BJIHNpZ25hbHMsIEkgYWRkZWQKPiB0aGUgc3VwcG9ydCB0byByb3V0
ZSBmaXhlZCBsZXZlbCBzb3VyY2VzIHRvIHRoZW0sIGluIGEgc2ltaWxhciB3YXkuCj4KPiBJZiBh
bnkgZXh0ZXJuYWwgdXNlcnMgZXZlciBoYXZlIHRoZSBuZWVkIG9mIGJhbmdpbmcgdGhlIGludGVy
bmFsCj4gc2lnbmFscyBpbnN0ZWFkIG9mIHR5aW5nIGl0IGZpeGVkbHksIG1heWJlIHN3aXRjaGlu
ZyBiZXR3ZWVuIGRpZmZlcmVudAo+IHBpbmN0cmwgY29uZmlndXJhdGlvbiBzZXRzIGlzIGVub3Vn
aD8gKEJlY2F1c2UgdGhpcyBraW5kIG9mIG9wZXJhdGlvbgo+IGNvdWxkIG5ldmVyIGJlIGFzIGhp
Z2ggc3BlZWQgZW5vdWdoIGFzIHJlYWwgaGFyZHdhcmUgcGlucykKCldoYXQgSSBhbSB0aGlua2lu
ZyBpcyB0aGF0IG9uZSBvZiB0aGUgZm9sbG93aW5nIG11c3QgYmUgdHJ1ZToKCjEuIFRoZSBpbnRl
cm5hbCBwYWRzIGFyZSBhbHdheXMgc2V0IHVwIHRoZSBzYW1lIHdheSBmb3IgdGhpcyBTb0MKICBp
biB3aGljaCBjYXNlIHRoZXkgc2hvdWxkIGJlIGp1c3QgaGFyZGNvZGVkIGluc3RlYWQsIG9yIGF0
CiAgbGVhc3QganVzdCBpbXBsaWVkIGZyb20gdGhlIGNvbXBhdGlibGUgc3RyaW5nIG9mIHRoZSBw
aW4gY29udHJvbGxlci4KCjIuIFRoZSBpbnRlcm5hbCBwYWRzIGFyZSByb3V0ZWQgZGlmZmVyZW50
bHkgZGVwZW5kaW5nIG9uIGRpZmZlcmVudAogIHVzZSBjYXNlcywgaW4gd2hpY2ggY2FzZSB0aGV5
IG5lZWQgdG8gYmUgc2V0IHVwIG9yIGltcGxpZWQKICBmcm9tIGNvbmZpZ3VyYXRpb24gaW4gb3Ro
ZXIgRFQgbm9kZXMgZGVzY3JpYmluZyB0aGlzIHVzZS4KCkkgZ3Vlc3MgdGhpcyBiaW5kaW5nIGlm
IGZvciAoMik/CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
