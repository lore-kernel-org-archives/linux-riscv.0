Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09172C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3L9V1y3o+g0+9U5O1ojbyeLYHVeKA96x/PYOfpygVc=; b=Dojgh7ESJ3PmP0
	lADIT8jwfhNnjqZvuOT1fzTCOdlSuUGlCQQbqCBfsxLSn8Uvtw22rXUVVzz7fHbHp02XqUw+3Bm96
	oXxeZL3LK//3IVtCwntIiioq0OxhHAzmmYIxWJhW9phjTlLbBz3hgqILfLkGu5yKuOPl/pxzAHs6s
	yuRwy2Pb1TM0zs9DCHkW2tQgR5sAIz7az9Lzxz045vUY9OViSuhYqxyf/h79DJyWzIrHoxr6MWozp
	a700azdHYtBvqVnQ4J10rMQWc77/pOz6dRvAuWRE0GxqogyMnjjkgoIPZ+36i2YcyhdkaTI28ZdxN
	/RkkDBCwLsbFtWr41VvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow8QX-0083in-DA; Fri, 18 Nov 2022 20:57:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow8QU-0083gH-51
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 20:57:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id r12so10166485lfp.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 12:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G94qeilfNy6ydk7dHARL8hYFWRE3rBfYAcibgzPUoAM=;
        b=XBenWYVH5DbOIxrQDW33iVDzwNuG7w2QbBeUG5foqnbFpO+aW7BvELeIaX2DS8GqBI
         SVbZ0u5AGgnPg4HrPR87RctuowuPrbYxkIKzDM5xNBVQGmX3cQvUBirzJhinSn31c9PV
         YiOTawiv0bjx/BYTR6UskrrBH3/uxkRyT4bqJJfsAa0tt6bp8O39XtwFrb17Iw87z33K
         jmqaF/fws/8V/JHx5i/BxJ3z06dFOJmiX/QDliylFIjJYfOwzOrv1jcPTwsQdHg3Pb4/
         esUD9d5vlrbn/UKdIG9M1++9pA1ephms9++6rH3hc79WCVQtHq2iUUZezaPA+wXmdOp/
         MkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G94qeilfNy6ydk7dHARL8hYFWRE3rBfYAcibgzPUoAM=;
        b=yOPszQBDd4pwBWcfDj3g62IrxR77OkWSxQElZ9BrOnn7/CDRqdSMUI80AaYILtuuR4
         zim4y20HujRHFl02ZC1akFPmZXSLfSKArcRlZQ/HSYcwQ8HYsLcfjust7XIZXFNfCGXi
         GYaJnpEtb3vZvqdOqVPgqbZsBGxjGdKadHBzlL0z1uh2dqOEQRCIetYzK0yN1T+0Yv5b
         nJHAfknvmoXIxnQ8t4YSUYFfrgMT39ojZQrxsgyasMpZLuF7VZxtLqspZksuJvN3nO43
         X4dPbIE02D+kwySHigV3xog/QFQ8cIs+SLYmNiBAhw5H8jS78+zfI6bSIgUv4v+NV8T/
         JoeA==
X-Gm-Message-State: ANoB5plGZj4IuQ5fANwDKOwe84fttMA8GzYEdhROTI+mbSBnrRtVykDy
	yUBT+G2PxjlZ/Jws/SeIrTE=
X-Google-Smtp-Source: AA0mqf6W+VtMWEX1H23APQyEFSt+dLdxxwdn0evkdr8mxu2DQ6AVbFyyaCaKAKhhyYTGYApXRh+Kzg==
X-Received: by 2002:ac2:43b0:0:b0:4a4:719a:19ed with SMTP id t16-20020ac243b0000000b004a4719a19edmr3322535lfl.356.1668805043876;
        Fri, 18 Nov 2022 12:57:23 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id m13-20020a056512014d00b0048ad4c718f3sm806348lfo.30.2022.11.18.12.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 12:57:22 -0800 (PST)
Date: Fri, 18 Nov 2022 23:57:21 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, alex@ghiti.fr, hch@lst.de,
	ajones@ventanamicro.com, gary@garyguo.net, jszhang@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <Y3fxsWPLPlKGfMBj@curiosity>
References: <20221111075902.798571-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111075902.798571-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_125730_233880_A400863F 
X-CRM114-Status: GOOD (  16.81  )
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

Hi Guo Ren,


> After use_asid_allocator is enabled, the userspace application will
> crash by stale TLB entries. Because only using cpumask_clear_cpu without
> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> Then set_mm_asid would cause the user space application to get a stale
> value by stale TLB entry, but set_mm_noasid is okay.

... [snip]

> +	/*
> +	 * The mm_cpumask indicates which harts' TLBs contain the virtual
> +	 * address mapping of the mm. Compared to noasid, using asid
> +	 * can't guarantee that stale TLB entries are invalidated because
> +	 * the asid mechanism wouldn't flush TLB for every switch_mm for
> +	 * performance. So when using asid, keep all CPUs footmarks in
> +	 * cpumask() until mm reset.
> +	 */
> +	cpumask_set_cpu(cpu, mm_cpumask(next));
> +	if (static_branch_unlikely(&use_asid_allocator)) {
> +		set_mm_asid(next, cpu);
> +	} else {
> +		cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +		set_mm_noasid(next);
> +	}
>  }

I observe similar user-space crashes on my SMP systems with enabled ASID.
My attempt to fix the issue was a bit different, see the following patch:

https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/

In brief, the idea was borrowed from flush_icache_mm handling:
- keep track of CPUs not running the task
- perform per-ASID TLB flush on such CPUs only if the task is switched there

Your patch also works fine in my tests fixing those crashes. I have a
question though, regarding removed cpumask_clear_cpu. How CPUs no more
running the task are removed from its mm_cpumask ? If they are not
removed, then flush_tlb_mm/flush_tlb_page will broadcast unnecessary
TLB flushes to those CPUs when ASID is enabled.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
