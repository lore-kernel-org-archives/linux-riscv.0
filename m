Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8EC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VggsSktEBO7k7WUYKxEOwxOUFujcBQQAbGE0Xr0j8jU=; b=ZBY/NVmpfCdorF
	95s7x9JVi65NLkqZf2ee549gPok4/1AeY/OHjxmbl3McXpdjGGyBiRIlBgje0tm13Hy3EQvoi4OB7
	RXbw77gJTdnBgPI1lJuouJQu0KLaFEfsHnR2677+4htrEqsa4mI3jaets7+ChyKWCxn6/Fk4lBUWU
	/QdlZzQPW7t2qlzTOPIRRGjKO4iDXOABiTkHk3+7UnY36D8lV3SCrXuZ6L+n/5EQ+Q0NAj3udqa3M
	OTFJM8Tvu/bE5/D/Xs28YJZR0ivwybgJ29fFkK+VaKaILkI1ECKMyXgQahWoAnNfw/c0VineGsYR/
	Dzw018y8hihgqISzxiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewrx-0000000FZNI-241g;
	Mon, 03 Feb 2025 13:52:09 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewru-0000000FZMW-3T8V
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 13:52:07 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-46c8474d8daso31617681cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738590726; x=1739195526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mVVIkFEJaT8OVYZXmsLtAPpHN2DcsQyr/t9U6rVjLCg=;
        b=Z8nbgUUi3/EaIrIFnL7/x2TBnibsfpJ/NDGrP5ExjupRwq1LuVtt/u2Su3h5E/3XkR
         EzUQpeoP/qtxRdfouFXfuJAYiAdKrb/8d0ZcBZmQNHCA0kyWFbUx7xxYrT5sdzA1fRaO
         tdrUSNFf0TccM0QfWjY6Ls2kj9ocZZseTLpnjB7KbYSvJnPEVR7lI1TVCfpalf9s9Y4r
         xP7u07dobwQZ9h1uN4RupZRa0gHD8CVtyFhHfpJcLHwlB9A3mbvjBTPiyHUIAdT+jLmM
         troqBPEjf1NsOiZ5yed2HuecSDYPP1Ubv/CnrF54yD1NOyKJ0jk0wP+zE0TnLVBu1Grp
         YzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590726; x=1739195526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVVIkFEJaT8OVYZXmsLtAPpHN2DcsQyr/t9U6rVjLCg=;
        b=j0gAwwpBPX18u8zIMFbkuyvTd6GRdDiC6Z6iYoZ+Zv+oGL/LEQMB60ZLkCDa8zr2nB
         /cETKQGCNt9MRVp1KFCNtUzzNSV9erD+YYtOhVcGBujZpGxn0GBcGHp/8jeFKCi2IZ3m
         zfUEwYAutCCjbzYPd1IP1AN/1PoZGyK2z8eYU8xi6IkQdClyMdG3F49FAYGIFms/C3DA
         ltemAFveNjRjTm73nCRhtLO1XCJwbFR+V7bNCubQulpvYqiSW4PO6fqWR2LqLU6v9dAB
         kWp9LW2LIbx6epyMoisiU+Weqf8mFXj5KOzXOCBxCKcQVVJnwInmlCCqCMkLJ9fIxsPG
         yNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhWl7vGCvG6EhKR484Uru9EL34Tb+f0F1UYGpcVqpK+6t9rTj7TtNPdI5lYUQXO92hcYry4uib6P58jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YznbUVP46lRX+Ri7YNkdWbh0IpJKiPodsOaaLvNsMzhhlilrE3j
	BkFXbS+PwVouiDJG/G343zMaZyZVTfxLut3LDsvLAPAoybJ/yg2zmiZz4qfMq2U=
X-Gm-Gg: ASbGncuKTOG4UDky1fcuLbgTyjXBF+IYro63dxntwHIxJ3wwRdvZoZfJZI+8Rwi6kM9
	IFfPqq2SF76v8aeAqEo3ZLr6EPpqQbArmZ3UOhIX2NtBkkYCsdMKDhCgOw4iYip6QvCsgjZ+i68
	kginjA179ku7xVGEPF7xKjt2gYHfbFS/sHlLB/b5YmT+4fXNy0gCSHYlhzAZ7rNKoUlMPCh2xVH
	W76OfEHArG35q5kL0+7xvkSXyn9yCJ+D9FBEJJjcgBzTsQVOoUsqG4GPHFAPpf0AH2l4xd2GsSV
	e/oRC+2Thwft6BZvpm5D2wI=
X-Google-Smtp-Source: AGHT+IG1DREDrqF3xYxNZzwm1ndtBiVa4OQybfLg4yQAt6D5mkHaEPMmuoTDFccTftQIjA1j5K+MmQ==
X-Received: by 2002:a05:622a:2d4:b0:46c:78f2:cd1f with SMTP id d75a77b69052e-46fd0b68875mr301532491cf.37.1738590725644;
        Mon, 03 Feb 2025 05:52:05 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf18a42bsm48670911cf.76.2025.02.03.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:52:05 -0800 (PST)
Date: Mon, 3 Feb 2025 19:21:50 +0530
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
Message-ID: <Z6DJ9kmNx4JoqRg-@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-13-apatel@ventanamicro.com>
 <Z6CPvteWv89Xo70j@smile.fi.intel.com>
 <20250203105840.GH3713119@black.fi.intel.com>
 <Z6C1cg3cqik8ZxvU@sunil-laptop>
 <20250203123658.GI3713119@black.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250203123658.GI3713119@black.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055206_869786_8CCE9A35 
X-CRM114-Status: GOOD (  34.35  )
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

On Mon, Feb 03, 2025 at 02:36:58PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 05:54:18PM +0530, Sunil V L wrote:
> > On Mon, Feb 03, 2025 at 12:58:40PM +0200, Mika Westerberg wrote:
> > > On Mon, Feb 03, 2025 at 11:43:26AM +0200, Andy Shevchenko wrote:
> > > > On Mon, Feb 03, 2025 at 02:19:01PM +0530, Anup Patel wrote:
> > > > > From: Sunil V L <sunilvl@ventanamicro.com>
> > > > > 
> > > > > fwnode_get_reference_args() which is common for both DT and ACPI passes
> > > > > a property name like #mbox-cells which needs to be fetched from the
> > > > > reference node to determine the number of arguments needed for the
> > > > > property. However, the ACPI version of this function doesn't support
> > > > > this and simply ignores the parameter passed from the wrapper function.
> > > > > Add support for dynamically finding number of arguments by reading the
> > > > > nargs property value. Update the callers to pass extra parameter.
> > > > 
> > > > I don't like this (implementation).
> > > 
> > > Agree.
> > > 
> > > > It seems that we basically have two parameters which values are duplicating
> > > > each other. This is error prone API and confusing in the cases when both are
> > > > defined. If you want property, add a new API that takes const char *nargs
> > > > and relies on the property be present.
> > > 
> > > Also this is not really needed for ACPI case because it has types so it can
> > > distinguish references from integer. Having separate property for this just
> > > makes things more complex than they need to be IMHO.
> > 
> > Thanks! Andy and Mika for your kind feedback. I agree that having both
> > property name and nargs is confusing and also ACPI would not need
> > nargs_prop. In fact, I think ACPI doesn't need even nargs integer value
> > as well from the caller since all integers after the reference are
> > counted as arguments.  However, the issue is acpi_get_ref_args() assumes
> > that caller passes valid num_args. But typically the common
> > fwnode_property_get_reference_args() doesn't usually pass both valid
> > values. So, should fwnode_property_get_reference_args() pass both
> > nargs_prop (for DT) and nargs (for ACPI). Or do you mean it is better to
> > remove the check for num_args in the loop inside acpi_get_ref_args()
> > function?
> 
> Can you show an example of a case you are trying to solve with this? So far
> we have been able to go with the current implementation so why this is
> needed now?

Basically one can call fwnode_property_get_reference_args()
irrespective of DT/ACPI. The case we are trying is like below.

if (fwnode_property_get_reference_args(dev->fwnode, "mboxes",
					       "#mbox-cells", 0, index, &fwspec)) {
...
}

As you can see this works for DT since OF interface handles
"#mbox-cells". But since nargs is passed as 0, it won't work for ACPI
due to the reason I mentioned earlier.

Mandating to pass both "#mbox-cell" and valid nargs count looks
redundant to me.

Thanks,
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
