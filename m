Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C035260720
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 15:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C035260720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JcRFXoIL1RI7rBlrq6GtDdjfHMFvEIB5TFMN7qNttxg=; b=sFC0FsHva4VoFe
	w4Pf0N0mrxh8JGrNn4etfNOBwpHbztuVfAzNIn5D+0LCv0Rhm5Cm48oN6tihVGIu9g/nVAH7nClNx
	wLmfe2oZhFrAXZpitsoD+T8ohVoj8QOXXAD+i8s8Z/fnT29Y4OGQAYeTLUpFt1LdhZiHQi/dKvRPt
	12p3H+iwrCOxI7X17i5HCJYaw5w6yuLeCEPXRVUYI2lhpeo15N1iCfjOgXgrnplsFGWG+LAgHVdpw
	PGQE82GEfWMzTPrdey8TBhIdwQU3aFypisOOQ/2rqhhUAbiaA+kTjmrjDixSHP4ygSNPTYXg83FeX
	W09L94P8BHL7s6WfAhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf2It-00GvsL-CF; Mon, 25 Oct 2021 15:54:27 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf2Ip-00Gvqf-T4
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 15:54:25 +0000
Received: by mail-vk1-f180.google.com with SMTP id s201so3278781vke.6
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 08:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=AGNNgOmVg+yVUKzMcQpO1dKw5Tftq7yu9PfveBqIu/M=;
 b=3ZU+iRCDoLH3dliB7EB8e/6ZchIikDm6i0tOeMbjWZVfGGNLQ2Bdug5QC4ArXWEU5M
 eqZk0wPNxrluwdtlkbmpLey2SWaP6eTTq+z/X0c8h+jFSpAlRJvi7HbKzUYCHghuC4lr
 5I+bGG/ODEoXQXeQacCCn7Sn059VRM7nuIHTMDiitBUV/qil4irjbI55zXjyxcpoLK1c
 X4UwCtd8D67Zik5LLRuzNz1foKdIrAx4Ab8rPZMDhOpjdR3EIww/BxICCUKTGYe4JQrq
 5q/4uOVIv1XnNjRcerEaJuNkT2ig1OpWwB7v2i1viw2cJBLtqzjDoC+iBjo4jx84NZeY
 aS5g==
X-Gm-Message-State: AOAM530WAIWkBV6ISsnjeR2B3uKamnaE2kQSII4I/mFmN8o389viOUj0
 94X6aRzp5JhFWg3HX+187fYoa55Nm0ppEA==
X-Google-Smtp-Source: ABdhPJxDxfesNmwXpzOecnVaZjjcaUtH/mL6WtVEfFw6Et7ha/BfV5UifLHBA1NEE5doHkCbGkWioQ==
X-Received: by 2002:a1f:f809:: with SMTP id w9mr5161033vkh.8.1635177261850;
 Mon, 25 Oct 2021 08:54:21 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id w4sm400023uau.6.2021.10.25.08.54.21
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:54:21 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id f4so23107350uad.4
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 08:54:21 -0700 (PDT)
X-Received: by 2002:a67:f84d:: with SMTP id b13mr12058620vsp.41.1635177260921; 
 Mon, 25 Oct 2021 08:54:20 -0700 (PDT)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Oct 2021 17:54:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
Message-ID: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
Subject: Out-of-bounds access when hartid >= NR_CPUS
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_085423_967848_D199EF61 
X-CRM114-Status: GOOD (  21.25  )
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

Hi all,

When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
the 4th CPU either fails to come online, or the system crashes.

This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
  - unused core has hartid 0 (sifive,e51),
  - processor 0 has hartid 1 (sifive,u74-mc),
  - processor 1 has hartid 2 (sifive,u74-mc),
  - processor 2 has hartid 3 (sifive,u74-mc),
  - processor 3 has hartid 4 (sifive,u74-mc).

I assume the same issue is present on the SiFive fu540 and fu740
SoCs, but I don't have access to these.  The issue is not present
on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
hartid 0.

arch/riscv/kernel/cpu_ops.c has:

    void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
    void *__cpu_up_task_pointer[NR_CPUS] __section(".data");

    void cpu_update_secondary_bootdata(unsigned int cpuid,
                                       struct task_struct *tidle)
    {
            int hartid = cpuid_to_hartid_map(cpuid);

            /* Make sure tidle is updated */
            smp_mb();
            WRITE_ONCE(__cpu_up_stack_pointer[hartid],
                       task_stack_page(tidle) + THREAD_SIZE);
            WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);

The above two writes cause out-of-bound accesses beyond
__cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.

    }

arch/riscv/kernel/smpboot.c:setup_smp(void) detects CPUs like this:

    for_each_of_cpu_node(dn) {
            hart = riscv_of_processor_hartid(dn);
            if (hart < 0)
                    continue;

            if (hart == cpuid_to_hartid_map(0)) {
                    BUG_ON(found_boot_cpu);
                    found_boot_cpu = 1;
                    early_map_cpu_to_node(0, of_node_to_nid(dn));
                    continue;
            }
            if (cpuid >= NR_CPUS) {
                    pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
                            cpuid, hart);
                    break;
            }

            cpuid_to_hartid_map(cpuid) = hart;
            early_map_cpu_to_node(cpuid, of_node_to_nid(dn));
            cpuid++;
    }

So cpuid >= CONFIG_NR_CPUS (too many CPU cores) is already rejected.

How to fix this?

We could skip hartids >= NR_CPUS, but that feels strange to me, as
you need NR_CPUS to be larger (much larger if the first usable hartid
is a large number) than the number of CPUs used.

We could store the minimum hartid, and always subtract that when
accessing __cpu_up_{stack,pointer}_pointer[] (also in
arch/riscv/kernel/head.S), but that means unused cores cannot be in the
middle of the hartid range.

Are hartids guaranteed to be continuous? If not, we have no choice but
to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
needs a more expensive conversion in arch/riscv/kernel/head.S.

Thanks for your comments!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
