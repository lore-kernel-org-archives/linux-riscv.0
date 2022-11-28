Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98E1C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 02:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8FKjXHEXWBOwOY7wJM+fkhhcYWT2u+HjLW5GLaLue4=; b=wcj2IxtqoYI9Kr
	De5+M1XR9f70dx5bAx8wmkcFZCBUnGEsFK3cluQAaAaOj/HMkMnTQuKi3IEGY07CUuS5XKxa/Me/J
	y0WVxW3GJND3hGQmaVOrc8XVDeALHLcsGM81jUgcu28SuH/tIIca9DeqVkdR7H0yB1dZzGU6h7U8X
	Oxh8m/qwJPXh27yk2RKwf6e6EwhQ+/edyTBVZ6wF20EQNgp4pdweSn+Z401zjLS33K/1OdXHATXKc
	JxU7IArMzKwMS7ZN3NHqVP93uNQWU8n2Om1iTP9QmYvTEILQ3Y7J1EExSe6w0iQ8OW+Zi1tyy9IwM
	6+F0/vTaIpGvqgUoYgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU6q-00F8Qd-UJ; Mon, 28 Nov 2022 02:43:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU6n-00F8N2-Iy
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 02:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F2A1B80B06
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 02:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F111C4314B
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 02:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669603378;
	bh=UPQSDgWGxcv1ItSA2KA+M47orcLuzpGzEWEvHhqijXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LBbGT8KkwrtI9diEjRfrB7cSuGGG6noyHoQpaxG575hbrokbsiY+mq0mJkwgrZtVc
	 8wOQp3mivKlnC2vqRfXlpMwp7HWuKkH8vDxW3bmde1vPL6RD4bF7PCwrmaz1Wldj/h
	 Vv1/aogUK13Bl4oSJgMpMzpPqG57rh9+KQ5SQRTPyNgxq/vuX3WvwQmtfsR81uGoOc
	 aRt2qiKZEJGAo10AeR9RCfxabk4ShMm+ynXRGU9yNVUQVEpaklPk6JLXb/+pN4Ifsb
	 MAIyHqIDKLlsCp0G5Ygy20aUwAGj1nfNzOpjCtigT4LO6ZiKhWRrFqacxIHe7unleY
	 aMMOP2MYaabKQ==
Received: by mail-ed1-f50.google.com with SMTP id b8so13633135edf.11
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 18:42:58 -0800 (PST)
X-Gm-Message-State: ANoB5pnx4qg47cNvjX/aqZq83EWMdQDb3ebu5CDnJS4b6E2CZOoovzHA
	orFXT6Daj2wWi9Jah4dciBqe8nQv2L9fHmsVVbE=
X-Google-Smtp-Source: AA0mqf4XRkIJT5YmIPdGI8ff1p/NWd/dQCzy+8Tqpr33A+GMOWvKu4d12lLM1m7CgiIoADHsv3MxUz4Rw9u8vMLRXPk=
X-Received: by 2002:a05:6402:19a:b0:460:7413:5d46 with SMTP id
 r26-20020a056402019a00b0046074135d46mr45697321edv.47.1669603376771; Sun, 27
 Nov 2022 18:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20221103075047.1634923-1-guoren@kernel.org> <20221103075047.1634923-7-guoren@kernel.org>
 <a28d32c965f363ce099bd0a65e1c82b75a98128a.camel@decadent.org.uk>
In-Reply-To: <a28d32c965f363ce099bd0a65e1c82b75a98128a.camel@decadent.org.uk>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Nov 2022 10:42:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQwkPgafMxJ8YxH-kCsyT82bTr_a2hBJ1Pido7SvN+o2A@mail.gmail.com>
Message-ID: <CAJF2gTQwkPgafMxJ8YxH-kCsyT82bTr_a2hBJ1Pido7SvN+o2A@mail.gmail.com>
Subject: Re: [PATCH -next V8 06/14] riscv: convert to generic entry
To: Ben Hutchings <ben@decadent.org.uk>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_184301_946391_122C45E1 
X-CRM114-Status: GOOD (  14.64  )
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

On Mon, Nov 28, 2022 at 12:26 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Thu, 2022-11-03 at 03:50 -0400, guoren@kernel.org wrote:
> [...]
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> [...]
> > +asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
> > +{
> > +     syscall_t syscall;
> > +     ulong nr = regs->a7;
> > +
> > +     regs->epc += 4;
> > +     regs->orig_a0 = regs->a0;
> > +     regs->a0 = -ENOSYS;
> > +
> > +     nr = syscall_enter_from_user_mode(regs, nr);
> > +#ifdef CONFIG_COMPAT
> > +     if ((regs->status & SR_UXL) == SR_UXL_32)
> > +             syscall = compat_sys_call_table[nr];
> > +     else
> > +#endif
> > +             syscall = sys_call_table[nr];
> > +
> > +     if (nr < NR_syscalls)
>
> This bounds check needs to be done before indexing the system call
> table, not after.
Yes, you are right. That would cause a wrong pointer bug. Here is the
new version:

asmlinkage void do_sys_ecall_u(struct pt_regs *regs)
{
        syscall_t syscall;
        ulong nr = regs->a7;

        regs->epc += 4;
        regs->orig_a0 = regs->a0;
        regs->a0 = -ENOSYS;

        nr = syscall_enter_from_user_mode(regs, nr);

        if (nr < NR_syscalls) {
#ifdef CONFIG_COMPAT
                if ((regs->status & SR_UXL) == SR_UXL_32)
                        syscall = compat_sys_call_table[nr];
                else
#endif
                        syscall = sys_call_table[nr];

                regs->a0 = syscall(regs->orig_a0, regs->a1, regs->a2,
                                   regs->a3, regs->a4, regs->a5, regs->a6);
        }
        syscall_exit_to_user_mode(regs);
}

>
> Ben.
>
> > +             regs->a0 = syscall(regs->orig_a0, regs->a1, regs->a2,
> > +                                regs->a3, regs->a4, regs->a5, regs->a6);
> > +     syscall_exit_to_user_mode(regs);
> > +}
> [...]
>
> --
> Ben Hutchings
> This sentence contradicts itself - no actually it doesn't.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
