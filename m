Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7648FED3C3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmOCka1+ExLqvkvy1b0UUkvFHX5GOaUwa+HnlFyKToQ=; b=uePCDJ+PZZJa9M
	yeHfO0pPUuryPlkz+giyqjIJOEM4FynsIsSyJP/Vx52MHMpYPa0yfCbl4lYfCr8WHSufE4ziWImwo
	9u4IPOWPl/k8xYx5Ps1ZV03UCB6P9GN1cD46cKmp+LL/nHKjp1uPOD/STC54Or1lDWaLHXNDZghir
	dqYhQZxTym6iFTBbe+11Cfm2ciUUIzazO/SWnQ0GbuR3ww37B0cseqGsdpKYNxFTziGoobEb7KNxn
	do9EIok4Q0xh/6x7cJEZrFHtHGbUTKFDWafbL5QWhCO1RAlEGfgqZoeoRwvvA4HhHYWSm523yKlO2
	xqhkNUNLKFxI2qScRuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGYb-0000000DEwg-1lx4;
	Fri, 24 Apr 2026 13:26:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGYa-0000000DEwa-2QA2
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 13:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A236B6001A;
	Fri, 24 Apr 2026 13:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA938C19425;
	Fri, 24 Apr 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777037215;
	bh=45bUrahzjDCQhKEw/kDJCTogfHZR6NpH+qg17RLU+Lo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QLWH6RWCRnGqUS+ndojr6729J6apNVlHAw601IFK9CUlb+tGlYawQgUaO7LGorTCl
	 CnaWJety6drc/OJh6rOR90Qg9TMdgruJeUNah98jHPMBp4WHNlp4jVZZVEMh+58asu
	 dnFuGbr+7Jnjh2dAVMXRLPmRaIAMdrjnZ1V3jnslwtv2RG0PyY3JByOz8MfBkAKHXI
	 urQ/pxvQFGkBOBUT6A6jwx4TUldQsqSzekqgNi6o2hvEhoc1kk1whtPoCJc5O6iMyx
	 VZcl1U2lQW8jbHjIxiL3Oih5+GhEGLOpo1Xz3GkQcbE3izw/vZzVVDPTw5pV89WyQn
	 X8R+09twrbBig==
Date: Fri, 24 Apr 2026 07:26:51 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, torvalds@linux-foundation.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v7.1
In-Reply-To: <20260424003249.GA2985598@ax162>
Message-ID: <833360eb-6e67-053f-bb26-451e00075dbe@kernel.org>
References: <ecdaf68d-1fe5-0b55-ff6a-a2710c05ccef@kernel.org> <20260424003249.GA2985598@ax162>
MIME-Version: 1.0
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

Hi Nathan,

On Thu, 23 Apr 2026, Nathan Chancellor wrote:

> On Thu, Apr 23, 2026 at 06:07:29PM -0600, Paul Walmsley wrote:
> > Nam Cao (6):
> >       riscv: Clean up & optimize unaligned scalar access probe
> >       riscv: Split out measure_cycles() for reuse
> >       riscv: Reuse measure_cycles() in check_vector_unaligned_access()
> >       riscv: Split out compare_unaligned_access()
> >       riscv: Reuse compare_unaligned_access() in check_vector_unaligned_access()
> >       riscv: Remove support for XIP kernel
> 
> Please note that this series is broken with CONFIG_CFI. Please see the
> fix I sent and consider applying it sooner rather than later:
> 
>   https://lore.kernel.org/20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org/

Thanks very much for the reminder; queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
