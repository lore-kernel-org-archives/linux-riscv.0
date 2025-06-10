Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C1EC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 04:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99wgaCl8m+s2v+PFZIb33EogayW/QwLwycfl7Sk85/Q=; b=kV7IYAggKwIRYz
	VDVwK+cSQe5BRhypjqastgdJFB4EssapHnvWATVmn7tihziarNqo206XS5i4OKTin0TMu92gJqAVE
	kK/avk2OWF6UQirCwDS3+wafTXz6Pu5qVfBsr6LbaO6AGSR+KA1rD6DbmYFkGQCAH57BkY8SYJSg2
	eyW8eiZJKbFXyKdRBirN9xFvY0DyvHIxGx6bdP5NgmzYsIKN2DncfKdxfUEeVrN1DDJFpjCCIujCP
	4VLD+WP4Xyuo7lf5SrVCeCsvE65SMWZH5Ns9AL/ALoxl42F4DoZkF01MAIdb4TUHUBL17wZ5ewVRL
	F26DGVaKVs1i5SN4j8fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqph-00000005lrv-3UrD;
	Tue, 10 Jun 2025 04:43:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOqoS-00000005lnG-2r7l
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 04:42:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234c5b57557so46022595ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749530535; x=1750135335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=aRzUvRunaIYk1hzvbNanZBceUTeVg+JdcPY5U9ArOpdZGpl/5baY3clPO33q8oKDCL
         trcJCWCj8yS0wovhcQk3tgEjlYuRdIIOheuxjWCxE28G5573hJOOjapcMy0vx9FONuhi
         w/Q3ygi0abtIfa2yM3ofRKcqjIidOonra0JAYnjoc6T3lesitZaUZnddlMUtpVPfrKd4
         FtlilZZU/1RGVSXxLbAMWSRdEUz1L0fKp0Q/XO0juinjK9XXqvlhs15emSK9HIzeZ1GP
         OSPRZj/5VHflBF6FYMgadw+WnEHk8karmXsN84sMRdm+Gnma1ilb7FQx/tNGlFb21kiY
         a9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530535; x=1750135335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVeTEtZcl1m4ClJ2o9p5dHCV4fbTAw96xygmKyHd+ZA=;
        b=RQ/p+X3dWEQ6s0IKlW04bBPoWOEJcsJFaxLsA+VrfDGr9TsSvtQgoKMG/xISqAfTvr
         7dBRg3AMHMRqlPQPUSwoFx2+J9v3E036xa7MLogd3WxJ3MVOq4d7H0HiqGvPngceOLi0
         g2LAzRnfG0099djMcLdDDkv+PlOayEn34kMWTR2KG0kFrOlvUuLpxoTGG3C3LZ2t+lE8
         3yBB5bYT0iaRuq5hkSWFc6IC07EprwPFxhAZPE8UUawX0w5nH3/XZz2xm6wuXyY9T3N6
         bDvUhslc67CwQjjDAJV7G2Ll68Li6Wa5TTCXj2buftOixl5Tse1KBI8/q7eG01rewkdJ
         Da4A==
X-Forwarded-Encrypted: i=1; AJvYcCV+TsKEfLe9VrfHzx4a3+6KK8blPWglZWtPdGdP4hlFe/OTgD+1Wr6AzIF8jBowrZJMWo5u5gaO+AEVBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2h1v7k+7kWrGOqiNJW6AHWkINGJjMLcJU1Cj7nXhvU/6nqaI6
	0ALNRjieizZHencbuJzehIL6CMjfRPqioxm6FKIbSPAVPYURBxZ2TRIAZ77buqs6QfU=
X-Gm-Gg: ASbGncsEupORtkYZ3EP5c++xjTJdkGdLIqvDebo6LEp6OWTOaFmTeBUaUxoTgUgypck
	dFP0K8/kSelfFcRMBk75OiQJVTQIJBUpJoPAV4i4ovBvUO0g85pCk9EzPOnnf4Ojs5trleL4kGl
	UQQJyJ7BkhD5F7Zf4BVrqJjsSkKhvTmY8sh8sQuVzRhTK0oR4aw8/beYOMX7dTdtFJH4rq+wkqG
	Bsn2Ls0Il0N/ukk1IikAEXSbOFjkmQHNDN2m93ce0mBiBWn08O5+Y1eOUIlT0cgBK4NPm/Cr8sg
	DTiKojdUfqEGAvBcUGQ2RyR1j60MxH8+LPqX0WTD65liRYs4P7zEJWCyNu8K10VyNvFQbA==
X-Google-Smtp-Source: AGHT+IEkTU+gBcq13St9Qw/Wf0Um/jTGbpeL8M59SViyqMxrr/ADp4BVSyewhIKv47GXRKYXDjzYQQ==
X-Received: by 2002:a17:902:d2c3:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23601d2296bmr201118235ad.31.1749530535298;
        Mon, 09 Jun 2025 21:42:15 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad3492esm1896875ad.154.2025.06.09.21.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:42:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:12:03 +0530
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
Subject: Re: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list
 in sorted order
Message-ID: <aEe3m23wIDM1I-AH@sunil-laptop>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-18-apatel@ventanamicro.com>
 <aDbuABrlO30TIrx1@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aDbuABrlO30TIrx1@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_214216_718716_03A6A6D8 
X-CRM114-Status: GOOD (  15.52  )
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

On Wed, May 28, 2025 at 02:05:36PM +0300, Andy Shevchenko wrote:
> On Sun, May 25, 2025 at 02:17:04PM +0530, Anup Patel wrote:
> > 
> > Currently, the interrupt controller list is created without any order.
> > Create the list sorted with the GSI base of the interrupt controllers.
> 
> ...
> 
> > -	list_add_tail(&ext_intc_element->list, &ext_intc_list);
> > +	if (list_empty(&ext_intc_list)) {
> > +		list_add(&ext_intc_element->list, &ext_intc_list);
> > +		return 0;
> > +	}
> 
> With the below done the above can be optimized (hopefully).
> 
> > +	list_for_each_entry(node, &ext_intc_list, list) {
> > +		if (node->gsi_base < ext_intc_element->gsi_base)
> > +			break;
> > +	}
> > +
> > +	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
> 
> Is this reimplementation of list_add_tail()? And why list debug is excluded here?
> 
Sure. Let me use list_add_tail() itself in the next revision. However, I
didn't understand the list debug question. IIUC, list_add_tail() is a
wrapper around __list_add() and doesn't exclude the list debug, right?

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
