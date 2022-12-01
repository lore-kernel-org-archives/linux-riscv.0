Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B8FC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ/lOvolLUKqgjNW9w59tPwZJVC1gNzrtZshE++beSw=; b=rVxT4TpBhpdw3e
	zYcELhpyXDCvQQR0gyH2ic7l0YUHZTcJDwp2T8qhL1k7u83QQYlF90N4pCwNEraeG6vvIZA4au61M
	Q4IHjluCH+aV9k3+Km4yWTQORVZBJdj3reuJHqONYCzlkKm+KImNIdJMIBnxWgWNLby2IB45KVhFh
	t35lOv8UaYVMuMn+BaUK533sHkpUokWTPNek3J3Qyo6tbU3b8a55oy0hzOznWY4L5j//v38giiM7M
	jVKDvIVtIUA5lh+WpMaRRDsAGlvaPAwHF5G6H6yKG1kVF6Fj624T87U8pJeCokb8DHzGJa+0+tbeN
	IO4xeFcCqpSAN/gIw7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pqz-00Aian-Ui; Thu, 01 Dec 2022 20:08:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0plx-00AhMP-3b
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 20:03:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90FBBB82027;
	Thu,  1 Dec 2022 20:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D419C433D6;
	Thu,  1 Dec 2022 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669924982;
	bh=4zUvbQt2fvOvF13lR47+s4icnmOdckMCkatNScd1W3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5y9L+drRDUDYiBMvoL/H6hKQUSFqUDjnPPQGL6Log+dgkEx164KZx3GrFHNuAhes
	 YEGJ7G7EtWpxTmCxMp3xDzX6dC2qZp8x/sgAe9GKg0PKXVDGhE1t2ZACDuRt6+0iGT
	 Bq1LVMUe5W9ZCnXy4aq73Jo0QoQv5yvWnpw3mVFWlzeO4HmfUsgxIOh0L+4NJ6LaWE
	 qo0r3dOtFsjZbV4Kb0V4+tGSJNdBShcbCD5K7KQarHmu3MzP8HBhnZPiUHmCgplYZ/
	 jpvVASn1OF92eTjanqp1B2TXJVerehOzKXTUIz8dwhm0u0zAaQPD6qrHmE2S4D8vnt
	 gaQu52HmcFWAg==
Date: Thu, 1 Dec 2022 20:02:56 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	mark.rutland@arm.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 6/7] riscv: ftrace: Add
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Message-ID: <Y4kIcGY0rXTGb3po@spud>
References: <20221129033230.255947-1-guoren@kernel.org>
 <20221129033230.255947-7-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129033230.255947-7-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_120305_311493_66F2CB94 
X-CRM114-Status: GOOD (  18.96  )
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

On Mon, Nov 28, 2022 at 10:32:29PM -0500, guoren@kernel.org wrote:
> From: Song Shuai <suagrfillet@gmail.com>
> 
> This patch adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.
> 
> select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide the
> register_ftrace_direct[_multi] interfaces allowing users to register
> the customed trampoline (direct_caller) as the mcount for one or
> more target functions. And modify_ftrace_direct[_multi] are also
> provided for modifying direct_caller.
> 
> To make the direct_caller and the other ftrace hooks (eg. function/fgraph
> tracer, k[ret]probes) co-exist, a temporary register is nominated to
> store the address of direct_caller in ftrace_regs_caller. After the
> setting of the address direct_caller by direct_ops->func and the
> RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
> by the `jr` inst.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/include/asm/ftrace.h | 6 ++++++
>  arch/riscv/kernel/mcount-dyn.S  | 4 ++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d0e5838b11b..2828537abfcd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -278,6 +278,7 @@ config ARCH_RV64I
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> +	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION

Please sort new entries here in alphabetical order, so move the new
entry up by one line :)

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
