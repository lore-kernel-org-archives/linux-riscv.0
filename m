Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B52DC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFFrAorL1VnbQLPWnUOvRs902kkyJZaDV78JyzbpSIg=; b=TeJwHSJCwsM567
	9EyfZmLlJqpaF/g1xP7eCWH0wk97b16KZYWeEl7jXVeqKaOeqRvp04Z4piSlkoQJBpNIInsWU8qrg
	CLFKCGNNwk7F6AFcUdFKdO1UGzjMpRROOIDPE+p/dBPilHtcJnSAZL1gA680NciYj5aLqswvOQ4/u
	Bmgq01nmBPDRCiMpnMOPJCudSWCZ5MiWPeN9Tqg7ACI4Fc+eZFGhoURmGmttTbvmIc4COKAlv8ZI1
	K377fFjk4f/Dq8xgCxPxeKOOz/IBSb4uGEWZXzCTafkuwYEqRCu8RM81on2qiQFD35OaOe9tQEBxK
	dIPcBGIPpKFgVzln8zQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOyQ-00000008qZz-2Znx;
	Mon, 12 May 2025 08:57:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOyO-00000008qYm-2e1q
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:57:21 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4216759b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747040240; x=1747645040; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc3CqNV/8Mi2zP04knLd5VAdkGEl8lYzJxAs+HQXCEQ=;
        b=Jfyr+3knRVjPCcu6N/PPkvzwH96m3AP4EUa6qjWb0Nv79OsFyNcWUktof6j55fs2Lu
         /wJUUqvv3zyRBNGiYmLiDnvJEjiEE65/cmroZXRCVIOihB3ka1ixcu+d3A7x5WZdhRGC
         GlR2FxuFta8DkdrB9uWE18fBuraHXytL2AmEzxvJHTG1PcU3EdxZwvt0YfZm4WoMWGqD
         GYjX6Wc6HQ7+R7Hr6OmydikpKhUn7HgCKWN0mNwxwGLmBwwXU/ZZhTp6iqUntr5DljdH
         QPf7h9XeivmviM+3h6p4MoGljdy8LWKFJEMkmRcKUHV2nPgW/jKM8GaeCyXG9TBXRtbg
         PFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040240; x=1747645040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc3CqNV/8Mi2zP04knLd5VAdkGEl8lYzJxAs+HQXCEQ=;
        b=V1e7WSb+c+6okxbXCyw94nrDdO+wNtwDQpqDNhhACgBfrZVy5h0pfEjdtN0VgZCHVZ
         J5bEJCGus+79OWHctUv2paCbqawq7G+1t76XC8Zu9pJs8N+iJMTdf9TVQ7Ez22KM9weH
         LgiD/rGFQ1g0HUBPFakrpb6LdTWisfMdafWALLYko0++Xz4H/bZwuKTxNdSsFf8pjAiJ
         T3jRYH9XnHhvu7N7YjcASk9qeQWEErnk3zu/gxIoGrL6hYqrcWGl7pLUqkCpPbTgSiVp
         s9QxSJ6g/9OCrW6+vzRjvwZ+nIeX+z4JGAgetv2oHkwbnu3xYtNmIHmITop1vijOtdNn
         NQtw==
X-Forwarded-Encrypted: i=1; AJvYcCXgkAZmapOoCGZjbarar50YICXy76BICb/MjYNYgaYUOtvqJ3vYhGPXtW0WNi4brUqcpK7699DvouQYgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YytHelOaeN/G8JvlUGGaNTKLRkxGevPdvNm+/AeeJynSSqf2YH5
	hbFWoBENh2BpuO5FLLOHNWV9ELo8q5jLn9ISf0la9FmLOeZ2Dcrx0zjZIpKosxQ=
X-Gm-Gg: ASbGncuhtAQZvD1PgkFUZDJJ1EQm/FTj0ROP1K7NbEXThC232oGoG1AtaZ4BXLLPAwh
	sh0jJo8Qa8290kVggLoLzDnCRUn5ichPLgjDrnY6J4k8QEOEqKkfWUjw8IYfkU2wIzmzMjRIvqr
	3jFQ2m+uSyFu5+taN9KVwtwPIzDT9g0qUzT5H96gnwsC6Jj00fyY/NhrPkLyg/WyeGu0sqd9W+E
	elPPdwYTHZkAf1nQj1FwzGeTEsN/6AIEtCG2HUqMdtLFN9fsQ8PLinhFdiENbIhKGua8YeziIQk
	TVpK2WxJXq+hY0E1copdj5jojdvmP2vu1QB765qOt1XLxIywTEPwGw0RHrk=
X-Google-Smtp-Source: AGHT+IFWgBjdZaW68l9bQibLY9baPAwDqAl5/2YWyRVkP0+/oKFF3fyXGC7vyJbnIM52riOnSv7fSQ==
X-Received: by 2002:a05:6a20:8792:b0:215:d4be:b0ad with SMTP id adf61e73a8af0-215d4beb697mr3485599637.28.1747040239872;
        Mon, 12 May 2025 01:57:19 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b29casm4459423a12.28.2025.05.12.01.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:57:19 -0700 (PDT)
Date: Mon, 12 May 2025 14:27:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCG34XoERpmESesO@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
 <aCGzFVXFBVRbMUKz@sunil-laptop>
 <aCG1kqi2w2EUKWyO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCG1kqi2w2EUKWyO@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_015720_667828_2A7EC7A6 
X-CRM114-Status: GOOD (  15.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 12, 2025 at 11:47:14AM +0300, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 02:06:37PM +0530, Sunil V L wrote:
> > On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> > > On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> 
> ...
> 
> > > > +#ifdef CONFIG_ACPI
> > > > +	if (!acpi_disabled)
> > > 
> > > Hmm... Why do you need this check? What for?
> > > 
> > When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
> > cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
> > missing something.
> 
> Yes, just check that the companion is NULL, rather than the above.
> 
> 	struct acpi_device *adev;
> 
> 	adev = ACPI_COMPANION(dev);
> 	if (adev)
> 		acpi_dev_clear_dependencies(adev);
> 
Ah Ok. Sure. Will update.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
