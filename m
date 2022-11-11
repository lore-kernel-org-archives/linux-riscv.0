Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1A3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOsJJfxk8sf/Gt7mTnggpZCrMECepv/3InT4jkiAgEI=; b=ByVXnbSVVDVMiA
	MuSizkpBIyiM1+gb0OBG9ZGKA/vRH+/EyuM1qYNHSbpBWiWKH10AMlwS7C7qp/P3fWh6zMMsSW43d
	SzRSOt/MvY7H0jZGVBsOQ/2CGK4I2uaB+VTL7rTx/C20WbM9/jJCewUaBhIuWkQik+k+zc2RL9ASp
	mIuxpXOT1hHEBX/gfRLiYNNbBG35RKOb3vBuSWYUHPkONm37Rl+Xlr7xzpSwjf9JSH5BlIVVVv4KC
	QNw10Vtnh9oJsEG8RPLPOXudUy93R/VWE6haX1gCJN6lL9arXz8+vcbIH74aTth0RTScOB+z2NaAA
	RggnHGcwUwFySZVpBkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLRV-00Csf5-1K; Fri, 11 Nov 2022 04:15:01 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLRS-00Cseb-Kd
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:14:59 +0000
Received: by mail-oi1-x234.google.com with SMTP id n83so3896757oif.11
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p63dJQ8Zm1StkFJbBaYMAZgNwK/eOyFjpsy+2OYCi50=;
        b=h/qWkjLSgEyAJah89p+vgT6NQynzFunXIArGdkU0XeiYzi1H7rata405JYf6ClTI+B
         nmghiawtYZByjpqJy3mM7BNM5xVCvDvD5aX1mxU+IWUlbo6ovG939oMH3O/RCnrgOzYq
         2QGCfjxFTIkAlEppGbWQT936ooO6lf40KQHJMYPtn8VDLjFE7CKiXIFtP5ZrWi9mk4EY
         KA8kXg2gft8P/4vOssapiwPL32B4PF4uMXNw1CynoglzQ5aWS/o0ktEjr8oaGjh68qhq
         rstLTea6xPTAvAc8MODPL87vCtskFz/lJ3xavFe4O5bh/34Ujm4155uJhRhYk67NwVNS
         8mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p63dJQ8Zm1StkFJbBaYMAZgNwK/eOyFjpsy+2OYCi50=;
        b=WxPzp9cFiVBUb98DbKGfxrwuMVwvCGG+xy7kLYcYngSLxpGo1jnXm2BhdChNwW/SpF
         nTMrtaBFMNOKb3/02vlldEDTB9kYdjJ7WRUn5dbsT5gXGWO0Dg/qD7dT3KLlPZ+tnq/Z
         GPZFXFOiqBRN75hfVUkEN7FXKyDa1xr8P+bGygkKi7MIm+GAEraEeLPKgPSWR572sxZY
         LnBXk8EfW/sruaD/+FXoBcopOL4YFOLdK/Zq6n20tjgiJ/bndn7o7S2m3nFmNvM5nZQq
         +AnQXBsssdx8UZDzd9zxuuPFNFXQXa1saicbBg0WGeOAz1QJmrZQaxkKl2ESbyqV5/CM
         wYdQ==
X-Gm-Message-State: ACrzQf2wdqdNGivvuoNhWXbKAaJVAOpXDhv0cpAQXy8sqSExhWawW4pJ
	Q2ZilBwk0VS54FF3FB/fUbg=
X-Google-Smtp-Source: AMsMyM7b8tbRaQRGbmuhAG9mhyQNZp61zj9zEvl1eF7QlhtBjlOwONQncQLSFtFBszzuP5wzulbUHw==
X-Received: by 2002:a05:6808:151e:b0:35a:7300:7208 with SMTP id u30-20020a056808151e00b0035a73007208mr2438895oiw.75.1668140097551;
        Thu, 10 Nov 2022 20:14:57 -0800 (PST)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id v4-20020a9d6044000000b00661a05691fasm562487otj.79.2022.11.10.20.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:14:57 -0800 (PST)
Date: Thu, 10 Nov 2022 20:14:56 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v4 1/1] x86: cpuinfo: Ensure inputs to cpumask_next are
 valid
Message-ID: <Y23MQA8ZaQ135aJV@yury-laptop>
References: <20221103142504.278543-1-ajones@ventanamicro.com>
 <20221103142504.278543-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103142504.278543-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_201458_692861_C4EAF816 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, Nov 03, 2022 at 03:25:04PM +0100, Andrew Jones wrote:
> The valid cpumask range is [0, nr_cpu_ids) and cpumask_next()
> currently calls find_next_bit() with its input CPU ID number plus one
> for the bit number, giving cpumask_next() the range [-1, nr_cpu_ids - 1).
> seq_read_iter() and cpuinfo's start and next seq operations implement a
> pattern like
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
> which will eventually result in cpumask_next() being called with
> nr_cpu_ids - 1. A kernel compiled with commit 78e5a3399421 ("cpumask:
> fix checking valid cpu range"), but not its revert, commit
> 80493877d7d0 ("Revert "cpumask: fix checking valid cpu range"."),
> will generate a warning when DEBUG_PER_CPU_MAPS is enabled each time
> /proc/cpuinfo is read. Future-proof cpuinfo by checking its input to
> cpumask_next() is valid.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>

Reviewed-by: Yury Norov <yury.norov@gmail.com>

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
