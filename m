Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C824EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWSr/fMsTUffP3EqTdgHG8xJyr1i90zvbvE9homCFnU=; b=ORAHrJxoI6+jTs
	Axp4yf3Eor6X6D5fOlZ5p0ytCKkYzk3fWucaE3Ulv5X0TvTQ6fH8LfvVP5M7aw6gfTtMA7H2igllK
	gaHClarxh93qNAz3qH0ccigd1Da/BgAPegWKAOHftFvxVaGhz4lguxaW7cD5d3XQb96PetzPGIK27
	EvVC1i9jneJQWOO0BdtfbQ/CPOzSEB2ixDkugui+XY5sflwCsMCsfnz4sz69xUDo91r1svP3x3hEH
	qMI40+I3vE/tvLYolJDTtE7W4yAXscueXRzRlbOFUYMIbbP0q+AsQtjDTNS+b0PrTtM+olEi2DDGZ
	sGEwYgUKpn9YrtmCQAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC7M-003ZpG-1L;
	Fri, 30 Jun 2023 11:16:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC7K-003Znr-05
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 11:16:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992af8b3b1bso191274866b.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688123802; x=1690715802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8RwKyWjQ7rl3Ppk6BKT6e69k8Me0Zd0vefhl7KFO/s=;
        b=alSd83XbCIZVP078BLSQM0l4zqXAmX9RA3KGRnaY0VhC8hH2Q7YphCMDU6ie3QuThk
         O1RYBXNwBlv24hRu/r78aorS08LRpDAnGkPJ6pLRkxMN9wYzGXmWGO53nTSShJxsjJM4
         lWAK6bN478iwmKDc4K6TB6+s/aQQWDu4nEpNzbieMCgZlZO6+K+5u6k86+dWD14sPWUh
         JICl5qx/D6iS0mtvfgjli1Cv0Gg+GVVdP3E8PZznNgza08lE2OoqtJKQps5qiO6Ysr2M
         0+/spiNhqfevxHk8EEBDMRP326Z+3vUIOk6Ca0WwHpBhg2jcwDXW7hSsFJM/qQEvnjlC
         7rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688123802; x=1690715802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8RwKyWjQ7rl3Ppk6BKT6e69k8Me0Zd0vefhl7KFO/s=;
        b=ISpsPjQbsRc08eHQOiTuueiz1zfpLg5FGVBwWDMbnF56ESyWg671JexFvMqS1oaEsD
         cPT4DGoNfA/GL842K2og8lM/SuU4OHpZdpdQI09lF8iwxcC52HBU6iHvqmUmK8M7R+51
         f6K9s0ojVhng/+HeO74GC6MXxx6F8jFLGB9ZTrR5bFuduA1Yhh5JEiJo53hsp3/KaAVE
         7S8WocBToyv/MzdInA8wm7jl8GZ8IX0t6ndXKBF4Un2VDX7VuESjXDQvjef0tYmYIzqK
         9V5M6Az59hpd9mUr/klqxWlfht+/s+bv5aaa9Qx2lx33WQ4xBr0QIXr/acb4bUPDyLvE
         GT1g==
X-Gm-Message-State: ABy/qLbguTm2bEKmp03ZeCEStjYjmzp1Nx8r5N9fTjN63fpGpapXKRld
	6uovHfdYtPh25EHFuJytwrYYyg==
X-Google-Smtp-Source: APBJJlGSh9pnM2wyCvB7H8i4x229ME/Bu1b+gqOsS0eyPxPuv9wkd6hm541bA82OQ/1dlmptKbQXrA==
X-Received: by 2002:a17:906:d961:b0:990:8807:8f88 with SMTP id rp1-20020a170906d96100b0099088078f88mr1741080ejb.55.1688123802399;
        Fri, 30 Jun 2023 04:16:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id u12-20020a1709064acc00b009930308425csm22356ejt.31.2023.06.30.04.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 04:16:42 -0700 (PDT)
Date: Fri, 30 Jun 2023 13:16:41 +0200
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
Subject: Re: [PATCH v3 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
Message-ID: <20230630-f714cc46ee65cc65318f2ada@orel>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
 <20230630083013.102334-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630083013.102334-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_041646_063132_0CF75F2F 
X-CRM114-Status: GOOD (  24.13  )
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

On Fri, Jun 30, 2023 at 10:30:11AM +0200, Alexandre Ghiti wrote:
> riscv now uses this sysctl so document its usage for this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 26 +++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index d85d90f5d000..c376692b372b 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -941,16 +941,34 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
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

Should add a blank line here.

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

Remove 'directly only'

(It can't be both "direct" and "through" at the same time.)

> +trigger an illegal instruction.
> +
> +The default value is 2,

This is no longer true.

> which enables legacy mode (user space has direct
> +access to cycle and insret CSRs only). Note that this legacy value
> +is deprecated and will be removed once all userspace applications are fixed.
> +
> +Note that the time CSR is for now always accessible to all modes.

s/always accessible/always directly accessible/

Also, remove 'for now'. While we may change this in the future, I'm not
sure if the 'for now' helps much. Maybe a "This may change in the future."
type of sentence? Or, just nothing (for now :-) and we'll modify this
document if it changes later.

Thanks,
drew

>  
>  pid_max
>  =======
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
