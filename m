Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1870C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0W08nMRptPw83i64rr8RKgtCPYIbhwsi+Tq3ajxzqk=; b=43HXpYEkieQ1gi
	KwOAt3FWk0Do49TbtLacu6HJKXMTkkSsOvjdv2jcosZgOeYKVFovDZbduuwcRfSM6+6Mw6dJkQyfq
	fEu9UvsHCr/tYvk/A2WXhueMgja52wPVFaeG2JjZiY4Q32YvvJKdR5sPEfA3srmtddGQvhbnIfvQ/
	Pc/8VZsmutq0UQJsW6+c7VcDTG6EwFtFc93LvtGyQUmkbI4Qiw6tV8d31GfFYTkU7iFFUvoWKgNBN
	iX5Kpbx4wz+ZqBz45+W7vd1GvXLg/TJRxxsAiKTT0lYUkZtaOHWtvqDcMfCqk6Ah/QcSiSLZdK6qp
	gdVTOZotSS0vdgeNb/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwyno-0000000ErkL-2Gow;
	Wed, 17 Apr 2024 06:29:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwynk-0000000Erhs-1Wg3;
	Wed, 17 Apr 2024 06:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00310CE113E;
	Wed, 17 Apr 2024 06:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F851C072AA;
	Wed, 17 Apr 2024 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713335385;
	bh=ebqb33hqc4F6zSwsMRpxS2CZvXYy0dorhRZVr5ux1J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLSBFvGaiGz3+TWitmIbeOotiIZFwPFcEsEMvvoRQxg9tQq93gL6LB33aKtgx5uqA
	 E+YKHlcLCcVKmZGYL/dm2YLz1fZlagEBkF7w2e+XXIRQ4zbQnma5ZpNOu7fTHkQcGL
	 Z54r1Mpu5YA1R/ijSt7qRHBk61oX4l6Vphn7bj/CMQClj8nxmTbf2cuICRUjly6XyU
	 NzwC0fPyTvAG+a13UZNQd58qG493svJDgZb27vycwQibzEvbE+JpaBNS1OA1jqGNfu
	 OekZH2l8SKMvWrRnk63KBlmD1t64gyq5XhNWal6GcUJqTVcG6SnFXgTJ/eUkmwPbHG
	 BCWJrYX6r6feQ==
Date: Wed, 17 Apr 2024 02:29:37 -0400
From: Guo Ren <guoren@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: dqfext@gmail.com, ajones@ventanamicro.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atishp@atishpatra.org,
	conor.dooley@microchip.com, heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, mark.rutland@arm.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com, will@kernel.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <Zh9sUUUT09LZb0MO@gmail.com>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <tencent_29B81A312921AB8D9D7C3C8292DAAB8EF608@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_29B81A312921AB8D9D7C3C8292DAAB8EF608@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_232948_790293_2AE5D98B 
X-CRM114-Status: GOOD (  28.96  )
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

On Fri, Apr 12, 2024 at 02:09:32PM +0800, Yangyu Chen wrote:
> On 2024/3/11 14:30, Qingfang Deng wrote:
> > T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
> > reports non-zero marchid and mimpid. Remove the ID checks.
> > 
> > Fixes: 65e9fb081877 ("drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores")
> > Signed-off-by: Qingfang Deng<dqfext@gmail.com>
> > ---
> >   arch/riscv/errata/thead/errata.c | 4 ----
> >   drivers/perf/riscv_pmu_sbi.c     | 4 +---
> >   2 files changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index b1c410bbc1ae..49ccad5b21bb 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -125,10 +125,6 @@ static bool errata_probe_pmu(unsigned int stage,
> >   	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
> >   		return false;
> >   
> > -	/* target-c9xx cores report arch_id and impid as 0 */
> > -	if (arch_id != 0 || impid != 0)
> > -		return false;
> > -
> >   	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >   		return false;
> >   
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 452aab49db1e..87b83184383a 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -811,9 +811,7 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
> >   		riscv_pmu_irq_num = RV_IRQ_PMU;
> >   		riscv_pmu_use_irq = true;
> >   	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
> > -		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
> > -		   riscv_cached_marchid(0) == 0 &&
> > -		   riscv_cached_mimpid(0) == 0) {
> > +		   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID) {
> >   		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
> >   		riscv_pmu_use_irq = true;
> >   	}
> > -- 2.34.1
> 
> Tested-by: Yangyu Chen <cyy@cyyself.name>
> 
> With this patch and T-Head C908 PMU being probed by OpenSBI, I can now use
> the perf record to profile RVV 1.0 software on Canaan Kendryte K230. This
> will speed up many RVV 1.0 software developments now and even for better
> performance.
> 
> However, as Inochi said, the newer version, C908 may support Sccofpmf. We
> should ask Guo Ren to clarify this so we can have the cleanest way to
> probe what to use between THEAD_PMU and Sscofpmu.
> 
> I added CC to Guo Ren. Please clarify about this.

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index c6ef09c4548c..ee6fa5b65b53 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -812,8 +812,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu
*pmu, struct platform_device *pde
                riscv_pmu_use_irq = true;
        } else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
                   riscv_cached_mvendorid(0) == THEAD_VENDOR_ID &&
-                  riscv_cached_marchid(0) == 0 &&
-                  riscv_cached_mimpid(0) == 0) {
+                  (riscv_cached_marchid(0) == 0 ||
+                   riscv_cached_marchid(0) == 0x8000000009140d00) &&
+                  (riscv_cached_mimpid(0) == 0 ||
+                   riscv_cached_mimpid(0) == 0x50000)) {
                riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
                riscv_pmu_use_irq = true;
        }

Only k230's c908 has the problem, not all XuanTie Processors. We just
need to pick it out. Could the above satisfy you?

> 
> Some off-topic things:
> 
> I need this feature recently since I am implementing a pure RVV chacha20
> algorithm. I have already sent PR to openssl to speed up the crypto
> performance on RVV without Zvkb support and maybe ported to kernel crypto
> sometimes. To speed up TLS or other applications for many chips that may
> come this year with RVV 1.0 but without Zvkb.
> 
> Link: https://github.com/openssl/openssl/pull/24069
> 
> However, the performance evaluation on K230 is not well compared to pure C
> implementation. I will need this PMU driver to do some profiling.
> 
> Thanks,
> Yangyu Chen
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
