Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E32AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B306E60232
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 08:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B306E60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5qnq5Yg30B4Jv5MT0KowI3ENcCryl3P9FLo7/D58+g=; b=LmNIjPKY7xBccQ
	Q2QUqc3/atqSVas+9TRN6WKVPMHhUXI4pznUBSa3MkqXcI4+gVFueeDWYAHrFAtQbyeJ3qhDB0+HM
	i4Drix9WLJMDqnqh49jcRDTs4YnyTfZe5/cRchFnkS0IT6yKYzTGL2rVxUN/dU+XftvVpCRvDjNZn
	ROye9nuzyu0cjgezaqm9xJlJlo/7+5GbjqJR8VZFHelnu++biy9OcMQW8ty0UTvYyo8krq3rRsKV2
	DH05uTgCT1qkkwu1DCJiXGKX00o3Ou0DmNuez7aPx4Uy+vfxgs6DNrfGsB8QfN1skPHPMobXi2EWK
	ZVoz7rRuMDRMCmOTdqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfIDO-00181H-O4; Tue, 26 Oct 2021 08:53:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIDK-0017yk-UF
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 08:53:48 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mfIDE-0004cp-SN; Tue, 26 Oct 2021 10:53:40 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: re@w6rz.net, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
Date: Tue, 26 Oct 2021 10:53:40 +0200
Message-ID: <2328512.Zi2KH1A685@diego>
In-Reply-To: <CAMuHMdU+jgNK8QCEysHnURkpUcazPOoepK32XzV8UGwVQdL5tw@mail.gmail.com>
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <830eda64-6e66-c61b-ceaa-57be87783b2c@w6rz.net>
 <CAMuHMdU+jgNK8QCEysHnURkpUcazPOoepK32XzV8UGwVQdL5tw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_015347_041216_34987325 
X-CRM114-Status: GOOD (  45.97  )
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

Am Dienstag, 26. Oktober 2021, 08:44:31 CEST schrieb Geert Uytterhoeven:
> On Tue, Oct 26, 2021 at 2:37 AM Ron Economos <re@w6rz.net> wrote:
> > On 10/25/21 8:54 AM, Geert Uytterhoeven wrote:
> > > When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
> > > the 4th CPU either fails to come online, or the system crashes.
> > >
> > > This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> > > and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
> > >    - unused core has hartid 0 (sifive,e51),
> > >    - processor 0 has hartid 1 (sifive,u74-mc),
> > >    - processor 1 has hartid 2 (sifive,u74-mc),
> > >    - processor 2 has hartid 3 (sifive,u74-mc),
> > >    - processor 3 has hartid 4 (sifive,u74-mc).
> > >
> > > I assume the same issue is present on the SiFive fu540 and fu740
> > > SoCs, but I don't have access to these.  The issue is not present
> > > on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
> > > hartid 0.
> > >
> > > arch/riscv/kernel/cpu_ops.c has:
> > >
> > >      void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> > >      void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> > >
> > >      void cpu_update_secondary_bootdata(unsigned int cpuid,
> > >                                         struct task_struct *tidle)
> > >      {
> > >              int hartid = cpuid_to_hartid_map(cpuid);
> > >
> > >              /* Make sure tidle is updated */
> > >              smp_mb();
> > >              WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> > >                         task_stack_page(tidle) + THREAD_SIZE);
> > >              WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> > >
> > > The above two writes cause out-of-bound accesses beyond
> > > __cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.
> > >
> > >      }
> > >
> > > arch/riscv/kernel/smpboot.c:setup_smp(void) detects CPUs like this:
> > >
> > >      for_each_of_cpu_node(dn) {
> > >              hart = riscv_of_processor_hartid(dn);
> > >              if (hart < 0)
> > >                      continue;
> > >
> > >              if (hart == cpuid_to_hartid_map(0)) {
> > >                      BUG_ON(found_boot_cpu);
> > >                      found_boot_cpu = 1;
> > >                      early_map_cpu_to_node(0, of_node_to_nid(dn));
> > >                      continue;
> > >              }
> > >              if (cpuid >= NR_CPUS) {
> > >                      pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
> > >                              cpuid, hart);
> > >                      break;
> > >              }
> > >
> > >              cpuid_to_hartid_map(cpuid) = hart;
> > >              early_map_cpu_to_node(cpuid, of_node_to_nid(dn));
> > >              cpuid++;
> > >      }
> > >
> > > So cpuid >= CONFIG_NR_CPUS (too many CPU cores) is already rejected.
> > >
> > > How to fix this?
> > >
> > > We could skip hartids >= NR_CPUS, but that feels strange to me, as
> > > you need NR_CPUS to be larger (much larger if the first usable hartid
> > > is a large number) than the number of CPUs used.
> > The Ubuntu distro config for HiFive Unmatched set this to CONFIG_NR_CPUS=8.
> 
> I know. Same for most defconfigs in Linux.  But we do not tend to
> work around buffer overflows by changing config values.  Besides,
> those configs will still experience the issue when run on e.g. an
> 8+1 core processor where the cores used by Linux have hartids 1-8.
> 
> I noticed because I started with a starlight config with
> CONFIG_NR_CPUS=2 (which gave me only one core), changed that to
> CONFIG_NR_CPUS=4, and got a kernel that didn't boot at all (no output
> without earlycon).I know. Same for most defconfigs in Linux.  But we
> do not tend to
> work around buffer overflows by changing config values.  Besides,
> those configs will still experience the issue when run on e.g. an
> 8+1 core processor where the cores used by Linux have hartids 1-8.
> 
> > > We could store the minimum hartid, and always subtract that when
> > > accessing __cpu_up_{stack,pointer}_pointer[] (also in
> > > arch/riscv/kernel/head.S), but that means unused cores cannot be in the
> > > middle of the hartid range.
> > >
> > > Are hartids guaranteed to be continuous? If not, we have no choice but
> > > to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
> > > needs a more expensive conversion in arch/riscv/kernel/head.S.
> 
> https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf
> says:
> 
>     Hart IDs might not necessarily be numbered contiguously in a
>     multiprocessor system, but at least one hart must have a hart
>     ID of zero.
> 
> Which means indexing arrays by hart ID is a no-go?

Isn't that also similar on aarch64?

On a rk3399 you get 0-3 and 100-101 and with the paragraph above
something like this could very well exist on some riscv cpu too I guess.



> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
