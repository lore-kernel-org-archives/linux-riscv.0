Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADB7C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjFN/aogd5SjfN6uu6dqQeQslb2sv9uOdfbsZg/GHyc=; b=PxGwFVT7J5vOrx
	LuNBdlkOJzgm6/30T4bJPILheDNCs2F1RqWbod1zHAU7e3PmLmNx4I/Wow79+b2Do74zzNZMzGB/u
	nwrmNuE9ej52Pye0eoxVZqeo6e0h3h/3Ter2yL1nWpNfqz9FkQ+VG10NxYrFtBdhp8+dSU26B0G+C
	d3x6dCvpyjZyra+uQlq4bhcsFFaqIs7wvHqkmkw9ZUj7HivpWqSBGtke45CROh+RlmpDZgQuexuob
	w58EsIJjSMGaC1f6HBjRUPITTeBPoKDOWUvEB0/Jbudx7edc25ENxPsKapxmmLu8hp4A8q4s2PWk2
	ro3FezXLISX0IowxwgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaoa0-007xt0-Hi; Wed, 21 Sep 2022 01:31:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaoZx-007xr0-QC
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 01:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8063AB82DF2
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 01:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D77C43149
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 01:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663723862;
	bh=AaMF3Lx8O+Q/o+XRTddc8AE/gxx/VpCCpwfiOhyRXIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T10zN9TgDWRzwNKs6FevPidFV06xeq7p0bUAQJni0ifUrB8vUhS6MTdBHNoclXnG+
	 G9rjUqpoERoi/DJ2MCx5mUiKX0t970zl4q9/RnZ0A4kSZc3N2UO4AMwPZbecHJ/YrV
	 mEVL/yZbQqPEwDc8Zz42Kh4N+m6Dgp3FTQAkMy/Cv2M3xxhBtdu67U/jk+AQWi7U++
	 vUPqHUu9wKyEbT07pm2Z8EBaf/9HNugHrOW/SXAOQ8BGVW2lWOjI0QkAMv+YPAxVCn
	 gXhHxV42mXasDAnvNXx5ZhoVi/CvQt+1xmB1kEJ/71wn+He9Mk0ZeoWgK/gCtAxFbP
	 XFRDHCLVGLCiw==
Received: by mail-oi1-f170.google.com with SMTP id o64so6117897oib.12
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 18:31:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Qo1hmAOTLpzTynDdYbJ8oqsIymM7xgrjxTFNvpqXi21Q3Dul1
	fnAaXXvI9sbWJsqC+zrmZUb9xlS8VdoewHa595M=
X-Google-Smtp-Source: AMsMyM6BZP9fw/VOE/mLMznHGL1+UHO0GnlrsPd4CDoYWfDhSlt430cnnqjnNSmcyHmtZU4RnBHUkNkUgyj1gA3IjQE=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr2937565oiw.112.1663723860952; Tue, 20
 Sep 2022 18:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220920151202.180057-1-chenzhongjin@huawei.com> <20220920151202.180057-5-chenzhongjin@huawei.com>
In-Reply-To: <20220920151202.180057-5-chenzhongjin@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 09:30:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ8QjUiRhQiM67SET=bCpppG2opcN3_ch7GEqdAkBnBUA@mail.gmail.com>
Message-ID: <CAJF2gTQ8QjUiRhQiM67SET=bCpppG2opcN3_ch7GEqdAkBnBUA@mail.gmail.com>
Subject: Re: [PATCH -next 4/7] riscv: syscall: Don't clobber s0 when syscall
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, namhyung@kernel.org, jolsa@kernel.org, 
	nsaenzju@redhat.com, frederic@kernel.org, changbin.du@intel.com, 
	vincent.chen@sifive.com, ardb@kernel.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, keescook@chromium.org, catalin.marinas@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_183110_150456_91D3CF2A 
X-CRM114-Status: GOOD (  18.90  )
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

On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>
> syscall uses s0 to load address of sys_call_table.
>
> Since now we uses s0 to save pt_regs for unwinding, clobber
> s0 can make unwinder treat s0 as pt_regs address. Use s1 for
> this job.
This patch does not make sense. Why couldn't we use s1 for pt_regs?

No need to modify the entry.S here.

>
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
>  arch/riscv/kernel/entry.S | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ecb15c7430b4..a3b14a649782 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -205,33 +205,33 @@ handle_syscall:
>  check_syscall_nr:
>         /* Check to make sure we don't jump to a bogus syscall number. */
>         li t0, __NR_syscalls
> -       la s0, sys_ni_syscall
> +       la s1, sys_ni_syscall
>         /*
>          * Syscall number held in a7.
>          * If syscall number is above allowed value, redirect to ni_syscall.
>          */
>         bgeu a7, t0, 3f
>  #ifdef CONFIG_COMPAT
> -       REG_L s0, PT_STATUS(sp)
> -       srli s0, s0, SR_UXL_SHIFT
> -       andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
> +       REG_L s1, PT_STATUS(sp)
> +       srli s1, s1, SR_UXL_SHIFT
> +       andi s1, s1, (SR_UXL >> SR_UXL_SHIFT)
>         li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
> -       sub t0, s0, t0
> +       sub t0, s1, t0
>         bnez t0, 1f
>
>         /* Call compat_syscall */
> -       la s0, compat_sys_call_table
> +       la s1, compat_sys_call_table
>         j 2f
>  1:
>  #endif
>         /* Call syscall */
> -       la s0, sys_call_table
> +       la s1, sys_call_table
>  2:
>         slli t0, a7, RISCV_LGPTR
> -       add s0, s0, t0
> -       REG_L s0, 0(s0)
> +       add s1, s1, t0
> +       REG_L s1, 0(s1)
>  3:
> -       jalr s0
> +       jalr s1
>
>  ret_from_syscall:
>         /* Set user a0 to kernel a0 */
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
