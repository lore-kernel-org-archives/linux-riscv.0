Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FF5C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 16:23:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998AD22AAE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 16:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 998AD22AAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tfn44ZzSp7EMn0KQ9RD3Sczeai/IFBQwo1QvvzipNBo=; b=fs8PQKNtZEyGhA+caK86Zb1sZ
	e7eYZhg+4HCp3F9kqmYOxrfo0KXWuDhqmGz3UbZVANejFZed/D9RxyPILuNfLywF5xFSid9dV0Z9a
	obg9nL2T2Ci8Vod93UvYonnRvzuTImKzVcCnzZhR9qakbBTXKgwulVzm0+2Mnbjs70cRoc1WOyJkT
	PpZGGx0yHk0ACBxpWHf1hUoT0hOXEZE1Wx01j+ix2GL3Jrqwyj+B3TkrFuCFE2inG0+4rjn/qOYZQ
	C9+JE0woUxVOf8KbLmYYqyJwSkrj5vLSgi6wsMjeu3u/ueN4RL7L3eJ2vs6X6vwLWir73es+38k2x
	AWZ4LUHkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krkRb-00025K-3w; Tue, 22 Dec 2020 16:23:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krkRY-00024o-Ug
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 16:23:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D16DB22AAE
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608654202;
 bh=hgTbRtl345QvToMR1KtPH4MwUiPkFT0bNVBFJJgaBIA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YRXC8OBzquLeroke8JC8i1zMfaK+Wjtna7OxurvZ01Yy5NQXXqlGdPOa0+v6ZZVOS
 1XC39f+AtVbu3b6mtea0kl7bxfRIBIwhnB5B8iM7myUa7Med2NyZbjFqHqlSwoPKmp
 PJ2muUjkW5Wuda9htUcDPgWJEfPsJNVoK1uLQ5cB4fb1GH74lamWcPSloRdGPXu2Xf
 A308GM68nQq4yeCCF2QvSQq2QHr7Ew3n0+4OxO/WuKL+gcAb+nkOyHat0uuHyTxarU
 Sa82ONlynm9VaqwTDOkBbdGOau5ZCkvOJRpzIp8uvczciABoMRn+JueVmFe54/kqmf
 IYm//4ccsirwQ==
Received: by mail-ot1-f42.google.com with SMTP id q25so12376312otn.10
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 08:23:22 -0800 (PST)
X-Gm-Message-State: AOAM532n6+ZXhtgZPfastE5ih2LlB18Z8VVmqKiX2zC/Yyc6GTXpiupV
 ryt145wJ/1hBFmvK1aNrOHtM8ljxzH/2L7Yg7GE=
X-Google-Smtp-Source: ABdhPJxXVDETZEU3t/kt9oB/93b1uTyucCAY9oF/6xdfST0h7OgMl+C9jTDzDThb8t23AJojHOU/aDUd6+Ev0H29CCU=
X-Received: by 2002:a05:6830:2413:: with SMTP id
 j19mr16932935ots.251.1608654202188; 
 Tue, 22 Dec 2020 08:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20201222160152.180981-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201222160152.180981-1-wangkefeng.wang@huawei.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 22 Dec 2020 17:23:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1awG0wWM2awvZy+uMB0jXnB+zggoGrCw4xnxGUECwQVQ@mail.gmail.com>
Message-ID: <CAK8P3a1awG0wWM2awvZy+uMB0jXnB+zggoGrCw4xnxGUECwQVQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_112325_067854_981DAEEA 
X-CRM114-Status: GOOD (  10.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 5:01 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Use raw_smp_processor_id instead of smp_processor_id() to fix warning,
>
> BUG: using smp_processor_id() in preemptible [00000000] code: init/1
> caller is debug_smp_processor_id+0x1c/0x26
> CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
> Call Trace:
>   walk_stackframe+0x0/0xaa
>   show_stack+0x32/0x3e
>   dump_stack+0x76/0x90
>   check_preemption_disabled+0xaa/0xac
>   debug_smp_processor_id+0x1c/0x26
>   get_cache_size+0x18/0x68
>   load_elf_binary+0x868/0xece
>   bprm_execve+0x224/0x498
>   kernel_execve+0xdc/0x142
>   run_init_process+0x90/0x9e
>   try_to_run_init_process+0x12/0x3c
>   kernel_init+0xb4/0xf8
>   ret_from_exception+0x0/0xc
>
> The issue is found when CONFIG_DEBUG_PREEMPT enabled.

The warning sounds legitimate.

>  static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>  {
> -       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
> +       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());

And this just hides the warning if someone calls this function
without disabling preemption first.

If you cannot use the normal get_cpu()/put_cpu() interfaces or
the cacheinfo of the boot CPU, maybe add a comment to explain
why raw_smp_processor_id() is necessary here.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
