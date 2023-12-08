Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A939C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yWOfdwC8Pfc7eriqFC4OvHDVH3OD79OA3571BJ5hcj4=; b=C6yii9cRmLoDMPjTDnwFuksyWV
	agUGJK30hkk4olBPleeTy7+gCj3P96+rStu6GBRQ4W4RrT9oZJqEQkMx7N29Stzfnl8eZYBuB5XKO
	jCiuoX0/OriVfrSgF5bMGGQpkZrwn9h0G8wTqXjTtWOqtfjzAc+4z1vI4IAirBPB0jR3Ey3Z2c9xH
	cDPVe9PmM6VRrMTwra3BqnFtY1gWd7zjIofBedqFRbcXS4jllPO8IFke2yHbMXT1n9W0lIGHbcECb
	geRe3wHJHD0+znweSUgpLUBODRAbWY3+jotAyTunXMIoeFgsr9si1skAYbwN6MDAi6+jhgtxnv7Ed
	q+zJ6vDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXdn-00FB7r-0i;
	Fri, 08 Dec 2023 09:59:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXdj-00FB7U-1E
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 09:59:25 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C9E783F1FD
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702029561;
	bh=I52L/k2w6kzXxbOVc+fYqImvkAobF6tbLpZYc1bLRtI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gzWDDHpCnWPDKIQtHZPq1GV+X2lGTpE1+TNqphz9vYHYe6RSIbN4KeV6Z2p6NnLCP
	 QwE4hAwPk33j3R3Gk7RFbqRpiABDz6u+kyIhTTHYN3KhiBvBu9OPCHge5MgRlZX6DI
	 jgkbqHTIlkLRIQZM917MG+E402bt19xwWdu5KH3Qkokc//AhMMhMRbyPQlxg1HvRPA
	 toDrRy6Lehops0O6PxxeZPhXiISlxJDBpXdFN1/ZbkW2eRR4y2kfM7gfthboZg4eHc
	 ImohpmJjrNskkAyMtKYdJemYtpjdAxS61yRzqMk6TiKJm+hMeturRuG82a0zC7MmBe
	 dlyKOHYjc2cow==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42595dc46e3so12678411cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 01:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029561; x=1702634361;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I52L/k2w6kzXxbOVc+fYqImvkAobF6tbLpZYc1bLRtI=;
        b=lr0Ew/XNvzZF/E/DgNcdvK7ucl6YREHdTXltEipmEToB03j5H0aHseyNGrWFfo4DvV
         7OIjZ/FEChUs3xuzLC9DCxNerNpLetlV4QvajkxUBqnFBWN5wgpiuWZGShl8UVbbk7pD
         AgddyLZkh4rRdtgnAdvKHkf9lSU/stm0aDJ2AgGmcw1Kaqn6fQTMMlkdnCqeItHxuD8i
         yq9S1MyNTUGm5XkoF7j92P94Ib4KfItRLvqffTHjrAVYqMAFszR46DGVs8C9rykRZTlw
         Ja40hLC+BmRvHTOqB0AiT71n2fJPqaK4VyrEaT5mXaq9GG3QSsuBiFgiuHNENCNzWgL+
         yhWg==
X-Gm-Message-State: AOJu0Yzjj+N68WpDy7+VwYYiH3C+mU84bsXkgWRfJPzY9qFANc56BQvh
	RF2bjlZB9E1jP5SakyzedWV/dZKZHI/khox8uETdley6CsUNgqw6akvuRawnhXyWsTDOlpNcaLV
	Y8oZQ2P4GVrLHLgShKgVwfX7x6bOVhDM44XnM/2s5EzovpYVdoKbY8YaBy0oP5A==
X-Received: by 2002:a05:622a:1008:b0:423:8b3d:dd27 with SMTP id d8-20020a05622a100800b004238b3ddd27mr4183374qte.10.1702029560947;
        Fri, 08 Dec 2023 01:59:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK8eoihgg97ExCkr3OG2Sr5b6BsJh1tAmO9Er2+RJwXVOO4OAd2ySjPhBoRcqunDFdRDE1XU6j8lKsfr0sfyU=
X-Received: by 2002:a05:622a:1008:b0:423:8b3d:dd27 with SMTP id
 d8-20020a05622a100800b004238b3ddd27mr4183362qte.10.1702029560654; Fri, 08 Dec
 2023 01:59:20 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 04:59:20 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231208095252.w5n33rf5s2uzycqm@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <500a4f39531bd5fc61eb8ac0092e34d4b1ae2cc0.1701860672.git.u.kleine-koenig@pengutronix.de>
 <CAJM55Z9sUTNKR5EGmPOio8Uh_1+wfs0-aiKcsngUKF24JcO-QA@mail.gmail.com> <20231208095252.w5n33rf5s2uzycqm@pengutronix.de>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 04:59:20 -0500
Message-ID: <CAJM55Z-3+6bZkP3gb6rj2gU-6TNvLizcBOv-wMspzRPygJ1K=A@mail.gmail.com>
Subject: Re: [PATCH v4 089/115] pwm: sifive: Make use of devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_015924_071333_FC01A9FF 
X-CRM114-Status: GOOD (  22.89  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gRW1pbCwKPgo+IE9uIEZyaSwgRGVjIDA4
LCAyMDIzIGF0IDA0OjMwOjQxQU0gLTA1MDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+
ID4gVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+IFRoaXMgcHJlcGFyZXMgdGhlIHB3bS1z
aWZpdmUgZHJpdmVyIHRvIGZ1cnRoZXIgY2hhbmdlcyBvZiB0aGUgcHdtIGNvcmUKPiA+ID4gb3V0
bGluZWQgaW4gdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBkZXZtX3B3bWNoaXBfYWxsb2MoKS4gVGhl
cmUgaXMgbm8KPiA+ID4gaW50ZW5kZWQgc2VtYW50aWNhbCBjaGFuZ2UgYW5kIHRoZSBkcml2ZXIg
c2hvdWxkIGJlaGF2ZSBhcyBiZWZvcmUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gPiA+IC0tLQo+
ID4gPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwgMjggKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
IGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+IGluZGV4IGMxYjQxMjkwNWQ5ZS4uY2Yz
ZmNmZmU3YjNhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiA+
ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+IEBAIC00MSw3ICs0MSw3IEBA
Cj4gPiA+ICAjZGVmaW5lIFBXTV9TSUZJVkVfREVGQVVMVF9QRVJJT0QJMTAwMDAwMDAKPiA+ID4K
PiA+ID4gIHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhIHsKPiA+ID4gLQlzdHJ1Y3QgcHdtX2NoaXAJ
Y2hpcDsKPiA+ID4gKwlzdHJ1Y3QgcHdtX2NoaXAgKmNoaXA7Cj4gPgo+ID4gSW4gcGF0Y2ggNDMg
eW91IGRvIGRkYXRhID0gKHZvaWQgKiljaGlwICsgc2l6ZW9mKCpjaGlwKS4gU2hvdWxkbid0IHdl
Cj4gPiBiZSBhYmxlIHRvIGdldAo+ID4gdGhlIGNoaXAgcG9pbnRlciBmcm9tIGRkYXRhIHVzaW5n
IGNoaXAgPSAodm9pZCAqKWRkYXRhIC0gc2l6ZW9mKCpjaGlwKT8KPgo+IFRoYXQgd291bGQgd29y
aywgYnV0IEkgZG9uJ3Qgd2FudCB0byB1c2UgdGhhdCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgaW4K
PiBsb3dsZXZlbCBkcml2ZXJzLiBBbHNvIGl0J3MgYSBiaXQgb2JzY3VyZSBiZWNhdXNlIG5vdCBh
bGwgZHJpdmVycyB1c2UKPiB0aGUgZHJpdmVyIGRhdGEgbG9jYXRlZCBhZnRlciB0aGUgcHdtY2hp
cC4gQW5vdGhlciBkaWZmaWN1bHR5IGlzIHRoYXQKPiBzdGFydGluZyB3aXRoIHBhdGNoICMxMTEg
dGhlIG1lbW9yeSBsYXlvdXQgY2hhbmdlcyBhbmQgeW91IGNhbiBvbmx5Cj4gZGV0ZXJtaW5lIHRo
ZSBjaGlwIGZyb20gdGhlIGRyaXZlciBkYXRhIGlmIHlvdSBrbm93IHRoZSB2YWx1ZSBvZiBucHdt
Lgo+IChTbyB5b3UgbmVlZCBpbmZvcm1hdGlvbiBmcm9tIHRoZSBjaGlwIHRvIGdldCBhY2Nlc3Mg
dG8gdGhlIGNoaXAuIGh1Y2gpCgpBaCwgeWVhaCBpdCB3b3VsZCBvZiBjb3Vyc2UgbmVlZCB3cmFw
cGVycyBzbyBkcml2ZXJzIHdvbid0IG5lZWQgdG8gZG8gdGhlCmNhbGN1bGF0aW9uLCBidXQgdGhl
IGxhc3QgcGFzdCBkZWZpbml0ZWx5IG1ha2VzIHNlbnNlLgoKPgo+ID4gPiAgCXN0cnVjdCBtdXRl
eCBsb2NrOyAvKiBsb2NrIHRvIHByb3RlY3QgdXNlcl9jb3VudCBhbmQgYXBwcm94X3BlcmlvZCAq
Lwo+ID4gPiAgCXN0cnVjdCBub3RpZmllcl9ibG9jayBub3RpZmllcjsKPiA+ID4gIAlzdHJ1Y3Qg
Y2xrICpjbGs7Cj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPgo+IC0tCj4gUGVuZ3V0cm9uaXggZS5L
LiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1Lw7ZuaWcgICAgICAgICAg
ICB8Cj4gSW5kdXN0cmlhbCBMaW51eCBTb2x1dGlvbnMgICAgICAgICAgICAgICAgIHwgaHR0cHM6
Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
