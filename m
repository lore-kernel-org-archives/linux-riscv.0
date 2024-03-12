Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D5FC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxMlIbeDUart3hFFWleA3AADp7LexnGsg43zUJV9h8I=; b=N2Ix51x/jr+3As
	Qa2yc3oVjLxwa8Ki5ExGM+0huzQUcAukU3vOgTU0/lNA317X5vpCTYzMzZe7MLKL/IaMLViqLhBNk
	Of6A08MjaTvj6QI2Vxx+HfOW09XTHNrRbBamvA969JhG2xaVjaGrpADefE6hDAREPHqKjuJJXdmnW
	Rh1MZL96Ybh2rTx3CpAWjPZy0U0Q0LgJvjU0ZJxS3IsLSSWsQ/XVIeDJpvRM8UfIvVr72ezc9qp5f
	1g73ofGPnslx7HKgxs9OhSLiFv/NVm9Ts+S1hxSlTg9dFpVK0KnYC1rID99um+R9dCydohq7EK4ae
	mjfT+ALv60XstJnmlOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7Ue-00000007EnK-3p1q;
	Tue, 12 Mar 2024 19:08:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7Ub-00000007Ek6-2NAd
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:08:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-512f3e75391so4610609e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710270529; x=1710875329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjcZWf/nXIQyIPUNxD3DTUa5JiAHVZAbpXSBI/PF41I=;
        b=bSOwdsyaxB3NHP9fWFwxibsefW2Q9kb+bWVMp3z3anoQ1yMx+a2xrNi9Un/GYNB98y
         uQr4lv0gUataWq9zRI7/C5Buu1Bm4BZgo/hz659aIbeLV6b2/li8gblDF7D41B75ks6K
         tz9j9hIU/wWhgRVA6eKfPjw0FrRPJwgTlxWmhC+xdi96duPaBhFr1KYJXDXyrMrqU7Ap
         JDVbZUqzqJcscTH6Vw2KAbS1gIZdM5TbN+QrgkTiaNxVG6mCv9HcGBpjcU/dzfAqYk+N
         yDqyn3Hly+TKdPmbCqN9QM5Yj2Gul+nooPob1WTnBMIYUHiGWVC5k1dtQTcfLUTxO1lB
         UvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710270529; x=1710875329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjcZWf/nXIQyIPUNxD3DTUa5JiAHVZAbpXSBI/PF41I=;
        b=B3d1TGZaZ0KTv0/IkKmKrsAtnd1XBiJL4w7kGlPVgEuH3MaitZ5GzjWvkEVTH2dePw
         nkNlBhgsHPmaf2r+dWDifX8cVdKn4HjuIorbXTxhrtIe2ZC8vx4cHujivQXEYMIS5zZx
         hnWHpaTFiIqvXWuvcrkGukuwXPJ0LO14KhPXE48IuQsJjgYJaAGVsRmYXYbZ3WQ0i0y+
         zuPuuAKtREPSw2Tw7MJtd9hMmKYYUer1OFz5av7wvMrF3TVM7J2bwNJpsi9ZSFYH1p3U
         6uOzh1LOBB96nLaR2lOtAYf/Q3Z6ctbjPRACh+rJAss9uc5MAjEMwjGxf83SL1LUfTbG
         3aIw==
X-Forwarded-Encrypted: i=1; AJvYcCUX9XQff3MTVsJ+CqcAK7KWxRX/H21CnoHZdVDxY+SWCuzwiuA5iyaaI+SMz0zVkEMOXVsv/ycaMAJABtpnzJq3gwHubPXkEwGUCP1QE130
X-Gm-Message-State: AOJu0Yxy/DDMbtyj5guPTZzuUdj3sgeifMuaBfCXF9sz4k9wSc9EYQRZ
	xoqSEp6l8ugYaTr7iHPS1s4DvdIleW1MeuJuZjBGEztfgy65iPD+BV56qmJBPWRgqazI/eE+c1V
	6WAJ22+cokVWlXSdrQvxL0ldqPuVyzQ7pcfxi4w==
X-Google-Smtp-Source: AGHT+IFqepFRXOh28CrZ94R8jR8QHTaaYGZhvEkRfy88tewlac/0l7Q1dZRIj80W2YM5/JpGF/ZIincLgKne/q2GfrQ=
X-Received: by 2002:a05:6512:3b94:b0:513:a977:933b with SMTP id
 g20-20020a0565123b9400b00513a977933bmr2233994lfv.42.1710270529032; Tue, 12
 Mar 2024 12:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240306172330.255844-1-leyfoon.tan@starfivetech.com> <f9cc5817-234e-4612-acbb-29977e0da760@sifive.com>
In-Reply-To: <f9cc5817-234e-4612-acbb-29977e0da760@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 12 Mar 2024 12:08:38 -0700
Message-ID: <CAHBxVyGuy=LngEeGkTAD17UDP1j18028XQbzdDYTL1gLFMDskg@mail.gmail.com>
Subject: Re: [PATCH v3] clocksource: timer-riscv: Clear timer interrupt on
 timer initialization
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ley Foon Tan <lftan.linux@gmail.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_120853_625384_26BB639F 
X-CRM114-Status: GOOD (  12.90  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgMTA6NDDigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDI0LTAzLTA2IDExOjIzIEFNLCBM
ZXkgRm9vbiBUYW4gd3JvdGU6Cj4gPiBJbiB0aGUgUklTQy1WIHNwZWNpZmljYXRpb24sIHRoZSBz
dGltZWNtcCByZWdpc3RlciBkb2Vzbid0IGhhdmUgYSBkZWZhdWx0Cj4gPiB2YWx1ZS4gVG8gcHJl
dmVudCB0aGUgdGltZXIgaW50ZXJydXB0IGZyb20gYmVpbmcgdHJpZ2dlcmVkIGR1cmluZyB0aW1l
cgo+ID4gaW5pdGlhbGl6YXRpb24sIGNsZWFyIHRoZSB0aW1lciBpbnRlcnJ1cHQgYnkgd3JpdGlu
ZyBzdGltZWNtcCB3aXRoIGEKPiA+IG1heGltdW0gdmFsdWUuCj4gPgo+ID4gRml4ZXM6IDlmN2E4
ZmY2MzkxZiAoIlJJU0MtVjogUHJlZmVyIHNzdGMgZXh0ZW5zaW9uIGlmIGF2YWlsYWJsZSIpCj4g
PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMZXkgRm9v
biBUYW4gPGxleWZvb24udGFuQHN0YXJmaXZldGVjaC5jb20+Cj4gPgo+ID4gLS0tCj4gPiB2MzoK
PiA+IFJlc29sdmVkIGNvbW1lbnQgZnJvbSBTYW11ZWwgSG9sbGFuZC4KPiA+IC0gRnVuY3Rpb24g
cmlzY3ZfY2xvY2tfZXZlbnRfc3RvcCgpIG5lZWRzIHRvIGJlIGNhbGxlZCBiZWZvcmUKPiA+ICAg
Y2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3RlcigpLCBtb3ZlIHJpc2N2X2Nsb2NrX2V2ZW50
X3N0b3AoKS4KPiA+Cj4gPiB2MjoKPiA+IFJlc29sdmVkIGNvbW1lbnRzIGZyb20gQW51cC4KPiA+
IC0gTW92ZWQgcmlzY3ZfY2xvY2tfZXZlbnRfc3RvcCgpIHRvIHJpc2N2X3RpbWVyX3N0YXJ0aW5n
X2NwdSgpLgo+ID4gLSBBZGRlZCBGaXhlcyB0YWcKPiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQo+Cj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tPgo+IFRlc3RlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNp
Zml2ZS5jb20+Cj4KClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
