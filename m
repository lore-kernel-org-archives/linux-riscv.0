Return-Path: <SRS0=X0/G=C7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31183C2D0E2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 21:04:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE552371F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2020 21:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2if1TRpg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="HNiF/Fd9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE552371F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9zkdDHWEjx3VtNHSTkN3aR7+XSKmNAevzzs2BvmIJds=; b=2if1TRpgkcp+apvy0Qh59DPc3
	0R411x13IxBPyrHXU/Zw7hsyrZmGWjTlS1naEVMU9jSuVd80pLkAJecmPxncDdyKgaiQF2ZHphLbn
	drpzK66wKa/WyDdIpgqA117VaKXcfbN6J0cSucZoCKXMDhf+wPWeCVzyIQ30c9gRpNT5InjCLVLI4
	vucIC/g0HUGN+ptRdplJZo6k6Y3r1nULWYjGe+vPhFk1aHaH0MAIiHoFW/XRAX2Fj2HEb2azYgzT3
	2Mb+jXBQ0SwC1MEWQ4lcFwo9NaVUtr/OlESA3O1n71rU/0osy5mkyABhkH9rvZq79qZLm57Kqhx+Y
	hFECLA12A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKpSo-0000u9-Lv; Tue, 22 Sep 2020 21:04:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKpSe-0000sb-QH
 for linux-riscv@lists.infradead.org; Tue, 22 Sep 2020 21:04:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id k15so18585613wrn.10
 for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2020 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CY6nb8G0qLvT+19gnqmRvOP7iYy+NDmqCyqksYDWTPk=;
 b=HNiF/Fd9SDJpX7Wj/YWGV4ikRVCq6feHBiWsMkelzLqsWmHNvkWpzoxMbnkn54Pf8C
 PEs06azMVjhoqcLkG6yUVuMKfVYo7vmcCCsEfuXJqreE7dVlqQMa6qUbaaTgZJt+8RQ6
 dfDcen7wKA1cjh5gFRbOoxx/94mkllUFRV2uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CY6nb8G0qLvT+19gnqmRvOP7iYy+NDmqCyqksYDWTPk=;
 b=O3U1EYpy0uAU2lCI2ynGrWui2YfasIstIO7kH1itk5pZXh45YBFHz6dBOkSEpGB8QI
 YhLaTFR1nkhvYJze4WC+0jPS/W4fJQ4d919TJV0oeKQayZWzyzLSAmeSWoQH6AyDm2jv
 WTzbstbK5YFYvRFp90YjvetYte7050ZD+3CLkc+tk3+I2zFb/+iScYqLfUYo3OTHJq+R
 ns4txmSbTt5eptvwEueU4MNffMKgCJHFbX44bmXvoSQ9CavR0wvLOsWAEWjiUInKiDn3
 X+DbKBa3sSvGw130ADUyXlCswBh7tGes/xYTGJEephrKWzTAGrYMKKC2DKYQ3+9SqhX2
 zesw==
X-Gm-Message-State: AOAM533xvL0ABYXKv2a51JSF4CI96JLjtVGTnirlxBXv7wtfazLPqmTs
 pCTAl3fWYmwLXAUCekIODKvVJ4dikbRCYkIz68Vj
X-Google-Smtp-Source: ABdhPJxPW96N1YmBldjxT3/hJJ8ZkPt7zs1MA7vd2que3V+r+lEN7W9dAdh1A8YCBXAgxYyGqngQURp6XgfRsLxTgNM=
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr7247874wrt.162.1600808667659; 
 Tue, 22 Sep 2020 14:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200918201140.3172284-1-atish.patra@wdc.com>
 <20200921164947.000048e1@Huawei.com>
 <CAOnJCU+mg13P609kut2cK9igmyepOvDc4kU-EzXsdjde7D_RpQ@mail.gmail.com>
 <20200922122912.00004bcb@Huawei.com>
In-Reply-To: <20200922122912.00004bcb@Huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Sep 2020 14:04:16 -0700
Message-ID: <CAOnJCULdRR1JOkZq6aHW3Xv6ZHo8edOAU-3gf1zxNqQdioek9w@mail.gmail.com>
Subject: Re: [RFT PATCH v3 0/5] Unify NUMA implementation between ARM64 &
 RISC-V
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_170430_074541_837D9992 
X-CRM114-Status: GOOD (  44.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 4:30 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 21 Sep 2020 17:08:32 -0700
> Atish Patra <atishp@atishpatra.org> wrote:
>
> > On Mon, Sep 21, 2020 at 8:51 AM Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:
> > >
> > > On Fri, 18 Sep 2020 13:11:35 -0700
> > > Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > > > This series attempts to move the ARM64 numa implementation to common
> > > > code so that RISC-V can leverage that as well instead of reimplementing
> > > > it again.
> > > >
> > > > RISC-V specific bits are based on initial work done by Greentime Hu [1] but
> > > > modified to reuse the common implementation to avoid duplication.
> > > >
> > > > [1] https://lkml.org/lkml/2020/1/10/233
> > > >
> > > > This series has been tested on qemu with numa enabled for both RISC-V & ARM64.
> > > > It would be great if somebody can test it on numa capable ARM64 hardware platforms.
> > > > This patch series doesn't modify the maintainers list for the common code (arch_numa)
> > > > as I am not sure if somebody from ARM64 community or Greg should take up the
> > > > maintainership. Ganapatrao was the original author of the arm64 version.
> > > > I would be happy to update that in the next revision once it is decided.
> > >
> >
> > Any thoughts on the maintenanership of this code ?
>
> Currently it is a trivial enough bit of code, I'd not be too worried
> as long as it doesn't fall through the cracks.  Changes that directory are going
> to need a GregKH Ack so unlikely anything will get missed.
>

Yeah. I am fine with the current structure. I just wanted to confirm that
everybody is on board with that.

> If you feel a specific entry is needed in MAINTAINERS go for it.
> Feel free to stick me down as a reviewer and I'll keep an eye on
> it from ARM64 side of things.
>

I will not add any specific entry in MAINTAINERS unless somebody
complains about it.


> Thanks,
>
> Jonathan
>
>
> >
> > > Was fairly sure this set was a noop on arm64 ACPI systems, but ran a quick
> > > sanity check on a 2 socket kunpeng920 and everything came up as normal
> > > (4 nodes, around 250G a node)
> > >
> > > Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > For patches 1 and 2.  Doesn't seem relevant to the rest :)
> > >
> >
> > Thanks a lot!
> >
> > > >
> > > > # numactl --hardware
> > > > available: 2 nodes (0-1)
> > > > node 0 cpus: 0 1 2 3
> > > > node 0 size: 486 MB
> > > > node 0 free: 470 MB
> > > > node 1 cpus: 4 5 6 7
> > > > node 1 size: 424 MB
> > > > node 1 free: 408 MB
> > > > node distances:
> > > > node   0   1
> > > >   0:  10  20
> > > >   1:  20  10
> > > > # numactl -show
> > > > policy: default
> > > > preferred node: current
> > > > physcpubind: 0 1 2 3 4 5 6 7
> > > > cpubind: 0 1
> > > > nodebind: 0 1
> > > > membind: 0 1
> > > >
> > > > For RISC-V, the following qemu series is a pre-requisite(already available in upstream)
> > > > to test the patches in Qemu and 2 socket OmniXtend FPGA.
> > > >
> > > > https://patchwork.kernel.org/project/qemu-devel/list/?series=303313
> > > >
> > > > The patches are also available at
> > > >
> > > > https://github.com/atishp04/linux/tree/5.10_numa_unified_v3
> > > >
> > > > There may be some minor conflicts with Mike's cleanup series [2] depending on the
> > > > order in which these two series are being accepted. I can rebase on top his series
> > > > if required.
> > > >
> > > > [2] https://lkml.org/lkml/2020/8/18/754
> > > >
> > > > Changes from v2->v3:
> > > > 1. Added Acked-by/Reviewed-by tags.
> > > > 2. Replaced asm/acpi.h with linux/acpi.h
> > > > 3. Defined arch_acpi_numa_init as static.
> > > >
> > > > Changes from v1->v2:
> > > > 1. Replaced ARM64 specific compile time protection with ACPI specific ones.
> > > > 2. Dropped common pcibus_to_node changes. Added required changes in RISC-V.
> > > > 3. Fixed few typos.
> > > >
> > > > Atish Patra (4):
> > > > numa: Move numa implementation to common code
> > > > arm64, numa: Change the numa init functions name to be generic
> > > > riscv: Separate memory init from paging init
> > > > riscv: Add numa support for riscv64 platform
> > > >
> > > > Greentime Hu (1):
> > > > riscv: Add support pte_protnone and pmd_protnone if
> > > > CONFIG_NUMA_BALANCING
> > > >
> > > > arch/arm64/Kconfig                            |  1 +
> > > > arch/arm64/include/asm/numa.h                 | 45 +----------------
> > > > arch/arm64/kernel/acpi_numa.c                 | 13 -----
> > > > arch/arm64/mm/Makefile                        |  1 -
> > > > arch/arm64/mm/init.c                          |  4 +-
> > > > arch/riscv/Kconfig                            | 31 +++++++++++-
> > > > arch/riscv/include/asm/mmzone.h               | 13 +++++
> > > > arch/riscv/include/asm/numa.h                 |  8 +++
> > > > arch/riscv/include/asm/pci.h                  | 14 ++++++
> > > > arch/riscv/include/asm/pgtable.h              | 21 ++++++++
> > > > arch/riscv/kernel/setup.c                     | 11 ++++-
> > > > arch/riscv/kernel/smpboot.c                   | 12 ++++-
> > > > arch/riscv/mm/init.c                          | 10 +++-
> > > > drivers/base/Kconfig                          |  6 +++
> > > > drivers/base/Makefile                         |  1 +
> > > > .../mm/numa.c => drivers/base/arch_numa.c     | 31 ++++++++++--
> > > > include/asm-generic/numa.h                    | 49 +++++++++++++++++++
> > > > 17 files changed, 201 insertions(+), 70 deletions(-)
> > > > create mode 100644 arch/riscv/include/asm/mmzone.h
> > > > create mode 100644 arch/riscv/include/asm/numa.h
> > > > rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
> > > > create mode 100644 include/asm-generic/numa.h
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
>
>


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
