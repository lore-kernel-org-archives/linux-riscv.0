Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A2DCD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0isW8UwuGNEa9E5XOnnTflMhXos1aVPeQBhFx3DtKQ=; b=LSjut01Q4SNFRM
	20e9AQXpTA2vD1AbfAOObk1L502VgdxlXDmBt1qHZCPgwImUki91R/NTdhRCxB9DcAgK2iJSvJzId
	UFGNrw0bL3rsOzAEM1CM40mXQ2Wh1CrxocowjYFU5DdVZpDQ6gaZ3Z7kZAwZ1ZYBAZkY0orugTcAI
	YIup7G9FSM054keXibBOAmpDLcAzc4in4oblhO6wvn6HwAaAaxmS05Kc2laulU9jq3SKdBe7BdyFL
	r/8myDE29fuatj3kBVyojxTin/ntBaEEnX+HbDWzwjBeF60e5Sm9h5S4B0003pz3KZFRAQQIXZEg2
	5esrwOJ2uDCJ0/kruahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUtU-0000000Bi28-0DQn;
	Fri, 22 May 2026 18:46:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUtS-0000000Bi1d-0h53
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 18:46:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4764159f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779475604; x=1780080404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xjfBmImK3MRW7OLstyWN07E1U+bQQsnj/kAHe7GavwU=;
        b=WcTO5g9DbaavSE8xvR9OMyztCZWO/pqCVjLqXeQPU6Bd/FnomeRCLwksr/4iREuD0l
         iOKV787yoYv+pzFITwqAL3cobybb3+zCdpDfhhFQ923R5vBmdtFKr2Uw9npBuhkqZrdM
         zRKlYUHctdypM/g/D7NZsi3znvuXDZWus2OTZgivfLuVfXq34gNNLPT1kkvd1BXB3OPa
         cp6dbTnxExo8RXGzuWOtPcqBTgSOlxsPKfilII3vLwmPFaGBlfaxQ6wx1i7g8hdwMnYn
         g2m4TVoYgIpKoD/af6rmCgBzRjXCd78l72tDn6DCZGFp/k4kF5Au2bQEU9aZN6Zjepss
         0cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779475604; x=1780080404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjfBmImK3MRW7OLstyWN07E1U+bQQsnj/kAHe7GavwU=;
        b=TaIK3Ac4tBifxKpsO7rcNwglgT3RFGwT7zC+kvxBEESF8E438RqzGOUnQV1g8LmYK9
         u/WrWF5TuhJAtfSBKZsolxIWSZiRHejRDYYN9pdZuuFRgw52T3WsCi/SrjMy5nscsw2I
         iE2Ub4cQJhUlfsVqgUbuzfVOFlUj0uo3K+rlo8yLWmOi2WecGIUDcehS2ThpLHKahgo3
         rYfuPx0DQyrmjVTG/9iz0/uZNOsCgwWIg6S6Usd72Q4m5W9UUXXz5GuY0XjYFOilTT9P
         tpcbsUUJibrUgD9r7P6Oo1J/zz4M22wfb3oHqykcbU4+6zT+sPHtpQd0H4ZCgp5tmRvg
         pYrA==
X-Forwarded-Encrypted: i=1; AFNElJ/oojNjqrpCcWMHgXY+oiOEd42qZyz3f9tuA3aEFcjBS+Eo7OEJZHXsw6OMNzkfIMZR6M44FCCaW+q8bg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8ccsHvICFKtvivHbVLlIXavrzMTAiiXI8MtKIao6oIY597YH
	4/Jil7kR0o03Gh7RbcCYjz5B8g7vVUtmBQ6uHgUe6eYQkEjyRLyWRlIS
X-Gm-Gg: Acq92OHjMTZkgXfAD+r2gEL1RcMumhtlNZbwAPcHbUtv4YO3icpo6kkf11Ue441zrGU
	W2FTHytodF3gEd8h1mgFUxUVGzn8aa6W1Oh5iDa+GEsL8Yr9LOJOaP/8ZGPTjxLlhJAgCyj8cGY
	t/VsWQ/LlBcUIYN3iVK/qBXW9qxq+u7cg5dS7TSrCHfbFFfE0rpb5q9cGyFx4O2U8gcUZW6hHhJ
	THCdueAFtGPmkAF9xSo3gWZBEXHphjrmWLU1gBSxl5/bBHJsMwx5J0lVmuZIYmexFk2bnhPLov2
	pNOzJtSAlhgXLhLPrI8P3JpzvvMZZijGGKjsBRGsgY2a6fU910MRqhsOcwfW1S0LXpOo2y5V33w
	y1siIEUH63RM7DyCZsqBDGkpxtDrr0t7giaN7zSwo1vEsugPpU2TtKA/iiBEZqwFnTvmv/OIfa+
	fexuZocAWkRPNw7djAlU6eXisbXJw=
X-Received: by 2002:a5d:5e83:0:b0:44a:b931:f32a with SMTP id ffacd0b85a97d-45eb38c5220mr7616916f8f.27.1779475603916;
        Fri, 22 May 2026 11:46:43 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm6658651f8f.27.2026.05.22.11.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:46:43 -0700 (PDT)
Date: Fri, 22 May 2026 21:46:36 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v4 05/12] rvtrace: Add trace encoder driver
Message-ID: <ahCkjH-sGnGLHpG-@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-6-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-6-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_114646_232816_8E02FFFF 
X-CRM114-Status: GOOD (  16.07  )
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

Hi,

> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add initial implementation of RISC-V trace encoder driver. The encoder
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   7 ++
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-encoder.c | 130 ++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c

...

> +static int rvtrace_encoder_start(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);

IIUC the code fragment above duplicates 'rvtrace_enable_component' from
rvtrace-core.c.

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to enable encoder.\n");
> +		return ret;
> +	}
> +
> +	/* set mode */
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to enable tracing.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_encoder_stop(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop tracing.\n");
> +		return ret;
> +	}
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);

IIUC the code fragment above duplicates 'rvtrace_disable_component' from
rvtrace-core.c.

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to disable encoder.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
