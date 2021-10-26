Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED1DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 00:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B0060E8B
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 00:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5B0060E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppf/ULG/H3opvSywOJvnqS4NiIH+iA6saxiUHJduraU=; b=js0mNPTt7XixR6Q5DFO7dKtBmN
	l6BZZCjCMIsg1fj6ZOPvr4e3AM5cHevSNErQrtkq9PVa16M7SicNKVVkppP1IrHDQ1ldPbz6aXlxX
	FQNXzosbWR4fTLvHh+SVr5tio9y8GdDNRLFayzBK5XYctffvqqKzNLuuttZE1bDeR17r8Ajqa/LXf
	GFg+MokCYeaAeA+pd/i9zU0FKm2Z1cbJ4E985sUGIMqpA6xZC569lkQdJT/psCEmmg38C3lC+BPZ4
	o88kaevYhnhPyA/eUjhLrcMHR28a9K5Amv/bj0T503hYF3ybr0eOjyOhzxbYH/hiJCgtI/w1cWkPB
	lqsaF/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfAT0-000N6K-E9; Tue, 26 Oct 2021 00:37:26 +0000
Received: from gateway21.websitewelcome.com ([192.185.45.95])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfASw-000N4G-HY
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 00:37:24 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id CD6EC400CD782
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 19:37:09 -0500 (CDT)
Received: from box5620.bluehost.com ([162.241.219.59]) by cmsmtp with SMTP
 id fASjmhnWaOnCIfASjmMkmp; Mon, 25 Oct 2021 19:37:09 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MXJyqQhA26LKDF72Wrnv1ROPWPI8gDzTAufAwrckO7o=; b=TmSfcxUK1xUugzT6nQ63ywy/Nz
 rIrcQAgZM/kaqTH7J5xu5/XOQurH89EIqsgSh35X5hgjd9lrP4bnflIyRXGaFjbSqZbVqYrMyt4Wz
 XkwrHGWfTULOx/7g1jO2krGMX;
Received: from c-73-158-190-127.hsd1.ca.comcast.net ([73.158.190.127]:39272
 helo=[10.0.1.23]) by box5620.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <re@w6rz.net>)
 id 1mfASj-004ORv-DX; Mon, 25 Oct 2021 18:37:09 -0600
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
From: Ron Economos <re@w6rz.net>
Message-ID: <830eda64-6e66-c61b-ceaa-57be87783b2c@w6rz.net>
Date: Mon, 25 Oct 2021 17:37:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.158.190.127
X-Source-L: No
X-Exim-ID: 1mfASj-004ORv-DX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-158-190-127.hsd1.ca.comcast.net ([10.0.1.23])
 [73.158.190.127]:39272
X-Source-Auth: re@w6rz.net
X-Email-Count: 5
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_173722_787352_8C1B44CC 
X-CRM114-Status: GOOD (  32.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/25/21 8:54 AM, Geert Uytterhoeven wrote:

> Hi all,
>
> When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
> the 4th CPU either fails to come online, or the system crashes.
>
> This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
>    - unused core has hartid 0 (sifive,e51),
>    - processor 0 has hartid 1 (sifive,u74-mc),
>    - processor 1 has hartid 2 (sifive,u74-mc),
>    - processor 2 has hartid 3 (sifive,u74-mc),
>    - processor 3 has hartid 4 (sifive,u74-mc).
>
> I assume the same issue is present on the SiFive fu540 and fu740
> SoCs, but I don't have access to these.  The issue is not present
> on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
> hartid 0.
>
> arch/riscv/kernel/cpu_ops.c has:
>
>      void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
>      void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
>
>      void cpu_update_secondary_bootdata(unsigned int cpuid,
>                                         struct task_struct *tidle)
>      {
>              int hartid = cpuid_to_hartid_map(cpuid);
>
>              /* Make sure tidle is updated */
>              smp_mb();
>              WRITE_ONCE(__cpu_up_stack_pointer[hartid],
>                         task_stack_page(tidle) + THREAD_SIZE);
>              WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
>
> The above two writes cause out-of-bound accesses beyond
> __cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.
>
>      }
>
> arch/riscv/kernel/smpboot.c:setup_smp(void) detects CPUs like this:
>
>      for_each_of_cpu_node(dn) {
>              hart = riscv_of_processor_hartid(dn);
>              if (hart < 0)
>                      continue;
>
>              if (hart == cpuid_to_hartid_map(0)) {
>                      BUG_ON(found_boot_cpu);
>                      found_boot_cpu = 1;
>                      early_map_cpu_to_node(0, of_node_to_nid(dn));
>                      continue;
>              }
>              if (cpuid >= NR_CPUS) {
>                      pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
>                              cpuid, hart);
>                      break;
>              }
>
>              cpuid_to_hartid_map(cpuid) = hart;
>              early_map_cpu_to_node(cpuid, of_node_to_nid(dn));
>              cpuid++;
>      }
>
> So cpuid >= CONFIG_NR_CPUS (too many CPU cores) is already rejected.
>
> How to fix this?
>
> We could skip hartids >= NR_CPUS, but that feels strange to me, as
> you need NR_CPUS to be larger (much larger if the first usable hartid
> is a large number) than the number of CPUs used.
The Ubuntu distro config for HiFive Unmatched set this to CONFIG_NR_CPUS=8.
>
> We could store the minimum hartid, and always subtract that when
> accessing __cpu_up_{stack,pointer}_pointer[] (also in
> arch/riscv/kernel/head.S), but that means unused cores cannot be in the
> middle of the hartid range.
>
> Are hartids guaranteed to be continuous? If not, we have no choice but
> to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
> needs a more expensive conversion in arch/riscv/kernel/head.S.
>
> Thanks for your comments!
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
