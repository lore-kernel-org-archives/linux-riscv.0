Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFBDC7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 05:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1+ymYXd8VlO6QqCrQdtE2HAp3g6aaMtVjaoaytj6gk=; b=zjvLYGkHVyRoBk
	H6oWDqJ4092stzmqK+5FbHeZCN7cTjGj/HFcgmPKnyFU6n5IQUgHZDZ3aEFTKZGiAyMGAeP7AZGIu
	rv0PmMwplenw1HxgYDN04yJxmG57Opy54zCOuYqsfNuKEvtKcNm0H0L3gtNlIHuViWSGzkTq/cgsw
	mSOsOQrqgLeR0fqvrJxinBm/bksUDd5XfTB5EAW1+xpzPJZM0mTbP14t4W4D/tN6HZE5WjvtwWuHE
	BPz+XiJpTsv9zjyM29PKP8DzhvNZ59W86ZpNF+8V7wd7xRZnL9r/q4gVt6Njib8pWntMnu9ME3b83
	9Zv/fGSB8/DsgLwYn38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6tm-00000001FU8-3zNV;
	Mon, 30 Jun 2025 05:17:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6tj-00000001FTh-3XlX
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 05:17:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2912594b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751260663; x=1751865463; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=Dh1K/4asSfh/jFGROENpU4W7oOS9ywp5kLEGWsqPOZ+yjLxUArmz89KrSsUWAp5vQF
         i8vUuQAaERETgulVCpuFoW6jn6EIjnzx3Cecp2ferYt6Lik8i06KdXGMqsydRbdbSZTX
         c93Wvk88wy5ZJM+iti+LTRQ6AxkdQQKzM8pViQbLYRBE910ZNeGcJpvhjSCE5nJMqr6p
         NYR328ECsDLvfQnE3WBaraS2e1Eq/9HZNRcpvl12SOELMhuhJ+18zISbJ17w1pO50NvV
         bzJbngfF818Dc0f7cITlA0C1MqDnyv1E0MeVha4I5WyBU+IYzzoSajVTgHuZZc6722uH
         9bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751260663; x=1751865463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=nt3gOx1Gex1HfowhoPtVJh9Kj8bx+iv3qMxq3TYjdWkk1bZ30l6q86xktSkToVDg62
         KELD+OagkD9PlLZZQgUTVoOwWWf5AMv6ONhikVG9E9j0q1yH1g4Os+7dzJQZJY/fOwdn
         0CBQz1mZ9KTBO026UngQHVbk4jRSGp24xbYxyidYYR9OZ1qbz1OFro9V96wxvAp+TPQf
         iUZ90ANZxCoExgvdgq9fBBM9bH/FrD9Vq62jKV7kRawTMrGw1cmottq+ZD7XQ5rO95IT
         CWhVyp/CLRlkzPMRdhosBNprK27DLpwtPH9AQz7fKt0q322UwDkwM7HgXP5ETaM+yUyK
         pNvw==
X-Forwarded-Encrypted: i=1; AJvYcCUIUMFHrX9PFHLuw3MqZXpRGBXVgrIOhTnmOSG2XWWNmilzhZb+x0ZxLoTuE2COvbKnKYGLTriAmcsFtw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8OrkEsLN2/VCOogEIKIayq2tk6KEvQK7ncg/YJcOGtC1mYCE
	KfUsIsCUB5cysKzPjeLuudXbmy2ZM+tppQkERzGsqzWRr6PcBCToYd+qDMIugI18Ggs=
X-Gm-Gg: ASbGncs4YzgWVVkKvClrdOJEze1N77uuKr+cvwArDfkf4jNhYLAYfyDmScQd3irUwb/
	TjbAvL0Cf/xuLofaubKdD7shJgyhgZKiFrpj8EplpLEQ+T+3ENz/jBSt4Tq03UOaHhDyUHzVkUq
	vjsRgbLeWyQjBXlqD1jmJjl8huNzM5AlLvzT6nVWsAMBoPfoeCeahSK70ubB65OFos2eC+yIll4
	U2ospzIXKeWRepNCYGaC2OexEz24feFZiMrhjf5DzA4gJrE2wFTlNNgHR62SZyjOd2sObdN3kBN
	zOIBf7YtTsJKQe3MW0swH2iUMWXWrX9fOLh4zi2wO651LdHokBIx/TFo6+4XW1FvRy2mE5GtJ5M
	O8zWK
X-Google-Smtp-Source: AGHT+IEHPxZf5K+6rB6h+G22ROpgqRBCwgyhaeWghhTRXeAPT0VUHYSFlG21O4cgJMdUdvOxbVQ28Q==
X-Received: by 2002:a05:6a00:3e17:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74af6f2f9d7mr18261164b3a.19.1751260663025;
        Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56e3ac1sm8021982b3a.145.2025.06.29.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:17:42 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:47:28 +0530
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
Subject: Re: [PATCH v6 14/23] ACPI: property: Add support for cells property
Message-ID: <aGId6M_0D0qERUu_@sunil-laptop>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-15-apatel@ventanamicro.com>
 <aFka3y1494LIzyUA@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aFka3y1494LIzyUA@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_221743_888067_E0202B54 
X-CRM114-Status: GOOD (  21.31  )
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

On Mon, Jun 23, 2025 at 12:14:07PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 05:43:49PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Currently, ACPI doesn't support cells property when
> > fwnode_property_get_reference_args() is called. ACPI always expects
> > the number of arguments to be passed. However, the above mentioned
> > call being a common interface for OF and ACPI, it is better to have
> > single calling convention which works for both. Hence, add support
> > for cells property on the reference device to get the number of
> > arguments dynamically.
> 
> ...
> 
> > +static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
> > +					       const char *nargs_prop)
> > +{
> > +	const union acpi_object *obj;
> 
> > +	if (!nargs_prop)
> > +		return 0;
> 
> This check is implied by the call. No need to duplicate.
> 
> > +	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> > +		return 0;
> > +
> > +	return obj->integer.value;
> > +}
> 
> ...
> 
> > +			if (nargs_prop)
> 
> Again, if you don't won't to reassign the existing value, it's better to have
> this data be collected in the temporary variable of the same semantics. Then
> you will choose one when it's needed, no need to have this dup check (again!).
> 
Okay. Let me update in the next version.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
