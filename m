Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C7EC4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:14:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF3823A00
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 08:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF3823A00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZJRJFjWBZEFDzM2f7sQqFCSRqpTKkeUkKHG+zAS16s=; b=tYMUrZj5D3Lc7fX9gKCIdY7eu
	ALdwW9x+6dsMp1xOQN73hVqEaN29alSCkihRGw7ma65xcW/lfs8rxOMwIE8EnycxFA+ljnSwhYTel
	UoG9WySh6dHc14t/6Y4kz0gDfnTEbtoXwhveH1O5eJ/B4aUtJRwIMBK7fjjljzMUN+cnY+Fy6vrdh
	9tosNDW4mZt2RZwWhoeh7lK/EOryRqhwSTGl1srwm6xALCx/UjwhQSzWudWndKCpwaew/mnj/SAFU
	1fAsgzrrFcTa3nxvEgRKzgsC2SPCsHXdfIzLIRkcQ/it7HMO4LCyyQPsiypUzmGM01NG9YSTBWmkR
	7oWD/6Wkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqAuN-00048a-J7; Fri, 18 Dec 2020 08:14:39 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqAuK-000485-UE
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 08:14:38 +0000
Received: by mail-io1-xd30.google.com with SMTP id t8so1266118iov.8
 for <linux-riscv@lists.infradead.org>; Fri, 18 Dec 2020 00:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfkdEScGK1yoE0FJI5jMbV9E2U0iUKzggdWo/eBQrS4=;
 b=NXfpdM3aLj8uryGU/ZaWIiHK6ofayjsJGgaWXQDEIUCq6gnkUB63sNc/wTrljtfuBR
 t0RgtQ2ndDGkRXkFby+gEh2RMM8R9cvR8Ce8RnrAMaE3gfYpeLFctdzMVD8V6BX26r1b
 EfZkAesWS3uWacAwJZjOOHolaLxc6Pc2bcTbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfkdEScGK1yoE0FJI5jMbV9E2U0iUKzggdWo/eBQrS4=;
 b=kQLx1vRDyM+o9qhamXyRhUd9pwuXoVJmPg9axWJCY5VITsxTVlLKpzECYcjatGDDcg
 baL6942LUNBACXgo1jBunSpwnGPBVXQ+BplnkTj3mTXz0tDJ0tNHHvyndnxCnf5yPNA6
 yO91v9DwqRwemataCKHLqWoOvEvVwLHjDzyJfkWq0EYaE2egOV/ewVYlw0zXCiwmxaqY
 XmeeDVq0sgqnOHbxJYu+Jhl6GoyjZSyv4Xfj8QoiIx9vSS67CsTRXqTeGIRSKhvlP7VH
 a11iXPLJgkkjYqY04JAILNT/d1R52+zYEeTkjQ8POfDtXWH9M7qORgprOC8bPxx9lSfC
 T92A==
X-Gm-Message-State: AOAM530QbcV/omG6KJCxFJDfgnKalp6Yy3smIUHNyE17YF6QEPjw1yIn
 THDcLb1hLBeK6hHszgkiCgi9rE6YHANa7EkTQUtp
X-Google-Smtp-Source: ABdhPJzxUEt/tpb9rddhXHijXG6bpojzC9WYivarhBLMogx3ENe9yuHb74QP8hTLCBW2xi+KQSlN3uzGE0M2LzGHhn4=
X-Received: by 2002:a02:b011:: with SMTP id p17mr2694207jah.114.1608279274236; 
 Fri, 18 Dec 2020 00:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20201116081238.44223-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201116081238.44223-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 18 Dec 2020 00:14:23 -0800
Message-ID: <CAOnJCUJz-L_S77rU+whk-86vkHkdrx4V9F-mYb72J0fT6yysmw@mail.gmail.com>
Subject: Re: [PATCH] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_031437_082910_B14BF423 
X-CRM114-Status: GOOD (  18.17  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 12:08 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
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
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index de59dd457b41..9b5a8a347434 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -26,7 +26,7 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
>
>  static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>  {
> -       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
> +       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
>         struct cacheinfo *this_leaf;
>         int index;
>
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Atish Patra <atish.patra@wdc.com>

As this issue is only reproducible with CONFIG_PREEMPT, the commit
text can be updated to specify that. I have tested this patch with
Qemu as well. FWIW,

Tested-by: Atish Patra <atish.patra@wdc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
