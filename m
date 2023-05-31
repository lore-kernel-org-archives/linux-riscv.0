Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0510C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFtROT/TjLncGLTjVETtQV9Nu+TjE4QtDRSiKYwwX+U=; b=bbBGYL7pnbAVpr
	jZUrMGS7s+zcDKQ9ClMepDA6ydo2AnYYCDch+a/bzZH+H3VmDDULZHPPoOMaTHo6JfKZ0DEciQq/m
	RJkB6WZw5H0LepzfRCtloLXWzU3/nPK+5mo/WxWgnabzk+tesbMW4sZ/WAKwty0BWdfZV2KPz/2rV
	gCg9zy+dD50nt55nBZmiABfnEg0DhyyhytzesHlKSgIg8FabJqkWm3TDR7TcplccUhpXRxdgjlLiX
	Z5SGN177ctFSxLgUI844l4aM9tfnCMGJiVSNVI2epa6wsiJY2/9kWH+bwUx6qGMp+Ua4PJe4pM37r
	JwE2lfY5mII12Yi34Z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MJH-0003Py-2g;
	Wed, 31 May 2023 13:56:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4MJE-0003OG-2r
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 13:56:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51491b87565so7686659a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685541371; x=1688133371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UleDEf3AixBo9U/UXpWY/ydRnuyv0U623659h0izsxQ=;
        b=bB486N3tYhrD9mcENZT5Ce/fgR0DWl3pIjRkcJUgJipMYPckJRy3fRTTKqF0MxOVAW
         BRNARewHjPzMgWR0kKbXbFMRdZKkcYZU6N7wHbOUUPdHmAQkDc65bNUKjKIv8U3K0X2W
         BioREvZ6mplCJreJOoSAzAvVQ0dLckyxYHedlHrD1X7+1lVswhIXNeflbUptL5fXNVX0
         zKUNdjyZm7TBS0QqdNAvL8xWXuriIy839Dd+sfCtGEPMd6NgRikBURpBG6NK/vNGy0Sd
         PT8V6GkQhcrrC0JuoJI7zAyDBfwutOIt6kcQ79qRt56cd4GyjeE+mDV2Ar3Ghces6VOJ
         bjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541371; x=1688133371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UleDEf3AixBo9U/UXpWY/ydRnuyv0U623659h0izsxQ=;
        b=VtwdWfBKTG6GB5cyEKO78l+kJIMA+XP918D6+Qd4fwbFvdZVaWVxG2PE1YIRo7C8GQ
         L/+FKi4DaBIwdHPMSYOqPkJbiycT+RS/rtAUC6xgideEGKUcPVb/YeoCofeE8ey4qSF3
         2Ocv5EthuA+5abgoNL318iOC64OkKmVopnYoIswLRAX+rvkzactrZGggg7rh5Ov0YdoQ
         U+xi52OQl/HVN4KO9IfcgBTl9Cn/Of40gW3+HKFQ7mYTZXM+jbsQnzFtzTOcpPEBZLG7
         fHCf9vim3q4uwwwHbjwSBvku0y1faxv0lcEVWgHAxkZH5e9vvularfnarMLPGbh92/DW
         77iQ==
X-Gm-Message-State: AC+VfDzjDTBwNPYd87Qd4dL5whjH1NIQCvB/yDvUkU7AvC76wy5mevML
	KrHESwcgYDuQgoxHGc/rHtWO0w==
X-Google-Smtp-Source: ACHHUZ73Q8q9IJwMsX7edY6y2EM+CFjk3itDAZXOWz2NI9uE9E+/V3YrQjB4Rf2f+g7r1cETzEjw8g==
X-Received: by 2002:a17:907:1c14:b0:968:2bb1:f39d with SMTP id nc20-20020a1709071c1400b009682bb1f39dmr6314966ejc.36.1685541371576;
        Wed, 31 May 2023 06:56:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b0094ee99eeb01sm9041514ejb.150.2023.05.31.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:56:10 -0700 (PDT)
Date: Wed, 31 May 2023 15:56:10 +0200
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
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/10] include: riscv: Fix wrong include guard in
 riscv_pmu.h
Message-ID: <20230531-707d254be1238272fb2c182d@orel>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512085321.13259-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_065616_924216_76FDA4F6 
X-CRM114-Status: GOOD (  18.70  )
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

On Fri, May 12, 2023 at 10:53:13AM +0200, Alexandre Ghiti wrote:
> The current include guard prevents the inclusion of asm/perf_event.h
> which uses the same include guard: fix the one in riscv_pmu.h so that it
> matches the file name.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/linux/perf/riscv_pmu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 43fc892aa7d9..9f70d94942e0 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -6,8 +6,8 @@
>   *
>   */
>  
> -#ifndef _ASM_RISCV_PERF_EVENT_H
> -#define _ASM_RISCV_PERF_EVENT_H
> +#ifndef _RISCV_PMU_H
> +#define _RISCV_PMU_H
>  
>  #include <linux/perf_event.h>
>  #include <linux/ptrace.h>
> @@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
>  
>  #endif /* CONFIG_RISCV_PMU */
>  
> -#endif /* _ASM_RISCV_PERF_EVENT_H */
> +#endif /* _RISCV_PMU_H */
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
