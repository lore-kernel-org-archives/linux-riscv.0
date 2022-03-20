Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6C0C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Mar 2022 23:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdYnF5+X43lnX3ZCyb3SVD4I0vzZAmg73GW5Sz7QkXE=; b=JtRuIbqE2xppKL
	jeswvSaWTX/MER58U3sIbka3W9rVqJ6oBJxVHUJtr1OxPSMZ5d5MIV8UX+WHfwYzHhha74MU15Exq
	BL52WKaLL6M0lHC2aqVApjl+Xu0YUF/hLxSl7Ow5CB3QYuST/lvHjqjRk5M0iR+2gnA1su8p4RFgW
	CzoBY+oO+o5UtSzm3WDNyevVyhOiurj6/kiT3SiXdl6koIjld4ZO/j9L0/8zUbU/rbeVQeapfrfS1
	i4qXerbSui0g95KDOmPbSflg4z7QD8KGdO+z9Cdgu3V06rRTZvaI0X2do+VJicAyugzapFUhGDlcG
	ZxzwafENWPTQg4I6gJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW5Ip-0068Q6-FM; Sun, 20 Mar 2022 23:49:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW5Id-0068Nn-Ec; Sun, 20 Mar 2022 23:49:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D85AB80EFE;
 Sun, 20 Mar 2022 23:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D059C340F6;
 Sun, 20 Mar 2022 23:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647820161;
 bh=LdVIHoHItcWladjunHHE0TqmokWx34dd4pkenmbLtic=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cGZp03PLkkg7WjyUJH075nQZRGuldahnVs/gF8U1zra6NQ1upmIkD0CeLx54VWJO5
 E5iniwFtkXnkPI6pbQd5kcW/3oBSVkKeHQjCdHm42WqPloHOHMk4+d9J94VyVyMc4L
 va8xny3AZNWvP4ankJO04Ba6mx/3K7dKqVJLkkpxLHVCfm+FzvTGMBCWJs0hiiGlhu
 985selWu5XMI3lruSNxroriY9octOOZWCP5ZlqeLJq6icpoCZ41wHvptN9tRlUvlF2
 43KiXulyMx28u0AniBrVYk81FnZg6gDbu239OlxtbVb7OH4FkGvJ8dTNBlLnBfepO3
 oAyZv9majtYmg==
Received: by mail-vs1-f42.google.com with SMTP id j8so190247vsp.2;
 Sun, 20 Mar 2022 16:49:21 -0700 (PDT)
X-Gm-Message-State: AOAM532kysLbUaKLRT9CWEgGa0Y4HQeV7JLBsgKoG2HbkzcHsjSuim1X
 +KW9lX7rvs6jg8NN11V/bIZ5MiuPFjedWozrAoM=
X-Google-Smtp-Source: ABdhPJwzZ7sQ8nqc3/evn0mCeSVPLU9IvQI1EMLbzj7obkq7PpVtp3nW3lxsuUT4URfmvdsv+ieEuyG9qH76lKdBsy0=
X-Received: by 2002:a05:6102:38c6:b0:31b:b386:e467 with SMTP id
 k6-20020a05610238c600b0031bb386e467mr6809705vst.8.1647820160139; Sun, 20 Mar
 2022 16:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220313012221.1755483-1-guoren@kernel.org>
 <mhng-b034f45a-521b-4c80-a314-4ddf1a1dc534@palmer-mbp2014>
In-Reply-To: <mhng-b034f45a-521b-4c80-a314-4ddf1a1dc534@palmer-mbp2014>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 21 Mar 2022 07:49:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR6Pd3nVKt9e=rdMynBV0-EOmy5ZbndduEJiQLLe6vdpA@mail.gmail.com>
Message-ID: <CAJF2gTR6Pd3nVKt9e=rdMynBV0-EOmy5ZbndduEJiQLLe6vdpA@mail.gmail.com>
Subject: Re: [PATCH V2] arch: patch_text: Fixup last cpu should be master
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_164927_820136_D1B962AB 
X-CRM114-Status: GOOD (  32.37  )
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

On Mon, Mar 21, 2022 at 2:05 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sat, 12 Mar 2022 17:22:21 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These patch_text implementations are using stop_machine_cpuslocked
> > infrastructure with atomic cpu_count. The original idea: When the
> > master CPU patch_text, the others should wait for it. But current
> > implementation is using the first CPU as master, which couldn't
> > guarantee the remaining CPUs are waiting. This patch changes the
> > last CPU as the master to solve the potential risk.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Peter Zijlstra <peterz@infradead.org
> > Cc: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: Chris Zankel <chris@zankel.net>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> >
> > ---
> > Changes in V2:
> >  - Fixup last cpu should be num_online_cpus() by Max Filippov
> >  - Fixup typos found by Max Filippov
> > ---
> >  arch/arm64/kernel/patching.c      | 4 ++--
> >  arch/csky/kernel/probes/kprobes.c | 2 +-
> >  arch/riscv/kernel/patch.c         | 2 +-
> >  arch/xtensa/kernel/jump_label.c   | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> > index 771f543464e0..33e0fabc0b79 100644
> > --- a/arch/arm64/kernel/patching.c
> > +++ b/arch/arm64/kernel/patching.c
> > @@ -117,8 +117,8 @@ static int __kprobes aarch64_insn_patch_text_cb(void *arg)
> >       int i, ret = 0;
> >       struct aarch64_insn_patch *pp = arg;
> >
> > -     /* The first CPU becomes master */
> > -     if (atomic_inc_return(&pp->cpu_count) == 1) {
> > +     /* The last CPU becomes master */
> > +     if (atomic_inc_return(&pp->cpu_count) == num_online_cpus()) {
> >               for (i = 0; ret == 0 && i < pp->insn_cnt; i++)
> >                       ret = aarch64_insn_patch_text_nosync(pp->text_addrs[i],
> >                                                            pp->new_insns[i]);
> > diff --git a/arch/csky/kernel/probes/kprobes.c b/arch/csky/kernel/probes/kprobes.c
> > index 42920f25e73c..34ba684d5962 100644
> > --- a/arch/csky/kernel/probes/kprobes.c
> > +++ b/arch/csky/kernel/probes/kprobes.c
> > @@ -30,7 +30,7 @@ static int __kprobes patch_text_cb(void *priv)
> >       struct csky_insn_patch *param = priv;
> >       unsigned int addr = (unsigned int)param->addr;
> >
> > -     if (atomic_inc_return(&param->cpu_count) == 1) {
> > +     if (atomic_inc_return(&param->cpu_count) == num_online_cpus()) {
> >               *(u16 *) addr = cpu_to_le16(param->opcode);
> >               dcache_wb_range(addr, addr + 2);
> >               atomic_inc(&param->cpu_count);
> > diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> > index 0b552873a577..765004b60513 100644
> > --- a/arch/riscv/kernel/patch.c
> > +++ b/arch/riscv/kernel/patch.c
> > @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
> >       struct patch_insn *patch = data;
> >       int ret = 0;
> >
> > -     if (atomic_inc_return(&patch->cpu_count) == 1) {
> > +     if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> >               ret =
> >                   patch_text_nosync(patch->addr, &patch->insn,
> >                                           GET_INSN_LENGTH(patch->insn));
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
>
> It's better if these sorts of things get split up: there's really no
> dependency between these diffs and having them together just makes for a
> merge/test headache for everyone.
I'm Okay with split patches, @Arnd Bergmann what's your opinion?
We've got all arch vendors' agreements (arm64, csky, riscv, xtensa).

>
> I'm OK taking this through the RISC-V tree if other folks ack it, but
> for now I'm going to assume it's going to go in via somewhere else.
Arnd has given some comments on unnecessary #error, maybe I need to update V2.

>
> > diff --git a/arch/xtensa/kernel/jump_label.c b/arch/xtensa/kernel/jump_label.c
> > index 61cf6497a646..b67efcd7e32c 100644
> > --- a/arch/xtensa/kernel/jump_label.c
> > +++ b/arch/xtensa/kernel/jump_label.c
> > @@ -40,7 +40,7 @@ static int patch_text_stop_machine(void *data)
> >  {
> >       struct patch *patch = data;
> >
> > -     if (atomic_inc_return(&patch->cpu_count) == 1) {
> > +     if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> >               local_patch_text(patch->addr, patch->data, patch->sz);
> >               atomic_inc(&patch->cpu_count);
> >       } else {



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
