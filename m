Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08132C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLfk8aeb3sLPg7RGU3k5GKm2oxvoMvHTUy0mkPql+6s=; b=2tmn2hPB4j6jhX
	I7pPNWsJo8PNLPuWijB/R1jJLVdtRoiUyNiVNczsbcUSdzaRWsCKueBU7jRVO2wRZRHXnmkNdosue
	U/0H4/X58gRpl1l/fuxGCZF2AmSINJMoSs6UFtYbjMndTPnf46RnJJzIaRSimqgf+KkY59J1bUcnd
	kk/mXyszU3/QfnvAjCBSEr3CAosf3k5dg5LIaPEm3ccIlet5HlmSYFho/JYYiqqSpcsYsF44wGME2
	9/gDlAxhRGPqMlYv8Nhmr5K6KxTGwByvv8Mx6tcwjT5srRlzFfp1MUHTWy76eGh0ppc2aM9hdVQL/
	KtmoINiwdHpqrhsw8uLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWf6-00GGyA-RO; Thu, 20 Oct 2022 14:36:44 +0000
Received: from mail.skyhub.de ([5.9.137.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWal-00GCwF-5g; Thu, 20 Oct 2022 14:32:18 +0000
Received: from zn.tnic (p200300ea9733e710329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e710:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C9F981EC0567;
	Thu, 20 Oct 2022 16:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1666276324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=kmZIn+RmPcFrrruewpP3q+eT9dV6viqfrtURROqoXV4=;
	b=c6vOv2k+nIu92WEk/Ed8XAbzSVCEMl31tZInGnnk957mMSXKeCaMDExHzoli7C5KMKrV+y
	ebd6to516TQ9ccj8KfLC/+jvqvIyQ5e4J8Eq1yn+ILqsJ9ZqOxLp7oQJGB4g6ntNCxyIAG
	fqIm3xd8Gkn4era5P1ZQDbYZLc4jtZE=
Date: Thu, 20 Oct 2022 16:32:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: guoren@kernel.org
Cc: arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, heiko@sntech.de,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arch: crash: Remove duplicate declaration in smp.h
Message-ID: <Y1Fb4HGzJEKCD1SF@zn.tnic>
References: <20221020135913.2850550-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020135913.2850550-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_073215_399769_9B40E00D 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 20, 2022 at 09:59:13AM -0400, guoren@kernel.org wrote:
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

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
