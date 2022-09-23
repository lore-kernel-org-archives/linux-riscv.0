Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B50ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lSsiHNLLMEcK6dw/ZlKn1vAe3iKsvr7ZKq4A6gQxnQ=; b=Cy8ESiFU3/JMmb
	v619BpO2fwp1TTuc/c3G/q3r51PZjMeYyizkXU0WkdWsmg6Ji3I7A+90K8EmAaMMgrFR7JGcSsz+z
	sz2a+ERUWUncHqiWYCJcbj3WxMMba27EOv/2lrurc2SkIyH6SrB85MUrWU/CZPI4u3KyKJ9yqd/rW
	sEfUW/vmGAGoNnSTXGCoWG6O8khL4iz0vhomVVZc1YTXJgGxpkGVaSU/M8NaR7kMgYBeMdCmznnbC
	SXthq/d+YYIrTx3myfK+cTGYtWjolQdF7MmlB0sIh7Ouf5Y+geWzIZIZSInHp7N3USxLAlMAjnzZ1
	AIG4l31Pr+K1cT2C0Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgQM-003oLR-HN; Fri, 23 Sep 2022 11:00:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgQJ-003oK5-Ev; Fri, 23 Sep 2022 11:00:48 +0000
Received: from p508fdb48.dip0.t-ipconnect.de ([80.143.219.72] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1obgQ5-00067T-Qn; Fri, 23 Sep 2022 13:00:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: xianting.tian@linux.alibaba.com, palmer@dabbelt.com, palmer@rivosinc.com, liaochang1@huawei.com, jszhang@kernel.org, arnd@arndb.de, guoren@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH V4 3/3] arch: crash: Remove duplicate declaration in smp.h
Date: Fri, 23 Sep 2022 13:00:32 +0200
Message-ID: <5594014.Sb9uPGUboI@phil>
In-Reply-To: <20220921033134.3133319-4-guoren@kernel.org>
References: <20220921033134.3133319-1-guoren@kernel.org> <20220921033134.3133319-4-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_040047_528187_BCFF3001 
X-CRM114-Status: GOOD (  14.68  )
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

Am Mittwoch, 21. September 2022, 05:31:34 CEST schrieb guoren@kernel.org:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Remove crash_smp_send_stop declarations in arm64, x86 asm/smp.h which
> has been done in include/linux/smp.h.

nit: the commit message could reference the commit that brought in the
generic declarations, which was
	6f1f942cd5fb ("smp: kernel/panic.c - silence warnings")

other than that
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/arm64/include/asm/smp.h | 1 -
>  arch/x86/include/asm/crash.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index fc55f5a57a06..a108ac93fd8f 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -141,7 +141,6 @@ static inline void cpu_panic_kernel(void)
>   */
>  bool cpus_are_stuck_in_kernel(void);
>  
> -extern void crash_smp_send_stop(void);
>  extern bool smp_crash_stop_failed(void);
>  extern void panic_smp_self_stop(void);
>  
> diff --git a/arch/x86/include/asm/crash.h b/arch/x86/include/asm/crash.h
> index 8b6bd63530dc..6a9be4907c82 100644
> --- a/arch/x86/include/asm/crash.h
> +++ b/arch/x86/include/asm/crash.h
> @@ -7,6 +7,5 @@ struct kimage;
>  int crash_load_segments(struct kimage *image);
>  int crash_setup_memmap_entries(struct kimage *image,
>  		struct boot_params *params);
> -void crash_smp_send_stop(void);
>  
>  #endif /* _ASM_X86_CRASH_H */
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
