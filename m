Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353EBC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZcgYvP5XycpQgbEOvRKRbcPnf5FbSMeaQ2DJ/wFrpI=; b=DWcqLbgtKp7Zzw
	Si4J7fClK5sqEd/WXoVWUeLWVROB2y7UZsgbsGROsVGDTQ5mmVZgBh6n9nWR0vU5/Ya0LOjr539yS
	U0WE3IVcALxrQFDRiPiiYNOeXpNCcSzksryQPytR+KNEtp6V/nm1LvoxjoczR3kH6qHNHna7JFAX0
	yDShN5/TF2Hud0WWQ3pRwSHkMrn+vQXdgNdRvAFWFNnFLGU2wwrN5wXCr5S/CQzqC4ld0/J65BEP8
	kDNNd8f50EBPc6rU6nqit/R9Qref+hC6yW1s8d0xnBuS9cQPwx97tOW+UO8aDJGm5g3uI3dtZsmQN
	+p9HjC37dxbyrmkyOXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRalj-00FCw8-7k; Mon, 13 Feb 2023 15:29:27 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRald-00FCtq-3m
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:29:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id m2so13848944plg.4
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbx6U9Foe7itForTQRSH0M7JhXvGqxUzThvPIJqkyvQ=;
        b=Rnl3Q3GV0vBzq01wIsrOiPoNkt2sS6amDjnqvSgMSp9EoYYFanD3kywD/bwcZgYhoQ
         iVEdy7M8w2cPp9GB74lylljDVWceNHNSwjlUvikxU/4IjY6msLBIfUWgE7GM+DnUE5q1
         lS0ID3bmvbUJk5Cjtw+psctgIuiIJfLunxFW/o8e0d9HBwM8cdMSU3vDRwXFi1L8M/I6
         H4xrCraBChDTOrKb51DHZBEO7Ghu6bKHtHiXNg/2i9KwXHLKkJk4Ze2qE2BQ7smSgvnd
         7qsLNU6V8jWQTwZ4z2gFtrWxvLPiX9Cd+rzHG9EprjgGLUcoiJqVszh/WSxJ7aCL8X34
         7t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbx6U9Foe7itForTQRSH0M7JhXvGqxUzThvPIJqkyvQ=;
        b=mBx9n5LF0XiHcDPKVQF4ztdn/OclbchcIK4EwIZ9fDJklUgZQvu4CwP6BswkGfKW5W
         infTFnY4qMvo4c62/ZNCPUFt3orfuvntQkUzcfr/s6YBl1spRDJIdlo9upA8SZorwWOK
         yFg8hnWeFM11H7BCkNvMPefSn0e4+hhTelQAbuycKanz5rhuEMXPpQjsh7U5Z0tfkif0
         uytFFtAjRzrBoAnPyCCL0LcPuAg//Jc03yxKxLSKKJ56WgJXG+l06L1bpwzs6C0gViCX
         yE/brHTixwYrqDJhdP/9d7KmUmBFCtzm1VpUx0FWbI8GGPXrqGK9rFsJXgqeWRJMQW4z
         0I8A==
X-Gm-Message-State: AO0yUKUssuQ3eKaxGAv/qgE46xZ5TwRHpyApXTfpESiEqTzNLjFFe0U4
	sbSpD9l29uPpGBSQtAJomeNxxg==
X-Google-Smtp-Source: AK7set/mryfi/4lQw9+pQX73qq0JKVDVfPvKiwXT+/N3NEyBCwVEejzOlKDAEyuzTferOF+iIfbrvQ==
X-Received: by 2002:a17:90b:3ec1:b0:22b:f208:aeed with SMTP id rm1-20020a17090b3ec100b0022bf208aeedmr27624409pjb.30.1676302159895;
        Mon, 13 Feb 2023 07:29:19 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id l21-20020a17090aec1500b00230a3b016fcsm5157808pjy.10.2023.02.13.07.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:29:19 -0800 (PST)
Date: Mon, 13 Feb 2023 20:59:11 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
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
Subject: Re: [PATCH 24/24] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <Y+pXR29U9divDWAo@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-25-sunilvl@ventanamicro.com>
 <Y+RUPcCgH48XdbBB@debian.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+RUPcCgH48XdbBB@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072924_234330_0534E13F 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 09, 2023 at 09:02:37AM +0700, Bagas Sanjaya wrote:
> On Mon, Jan 30, 2023 at 11:52:25PM +0530, Sunil V L wrote:
> >  			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
> >  			are available
> > +			For RISC-V, ONLY "acpi=off", "acpi=on" or "acpi=force"
> > +			are available
> >  
> 
> Something repetitive here. What about "For ARM64 and RISC-V, the
> available options are only "acpi=off", "acpi=on", and "acpi=force""?
> 
> Thanks.
> 
Hi Sanjaya,
-Sunil



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
