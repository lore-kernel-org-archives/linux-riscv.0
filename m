Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5002ECDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+x3niiVbsdpQXiKhuwS36IeIxlGN0AFNK9uw2M0YWE=; b=pfNmuLA2pTRo5F
	Rkn79zjy/PZl39IDJZpFIiLeGSOpHmOrpRB5ofecA1QYOVuTDb4R/3si+LG0A24oojP9FGB935ou+
	YIV0rRoU5piI8aVxplGCrDZnmy4nLARvCslzMWKJ5pBDzs8wsUAUP98fTDF9BWwqN12qr5aKV7VwF
	+sZ7hR5WrBPoVgIgheDJaf5pY6sv2tJIewHsMoihyM9YTTBAH0u0xGc+urHuxL3nYLKzHlBihhWFN
	kO5WilhlgXsUIUJwEIGFD8BxIiEbMUMrTga6+Ge0xnTuSP/GQu3M8Y8cPwlKAQ+StmyJWR+ktHD/a
	8RSKFvqJ3tKkWg8a+uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVQX-000Gof-2s;
	Thu, 19 Oct 2023 15:59:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVQT-000GoC-2J
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 15:59:11 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so103385501fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697731145; x=1698335945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sm/Wii6+7o3UXX8C55yUutEJQSIovh8VXkokjTN3YvQ=;
        b=UwQBx+RU+bS6nVueNo2xX9JtI6e+T9p20ex5hpRnj7O3e777TvU8w6Mi4MepcEn+XZ
         5K1PT+cjoJQI5budWebixh5lr7Qrnegetc7acss9CatRwPSNvSlA2cROAreXrU8JdJit
         VghGTcYF8nHVg88vZwOJpuITSEYyeCJ7VgKIfgFjs+xaCODJUFAsSzGNzigwGy1B7Qhz
         ESociWOpQphSXK5pSBghsv4zmX4s6cn1ANx4PAwXJ9X3ifq315dDGu0AayJ1NnTjW5Xh
         Q9jnabN4fopFXJZ/IfXggRGhOjEZiIYy0xPwLykvMklgDWwyyjraBEMZ2t0NzlcNE7Ig
         j8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697731145; x=1698335945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sm/Wii6+7o3UXX8C55yUutEJQSIovh8VXkokjTN3YvQ=;
        b=Yj5SeWFDs/t+jlfVO6f6V+8xKVK8GcvjpQIHrCe83K8TVLBJtL6rYJegwuIB5nZgKu
         /9WNi39AtL1GAlrxU/2rSIM+O+TosW9wANHg3K/HJZopoOTfBHUfhNSs+7xSmk9+iZYL
         9EhmQnC07jP/LG0Sg/KnJPuj6EaAcrHQl7g8UB2MnvbvAEhQfQrX5GKmx5DlrWTYEr47
         q0ojNf9TwiFRCiTZEhTX2p4qRIRNVXIKSlv870xXCQZrdox/hjuAbik/OCsaP6u02JWW
         6uEG8m6xqayj9OOjm0vhEcC0qTsSkbOvJ2jOIQtgA2lhQcgwjW/wyWCmylI/1vvLm40o
         hpnA==
X-Gm-Message-State: AOJu0YxVJZNAid+wbpPAHY7fhJf/ZgijeAM/MymsyAq/aDy1tXIxOEnX
	Ao5UL6HsFjLRgZWSbOd/LcUjvKvoMNpbITKcCVMQ3A==
X-Google-Smtp-Source: AGHT+IFhWqGbbE8JI0y4QRuxzilbQXa+K0fS3Bh2vLrdcR1Ry3XED7EDIlt4FyQSCadgcN054zLlg6tJMnlCOQmsWWg=
X-Received: by 2002:a05:651c:555:b0:2bc:c28c:a2b8 with SMTP id
 q21-20020a05651c055500b002bcc28ca2b8mr2127428ljp.27.1697731145578; Thu, 19
 Oct 2023 08:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud> <20231018-flagpole-footpad-07a6228485f3@spud>
 <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
 <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com> <20231019-smith-purging-627c50cfa3de@spud>
In-Reply-To: <20231019-smith-purging-627c50cfa3de@spud>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 19 Oct 2023 08:58:29 -0700
Message-ID: <CALs-Hsv2HK7dtZRi9R4GH0vZnf2oU9xVhKfK153S7Y_txUceqA@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_085909_994421_E63918E8 
X-CRM114-Status: GOOD (  11.97  )
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

T24gVGh1LCBPY3QgMTksIDIwMjMgYXQgMzoyNOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAxMTo0Njo1MUFNICsw
MjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPiBJbmRlZWQgdGhlIGNvbW1lbnQgd2FzIGEg
Yml0IG1pc2xlYWRpbmcsIGlzIHRoaXMgbW9yZSBjbGVhciA/Cj4gPgo+ID4gLyoKPiA+ICAqIE9u
bHkgdXNlIENIRUNLX0lTQV9FWFQoKSBmb3IgZXh0ZW5zaW9ucyB3aGljaCBhcmUgdXNhYmxlIGJ5
Cj4gPiAgKiB1c2Vyc3BhY2Ugd2l0aCByZXNwZWN0IHRvIHRoZSBrZXJuZWwgY3VycmVudCBjb25m
aWd1cmF0aW9uLgo+ID4gICogRm9yIGluc3RhbmNlLCBJU0EgZXh0ZW5zaW9ucyB0aGF0IHVzZXMg
ZmxvYXQgb3BlcmF0aW9ucwo+Cj4gcy90aGF0IHVzZXMvdGhhdCB1c2UvCj4KPiA+ICAqIHNob3Vs
ZCBub3QgYmUgZXhwb3NlZCB3aGVuIENPTkZJR19GUFUgaXMgbm90IHNldC4KPgo+IHMvaXMgbm90
IHNldC9pcyBub3QgZW5hYmxlZC8KPgo+IEJ1dCB5ZWFoLCBkZWZpbml0ZWx5IG1vcmUgY2xlYXIs
IHRoYW5rcy4KCkxvb2tzIGdvb2QgdG8gbWUgdG9vLiBUaGFua3MsIENsw6ltZW50IQotRXZhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
