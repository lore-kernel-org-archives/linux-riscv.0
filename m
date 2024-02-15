Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A6EC4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 04:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTR4dDfzmGVDODTFnAUDoTi3BGgitoBdhEeEGAdQDdE=; b=jefZxDkCRIy3xh
	gZQQ6SbvuKlfJXolrjfmY5qs1Vd0+IbwY7zUqW0fcasCMoyR/vUQpRYiekixpQHmvKBE0c1azKoM5
	fuGjukRHhpYVkRcn3GOs5y31xmh18oZfuOY2r8ql/0DX/cbOqwc7fKi2RGYiJhDAlvLeoK0qgS8vK
	+q+vN0r7VaKh9rqzhENgTe+X3Y1tghBLWe9FL1Y3rsGW1L7msEky2GBWpIrB/mObazXE//H8qwoia
	7QkPk4+bwhkXSmlfeTh5hnFDrXScDqFB93CoNlp8J26bTRmIdw34HBxrlWqgHxqHPS0mnFneg8V1N
	aQC+D3RuEfZU8n9kTGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raTUr-0000000Ey8C-0NNQ;
	Thu, 15 Feb 2024 04:37:17 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raTUo-0000000Ey7p-16ux
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 04:37:15 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6e2e58feaefso118663a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 20:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707971832; x=1708576632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNxJDjUCrN6LyBUSVQQs/vfYX3KHuLasmPCTnAxXhZ0=;
        b=LLOx62eDFiwFCENgZfbuGxNu3Scn9f88FySe+eHf81G5mCW7AHVyOGPf1rd3woTuLc
         ACCIBbeCoDubEzUlv4e7e4dlsMHL1VtW+CWnmcMLIdZBQgkpDbWM/UnK77Cku3LXHniD
         4GkjmbEdZ5/KQEyZQGkealZWxVsIRlJoDkl+r7E/I26D2F7xQQs46E8aBccaNe3n/SuG
         YdjL5jbV+PP3ipZMUtg/ZwPKYDL/SUUDDMV1WT6ggD6sYDj2dNYf6pIFYrQT9lWFgROT
         hRBltw6zb73MBTghCbKiatITy5MWW8K70FAkO0DNg27ANZ4Q0UjFLUyxLP6+ClCxO1Wi
         CUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707971832; x=1708576632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNxJDjUCrN6LyBUSVQQs/vfYX3KHuLasmPCTnAxXhZ0=;
        b=n3E/pC05Km4E2ZL8q7yeZyk+daOSvczPRtVnNqm4/4C+NgoGMJutXMp/fB+uB09mac
         OBGftRkn+eBRFgVn5+yEJjVHl2QPocFftE2wStl/JvaaQ9GqqGsa4PySz6zmBKXLG+VN
         oSa80obj+O5B4xR1FJQM/+42AbxRAxRtjYfTQ97+qYbD4TpBHjnk5ehCGtqsp1yOuw/a
         WQbAGoP154SzG9xu8gM/dN3IH9a0syMuc66XzPdRlPXVzk6jwnv/Ba+cEq18JoG48exn
         Ag/NrqviDBOtcgp2gzooCyERUQmqZhAw0fLr6WN2kCUW5bEF2d37vzKulTF6kiBM0/G+
         wy7w==
X-Forwarded-Encrypted: i=1; AJvYcCXcsZXcfJ4ALQY0pyxIITtJ4DBuQb1eL56dyOjeqdnSFJfM9zY0GaOmjowbY7Lpia4s2ImakOi6EAhronhZ91E75CNlyeDZ5KAUNaT1D53N
X-Gm-Message-State: AOJu0Yx/qKH63Ojxj8CA7Qp21M9EHPhMHiLLDU8Fgfx1s9xikA6oHRtM
	pGvHGHmy9DEentESU7kFELIWsmmy9SD3Jj729+pok77CgHcimuu+Zr6sm14HkZg=
X-Google-Smtp-Source: AGHT+IF6VXW2Q1PC6MlD1H84uMFhuVJdYWGUe07iOM0/TV77GrZ+nJHBLkmineD4719XAI9et/fv0Q==
X-Received: by 2002:a9d:7985:0:b0:6e4:22b4:72ef with SMTP id h5-20020a9d7985000000b006e422b472efmr757348otm.5.1707971832463;
        Wed, 14 Feb 2024 20:37:12 -0800 (PST)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id h25-20020a9d61d9000000b006dbfafc2049sm103050otk.30.2024.02.14.20.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 20:37:12 -0800 (PST)
Date: Thu, 15 Feb 2024 10:07:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
Message-ID: <Zc2U70o7teYnJyp9@sunil-laptop>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_203714_329609_DB85A113 
X-CRM114-Status: GOOD (  16.75  )
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

Hi Rafel,

On Thu, Jan 18, 2024 at 11:59:27AM +0530, Sunil V L wrote:
> This series adds support for Low Power Idle (LPI) on ACPI based
> platforms. 
> 
> LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this is available at [2].
> 
> [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#lpi-low-power-idle-states 
> [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v/riscv-ffh.pdf
> 
Could you please take a look at this series also and provide ACK if
looks fine?

Thanks,
Sunil
> Changes since v2:
> 	1) Added "riscv_" prefix for functions made non static (Feedback from Drew)
> 	2) Added RB tags from Drew.
> 	
> Changes since v1:
> 	1) Reordered the commits such that the patch which enables
> 	   ACPI_PROCESSOR is the last one in the series.
> 	2) Used GENMASK and other changes to address Drew's comments.
> 	3) Moved common functions required by both DT and ACPI based cpuidle
> 	   drivers from the DT driver to common arch/riscv/suspend.c.
> 	4) ACPI cpuidle driver is added under drivers/acpi/riscv
> 	5) Rebased to latest for-next branch of linux-riscv.
> 
> 
> Sunil V L (3):
>   cpuidle: RISC-V: Move few functions to arch/riscv
>   ACPI: RISC-V: Add LPI driver
>   ACPI: Enable ACPI_PROCESSOR for RISC-V
> 
>  arch/riscv/include/asm/suspend.h    |  3 ++
>  arch/riscv/kernel/suspend.c         | 49 +++++++++++++++++
>  drivers/acpi/Kconfig                |  2 +-
>  drivers/acpi/riscv/Makefile         |  3 +-
>  drivers/acpi/riscv/cpuidle.c        | 81 +++++++++++++++++++++++++++++
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 49 ++---------------
>  6 files changed, 141 insertions(+), 46 deletions(-)
>  create mode 100644 drivers/acpi/riscv/cpuidle.c
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
