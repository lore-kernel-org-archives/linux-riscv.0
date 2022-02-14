Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 23:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UH3oz1cbC76EJx717WPg+em/lvUmrMtXzuqzUR4WZCk=; b=Akgo5kuhSQy7Q7mO+w+Bl4MkNQ
	6zX4FWOh6MxEt4AvlgQMP8nkINqfemjLDSuOjaQBAfyOZnV5RUc62xCpR4r2egj+gTDzkZiFnvVWO
	a+E8NcdeXTa8EeEv/JEc/mVdTPZhJ97ovBlqMdUOZorJGJeNRAir0q8C9xvhC9zt2cg8vAyAWwwsJ
	fhCSjuyeMsEm8ZD4ZdpR3hfJ3Qt8nhtNeLqmvZOuECyyDv5BJhhVee7aTmqgRzdVtiDbc0s+FBWAh
	3WtHEbbdrPqKO8H6gZoXvMvNBekGLZxtUQbjK0f7NwAieuxHLsof0eEbXExLp8OdUAbjskx3XmA0C
	3SPT6R1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJl9F-00HJTV-2n; Mon, 14 Feb 2022 23:52:49 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJl9C-00HJT8-0x
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 23:52:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id p10so11293671pfo.12
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 15:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=q/68wf5KGxajLpQXjSmh69B044maP9rOcGCawmFkP2M=;
 b=B7/gLLy6iIQ0Tnw0byEE+VGNXe/uVAdHXdQJICGKkCA/59oHc/3VkSEF1GaEOnN+th
 /6wjSZnPNDbMcdI2Y/L2Sqv0xttgkywZmIkMEiwChHJ0iPD9qlrLBGZfhh+exvwz4DAl
 XTJn+h5VAeyMUrI7GI38VbiqI3uMDAf4t3ohZCMJCEpoOYZhuTxiR1RWhdhV4s8HCZ4B
 S6PIOhRjMlkmj/DEWLUm4nNr007OE0vYStZequcWI1H64U/RbJ0hWD1/+7popGBJ6szs
 DOWt6CVIJ75Ef2I29BsZuJyF8H0kN9j3WMFBGhZ8NlH1yEKh/OS3GF1WymvbiUjD1ADM
 Dybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=q/68wf5KGxajLpQXjSmh69B044maP9rOcGCawmFkP2M=;
 b=6+EIgPTIn5QsSPBYZhvQoA6gH4Dnv/HHDDKmSuiP3lf3oauc4SdRNv/rZBSuiNcSpR
 poILcaK4q0jZ8DW1v3FUgTo+dze+hNP8Xwk9h/cqDPdcJZ8EtZzsQDZ4V5kzYMomvVJS
 +fLItOMOq76xyKwaZZZOUjoDs7pGOvJ8TXy1xUzdAUNH3PWyqy6FZLPYLElHeGMLGx4u
 xYo2NefUP0Ww+Iap6Hu7Ad59pxf5V5gN+Kwst8YYI2RH2w6ILwYDw5aA8C3SMHvTPbAs
 XvPDSlcYE8nUPMg3RBraCBnW/JOX6quTCgEmjHxDmzFHKJFtKy7U4X9c6apo8/tC8M1A
 40CA==
X-Gm-Message-State: AOAM530kBKgyTkf3d+bdtNj1wWTASTDCXJ9S2UDO7epKQjlxlhO979Ds
 3i5ik2pytIrYiW1byHQFD+jeZA==
X-Google-Smtp-Source: ABdhPJx5mA9kZ2Gy8fry94nzIgW+4WlYvtgr57alEdRWSRRjLC4AV5ngjOPE/jrhYHczARd0X/c/KA==
X-Received: by 2002:a63:b17:: with SMTP id 23mr1249158pgl.103.1644882765243;
 Mon, 14 Feb 2022 15:52:45 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id q26sm540251pgt.67.2022.02.14.15.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 15:52:44 -0800 (PST)
Date: Mon, 14 Feb 2022 15:52:44 -0800 (PST)
X-Google-Original-Date: Mon, 14 Feb 2022 15:51:43 PST (-0800)
Subject: Re: [PATCH 0/3] unified way to use static key and optimize
 pgtable_l4_enabled
In-Reply-To: <20220125165036.987-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-41f2520d-7583-41b3-ae7a-95e74117676a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_155246_109540_D020C065 
X-CRM114-Status: GOOD (  21.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Jan 2022 08:50:33 PST (-0800), jszhang@kernel.org wrote:
> Currently, riscv has several features why may not be supported on all
> riscv platforms, for example, FPU, SV48 and so on. To support unified
> kernel Image style, we need to check whether the feature is suportted
> or not. If the check sits at hot code path, then performance will be
> impacted a lot. static key can be used to solve the issue. In the
> past FPU support has been converted to use static key mechanism. I
> believe we will have similar cases in the future. For example, the
> SV48 support can take advantage of static key[1].
>
> patch1 introduces an unified mechanism to use static key for riscv cpu
> features.
> patch2 converts has_cpu() to use the mechanism.
> patch3 uses the mechanism to optimize pgtable_l4_enabled.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
>
> Jisheng Zhang (3):
>   riscv: introduce unified static key mechanism for CPU features
>   riscv: replace has_fpu() with system_supports_fpu()
>   riscv: convert pgtable_l4_enabled to static key

I see some build failures from LKP, but I don't see a v2.  LMK if I 
missed it.

>
>  arch/riscv/Makefile                 |   3 +
>  arch/riscv/include/asm/cpufeature.h | 105 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/pgalloc.h    |   8 +--
>  arch/riscv/include/asm/pgtable-64.h |  21 +++---
>  arch/riscv/include/asm/pgtable.h    |   3 +-
>  arch/riscv/include/asm/switch_to.h  |   9 +--
>  arch/riscv/kernel/cpu.c             |   2 +-
>  arch/riscv/kernel/cpufeature.c      |  29 ++++++--
>  arch/riscv/kernel/process.c         |   2 +-
>  arch/riscv/kernel/signal.c          |   4 +-
>  arch/riscv/mm/init.c                |  23 +++---
>  arch/riscv/mm/kasan_init.c          |   6 +-
>  arch/riscv/tools/Makefile           |  22 ++++++
>  arch/riscv/tools/cpucaps            |   6 ++
>  arch/riscv/tools/gen-cpucaps.awk    |  40 +++++++++++
>  15 files changed, 234 insertions(+), 49 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpufeature.h
>  create mode 100644 arch/riscv/tools/Makefile
>  create mode 100644 arch/riscv/tools/cpucaps
>  create mode 100755 arch/riscv/tools/gen-cpucaps.awk

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
