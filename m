Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB07C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ko2/lRpmRC/t6Kn2Z/lI+HORhwNvmTZf2XGvkGqiDhA=; b=p8EDv07rIa1rXs
	NoliTvxB0DI34149w83PAryZlfkfv/0x8y0IGOujoNgq/uctTpMp4kLMvfxFAidGh47wE96L/NL3X
	OL0vGdxh5dpRVaHFBp5PPyK0cdMp4RM2IuZBroL3bjjn+4LCll+Dzz69Z6IQOQxq6L46R9FHSn1eo
	nxLmwun/+hpwO640eD3qPeKt/fBey2J2XInkqxfsU9Dvk2dSdjKgWD3qqxVxRVI9U2WeJdaF8uvpE
	Skmn5TZRiK7KEm9AMaLTwjpkS/D6NzzqD6iEcuMhTnokU2PaxrtkxUzaEo+WRj2GO7hmFEVHgM1aE
	BENlhThwncGCS82hONvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHcz-00000005ekR-3GJV;
	Fri, 10 Jul 2026 20:15:17 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiD1L-00000005AxT-0wjz
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 15:20:09 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B43DE76801;
	Fri, 10 Jul 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783696805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZQD0gbHT/+/4nEi6V44a4a6X/c8Qb54PXXTiWjk/u8=;
	b=rRfHvU7hwvxSxH/yhWy3u/UmnKewb4V/Z4b30wYyACRHS2pvvGsK3hzGOrADXnhSphQb6B
	TJO7bjd1/2FVOhXCYNiRGDpELYNIfYY2dwQ6Y49rIZ1WBugDexsBsCaHyF140dt8k3TjmV
	UWP5O1yIlbcNFepPxleuBxi0o0QQDRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783696805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZQD0gbHT/+/4nEi6V44a4a6X/c8Qb54PXXTiWjk/u8=;
	b=pk/+bbw3K3lpKh/bJanZxO9C8hJb0ZZOIjqryyeda12Q6eGbOK0xFb2lDAgDT0IE8bAo9T
	Y31J/JbRgJZSmhDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PEvxjgpH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p4USxO4M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783696804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZQD0gbHT/+/4nEi6V44a4a6X/c8Qb54PXXTiWjk/u8=;
	b=PEvxjgpHDkYAsWHBvOJnCwi8Aqh7iUKS6UnrUW8IsLNixt7v9VdTF6VpKe/6vGC/h1xgM2
	uQXypgGxDhZQFurqRWyXGrIHbe4ykOmc1FofcTQPuLdfVOHR9PXQBW7Js2xqnQRuLq0aZj
	LLSWX+cwuBo/Mg5E6/LeKOba5LZ7xYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783696804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZQD0gbHT/+/4nEi6V44a4a6X/c8Qb54PXXTiWjk/u8=;
	b=p4USxO4MP+4N45GZtMpBPez/DEQVEMysX4p56b8ql7l7r16Ar/kLpYHwhTAobjb9FOy99M
	EDSZAKc2nxg1qgBA==
Date: Fri, 10 Jul 2026 17:20:03 +0200
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
Message-ID: <alENozSQmA3nU86B@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org>
 <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13>
 <alDQ7isUKJFl8Va4@kunlun.suse.cz>
 <alDaOw8t-e3rxIPm@redhat.com>
 <alDmTcgzMlKiio9H@kunlun.suse.cz>
 <alDrGBMdTuoLcVyy@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alDrGBMdTuoLcVyy@redhat.com>
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.15 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.96)[0.987];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	R_RATELIMIT(0.00)[to_ip_from(RLrpyf51xp5ujasy9bitsaikab)];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:helo,kunlun.suse.cz:mid,suse.de:dkim]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: B43DE76801
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_082007_553250_4183EAD6 
X-CRM114-Status: GOOD (  27.15  )
X-Mailman-Approved-At: Fri, 10 Jul 2026 13:15:15 -0700
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

On Fri, Jul 10, 2026 at 02:52:40PM +0200, Oleg Nesterov wrote:
> On 07/10, Michal Such=E1nek wrote:
> >
> > On Fri, Jul 10, 2026 at 01:40:43PM +0200, Oleg Nesterov wrote:
> > >
> > > I can only say that ptrace users do want to skip the syscall and set =
the
> > > return value on entry.
> > >
> > > See
> > > 	[PATCH v5 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall skipping =
support
> > > 	https://lore.kernel.org/all/20260709100949.94345-2-renzo@cs.unibo.it/
> > >
> > > The changelog explains that currently this doesn't work because
> > > among the arches which define HAVE_ARCH_TRACEHOOK (at least) arch/mip=
s is
> > > broken in this regard.
> >
> > Or it could be documented that setting the return value has to be done
> > in the exit trace, and that would than work on any architecture AFAICT.
> =

> Well, ptrace users know the problem. And this what they have to do
> currently.
> =

> > With ppc and s390 using the same register for the syscall number and
> > syscall return value it's very much impossible to poke the return value
> > on entry into a register using the generic register access function. As
> > of now there is no place to store the value ot of the return value
> > outside of the registers, either.
> =

> I know nothing about ppc and s390. Can't comment right now.
> =

> > And the current PTRACE_SET_SYSCALL_INFO indeed sets the syscall nr and
> > arguments on entry and the syscall return value on exit, that
> > disctincion is implemented.
> >
> > Not sure how the patchset you point out is relevant, it only adds
> > changes in the exit case.
> =

> No. It allows to skip-and-set-retval on PTRACE_EVENT_SECCOMP.

And if it was hooked correctly to seccomp indicating to seccomp that the
syscall needs to be skipped it could work but it is not, and will fail
on ppc.

Thanks

Michal

> =

> But ENTRY -> EXIT transition is not yet allowed due to the problems
> above.
> =

> Oleg.
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
