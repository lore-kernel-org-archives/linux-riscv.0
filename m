Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF52C54735
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/Janobe6ZOgCEVDOdGJZ69nHwt2QHEV47afOHqPPac=; b=LdZs2Jq8RBjPvN
	2NBqmAvcOsCaRmYbZVL9OhZIuJX6RlNd0Ai+dpbktlT/2OFFEu39MdI4iIN8br5PFYQsTNBm4UY7O
	+0gA7xalMLkHmilx9BzMDSACeP2zepEiRiTNozSpegdkJzwULMa1NX+VT37z5RZRt+nmxNf/Ej1Dc
	FqsU1aRl3mgWNc+FkYJjfC8qRy2/n1wENz1TAtp+LMULvMreMmDlHhsUIUvpzZMtzfT9QqT+vbaNW
	3YGSDJKR4o/lAyzzpLkoJixo2GhkkLeH1zIX76bW1rpAWm3N3yDotC3CFDX580KwlHTxhsxdJrudf
	c26doiaJR/D5WBSi0gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivkB-0000000BLne-1ZHr;
	Tue, 27 Aug 2024 12:56:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivhd-0000000BLFb-2sb2;
	Tue, 27 Aug 2024 12:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 010BCA41986;
	Tue, 27 Aug 2024 12:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F09C6105D;
	Tue, 27 Aug 2024 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724763220;
	bh=y1WUu1jEStLUVI5qg4HDk+K18wMW0OvXnCReTnAjNZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxFOPqqELuSLP3A0GzfeK1isECIgDfVOyMzXRQlpDlE5td3JdPslpGNHS/aBEOqTm
	 PoiHIbloJkUgAIDELfCqqLjp4B060qQemc9wc3XwzmSFmKS5VK3ZVEvZuH5JQdfQvN
	 cHoj5DPLWBq2x+QeHCvY3+W0oUmGzxJXDL6PvpNzspaD4vi5ihWiPLCA15vJPYIono
	 z/hbPY8MoNFrBriVkjsPSydjljktkb+4Am4OJW9PvQuRXdmLtsako2CZqiytnN6JaV
	 NeWPwutj5QepgD/ZovHDiJx5xCp+qhiPzPsnK1t/zMV8Si6g17UGWlwqjcedHNh3/n
	 nVghFDV7xzFfw==
Date: Tue, 27 Aug 2024 13:53:35 +0100
From: Will Deacon <will@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH -fixes] drivers: perf: Fix smp_processor_id() use in
 preemptible code
Message-ID: <20240827125335.GD4772@willie-the-truck>
References: <20240826165210.124696-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826165210.124696-1-alexghiti@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_055341_809767_E36E19EB 
X-CRM114-Status: GOOD (  19.61  )
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

On Mon, Aug 26, 2024 at 06:52:10PM +0200, Alexandre Ghiti wrote:
> As reported in [1], the use of smp_processor_id() in
> pmu_sbi_device_probe() must be protected by disabling the preemption, so
> simple use get_cpu()/put_cpu() instead.
> 
> Reported-by: Nam Cao <namcao@linutronix.de>
> Closes: https://lore.kernel.org/linux-riscv/20240820074925.ReMKUPP3@linutronix.de/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 31a17a56eb3b..25b1b699b3e2 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -1373,11 +1373,15 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>  
>  	/* SBI PMU Snapsphot is only available in SBI v2.0 */
>  	if (sbi_v2_available) {
> +		int cpu;
> +
>  		ret = pmu_sbi_snapshot_alloc(pmu);
>  		if (ret)
>  			goto out_unregister;
>  
> -		ret = pmu_sbi_snapshot_setup(pmu, smp_processor_id());
> +		cpu = get_cpu();
> +
> +		ret = pmu_sbi_snapshot_setup(pmu, cpu);
>  		if (ret) {
>  			/* Snapshot is an optional feature. Continue if not available */
>  			pmu_sbi_snapshot_free(pmu);
> @@ -1391,6 +1395,7 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>  			 */
>  			static_branch_enable(&sbi_pmu_snapshot_available);
>  		}
> +		put_cpu();

Are you sure it's safe to enable the static key with preemption disabled?
I thought that could block on a mutex.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
