Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F0C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Nt9S7r8A0PxlO+xvQZf/VUFv09smAVeoSHKiExrkOE=; b=V8GAD90IStDUZe
	kJGujUhE+teeb0SNLrGcCIPvDcgRZ2gJVNKiN+FDxIX+BhuWLmF+yJzyZLb8GmFgYZshA0ifqR4sR
	CV0+atYWPTX9MhMaBpvCNLSk9Fr/oYRRf1avRh9wKraC2XrUY0Mx49Y3HfumX0yKPVca2l9RymkNw
	HvCICdFLVgD0a69cy8hq2swuK9auO61MczmUFgoeCy5RQI4YGIXkx6H7tmtfGU++zbqIRyBb+PuOH
	5f/EVnpR4pL33a0Sr+paiYFmHELbA5NUaChCsL2/puX2KDwkfQ3NdtLlLg3jReLBcmibeO1JfX0gS
	Acm/5N3sL6hhfnoaAcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ZHF-00CXep-0G;
	Fri, 09 Jun 2023 10:23:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7ZHB-00CXcc-14;
	Fri, 09 Jun 2023 10:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D4A6651E7;
	Fri,  9 Jun 2023 10:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86858C433EF;
	Fri,  9 Jun 2023 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686306203;
	bh=jokXRQ/Afrc/Il5mpiYP/ZSsYCJK2XP/mW2BduDXGRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odWF9annpoAePCQk9W5fYJzKk1nOlX0qTIzryocOT3UuFvJ2w+ZSn8x51I40zgOrY
	 Gxpifiqr4Xfa5Ux18Vh5m36FfEuWKQreeDyVHZzkrcADV4qsQ5WYukSPVJxjubFuVo
	 Q42LNL7su5ETj3ou9/6QwORZtG/ZQFqAd5TQfEMX9qxpHyXuSPEKt+Li++0BYpTiSY
	 GovVrAF5ilDE77N5q0PaeIUYAJosnK7cmPrGxUIvdTiNd7c0bP5IkgspPb4LTsMC++
	 6IZJRAQv+HaNdr/l0JL5JVaNnJ+296JWPgmGzsbiA1f+DZRkyQTmUxfYPNDyEn54pI
	 3b832VHPcromw==
Date: Fri, 9 Jun 2023 11:23:16 +0100
From: Will Deacon <will@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: catalin.marinas@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, chris@zankel.net, jcmvbkbc@gmail.com,
	steven.price@arm.com, vincenzo.frascino@arm.com,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH V2 2/4] arm64: hibernate: remove WARN_ON in
 save_processor_state
Message-ID: <20230609102315.GA3847@willie-the-truck>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
 <20230609075049.2651723-3-songshuaishuai@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230609075049.2651723-3-songshuaishuai@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_032325_455516_CB46CD4E 
X-CRM114-Status: GOOD (  18.22  )
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

On Fri, Jun 09, 2023 at 03:50:47PM +0800, Song Shuai wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
> 
> In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
> is not defined, but the sole possible condition to disable
> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
> We also don't have to check it in save_processor_state.
> 
> So remove the unnecessary checking in save_processor_state.
> 
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/arm64/kernel/hibernate.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 788597a6b6a2..02870beb271e 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -99,7 +99,6 @@ int pfn_is_nosave(unsigned long pfn)
>  
>  void notrace save_processor_state(void)
>  {
> -	WARN_ON(num_online_cpus() != 1);
>  }
>  
>  void notrace restore_processor_state(void)

Acked-by: Will Deacon <will@kernel.org>

Thanks!

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
