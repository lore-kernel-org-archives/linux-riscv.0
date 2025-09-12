Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D90CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUd8HC8L4GyjWl3OKfdmIAZ3sxbRytQJP2+xQr7u8WE=; b=RSwSnzCu7t2X7s
	QTHMgU1e74+PQXVwq2u6jfIIEQF2n8z5OgXCn5bft8buQt+8tjM4V1s9ccd+F3zpiHVii4bNX5DWq
	R7SHOcryQTzPK9UsxwPtuHdAcaLQDrJGtfAJEUgBUKrlyS/wbe6Qn9wk7sJx/hhYb4YMb8WxPez/A
	IYLv53MFa3i+j7cRI//ZnnoTgepavnetwLiB7QkAC5ymvgdfZq29PAWW8gDbigI9FEDqbq7NY009N
	bUbDLt/Qoq0yRNURA6kUanpqL+VVITOmluezG7SORobq+3ejrq264vilSlLgEKfI6ADDbVnIYhzXL
	qvf1RtOo7f50I6fe7z9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2il-00000009Ax3-2Rif;
	Fri, 12 Sep 2025 12:17:43 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ij-00000009AvW-16gu
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 12:17:42 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b52047b3f19so1320450a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=cgVz16GcL9f2aBsFMf+itSiZb3ni/8QHHbnmOVKzE/qJo2TjEUdCrKE6IixC5ZJPGd
         gLYSLwoJt7vU+V5vSOHIpRyVIg7GoNWtBeLjBmhOcYquEZW9ltFNrT3h1ovD2z32XwJ0
         XXXXC+ZZGgEhy+bXjioy0iOvJjTKvVYPQkLD89TlAQKznbZpEbMcpjRxRGKqIOJCtExR
         rwp8QQuR/avv0RY/ZtnWoYT2MqeYgj6Zvb7ULBSQCYWhpAEo+rraO+pdpmRk9Myd0ZQc
         /ssjz09N8GLtFcDQjz7k8qx7cuSqwscTXjVeV57oJi44KFYeDzAl5rNIvKQ9weSOg53N
         cN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=Qj5mFRVtY1XW0Wrdr3f0GY6R333qxupaFPy55sut6nnNEw4dwqtS7ubKHe9t4CyDuA
         VHQ2V3zi2rxIx0ixvW7sIoidRVm+GYnSPxNZTI59X3JyujD6FEfgfD8XpZxvknYnv8QG
         wyKPbLhHnnumtZRR1t6sDrtW149FsukP7dPUwOi9/S26N4PXk6Pnq+2FI1TTpgeyAhTm
         ZFbJ9Ma1FP1FDxG7Qr16W35ZDwKowUrH0MXdzYtiaPCagNlLuSGRtpl7cdgzc2iXiR8K
         ZOF3AP9GD+JYzBfIR5l0X0UsDeZk9w7a9RDgZWdKzMC2rhIKDxlxdxNsY/Hx2xuBgN29
         e04Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgngFqs5QTPtDfq5JZPXTQmSmlsze5qTUpDZRblg7o/kx7hRE47czTmyJ9q/S6XeBWPQ/CnIP8oXJTBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj3iCWDmBQPH9pRrSa4eYrdYWU7Lh9G98W/5y7mfQEjlMtUQMi
	+obTZv0wkpvJTVRoRkJxNARmUZf/PtZDu+cQrG4hZFAxRXNvZ/ddG/k4c9FixVs5KxUmC/E3mdg
	ulKm1bNKxfvUsDc04q2XINXuOmxGddW8=
X-Gm-Gg: ASbGncuT2s8GHZ6VXrvb3hASpkkax9kaZwzgt2LYVn9DN9o10JKIOmphuvhzwpa3+Mq
	Hzoq/JCVwLwCccw/eMAXtEiHTXDQGKloY/WUuhh+zHeePKfSXX+SQ4NG97ouD+EWHs05rQUc+q2
	nimGhwp6CKDZ5HFiQ6vtzQNrI3qRaqo3gAMO6xufqU/xELAt87LG7WvXrEhwfRtpSw2kJFo7+iw
	bPe/A==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_051741_304347_E192EF8B 
X-CRM114-Status: GOOD (  10.23  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxMTo1MOKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gQ29udmVydCB0aGUgZHJpdmVyIHRvIHVzaW5n
IHRoZSBuZXcgZ2VuZXJpYyBHUElPIGNoaXAgaW50ZXJmYWNlcyBmcm9tCj4gbGludXgvZ3Bpby9n
ZW5lcmljLmguCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLW10NzYy
MS5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpSZXZp
ZXdlZC1ieTogU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29t
PgoKQmVzdCByZWdhcmRzLAogICAgU2VyZ2lvIFBhcmFjdWVsbG9zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
