Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4095CC02196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3H5YJIYP3Fbr9O0nNZuhsu3A0Nw1FJx4sIkfyp+6oU=; b=kti7YpNVqCCwyi
	4ZiK+UTiWqKny0RUIzkcYO31FVKTvth0i1k58AttQkKYUonzAoYHW5/GghxJCvKY+idLoxz3uICR0
	jdYuct32Uw8CO56H0mMQeB1SKmitI7EvqStXXS5dgXg9MvNf1BPISOfJaKoehVxLappZKdhEi/uUX
	keETv2OZG67JmjROlPIg6sSHUMqLTaPiJdrX1ZpaJKxZ7MMHOROdTedGUAmVFM5PgA1OaXIa1dpYc
	9Aah665BQSHS+pqt+ByC47OxmhwxBI4wR43TjWJiMQ/54yW2y6iukeM1z9XREZdSOG0VF0UZ4kuIX
	np638FXHJbEMhCItbLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevge-0000000FOD6-3Ul0;
	Mon, 03 Feb 2025 12:36:24 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevVE-0000000FMZz-0clJ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 12:24:37 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c0155af484so352454885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 04:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738585474; x=1739190274; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ApUlLTpGY8QIpFfh/w6kk6nMf7s8VLTCzZhJ/61KofQ=;
        b=KOZlIQaEqYz+mIv+x2tuywUK1whVsqWbFh+ZOTHFUiyObjgO5Hjfr8mFAVgIB0ZKfI
         V5HVaS4CtF2g7V+BwCRFppBx6tp/1VQ0BBGpxv5nFf2Yx43B8CFlZ3K3Bi3B2MoJhzWz
         DlA/MVzXBxx3hSLMnqMvmCYJB0SLmevw0y9n26AciSH04dvHA5LrNdqByz9hpdjXbQln
         +IFTFnh15GuJ1QTFr88j8Taw2/BExjAfjO9eUyh/UxjD1LQlsqwh0vPAc13RB4gQwo8o
         BA6qHdrzVVQeXBFGdpFnM8s78pAmj6MpTGyi58wHxm6Chfw/krRROaCATNhdNgm8MhIn
         ysKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585474; x=1739190274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApUlLTpGY8QIpFfh/w6kk6nMf7s8VLTCzZhJ/61KofQ=;
        b=ToRppNiuEEXim9NQEQ/neuLIY3ljJ2vTN0/vHgZu40mXohN7wbOxAeoYf44iKTt9dR
         TVa6Q6Th4Ss0XrWGxFyaIx9lFGKyuzgq+i4stIXgAAs4HSbIhZ9LpC4hJ5ve/aQshBoq
         a6sXKyijZaqIPO0F/xJWmYPlPB3Ojdk6uNA6VYfvulpVJy/HUvvOKwB9ty6lU420Pc3Z
         nFuSwIaGGjvZsV++bELwluBYznTEU7aToWUmSsNVRSP3BXsXe8aDTint2MM0UivuMCm6
         GwAOwMjjUD69dmjxUlbwngCzVmVUhgza0h/MdO/PZltadSLVLaKyA0nah0O7lxSfw75I
         snhw==
X-Forwarded-Encrypted: i=1; AJvYcCVMxH88knMEofZUt96XHDk3ByVV3Mff/u9CJON4u9l/maTUnFDhPAP3ZuHHv26q226ZY7X5IdeUi2Li0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAVcT3QS5IXLlqYT/y0fR1rCGzT3cFvjRLSnvcu4n3yesNvqHg
	Owcb9FBlAtrnlQlE4fegyRElS1Yu+fNvFzRml7cVE8pF2t8ofb60qgeGIvttv64=
X-Gm-Gg: ASbGncsLhpJ4UafMpfvjqNkzNicQIWQcdok6aHJYxz2AKTwNvejAvl6wplD9kI7s9i2
	dKPNP1j4n/OXLr580APLRIQgFXs1LzjN9fTxN9PPkiJWEIBDis1U4Ubx8KCINVsHLymfDqvNXJg
	zimi7Y8BIg4c5Z6VkWBHWpilzF+0WH/ThE3xk8Gye4oeSCHrin+m6I2YSTdipGQ7f736osesgGH
	M95S6G1eJV4qNlVf9h/IoK+ZxssrQ4WaMF5Xo5DPhH846mZyuf13i8BF0UnlsqFb7Onmi/RDZDB
	VdZJVBDTUxgaxRpsCh3w2A0=
X-Google-Smtp-Source: AGHT+IFeBMX4wQkkK1eZgQ8lEKlzFJNSPxCZvzrd8VL8RcDP/uXgxJnPmX9jLerE3byptPWEc3Kg4A==
X-Received: by 2002:a05:620a:2719:b0:7b1:11d9:446e with SMTP id af79cd13be357-7bffccc9b53mr2979634885a.3.1738585474447;
        Mon, 03 Feb 2025 04:24:34 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d02b1sm518627785a.43.2025.02.03.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:24:33 -0800 (PST)
Date: Mon, 3 Feb 2025 17:54:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <Z6C1cg3cqik8ZxvU@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203105840.GH3713119@black.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_042436_201240_719DB517 
X-CRM114-Status: GOOD (  25.27  )
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

On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > 
> > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > a property name like #mbox-cells which needs to be fetched from the
> > > reference node to determine the number of arguments needed for the
> > > property. However, the ACPI version of this function doesn't support
> > > this and simply ignores the parameter passed from the wrapper function.
> > > Add support for dynamically finding number of arguments by reading the
> > > nargs property value. Update the callers to pass extra parameter.
> > 
> > I don't like this (implementation).
> 
> Agree.
> 
> > It seems that we basically have two parameters which values are duplicating
> > each other. This is error prone API and confusing in the cases when both are
> > defined. If you want property, add a new API that takes const char *nargs
> > and relies on the property be present.
> 
> Also this is not really needed for ACPI case because it has types so it can
> distinguish references from integer. Having separate property for this just
> makes things more complex than they need to be IMHO.

Thanks! Andy and Mika for your kind feedback. I agree that having both
property name and nargs is confusing and also ACPI would not need
nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
as well from the caller since all integers after the reference are
counted as arguments.  However, the issue is acpi_get_ref_args() assumes
that caller passes valid num_args. But typically the common
fwnode_property_get_reference_args() doesn't usually pass both valid
values. So, should fwnode_property_get_reference_args() pass both
nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
remove the check for num_args in the loop inside acpi_get_ref_args()
function?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
