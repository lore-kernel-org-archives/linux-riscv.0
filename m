Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F8C6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AO478I0tWRt156ygA2n0ugrfY6dyr/xEBC7lNSbOoHY=; b=Or4FtvMtEU5+zW
	E+dm6HDGGRPcR5MeqjiDrobMQk7sM2tDT50Z6nu4nWvBZDaoPY5ybJO5aIDM9g+Ps1IZqFdZp8l/r
	FLe2T8lWJyiMZuOFBdLYIx3LWprBqPsmgXu1LZZPjtLrWSfI5s7xOG+59xd/Mn9LSsJ34Kq6m93E+
	YiIqfyp29eq0MOLD+F47AmlqHkHvignrEd5bM8egxM1rgfoZkDh+qTqpsgrWYFXvGZDJZS2m8TmBm
	2Wx1Q8HgsjCL5Ylt7eQMriSH/rKZbsKoOhawuyQyMI3lwOGy1+bjlY/D6yXKAwEabgJPQxeep/XUQ
	V/qsJlA4RhLQlvRQ605w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pidNS-00AoHY-2f;
	Sat, 01 Apr 2023 15:42:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pidNP-00AoGL-24
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 15:42:49 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pidN6-0003Ot-WC; Sat, 01 Apr 2023 17:42:29 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, palmer@rivosinc.com,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Yipeng Zou <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
Date: Sat, 01 Apr 2023 17:42:28 +0200
Message-ID: <2173635.1BCLMh4Saa@diego>
In-Reply-To: <878rfblkee.fsf@all.your.base.are.belong.to.us>
References:  <20230222033021.983168-1-guoren@kernel.org>
 <87edp3loai.fsf@all.your.base.are.belong.to.us>
 <878rfblkee.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_084247_705364_751DD6E6 
X-CRM114-Status: GOOD (  25.43  )
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

Am Samstag, 1. April 2023, 16:58:01 CEST schrieb Bj=F6rn T=F6pel:
> Bj=F6rn T=F6pel <bjorn@kernel.org> writes:
> =

> > (Narrowing the Cc list.)
> >
> > Bj=F6rn T=F6pel <bjorn@kernel.org> writes:
> >
> >>>> > > > This has unfortunately broken booting my usual NFS rootfs on b=
oth my D1
> >>>> > > > and Icicle. It's one of the Fedora images from David, I think =
this one:
> >>>> > > > http://fedora.riscv.rocks/kojifiles/work/tasks/3933/1313933/
> >>>> > > >
> >>>> > > > It gets pretty far into things, it's once systemd is operation=
al that
> >>>> > > > things go pear shaped:
> >>>> > >
> >>>> > > Shoulda said, can share the full logs if required of course, but=
 they're
> >>>> > > quite verbose cos systemd etc.
> >>>> >
> >>>> > I was just investigating the same thing just now. So that saves me=
 some
> >>>> > tracking down the culprit :-) .
> >>>> >
> >>>> > My main qemu is living as a "board" in my boardfarm (also doing nf=
sroot)
> >>>> > as well as my d1 nezha with nfsroot was affected.
> >>>> Can you reproduce it with qemu? Could give me some tips and let me
> >>>> reproduce it on qemu?
> >>
> >> FWIW, I'm getting the systemd issue w/o NFS, on a regular 9p virtfs.
> >>
> >> | $ sudo mmdebstrap --architecture=3Driscv64 lunar rv-rootfs http://po=
rts.ubuntu.com
> >>
> >> and the rootfs qemu config:
> >>  |  -fsdev local,id=3Droot,path=3D/path/to/rv-rootfs/,security_model=
=3Dnone \
> >>  |  -device virtio-9p-pci,fsdev=3Droot,mount_tag=3D/dev/root \
> >>  |  -append "root=3D/dev/root rw rootfstype=3D9p rootflags=3Dversion=
=3D9p2000.L,trans=3Dvirtio,cache=3Dmmap,access=3Dany security=3Dnone earlyc=
on console=3Dtty0 console=3DttyS0"
> >
> > I took a couple of different versions of the series for a spin, and for
> > me it stops working between these versions.
> >
> > $ git fetch https://github.com/guoren83/linux.git generic_entry_v12:ge-=
v12
> > $ git fetch https://github.com/guoren83/linux.git generic_entry_v13:g2-=
v13
> >
> > v12 is happy with systemd, v13 is not.
> =

> Hmm, this patch seems to resolve the issue for me:
> =

> --8<--
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index       1f4e37be7eb3..8c258b78c925 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -270,11 +270,11 @@ asmlinkage __visible __trap_section void do_trap_ec=
all_u(struct pt_regs *regs)
>         if (user_mode(regs)) {
>                 ulong syscall =3D regs->a7;
>  =

> -               syscall =3D syscall_enter_from_user_mode(regs, syscall);
> -
>                 regs->epc +=3D 4;
>                 regs->orig_a0 =3D regs->a0;
>  =

> +               syscall =3D syscall_enter_from_user_mode(regs, syscall);
> +
>                 if (syscall < NR_syscalls)
>                         syscall_handler(regs, syscall);
>                 else
> -->8--

Woohoo, thanks for tracking that down. This change makes both my
Qemu and D1-Nezha boot again.

> Seems like syscall_enter_from_user_mode() clobber regs->a0.

With a0 also being the return value in the calling conventions (and being
the syscall value here), I guess that could be somehow expected and thus
as your patch does, the a0 value should be saved first I guess?

An it looks like Loonarch also does save a0 before calling
syscall_enter_from_user_mode() [0]

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Heiko


[0] https://elixir.bootlin.com/linux/latest/source/arch/loongarch/kernel/sy=
scall.c#L54



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
