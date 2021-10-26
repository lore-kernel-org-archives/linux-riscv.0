Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EDCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A706F60E08
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A706F60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N9kybKm/h/DldmQj/QNMo+gmJiuH9tuiHVGU3IhWNA=; b=2D6SOpN8SpdoGC
	tqQUUTlg9scO9En0dc2lIs4ov9hzRjmJdR1SW7+zTD3fVj/Pd0fr3Q2wDRoJcNKiv30/2/6Du8aSU
	0VEEhZ2xA1H/b6A4UEwKzRrU0KB86OACA4XXBUtKQJjbWh0FDPjLgUlARHJscS0lo7V13NXjKgBs6
	lpwnWRcsIOWYh9ObOjskTF0TetI8/Zp2s3882Cb1q2YRJHhj8g/k72bhbSYzP+sRtATPRVbHWCpwF
	aGq9yIKlfg7iZLLbs8iMvzEWnXL1ootug/fmQJ1OlH53bfd0SoEngQuNM3i6jBVD+rEK2RXUo7VNI
	BfFKwbJlwsmsGX0aTzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfIqY-001IBc-77; Tue, 26 Oct 2021 09:34:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIkV-001F3D-Tg
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 09:28:05 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mfIkT-0004nO-E1; Tue, 26 Oct 2021 11:28:01 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: re@w6rz.net, linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
Date: Tue, 26 Oct 2021 11:28:00 +0200
Message-ID: <1714720.9tEa3Li8Nu@diego>
In-Reply-To: <CAMuHMdW7NCC3siVp6avaTRffrdFr+OMXvLeGzdHZJOg+B5aGJw@mail.gmail.com>
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <2328512.Zi2KH1A685@diego>
 <CAMuHMdW7NCC3siVp6avaTRffrdFr+OMXvLeGzdHZJOg+B5aGJw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_022804_011936_C7062ED4 
X-CRM114-Status: GOOD (  27.34  )
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

Am Dienstag, 26. Oktober 2021, 10:57:26 CEST schrieb Geert Uytterhoeven:
> Hi Heiko,
> =

> On Tue, Oct 26, 2021 at 10:53 AM Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Dienstag, 26. Oktober 2021, 08:44:31 CEST schrieb Geert Uytterhoeven:
> > > On Tue, Oct 26, 2021 at 2:37 AM Ron Economos <re@w6rz.net> wrote:
> > > > On 10/25/21 8:54 AM, Geert Uytterhoeven wrote:
> > > > > When booting a kernel with CONFIG_NR_CPUS=3D4 on Microchip PolarF=
ire,
> > > > > the 4th CPU either fails to come online, or the system crashes.
> > > > >
> > > > > This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> > > > > and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linu=
x:
> > > > >    - unused core has hartid 0 (sifive,e51),
> > > > >    - processor 0 has hartid 1 (sifive,u74-mc),
> > > > >    - processor 1 has hartid 2 (sifive,u74-mc),
> > > > >    - processor 2 has hartid 3 (sifive,u74-mc),
> > > > >    - processor 3 has hartid 4 (sifive,u74-mc).
> > > > >
> > > > > I assume the same issue is present on the SiFive fu540 and fu740
> > > > > SoCs, but I don't have access to these.  The issue is not present
> > > > > on StarFive JH7100, as processor 0 has hartid 1, and processor 1 =
has
> > > > > hartid 0.
> > > > >
> > > > > arch/riscv/kernel/cpu_ops.c has:
> > > > >
> > > > >      void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> > > > >      void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> > > > >
> > > > >      void cpu_update_secondary_bootdata(unsigned int cpuid,
> > > > >                                         struct task_struct *tidle)
> > > > >      {
> > > > >              int hartid =3D cpuid_to_hartid_map(cpuid);
> > > > >
> > > > >              /* Make sure tidle is updated */
> > > > >              smp_mb();
> > > > >              WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> > > > >                         task_stack_page(tidle) + THREAD_SIZE);
> > > > >              WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> > > > >
> > > > > The above two writes cause out-of-bound accesses beyond
> > > > > __cpu_up_{stack,pointer}_pointer[] if hartid >=3D CONFIG_NR_CPUS.
> > > > >
> > > > >      }
> =

> > > https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.p=
df
> > > says:
> > >
> > >     Hart IDs might not necessarily be numbered contiguously in a
> > >     multiprocessor system, but at least one hart must have a hart
> > >     ID of zero.
> > >
> > > Which means indexing arrays by hart ID is a no-go?
> >
> > Isn't that also similar on aarch64?
> >
> > On a rk3399 you get 0-3 and 100-101 and with the paragraph above
> > something like this could very well exist on some riscv cpu too I guess.
> =

> Yes, it looks like hart IDs are similar to MPIDRs on ARM.

and they have the set_cpu_logical_map construct to map hwids
to a continuous list of cpu-ids.

So with hartids not being necessarily continuous this looks like
riscv would need a similar mechanism.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
