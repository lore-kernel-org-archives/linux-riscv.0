Return-Path: <SRS0=9SVT=C3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DECC43464
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 19:18:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E79121D7F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2020 19:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AEq/xpWJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="VMLSvgaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E79121D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BXsXssp4kNKsocXm3tMaI2YnFPogPrvmTWnpLKGRAmE=; b=AEq/xpWJPxAHX2CUyvGnhctT9
	A3wUyVucxld4mi5p/vdQrDmPnQNYxAQWlddnaHAJbRho8TnaX8G2igbJgjcGbdcfTjoOsC0nQNlpy
	jFNLGFrcInktDPjB1+ecH666hNZnWJlNuFKmJTnAgf4qX5x8G3ZHEuSpfLOa12YC65U8nuzE2UV+j
	Iu1ibWHEdLVV5sILuFBMNMY95pH73fQpyczmrLPuBqOuce+UNxoo3kupIiu/hRQ5RDTuBzp6n6OQz
	d9oQaFN/D8uX4e8f3bfWTeCnIxAQ371IddVaTfwRBMChod6pcWfaiXtFq57EpS6Zfy1OxVxRYUN/E
	hChcXQFwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJLu9-000238-7t; Fri, 18 Sep 2020 19:18:45 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJLu6-00022P-0R
 for linux-riscv@lists.infradead.org; Fri, 18 Sep 2020 19:18:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id l9so6621715wme.3
 for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2020 12:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgLhkSl4Ln4PgVmRRlV8CSWEEibzB6LTYIniaCt7hTI=;
 b=VMLSvgaHAfiPg2fsN2PsLRp8GVoZuqSO27V2nQONT7+riIaAsuuHn+IDJR1AHKqwGO
 apv6JIQ5eDc4gk+YAKW3BireX5SpIPeuHhINh4DbHScfEI4LKeYKwejzXdRbzgU9TUAU
 oOzDuL6BQLF3Sysi/aeGimISg8m+vtrOukOwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgLhkSl4Ln4PgVmRRlV8CSWEEibzB6LTYIniaCt7hTI=;
 b=FuR9ZKjTzbJdktIoftrndfUEEVw4BRubf4zWx7HlpXrTnyAnXqm7NylLcADeAxV2NK
 0sED+YorTXzPFU2IR7x8pkuqIEvuI5/3lEU9hjiyxRNe9uBvC7Jp+LpSfKxnyySQsoxn
 0Ndz0l81Wy9z+c1TyYz0XKc6pWLdZqeLf63xX/KLi1tJ6pu26dSM5S40+covF5ROK/14
 v8FXooNsRY8Et2QyfCCozzZ2zpnou3KqdwsLSjmUlUfCFEXbk3HBkzURbZyVrAEQkl76
 8KTooSxgoSAcaF0oTd9AmMl+x0DMUar1GV4PU+CR6Tgs5HIrb5nvmjgQeVpTYKyBg07I
 Ix2w==
X-Gm-Message-State: AOAM531zUqt+kLjCtu/CLeXkAdSX19JWyw/lF7OGhzxfOnmZ9CwvHkUP
 xhiT8YRKnJVzlnFzHJePCriseaegMq7YS60N26Jo
X-Google-Smtp-Source: ABdhPJznH4owndgyTEbnLHdIMANVTk03bWNnDTTvYelqcq7gacsp8Tq1XD304rhxw4WWFZb4ib7m3g7lb62RKeVOhPk=
X-Received: by 2002:a05:600c:2cc1:: with SMTP id
 l1mr16649341wmc.78.1600456719035; 
 Fri, 18 Sep 2020 12:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200912013441.9730-1-atish.patra@wdc.com>
 <20200914090448.00001f7f@Huawei.com>
 <CAOnJCULGNha6aZaWZDn8zX3MZHn1H=uCrnNjpiqE11meRQz5eQ@mail.gmail.com>
 <20200918170514.00002e44@Huawei.com>
In-Reply-To: <20200918170514.00002e44@Huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 18 Sep 2020 12:18:27 -0700
Message-ID: <CAOnJCUJ=JSv2=H6J9+Q8svAhdvUM1DS5YC+Gjkhf66K6NvxH8g@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH v2 0/5] Unify NUMA implementation between ARM64 &
 RISC-V
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_151842_090366_8B3F7D8C 
X-CRM114-Status: GOOD (  43.64  )
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
 Jia He <justin.he@arm.com>, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2020 at 9:06 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Mon, 14 Sep 2020 12:33:59 -0700
> Atish Patra <atishp@atishpatra.org> wrote:
>
> > On Mon, Sep 14, 2020 at 1:07 AM Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:
> > >
> > > On Fri, 11 Sep 2020 18:34:36 -0700
> > > Atish Patra <atish.patra@wdc.com> wrote:
> > >
> > >
> > > Hi Atish,
> > >
> > > I'm not seeing a change log from v1.  Putting one in makes it easier
> > > for people who reviewed v1 to remember what to look for when looking
> > > at v2.
> > >
> >
> > My bad. I usually add a change log in the header patch but forgot this time.
> > I will send out a v3 soon and update those.
> >
> > Thanks for reviewing the patches.
>
> Hi Atish,
>
> I just noticed this was also not sent to <linux-arm-kernel@lists.infradead.org>
> which will rather cut down on the relevant audience!  Add that list to the
> cc for v3.
>
Ah yes. Thanks for noticing that. I am surprised that
get-maintainers.pl did not add linux-arm-kernel mailing list
for this series.

Anyways, I will include that in v3 which I was about to send :).

> Thanks,
>
> Jonathan
>
> > > Either here, or individual patches after the --- is fine.
> > >
> > > Thanks,
> > >
> > > Jonathan
> > >
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
> > > > https://github.com/atishp04/linux/tree/5.10_numa_unified_v2
> > > >
> > > > There may be some minor conflicts with Mike's cleanup series [2] depending on the
> > > > order in which these two series are being accepted. I can rebase on top his series
> > > > if required.
> > > >
> > > > [2] https://lkml.org/lkml/2020/8/18/754
> > > >
> > > > Atish Patra (4):
> > > > numa: Move numa implementation to common code
> > > > arm64, numa: Change the numa init function name to be generic
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
> > > > .../mm/numa.c => drivers/base/arch_numa.c     | 29 +++++++++--
> > > > include/asm-generic/numa.h                    | 49 +++++++++++++++++++
> > > > 17 files changed, 200 insertions(+), 69 deletions(-)
> > > > create mode 100644 arch/riscv/include/asm/mmzone.h
> > > > create mode 100644 arch/riscv/include/asm/numa.h
> > > > rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (95%)
> > > > create mode 100644 include/asm-generic/numa.h
> > > >
> > > > --
> > > > 2.24.0
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
