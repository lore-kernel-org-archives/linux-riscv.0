Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC31C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Mar 2022 23:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9B71J8wBCGDjL63jDiz9Uld7dhWOTUtUS7ipuWzki8=; b=hE4ZpoJRO3m+IH
	gEz44jzMYUuExh9S1I6uRjJBcXNcGxE/jDKzzIFNGGWqA310FX/gCEdU4jzDRCfmUYD5je7efcklM
	pJK+S0Dib7IZvQeDjCKoADTr1nU1ykZC+NZDFodgXfzrstJAkbh16kRW9MpIBJT37vxgWRLOw56X5
	ud383avf4YBD2FUReD739YWS06Wqpgf64mMifrd4qOXfa9AsHq8uyYfelx+6i137/z57qD4GPLNjb
	ow2mU3S6SGgfHLC48gB60vJ90GEGiSb3T2yd1gI+wY1Gzwe/iVlPkij3sPVMvzZSqecMMaYdpPigx
	4FdFBkjhv4MkZVUyymew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTBbl-0021XU-5L; Sat, 12 Mar 2022 23:57:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTBbZ-0021Ux-Sn; Sat, 12 Mar 2022 23:57:03 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a8so26631251ejc.8;
 Sat, 12 Mar 2022 15:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHzA6f0O3UXfB/kOk5VVrrZ4oBWtPnkGe12GuOJG4uE=;
 b=PAxk8eNdgllxX72uRW+A9etKTYEJxmo2qZ2uYPJSlslts+7q5lOrDfAu0MBdqQb6qa
 +RG9Zq2msE8ROSwnk02pqIxjI3sm2VmMSo6csSgF4BwMK9LRJ8t9nVORGd8uOUFt+oF6
 tlPBa7gD3svCrLSPZWV9mBim/PNXNtn6tbCSBFcgJiTqeAEmjHVFvkpZkOYgEWtVdmKp
 prb9tzUvOuhhIDONOUd6BCOu1wMLmJ/tnbTTisFQD5k3qn3eLQafSgu/Mm+1FxbBWIvG
 JZRhM8mY/3+XZgh3SUNoRuwdrDIkvgdXAEYFFwTlAg7NbCeaOrJmznNXwf3dOxj4oIUr
 EJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHzA6f0O3UXfB/kOk5VVrrZ4oBWtPnkGe12GuOJG4uE=;
 b=d8wcM5kRPLUh6ueCcsKwRo14GhIDV14Omnudd3lL9lmPh7aoIiIR681fIi6OZ73JZB
 clVJUuK19imr+X+Sth/5RmIo331yAoIVgURVmFrFKpSbLln7cHMThvNd6u6XGn6RDR7n
 uhZOHR/VaW5V7eZImuQqjvY2QhvIfR1O89q/9lLI6FMwmMaFsMvi0DzWAgBCe+miXvvq
 K9VEy+wwPx0BzYSxC9z2Vbt8eo+0pG8RaKgi3QCrgRZqewZ2HPDVYqDSn7G9oLjrIoXz
 NF03ONmhZNpqLEOQwHRKxqSyXDEasos6QNPqo/Dn6cBCbCYwzgBWMAErSNcEX9lRoP09
 YD+w==
X-Gm-Message-State: AOAM532GxbBAKzHLkOiKQqHH+6nJqEPnkeOXsROgvuOeZVy56ExuSV0L
 y/sQ74yh0Bi2bVP/Zx76qfqy+5/AZGOdnkHDT0Q=
X-Google-Smtp-Source: ABdhPJyI1fKtgO6GHvLdgShgKeBI6WTSEQ6zn+q6jGp2RKqZNWboD1mwvsRIrq7FU9VvPGQ3AQ0CvBLQl02z2zU0MEM=
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr14229254ejc.516.1647129420213; Sat, 12
 Mar 2022 15:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20220312155603.1752193-1-guoren@kernel.org>
In-Reply-To: <20220312155603.1752193-1-guoren@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 12 Mar 2022 15:56:48 -0800
Message-ID: <CAMo8Bf+uiM=j+dc6GYNMPnXT9py=RACK3zZwiNv4LDbquTj+4w@mail.gmail.com>
Subject: Re: [RFC PATCH] arch: patch_text: Fixup last cpu should be master
To: Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_155701_967300_2497912E 
X-CRM114-Status: GOOD (  23.82  )
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

On Sat, Mar 12, 2022 at 7:56 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The origin idea is that when
> the master CPU patch_text, others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee continue CPUs are waiting. This patch changes the last
> CPU as the master to solve the potaintial risk.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Peter Zijlstra <peterz@infradead.org
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kernel/patching.c      | 4 ++--
>  arch/csky/kernel/probes/kprobes.c | 2 +-
>  arch/riscv/kernel/patch.c         | 2 +-
>  arch/xtensa/kernel/jump_label.c   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 771f543464e0..6cfea9650e65 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
>         int i, ret = 0;
>         struct aarch64_insn_patch *pp = arg;
>
> -       /* The first CPU becomes master */
> -       if (atomic_inc_return(&pp->cpu_count) == 1) {
> +       /* The last CPU becomes master */
> +       if (atomic_inc_return(&pp->cpu_count) == (num_online_cpus() - 1)) {

atomic_inc_return returns the incremented value, so the last CPU gets
num_online_cpus(), not (num_online_cpus() - 1).

>                 for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
>                         ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
>                                                              pp->new_insns[i]);
> diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
> index 42920f25e73c..19821a06a991 100644
> --- a/arch/csky/kernel/probes/kprobes.c
> +++ b/arch/csky/kernel/probes/kprobes.c
> @@ -30,7 +30,7 @@ static int __kprobes patch_text_cb(void *priv)
>         struct csky_insn_patch *param = priv;
>         unsigned int addr = (unsigned int)param->addr;
>
> -       if (atomic_inc_return(&param->cpu_count) == 1) {
> +       if (atomic_inc_return(&param->cpu_count) == (num_online_cpus() - 1)) {

Ditto.

>                 *(u16 *) addr = cpu_to_le16(param->opcode);
>                 dcache_wb_range(addr, addr + 2);
>                 atomic_inc(&param->cpu_count);
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..cca72a9388e3 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
>         struct patch_insn *patch = data;
>         int ret = 0;
>
> -       if (atomic_inc_return(&patch->cpu_count) == 1) {
> +       if (atomic_inc_return(&patch->cpu_count) == (num_online_cpus() - 1)) {

Ditto.

>                 ret =
>                     patch_text_nosync(patch->addr, &patch->insn,
>                                             GET_INSN_LENGTH(patch->insn));
> diff --git a/arch/xtensa/kernel/jump_label.c b/arch/xtensa/kernel/jump_label.c
> index 61cf6497a646..7e1d3f952eb3 100644
> --- a/arch/xtensa/kernel/jump_label.c
> +++ b/arch/xtensa/kernel/jump_label.c
> @@ -40,7 +40,7 @@ static int patch_text_stop_machine(void *data)
>  {
>         struct patch *patch = data;
>
> -       if (atomic_inc_return(&patch->cpu_count) == 1) {
> +       if (atomic_inc_return(&patch->cpu_count) == (num_online_cpus() - 1)) {

Ditto.

>                 local_patch_text(patch->addr, patch->data, patch->sz);
>                 atomic_inc(&patch->cpu_count);
>         } else {
> --
> 2.25.1
>


-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
