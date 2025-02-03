Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D8FC02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRc3CD8Xp08xaWqStrwuuJeuMVkNHhspHdxq8ITYDrQ=; b=RuqfT4S6797Nod
	sh5TSrv7Zl2vqj7vuqWWSeiG1TJHvEYaIMu1bgHLXwTiGXoyl08fOHSzyXYE8KCF7LX0laG6/jqju
	b+Y4L/RJJxN+t4BOWoL7XDfzJDWmEcR5JV4KbbpuykfuuUOM9qmFzKnEjrCT6mlrAllJjC1F3mU8I
	8ucE8uaBChCpDtW2ImqJrNCEMqklGSKUN9lIP0oVgAlyQSaO4SnuL/L6GWoBOfwB8XAl/z4aZQsj7
	Hg/el4PWLzyMmJjKfBV3Fg5rt4Oy/6L5vO9w+jdcBdwkhG+fKhFFnqC693aQ+bFihR7UD+qBndDUn
	pYFaVf/mhQ5SjUcixNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyur-0000000Fwk7-0XrU;
	Mon, 03 Feb 2025 16:03:17 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teytW-0000000FwYQ-0IUc
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 16:01:55 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3ce7c4115e8so17769805ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1738598512; x=1739203312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=yAm5Rux0BO27sISDHE+aVuj/c+PKjSxAC1e4ch2vzRHZun/4Gtb8zjglNKp1fyNu0X
         k7KmcZ4nnDRj4UMiGQ510/PHYigtOl3tgTcrNIfsz1WYFi6f9WIHr43YUHrSZ75yS2a7
         VElJIhfdCjupMKL+QYWWSEUj/7YZVpbNQafpW778fNewbhheN/CgBeud8tvPI2vY8o3N
         FhlNZJ/9EwJUiOHl3h+TXEO2SpjOd6/8hNfM5xdVNnR6NLuw+z5TXCSPG2FmK9Pb/dx4
         GASK8K9efzAlxvF8s9n514Y2huGTXAkC1DgNwm1M6Whr3nWOXoxaRBsqweyRUi6SrEgF
         tffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598512; x=1739203312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=FG6h/oISLvPhCXxtws1KS7FuQFNvdXvdtlXwR7ZWmFnZ6zpM/YyA/5DJ3TxxMahGnd
         8EVNV3FnLF8DKhPwPfkU08qetupoc+EZGsiFsuB6D8HI6uZ/u4tJYAP/YeTBfEjE5lfj
         PmilheQ9r2/BpLZ0NBbkWj3MH9NAXcfHbade8DbNbEhQ61EkSa5ktycxxI0UlKUcUVHy
         DKEkgKdOkSl5geJy76WMW2HYYbIbUEY/OK4wulum3Ww/Q/J/jfDo7lL6IcocwM6GL5rY
         PhHUlkQiCsfYpspIArLvydV+Za1af55NV7461SLioAFH7ndTiqIdSAwxLFEopRU59ufh
         fosA==
X-Forwarded-Encrypted: i=1; AJvYcCUCBaL90RpslX2cDEGmZq/UlRODKAf+3rhmR44ABZfM8uxEqcflQ6V5P/yfYUHS5R6yMY6BKhkU+vsNdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDuAPfgSkqW8uCGO4f2Oo45XwRhZJLSGzfi7WyqyNOWaVjY0OF
	oEo7MlNxNmdhaiG5fuI/kwrsCKLg12cCaqmapsTTAY2qOn7HMqxpwtEOe+RXgI/q+YApoTXEF+A
	XmPm4ySiX1AUc5JFTYDm6QFSnaa9Fgk93k6IaQQ==
X-Gm-Gg: ASbGnctJRzg/Hfp6IReSGRb43rCk2ApvDGO5Njnf69OvxeMuU9MnPQOFbhWKDLVDvI5
	FOiAXrc+YPhvRQVGLyJDzXF7hn41fvOaXdkaZbZcmutZmzltcTo92KhGgRVhSLsSExj07XdBvtQ
	==
X-Google-Smtp-Source: AGHT+IGh48EGwTYFSKrKDNbwh6iM4EsoVfBSxF4gz8U4VFmSmI9atHaxKvm8zrK7zrd+YcMu62K8X5RTMCsgFSldYNE=
X-Received: by 2002:a05:6e02:1809:b0:3cf:c7bc:4523 with SMTP id
 e9e14a558f8ab-3d008eec85emr149079765ab.6.1738598512548; Mon, 03 Feb 2025
 08:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20241214172549.8842-1-apatel@ventanamicro.com> <87tt9bnmcz.ffs@tglx>
In-Reply-To: <87tt9bnmcz.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Feb 2025 21:31:41 +0530
X-Gm-Features: AWEUYZlO5PZddtosW3YVPDmyhEnZw9_BooCQby6hNDlavzyqwz_yNvI7qNklqJg
Message-ID: <CAAhSdy26zZNOfD8CW_MaYq0PrZCVef6gqD7b=D1KWNZpcqYjrA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_080154_102176_C8C7CE97 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgMywgMjAyNSBhdCA3OjQ34oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gQW51cCEKPgo+IE9uIFNhdCwgRGVjIDE0IDIwMjQgYXQg
MjI6NTUsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiByZWNl
bnQgZGlzY3Vzc2lvbiBvbiBMS01MOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDI0MTExNDE2MTg0NS41MDIwMjctMTgtYWpvbmVzQHZlbnRhbmFtaWNyby5jb20vCj4gPgo+ID4g
SXQgcHJpbWFyaWx5IGZvY3VzZXMgb24gbW92aW5nIHRvIFJJU0MtViBJTVNJQyBkcml2ZXIgdXNl
IGNvbW1vbiBNU0kKPiA+IGxpYiBhbmQgR0VORVJJQ19QRU5ESU5HX0lSUS4KPgo+IENhbiB5b3Ug
cGxlYXNlIHJlc3BpbiB0aGlzIHNlcmllcyBvbiB0b3Agb2YgcmMxPwoKU3VyZSwgSSB3aWxsIHJl
YmFzZSBhbmQgc2VuZCB2MyB0b21vcnJvdy4KClRoYW5rcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
