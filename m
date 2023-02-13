Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD382C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CK9KSOz9u3Kf1wp2hbd+ZCSwyTH7RupET1ZiwWeKpFM=; b=Y7E/LQ0JpR2qJl
	dQpfUK19UWej69g2uJnMgHghLPyo3XpMImkctB3ZkxwAhYeV9GWLUw6RO1lVk1H06xe+bxcFBa1YM
	McmYFjY7uxN2S4Iw7GOCqqAAwSw6Qng0nVGGFMzys9Nzgg6ri7m4TQMvX9DWdwzuzlKOwd/7cADYr
	Mpz9wrDxTp3jY/J1pBPYIlylabrWyF8dGHw8CYPtBysw9nTKRRpywy+R+sUduJrluQyOfjfrmbARJ
	KKEpSGw5fFJyGqdgAYMuZRJukxU8iWkPPIos1OSBvmU9My8YXG9VqlMTIIGSZiVyolz24k26zwIVT
	Ckh8j1bcSv6d5L5KDkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcnk-00Fi2R-L8; Mon, 13 Feb 2023 17:39:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcnh-00Fi0a-12
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:39:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id mg23so6083699pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6a6ybMdzwmsAq2eExsLYksMr5wMk1cwEz6ueJMHefY=;
        b=S1al247gcEL4BcZ/hYaKhkRKclAN/d/Ale6FwEo92a2U4NKMQGnnZfv/pQtwbomCPn
         xel0nlpjF31S2OXDqLyxhZ1GBfszQEiHN9drHwhUOHzllXGvtfWZlupGXFOEfcdKpbGN
         aCrGK03AEEhPOslZVns+Z2YoYJIz8kuUgJrMPX9B6PAfhNx6Imq9wt2yJtpu47XE4Knw
         BOuESdlY9sH87qSdwOTocsIj1/gwgVmY33KepTg0WN/atyjyCQPVEoGwSKxtaFrSNLw+
         ODBFjQJyrvM+d+JUUB2AwCMsuVYZcZ9KHmn/LoJWrDLEmkwBVR/EZPk8K+Mvb4RfmSlb
         bklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6a6ybMdzwmsAq2eExsLYksMr5wMk1cwEz6ueJMHefY=;
        b=ji7dcq1ILY7pg62QKit3s/qrnS9turLhK8MHPVXLg3K3fBZqRd/THMmXd25jFb9OcJ
         P/KkBkfV1ES/EDGIBMZcsEd/DrwFSXiHWBehfLau7aajI+mTWnXHPiAWlHR77FGNufL/
         2omi9Cgpvz0g5YZcb7BjPHqBeoSvXd3wrODizwErZ5hZ7pHn93Uh4wv7/daoI4BANGEh
         gkEMH3xmwzHrfwcFAbGYYgSKY7tZyHNaIanHFZvx/TKDaVkPi1ti9ZkaVENeet6wcLwW
         ZxMRaTzW5kzzzgkFVJvTiJZdv/oe1ltyfYCqD1J1Rg9rZ9vXzlu1Q3yxxHbQUb2uU2EU
         4xaw==
X-Gm-Message-State: AO0yUKXhDTud2G1Gm94CmJUYUgTelP8BBpcGvhCGcH1mb8Qv6HcXwHvL
	bCLABeJOHdcD+Xz36IZ3LVcfLfRCgHjcOCx9
X-Google-Smtp-Source: AK7set9smglHbeeBmhpcAdaBTlzB7n3/yd6cTJIGHGINpq27eZbXzJHju43D2BUxrMc4rZ6rGghP6Q==
X-Received: by 2002:a05:6a21:3397:b0:c2:e30c:9be5 with SMTP id yy23-20020a056a21339700b000c2e30c9be5mr25971400pzb.12.1676309974325;
        Mon, 13 Feb 2023 09:39:34 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n6-20020a637206000000b004fbb6200482sm1646779pgc.41.2023.02.13.09.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:39:33 -0800 (PST)
Date: Mon, 13 Feb 2023 23:09:26 +0530
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
Subject: Re: [PATCH 16/24] RISC-V: ACPI: clocksource/timer-riscv: Add ACPI
 support
Message-ID: <Y+p1zjFDcPpgFxuw@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-17-sunilvl@ventanamicro.com>
 <Y+VecXd9PVpkDggY@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+VecXd9PVpkDggY@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_093937_127597_F5890090 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, Feb 09, 2023 at 08:58:25PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:17PM +0530, Sunil V L wrote:
> > timer-riscv driver needs to get the timebase-frequency from
> > RISC-V Hart Capabilities Table (RHCT) on ACPI platforms. Add
> > support to read the information from RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 4016c065a01c..8079666753a6 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -10,6 +10,7 @@
> >  
> >  #define pr_fmt(fmt) "riscv-timer: " fmt
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/clocksource.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/cpu.h>
> > @@ -198,3 +199,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >  }
> >  
> >  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> > +
> > +#ifdef CONFIG_ACPI
> > +static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
> > +{
> > +	return riscv_timer_init_common();
> 
> I feel like I need to ask as it was deleted in the previous patch, how
> does ACPI determine whether the arch timer can wake the CPUs?
> 
We have plans to add a flag in RHCT. But that still needs approval.

Thanks
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
