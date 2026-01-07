Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EAD0D176
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXBCzPSMRznTfuw2itcoVHLyQf3cyn+sYRZAF/O0rE4=; b=HInxUAn2W5ZhbE
	0AMuA7PuhViU5Y3DK1Ft9xU6FJcZiLprYs2+ZOVSj6Qfrlyb8fGcaVLFWn4xiCiFo4jhu7eFRERyv
	j4meuchoRtZ45WKMcm41kW3AXjiFWCJVlHWsD+YVa+Q2x1T3vr9SKjxg7YpS1jdKSRASvsv6rfADO
	/OX7/pWDwjS0CIWZCZgeIA27s4QSACl9ICpiI0y4khtdVhMdpGCvDcUTCP+37iEgoXOiIFUHPjNnM
	URqHaFvl6HNzk4W9hnwFo4khygec4Ef1t65Ey8JMC94SXZYewn1zr0oeqLp/S17PLdhEH28Snh0j4
	k5L2+KnOdw10hBPKyN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbXa-0000000FgaW-0AAR;
	Wed, 07 Jan 2026 21:58:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbXY-0000000Fga1-0j72;
	Wed, 07 Jan 2026 21:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03DD560007;
	Wed,  7 Jan 2026 21:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4AEC4CEF1;
	Wed,  7 Jan 2026 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767823052;
	bh=DMHqqj1KA0UKWPMpyqAGo7GxPeavQmrDBNQuOKzRzyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSwd1fJxMHCtfmER/yTQlVdu91vkfgOhciYiN5sFTnojc61mR6mKtGpxrVrR6WUbT
	 8r5mjw5qvTVRLnxQ0pz+SXCrpmaXiewYwUCFXzh68mCh/RkN82gECJzpIi57pkA55t
	 pumo6j1VrI4t6yd3C103IaV/277rUaQzjq+iii17GwDzaPX92bTZgPAb1gy5Y3qMPF
	 7pWbhOYDigxKF1UDS2w6OxPrnEXNZqGl9KNnMr2Mc2qPiatE1W4HK6nJ1z+eEvGEvg
	 PvfsmW0udvQxsJSqyHYCvB76NRLBnPPhWlvSBrsBsja1N45cK1B/031ynPCZEsR3s1
	 W/5Tax56uXLtQ==
Date: Wed, 7 Jan 2026 21:57:24 +0000
From: Will Deacon <will@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	catalin.marinas@arm.com, dianders@chromium.org,
	johannes@sipsolutions.net, lihuafei1@huawei.com,
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org,
	mingo@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, suzuki.poulose@arm.com,
	thorsten.blum@linux.dev, wangjinchao600@gmail.com,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 1/2] watchdog: move arm64 watchdog_hld into common code
Message-ID: <aV7WxLVlMzD910Dg@willie-the-truck>
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
 <20251114033243.76509-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114033243.76509-2-cuiyunhui@bytedance.com>
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

On Fri, Nov 14, 2025 at 11:32:42AM +0800, Yunhui Cui wrote:
> Move the contents of arch/arm64/watchdog_hld.c to kernel/watchdog_perf.c
> to create a generic implementation that can be reused by other arch,
> such as RISC-V.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/kernel/Makefile       |  1 -
>  arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
>  drivers/perf/arm_pmu.c           | 10 +++-
>  include/linux/perf/arm_pmu.h     |  2 -
>  kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
>  lib/Kconfig.debug                |  8 +++
>  7 files changed, 101 insertions(+), 98 deletions(-)
>  delete mode 100644 arch/arm64/kernel/watchdog_hld.c

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
