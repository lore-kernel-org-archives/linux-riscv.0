Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C248C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 20:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mH6UEkIWtpYFcjqgwkeFutPeCM/XcwIN3inGOTrzHIo=; b=EO8lUDiL4rxYyh
	cqtedxmcD6aQA5HnaUntBK8kgMK9hzzuSoQ5RYDePd4FR15UgG4YqivNfCLMF4A/vjYIFoGYiGNGq
	M4K7965uApOjQxCpTVU/oecixmU9ls2UqcnLvEEEwg/cYXo38T6El8csYZkfoP9Z9Bh8pZKrsgqSe
	HV3XqJGANsnDQLHiko0VQ7KWQ7xIbY0FLdUcMp4fHuTYLwYhRUD7aJeJOWaaYJKEhZaaBU6Nu71e6
	Pk746vNsehTb2D09VYi/HnyEnV+9j0CwxvqeI+Mju5BcnDyWRBxF8h13tyd5zrzMpYJ/4jDaaOv6p
	OaQogag3IjuNH4buy8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0q1L-00Alld-RO; Thu, 01 Dec 2022 20:18:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pyN-00Akr6-3Y
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2B8DB81F50;
	Thu,  1 Dec 2022 20:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9FFC433D6;
	Thu,  1 Dec 2022 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669925752;
	bh=vVCfhscBzI9hn0s5h73jc2HuArjB4WLayXOmvKzLUo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sfskE8PqGZAE0YG11Edae4n8y4yWSGcNRmmu1azjGMUZLqBzNWIuh9gs2rLPEUwn3
	 mWFDLZtbpnoT181NqZB6ZxAQajpEk6nXI+zJihxAecgvMGnT7kCQGOZYj7I4egm5VK
	 7/X7zOyOnH9tnWdb3OhbwVFH82y8u3/wz72kZWXTp9bzZx5OiU3Gdwp8K/ClkcG3Si
	 US4hWWCYF/cpmd2SCt74dK8A239FzO9BOlyOJa6uUm9lit+9oPQG6Q0dkRvf3xNViW
	 I8wwd7uCEut4eToKMajbE9s7FmU0BquA/BoziUayCUzZ+PG++Q75e7Dw308qqRMum/
	 kD6mJMeAmcAWg==
Date: Thu, 1 Dec 2022 20:15:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: guoren@kernel.org, anup@brainfault.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de,
	rostedt@goodmis.org, mhiramat@kernel.org, jolsa@redhat.com,
	bp@suse.de, jpoimboe@kernel.org, suagrfillet@gmail.com,
	andy.chiu@sifive.com, mark.rutland@arm.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 6/7] riscv: ftrace: Add
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Message-ID: <Y4kLcgp4Oas6P3UG@spud>
References: <Y4kIcGY0rXTGb3po@spud>
 <mhng-2612202a-d3bf-4b2b-9b8b-df67b38b5315@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-2612202a-d3bf-4b2b-9b8b-df67b38b5315@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_121555_460311_606AE0A5 
X-CRM114-Status: GOOD (  27.20  )
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

On Thu, Dec 01, 2022 at 12:06:39PM -0800, Palmer Dabbelt wrote:
> On Thu, 01 Dec 2022 12:02:56 PST (-0800), Conor Dooley wrote:
> > On Mon, Nov 28, 2022 at 10:32:29PM -0500, guoren@kernel.org wrote:
> > > From: Song Shuai <suagrfillet@gmail.com>
> > > 
> > > This patch adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.
> > > 
> > > select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide the
> > > register_ftrace_direct[_multi] interfaces allowing users to register
> > > the customed trampoline (direct_caller) as the mcount for one or
> > > more target functions. And modify_ftrace_direct[_multi] are also
> > > provided for modifying direct_caller.
> > > 
> > > To make the direct_caller and the other ftrace hooks (eg. function/fgraph
> > > tracer, k[ret]probes) co-exist, a temporary register is nominated to
> > > store the address of direct_caller in ftrace_regs_caller. After the
> > > setting of the address direct_caller by direct_ops->func and the
> > > RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
> > > by the `jr` inst.
> > > 
> > > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > > Tested-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > ---
> > >  arch/riscv/Kconfig              | 1 +
> > >  arch/riscv/include/asm/ftrace.h | 6 ++++++
> > >  arch/riscv/kernel/mcount-dyn.S  | 4 ++++
> > >  3 files changed, 11 insertions(+)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 1d0e5838b11b..2828537abfcd 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -278,6 +278,7 @@ config ARCH_RV64I
> > >  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > >  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
> > >  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> > > +	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > >  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> > >  	select HAVE_FUNCTION_GRAPH_TRACER
> > >  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
> > 
> > Please sort new entries here in alphabetical order, so move the new
> > entry up by one line :)
> 
> IIRC whomever sorted these entrties orignially posted a script that does
> that.  Maybe that should be integrated into either checkpatch or one of the
> patchwork robots so we don't have to manually remember the alphabet?

If it actually does *sorting* I am not sure it's a suitable inclusion
as-is that'd seem better as a pre-commit hook. But maybe it can be
co-opted somehow. I'll try to dig it up off of lore tomorrow.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
