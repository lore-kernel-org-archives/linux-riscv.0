Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5CC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 16:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNEjhvuXp+3WNWjHyusGOuUgoKSCTSYRYioLLhf20oI=; b=dlvg9n1atsv7wl
	Cme81qBhX301X3e15yQnZDshbKLqkjewmBxayo+wwsEZ1bED0WBX3ok+oeOwcR+OqMab7VMLttFUI
	sIpXLZyTUfhlqiQklh2/y2IZnCskAcI/Wy2t+XgunDVy6yT/hOTsMnrPWHJMTql813s9wIQvKU58o
	rICrQ/DLWRN07hsuMYWoUg0HfkmDnUFZlO4ewFJzYtDR5HZjafpf/bWf3tMgyqxPLYjhrJcCZxxmo
	YMO7wW3wT+em4AYFjGi0DsNNka+RegMb+5PaBEpo4xfTfbaFKM3xm/2ePvSdorXi11+Lmhs5tYIuv
	Y8ihoaKY181Zd7Vm36Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofkPa-00AAJD-0L; Tue, 04 Oct 2022 16:04:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofkPX-00AAIg-As
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 16:04:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B2E9614A7
	for <linux-riscv@lists.infradead.org>; Tue,  4 Oct 2022 16:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC4BC433B5
	for <linux-riscv@lists.infradead.org>; Tue,  4 Oct 2022 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664899484;
	bh=3pV6AIwU55/8n3EL0wktKXf5jqjVPI7+4Jglg8t7kVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NYL8BoWTsLeFNqcW88r4BE98fbSsT08k1L9/dJa+VfXmOUT762qPp9G3ZYmrWHb0F
	 Udyq9hQCb3UIGeoZF/PiuZDHLuah+ZycId0BAnGA//14P8NwqTuM31eALXHZiS45BS
	 lRwiS4+uJk4Y3HIRG0d7nVC7PkSlefGg6uZNWq//ljlqd4OwnH5t7FUvccFDBBsTk2
	 dT3rxzgANe7ejdz+bb/kIisu5iD9PnsaLZJFrHqqXDM0r35J1bV89iF60PGztTv3Ad
	 swge3IztPoNH5iFkwIcyGhHS/IGE0bmRBeACerwFWsf+t4tpqb5mB70ZQVSursDcvt
	 JNsGw2PsWEavg==
Received: by mail-oi1-f181.google.com with SMTP id o64so14834861oib.12
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 09:04:44 -0700 (PDT)
X-Gm-Message-State: ACrzQf0O4ZfAn1WbuYJWfKxAZNMoRnOnHeJujYZnzA+mOLN2lCzP/xGB
	tQXi7veLYtlb8PyKqqu14P4XRVUOYLpY51HGD+M=
X-Google-Smtp-Source: AMsMyM5Fh+SkCXkLs5GbiHKA2F9vSc94HUg9MCJ+RJZytX6MtXIRXSX9Hn+mcjCaX/DvTUIubPfj0S2ZQMoA7HfgZHs=
X-Received: by 2002:aca:6155:0:b0:353:e740:ce01 with SMTP id
 v82-20020aca6155000000b00353e740ce01mr212443oib.19.1664899484112; Tue, 04 Oct
 2022 09:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221003102921.3973-1-jszhang@kernel.org> <20221003102921.3973-2-jszhang@kernel.org>
In-Reply-To: <20221003102921.3973-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 5 Oct 2022 00:04:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSdVyAaM12T+7kXAdRPGS4VyuO08X1c7paE-n4Fr8OtRA@mail.gmail.com>
Message-ID: <CAJF2gTSdVyAaM12T+7kXAdRPGS4VyuO08X1c7paE-n4Fr8OtRA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] riscv: process: fix kernel info leakage
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_090447_430626_BA49D4BE 
X-CRM114-Status: GOOD (  17.33  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Oct 3, 2022 at 6:38 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> thread_struct's s[12] may contain random kernel memory content, which
> may be finally leaked to userspace. This is a security hole. Fix it
> by clearing the s[12] array in thread_struct when fork.
>
> As for kthread case, it's better to clear the s[12] array as well.
>
> Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/process.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..52002d54b163 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -164,6 +164,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>         unsigned long tls = args->tls;
>         struct pt_regs *childregs = task_pt_regs(p);
>
> +       memset(&p->thread.s, 0, sizeof(p->thread.s));
> +
>         /* p->thread holds context to be restored by __switch_to() */
>         if (unlikely(args->fn)) {
>                 /* Kernel thread */
> --
> 2.37.2
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
