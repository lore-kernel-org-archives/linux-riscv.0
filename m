Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC84C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WQ087PwMz1Y0oVrlXwrjSet0brpefLX7/v8IUDKNpk=; b=hHGM29BvWNkJ7B
	JsTYUyLboh4WzBDhp0BN2jhQY2orK4lKFJ/QsaYokHP+9peHQkZnEQzSMeUEXZZvKsS2jcVlQ/Zb5
	Y4SaTsP17QvrbhFhC7+Hmd+EW/AzXVleX5JbRz6HFZqBaDdjno1kTxxc9s340L0PZqkiUT68AuhPQ
	zZjHCl4UqMup7SfvOyoDN8VW9im27gVW+1oAzzBmQaq5Ic/lNU947sDKfCzjjrU9Xd8R2CeQ/omOU
	sw4l2ZT3aPP0PAbw+2n19huazMdcAiegj72V9oNt8BHnIpMZ93+8yBTdH96EPWE0Yp6pwzV349nzK
	sHgfyJfYN/zu9zXDAxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJDd-00AZq6-2A;
	Mon, 03 Jul 2023 13:03:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJDa-00AZot-1s
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:03:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so41888505e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688389429; x=1690981429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cPBpk9U/09/3mwSB5bUrvUTAuq++fuN/NRKxbA7bKNo=;
        b=hAy+BEYKnzd4+DmBw0GRbDQ1l88L7pEEpB2kO9554H/4kn61UlVe/JewCteAPvuSVE
         tmHSfhdRmq/m2BO8bQ1qgGndwlyxlrIsSXXAYBEnR430VaszhPz+2tggA1hjNRjby+KP
         EwZvL8n3NZO0qqnUXPAMkMhCXoP512GXkLhHr5OTUny1/ERP8Ex26t5hv3LYOMc2yO1B
         S7C4C5WAY9ZROLBQBX+q17uc27P0Wl1l9w5z8s4vvVYM6INBw8kEhCI1dCJSaftfbi/J
         r2JAepRR1Kn0tXpI/2p2zc657H8zKm4N8YnyIvL0PSLZ2vEx0WPq2hRN/TFVmAtKQheW
         atnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389429; x=1690981429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPBpk9U/09/3mwSB5bUrvUTAuq++fuN/NRKxbA7bKNo=;
        b=M1hiicfTQ4j1Bjz2yK8CpR29YYILRqN0pe7Nzaqg+3Umu3wTblQrOeOIeG7ghsvFtM
         et7fkp1e6s+XTAVqpr/6DXUzxEhSEo1bMsY7aaod5X/FSA/xZO6QU6zoCSCc6XpA/ZMY
         EU6+l2UcQAjdc//uFElOLjtq57Cu2okIMQKxpNtQ32S4nosZoQcvuo48At4eP2qB67/c
         u0Uyb4wnuU9TP3P0HeGB1uyvRqW1gvUbNlRKz2qqOm+Csq4CsSDqVym93+VO6h0ph7jd
         GDlKfKhE6nmQsGlohUKa4SOQI7Hr6EmIApVVeG4hpSryUL3cpAoi+2S0N8+3aFeaIKkC
         zAOA==
X-Gm-Message-State: ABy/qLZGCDXuRp8wmbwttJB72OzPGN9kUyWwSgtiTRMvTsTkrSMwzC9G
	eVl4wChF/pOirMja7dKSZqPW2w==
X-Google-Smtp-Source: APBJJlFzwWsag5H3B4fJAbl6Ppsd6Y16qbcXnimVTA19W+2BGHYWOjsyQihmyCv5gjCQoJYwvqbZ2w==
X-Received: by 2002:a5d:5542:0:b0:314:3aa5:d285 with SMTP id g2-20020a5d5542000000b003143aa5d285mr1272124wrw.11.1688389428832;
        Mon, 03 Jul 2023 06:03:48 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d5-20020adff845000000b003141b9ddab3sm10587287wrq.114.2023.07.03.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:03:48 -0700 (PDT)
Date: Mon, 3 Jul 2023 15:03:47 +0200
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
Subject: Re: [PATCH v4 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
Message-ID: <20230703-c7f3e773f50ed6c934662f3f@orel>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <20230703124647.215952-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703124647.215952-9-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_060350_619254_0CB238A5 
X-CRM114-Status: GOOD (  19.97  )
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

On Mon, Jul 03, 2023 at 02:46:45PM +0200, Alexandre Ghiti wrote:
> riscv now uses this sysctl so document its usage for this architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 27 ++++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index d85d90f5d000..19b627883313 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -941,16 +941,35 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
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
>  
> +When set to 1, user space can read performance monitor counter registers
> +directly.
> +
>  See Documentation/arm64/perf.rst for more information.
>  
> +riscv
> +=====
> +
> +When set to 0, user space access is disabled.
> +
> +The default value is 1, user space can read performance monitor counter
> +registers through perf, any direct access without perf intervention will trigger
> +an illegal instruction.
> +
> +When set to 2, which enables legacy mode (user space has direct access to cycle
> +and insret CSRs only). Note that this legacy value is deprecated and will be
> +removed once all user space applications are fixed.
> +
> +Note that the time CSR is always directly accessible to all modes.
>  
>  pid_max
>  =======
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
