Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1D5C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kdn7lLaj7iSn3iaclfk7fgvhhbuMQoR+2388kCog0Ts=; b=T2JAZhFsLut83D
	iDmkXk2qPtkwFWhXZzCGRYsdQjcmObouvJTo8MS+0/oY5SmuA/Iys07Va+oOSDEKyeuTWJZBK2CMG
	6Fp/EX8eTKD2DHjnWIxGsxpw53bGlZ1vigaIyHapKz34p5BFrCKzT2fSOocx7egzB1fZYRnvoDrJ4
	xTAJPLqYr80olv/ZMgfWsc4vrjAdqLV9nPCnzsrFvfPDk75FrAOGEOQjmQ0bM33kI534lgBrurQxn
	QIMnKV2qIGbreBRbdyo7O6+aw5iyCcYQYVi6rpNsC+coUJ+DYjO2+6jgL0//e/3h5ABpLmzH7u/eo
	85vqT5ZxcCJe2LSSUXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpalx-0000000BDEW-0ylF;
	Wed, 27 Mar 2024 21:25:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpals-0000000BDBh-2KkP;
	Wed, 27 Mar 2024 21:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 888CECE1DB2;
	Wed, 27 Mar 2024 21:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68782C433C7;
	Wed, 27 Mar 2024 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711574717;
	bh=JRSXPxdrQqrWLSPd70fIgarnQxXYvf0ykL1MJXBFB/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ho0uWBKvGFwgWY4CwVS1HcMdq7K6bPpP4DYyp/5qYDCJkxHKyU9vfNSJ7YDhaG3zs
	 w3HHQhQsufkKDmNXyX7K32z9CSG2dRF1a/R+ETw4hPgnu3feqOxD1j3PpcNoutpnv1
	 /CZN0jYTBBzf1bA4kpx/bG1sv4UaAmth1BnFQfHc=
Date: Wed, 27 Mar 2024 14:25:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Christoph
 Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v3 12/14] drm/amd/display: Use
 ARCH_HAS_KERNEL_FPU_SUPPORT
Message-Id: <20240327142516.e4b1f9ba6e2ec7bc300e4d58@linux-foundation.org>
In-Reply-To: <20240327200157.1097089-13-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
	<20240327200157.1097089-13-samuel.holland@sifive.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_142520_871552_50BB5216 
X-CRM114-Status: GOOD (  12.05  )
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

On Wed, 27 Mar 2024 13:00:43 -0700 Samuel Holland <samuel.holland@sifive.com> wrote:

> Now that all previously-supported architectures select
> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
> of the existing list of architectures. It can also take advantage of the
> common kernel-mode FPU API and method of adjusting CFLAGS.
> 
> ...
>
> @@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>  	WARN_ON_ONCE(!in_task());
>  	preempt_disable();
>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
> -
>  	if (depth == 1) {
> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +		BUG_ON(!kernel_fpu_available());
>  		kernel_fpu_begin();

For some reason kernel_fpu_available() was undefined in my x86_64
allmodconfig build.  I just removed the statement.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
