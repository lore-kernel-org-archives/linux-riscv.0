Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A2C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsS8lpu+3Er1ZPqpsyPvykrkjwHAj53FzsuFtTHBhKQ=; b=t9xcvoBQMuphqq
	0m2MZT0V64DtZn+9zJDNoyFjiplysUBNSyO/mdyhxtAASa5QCbeG5RznD9Mp8Ji/WMWxDoq19eV2B
	eNR+W/0zNnq4dgPfMRVPzIdLwkeaH8dP7mmYYCnQS2oyUfGiZpv1cCZF0qSQ1faWp5fpZDSD6bRE5
	LLIQZiXzAVClXm6vKqi/gpwHcz7y83AiqQZgTfm8wRR7aV7ZugEouz/Fy/ihaMG5kRqDsipSa/MZA
	EE9G5jr8bv3bfnllW6OhfEzMEg4WoFYQwXguVXrec1JYS/0MebWtk0gKXe0cNI+BECIk5BYpbaMU0
	Ir1OBkWqFCV2IcPV/N7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NQe-000ExX-0N;
	Wed, 31 May 2023 15:08:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NQb-000Evt-36
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:07:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4eed764a10cso6554308e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685545676; x=1688137676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUIbREcbx/7AYCYbP6hJBZ04/CWyd0xTzthWNvvFKW0=;
        b=CpdRFrDGLIRJKki5RjwxylxPBIFamWlGob2MdmpKb4HBlVP/tRQ13doI2Q6aF2nWQt
         CXk6kqO9Egk15pYIpSHmHy+QzOKB1W+xuz4hJf9LD8tmbKFjnyCbESeDgc+kw9Z+1jzj
         JQE3+HWfdLsErL/zbVzmgs8uXKzNLV1fuxZjATvFFXL5M8p5iJKf7Uq5nHp2PxFGj6SH
         lHUbchz2sVhxVTxsM77cueNtzFJshSst2SFewStnxOBaBsiBefJfqH8lrv1Rvdc3pIWA
         aurGDEE+qIriegaiVBQ+1e2w7d3M99inUa0YPEoxy4Fumca0XI7NMJ9lB+tvXz0B8jbb
         Pouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545676; x=1688137676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUIbREcbx/7AYCYbP6hJBZ04/CWyd0xTzthWNvvFKW0=;
        b=RWnLRbt0dLxC8FuZWdHpwEcihYoFm6DuGDif1cq1FBzBo6la59L39MTLsweEsGdQwv
         HpemY+jSPddSgFsMup4YzdYblwp5X8LPJ05G5tPgsDepPMsTEp/1tiNuodD96BJsTIVR
         e22Yj2rznEqBrLwOWs3eDvyYf6VBsusfoh9XxYihDM863QY6CAAokUZ37ysN2HMV4hwH
         aV+ZJrjA1Vy2oFjH5OplmwH2RZFHsuexZrTuYnCi6Ohs+MlU/+b6fKY6y2uG0SMIJc2m
         +7aiEotOje1ogdxKnD7h3PskpPPr+c3MciqPHv6LalREx3qyQlWmcosghXAf/NjqapRE
         UyyQ==
X-Gm-Message-State: AC+VfDyl5eEk7vNrSx4P9LDZJAOCsJNGypF38hj9Fa++DlHC0k/2kye0
	IGnfR8H1G3WCBwHyWHePzpY43A==
X-Google-Smtp-Source: ACHHUZ7E6kbDp2hRRtt+qsXk2F0ex4UkDmy/j1U8lrPnGhR9xK8TtMFExzBERPqMYV57ESb28Lkr0g==
X-Received: by 2002:a05:6512:4ce:b0:4f3:a69e:1d80 with SMTP id w14-20020a05651204ce00b004f3a69e1d80mr3069033lfq.0.1685545676307;
        Wed, 31 May 2023 08:07:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b003f6050d35c9sm20952739wmc.20.2023.05.31.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:07:55 -0700 (PDT)
Date: Wed, 31 May 2023 17:07:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
Message-ID: <20230531-0707dc46df8078cd92711314@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_080757_997634_DC13F460 
X-CRM114-Status: GOOD (  22.87  )
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

On Fri, May 12, 2023 at 10:53:19AM +0200, Alexandre Ghiti wrote:
> riscv now uses this sysctl so document its usage for this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 24 +++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 4b7bfea28cd7..93cd518ca94b 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -941,16 +941,32 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
>  The default value is 8.
>  
>  
> -perf_user_access (arm64 only)
> -=================================
> +perf_user_access (arm64 and riscv only)
> +=======================================
> +
> +Controls user space access for reading perf event counters.
>  
> -Controls user space access for reading perf event counters. When set to 1,
> -user space can read performance monitor counter registers directly.
> +arm64
> +=====
>  
>  The default value is 0 (access disabled).
> +When set to 1, user space can read performance monitor counter registers
> +directly.
>  
>  See Documentation/arm64/perf.rst for more information.
>  
> +riscv
> +=====
> +
> +When set to 0, user access is disabled.
> +
> +When set to 1, user space can read performance monitor counter registers
> +directly only through perf, any direct access without perf intervention will
> +trigger an illegal instruction.
> +
> +The default value is 2, which enables legacy mode (user space has direct
> +access to cycle, time and insret CSRs only). Note that this legacy value
> +is deprecated and will be removed once all userspace applications are fixed.

All modes can access the time CSR so I'm not sure if it should be pointed
out here as if it's an exception. Maybe we shouldn't point it out at all
or we should point it out for all three?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
