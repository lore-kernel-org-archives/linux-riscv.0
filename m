Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFF7C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=razG4tt+GBJA8rZa3yQbeEe8szdEbSFhu5QLWoEUyk0=; b=ewTF/cneQ5A9WN
	1CRIYbCw8TRSRUNfwd6ij70/2mx5PyAL7DZKqI7ICC5m46SVlPKNuEKyWFT7ROei7HfCDbPAcqhx/
	gdyQ+kL7a5Q+k1/98GSYXd+LRpCaDR0mLuLkMd/GRoXW36t0vhlm7VjBh2EDcnBvyPdAYRsrJBi0L
	DbQZk1go5Cxcp1oOO4r14vuEVHma9FxUL7qKbtf7zBCTopz60oM8fmZ65B/xVDkMy4mS9OyzkW78w
	0scC2ztj/AkY34eS5NkvRmGmAY6CFNnWXau0hpJRYpCt6bzFgI8QdGbDoUL4lYD5jVEXuqvb1wa0Y
	7mS2RcsOGaLcDwpkwh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaZp-00FAQ8-GJ; Mon, 13 Feb 2023 15:17:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaZn-00FAP3-8J
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:17:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o13so12249360pjg.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fW9P4YF/3a14nOH87/GWxu30MpWhz8jhu4XnTy7s6ak=;
        b=h5Vlh1gY5rc7zpbKn+Y6D2QfpTGNjy5blXlIPIP/vu9xDQiPFQEknETCY/aSdY2Ixf
         XmT1+6F8o+mk/rfKRcJ1MgxW3LUNh4GucCzZkiKFGnGReu5hv7PZwldXIsevouVROrwL
         Wr6CsQJR4XU3q2Gl076MmPfJa0JUY3wAcq9ADPb+4hwlTGNl+D4XgR6Qv50M9sOJ5KqX
         r5v/a/1rHYBF/VlaBklsAOx5yYs4x8zjyPmbXd8i4ihGWSwcBLQ6UrbO/1/A83XWpaVc
         xj+G31N3gGli3nHdiMDD88MCqtMkdeRWTPGBOpuLd6xF1E3B7M6rWgnQ4u69IsTJ2Y55
         FhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW9P4YF/3a14nOH87/GWxu30MpWhz8jhu4XnTy7s6ak=;
        b=HQYSiHBVJ66MoOGZ+NVl84aJB+PJkdxBy3DMLHfhNEBZhLc84AMDuTk9g8beVVtioK
         xTTRd8yulyPWz/4CfT+5O2vnDga4b0Y9oxhAN9snoIfgjoh1eYI7AkbiIHMLigQJoGAG
         DZ0p5lTXEQKgXZ9gLl+7AZ/MoJ020cl/Y8LljJzRfJaUHuc4tuykhYT/SW1z0O6/hueL
         G4aDU8PcM2eo8yq5ZknMrt696DszMPcIxhX+ZykbF0bDXhkJSXMCW4564qCnKn/GS0Ip
         Z35mK6953a1kgMNY4qaAeMwF+651oTiiKswtqGgWj9L0Wzpvfm++KXdLkSXtwz9rXOLz
         tMIw==
X-Gm-Message-State: AO0yUKVwv7cDA1Sntg44C+oU3a7R+DvQmrm93mY39Mz1QZTDGeI7o9+m
	etW35xFto/2kvOB+pUqa8RxmFA==
X-Google-Smtp-Source: AK7set+fu87w7xVckZc0DhTU5ZxMyzfrfk9Q5YAK7jJg7eAg2wOdCS49Vbz2Fhc1bhaHIkiNCkZvmg==
X-Received: by 2002:a05:6a20:3cac:b0:b8:7905:b6c4 with SMTP id b44-20020a056a203cac00b000b87905b6c4mr28794030pzj.61.1676301425646;
        Mon, 13 Feb 2023 07:17:05 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id v17-20020a62a511000000b005825b8e0540sm8052212pfm.204.2023.02.13.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:17:04 -0800 (PST)
Date: Mon, 13 Feb 2023 20:46:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 05/24] RISC-V: ACPI: Add basic functions to build ACPI
 core
Message-ID: <Y+pUaAsaTBm9vPgO@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-6-sunilvl@ventanamicro.com>
 <Y+QM9zQyJfSgzc7R@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+QM9zQyJfSgzc7R@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_071707_316245_CB7B52C8 
X-CRM114-Status: GOOD (  21.08  )
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

On Wed, Feb 08, 2023 at 08:58:31PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:06PM +0530, Sunil V L wrote:
> > Introduce acpi.c and its related header files to provide
> > fundamental needs of extern variables and functions for ACPI core.
> > 	- asm/acpi.h for arch specific variables and functions needed by
> > 	  ACPI driver core;
> > 	- acpi.c - Add function to initialize ACPI tables.
> > 	- acpi.c for RISC-V related ACPI implementation for ACPI driver
> > 	  core;
> > 
> > Code is mostly leveraged from ARM64.
> 
> 
> 
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> 
> > + * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> rg "\bpage_init\("
> arch/riscv/kernel/acpi.c
> 54: * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> arch/arm64/kernel/acpi.c
> 86: * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> This function doesn't appear to exist, perhaps what you are looking for is
> paging_init()?
> 
Yes, will update.

> > + * or early_memremap() should be called here to for ACPI table mapping.
> > + */
> > +void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
> > +{
> > +	if (!size)
> > +		return NULL;
> > +
> > +	return early_memremap(phys, size);
> > +}
> 
> > +void __init acpi_boot_table_init(void)
> > +{
> > +	/*
> > +	 * Enable ACPI instead of device tree unless
> > +	 * - ACPI has been disabled explicitly (acpi=off), or
> > +	 * - firmware has not populated ACPI ptr in EFI system table
> > +	 */
> > +
> > +	if (param_acpi_off || (efi.acpi20 == EFI_INVALID_TABLE_ADDR))
> 
> There's an extraneous set of () around the second item here.
> 
Okay.
> > +		goto done;
> > +	/*
> 
> A small nit: a newline before opening the comment block here please!

Thanks, will fix these in the next revision.
-Sunil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
