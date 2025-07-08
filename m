Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E50C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8ZBACVY2POf1LJBmPGiTmVd2LDvYohtoJyd+t1nz3E=; b=DLUqXOU2dOJ4EL
	k5QtyTeWiSxOAWvXUCrKG2pVckRk+MHXu+K5m/RZQGvMlcQ1NwIqSejwzOq9jCvLQNQTeHvD4DoN7
	I9Q1ozAvlJkiqz2mOm04uf+YQNNf5AV6v33JMkR7YKhfOCJVrIuOnKT55ubf6GbaTxS+cvQ5hJFZe
	bBSRwVsG3XR2q3R3cy3zPPavPd8Dx7KyygYmPn3g/UhiYSGUwVSzWZl1i/i0h6VMItgKIHSHz+Omd
	LsbHqHygfGfiQjHFUvBrtVJ/RpvW5SQZr4SBdE4EiSX6UV2ULISpFJLsWl0+VyxRL1MturL9denYX
	p69mIc7wtfsEKWYpXMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0gb-00000004IsJ-1g4o;
	Tue, 08 Jul 2025 05:16:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ0gY-00000004Iqq-1keh
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 05:16:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8997825D3C;
	Tue,  8 Jul 2025 07:16:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wH3v3tcvD4eS; Tue,  8 Jul 2025 07:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751951760; bh=vwWTmtEhyYaokbT4pg4vQi/76twGoXovFRT7DrY0su0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HsWlEiWhVQJ5oNbhnw+ykb0EgLDskRU/cQH8h0Y1qV8sdf5ZQhtU5FwXjsvJkQxux
	 ybOJgF+ZPVB0dQhier81jKRf9gMQEqgixR4xtdQn+fw/KgZdmDwtF9vrC9Dwrhl/Hw
	 CeSkUincSsq3pbnoAu+C8vur5Ykkoxo8BBJfLqcT3pRjDGAAiV5QfhnawC8hu97G/J
	 m5IejVLcCywGXIrWPGe0x0KMTZDMuUHPt+aonHX/sTbP/LJOTNzCsHBOI7n0bqFSvV
	 mrIUZ43EYi0tXEOsxo5cBfO0F+8WlIjgrWLV4+LrOuPLn9pMpUgnE5fqt30YhKTrcm
	 F2pVrsBr1qTEQ==
Date: Tue, 8 Jul 2025 05:15:15 +0000
From: Yao Zi <ziyao@disroot.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>,
	alexghiti@rivosinc.com, palmer@dabbelt.com,
	Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Mark Rutland <mark.rutland@arm.com>, puranjay12@gmail.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com,
	vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com
Cc: Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [REGRESSION] Random oops on SG2042 with Linux 6.16-rc and
 dynamic ftrace
Message-ID: <aGypYyyR3EtsKGKy@pie.lan>
References: <aGODMpq7TGINddzM@pie.lan>
 <b060e694-caa0-4aa5-ac67-75531a5f60eb@ghiti.fr>
 <aGUO8L7oXpvEpvZo@pie.lan>
 <6d478129-324a-4c5a-8258-4abe3d0732d6@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d478129-324a-4c5a-8258-4abe3d0732d6@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_221606_888616_7919E28C 
X-CRM114-Status: GOOD (  33.77  )
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

On Wed, Jul 02, 2025 at 03:05:06PM +0200, Alexandre Ghiti wrote:
> Hi Yao,
> =

> On 7/2/25 12:50, Yao Zi wrote:
> > On Tue, Jul 01, 2025 at 02:27:32PM +0200, Alexandre Ghiti wrote:
> > > Hi Yao,
> > > =

> > > On 7/1/25 08:41, Yao Zi wrote:
> > > > Linux v6.16 built with dynamic ftrace randomly oops or triggers
> > > > ftrace_bug() on Sophgo SG2042 when booting systemd-based userspace,
> > ...
> > =

> > > > Not sure either reverting the commits or fixing them up is a better
> > > > idea, but anyway the fatal first issue shouidn't go into the stable
> > > > release.
> > > Let's fix this, we were expecting issues with dynamic ftrace :)
> > > =

> > > So the following diff fixes all the issues you mentioned (not the fir=
st
> > > crash though, I'll let you test and see if it works better, I don't h=
ave
> > > this board):
> > Thanks for the fix! I've tested it with both QEMU and SG2042, it does
> > fix the lockdep failures as well as the boot time crash on SG2042. The
> > boot-time crash is caused by the race so will disappear as long as we
> > fix the race.
> > =

> > > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> > > index 4c6c24380cfd9..97ced537aa1e0 100644
> > > --- a/arch/riscv/kernel/ftrace.c
> > > +++ b/arch/riscv/kernel/ftrace.c
> > > @@ -14,6 +14,16 @@
> > >  =A0#include <asm/text-patching.h>
> > > =

> > >  =A0#ifdef CONFIG_DYNAMIC_FTRACE
> > > +void ftrace_arch_code_modify_prepare(void)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> > > +}
> > > +
> > > +void ftrace_arch_code_modify_post_process(void)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0 mutex_unlock(&text_mutex);
> > > +}
> > > +
> > >  =A0unsigned long ftrace_call_adjust(unsigned long addr)
> > >  =A0{
> > >  =A0=A0=A0=A0=A0=A0=A0 if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL=
_OPS))
> > > @@ -29,10 +39,8 @@ unsigned long arch_ftrace_get_symaddr(unsigned long
> > > fentry_ip)
> > > =

> > >  =A0void arch_ftrace_update_code(int command)
> > >  =A0{
> > > -=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> > >  =A0=A0=A0=A0=A0=A0=A0 command |=3D FTRACE_MAY_SLEEP;
> > >  =A0=A0=A0=A0=A0=A0=A0 ftrace_modify_all_code(command);
> > > -=A0=A0=A0=A0=A0=A0 mutex_unlock(&text_mutex);
> > >  =A0=A0=A0=A0=A0=A0=A0 flush_icache_all();
> > >  =A0}
> > > =

> > > @@ -149,16 +157,17 @@ int ftrace_init_nop(struct module *mod, struct
> > > dyn_ftrace *rec)
> > >  =A0=A0=A0=A0=A0=A0=A0 unsigned int nops[2], offset;
> > >  =A0=A0=A0=A0=A0=A0=A0 int ret;
> > > =

> > > +=A0=A0=A0=A0=A0=A0 mutex_lock(&text_mutex);
> > Besides using the guard API, could we swap the order between
> > ftrace_rec_set_nop_ops() and calculation of the nops array? This shrinks
> > the critical region a little.
> =

> =

> If you don't mind, I won't, I don't like initializing stuff which could
> never be used in case of error.

Yes, I don't mind it.

> =

> > =

> > With or without the change, here's my tag,
> > =

> > Tested-by: Yao Zi <ziyao@disroot.org>
> > =

> > and also
> > =

> > Reported-by: Han Gao <rabenda.cn@gmail.com>
> > Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > =

> > for their first-hand report of boot-time crash and analysis for the
> > first lock issue.
> =

> =

> I'll add all those tags in the patch I'll send today (or tomorrow if the =
CI
> is slow).

Is there any update about the fix patch? It'll be nice to get the
problem fixed soon.

> Thanks again for the great bug report, really appreciated.
> =

> Alex

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
