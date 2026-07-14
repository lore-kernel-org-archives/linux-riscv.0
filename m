Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2252C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PrFlyd5MoFmAv6oiXmCGcCZCFtcbiUF4+7Vk4OTk0w=; b=Tqng0cPMRZuvQE
	btn5+8szSBs6+S7FNHbQSMQvphM3kbe9bwayDKgyYhL4I6egaPEZm8XfWrbtc1CEWWcTh3hOtMXVp
	5wao4Ia5Kg7zG+tfN0Ovrx8LwlDmeezuit1t067eH7gmXQS0kgVzSMbgayX5CUrwyLX4MJLsWWjyf
	xpKcvbsCTAE31EZXAW10QX08oarFRg9DOtZj4yQdOCXjIIA4w8Bex+A1FvAhwipiNj6emaL2V6MDm
	bj29oA9DgwPkrmLZzcejy+qxcUcOZ/UTKHPK+tYrDkPzlFt5mWvsgiigCoJVXsddUViPBpP4bNUND
	u2tkkDyl42YUyQIZsZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXZv-0000000BAbx-1id7;
	Tue, 14 Jul 2026 07:29:20 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXZt-0000000BAbb-018R
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 07:29:18 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D0B5C77D39;
	Tue, 14 Jul 2026 07:29:14 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Date: Tue, 14 Jul 2026 09:29:13 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Radu Rendec <radu@rendec.net>
Subject: Re: [patch 4/4] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
Message-ID: <alXlSUcT2TWOlM7r@kunlun.suse.cz>
References: <20260712134433.549076055@kernel.org>
 <20260712141346.772209074@kernel.org>
 <alSlg72c8xmjaj48@kunlun.suse.cz>
 <871pd6r0ou.ffs@fw13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871pd6r0ou.ffs@fw13>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: D0B5C77D39
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-2.00 / 50.00];
	REPLY(-4.00)[];
	RDNS_NONE(2.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_002917_389501_CC4564C1 
X-CRM114-Status: GOOD (  35.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2026 at 12:20:49AM +0200, Thomas Gleixner wrote:
> On Mon, Jul 13 2026 at 10:44, Michal Such=E1nek wrote:
> > On Sun, Jul 12, 2026 at 11:25:32PM +0200, Thomas Gleixner wrote:
> >> The return values of syscall_enter_from_user_mode[_work]() are
> >> non-intuitive. Both functions return the syscall number which should be
> >> invoked by the architecture specific syscall entry code. The returned
> >> number can be:
> >> =

> >>   - the unmodified syscall number which was handed in by the caller
> >> =

> >>   - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> >> =

> >> That has an additional twist. If the return value is -1L then the call=
er is
> >> not allowed to modify the return value as that indicates that the modi=
fying
> >> entity requests to abort the syscall and set the return value already.=
 That
> >> can obviously not be differentiated from a syscall which handed in -1 =
as
> >> syscall number.
> >> =

> >> The most trivial way to deal with that is:
> >> =

> >>     set_return_value(regs, -ENOSYS);
> >>     nr =3D syscall_enter_from_user_mode(regs, nr);
> >>     if (valid(nr))
> >>     	handle_syscall(regs, nr);
> >> =

> >> That's what LOONGARCH, RISCV, and X86 do. But PowerPC and S390 do not
> >> preset the return value, so when user space hands in -1 and there is
> >> nothing setting the return value in the entry work code, then the sysc=
all
> >> is skipped but the return value is whatever random data has been in the
> >> return value register.
> >
> > The reason why PowerPC and S390 do not preset the return value is that
> > the return value uses the same register as the syscall number. There are
> > apparently other architectures on which the return value overlaps with
> > the arguments which also do not preset the return value for that reason.
> > If they would use the generic entry the same problem would arise.
> =

> That's an implementation choice of PPC/S390 as I explained before, which
> could trivially be solved by having an explicit pt_regs->return_val
> member,
> =

> >> Change the return values of syscall_enter_from_user_mode[_work]() to
> >> boolean and return false, when either ptrace or seccomp request to ski=
p the
> >
> > There is a difference between seccomp and ptrace.
> >
> > When seccomp indicates to skip the syscall it has also set the syscall
> > return value.
> >
> > However, when the syscall number is -1 and the return value is not
> > preset that does not indicate anything.
> =

> I agree it's an invalid syscall, but the current generic entry code made
> the rightful assumption that returning -1L as the syscall number either
> results in -ENOSYS or in the value which was set by one of the entry
> mechanisms as that code originated from the x86 implementation.

You know, the world is not x86. For 20+ years that is not true.

> =

> It's not the fault of that code that PPC and S390 converted their stuff
> over without paying attention to that detail.

So this is not generic entry but rather x86-like entry do I get it
correct?

> =

> > The return value can still hold garbage. ptrace does not have the
> > ability to indicate that a syscall is to be skipped, at least on the
> > entry trace. It needs to be skipped based on the syscall number being
> > invalid.
> =

> That's what I explained you before and you told me I'm all wrong.
> =

> But that's moot as this latest version does not care anymore. The
> architectures whixh preset the return value are correct under all
> circumstances and PPC/S390 can keep their own world view.

So do I get it that you do not care about breaking userspace then?

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
