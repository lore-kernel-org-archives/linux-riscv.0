Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E989C79FB2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c2CHdlvzXq6K2TuKs9UwizpheYuYtOfdXTH7WuNsiU=; b=Ha40CiLFfThbc5
	3kvPJh7fjFFoEZE1yaHwYh4vAxolS63OQZkkBH0suZVeTY9qyTmxz/qKgAIlvedLOTKBmQKRqJyo/
	ks5YfBqjhVj24FGXOQlij8GZuH/Mt0fwzPlVt60Pu51ETXDkdehmJZgz8+tRKFIVdjYAg/E3732IL
	bn4K3E0OE0c/Zd9vznED7o8KuNj+idxhMDBwSOnDnSEBqbhsDpDoLisAucVsNdjGkXWMk1OPLP2Ot
	nSCi4EiCf2GvuOSrEi1PBYv22fL2GLO5+4XOjTwYnvhwUegIRUPcS9tN9VbohpB0R0n4PI+Xv4UJd
	q0kcpJN8pO5kTkJHQDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44EQ-0000000AOLJ-0nKl;
	Tue, 08 Sep 2026 22:23:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44EN-0000000AOL7-42eS
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 22:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE18F60214;
	Tue,  8 Sep 2026 22:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0376B1F00A3A;
	Tue,  8 Sep 2026 22:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788906234;
	bh=rdePD4l8fV/1dBShtyAVdNh0Ias4aYNa6xAzkxWzQ/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F522mD+VgsB5DgeJaxr9C2eXIiBu2P+ZDRJe0yFAKL7Sg+7S4sXFSsUeGTFiQTYmS
	 KBlHdDUT6gbT38/XmCPnw+uTRZKnTAJvbb9X1FQsJ8H35I39nIiAkSfmoWYp9L/mQx
	 x2mhSxBTbaZfeSXgR8Abzk/zBogZtCzXnJRmqLymSAFD+QlXK5e5LvAtLOtu3Jcw/M
	 WQRb5kljsaSpLV2hfUBCW6qRbmEiUydugrp3y/iEYte0Q3uk5sywToBzr0Vn30ZGhe
	 0lTBB1iR7lVsmHSVDeLfFaweCkkZuN4Izd8UWcGL9xNuGKuDIFav6vzBFJ16al224Q
	 nmq1UGCitoWHg==
Date: Tue, 8 Sep 2026 15:23:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guo Ren <guoren@kernel.org>, tglx@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu,
	alex@ghiti.fr, daniel.lezcano@kernel.org, anup@brainfault.org,
	hui.wang@canonical.com, samuel.holland@sifive.com
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
Message-ID: <20260908222349.GA2324870@ax162>
References: <20260816070049.2097442-1-guoren@kernel.org>
 <20260816070049.2097442-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816070049.2097442-2-guoren@kernel.org>
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

On Sun, Aug 16, 2026 at 07:00:45AM +0000, Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The IPI message type enumeration (and therefore IPI_MAX) is currently
> private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
> the exact number of IPIs that the architecture requires, so move the
> enum into the public header.
> 
> This is a pure code movement with no functional change.

Other than a build breakage with allmodconfig :) -next has this change
as commit 1ae91dc397eb ("riscv: smp: Move enum ipi_message_type to
asm/smp.h"), where it breaks allmodconfig with several errors along the
lines of:

  In file included from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:20:
  drivers/media/platform/mediatek/vpu/mtk_vpu.h:63:9: error: redeclaration of enumerator 'IPI_MAX'
     63 |         IPI_MAX,
        |         ^~~~~~~
  In file included from include/linux/smp.h:119,
                   from include/linux/interrupt_rc.h:17,
                   from include/linux/spinlock.h:60,
                   from include/linux/sched.h:38,
                   from include/linux/ratelimit.h:6,
                   from include/linux/dev_printk.h:16,
                   from include/linux/device.h:15,
                   from drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:8:
  arch/riscv/include/asm/smp.h:27:9: note: previous definition of 'IPI_MAX' with type 'enum ipi_message_type'
     27 |         IPI_MAX
        |         ^~~~~~~

So one of these needs to change.

> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/smp.h | 12 ++++++++++++
>  arch/riscv/kernel/smp.c      | 12 ------------
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 0ecc67641b09..bed39fff1f8a 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -15,6 +15,18 @@
>  struct seq_file;
>  extern unsigned long boot_cpu_hartid;
>  
> +enum ipi_message_type {
> +	IPI_RESCHEDULE,
> +	IPI_CALL_FUNC,
> +	IPI_CPU_STOP,
> +	IPI_CPU_CRASH_STOP,
> +	IPI_IRQ_WORK,
> +	IPI_TIMER,
> +	IPI_CPU_BACKTRACE,
> +	IPI_KGDB_ROUNDUP,
> +	IPI_MAX
> +};
> +
>  #ifdef CONFIG_SMP
>  
>  #include <linux/jump_label.h>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..8930b62b15e7 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -28,18 +28,6 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
>  
> -enum ipi_message_type {
> -	IPI_RESCHEDULE,
> -	IPI_CALL_FUNC,
> -	IPI_CPU_STOP,
> -	IPI_CPU_CRASH_STOP,
> -	IPI_IRQ_WORK,
> -	IPI_TIMER,
> -	IPI_CPU_BACKTRACE,
> -	IPI_KGDB_ROUNDUP,
> -	IPI_MAX
> -};
> -
>  static const char * const ipi_names[] = {
>  	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
>  	[IPI_CALL_FUNC]		= "Function call interrupts",
> -- 
> 2.43.0
> 

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
