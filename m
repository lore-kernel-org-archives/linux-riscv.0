Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC8C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqBw7gASY1tJljNIfFQ2NPF6YSoxQBHpAscgj1ynX18=; b=vmfhdAeqPx9Czb
	6vtnKXvfZXT8A6eIxF0HKbE1acl9nyBrNvEke9rhf1Of2w4Eqeyi/rdVhgglVcSf3H6BWom5i/OQY
	4sN4JzkMk+QajtezyafQ20S53G7vS5Ai5Y/+IWNyCD6D2tnARABwLaxqBS1fgCbfMpOur+ihYckwF
	OuBjb3iOaewlFfntbURaMRBiMjHECf9u9WXY3iXJE70/91rlxj1WqQA4DaVxePABv+mVKUMV3+LIY
	iBhcX4jUbo6cX6CVX8wkdXZ75+yKfoZ0NDLpvxPJrSJr7UHH+MESdK3fhu7HYIijcBVMF6SSDLfOU
	BH8myWg5NR7g0dD9tnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMFg-000000011V5-3YyL;
	Tue, 04 Feb 2025 16:58:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMFe-000000011UM-05i0
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 16:58:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21661be2c2dso100205115ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738688296; x=1739293096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwLeQKf0vtUui74lT12wFv843Oi1b36R7jDrobGeWGo=;
        b=E7lmk9CPb/wWsB05XFnp40o4X+jLBL8CrNQ1gojkeFlpz0dVJ9iPEQVTuplMC1zTfU
         KlOppbss76FHFxxPsbHMia3ub85lByBX4e8uznree8u1O/4EmNkVwnLe2JlHbPJlm/7s
         FHpoa0MY1ka3OKZO6upCkA31UOtr2zx0EoorULk9hnD6wqbASKyMXRpToVLYonm73xXb
         1MKDVTGe92uRardDeEdToMJyeWr5pbYQvoc7DC8hXBcFRMvgh7qczFXmg6BuIMzAsV7C
         ZOTxMCBaXPIJGX5tn0EHmCIRKyM+P4U00BNpbRtsTtmpqgWV2a8hU2A6lMExw+xWYWp9
         iPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688296; x=1739293096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwLeQKf0vtUui74lT12wFv843Oi1b36R7jDrobGeWGo=;
        b=isULOB90DKG2jbszBwalSo1h3S4vcEfoVU8J1dtVKvAqCO4Ki98DQQSQTXB5xiweex
         /OWmkp0JTSEod6a+Q+eklLNvTOq5uKzLeuxfBL3BXzqiLKMdPdN8ibtUgUEkaDGosp5C
         vAQji/mN2s1LxDsz09EuxP4TmtneWW5V3Xa+X5gDY0tYzfiu03BNM+WIo1opFIGps8eY
         4htNMUKyHze/JwHt/mnMG4U8yCURt2tHCv1EvXL3XvdSRqI0RRRm/ewcDkw+dTaqTWSz
         XuBqbUBDhcCVZLHSSvv+twCNr6ZJJdndTD8poUp+HHB2P+zbc4I7kc7Q+1WgCsQwNo24
         axUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEoCG4uZ249F6CX23FItZRNke7yXcjuzhmdVkkhncM177sq7fflCudVpImY9guG1S4UfHpNwLJlhVtiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxftBfLfNgLhka/subGibOdz27S3X8KudIv7PqWRihyppar0VIe
	TUUUmbTc3x6IjyaWjNeOjEesboatVDL6mHDH7MrPtmkMlXnm67skwC9Vf7ghONU=
X-Gm-Gg: ASbGnctarVe61TXF6nYg2m5YujUgk9qzu73dGhmwiRBYJS6SD1MWjhAeiIN2qHXUo9H
	r4rmIb4zRyAn05VCLOG9jI1vnrLOdiIsYbHT3bIcCjl4qx49khTxoMPFczgYHVb/bNb2HVCSHVd
	3SAYZPPj1/6Va48Y9nxV+5h67ExYctkLqTh5l/pv6z+Cu0L99wHvOPFBhXD27GO2tWbaOvKamvg
	4K33uLag3mzPWplV8P6OUV85Falok6DKoVVOg/Z8rVrN0N2E/B5Wl7QNSv/0osdYaEqdgk9r3Vs
	pkCunbRDNt3A7TdUfQUf0ro=
X-Google-Smtp-Source: AGHT+IH1Yx22xVxfTcYpwaH4xx/e93Sx3gcR5IYL+etceVupvjY9dDNCANrsvumn1lQdWQaHc/HUqg==
X-Received: by 2002:a17:902:d4c3:b0:216:4e9f:4ebe with SMTP id d9443c01a7336-21dd7de213cmr392230845ad.42.1738688296579;
        Tue, 04 Feb 2025 08:58:16 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eb34esm98292765ad.149.2025.02.04.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:58:15 -0800 (PST)
Date: Tue, 4 Feb 2025 22:28:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop
 in acpi_fwnode_get_reference_args()
Message-ID: <Z6JHG-nqFWDv-jpE@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
 <Z6DJ9kmNx4JoqRg-@sunil-laptop>
 <Z6DVDicVEgmSyGcT@smile.fi.intel.com>
 <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6DVn8u-2EwMaMR4@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_085818_064229_C5850187 
X-CRM114-Status: GOOD (  15.66  )
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

On Mon, Feb 03, 2025 at 04:41:35PM +0200, Andy Shevchenko wrote:
> > Ah, interesting. The original change that introduces this 3e3119d3088f ("device
> > property: Introduce fwnode_property_get_reference_args") hadn't been reviewed
> > by Mika or me, that's probably why we are not familiar with.
> > 
> > Since interface is already established, I would recommend to fix
> > this as proposed, i.e. with a new API. This is the way to match
> > how OF seems to be doing.
> 
> For the reference see implementation of of_fwnode_get_reference_args()
> 
> 	if (nargs_prop)
> 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
> 						 nargs_prop, index, &of_args);
> 	else
> 		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
> 						       nargs, index, &of_args);
> 
> 
Thanks!. I can do similar. But the change in
__acpi_node_get_property_reference() will be still required since that
is the place where the actual decoding of AML object is done. That would
be similar to __of_parse_phandle_with_args() as well. Hope that is fine.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
