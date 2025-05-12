Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8324AC3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sQ1JjBrrou7R7DRZKIbJ2P0ya4x/Hh6SBOH9BMOzZI=; b=cQK9RlAaSJA7hr
	mbrzz/jrh6cUgV2izg+saNJHIEG+rNow7Wa3++QwAQFLAJvRdbhtkKH0u3ZqGDesCh9E8p1VULeu0
	rwwYTw9HwR0+wOiyyweq04msH72UaSVXM9THNVszVCjrVhGJWkhgSBEdXVbWx2n7PCw639ATYggMS
	gYGQjy8ggy9W+cNUuShDGAmIwoDxmscSOkygDpxvGONFTt8sjiCk0aH3ygKuJ+8IR5mDArp0mSkUn
	rodikbaNxbUr5eRj1qMnlgi5NpTiM2LU5MAfaqYI0ZGah681L4Q3/n9mzlnhDjVr4SJDjiZOzqrIo
	EDzpyW+CWKvwwtX+27XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOf0-00000008m5T-0f1A;
	Mon, 12 May 2025 08:37:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOZ3-00000008lAr-2wvc
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:31:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30c35ac35dfso3019084a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747038668; x=1747643468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzzZU6pvyYy7YIZ/GFIFCMgtFSutDNrqjC/VQVHvmcs=;
        b=ogN2OPz+RrWMuynXrkB0e9rkNEILeODrIwMLuoRrlzPwD56GCXFG+zamCYyTqIeoCP
         3gd3aDZ/owdjgp6cC/77FqSPKPlLxAU13dXNruZZD7/B/k+nkIWUsiQ40WgImqopc+5L
         S+zH2wiQH6Q22vvvgq7nUSeB1mlM0+mZ9tXcAy9+8MzSKxoNFQt5b85AiC7wQUqfsFgp
         I5EAbCMcouhArdz3TZCcour42S4SOtjahsmwE7zapaB1lQBXAQFmxNNP7cEP8R/ov5g9
         o3vWBLRiVpVjtkQ9ca0EhRDT8DwLmSJxtIHrszRBaWzc7vIWjj+1zyT0jpArxnyojjum
         XFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038668; x=1747643468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzzZU6pvyYy7YIZ/GFIFCMgtFSutDNrqjC/VQVHvmcs=;
        b=E2yfFvaM6eIdjndbSdbd8QrFUHhhLDA3sANpQIQwEU7b+8AAy3oDgPBlwEUfzpwzLG
         eXxvTdzz89rQJEsTwU6Mc4yhMmZy0L5af7N0UZ1ya7rUNUQjH76BlG51umuW4XdUAkbS
         jJxbn0N03IOcuSqhifWd/r3HJNcvLili8WzN54fBQDqiSL+N89rE90xDRWWUJVWPQAZO
         ROs9NcZ+o2VczikWgBmj6yD+DjJVbIKfjUSkMiRT9POXkV6DVCJFqb9RX9XLnDvxe2ds
         TPb2bnQzJe1wXqM/Z5bNDDvWdsdWkmDZFkqFiUJN6ktMZ7XAhA7K8bnDSBQHNY4ui5YE
         dfdw==
X-Forwarded-Encrypted: i=1; AJvYcCXu/5XLEq5se+jpi3R1tITHeU8ze7KbGLEP3FxTk3cpD0fdWolIrpTWstmbo8l0DC22kxEAlk4/ZghHIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw13Y/XF8tT+S1F9KgJJgK06Ylz6XS3boE0Lb+lIzlWiGRXW3w8
	jg03CUWFfRdTeMacLhEV4mO90wiF43JeWRccWxXYB7ZeS6JIOUI0bXv40r/wJts=
X-Gm-Gg: ASbGncsPK1g2SWZTIxo+cVafKyVxcT3wZQGVD1aAZrrYKEHR62BRthp/aCndtUM778v
	ZnXTaCb5Neuy7reA4Pil4O3fy2gd0k+XD2K7PmsdCupsblJeFQu1C+3VoKrU/qD3mqiSOsUp6aJ
	kInrKkncYEhv1iF7DcVzbpjeRlSu73zfDmPfCe/lzEfk0EgPlUkNL9hX3t74wZH82RZp8oX898r
	dvIcer5KnS+0DkmEbz6SyAe9slPC41rncZT9Hd6FY1hvQ9riY7y8zU/awEiBO8frzkqUYN5COac
	AbRTdbnxiGGJTt2HKmgEV3n18TAFGFaJ52r1I414Y+pnEOakcmeTh7g+E9k=
X-Google-Smtp-Source: AGHT+IGHNaTbk9KHcwLFc1JRN2apw3Jv/AHhjSrIdSWvDZ8yqVhUcJckbF0S8Q0geEc46Wby78RCbQ==
X-Received: by 2002:a17:90b:3945:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-30c3cefe5c1mr22528948a91.14.1747038668235;
        Mon, 12 May 2025 01:31:08 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe21a6sm9135565a91.31.2025.05.12.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:31:07 -0700 (PDT)
Date: Mon, 12 May 2025 14:00:54 +0530
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
Subject: Re: [PATCH v3 15/23] ACPI: property: Add support for cells property
Message-ID: <aCGxvuHwd7TzfDOS@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-16-apatel@ventanamicro.com>
 <aCGgZPJUQdAnWa-z@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCGgZPJUQdAnWa-z@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013109_747237_7D0C43DA 
X-CRM114-Status: GOOD (  22.60  )
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

Hi Andy,

On Mon, May 12, 2025 at 10:16:52AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:31PM +0530, Anup Patel wrote:
> > 
> > Currently, ACPI doesn't support cells property when
> > fwnode_property_get_reference_args() is called. ACPI always expects the
> > number of arguments to be passed. However,
> > fwnode_property_get_reference_args() being a common interface for OF and
> > ACPI, it is better to have single calling convention which works for
> > both. Hence, add support for cells property on the reference device to
> > get the number of arguments dynamically.
> 
> You can reformat above to make it deviate less (in terms of line lengths):
> 
> Currently, ACPI doesn't support cells property when
> fwnode_property_get_reference_args() is called. ACPI always expects
> the number of arguments to be passed. However, the above mentioned
> call being a common interface for OF and ACPI, it is better to have
> single calling convention which works for both. Hence, add support
> for cells property on the reference device to get the number of
> arguments dynamically.
>
Sure. Let me update in the next revision. Thanks!
 
> ...
> 
> > +			if (nargs_prop) {
> > +				if (!acpi_dev_get_property(device, nargs_prop,
> > +							   ACPI_TYPE_INTEGER, &obj)) {
> > +					args_count = obj->integer.value;
> > +				}
> > +			}
> > +
> 
> > +			if (nargs_prop) {
> > +				device = to_acpi_device_node(ref_fwnode);
> > +				if (!acpi_dev_get_property(device, nargs_prop,
> > +							   ACPI_TYPE_INTEGER, &obj)) {
> > +					args_count = obj->integer.value;
> > +				}
> > +			}
> 
> These two seems to me enough duplicative to have a common helper:
> 
> static unsigned int ...(struct acpi_dev *adev, ...)
> {
> 	// define an obj variable?
> 
> 	if (!nargs_prop)
> 		return 0;
> 
> 	if (acpi_dev_get_property(adev, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> 		return 0;
> 
> 	return obj->integer.value;
> }
> 
> Yes, the nember of LoCs most likely will increase, but the point here is better
> maintenance experience.
> 
Makes sense. Let me do it in the next version.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
