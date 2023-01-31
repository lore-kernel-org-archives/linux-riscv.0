Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BCDC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyskLEIRkcf6JffIQpO/5OBJu4u0j6018SEmSjQXjQE=; b=j/0Gg39kMr5356
	0mgGzZlDJwJjlO41mAnTjWhOec0DxNu6dwka2KZ5OZjxJ/WeSwXJPB3qMJgb2hU+jfuLuUtPiZf7B
	u451Ii2asrRaBXTKOcr5ButRUjDmd534dgGaamyejKWsRlKHSQUIsophlBnxplZ6jwsjUFzfmbPNs
	JBBU9XkGrpBs836b99iab03I86KwOx5Y2wJbpMejImqylDLBI0clISeBKAfYLM9TRJDyZKSJAle52
	SNGZZ3peoS+/70c+VNE8D6ISp7eCw9fScRU1wvsXlVJ0FyTrMqpXXwAZGWSYZCq5AFONS2HWDRu20
	gTsQfqvS1DZXCGSB2UvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmFQ-006oQ8-Hn; Tue, 31 Jan 2023 08:44:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmDw-006nge-9h
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:42:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id h9so5756130plf.9
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARSqzITLXBgBgKXOXaBzTznpHHClJvtQ0GMIZieUXhk=;
        b=NG4bXOsXt/J3qkvlabr4QEliZMMvxYhxRDdDb7ES2Lri3vzuL69Aci/0/UtE9kd9Zt
         nFDzUetjHjHybSdI7eNAKYgx5bq0GTqgvKh9C2Ox6xlQc1qwp8m39TtEf166CRFItG2R
         N/iuvJwOJAlDky3OuCjHT2/MFSpP5DDXIm+KVF/KFQlyNggkekRJqX4c6sEalbQOWP5l
         n7VvTJ0yisYwsUtrVs8nIcHTONLxSdH/o6qRo2u1kxwLaahB8THkyOfbv9RJW0TiwHz+
         1hFxlexNIyyJzoK6n88BHTz4/tLJo9wYPRWPOUVh95MG+XVunx52UmSCJP86KEeDANAl
         7OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARSqzITLXBgBgKXOXaBzTznpHHClJvtQ0GMIZieUXhk=;
        b=Q61unguRYOyO1McHgToTl4ESpJDwxZR9kvZs7QFrGhECCCfjzQqf8dXSsuh8NhYto3
         tLnLCDUXhMlvoaN95hf4WODrHt4NdMy8I+DeTr6r2IynRD4zQJU2Z5G/slS1zjcKaZvW
         TR3eoAwmqE/KrAcMk62llRi3bqm67Tj5zXvueAZzo0NaelCRd9//rkei9ZBcSeoD2duE
         ypuPOrSA1xdICwMynMrYUhzk2D+dr3XtJwNZGPFHVfQajr+qT1Dn3tvMhQ6alwe4UYIL
         AjkzhkAk+to7uB29jRF9YyFRyYWJv2FQUdbzN+Jbh8BJZgnxF5kpDbnH8E2Myl3I/HS/
         /NBA==
X-Gm-Message-State: AFqh2kormh3o1Y/tUHh3ZoLv3+lxRy4SvfI9SoSgzNw1m/JUe7BUfi5q
	MCFje74G9IQ6rEfovSlz4AiB0w==
X-Google-Smtp-Source: AMrXdXvDWtXgsitMeIdZoasXXSOSj70rH/aFeCaP2XDbmUOEeY0dvlFfKQ/myV1EU79OkGFGBNzrAQ==
X-Received: by 2002:a05:6a20:6698:b0:b8:701f:1d04 with SMTP id o24-20020a056a20669800b000b8701f1d04mr53756232pzh.11.1675154556416;
        Tue, 31 Jan 2023 00:42:36 -0800 (PST)
Received: from sunil-laptop ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id z19-20020a62d113000000b0058bacd6c4e8sm1005959pfg.207.2023.01.31.00.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 00:42:17 -0800 (PST)
Date: Tue, 31 Jan 2023 14:11:57 +0530
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
Subject: Re: [PATCH 22/24] RISC-V: ACPI: Enable ACPI in defconfig
Message-ID: <Y9jUVZRUigLqoIKT@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-23-sunilvl@ventanamicro.com>
 <Y9hXF8RpNawkuTEN@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9hXF8RpNawkuTEN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_004240_452530_234B08E4 
X-CRM114-Status: GOOD (  23.40  )
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

Hi Conor,
On Mon, Jan 30, 2023 at 11:47:35PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> Two quick comments while I think of them..
> 

Sure. Thank you!

> On Mon, Jan 30, 2023 at 11:52:23PM +0530, Sunil V L wrote:
> > RISC-V: ACPI: Enable ACPI in defconfig
> 
> btw, about half of this series redundantly puts "ACPI:" or "RISC-V:
> ACPI:" into $subject. None of commits that mention ACPI after the last :
> should mention ACPI in the prefix IMO, it's just noise.
> 
> For example, this one should be something like:
> RISC-V: enable ACPI in defconfig
> 

I agree. Will update in the next version. I added ACPI in begining so that
I could quickly identify them along with other patches in my branch.

> > Add support to build ACPI subsystem in defconfig.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 128dcf4c0814..8ce06fb0dde8 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -218,3 +218,7 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > +CONFIG_ARCH_SUPPORTS_ACPI=y
> 
> This needs to go into the arch Kconfig file, where it will be selected.
> Check what arm64 does if you are not sure what I mean.
> 

Yes, I have added in "[PATCH 07/24] RISC-V: ACPI: Enable ACPI build
infrastructure". But forgot to remove here. Thanks!. Will update it when
I send next revision.

> Hopefully I'll get a chance to look at the rest of this this week
> sometime,
> Conor.
> 

Thanks!
Sunil



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
