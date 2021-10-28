Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF40C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:12:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4279F60FC4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4279F60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+x5SHFaEXvQbTA4NoMpmxqGlrDGpJmoaodJsQu0DOI=; b=jkuaI9vfmsLS5D
	AI60lcm7GYRRjDGigNW31AyaEdk4muzhkRjPiQdkEiIOGfMnTYFkdlIbwWg8Q2oxfIj10eZh2wgsV
	po5FTH7NAgEr2KrzM5OBV3eCQi+94h/d0o6VwvFgcm/jALjA1qr2+gyKoxXBh7niriah+wcoz5Sui
	nYIcKUSIrRztJl5bnPdViMofXblPscyxW4GAcnFL25ng0sjyDufWPIdrRUpwhm1utonhiHMNkxyvz
	84lbnH3LFzNxE0d8mEZL8zW0LGkhjMFD5p5VPpph+RVdHWR2w3R6zTa8ZnhNVFTACWZ9L8m3qbR/W
	NcRmrDU5xfqyssUWDUcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg813-008XNF-6h; Thu, 28 Oct 2021 16:12:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg80r-008XIk-MU
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:12:23 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mg80m-0004W7-6v; Thu, 28 Oct 2021 18:12:16 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: atishp@atishpatra.org, Palmer Dabbelt <palmer@dabbelt.com>
Cc: geert@linux-m68k.org, re@w6rz.net, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
Date: Thu, 28 Oct 2021 18:12:14 +0200
Message-ID: <1733048.UrJg72UHvK@diego>
In-Reply-To: <mhng-51188428-41ff-4962-b548-bf514a779723@palmerdabbelt-glaptop>
References: <mhng-51188428-41ff-4962-b548-bf514a779723@palmerdabbelt-glaptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091221_771058_D40980C2 
X-CRM114-Status: GOOD (  35.35  )
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

Am Donnerstag, 28. Oktober 2021, 17:09:44 CEST schrieb Palmer Dabbelt:
> On Wed, 27 Oct 2021 16:34:15 PDT (-0700), atishp@atishpatra.org wrote:
> > On Tue, Oct 26, 2021 at 2:34 AM Heiko St=FCbner <heiko@sntech.de> wrote:
> >>
> >> Am Dienstag, 26. Oktober 2021, 10:57:26 CEST schrieb Geert Uytterhoeve=
n:
> >> > Hi Heiko,
> >> >
> >> > On Tue, Oct 26, 2021 at 10:53 AM Heiko St=FCbner <heiko@sntech.de> w=
rote:
> >> > > Am Dienstag, 26. Oktober 2021, 08:44:31 CEST schrieb Geert Uytterh=
oeven:
> >> > > > On Tue, Oct 26, 2021 at 2:37 AM Ron Economos <re@w6rz.net> wrote:
> >> > > > > On 10/25/21 8:54 AM, Geert Uytterhoeven wrote:
> >> > > > > > When booting a kernel with CONFIG_NR_CPUS=3D4 on Microchip P=
olarFire,
> >> > > > > > the 4th CPU either fails to come online, or the system crash=
es.
> >> > > > > >
> >> > > > > > This happens because PolarFire has 5 CPU cores: hart 0 is an=
 e51,
> >> > > > > > and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in=
 Linux:
> >> > > > > >    - unused core has hartid 0 (sifive,e51),
> >> > > > > >    - processor 0 has hartid 1 (sifive,u74-mc),
> >> > > > > >    - processor 1 has hartid 2 (sifive,u74-mc),
> >> > > > > >    - processor 2 has hartid 3 (sifive,u74-mc),
> >> > > > > >    - processor 3 has hartid 4 (sifive,u74-mc).
> >> > > > > >
> >> > > > > > I assume the same issue is present on the SiFive fu540 and f=
u740
> >> > > > > > SoCs, but I don't have access to these.  The issue is not pr=
esent
> >> > > > > > on StarFive JH7100, as processor 0 has hartid 1, and process=
or 1 has
> >> > > > > > hartid 0.
> >> > > > > >
> >> > > > > > arch/riscv/kernel/cpu_ops.c has:
> >> > > > > >
> >> > > > > >      void *__cpu_up_stack_pointer[NR_CPUS] __section(".data"=
);
> >> > > > > >      void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> >> > > > > >
> >> > > > > >      void cpu_update_secondary_bootdata(unsigned int cpuid,
> >> > > > > >                                         struct task_struct *=
tidle)
> >> > > > > >      {
> >> > > > > >              int hartid =3D cpuid_to_hartid_map(cpuid);
> >> > > > > >
> >> > > > > >              /* Make sure tidle is updated */
> >> > > > > >              smp_mb();
> >> > > > > >              WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> >> > > > > >                         task_stack_page(tidle) + THREAD_SIZE=
);
> >> > > > > >              WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle=
);
> >> > > > > >
> >> > > > > > The above two writes cause out-of-bound accesses beyond
> >> > > > > > __cpu_up_{stack,pointer}_pointer[] if hartid >=3D CONFIG_NR_=
CPUS.
> >> > > > > >
> >> > > > > >      }
> >> >
> >> > > > https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1=
.10.pdf
> >> > > > says:
> >> > > >
> >> > > >     Hart IDs might not necessarily be numbered contiguously in a
> >> > > >     multiprocessor system, but at least one hart must have a hart
> >> > > >     ID of zero.
> >> > > >
> >> > > > Which means indexing arrays by hart ID is a no-go?
> >> > >
> >> > > Isn't that also similar on aarch64?
> >> > >
> >> > > On a rk3399 you get 0-3 and 100-101 and with the paragraph above
> >> > > something like this could very well exist on some riscv cpu too I =
guess.
> >> >
> >> > Yes, it looks like hart IDs are similar to MPIDRs on ARM.
> >>
> >> and they have the set_cpu_logical_map construct to map hwids
> >> to a continuous list of cpu-ids.
> >>
> >> So with hartids not being necessarily continuous this looks like
> >> riscv would need a similar mechanism.
> >>
> >
> > RISC-V already has a similar mechanism cpuid_to_hartid_map. Logical
> > cpu ids are continuous
> > while hartid can be sparse.
> >
> > The issue here is that __cpu_up_stack/task_pointer are per hart but
> > array size depends on the NR_CPUs
> > which represents the logical CPU.
> >
> > That's why, having a maximum number of hartids defined in config will
> > be helpful.
> =

> I don't understand why we'd have both: if we can't find a CPU number for =

> a hart, then all we can do is just leave it offline.  Wouldn't it be =

> simpler to just rely on NR_CPUS?  We'll need to fix the crashes on =

> overflows either way.

I'd think so.

The mhartid register is xlen big and as the spec says they don't have to be
contiguously, so it looks like hw-designers could adopt really "creative"
numbering.

So having a NR_HARTS won't really help, because there could be huge
gaps in numbering at some point.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
