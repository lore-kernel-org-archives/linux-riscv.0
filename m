Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E02AC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNuEm5oPhyADclpDU/Thdmb30dp+uHw78WOVOQv3JRE=; b=pxOwqduNbuO4vc
	9/RrGEmtMeN77j00Ix0PCviyhc2qjA3jebpI0inRVvQb92tJy7dPJrCcQZIW3hVNWN6ZT7VPZ5uJE
	rgoES9Hi3C+JCR8fKxuSU/umwk9cqUVdch+7WPSZdkVDAjff8czabiu6LgbGIcI/PG96bk2Y2zYwj
	9NG/xm8LuC4cIKL2WFKq5nMy6PFfuZuZwm1Pwu+FBHeT/MIpsVQgtU83TvScUknKK0yd5MCOe5ajB
	ybCh9Me6BP3taG+WIcYO/+Ky+UvbJ5hXzbkbnjiLhMpJgnxyjPDmnFtpRNrDVOu/TrGBJhbq+6xFu
	jv5/VN376qjp5sqK2Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRd0J-00FkBr-7n; Mon, 13 Feb 2023 17:52:39 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRd0G-00FkAe-VU
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:52:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id r3so3065172pfh.4
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlT2nrHv97JEE2ugERQ9alO7/A7bMkftqWFyBvOXtUI=;
        b=pEaBHwVMb2YtjHC6RClUo8awsFmuS0Ru/0SJyXX8QrgJRN9D+hDCgtwuw+Lf4Q041k
         BuZF4Mxjg35xZ9xf7vFYYxMFwU/KF5H4MlNMbKGVF3jh54e3bCD7Ju2EEW4rDhcLEbvG
         +xkqtWj7AGrhPIv6bFc2Ab/mWo6hGTAwMQTTkVwvSEn2vjzT4IbMyZFsSYeNUBmcnJxS
         d/sHjBEV1PGvCSvD+XZG5jk74Of3zbaDZX07fLYFWs6GgOPX4yPZjaOBM2cftIUXSltR
         acBQGViAGcWI40++cyXnGnxKadZHJ1Uk0gPpMlIrnYXuFDkkAXE2TG/+tlvxrT80Lada
         DGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlT2nrHv97JEE2ugERQ9alO7/A7bMkftqWFyBvOXtUI=;
        b=Z0sCOQsjAg2wc+ol+FTDEId1zJsny33v7+jpuctJ6JBeqr6r6sxQCYC3VqFJ9cA+BS
         +RALrWalgYoFS89kHSDprBwXSn5Tx9LwJKHlOz+HN/dvm74+QEkFx97nYAB0Gjm1dBGC
         PEIR2ylFxLjxX7SCXchmpYxBoSaCeqBF7jLVIoXQSkpvJOEUDVzQkInB+JVPM9V9ZFJh
         mw48ukdkZobqnFH42X0zuUf91amK/hf7r0+chH/5n2Y+gilZY4b1jsI8kGzmzhpAF2aL
         qdb12Kx+MDw7rr8TfA4ky+as+7Tvw46JQqxyTRitgKj5OPsiyal0A5gvF6dLj67qeFEg
         IFjw==
X-Gm-Message-State: AO0yUKW8sJ3R3/2SH0C/OVhV1YTuKoOQYiIJORYkK7uWVFJWvOCQH/Lw
	Oq9V4DsYhOl6uYyzLlNOYqq7zg==
X-Google-Smtp-Source: AK7set8alFg61Xh23doaM5qBMsHqQlpv14xMzuu4uIcLFrgZ7U3iUqMJn6lB0L/b1/5c1PvcPAVyIQ==
X-Received: by 2002:a62:7915:0:b0:5a8:ab36:d0f7 with SMTP id u21-20020a627915000000b005a8ab36d0f7mr5756776pfc.14.1676310753686;
        Mon, 13 Feb 2023 09:52:33 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id u2-20020a62ed02000000b0058bca264253sm8153600pfh.126.2023.02.13.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:52:33 -0800 (PST)
Date: Mon, 13 Feb 2023 23:22:26 +0530
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
Subject: Re: [PATCH 21/24] RISC-V: ACPI: Add ACPI initialization in
 setup_arch()
Message-ID: <Y+p42n3bm5xkTtSr@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-22-sunilvl@ventanamicro.com>
 <Y+Vrd88ShoaDc0Pv@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Vrd88ShoaDc0Pv@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_095237_045804_79FEEBA5 
X-CRM114-Status: GOOD (  17.85  )
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

On Thu, Feb 09, 2023 at 09:53:59PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:22PM +0530, Sunil V L wrote:
> > Initialize ACPI tables for RISC-V during boot.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/setup.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 4335f08ffaf2..5b4ad1baf664 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -8,6 +8,7 @@
> >   *  Nick Kossifidis <mick@ics.forth.gr>
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/init.h>
> >  #include <linux/mm.h>
> >  #include <linux/memblock.h>
> > @@ -276,14 +277,22 @@ void __init setup_arch(char **cmdline_p)
> >  
> >  	efi_init();
> >  	paging_init();
> > +
> > +	/* Parse the ACPI tables for possible boot-time configuration */
> > +	acpi_boot_table_init();
> > +	if (acpi_disabled) {
> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> 
> I only poked it with a stick, but I think this `#if IS_ENABLED()` can
> be changed to a normal `if (IS_ENABLED())` while you're already
> modifying this code.
> 
Sure,

Thanks
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
