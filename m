Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27FCC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZ4CabMKfK6vyunfbHx84v7A5hyVbH3QwLDOxYtN8LY=; b=bY5A/g475DcHH5
	/Xxi1RFGv+/7fQYZm3+EjDEIprXvGHvjdSrb9VUdafLRJ3hcp4VRYUfYGhPhFDuR7WyAgnCrBUgu7
	7eSMTJci93j/YtWC/fOX6RiF2OkdABqjq5tcKO5EkXj+jWwx8FiHUJOrVut5dAx6/8EIqXykTXh9F
	7zKsMikJ98VODQnDwF+pl917EcQyeqa/ofPHDJyoJh0g9ZA9uy+URWcG4wqwlT7prpl+BzikRblW2
	E7pTsp4pe8VflCWQCsURN+tVau/Th0+YLhFqW0ZeJIaMQTS23tAE8JXRJANyYCYyU7OtMt9/qgy9p
	V4/8nJxL2TMC4IRBuEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAOy-00000004vFT-04iE;
	Fri, 10 Jul 2026 12:32:20 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAOu-00000004vE3-2v3z
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 12:32:18 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE9AB764C1;
	Fri, 10 Jul 2026 12:32:14 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Date: Fri, 10 Jul 2026 14:32:13 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
Message-ID: <alDmTcgzMlKiio9H@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org>
 <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13>
 <alDQ7isUKJFl8Va4@kunlun.suse.cz>
 <alDaOw8t-e3rxIPm@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alDaOw8t-e3rxIPm@redhat.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.00 / 50.00];
	REPLY(-4.00)[];
	RDNS_NONE(2.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLrpyf51xp5ujasy9bitsaikab)]
X-Rspamd-Queue-Id: AE9AB764C1
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_053216_910744_07D717E1 
X-CRM114-Status: GOOD (  25.51  )
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

On Fri, Jul 10, 2026 at 01:40:43PM +0200, Oleg Nesterov wrote:
> On 07/10, Michal Such=E1nek wrote:
> >
> > On Wed, Jul 08, 2026 at 10:34:38PM +0200, Thomas Gleixner wrote:
> > >
> > >   1) The set in stone rule is that if the entry code returns -1L as t=
he
> > >      syscall number then the architecture code has to skip the syscall
> > >      invocation _and_ is not supposed to change the return value.
> >
> > Which stone?
> >
> > Pics or it did not happen.
> >
> > >
> > >   2) There is no guarantee and never has been that any of the involved
> > >      mechanisms (ptrace, seccomp, tracing) will change the return val=
ue
> > >      when it sets the syscall number to -1L.
> >
> > For ptrace to correctly emulate a syscall it needs to set the syscall nr
> > to an invalid value on entry, and the desired result if the syscall on
> > exit AFAICT.
> =

> I can only say that ptrace users do want to skip the syscall and set the
> return value on entry.
> =

> See
> 	[PATCH v5 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall skipping supp=
ort
> 	https://lore.kernel.org/all/20260709100949.94345-2-renzo@cs.unibo.it/
> =

> The changelog explains that currently this doesn't work because
> among the arches which define HAVE_ARCH_TRACEHOOK (at least) arch/mips is
> broken in this regard.

Or it could be documented that setting the return value has to be done
in the exit trace, and that would than work on any architecture AFAICT.

With ppc and s390 using the same register for the syscall number and
syscall return value it's very much impossible to poke the return value
on entry into a register using the generic register access function. As
of now there is no place to store the value ot of the return value
outside of the registers, either.

And the current PTRACE_SET_SYSCALL_INFO indeed sets the syscall nr and
arguments on entry and the syscall return value on exit, that
disctincion is implemented.

Not sure how the patchset you point out is relevant, it only adds
changes in the exit case.

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
