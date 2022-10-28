Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFB4ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn3zjdJP/kovrCCGZopaEt9dq6ORlhR7nEwgp44qxlc=; b=pb1PpnClb8YDyQ
	ncAXgHkAsV27rOk2rCYfjBU+Du6uXKiwpXpvAVo26Jc60XhMoH2gf5uPENn10OvVh6SLN1GGY1nbp
	MMgE0Vy3gKoVx/VatBrCWjhNsubgCJjSYYPsdiXTyzgI5V+CFd2Y0MoR+EZ/GYhS0I7wyxwzlkRTo
	bT7dXyDVNcsMS+G3ahqWzFNZMdQ07tpxzfjJF8yMDSRc7tz1BEAT6NGhso7UFVk7+A12WGDeRPGcS
	L4Cj868ew/BKBxOPBiVgf5nw5G8jt7Jhe5SPsqIwNpo/DPehLKZ5R7ir+qNilhD1lhYwGkqwwMHF+
	gzo4sBZtbDdAzmzFP3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooK6T-00G3UJ-Jb; Fri, 28 Oct 2022 07:48:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooK6R-00G3T8-0D
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 07:48:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id j15so5886944wrq.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U0U3J+Q69fu7o/YQz3q/fMO7g+tmuXGKvEK6KG9JDGA=;
        b=oqmNgqsztuMpLAhNQorP3820L6EJNnJRDoXEb4RgzXZQMfNQDcyVCHVYlvSTb+cksH
         CwJ2aeLsuRGbAg4oUeweMw9W7RVPie8fbQhXZCKgnIXewPhBCQ2D8qNqXYiXfhT76dW6
         xJX6KJ6QR8kf1VFJxGUsMl5/+ENJJ5Wxii90WkOuwZT7HNIb6lID8pp/UFcfXmak4LFL
         jTzzJYzhej1Kn237Slz8BJcwQbdSqVXWEQpinfJlNcbgrjQ4bsMdqNEumXt3CMYlYdSi
         LO4ALfufKLzxVKs824kdxmBew78rDuLIWHvjPbK+3tKTM3XpkrSx4Zr/NWhajts4BWCr
         /L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0U3J+Q69fu7o/YQz3q/fMO7g+tmuXGKvEK6KG9JDGA=;
        b=OOkL4M20i4+IN8CQWcL3oHzFMLQYrLKUf4kgipDq4L4ZJWYv/mxtNEKUP3pIJWLyXy
         YUPtPTL8BCk1Kee6o7K9ScOyMnI3tFfoeLZxYeNSDR8X3WCeoHdpYDfEmxzHqPQXOVwu
         6cp3l2XihL8Q85/wDjIXnKTvwt4lOYYSoE8k4kwNEj0Ab0DGARxEyhmMdjGa7aqRFalR
         UZIVAn+U2NSgUw73jAHIRBkOr8S3cqwZDsJmPpzMndzcf1BNSLBIOJunwGZ8e5vJ1XxT
         euTzbwZ8jh+xyQFXUDduh8o7+cGaj/AjxenCbyNCCyRjo2sDGtlVvmNnMu4XtO1ju5rt
         w8oA==
X-Gm-Message-State: ACrzQf0TNSsjdvGL+VyqZ/lbdK78RwzCrPtCupTOgXh1Jzgx+yPmUZ+Z
	udLFH3yvNxADGQRG2z0bNXPthA==
X-Google-Smtp-Source: AMsMyM6VIrVFAYX3MFdpAr2A3aolwkCyi7gytgwNOdq5lcvzoSJ4ww9Dhq1bl3mK11pqR8Em7mdPlA==
X-Received: by 2002:adf:ef4e:0:b0:236:6608:f6ce with SMTP id c14-20020adfef4e000000b002366608f6cemr18585925wrp.85.1666943309562;
        Fri, 28 Oct 2022 00:48:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d4301000000b0022efc4322a9sm2989820wrq.10.2022.10.28.00.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:48:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:48:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221028074828.b66uuqqfbrnjdtab@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014155845.1986223-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_004831_065605_A9895BA0 
X-CRM114-Status: GOOD (  20.19  )
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

On Fri, Oct 14, 2022 at 05:58:45PM +0200, Andrew Jones wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
> 
> which will issue the warning when reading /proc/cpuinfo. Ensure no
> warning is generated by validating the cpu index before calling
> cpumask_next().
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/x86/kernel/cpu/proc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 099b6f0d96bd..de3f93ac6e49 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -153,6 +153,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +	if (*pos == nr_cpu_ids)
> +		return NULL;
> +
>  	*pos = cpumask_next(*pos - 1, cpu_online_mask);
>  	if ((*pos) < nr_cpu_ids)
>  		return &cpu_data(*pos);
> -- 
> 2.37.3
>

Hi x86 maintainers,

I realize 78e5a3399421 has now been reverted, so this fix is no longer
urgent. I don't believe it's wrong, though, so if it's still of interest,
then please consider this a friendly ping.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
