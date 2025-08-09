Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB231C87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fX5hyhkC+t7HCIr0XjOJT5jo0hHjsD8/qBvIiUXuAsI=; b=NvttJCAn8W/rn9
	W+JnWzdrW5T/w7ct/Z8i3VTShM0XvBuwfjoUBg1WRV7+TSu5df9Mh/ic/f+Ad/Pu5gU4wqcuLhyoy
	zpaS1pLwfY7SmVzimUBhV0d6hLcp5ZfEfAUanjiiyOtSfSTiKmy6mOS3juhRxNel2EpAczWUBnh+4
	5dpqbwqQTLzeUT55k+CtKjAhikXfdBhfpY/Xo8P3SdVg/Ttf9cgqdFOfd/9G76zxucod4HctciiXg
	jtmrQRPyX11p0kLvOnijXYzjvtv1E6OKBu6uI/ySB1r1lA4VkF5tZ0jA9J6FxyMboB6fKud+Hudu9
	zLODPpCLJ+C1E9pnKzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukePf-00000004Eki-3aIf;
	Sat, 09 Aug 2025 07:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukePd-00000004EkN-30eA
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 07:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F83041ABD;
	Sat,  9 Aug 2025 07:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF2AC4CEE7;
	Sat,  9 Aug 2025 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754726084;
	bh=ValNLmZusOxhT9SC9cHGaPGBaNGfyZ45nyV1qAZuHoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFGCq9lpPzmYcokrtnFb4SDfhoam7yqSDZpDnVrfjeOvLFiOFdd5iwRW0K51UVrY7
	 z5XMw1WrlAagABfuwjF/l7PlZ3ihgR5x4pH6GIyHHeIY5mkDy40D8sKbDD6EM/d7TK
	 OMbCPu9TA+Jh6kUvaIW/w5U45kuyCLYpt1tKTSeLOnXgz/WoZKd3OsBtNlFseGZNCp
	 5CW5U9NP9Nd1jbiWxEHhjC8JvgBbnpvj3+IZjNQXJ11CMMK/JvtvynKS8xm2Y/pRKo
	 j+F78OpKYhH1FKyhX/DI42w/b9063mX66kpzMXudu7nnLcLiAG1g1etatwP0hcSC+k
	 oPFBn2AgoNo1g==
Date: Sat, 9 Aug 2025 00:54:42 -0700
From: Drew Fustini <fustini@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Darius Rad <darius@bluespec.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJb+wifbIAsit+me@x1>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
 <aJXvWuPKIc2lCSX3@localhost.localdomain>
 <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_005445_801755_50DE7861 
X-CRM114-Status: GOOD (  30.04  )
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

On Sat, Aug 09, 2025 at 11:58:24AM +0800, Vivian Wang wrote:
> My previous comment on v1 on prefering clobbering with VS = Initial
> handling aside...

I found that in the discard vector state patch discussion 2 years ago
that Andy and Bjorn discussed how Initial could cause a problem [1]:

  It's not a racy, but you're correct that setting the state to Initial,
  will cause issues. When get/set_regs is called, the tracee will be
  stopped, and a schedule() has been done.

In the v3 series, Bjorn notes [2]:

  Set state to Dirty after discard, for proper ptrace() handling (Andy)

Also, I would like the ability to have the ability to switch off
__riscv_v_vstate_discard() and not loose any cycles to it, so I think
this sysctl is a good fit for that.

> 
> On 8/8/25 20:36, Darius Rad wrote:
> > On Wed, Aug 06, 2025 at 07:03:28AM -0700, Drew Fustini wrote:
> > [...]
> >> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> >> index 3987f5f76a9deb0824e53a72df4c3bf90ac2bee1..b702c00351617165a4d8897c7df68eadcd2d562e 100644
> >> --- a/Documentation/arch/riscv/vector.rst
> >> +++ b/Documentation/arch/riscv/vector.rst
> >> @@ -134,7 +134,25 @@ processes in form of sysctl knob:
> >>  3.  Vector Register State Across System Calls
> >>  ---------------------------------------------
> >>  
> >> -As indicated by version 1.0 of the V extension [1], vector registers are
> >> -clobbered by system calls.
> >> +Linux adopts the syscall ABI proposed by version 1.0 of the V extension [1],
> >> +where vector registers are clobbered by system calls. Specifically:
> >> +
> >> +    Executing a system call causes all caller-saved vector registers
> >> +    (v0-v31, vl, vtype) and vstart to become unspecied.
> >> +
> > Perhaps:
> >
> > Clobbering the vector registers may prevent leaking information to user
> 
> No... Not clobbering does not "leak" anything. If you find that it leaks
> information, please report - that's a bug.

Thanks Darius and Vivian for your comments. I think it is a good idea
for me to write about the possible advantages of mandatory clobbering on
syscall entry. However, I am also uncertain how clobbering on syscall
entry helps prevent leaking information.

> > space and aid in debugging, but can significantly increase system call
> > latency for some implementations.  [...]

I think that is a good idea for me to call out that this is can be
useful for debugging and testing.

> >
> >> +However, clobbering the vector registers can significantly increase system call
> >> +latency for some implementations. To mitigate this performance impact, a sysctl
> >> +knob is provided that controls whether vector state is always discarded in the
> >> +syscall path:
> >> +
> >> +* /proc/sys/abi/riscv_v_vstate_discard
> >> +
> >> +    Valid values are:
> >> +
> >> +    * 0: Vector state is not always clobbered in all syscalls
> >> +    * 1: Mandatory clobbering of vector state in all syscalls
> >> +
> >> +    Reading this file returns the current discard behavior. The initial state is
> >> +    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> >>  
> >>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index 36061f4732b7496a9c68a9a10f9959849dc2a95c..7bb8a8513135cbc105bd94d273012486a886f724 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -656,6 +656,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> >>  
> >>  	  If you don't know what to do here, say Y.
> >>  
> >> +config RISCV_ISA_V_VSTATE_DISCARD
> >> +	bool "Enable Vector state discard by default"
> >> +	depends on RISCV_ISA_V
> >> +	default n
> >> +	help
> > Perhaps add the following paragraph:
> >
> > Discarding vector state is more robust, but has negative performance
> > implications in certain implementations.
> 
> "Robust" is too vague... I don't think this word is helpful for anyone
> trying to understand what this does.

I agree that I should add more description to the Kconfig option as I
think what I wrote assumes too much prior knowledge of the code. Maybe
something like this:

  Discarding vector state on syscall entry can help identify userpace
  programs that are mistakenly relying on vector state being preserved
  across syscalls. This can be useful for debugging and test suites.
  However, this behavior can negatively impact performance on some
  RISC-V implementations.

  Say Y here if you want mandatory clobbering of vector state before
  entering all syscalls. If you select N, then userspace can still
  eanble it via the abi.riscv_v_vstate_discard sysctl knob.

  If you don't know what to do here, then select N.

Thanks,
Drew


[1] https://lore.kernel.org/linux-riscv/87r0pug6hb.fsf@all.your.base.are.belong.to.us/
[2] https://lore.kernel.org/linux-riscv/20230629062730.985184-1-bjorn@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
