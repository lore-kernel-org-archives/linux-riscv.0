Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD66C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq5lMKSPmaeC5FhTclNkLMXHOwzvh9G0qB/j6n97YTQ=; b=d0e17W+dz5n6oK
	NiMmzLtMNlts1x8dW93PSlJ+Gn8aUval9Cc3K3Qd4FD2O4bsa1BM+M7HvplWdjudlkyp4vVfzge3S
	U7teqNPU3Y2P1w2Gvlc72aaP1pHa53WUOOlll8oYjXCuoJZBtez7hzOA7k8OfZn0Fb19uDwBMcM+/
	WoU+NS/9SSzqO4P/OpvpcGJP/dA9diw1mR50j758F2vXLmLvCTpOZJM+qPiLNBABfCMEoFmYVTDBE
	rWBLwNLgXn5icxdbFo6FkfGQRnw/I04nwPG9mSTpX92Pj6EcROI8xjYYwmnT/98/v1td8IsZOZh/G
	jKXIPzkC1G4KjDlmAlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJv9-005Qkm-Im; Tue, 11 Oct 2022 18:24:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJv6-005Qio-IJ
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 18:24:01 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e18so21358161edj.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MC+yukkeSsEMWJh5BzF5ssgR1etwXnfqKmMkQ84MBVE=;
        b=RfGWZvOlTkRLiwHFdbigGnRPPCM9ltxxyd5QDDyAUXXEIIlnRYddsBwY4Sn+pXsZFb
         3C3ZHGljKDHOUNuP8SVNpWt1o2KxkEk4y6YWWM36keIIPktNMPjaNLV+qNPET+F7YPiw
         NAlLvW7y419U65vLXbnmoREd9n6lByVfDpl2zvfeFnCvXuFiVZK1A91A9xyz3oZXujEG
         exu2jJGssf9ibQ+oQSRocoA4khbIa/t8QPApgEr7GDUGqz1MhT1jjWHgmPuZJrVc13PE
         PFJzX121DgUSAV8PCiP7FS4hzUlEry3Fdw+VkZtYt3ZqlU7oV5w9abwJfpUm4FDOQCjn
         98xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MC+yukkeSsEMWJh5BzF5ssgR1etwXnfqKmMkQ84MBVE=;
        b=TRCYd679LbNli8i6UwtECyGssDN3fTXng+DUym9RfDkqhI3O6bPhCAOI11n10IqGch
         FiaYW84mHetOpGqBlMvrNglvtAZtC/cg26Kcla1XIVaFSdAnG2fGH/c3tZdXZ5zNZRiz
         IPNSa0CBn/1xwT2UsYjaCsU4/r3a4mct3NqoDAvu8YA2XYN2TJEGpz/KlM96dHdgQQJe
         HHiz9KZ16GvHOUZjYFCm8KwC2Tb+mMav0lK8+8j+5GEuvVHz/UgyT5YvGMw9BRExylGV
         BNiKRq0pEfp9V93zNfBaTx8FjZHSwyLsyGcTU97NsKWprTyi7e5MhzbSOwipRu4YLorg
         S67Q==
X-Gm-Message-State: ACrzQf2fJOeTexGFi63HlFBJYMFkG9JMb3KFqr2viIvrBH7ipp9yoPlL
	LW5SqFUFfT1+94HpoUXBupoo71eAQHQgJQ==
X-Google-Smtp-Source: AMsMyM5PSQg8pwUqt0L1ltBi/OecJlhjlCP5oDsGLSzXyeQKmOSXuF2SrkC20EzurgL9mXf+IvMuSQ==
X-Received: by 2002:a05:6402:5409:b0:44f:1e05:1e8 with SMTP id ev9-20020a056402540900b0044f1e0501e8mr24160928edb.373.1665512637921;
        Tue, 11 Oct 2022 11:23:57 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kf3-20020a17090776c300b0074182109623sm96580ejc.39.2022.10.11.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 11:23:57 -0700 (PDT)
Date: Tue, 11 Oct 2022 20:23:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] RISC-V: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221011182356.xbgvpoddhe4st6va@kamzik>
References: <20221011175040.1782772-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221011175040.1782772-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_112400_624094_9C03771F 
X-CRM114-Status: GOOD (  18.15  )
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


Boris pointed out on my x86 version of this patch that I didn't
give nearly enough information on why I sent it. Sorry about that!
I've tried to fill in some of that information in my reply to him
[1]. Sorry for lazily just pointing to that link here, but I'll
send a v2 with the information properly added tomorrow.

[1] https://lore.kernel.org/all/20221011181715.dpayrpjueha7kxoj@kamzik/

Thanks,
drew

On Tue, Oct 11, 2022 at 07:50:40PM +0200, Andrew Jones wrote:
> Upcoming cpumask changes will start issuing warnings[*] when cpu
> indices equal to nr_cpu_ids are passed to cpumask_next* functions.
> Ensure we don't generate a warning when reading /proc/cpuinfo by
> validating the cpu index before calling cpumask_next().
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/riscv/kernel/cpu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 4aa8cd749441..592ff065e09f 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,9 +166,12 @@ static void print_mmu(struct seq_file *f)
>  
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> -	*pos = cpumask_next(*pos - 1, cpu_online_mask);
> -	if ((*pos) < nr_cpu_ids)
> -		return (void *)(uintptr_t)(1 + *pos);
> +	if (*pos < nr_cpu_ids) {
> +		*pos = cpumask_next(*pos - 1, cpu_online_mask);
> +		if (*pos < nr_cpu_ids)
> +			return (void *)(uintptr_t)(1 + *pos);
> +	}
> +
>  	return NULL;
>  }
>  
> -- 
> 2.37.3
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
