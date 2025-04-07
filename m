Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7603C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDxNkY13Ta2NMhYIDnoAe3QlZaulXJiC6oUwCSgzYlQ=; b=KrKKFEt5V1y6Ts
	43qDvVpfv5aa26fIoxJkLHdTVWvVEGnpHuDLp6AuA/d7sobWQ5X+OVTabjyTj9CBSG+3p4hvCIaVT
	QDHy1btwoPsthHUj3r9ql2B02cNQ2GhXkSuG7YIWtkTaDvuRSSVboyfy1L74wF5znfbbMnCC2cnPi
	tvkLFEGONYCITXxycntqKp44QfeSyGiHPB/Us1TWKUFjVbS28SYmfdB5m2LvEO686CB+asYmHj8t/
	8DjZz67J/GG6D/W36bj3UJhYOfs7OfouRd3nMihdV98VocXdKnkf0KP87p5ZpAO1SuyNq4Tpp9txo
	hT1amGxwNKREIwwmrvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhc-00000000Guu-28VL;
	Mon, 07 Apr 2025 12:35:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kcY-0000000HZvu-2m8v
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 11:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=; b=F5nGmWiC/5uTZ4Vnfh4QRz3X1S
	/p2xRd12bVS7Ujes4j7CpHEqXhe8GBDJIHgk17wZX9eciTlpnGqr898DxD3XQ1EEUvhkSV5lDuHQP
	GajvMYxbbZhczCbsm39UDDR01MB31sPrR0vxYyF8UyYRgSwTJgpqGk38Ms3dH/Mpr6YHG7Rh2CZtM
	2DN76DZDM28njEiiu5BcIE+nyRIPNyv0/oD1vrWL9zPjZ8Q5AaXh5rHUm9I4yTVE0NVhyVyeFKb/b
	nG8X0sUoVVH6ewJ6yYve/hYh1Bp1oS4K+EfTWCzI6oZcoMqpXtY54gmiD90tTt0UhRjO0g+fTTeqr
	31VtMlsg==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kcV-00000007w9z-0zyS
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 11:26:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54acc04516cso4856167e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744025184; x=1744629984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=Xxx6Bt3EtjTntLOvz5iw3XPybtden6mxR/fs9lyWvKNopmt/4LVWRbkv3HOYVmkACa
         4hjITQ2+9ylcoUpT732bMh9/SDEWkG1bxXRx3ICSoCjtspt8d68Xu7mzLDCBQFevynx8
         XKyh917Sx3R0S2aBcwOOgUopFeHLQgaqWuqezXV3OMcaE6jHzqDni2hILJbF2K9sLfY4
         JoYzlYFxSZOqQZqPvU6nN6qrDzmiFoNzyrEsqaN2vCT6fTqXCEOpoSQSCuioRRs/lgmF
         a1CMshcjcq/3LxNOcvXsnOmJfkLtio2IXTg+MjTfy0esLjAGBNWIl2dQGng1Tn8ALaCL
         IgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025184; x=1744629984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMO1POcPMv7WcEI3IEK8Y5twX/lsGWmxAHtpCcotjPQ=;
        b=daWnYSusS8I4O00rKQx+2jSCmTwvhq+VlHmFPn/YFGeNYPjxxvaUzm/RbMEzrDTp2s
         UOQo10s4gFpNDAEsCsj0p0AYQwoiKHXzZFjsTVzJaua2iOoOfj9uJq4ir7FNUX+687pP
         2zZCIosvFq4JwK9p8CDuLSK1b9yw9KSV+hVigw1vg8EYFSKe0l3QWM7NMo15IL7dp35l
         PFQVqpdHeqG3bWBfFviJHd80Y2sjDUQ4xmhxi55ciPjkRxN+7CRZG5xFKJPR434mh3e9
         py5FUTxjC0k1B63A1emjd1AwhRv6hhAvTh5cv8rihS3+bXMIk5fiAJICNciDrbGHt0lP
         NZpg==
X-Forwarded-Encrypted: i=1; AJvYcCUsUk+3c4oshghGpXyadKvaLeHS+9IJSH/RnRMiDLJejUsKrYfXs3WWA0/e/FjoqVIWwT1qQ4X83rbj3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG25PCH49iUFxySE0RMY3sI5NUdlSPn8TJe9qVgXxn7kw12jNU
	tbwOJ6IQF+Ik/rbhai0DYG2gVeCjlMLbcYEiYHSjp/onRV1pKWusGP17WuPHdFp5sUsi40jgAh0
	RPXCLWcXLM2cL3ahdiEQFzvLdlrYQHdWAoTLMnw==
X-Gm-Gg: ASbGncuGo2A1Wb2f5ck8YXIw6r/77agZCrJfWfVZf0knHnkDKj4vYZq1ATsVlXHzhje
	1g2+mQlNgj5u884DPmnWjBZh77fS7g6WjeFHYcZq34jOXPKwLtEiiVW0ZMGRGltbp5Cuc0/v3LY
	gFkD8TnQT+mhXEe5q6NNQesBqN0RYTECKu2OKvGFtdHObptxAmuT1KCVeB8t5D+HUYxqgN
X-Google-Smtp-Source: AGHT+IEF0Umob27acb0T2mBiL6aYslIf1iwF0v4IeDnV4GdBZ6Kni8wcccQPNxQv4mkDvYKKandIkloAlzt8S6od9ac=
X-Received: by 2002:a05:6512:400c:b0:545:48c:6de2 with SMTP id
 2adb3069b0e04-54c297d099bmr1645433e87.13.1744025183610; Mon, 07 Apr 2025
 04:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org> <20250407103320-GYA13974@gentoo>
In-Reply-To: <20250407103320-GYA13974@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 13:26:12 +0200
X-Gm-Features: ATxdqUFdC84fNZAgdG0QB3uYh3FcHqNCfMgI5v2DW_l-kU6Xw4akq4WaqW0KsIA
Message-ID: <CAMRc=MeFK1gX69CWH2gkYUqkLU-KCOcwHcA+gjN1RXFA++B_eQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_122627_505219_20502A86 
X-CRM114-Status: GOOD (  15.01  )
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

T24gTW9uLCBBcHIgNywgMjAyNSBhdCAxMjozM+KAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIExpbnVzIFdhbGxlaWo6Cj4KPiBPbiAwNjowNiBXZWQgMjYgTWFy
ICAgICAsIFlpeHVuIExhbiB3cm90ZToKPiA+IGdwaW8gaXJxIHdoaWNoIHVzaW5nIHRocmVlLWNl
bGwgc2NoZW1lIHNob3VsZCBhbHdheXMgY2FsbAo+ID4gaW5zdGFuY2VfbWF0Y2goKSBmdW5jdGlv
biB0byBmaW5kIHRoZSBjb3JyZWN0IGlycWRvbWFpbi4KPiA+Cj4gPiBUaGUgc2VsZWN0KCkgZnVu
Y3Rpb24gd2lsbCBiZSBjYWxsZWQgd2l0aCAhRE9NQUlOX0JVU19BTlksCj4gPiBzbyBmb3Igc3Bl
Y2lmaWMgZ3BpbyBpcnEgZHJpdmVyLCBpdCBuZWVkIHRvIHNldCBidXMgdG9rZW4KPiA+IGV4cGxp
Y2l0bHksIHNvbWV0aGluZyBsaWtlOgo+ID4gICBpcnFfZG9tYWluX3VwZGF0ZV9idXNfdG9rZW4o
Z2lycS0+ZG9tYWluLCBET01BSU5fQlVTX1dJUkVEKTsKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
aXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlv
bGliLW9mLmMgfCAgOCArKysrKysrKwo+ID4gIGRyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmggfCAg
NiArKysrKysKPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jICAgIHwgMjIgKysrKysrKysrKysr
KysrKysrLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiA+Cj4KPiAgIEknZCBhc3N1bWUgdGhpcyBwYXRjaCBbMi8yXSB3aWxsIGdvIHZp
YSBwaW5jdHJsJ3MgdHJlZT8KPiBhcyBwYXRjaCBbMS8yXSBoYXMgYmVlbiBhY2NlcHRlZCBieSBU
aG9tYXMgaW50byB0aXAgdHJlZSBbMV0uLgo+ICAgQWRkaXRvbmFsbHkgbmVlZCB0byBwdWxsIHRo
YXQgY29tbWl0IGZpcnN0PyBzaW5jZSBpdCdzIGEgZGVwZW5kZW5jeQo+CgpObywgdGhpcyBzaG91
bGQgZ28gdGhyb3VnaCB0aGUgR1BJTyB0cmVlIGJ1dCBmb3IgdGhhdCBJJ2QgbmVlZCBhbgppbW11
dGFibGUgdGFnIHdpdGggcGF0Y2ggMS8yLgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
