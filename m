Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239D2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/N8RSN2YMKU3zLAABEfPypMpwo3v9Q9EKoxT2/DnB4=; b=3C17DECzQ5/+CY
	l2VukP3us3Q21UdGUdjxJ38inyHsBsD7RN3mysvGw62y03wCSdU7EC4Bgt1AWDuWR2V5zRiZvDc92
	M9C1KbUlpjRnSKd9Xi0jFh5Ebtw7hrcVmjoUsZcdAFXhvmiXGMNOVb4EJ60wasNCS/qC8De/DhknA
	kptKXwB5n0z1U256xkxR60Ffk44QexhcSxwvBe8+4/B61+laqJ6hYZ7H6RZ7r/C/fSCsLS9JEAL6t
	a0eLed/+5UP+MgheCL8YSle0QZXJhD/37REak3lFYucdf4E4GGT1/Sm+EOJwEADXEszTbxtPEktTa
	eGNlcJtE8T3L0j2o8qZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUsbG-00Ggw5-Q5; Thu, 17 Mar 2022 16:03:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUsau-00Ggnb-2k; Thu, 17 Mar 2022 16:03:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEFD760C95;
 Thu, 17 Mar 2022 16:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60226C340E9;
 Thu, 17 Mar 2022 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647532998;
 bh=NGiQFPVnfDqZ1ROyWh9ETbUs7TxBnFHdgwPh/4n9jkA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rh3zXpgLbT6SxqOATKmV9Yg1s5i3qEYz1c57woGTPEB9HVQOvoNJg27Eh+Vpr5bnB
 9l5P2ZTbDZaUyjAkAuW69dtO6pyULM2UcfPOa/ltFPnPz77RHcuBH0PVA5FQJ12/RC
 Vk505u32UA7dKFDT0dy2VxMqKGqWACf/31xxW4OqezMnTHpxYCMn1KQiwkY/kCWZjl
 tez2KzHX0g5xYLn7LOcGj9kCZD3N5v3/Q8DWhareckpREHZplQyMPK0Lacqa+cRkYa
 +F+S5yDxaEib1+Rm48oukLIWleLtwPzHRjq6T+UmUWe4bisqNoOKNa4rHPwNTuLNGA
 61hyjnnLNxwhA==
Received: by mail-ua1-f43.google.com with SMTP id v20so1931256uat.9;
 Thu, 17 Mar 2022 09:03:18 -0700 (PDT)
X-Gm-Message-State: AOAM530vWnOoCKj6iwPICJFqlG774vMXTH8w1kCmVYeltZPCfj2MDO+n
 yn7VFNjoKA6bbEg7zBuhqTckGRpK+Ws1vvM0Tsk=
X-Google-Smtp-Source: ABdhPJx56mP1yBItNhpbrH5BO1aKkva0leBOvED1GBx+mkRa6thFGwJA/RpUKcskkXEWf9nO8JBbTl9WVNeKe2iBtLA=
X-Received: by 2002:ab0:3785:0:b0:350:c22e:9908 with SMTP id
 d5-20020ab03785000000b00350c22e9908mr1907268uav.114.1647532997252; Thu, 17
 Mar 2022 09:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220313012221.1755483-1-guoren@kernel.org>
 <YjH2e4bfTl+0/+yc@arm.com>
In-Reply-To: <YjH2e4bfTl+0/+yc@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Mar 2022 00:03:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQmix3hc5-EntHZ_cTpp6XeCmDfOD4vHCd8Y+svUjPgGA@mail.gmail.com>
Message-ID: <CAJF2gTQmix3hc5-EntHZ_cTpp6XeCmDfOD4vHCd8Y+svUjPgGA@mail.gmail.com>
Subject: Re: [PATCH V2] arch: patch_text: Fixup last cpu should be master
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_090320_249152_C9EDDDF8 
X-CRM114-Status: GOOD (  27.45  )
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

On Wed, Mar 16, 2022 at 10:38 PM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> On Sun, Mar 13, 2022 at 09:22:21AM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These patch_text implementations are using stop_machine_cpuslocked
> > infrastructure with atomic cpu_count. The original idea: When the
> > master CPU patch_text, the others should wait for it.
>
> I couldn't find the original intent in the commit logs (at least not in
> the arm64 logs). Maybe the intention was for the CPUs to wait for the
> text patching to complete rather than the master CPU to wait for the
> others to enter the cpu_relax() loop before patching.
>
> I think your patch makes sense anyway, the master CPU would wait for all
> the others to enter the cpu_relax() loop before patching and releasing
> them with another increment. You probably wouldn't see any issues in
> practice unless you insert probes in the multi_stop_cpu() function (or
> we could mark this function as __kprobes and get rid of the extra loops
> entirely).
That could depend on micro-arch, trigger other harts' IPI is not
guaranteed by hw.

>
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
>
> For arm64:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Thx

>
> --
> Catalin



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
