Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF982FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfc7W/agJIYhzKrgCTt60GGMnY25oNjqEV3A2IpozlM=; b=CpNq6IPe0iht03
	qlt02EtMggtedPJWhF2W3scaZwtv0w+njpIpa1j7a2EWjZO23W4B+DIJLYhpoYmAyt3e2eod69Isl
	97jzTnI88A7eaQzRYNl8hFq1O2wKw4WuNlFTkeoBhiHOaw+RyhhB0ZwcauqP43lZ0MvQ7Yg21k+Ed
	O3nLZhD14wu7I2wXcak3BQFVp6Z5XIVEXPlSNLbaYkZd3cmwLbuDgARHLnWLb6sHxzzhYgb0vY+5w
	aWpceM49BbIN32F1KR38D6N4l60bhNZnilba2L0XatH+sGBE6o9pGpPm9d7tJxf4msSqDSRFec+vB
	CUttKwkkCIgKJTFdTMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaLg-00ECMG-PH; Mon, 31 Oct 2022 19:21:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaLd-00ECLF-Fa
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:21:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB42A61227;
	Mon, 31 Oct 2022 19:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C57C433C1;
	Mon, 31 Oct 2022 19:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667244084;
	bh=o0Q9MbdmmncKUEHxnHZRV+zqBROs61ocnfVwIcKSVsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBmrcq+XXz4JAY9e02wNJrk6F4jYOd/jAfp8S8+JsCpTSD8oSyZ4sZB4yHG776g9w
	 Ft73y3/tY1aeDTL9F3Ebfyaog0NIJ5WtEzdcNxz1kumyE4AJM9jDwNNyaCXHGWnZ3f
	 /Tzpdtk28wx+9rUYA7BgEYX4IIaYqcqdd8oA/S3An3mpinQMZTOTjXjZUhoIX4Yih3
	 /4Z1jp2adXePblNQPvfPUJmbNa+VgvSFAdjDU2DTW6O5qHJBEf3bqp5+pR8ifNDD1D
	 0s5jH9Wntw/GxnJ4XwjWu4LGk7fFcbJ1VrDEySYvlN1pR36oCI2QWyK0GKaoErv1Cn
	 AshK4OjoStjXw==
Date: Mon, 31 Oct 2022 19:21:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vdso: fix build with llvm
Message-ID: <Y2AgMLzH/RF1gQkB@spud>
References: <20221031182943.2453-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031182943.2453-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_122125_580230_9315F12A 
X-CRM114-Status: GOOD (  21.21  )
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

On Tue, Nov 01, 2022 at 02:29:43AM +0800, Jisheng Zhang wrote:
> Even after commit 89fd4a1df829 ("riscv: jump_label: mark arguments as
> const to satisfy asm constraints"), building with CC_OPTIMIZE_FOR_SIZE
> + LLVM=1 can reproduce below build error:
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> In file included from <built-in>:4:
> In file included from lib/vdso/gettimeofday.c:5:
> In file included from include/vdso/datapage.h:17:
> In file included from
> include/vdso/processor.h:10:
> In file included from
> arch/riscv/include/asm/vdso/processor.h:7:
> In file included from
> include/linux/jump_label.h:112:
> arch/riscv/include/asm/jump_label.h:42:3: error:
> invalid operand fo
> r inline asm constraint 'i'
>                 "       .option push                            \n\t"
>                 ^
> 1 error generated.

Tested-by: Conor Dooley <conor.dooley@microchip.com>

> 
> I think the problem is when "-Os" is passed as CFLAGS, it's removed by
> "CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os" which is
> introduced in commit e05d57dcb8c7 ("riscv: Fixup __vdso_gettimeofday
> broke dynamic ftrace"), thus no optimization at all for vgettimeofday.c
> arm64 does remove "-Os" as well, but it forces "-O2" after removing
> "-Os".
> 
> I compared the generated vgettimeofday.o with "-O2" and "-Os",
> I think no big performance difference. So let's tell the kbuild not
> to remove "-Os" rather than follow arm64 style.
> 
> vdso related performance can be improved a lot when building kernel with
> CC_OPTIMIZE_FOR_SIZE after this commit, ("-Os" VS no optimization)
> 
> Fixes: e05d57dcb8c7 ("riscv: Fixup __vdso_gettimeofday broke dynamic ftrace")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f2e065671e4d..84ac0fe612e7 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -30,7 +30,7 @@ obj-y += vdso.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>  
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> +CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
>  
>  # Disable profiling and instrumentation for VDSO code
>  GCOV_PROFILE := n
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
