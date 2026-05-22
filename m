Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDCECD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td4ACEKOWtDExy61ZRmgwRbqmtOVaDFV/gGsN9ZQ9I8=; b=EubG20EF54+I9y
	qqTzbo5LBXAMpEdzcQLKRO5/uKP5fgVBWBYQiDHkyu2+Gsj9JH1Zq9PQen9WVVQ8zL+qoZczUt9sc
	vdf1GWd82Qdeqx5PX7SuAZegFv/q+AiYSZQUm7StSrase2QftLHANubw6eKtv4urL+YXd0cA4/Y+L
	6T5UBXgS46bowc1tl7FGNIa+L0sdNWcJMqXTYC2L+chq4rdiPpD7Lj6iTyz1OS4jY+Y2GSCZX/qx4
	y1yrIlMbWVzpSGlBZLWIP6go+nhOKr07H4ZDqc9dVkH78djS/mVlprHVuuYv30ryTVP83lsJZZliQ
	fW9oZTmb/zFk4TqtDJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW6o-0000000Bq1j-2NhS;
	Fri, 22 May 2026 20:04:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW6m-0000000Bq1E-35XS
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 20:04:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d7645adbdso5228201f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779480275; x=1780085075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLW1g3HpZM2aJI8/CdJpus6sA4AJf8FdzJFCKu9+qJ8=;
        b=DvoE1kHB6W3fGaBHrVe7yq1O6ljjzMB7GQgZGQ8SF/m1nSUI3GJiNcH9JjnwtYT+JN
         Ngo8x/+waVqgGOi3zeGuULBgmlh9WAH5kGufwr6vNtlTanVo/WDML4jWGb90aiHZ9CgG
         GIIn8i6VjED/SPoNteRrR2r0NLfWbAVH2MRIqC338J1qdvc21EIk/ofwJZnVgy3WxByp
         hHKN+PFNGCFeIsWU6aq2gZUmUBKkS7Szoi3KurCLMu9QLQ2BR1l/zb/36WmmJCxGJLCQ
         U8pcGY85pCmr6atudKBAM7bpWuT3jEGygbAhCyhbIezWAhtU0HGJpSNlHsgwZGgqB72P
         Wypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480275; x=1780085075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLW1g3HpZM2aJI8/CdJpus6sA4AJf8FdzJFCKu9+qJ8=;
        b=gE2jry0oHTb3Ax2xht/qIhcnwd8n9Cjlsp6gs+sEhwBs0ptZr8AMdngqJ0nr+gDtd+
         2XyeP+5GRvQKtt1hKMR6N6/lZXPXfnzFay6lONEXDlHxPl5lAdp3dqDM6e7TKhLZaPeb
         G7CiLCuqKFNgnE5eiZodZBopIifW5uho7VYyJi+WReJpFrSIo9gO0hD4fPdaFW3nJKky
         PlkWOpuum1MSWUFPA2RjcXF+mLLLF3VAJR8DKG6XUaEXIcsEXshfzjk8uMwCemQNj+5L
         9IY34HaS0xMmeYfn0buQC2hhqwtXJ4H0SsGL1b3AjiAFiCY3BZuXrdUt/uQJoNLZpC30
         9Itg==
X-Forwarded-Encrypted: i=1; AFNElJ+qdHdjgfQQeRddzWceLzueBeEWeLzZKiwERP9hKUx7jHDgdesRPR8wwS/SPzFo8y7wm/6YQf6RI4IxTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2y0dRb+WaBXKM0zcT25egXPQOLblq6v0XJkLNyoYKAz+gLDg4
	GkZ9r6YecCC35XDQvXpetNyfI0Yd0YXeL3/W44PxCJgEH8Sl2Tzb46yO
X-Gm-Gg: Acq92OFyt55078SkhcKUngFbPugKtyi+BfGIN+Vfalsb0AxcHdbfjrJIGiVrhtfZl8E
	BMdQUNbNByzcz3Zv8kP4X8NmuJCfAFo27qAbbyyohmi8vQaaSBepdtM4cXG0NaF6AHRHsM8+E90
	Crxfvh8IzOwBTkklz04VRruCB38LrFGjkVIA6bkmF/MrGi7T+Ur0yipOsgbGXxzQ47kuE2SuOst
	v9nR59NRusjMPEpEdLr+hH6NRxPRqTEqSfWxlvTkgNP5uMoEl5Zg1LC8mc/sqseXpThMr77IEca
	CguK0+oA5HEoXGTbPzX34GiTxMtNpufnkD28BVH19MhrEQRs6/QhfZtKTFwBdIOc76PxGrmmI5M
	3iCaCAIP21ry8F0Rmwi9Lcyw0mRITlANE3fCymOUL+KkJ6j3BBQkApZXUpY2TDZoZk1UCUAHYN0
	2+8NH2sqEoL48cmHme
X-Received: by 2002:a05:6000:4a09:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-45eb38a7f6fmr7805984f8f.7.1779480274376;
        Fri, 22 May 2026 13:04:34 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm6667879f8f.18.2026.05.22.13.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:04:33 -0700 (PDT)
Date: Fri, 22 May 2026 23:04:27 +0300
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
Subject: Re: [PATCH v4 07/12] rvtrace: Add trace ramsink driver
Message-ID: <ahC2y59MHRZa9Ayh@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_130436_794837_03B33AB9 
X-CRM114-Status: GOOD (  16.49  )
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

On Wed, Apr 29, 2026 at 06:21:30PM +0530, Anup Patel wrote:
> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   9 +
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 338 ++++++++++++++++++++
>  3 files changed, 348 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

...

> +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	ret = rvtrace_enable_component(comp->pdata);

Does it make sense to enable such components (ramsink and encoder) on probe ? 
IIUC they will be enabled/disabled later in start/stop operations when
rvtrace graph is activated e.g. during perf tool work. It looks like
reset (primary activation) should be sufficient, and it is already done
by the core framework on probing.

> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
> +
> +	return ret;
> +}

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
