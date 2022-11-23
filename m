Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711D3C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uqmq9UTZLA8Y9QyORM4W5bqWvlpBMRb3ahpnThH1dj0=; b=UZjgb+Werx0mYb
	vm/N10r9KTap14iWQSv0yvvIJ1pn+YqWtOP2baSQ2NGn7j3MdA6BzJCaaoK/6UZ+zoG2Ix+CyPdyN
	ovDpbQRwYkdVaRXTKaONsI4zG7rhpaVwd93Tqp2ISRCHhs9cSpEmqgshs33Z7Vckp2f+j2NfgAUj5
	fuz4dkUJOJx7WdQILEtgZ07Hx0u6kU60LK6q1Q0BzVFTfQCEefIw5XkjpI/DKq853KSlhNrUOmMY2
	JFqqpw5j3xQ6Jdulu25AKbO74qFFTqM44zHOOpr1hGmSikdy75ofPRxSpkbvWBb5YE0vCGhvUODQC
	tUstB9n2dxa9DeMqKtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxri8-000S8f-UI; Wed, 23 Nov 2022 15:30:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxri6-000S7K-3b
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:30:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7DDE61D98;
	Wed, 23 Nov 2022 15:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D79C433C1;
	Wed, 23 Nov 2022 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669217449;
	bh=4dZb4bbu5nzbrpcp2lGes9HS8mCCcHsdRpxYEfzRlwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M5MrsbnmZ0e9R/vIHwWihmiXz3synJ+YTNPwOjj8S2ToOkfV+b7gt6q6Yf0W6OpBj
	 SghD9p6rqTgwFteO2uCV61k3JlOilkYlxCjmAkbq2CEefBDLhlJR1xWuSI5RKua6MI
	 A8W7I1QOk3oJgZ6SrzRqPGUofGcQ1HDsyH5wFR7KO6dMbkMPSCivo65T5JfkciUadJ
	 cZkQ6qvliDm8fnHu2lvkNP13ajAvacBFGqmC+6zUAhJ9Vvokrb+DxfXjTRnfiqqmba
	 kAOIDchEPRuwFqlv2ngxcJ1eFOKb9wSregiDidcZpBCW6yJOpx9NtkdDaoEokv2BEZ
	 zEofxybFcJQ+A==
Date: Wed, 23 Nov 2022 23:20:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] riscv: vdso: fix section overlapping under some
 conditions
Message-ID: <Y346Ww9Dt2f1Kipl@xhacker>
References: <20221102170254.1925-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102170254.1925-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_073050_203598_0D35A6BF 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Nov 03, 2022 at 01:02:54AM +0800, Jisheng Zhang wrote:
> lkp reported a build error, I tried the config and can reproduce
> build error as below:
> 
>   VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
> ld.lld: error: section .note file range overlaps with .text
> >>> .note range is [0x7C8, 0x803]
> >>> .text range is [0x800, 0x1993]
> 
> ld.lld: error: section .text file range overlaps with .dynamic
> >>> .text range is [0x800, 0x1993]
> >>> .dynamic range is [0x808, 0x937]
> 
> ld.lld: error: section .note virtual address range overlaps with .text
> >>> .note range is [0x7C8, 0x803]
> >>> .text range is [0x800, 0x1993]
> 
> Fix it by setting DISABLE_BRANCH_PROFILING which will disable branch
> tracing for vdso, thus avoid useless _ftrace_annotated_branch section
> and _ftrace_branch section. Although we can also fix it by removing
> the hardcoded .text begin address, but I think that's another story
> and should be put into another patch.
> 
> Link: https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/#r
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Gentle ping? This fix is still missing in mainline.

> ---
> 
> Since v1:
>  - fix the issue by setting DISABLE_BRANCH_PROFILING
> 
>  arch/riscv/kernel/vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index f2e065671e4d..d6092ff678fd 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -17,6 +17,7 @@ vdso-syms += flush_icache
>  obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
>  
>  ccflags-y := -fno-stack-protector
> +ccflags-y += -DDISABLE_BRANCH_PROFILING
>  
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
> -- 
> 2.37.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
