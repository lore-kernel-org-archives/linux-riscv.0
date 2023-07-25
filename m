Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C145C00528
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apN7P7viQdWSXDbpkgLMN8InlWigsneneBev2Szvmo8=; b=ISPQ6vyu8koOq+
	2zyzgGs4/ThNRK0Sgd9VIQQPtXK77YqokYj1S2hNGBJ7xKiLj/bxQrVKbEujCvnGJPUqlmwiIaaBR
	dmeSUf42RtXJ1yY4VULcHixKYaRwg7SvPrtP/zkmj9DEQCSW04qpQ6yWtehgMzR/6p6+1Acsy1iMt
	xc8OODDXr34ICsgltOY70B/avsrvh//GjEjEGEwEk9BcA6mgrqNTn0SNidj7sZ9on4Kf+e2FJJ+sK
	ayMOjt1bOhARiiOAAX0LoA/uNeUyVJ54au/Hgpk5zWerZXt2MpH8i1X7M//gsnwDv57rhAJh8c6za
	89iGIz1U5vd8U/jNACTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC6W-006WPU-1E;
	Tue, 25 Jul 2023 07:05:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC6S-006WOe-1c
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:05:05 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98e39784a85so1321992666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 00:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690268700; x=1690873500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rywQXgpO5u1DqjN9adyjvwJjSzTGessRPrLO7F1AaE=;
        b=ULJE+D89TTUVUUaP/IV1jDtGzFhTHxd3L2rCo5moFvzGPfdJWn8qj9gVJ5/8ROoSAY
         Y1uUA7kCezicqsqNgUJRCZ1X34+FvkYxU7vFy/mRT8EbhU3Swa6T/bVyspBnXJXAfzLK
         dMAljKWUsJA9utFvN81GcHWPxiRKj9xjCm+mCwSiVGEecL38ojOF2UtwMfo7ij+fnsjy
         JMJMkrOEDlYsX0Svgn4Ajf5qgGE9Ao2zQqmgUZ36WNxrkKUEi3ysVgpI03jMAZniNRte
         gdFYsQm0+r5oO4+4dRMJ+87H2B4C3bbel467x1GBaAPcZzc8hpwaaGbqheDFmdBrwkYa
         3c4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268700; x=1690873500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rywQXgpO5u1DqjN9adyjvwJjSzTGessRPrLO7F1AaE=;
        b=NvQm1jelnKBL1BTCciRlAHiaEAWXKgmta5cxQIesfn2RuWyRwUJIh79q2Ifp7w4aLl
         imX0+kl6wSi4YOH99QEeW5ZRIUf2yHRgCbhXFaOJeX4d2iJNLBBI2dySxlxF9YUM86fx
         6XCDGP79YmjxEJmrt1qLjiBDSdGznwVt+xtY5r8IbYq8nMFVoPhPR0zDtyKLiMNH2e/V
         q1zK3xUPV5HGTlliEwyKZ7IN8JGPLzyoS14APzS9kKmuCC9TowfOpIEBV1NW30iLwtY9
         EgN63caN8WWOKSbnuGauG+yhhyZS1pRdHfEbRXyD5u/prn7tfbCRCUEEVJNr2QHV4J4t
         5Duw==
X-Gm-Message-State: ABy/qLawW5mEGEb9tGgmUj4WH8peyT1l1/Qh5iJSNA0W8K+EqUypekAc
	UJsSZr1OZY9ANvyxnwjk49yAmMrWhgTTtcGabG4=
X-Google-Smtp-Source: APBJJlEwr7S33twyOTE3LTF9R7r+4PcAikCXfdNapTZNDBhbNtanpC9v0bta0ngKhzUbGrvaADJi7TYq+dhgQNlWrrc=
X-Received: by 2002:a17:907:a089:b0:98d:f2c9:a1eb with SMTP id
 hu9-20020a170907a08900b0098df2c9a1ebmr1800076ejc.24.1690268700144; Tue, 25
 Jul 2023 00:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230725004043.381573-1-samuel.holland@sifive.com>
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 25 Jul 2023 10:04:23 +0300
Message-ID: <CAHp75Vf5FvoshtHj+3MWFCr6-6MioCydSF8c5=tZueZHPZj=XA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] gpio: sifive: Module support
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000504_546678_45433E54 
X-CRM114-Status: GOOD (  15.44  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMzo0MOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdpdGggdGhlIGNhbGwgdG8gb2ZfaXJxX2Nv
dW50KCkgcmVtb3ZlZCwgdGhlIFNpRml2ZSBHUElPIGRyaXZlciBjYW4gYmUKPiBidWlsdCBhcyBh
IG1vZHVsZS4gVGhpcyBoZWxwcyB0byBtaW5pbWl6ZSB0aGUgc2l6ZSBvZiBhIG11bHRpcGxhdGZv
cm0KPiBrZXJuZWwsIGFuZCBpcyByZXF1aXJlZCBieSBzb21lIGRvd25zdHJlYW0gZGlzdHJpYnV0
aW9ucyAoQW5kcm9pZCBHS0kpLgo+Cj4gVGhpcyBzZXJpZXMgcmVtb3ZlcyB0aGUgcmVzdCBvZiB0
aGUgb2ZfKiBBUEkgdXNhZ2UgaW4gdGhlIHByb2Nlc3MuCgpSZXZpZXdlZC1ieTogQW5keSBTaGV2
Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgpmb3IgdW5yZXZpZXdlZCAoYnkgbWUp
IHBhdGNoZXMuCgpUaGFuayB5b3UhCgo+IENoYW5nZXMgaW4gdjM6Cj4gIC0gVXNlIGRldl9md25v
ZGUoKSBpbnN0ZWFkIG9mIG1lbWJlciBhY2Nlc3MKPiAgLSBNZW50aW9uIHRoZSBTSUZJVkVfR1BJ
T19NQVggY2hlY2sgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCj4gIC0gS2VlcCB0aGUgdmFyaWFibGUg
Zm9yIHRoZSBwYXJlbnQgSVJRIGRvbWFpbgo+ICAtIEFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkgdGhlIElSUSBkYXRhIGxvb2t1cCB3aWxsIHN1Y2NlZWQKPgo+IENoYW5nZXMgaW4gdjI6Cj4g
IC0gQWRkIDMgbmV3IHBhdGNoZXMgcmVtb3Zpbmcgb2ZfKiBBUEkgdXNhZ2UKPiAgLSBBZGQgTU9E
VUxFX0FVVEhPUiBhbmQgTU9EVUxFX0RFU0NSSVBUSU9OCj4KPiBTYW11ZWwgSG9sbGFuZCAoNCk6
Cj4gICBncGlvOiBzaWZpdmU6IERpcmVjdGx5IHVzZSB0aGUgZGV2aWNlJ3MgZndub2RlCj4gICBn
cGlvOiBzaWZpdmU6IExvb2sgdXAgSVJRcyBvbmx5IG9uY2UgZHVyaW5nIHByb2JlCj4gICBncGlv
OiBzaWZpdmU6IEdldCB0aGUgcGFyZW50IElSUSdzIGRvbWFpbiBmcm9tIGl0cyBpcnFfZGF0YQo+
ICAgZ3Bpbzogc2lmaXZlOiBBbGxvdyBidWlsZGluZyB0aGUgZHJpdmVyIGFzIGEgbW9kdWxlCj4K
PiAgZHJpdmVycy9ncGlvL0tjb25maWcgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2dwaW8vZ3Bp
by1zaWZpdmUuYyB8IDQ3ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4KPiAt
LQo+IDIuNDAuMQo+CgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
